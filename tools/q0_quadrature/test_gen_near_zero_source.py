#!/usr/bin/env python3
"""Black-box regressions for the near-zero source generator.

Agent-ID: codex-aa04. Every generator invocation operates on temporary copies
of the compact packet, the three pinned metadata files, and generated outputs.
The full historical payload, Lean compiler, and network are never used.

Run in a repository checkout, or pass --repo /path/to/checkout.
"""
from pathlib import Path
import argparse
import json
import subprocess
import sys
import tempfile
import unittest

REPO_OVERRIDE = None
GENERATOR_REL = Path('tools/q0_quadrature/gen_near_zero_source.py')
PACKET_REL = Path('data/q0_quadrature/near-zero-source')
SOURCE_REL = Path('data/q0_quadrature/conditional_source')
OUTPUT_REL = Path('Grothe/UpperChaos')
PACKET_FILES = ('rows.bin', 'ledger.jsonl', 'provenance.json')
SOURCE_FILES = ('conditional_offsets.npy', 'conditional_cutoffs.npy', 'exception-selection.json')


def find_repo():
    if REPO_OVERRIDE is not None:
        root = Path(REPO_OVERRIDE).resolve()
        if not (root / GENERATOR_REL).is_file():
            raise RuntimeError('generator is missing under --repo: ' + str(root))
        return root
    candidates = list(Path(__file__).resolve().parents)
    candidates += [Path.cwd(), *Path.cwd().parents]
    for root in candidates:
        if (root / GENERATOR_REL).is_file():
            return root
    raise RuntimeError('cannot find repository; pass --repo /path/to/checkout')


def owned_output(name):
    return name in ('Q0NearZeroSourceCheck.lean', 'Q0NearZeroSourceData.lean') or \
        (name.startswith('Q0NearZeroSourceChunk') and name.endswith('.lean'))


class NearZeroGeneratorTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        root = find_repo()
        cls.fixtures = {GENERATOR_REL: (root / GENERATOR_REL).read_bytes()}
        for directory, names in ((PACKET_REL, PACKET_FILES), (SOURCE_REL, SOURCE_FILES)):
            for name in names:
                cls.fixtures[directory / name] = (root / directory / name).read_bytes()
        cls.expected_outputs = {
            p.name: p.read_bytes() for p in (root / OUTPUT_REL).glob('Q0NearZeroSource*.lean')
            if owned_output(p.name)
        }
        if 'Q0NearZeroSourceData.lean' not in cls.expected_outputs or \
                'Q0NearZeroSourceChunk00.lean' not in cls.expected_outputs:
            raise RuntimeError('installed generated output fixtures are missing')
        for name, raw in cls.expected_outputs.items():
            cls.fixtures[OUTPUT_REL / name] = raw

    def setUp(self):
        temporary = tempfile.TemporaryDirectory(prefix='codex-aa04-nearzero-test-')
        self.addCleanup(temporary.cleanup)
        self.repo = Path(temporary.name)
        for rel, raw in self.fixtures.items():
            path = self.repo / rel
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(raw)

    def run_generator(self, *args):
        return subprocess.run(
            [sys.executable, '-B', str(self.repo / GENERATOR_REL), *args],
            cwd=self.repo, capture_output=True, text=True, timeout=20, check=False,
        )

    def assert_rejected(self, expected_message):
        result = self.run_generator('--check')
        self.assertNotEqual(result.returncode, 0, result.stdout)
        self.assertIn(expected_message, result.stderr)

    def test_real_compact_packet_reproduces_installed_outputs(self):
        # Default path inference is exercised by the script's mirrored tools path.
        result = self.run_generator('--check')
        self.assertEqual(result.returncode, 0, result.stderr)
        report = json.loads(result.stdout)
        self.assertEqual(report['rows'], 1837)
        self.assertEqual(report['mode'], 'check')
        self.assertLessEqual(report['maximum_chunk_rows'], 30)
        self.assertEqual(report['modules'], len(self.expected_outputs))
        self.assertEqual(
            {name: (self.repo / OUTPUT_REL / name).read_bytes() for name in self.expected_outputs},
            self.expected_outputs,
        )
        # Also exercise explicit --repo/--out and fresh generation, then compare
        # with the installed outputs rather than recalculating their arithmetic.
        fresh = self.repo / 'fresh-output'
        result = self.run_generator('--repo', str(self.repo), '--out', str(fresh))
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual({p.name: p.read_bytes() for p in fresh.iterdir()}, self.expected_outputs)

    def test_modified_payload_is_rejected(self):
        path = self.repo / PACKET_REL / 'rows.bin'
        raw = bytearray(path.read_bytes())
        raw[0] ^= 1
        path.write_bytes(raw)
        self.assert_rejected('compact source payload hash mismatch')

    def test_reordered_or_modified_ledger_is_rejected(self):
        path = self.repo / PACKET_REL / 'ledger.jsonl'
        original = path.read_bytes().splitlines(keepends=True)
        reordered = original.copy()
        reordered[0], reordered[1] = reordered[1], reordered[0]
        modified = original.copy()
        entry = json.loads(modified[0])
        entry['index'] += 1
        modified[0] = (json.dumps(entry) + '\n').encode()
        for label, lines in [('reordered', reordered), ('modified', modified)]:
            with self.subTest(change=label):
                path.write_bytes(b''.join(lines))
                self.assert_rejected('selected ledger hash mismatch')

    def test_changed_offset_cutoff_or_schedule_is_rejected(self):
        for name in SOURCE_FILES:
            with self.subTest(input=name):
                path = self.repo / SOURCE_REL / name
                original = self.fixtures[SOURCE_REL / name]
                if name.endswith('.npy'):
                    modified = bytearray(original)
                    modified[-1] ^= 1
                    path.write_bytes(modified)
                else:
                    schedule = json.loads(original)
                    schedule['panels'][0][2] += 1
                    path.write_bytes((json.dumps(schedule) + '\n').encode())
                self.assert_rejected('pinned source input mismatch: ' + name)
                path.write_bytes(original)

    def test_consumed_provenance_mismatch_is_rejected(self):
        path = self.repo / PACKET_REL / 'provenance.json'
        original = self.fixtures[PACKET_REL / 'provenance.json']
        cases = [
            ('payload_sha256', 'compact source payload hash mismatch'),
            ('selected_ledger_sha256', 'selected ledger hash mismatch'),
            ('input_sha256', 'pinned source input mismatch: conditional_offsets.npy'),
        ]
        for field, message in cases:
            with self.subTest(field=field):
                provenance = json.loads(original)
                if field == 'input_sha256':
                    key = 'data/q0_quadrature/conditional_source/conditional_offsets.npy'
                    provenance[field][key] = '0' * 64
                else:
                    provenance[field] = '0' * 64
                path.write_bytes((json.dumps(provenance) + '\n').encode())
                self.assert_rejected(message)

    def test_stale_generated_chunk_is_rejected(self):
        stale = self.repo / OUTPUT_REL / 'Q0NearZeroSourceChunk999.lean'
        stale.write_text('-- Stale generated chunk fixture; Agent-ID: codex-aa04.\n')
        self.assert_rejected('stale/missing owned module names')

    def test_changed_generated_output_is_rejected(self):
        path = self.repo / OUTPUT_REL / 'Q0NearZeroSourceCheck.lean'
        path.write_bytes(path.read_bytes() + b'-- altered generated output\n')
        self.assert_rejected('generated file differs: ')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--repo', type=Path)
    args, remaining = parser.parse_known_args()
    REPO_OVERRIDE = args.repo
    unittest.main(argv=[sys.argv[0], *remaining])

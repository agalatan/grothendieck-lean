#!/usr/bin/env python3
"""Repair integration boundary tests; no actual certificate activation or Lean.

Agent-ID: codex-15b7. The existing row renderers test historical reproduction.
These fixtures substitute its successful output and exercise the real canonical
piece writer and real multiplier validator around that boundary.
"""
import copy
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

PROJECT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(PROJECT / 'tools'))
import nodecaps_repaired_render as render
from test_nodecaps_noncentre_repair import Fixture


class IntegrationFixture:
    def __init__(self, root):
        self.root = root; self.f = Fixture(); self.mapping = {}
        self.base = render.BASE
        for name, data in self.f.files.items(): self.write(name, data)
        for name in render.CURRENT_TOOLS | render.BASE_TOOLS:
            self.write(name, (PROJECT / name).read_bytes())
        # No historical claim about this fixture sentinel: baseline_outputs is
        # explicitly mocked, while original source/pin rejection is tested.
        archived_gen = b'# synthetic archived generator\n'
        self.write('data/baseline/gen_cap_prepared_rows.py', archived_gen)
        self.map('tools/gen_cap_prepared_rows.py', 'data/baseline/gen_cap_prepared_rows.py')
        for name in render.BASE_TOOLS - {'tools/gen_cap_prepared_rows.py'}: self.map(name)
        policy = {'format': 'caps-coverage-slicing/v1', 'rows': [12, 13, 14], 'threshold': 128, 'pieces_per_slice': 64}
        self.json(self.base + 'coverage-slicing.json', policy); self.map(self.base + 'coverage-slicing.json')
        self.write(self.base + 'row12-selection.json', render.encoded(self.f.selection))
        self.write(self.base + 'row12-pieces.json', render.encoded(self.f.baseline))
        with tempfile.TemporaryDirectory(prefix='repair-baseline-writer-') as directory:
            baseline_root = Path(directory)
            for name in ('tools/gen_cap_pieces.py', self.base+'coverage-slicing.json', self.base+'row12-selection.json'):
                target = baseline_root/name; target.parent.mkdir(parents=True, exist_ok=True)
                target.write_bytes((root/name).read_bytes())
            self.original = render.render_pieces(baseline_root, 12, render.encoded(self.f.baseline))
        self.original['Grothe/LowerAnalytic/CapRow12/Assembly.lean'] = b'assembly unchanged\n'
        self.original['Grothe/LowerAnalytic/CapRow12/Recipes.lean'] = b'anchors unchanged\n'
        seal12 = render.decode(self.f.files[self.f.binding['historical_seal']['path']])
        seal12['files_sha256'] = {name: render.sha(data) for name, data in self.original.items()}
        self.f.bind('historical_seal', self.f.binding['historical_seal']['path'], seal12)
        self.f.bind('historical_provenance', self.f.binding['historical_provenance']['path'], seal12)
        for name, data in self.f.files.items(): self.write(name, data)
        for row in (12, 13, 14):
            for suffix in ('', '-source', '-pieces', '-selection', '-anchors', '-generation'):
                name = self.base + f'row{row}{suffix}.json'
                value = {}
                if row == 12:
                    value = {'': self.f.plan, '-source': seal12, '-pieces': self.f.baseline,
                             '-selection': self.f.selection, '-anchors': {}, '-generation': {}}[suffix]
                elif suffix == '-source': value = {'inputs_sha256': {}, 'files_sha256': {'synthetic': 'f'*64}}
                self.json(name, value); self.map(name)
        self.map(self.base+'row12-pieces.json', self.f.binding['baseline_archive']['path'])
        self.json(self.base+'prepared-binding.json', {
            'writer_path': 'tools/gen_cap_pieces.py', 'writer_sha256': render.sha((root/'tools/gen_cap_pieces.py').read_bytes()),
            'source_manifests_sha256': {f'row{row}-source.json': render.sha((root/self.base/f'row{row}-source.json').read_bytes())
                                       for row in (12, 13)},
            'coverage_policy': self.base+'coverage-slicing.json',
            'coverage_policy_sha256': render.sha((root/self.base/'coverage-slicing.json').read_bytes())})
        self.map(self.base+'prepared-binding.json')
        retained = 'Grothe/LowerAnalytic/CapPieces/Node14x150.lean'
        self.write(retained, b'retained proof closure sentinel\n'); self.map(retained)
        binding14 = {'tools_sha256': {'tools/gen_cap_prepared_rows.py': render.sha(archived_gen)},
                     'inputs_sha256': {}, 'retained_sha256': {retained: render.sha((root/retained).read_bytes())},
                     'source_manifest_sha256': render.sha((root/self.base/'row14-source.json').read_bytes())}
        self.json(self.base+'row14-binding.json', binding14)
        self.json('data/baseline/row14-binding.json', binding14)
        self.map(self.base+'row14-binding.json', 'data/baseline/row14-binding.json')
        self.json('data/repair-row12-binding.json', self.f.binding)
        self.write(self.f.active, self.f.effective)
        with tempfile.TemporaryDirectory(prefix='repair-effective-writer-') as directory:
            baseline_root = Path(directory)
            for name in ('tools/gen_cap_pieces.py', self.base+'coverage-slicing.json', self.base+'row12-selection.json'):
                target = baseline_root/name; target.parent.mkdir(parents=True, exist_ok=True)
                target.write_bytes((root/name).read_bytes())
            self.effective_sources = render.render_pieces(baseline_root, 12, self.f.effective)
        self.changed = 'Grothe/LowerAnalytic/CapPieces/D12x186.lean'
        self.binding = {'format': render.FORMAT, 'baseline_files': self.mapping,
                        'current_tools_sha256': {name: render.sha((root/name).read_bytes()) for name in render.CURRENT_TOOLS},
                        'repair_bindings': {'12': self.reference('data/repair-row12-binding.json')},
                        'effective_sources_sha256': {self.changed: render.sha(self.effective_sources[self.changed])}}

    def write(self, name, data):
        target = self.root/name; target.parent.mkdir(parents=True, exist_ok=True); target.write_bytes(data)

    def json(self, name, value): self.write(name, render.encoded(value))

    def reference(self, name): return {'path': name, 'sha256': render.sha((self.root/name).read_bytes())}

    def map(self, canonical, actual=None): self.mapping[canonical] = self.reference(actual or canonical)

    def run(self):
        with patch.object(render, 'baseline_outputs', side_effect=lambda _: dict(self.original)):
            return render.render(self.root, self.binding)


class RepairedRenderTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory(prefix='noncentre-render-fixture-')
        self.addCleanup(self.directory.cleanup); self.root = Path(self.directory.name)
        self.f = IntegrationFixture(self.root)

    def test_only_bound_data_module_changes_and_root_is_read_only(self):
        before = {p.relative_to(self.root).as_posix(): p.read_bytes() for p in self.root.rglob('*') if p.is_file()}
        outputs, receipt = self.f.run()
        self.assertEqual(set(outputs), set(self.f.original))
        self.assertEqual([name for name in outputs if outputs[name] != self.f.original[name]], [self.f.changed])
        self.assertEqual(receipt['changed_data_modules'], [self.f.changed])
        self.assertTrue(receipt['historical_sources_reproduced'])
        self.assertFalse(receipt['native_verified'])
        self.assertFalse(receipt['repair_receipts']['12']['source_provenance_verified'])
        self.assertEqual(before, {p.relative_to(self.root).as_posix(): p.read_bytes()
                                  for p in self.root.rglob('*') if p.is_file()})

    def test_baseline_reproduction_failure_is_not_bypassed(self):
        with patch.object(render, 'baseline_outputs', side_effect=ValueError('historical reproduction failed')):
            with self.assertRaisesRegex(ValueError, 'historical reproduction failed'):
                render.render(self.root, self.f.binding)

    def test_old_tool_pins_cannot_be_rewritten_to_current_generator(self):
        mapping = self.f.binding['baseline_files']; mapping['tools/gen_cap_prepared_rows.py'] = self.f.reference('tools/gen_cap_prepared_rows.py')
        with self.assertRaisesRegex(ValueError, 'must be archived'): self.f.run()
        self.f.map('tools/gen_cap_prepared_rows.py', 'data/baseline/gen_cap_prepared_rows.py')
        self.f.write('data/baseline/gen_cap_prepared_rows.py', (PROJECT/'tools/gen_cap_prepared_rows.py').read_bytes())
        self.f.map('tools/gen_cap_prepared_rows.py', 'data/baseline/gen_cap_prepared_rows.py')
        with self.assertRaisesRegex(ValueError, 'Row14 pin differs'): self.f.run()

    def test_missing_baseline_dependency_and_stale_original_seal_rejected(self):
        del self.f.mapping[self.f.base+'row13.json']
        with self.assertRaisesRegex(ValueError, 'omits required'): self.f.run()
        self.f.map(self.f.base+'row13.json')
        self.f.json(self.f.base+'row13-source.json', {'inputs_sha256': {}, 'files_sha256': {}})
        self.f.map(self.f.base+'row13-source.json')
        with self.assertRaisesRegex(ValueError, 'historical source seal differs'): self.f.run()

    def test_unreviewed_baseline_path_substitution_rejected(self):
        name = self.f.base+'row13.json'; self.f.write('data/substitute.json', (self.root/name).read_bytes())
        self.f.map(name, 'data/substitute.json')
        with self.assertRaisesRegex(ValueError, 'unreviewed baseline path replacement'): self.f.run()

    def test_current_tool_pin_and_running_bytes_checked(self):
        self.f.binding['current_tools_sha256']['tools/nodecaps_repaired_render.py'] = 'f'*64
        with self.assertRaisesRegex(ValueError, 'source binding differs'): self.f.run()
        name = 'tools/nodecaps_repaired_render.py'; self.f.write(name, (self.root/name).read_bytes()+b'\n')
        self.f.binding['current_tools_sha256'][name] = render.sha((self.root/name).read_bytes())
        with self.assertRaisesRegex(ValueError, 'running tool differs'): self.f.run()

    def test_effective_source_extra_missing_and_wrong_hash_rejected(self):
        for updates in ({}, {self.f.changed: 'f'*64}, {**self.f.binding['effective_sources_sha256'], 'extra.lean': 'f'*64}):
            self.f.binding['effective_sources_sha256'] = updates
            with self.assertRaises(ValueError): self.f.run()

    def test_writer_cannot_change_coverage_range_assembly_or_unlisted_data(self):
        generated = dict(self.f.effective_sources)
        range_name = next(name for name in generated if '/R12x' in name)
        generated[range_name] += b'-- changed\n'
        with patch.object(render, 'render_pieces', return_value=generated):
            with self.assertRaisesRegex(ValueError, 'non-D or unlisted source'): self.f.run()
        generated['Grothe/LowerAnalytic/CapRow12/Assembly.lean'] = b'changed\n'
        with patch.object(render, 'render_pieces', return_value=generated):
            with self.assertRaisesRegex(ValueError, 'added or omitted'): self.f.run()

    def test_retained_closure_and_historical_binding_are_immutable(self):
        name = 'Grothe/LowerAnalytic/CapPieces/Node14x150.lean'
        self.f.write(name, b'changed retained proof\n')
        with self.assertRaisesRegex(ValueError, 'source binding differs'): self.f.run()
        self.f.map(name)
        with self.assertRaisesRegex(ValueError, 'Row14 pin differs'): self.f.run()

    def test_canonical_row14_binding_cannot_be_replaced_by_current_tool_binding(self):
        self.f.json(self.f.base+'row14-binding.json', {'format': 'rewritten'})
        with self.assertRaisesRegex(ValueError, 'Row14 binding was rewritten'): self.f.run()

    def test_current_effective_pieces_tamper_rejected(self):
        self.f.write(self.f.f.active, self.f.f.effective+b' ')
        with self.assertRaisesRegex(ValueError, 'effective pieces bytes differ'): self.f.run()

    def test_archived_unrepaired_row_cannot_hide_active_input_drift(self):
        name = self.f.base+'row13-pieces.json'; archive = 'data/baseline/row13-pieces.json'
        self.f.write(archive, (self.root/name).read_bytes()); self.f.map(name, archive)
        self.assertEqual(self.f.run()[1]['changed_data_modules'], [self.f.changed])
        self.f.write(name, b'{"unexpected": "active drift"}\n')
        with self.assertRaisesRegex(ValueError, 'unrepaired active pieces differ'): self.f.run()

    def test_symlink_input_rejected(self):
        name = 'data/baseline/source-seal.json'; actual = self.root/name
        saved = actual.read_bytes(); actual.unlink(); other = self.root/'data/copy.json'; other.write_bytes(saved)
        actual.symlink_to(other)
        with self.assertRaisesRegex(ValueError, 'symlink'): self.f.run()


if __name__ == '__main__': unittest.main()

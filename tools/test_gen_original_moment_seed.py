#!/usr/bin/env python3
"""Reproduction and corruption tests for the original-moment seed packet.

Agent-ID: codex-aa04. Refs #21.
Only compact committed inputs and temporary repository copies are used.
These Python checks do not invoke Lean, CI, the network or the historical row.
"""
from __future__ import annotations

import copy
import gzip
import importlib.util
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[1]
GENERATOR_REL = Path("tools/gen_original_moment_seed.py")
SPEC = importlib.util.spec_from_file_location("original_moment_seed_generator", ROOT / GENERATOR_REL)
GEN = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = GEN
SPEC.loader.exec_module(GEN)


class PacketSemanticsTests(unittest.TestCase):
    """Bypass only file hash pinning to attack the semantic checks themselves.

    The production CLI always verifies pins before calling these same validators.
    """

    @classmethod
    def setUpClass(cls):
        cls.raw = {name: (ROOT / GEN.INPUT_DIR / name).read_bytes() for name in GEN.INPUT_HASHES}
        cls.source_original = json.loads(cls.raw[GEN.SOURCE_NAME])
        cls.report_original = json.loads(cls.raw[GEN.REPORT_NAME])
        cls.records_original = [json.loads(line) for line in
                                gzip.decompress(cls.raw[GEN.TRANSCRIPT_NAME]).splitlines()]

    def setUp(self):
        self.source = copy.deepcopy(self.source_original)
        self.report = copy.deepcopy(self.report_original)
        self.records = copy.deepcopy(self.records_original)

    def validate(self):
        return GEN.validate_packet(self.source, self.report, self.records)

    def test_actual_packet_and_original_midpoint(self):
        packet = self.validate()
        self.assertEqual(len(packet.points), 514)
        self.assertEqual(packet.midpoint, int(self.source["A_midpoint"]))
        self.assertEqual(packet.scale, int(self.source["denominator"]))
        self.assertEqual(packet.x_numerator, packet.midpoint ** 2)
        self.assertEqual(packet.x_denominator, packet.scale ** 2)
        self.assertEqual(packet.upper_sum - packet.lower_sum + 2 * packet.radius, 73351)

    def test_source_report_hash_link(self):
        raw = dict(self.raw)
        self.report["source_report_sha256"] = "0" * 64
        raw[GEN.REPORT_NAME] = json.dumps(self.report).encode()
        with self.assertRaisesRegex(ValueError, "source-report hash link mismatch"):
            GEN.decode_packet(raw)

    def test_transcript_hash_link(self):
        raw = dict(self.raw)
        self.report["checkpoints_sha256"] = "0" * 64
        raw[GEN.REPORT_NAME] = json.dumps(self.report).encode()
        with self.assertRaisesRegex(ValueError, "transcript hash link mismatch"):
            GEN.decode_packet(raw)

    def test_changed_source_midpoint(self):
        self.source["A_midpoint"] = str(int(self.source["A_midpoint"]) + 1)
        with self.assertRaisesRegex(ValueError, "source midpoint square mismatch"):
            self.validate()

    def test_changed_source_scale(self):
        self.source["denominator"] = str(int(self.source["denominator"]) + 1)
        with self.assertRaisesRegex(ValueError, "source scale mismatch"):
            self.validate()

    def test_invalid_parameter_signs(self):
        for key, value in (("x_numerator", "-1"), ("x_denominator", "0")):
            with self.subTest(key=key):
                self.report = copy.deepcopy(self.report_original)
                self.report[key] = value
                with self.assertRaisesRegex(ValueError, "invalid parameter signs"):
                    self.validate()

    def test_wrong_terminal_index(self):
        self.report["last_term_index"] = 512
        with self.assertRaisesRegex(ValueError, "terminal index differs"):
            self.validate()

    def test_missing_checkpoint(self):
        self.records.pop()
        with self.assertRaisesRegex(ValueError, "checkpoint count differs"):
            self.validate()

    def test_duplicate_or_reordered_index(self):
        for index in (1, 127, 513):
            with self.subTest(index=index):
                self.records = copy.deepcopy(self.records_original)
                self.records[index][0] = index - 1
                with self.assertRaisesRegex(ValueError, "checkpoint index/order differs"):
                    self.validate()

    def test_initial_checkpoint(self):
        d = int(self.report["scale"])
        self.records[0][1:] = [str(d + 1), str(d + 2)]
        with self.assertRaisesRegex(ValueError, "initial checkpoint excludes one"):
            self.validate()

    def test_corrupt_internal_transitions(self):
        d = int(self.report["scale"])
        for index in (1, 127, 512):
            with self.subTest(index=index):
                self.records = copy.deepcopy(self.records_original)
                hi = int(self.records[index][2])
                self.records[index][1:] = [str(hi + d), str(hi + d + 1)]
                with self.assertRaisesRegex(ValueError, "transition guard failed"):
                    self.validate()

    def test_terminal_checkpoint(self):
        self.records[513][1:] = ["-2", "2"]
        with self.assertRaisesRegex(ValueError, "terminal checkpoint exceeds radius"):
            self.validate()

    def test_terminal_radius(self):
        self.report["next_term_radius_scaled"] = "2"
        with self.assertRaisesRegex(ValueError, "terminal radius differs from one"):
            self.validate()

    def test_retained_sums_and_width(self):
        for key, message in (("seed_lower_scaled", "retained lower sum mismatch"),
                             ("seed_upper_scaled", "retained upper sum mismatch"),
                             ("width_scaled", "enclosure width mismatch")):
            with self.subTest(key=key):
                self.report = copy.deepcopy(self.report_original)
                self.report[key] = str(int(self.report[key]) + 1)
                with self.assertRaisesRegex(ValueError, message):
                    self.validate()

    def test_noninteger_and_reversed_records(self):
        for value in (1.25, True, "01"):
            with self.subTest(value=value):
                self.records = copy.deepcopy(self.records_original)
                self.records[1][1] = value
                with self.assertRaisesRegex(ValueError, "canonical decimal string"):
                    self.validate()
        self.records = copy.deepcopy(self.records_original)
        self.records[1][1:] = ["1", "0"]
        with self.assertRaisesRegex(ValueError, "checkpoint endpoints reversed"):
            self.validate()

    def test_historical_error_claims_are_unused(self):
        baseline = self.validate()
        for key in ("actual_radius_decimal_ceiling", "sum_squared_error_numerator",
                    "finite_radius_decimal_ceiling", "source_payload_sha256",
                    "ratio_file", "leaf_file", "elapsed_seconds"):
            self.source[key] = "unconsumed provenance field"
        self.assertEqual(self.validate(), baseline)


class ReproductionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.expected = GEN.render_outputs(ROOT)
        cls.inputs = {GEN.INPUT_DIR / name: (ROOT / GEN.INPUT_DIR / name).read_bytes()
                      for name in GEN.INPUT_HASHES}
        cls.generator = (ROOT / GENERATOR_REL).read_bytes()

    def setUp(self):
        temporary = tempfile.TemporaryDirectory(prefix="codex-aa04-moment-seed-test-")
        self.addCleanup(temporary.cleanup)
        self.repo = Path(temporary.name) / "relocated-repo"
        self.repo.mkdir()
        self.foreign_cwd = Path(temporary.name) / "elsewhere"
        self.foreign_cwd.mkdir()
        for rel, raw in {GENERATOR_REL: self.generator, **self.inputs, **self.expected}.items():
            path = self.repo / rel
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(raw)

    def run_generator(self, *args, optimized=False):
        command = [sys.executable, "-B"]
        if optimized:
            command.append("-O")
        command += [str(self.repo / GENERATOR_REL), *args]
        return subprocess.run(command, cwd=self.foreign_cwd, text=True, capture_output=True,
                              timeout=20, check=False)

    def test_staged_files_match_fresh_render(self):
        for rel, expected in self.expected.items():
            self.assertEqual((ROOT / rel).read_bytes(), expected, rel)

    def test_relocated_check_is_read_only(self):
        before = {rel: (self.repo / rel).read_bytes() for rel in self.expected}
        result = self.run_generator("--check")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(json.loads(result.stdout)["mode"], "check")
        self.assertEqual({rel: (self.repo / rel).read_bytes() for rel in self.expected}, before)

    def test_fresh_generation_reproduces_all_bytes(self):
        for rel in self.expected:
            (self.repo / rel).unlink()
        result = self.run_generator("--repo", str(self.repo))
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual({rel: (self.repo / rel).read_bytes() for rel in self.expected}, self.expected)
        again = self.run_generator("--check")
        self.assertEqual(again.returncode, 0, again.stderr)

    def test_each_modified_input_hash_is_rejected(self):
        for rel, original in self.inputs.items():
            with self.subTest(file=str(rel)):
                path = self.repo / rel
                path.write_bytes(original + b"\n")
                result = self.run_generator("--check")
                self.assertNotEqual(result.returncode, 0)
                self.assertIn("pinned input hash mismatch: " + rel.name, result.stderr)
                path.write_bytes(original)

    def test_modified_output_is_rejected_without_rewriting(self):
        rel = GEN.LEAN_DIR / "OriginalMomentSeedCheck.lean"
        bad = self.expected[rel] + b"\n-- changed output\n"
        (self.repo / rel).write_bytes(bad)
        result = self.run_generator("--check")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("generated output differs: " + rel.as_posix(), result.stderr)
        self.assertEqual((self.repo / rel).read_bytes(), bad)

    def test_missing_output_is_not_created_by_check(self):
        rel = GEN.LEAN_DIR / "OriginalMomentSeedData.lean"
        (self.repo / rel).unlink()
        result = self.run_generator("--check")
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse((self.repo / rel).exists())

    def test_optimized_python_cannot_disable_validation(self):
        rel = GEN.INPUT_DIR / GEN.SOURCE_NAME
        (self.repo / rel).write_bytes(self.inputs[rel] + b"\n")
        result = self.run_generator("--check", optimized=True)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("pinned input hash mismatch", result.stderr)

    def test_generated_files_have_no_private_paths_or_proof_overrides(self):
        for rel, raw in self.expected.items():
            self.assertNotIn(b"/Users/", raw, rel)
            self.assertNotIn(b"/tmp/", raw, rel)
            if rel.suffix == ".lean":
                for forbidden in (b"set_option", b"native_decide", b"sorry"):
                    self.assertNotIn(forbidden, raw, rel)


if __name__ == "__main__":
    unittest.main()

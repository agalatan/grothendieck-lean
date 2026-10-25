#!/usr/bin/env python3
"""Isolated CLI regression tests for caps_stamp.py; no Lean build or real stamp writes."""
import contextlib
import hashlib
import importlib.util
import io
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch


SCRIPT = Path(__file__).with_name("caps_stamp.py")


class CapsStampTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        (self.root / "scripts").mkdir()
        (self.root / "docs").mkdir()
        self.script = self.root / "scripts/caps_stamp.py"
        shutil.copyfile(SCRIPT, self.script)
        self.stamp = self.root / "docs/CAPS_VERIFIED.txt"

        # Pin the existing roots and hash order independently of the checker.
        rows = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18]
        sources = {f"Grothe/LowerAnalytic/CapRow{k:02d}.lean": "import Grothe.Shared\n"
                   for k in rows}
        sources["Grothe/Shared.lean"] = "-- shared fixture dependency\n"
        ordered = sorted(sources)
        extra = {
            "Grothe/LowerAnalytic/CapNodes.lean": "-- cap combination fixture\n",
            "GrotheCaps.lean": "-- caps target fixture\n",
            "lean-toolchain": "leanprover/lean4:v4.34.1\n",
            "lake-manifest.json": "{}\n",
        }
        sources.update(extra)
        ordered.extend(extra)
        expected = hashlib.sha256()
        for name in ordered:
            path = self.root / name
            path.parent.mkdir(parents=True, exist_ok=True)
            data = sources[name].encode()
            path.write_bytes(data)
            expected.update(name.encode() + b"\0")
            expected.update(data)
        self.digest = expected.hexdigest()
        self.count = len(ordered)

    def run_cli(self, *args):
        return subprocess.run([sys.executable, str(self.script), *args],
                              capture_output=True, text=True, check=False)

    def write_stamp(self, digest=None):
        self.stamp.write_text(f"sha256 {digest or self.digest}\nfiles {self.count}\n"
                              "verified fixture verification\n")

    def test_current_stamp_passes_default_and_explicit_check(self):
        self.write_stamp()
        before = self.stamp.read_bytes()
        for args in [(), ("--check",)]:
            with self.subTest(args=args):
                result = self.run_cli(*args)
                self.assertEqual(result.returncode, 0, result.stderr)
                self.assertIn("sources unchanged", result.stdout)
                self.assertEqual(self.stamp.read_bytes(), before)

    def test_missing_stamp_fails_default_and_explicit_check(self):
        for args in [(), ("--check",)]:
            with self.subTest(args=args):
                result = self.run_cli(*args)
                self.assertEqual(result.returncode, 1, result.stderr)
                self.assertIn("no verification stamp", result.stdout)
                self.assertFalse(self.stamp.exists())

    def test_mismatched_stamp_fails(self):
        self.write_stamp("0" * 64)
        result = self.run_cli("--check")
        self.assertEqual(result.returncode, 1, result.stderr)
        self.assertIn("sources of GrotheCaps changed", result.stdout)

    def test_source_change_invalidates_stamp(self):
        self.write_stamp()
        (self.root / "Grothe/Shared.lean").write_text("-- changed dependency\n")
        result = self.run_cli("--check")
        self.assertEqual(result.returncode, 1, result.stderr)

    def test_digest_ignores_missing_or_mismatched_stamp(self):
        expected = f"sha256 {self.digest}\nfiles {self.count}\n"
        result = self.run_cli("--digest")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(result.stdout, expected)
        self.assertFalse(self.stamp.exists())
        self.write_stamp("0" * 64)
        before = self.stamp.read_bytes()
        result = self.run_cli("--digest")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(result.stdout, expected)
        self.assertEqual(self.stamp.read_bytes(), before)

    def test_write_records_note_and_passes_check(self):
        note = "fixture machine, date, successful build"
        result = self.run_cli("--write", note)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.stamp.read_text(),
                         f"sha256 {self.digest}\nfiles {self.count}\nverified {note}\n")
        self.assertEqual(self.run_cli("--check").returncode, 0)

    def test_incompatible_modes_fail_without_writing(self):
        for args in [("--check", "--digest"), ("--check", "--write", "note"),
                     ("--digest", "--write", "note")]:
            with self.subTest(args=args):
                result = self.run_cli(*args)
                self.assertEqual(result.returncode, 2, result.stderr)
                self.assertFalse(self.stamp.exists())

    def test_unknown_or_abbreviated_options_fail(self):
        for arg in ["--unknown", "--dig", "unexpected"]:
            with self.subTest(arg=arg):
                result = self.run_cli(arg)
                self.assertEqual(result.returncode, 2, result.stderr)
                self.assertFalse(self.stamp.exists())

    def test_write_requires_a_nonempty_note(self):
        for args in [("--write",), ("--write", ""), ("--write", "   ")]:
            with self.subTest(args=args):
                result = self.run_cli(*args)
                self.assertEqual(result.returncode, 2, result.stderr)
                self.assertFalse(self.stamp.exists())

    def test_import_has_no_cli_or_stamp_side_effects(self):
        spec = importlib.util.spec_from_file_location("caps_stamp_fixture", self.script)
        module = importlib.util.module_from_spec(spec)
        output = io.StringIO()
        with patch.object(sys, "argv", [str(self.script), "--unknown"]), \
                contextlib.redirect_stdout(output), contextlib.redirect_stderr(output):
            spec.loader.exec_module(module)
        self.assertEqual(output.getvalue(), "")
        self.assertFalse(self.stamp.exists())
        self.assertEqual(module.digest(), (self.digest, self.count))


if __name__ == "__main__":
    unittest.main()

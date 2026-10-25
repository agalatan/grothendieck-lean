#!/usr/bin/env python3
"""Isolated CLI regression tests for caps_stamp.py (cache-marker mode); no Lean build, no real marker writes."""
import hashlib
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest


SCRIPT = Path(__file__).with_name("caps_stamp.py")


class CapsStampTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        (self.root / "scripts").mkdir()
        self.script = self.root / "scripts/caps_stamp.py"
        shutil.copyfile(SCRIPT, self.script)
        self.mark = self.root / ".lake/build/caps-closure.sha"

        # Pin the roots and the hash order independently of the checker.
        rows = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18]
        sources = {f"Grothe/LowerAnalytic/CapRow{k:02d}.lean": "import Mathlib.Tactic Grothe.Shared\n-- body\n"
                   for k in rows}
        sources["Grothe/Shared.lean"] = "-- shared fixture dependency\nimport Mathlib.Data.Real.Basic\n"
        ordered = sorted(sources)
        extra = {
            "Grothe/LowerAnalytic/CapNodes.lean": "-- cap combination fixture\n",
            "GrotheCaps.lean": "-- caps target fixture\n",
            "lean-toolchain": "leanprover/lean4:v4.34.1\n",
            "lake-manifest.json": "{}\n",
            "lakefile.toml": "name = \"fixture\"\n",
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

    def test_digest_is_pinned(self):
        result = self.run_cli("--digest")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(result.stdout, f"sha256 {self.digest}\nfiles {self.count}\n")
        self.assertFalse(self.mark.exists())

    def test_missing_marker_fails_closed(self):
        for args in [(), ("--check-cache",)]:
            with self.subTest(args=args):
                result = self.run_cli(*args)
                self.assertEqual(result.returncode, 1)
                self.assertIn("no verified GrotheCaps build", result.stdout)

    def test_mark_then_check_passes(self):
        self.assertEqual(self.run_cli("--mark-cache").returncode, 0)
        self.assertEqual(self.mark.read_text().strip(), self.digest)
        for args in [(), ("--check-cache",)]:
            with self.subTest(args=args):
                self.assertEqual(self.run_cli(*args).returncode, 0)

    def test_source_change_invalidates_marker(self):
        self.run_cli("--mark-cache")
        (self.root / "Grothe/Shared.lean").write_text("-- changed\n")
        result = self.run_cli()
        self.assertEqual(result.returncode, 1)
        self.assertIn("current sources", result.stdout)

    def test_lakefile_change_invalidates_marker(self):
        self.run_cli("--mark-cache")
        (self.root / "lakefile.toml").write_text("name = \"changed\"\n")
        self.assertEqual(self.run_cli().returncode, 1)

    def test_mismatched_marker_fails(self):
        self.mark.parent.mkdir(parents=True)
        self.mark.write_text("0" * 64 + "\n")
        self.assertEqual(self.run_cli().returncode, 1)

    def test_missing_project_import_is_an_error(self):
        (self.root / "Grothe/Shared.lean").write_text("import Grothe.DoesNotExist\n")
        result = self.run_cli("--digest")
        self.assertEqual(result.returncode, 1)
        self.assertIn("does not exist", result.stdout)

    def test_unsupported_import_syntax_is_an_error(self):
        (self.root / "Grothe/Shared.lean").write_text("import Grothe.A, Grothe.B\n")
        result = self.run_cli("--digest")
        self.assertEqual(result.returncode, 1)
        self.assertIn("unsupported import syntax", result.stdout)

    def test_text_after_the_header_is_not_an_import(self):
        (self.root / "Grothe/Shared.lean").write_text("-- c\n/-! doc\nimport Grothe.Nope\n-/\n")
        self.assertEqual(self.run_cli("--digest").returncode, 0)

    def test_incompatible_and_unknown_options_fail(self):
        for args in [("--digest", "--mark-cache"), ("--check",), ("--dig",), ("--write", "x")]:
            with self.subTest(args=args):
                self.assertEqual(self.run_cli(*args).returncode, 2)
                self.assertFalse(self.mark.exists())


if __name__ == "__main__":
    unittest.main()

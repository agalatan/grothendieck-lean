#!/usr/bin/env python3
"""Unit and negative-control tests for tools/gen_strong_schur.py.

Agent-ID: gemini-60f6
"""
from __future__ import annotations

import contextlib
import io
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
import gen_strong_schur as gen


def make_fixture(tmp: Path) -> Path:
    for rel in (
        "Grothe/Lower/RowData08.lean",
        "Grothe/Lower/RowData09.lean",
        "Grothe/LowerAnalytic/StrongSchur.lean",
    ):
        dst = tmp / rel
        dst.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(ROOT / rel, dst)
    return tmp


class TestGenStrongSchur(unittest.TestCase):
    def test_stdout_matches_strong_schur_lines_59_to_63(self) -> None:
        buf = io.StringIO()
        with contextlib.redirect_stdout(buf):
            rc = gen.main(["--root", str(ROOT)])
        self.assertEqual(rc, 0)
        lean_lines = (
            ROOT / "Grothe/LowerAnalytic/StrongSchur.lean"
        ).read_text(encoding="utf-8").splitlines()
        self.assertEqual(lean_lines[57], gen.GENERATED_MARKER)
        self.assertEqual(buf.getvalue(), "\n".join(lean_lines[58:63]) + "\n")

    def test_check_mode_and_optimized_interpreter(self) -> None:
        proc = subprocess.run(
            [sys.executable, "-IBO", str(ROOT / "tools/gen_strong_schur.py"), "--check"],
            cwd="/tmp",
            capture_output=True,
            text=True,
            check=False,
        )
        self.assertEqual(proc.returncode, 0, msg=proc.stderr)
        self.assertIn("matches RowData08/RowData09 byte for byte", proc.stdout)

    def test_check_rejects_corrupted_coefficients_and_write_restores(self) -> None:
        with tempfile.TemporaryDirectory() as td:
            fx = make_fixture(Path(td))
            lean_path = fx / "Grothe/LowerAnalytic/StrongSchur.lean"
            original = lean_path.read_text(encoding="utf-8")

            for needle, replacement in (
                ("2019911/10000000000", "2019910/10000000000"),
                ("895839667529772635407934034815100903450690613452662823221441029958286628761344107879193669556307",
                 "895839667529772635407934034815100903450690613452662823221441029958286628761344107879193669556308"),
            ):
                self.assertIn(needle, original)
                lean_path.write_text(original.replace(needle, replacement, 1), encoding="utf-8")
                with self.assertRaises(ValueError):
                    gen.check_strong_schur(fx)

            self.assertEqual(gen.main(["--write", "--root", str(fx)]), 0)
            self.assertEqual(lean_path.read_text(encoding="utf-8"), original)
            gen.check_strong_schur(fx)

    def test_check_rejects_corrupted_row_binding_theorem_and_input_header(self) -> None:
        with tempfile.TemporaryDirectory() as td:
            fx = make_fixture(Path(td))
            lean_path = fx / "Grothe/LowerAnalytic/StrongSchur.lean"
            original = lean_path.read_text(encoding="utf-8")
            lean_path.write_text(
                original.replace("455477592604575/562949953421312", "455477592604576/562949953421312", 1),
                encoding="utf-8",
            )
            with self.assertRaises(ValueError):
                gen.check_strong_schur(fx)
            lean_path.write_text(original, encoding="utf-8")

            row08_path = fx / "Grothe/Lower/RowData08.lean"
            row08_orig = row08_path.read_text(encoding="utf-8")
            row08_path.write_text(
                row08_orig.replace("(455477592604575 : ℚ) / 562949953421312",
                                   "(1 : ℚ) / 1000", 1),
                encoding="utf-8",
            )
            with self.assertRaises(ValueError):
                gen.compute_strong_schur(fx)


if __name__ == "__main__":
    unittest.main()

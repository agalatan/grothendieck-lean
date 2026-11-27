#!/usr/bin/env python3
"""Unit tests for tools/gen_antistein_rows.py (file ownership, byte checks, and stale cleanup)."""
from __future__ import annotations

import contextlib
import hashlib
import io
import json
from pathlib import Path
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
import gen_antistein_rows as gen


def make_minimal_cert() -> dict:
    endpar = {
        "alpha": ["1/2", "1/2"],
        "sqrt_ub": "1",
        "eta": "1",
        "cuts": [["n", None, "1"]],
    }
    bank_node = {
        "sigma": "1/10",
        "grid_den": 10,
        "knots": [0, 5, 10],
        "phi1": [1, 1, 1],
        "phi2": [1, 1, 1],
        "xi2": [0, 0, 0],
        "xi1": [0, 0, 0],
        "xia": [0, 0, 0],
        "th2": [0, 0, 0],
        "th4": [0, 0, 0],
        "lam0": 1,
        "lam1": 0,
        "lam2": 0,
        "l3s": 0,
        "l3a": 0,
        "l3b": 0,
        "mu1": 1,
        "mu2": 1,
        "mu3": 1,
        "mu4": 1,
        "mu5": 1,
        "slope1": 0,
        "slope2": 0,
        "sigma_at": 1,
    }
    return {
        "smax": "6",
        "kappa": "2",
        "cap": "4/3",
        "nodes": [["0", "4/3"], ["1", "2"]],
        "bank": [bank_node],
        "quad_bank": [{"sigma": "1/20", "a0": "4/3", "a1": "0", "a2": "1"}],
        "cells": [
            {
                "s_lo": "0",
                "s_hi": "42",
                "nodes": [
                    {"kind": "zero"},
                    {"kind": "quad", "idx": 0, "sigma": "1/20", "val": "4/3"},
                    {
                        "kind": "anti",
                        "idx": 0,
                        "sigma": "1/10",
                        "val": "4/3",
                        "par_lo": None,
                        "par_hi": endpar,
                    },
                ],
            }
        ],
    }


def write_repo_fixture(root: Path) -> None:
    lower_dir = root / "Grothe" / "Lower"
    lower_dir.mkdir(parents=True, exist_ok=True)
    for idx in range(1, 15):
        row_txt = (
            f"def row{idx:02d} : Row :=\n"
            '  ⟨(4 : ℚ) / 5, (1 : ℚ) / 10, (3 : ℚ) / 5, (1 : ℚ), (2 : ℚ), (4 : ℚ) / 3, "0:4/3;1:2"⟩\n'
        )
        (lower_dir / f"RowData{idx:02d}.lean").write_bytes(row_txt.encode("utf-8"))

    data_dir = root / "data" / "antistein-rows"
    data_dir.mkdir(parents=True, exist_ok=True)
    cert = make_minimal_cert()
    env = {
        "cap08": "4/3",
        "cap09": "4/3",
        "env_B": "7/10",
        "worst": "69/100",
        "cells": [["0", "9/10", 8, 9, "1/2"]],
    }
    payloads = {
        "antistein_0.835.json": json.dumps(cert).encode("utf-8"),
        "antistein_0.845.json": json.dumps(cert).encode("utf-8"),
        "env_tight.json": json.dumps(env).encode("utf-8"),
    }
    sums_lines = []
    for fname, raw in sorted(payloads.items()):
        (data_dir / fname).write_bytes(raw)
        sums_lines.append(f"{hashlib.sha256(raw).hexdigest()}  {fname}\n")
    (data_dir / "SHA256SUMS").write_bytes("".join(sums_lines).encode("utf-8"))


def run_gen(*args: str) -> tuple[int, str, str]:
    out, err = io.StringIO(), io.StringIO()
    with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
        rc = gen.main(list(args))
    return rc, out.getvalue(), err.getvalue()


class GenAntiSteinRowsTests(unittest.TestCase):
    def test_regeneration_preserves_handwritten_lean_files(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            write_repo_fixture(root)
            anti_dir = root / "Grothe" / "LowerAnalytic" / "AntiRows"

            rc, _, _ = run_gen("--repo", str(root), "--check")
            self.assertEqual(rc, 1)

            rc, _, _ = run_gen("--repo", str(root))
            self.assertEqual(rc, 0)
            rc, _, _ = run_gen("--repo", str(root), "--check")
            self.assertEqual(rc, 0)

            # 1. Unrelated handwritten file in AntiRows/ (exact reproducer from review)
            work_file = anti_dir / "Row10Work.lean"
            work_bytes = b"-- handwritten work in progress\n"
            work_file.write_bytes(work_bytes)

            # 2. Handwritten file whose name resembles a bank shard, but lacks the generator marker
            handwritten_shard = anti_dir / "Row08Bank99.lean"
            shard_bytes = b"/-! Handwritten experiment, not generated -/\n"
            handwritten_shard.write_bytes(shard_bytes)

            rc, _, _ = run_gen("--repo", str(root), "--check")
            self.assertEqual(rc, 0)
            rc, _, _ = run_gen("--repo", str(root))
            self.assertEqual(rc, 0)
            self.assertTrue(work_file.is_file())
            self.assertEqual(work_file.read_bytes(), work_bytes)
            self.assertTrue(handwritten_shard.is_file())
            self.assertEqual(handwritten_shard.read_bytes(), shard_bytes)

            # 3. Genuine stale generator-owned shard IS flagged by --check and removed on regen,
            #    while both handwritten files remain untouched.
            stale_owned = anti_dir / "Row09Bank77.lean"
            stale_owned.write_bytes(
                f"/-! Stale shard {gen.GENERATED_MARKER} -/\n".encode("utf-8")
            )
            rc, out, _ = run_gen("--repo", str(root), "--check")
            self.assertEqual(rc, 1)
            self.assertIn("stale", out)
            self.assertIn("Row09Bank77.lean", out)

            rc, out, _ = run_gen("--repo", str(root))
            self.assertEqual(rc, 0)
            self.assertFalse(stale_owned.exists())
            self.assertEqual(work_file.read_bytes(), work_bytes)
            self.assertEqual(handwritten_shard.read_bytes(), shard_bytes)

            # 4. Handwritten replacement of a target path is never silently overwritten.
            row08_file = anti_dir / "Row08.lean"
            original_row08 = row08_file.read_bytes()
            manual_row08 = b"-- manual override without generator marker\n"
            row08_file.write_bytes(manual_row08)

            rc, _, _ = run_gen("--repo", str(root), "--check")
            self.assertEqual(rc, 1)
            rc, _, err = run_gen("--repo", str(root))
            self.assertEqual(rc, 1)
            self.assertIn("refusing to overwrite", err)
            self.assertEqual(row08_file.read_bytes(), manual_row08)

            row08_file.write_bytes(original_row08)
            rc, _, _ = run_gen("--repo", str(root), "--check")
            self.assertEqual(rc, 0)

    def test_crlf_byte_drift_is_detected_and_repaired(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            write_repo_fixture(root)
            rc, _, _ = run_gen("--repo", str(root))
            self.assertEqual(rc, 0)

            row08_file = root / "Grothe" / "LowerAnalytic" / "AntiRows" / "Row08.lean"
            lf_bytes = row08_file.read_bytes()
            self.assertNotIn(b"\r", lf_bytes)
            crlf_bytes = lf_bytes.replace(b"\n", b"\r\n")
            self.assertNotEqual(lf_bytes, crlf_bytes)
            row08_file.write_bytes(crlf_bytes)

            # --check must reject CRLF drift
            rc, out, _ = run_gen("--repo", str(root), "--check")
            self.assertEqual(rc, 1)
            self.assertIn("differs Grothe/LowerAnalytic/AntiRows/Row08.lean", out)

            # Regeneration must rewrite exact UTF-8 LF bytes
            rc, _, _ = run_gen("--repo", str(root))
            self.assertEqual(rc, 0)
            self.assertEqual(row08_file.read_bytes(), lf_bytes)

            rc, _, _ = run_gen("--repo", str(root), "--check")
            self.assertEqual(rc, 0)

    def test_committed_outputs_match_byte_for_byte(self):
        rc, _, _ = run_gen("--repo", str(ROOT), "--check")
        self.assertEqual(rc, 0)


if __name__ == "__main__":
    unittest.main()

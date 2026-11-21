#!/usr/bin/env python3
"""Regression tests for tools/replay_private_upper_budget.py. Agent-ID: gemini-1aa9."""

import hashlib
import importlib.util
import re
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

ROOT = Path(__file__).resolve().parent.parent
SPEC = importlib.util.spec_from_file_location(
    "replay_private_upper_budget", ROOT / "tools/replay_private_upper_budget.py"
)
REPLAY = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(REPLAY)

EXPECTED_MIXTURE_SHA256 = "d5d23eadad84e931b2cf12e2d27a26be682befaec4f9acb7751e675367139f36"


def write_committed_residues(directory: Path) -> list[tuple[int, int]]:
    residues: list[list[tuple[int, int]]] = []
    for g in range(8):
        text = (ROOT / f"Grothe/UpperReplacement/HeadWitnessFacts/Group{g:02d}.lean").read_text(
            encoding="utf-8"
        )
        ivs = [(int(lo), int(hi)) for lo, hi in re.findall(r"⟨(-?\d+),\s*(-?\d+)⟩", text)]
        assert len(ivs) == 8 * 126
        for k in range(8):
            r = 8 * g + k
            chunk = ivs[k * 126 : (k + 1) * 126]
            residues.append(chunk)
            (directory / f"head125-residue-{r}.txt").write_text(
                "\n".join(f"{lo},{hi}" for lo, hi in chunk), encoding="utf-8"
            )
    grades = [(sum(x for x, _ in col), sum(y for _, y in col)) for col in zip(*residues)]
    (directory / "head125-grades.txt").write_text(
        "\n".join(f"{lo},{hi}" for lo, hi in grades), encoding="utf-8"
    )
    return grades


class ReplayPrivateUpperBudgetTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.columns = REPLAY.load_verified_columns(ROOT)
        cls.tmp = tempfile.TemporaryDirectory()
        cls.head_dir = Path(cls.tmp.name)
        cls.grades = write_committed_residues(cls.head_dir)
        cls.mixture = REPLAY.compute_mixture_head(cls.columns, cls.grades, root=ROOT)
        cls.mixture_text = "\n".join(f"{lo},{hi}" for lo, hi in cls.mixture)

    @classmethod
    def tearDownClass(cls):
        cls.tmp.cleanup()

    def test_recomputed_mixture_matches_lean_head_compute_bit_for_bit_and_rejects_tampering(self):
        self.assertEqual(len(self.mixture), 251)
        self.assertEqual(
            hashlib.sha256(self.mixture_text.encode("utf-8")).hexdigest(),
            EXPECTED_MIXTURE_SHA256,
        )
        # Valid exact file passes check_saved_head end-to-end.
        (self.head_dir / "head125-mixture.txt").write_text(self.mixture_text, encoding="utf-8")
        REPLAY.check_saved_head(self.head_dir, self.columns, root=ROOT)

    def test_rejects_forged_mixture_file(self):
        forged = [f"{REPLAY.D},{REPLAY.D}"] + ["0,0"] * 250
        (self.head_dir / "head125-mixture.txt").write_text("\n".join(forged), encoding="utf-8")
        with self.assertRaisesRegex(ValueError, "does not match HeadCompute.mixtureHead"):
            REPLAY.check_saved_head(self.head_dir, self.columns, root=ROOT)

    def test_rejects_single_ulp_mixture_mismatch(self):
        perturbed = list(self.mixture)
        lo0, hi0 = perturbed[0]
        perturbed[0] = (lo0 + 1, hi0 + 1)
        (self.head_dir / "head125-mixture.txt").write_text(
            "\n".join(f"{lo},{hi}" for lo, hi in perturbed), encoding="utf-8"
        )
        with patch.object(REPLAY, "compute_mixture_head", return_value=self.mixture):
            with self.assertRaisesRegex(ValueError, "does not match HeadCompute.mixtureHead"):
                REPLAY.check_saved_head(self.head_dir, self.columns, root=ROOT)

    def test_rejects_mismatched_grades_file(self):
        with tempfile.TemporaryDirectory() as d:
            tmp_dir = Path(d)
            grades = write_committed_residues(tmp_dir)
            bad_grades = [(grades[0][0] + 1, grades[0][1] + 1)] + grades[1:]
            (tmp_dir / "head125-grades.txt").write_text(
                "\n".join(f"{lo},{hi}" for lo, hi in bad_grades), encoding="utf-8"
            )
            (tmp_dir / "head125-mixture.txt").write_text(self.mixture_text, encoding="utf-8")
            with self.assertRaisesRegex(ValueError, "do not equal the sums"):
                REPLAY.check_saved_head(tmp_dir, self.columns, root=ROOT)


if __name__ == "__main__":
    unittest.main()

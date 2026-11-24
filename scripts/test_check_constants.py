#!/usr/bin/env python3
"""Tests of scripts/check_constants.py on small synthetic repositories."""
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import check_constants as cc  # noqa: E402

MAIN = """-- The main result: 1.40191 < K ≤ 1.40457588.
theorem main_bounds :
    (140191 / 100000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 140457588 / 100000000 := by
"""
STATEMENT = "def LowerTarget : Prop := LowerAbove (140191 / 100000)  -- above 1.40191\n"
UPPER = "theorem bound : IsBound (140457588 / 100000000) := sorry  -- 1.40457588\n"
GOOD = "We prove 1.40191 < K ≤ 1.40457588, that is `140191 / 100000` and `140457588 / 100000000`.\n"


def make(root: Path, main=MAIN, statement=STATEMENT, docs=None):
    files = {rel: GOOD for rel in cc.QUOTING}
    files.update({"Grothe/MainResult.lean": main, "Grothe/Statement.lean": statement, "Grothe/UpperResult.lean": UPPER})
    files.update(docs or {})
    for rel, text in files.items():
        path = root / rel
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8")


class CheckConstants(unittest.TestCase):
    def run_check(self, **kwargs):
        with tempfile.TemporaryDirectory() as tmp:
            make(Path(tmp), **kwargs)
            return cc.check(Path(tmp))

    def test_decimal(self):
        self.assertEqual(cc.decimal(140191, 100000), "1.40191")
        self.assertEqual(cc.decimal(140457588, 100000000), "1.40457588")
        self.assertEqual(cc.decimal(14046, 10000), "1.4046")
        self.assertEqual(cc.decimal(3, 1), "3")
        with self.assertRaises(ValueError):
            cc.decimal(1, 3)

    def test_good(self):
        (lo, up), problems = self.run_check()
        self.assertEqual((lo, up), ("1.40191", "1.40457588"))
        self.assertEqual(problems, [])

    def test_missing_bound(self):
        _, problems = self.run_check(docs={"docs/LEAN_DETAILS.md": "We prove 1.40191 < K.\n"})
        self.assertEqual(problems, ["docs/LEAN_DETAILS.md: does not state the upper bound 1.40457588"])

    def test_longer_decimal_is_not_the_bound(self):
        _, problems = self.run_check(docs={"docs/overview.tex": "1.401915 and 1.40457588\n"})
        self.assertEqual(problems, ["docs/overview.tex: does not state the lower bound 1.40191"])

    def test_retired_in_strict(self):
        _, problems = self.run_check(docs={"README.md": GOOD + "Formerly 1.4018 < K.\n"})
        self.assertEqual(problems, ["README.md:2: mentions the older bound 1.4018"])

    def test_retired_elsewhere_is_allowed(self):
        _, problems = self.run_check(docs={"research/README.md": GOOD + "The design target was 1.4018.\n"})
        self.assertEqual(problems, [])

    def test_constants_page_needs_rationals(self):
        _, problems = self.run_check(docs={"docs/CONSTANTS.md": "1.40191 < K ≤ 1.40457588\n"})
        self.assertEqual(len(problems), 2)
        self.assertTrue(all(p.startswith("docs/CONSTANTS.md: does not state the exact") for p in problems))

    def test_stale_rational_in_lean_docstring(self):
        stale = STATEMENT + "-- The upper bound is `IsBound (140457999 / 100000000)`.\n"
        _, problems = self.run_check(statement=stale)
        self.assertEqual(
            problems,
            [
                "Grothe/Statement.lean:2: IsBound (140457999 / 100000000) is not the upper bound of main_bounds",
                "Grothe/Statement.lean:2: quotes 140457999 / 100000000, which is not a current bound",
            ],
        )

    def test_lower_rational_claimed_as_upper(self):
        wrong = STATEMENT + "-- The upper bound is stated as `IsBound (140191 / 100000)`.\n"
        _, problems = self.run_check(statement=wrong)
        self.assertEqual(
            problems, ["Grothe/Statement.lean:2: IsBound (140191 / 100000) is not the upper bound of main_bounds"]
        )

    def test_upper_rational_claimed_as_lower(self):
        wrong = STATEMENT + "-- `LowerAbove (140457588 / 100000000)` holds.\n"
        _, problems = self.run_check(statement=wrong)
        self.assertEqual(
            problems,
            ["Grothe/Statement.lean:2: LowerAbove (140457588 / 100000000) is not the lower bound of main_bounds"],
        )

    def test_stale_fraction_wrapped_after_the_slash(self):
        wrapped = STATEMENT + "-- The upper bound is `IsBound (140457999 /\n-- 100000000)`.\n"
        _, problems = self.run_check(statement=wrapped)
        self.assertEqual(
            problems,
            [
                "Grothe/Statement.lean:2: IsBound (140457999 / 100000000) is not the upper bound of main_bounds",
                "Grothe/Statement.lean:2: quotes 140457999 / 100000000, which is not a current bound",
            ],
        )

    def test_stale_bare_fraction_wrapped(self):
        wrapped = STATEMENT + "-- formerly 140457999 /\n  100000000 here.\n"
        _, problems = self.run_check(statement=wrapped)
        self.assertEqual(
            problems, ["Grothe/Statement.lean:2: quotes 140457999 / 100000000, which is not a current bound"]
        )

    def test_refined_upper_rounding_and_scope(self):
        main = MAIN + MAIN.replace("main_bounds", "main_bounds_refined").replace("140457588", "140455641")
        exact = UPPER + ("theorem constant_le_exact : Statement.complexGrothendieckConstant ≤ "
                         "(10 : ℝ) ^ 27 / 711968557929438692542239077 := by\\n")
        docs = {name: GOOD + "The refined upper bound is 1.40455641.\\n"
                for name in ("docs/CONSTANTS.md", "docs/LEAN_DETAILS.md", "docs/overview.tex")}
        docs["Grothe/UpperResult.lean"] = exact
        _, problems = self.run_check(main=main, docs=docs)
        self.assertEqual(problems, [])
        _, problems = self.run_check(main=main.replace("140455641", "140455640"), docs=docs)
        self.assertTrue(any("round constant_le_exact upward" in error for error in problems))
        _, problems = self.run_check(main=main + "-- 140455641 / 100000000\\n", docs=docs)
        self.assertTrue(any("not a current bound" in error for error in problems))
        _, problems = self.run_check(main=main, docs={**docs, "Grothe/UpperResult.lean": UPPER})
        self.assertTrue(any("needs both" in error for error in problems))

    def test_targets_disagree(self):
        with self.assertRaises(ValueError):
            self.run_check(statement="def LowerTarget : Prop := LowerAbove (14018 / 10000)\n")

    def test_unrecognised_statement(self):
        with self.assertRaises(ValueError):
            self.run_check(main="theorem main_bounds : True := trivial\n")


if __name__ == "__main__":
    unittest.main()

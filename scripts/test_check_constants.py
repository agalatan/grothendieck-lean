#!/usr/bin/env python3
"""Tests of scripts/check_constants.py on small synthetic repositories."""
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import check_constants as cc  # noqa: E402

# A synthetic repository: exact upper value 10^6 / 711969 = 1.40455553…, rounded up to five decimals, and exact
# lower endpoint 14019101 / 10^7, rounded strictly downward to five decimals.
MAIN = """-- The main result: 1.40191 < K ≤ 1.40456.
theorem main_bounds :
    (140191 / 100000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 140456 / 100000 := by
  simpa using (Rat.cast_lt (K := ℝ)).mpr Grothe.Lower.SharpEnvelope.rounded_lt
"""
STATEMENT = "def LowerAbove (c : ℝ) : Prop := ∀ K, IsBound K → c < K\n"
UPPER = """-- `K ≤ 1.40456`, the exact value 1.404555… rounded up.
theorem bound : Statement.IsBound ((10 : ℝ) ^ 6 / 711969) :=
theorem constant_le : Statement.complexGrothendieckConstant ≤ 140456 / 100000 := by
"""
ENDPOINT_FILE = "Grothe/Lower/Cert/SharpEnvelope.lean"
ENDPOINT = "theorem endpoint_eq : endpoint = 14019101 / 10000000 := by decide\n"
GOOD = ("We prove 1.40191 < K ≤ 1.40456, that is `140191 / 100000` and `140456 / 100000`; the exact values are "
        "`14019101 / 10000000` and $10^{6}/711969$.\n")


def make(root: Path, main=MAIN, statement=STATEMENT, upper=UPPER, endpoint=ENDPOINT, docs=None):
    files = {rel: GOOD for rel in cc.QUOTING}
    files.update({"Grothe/MainResult.lean": main, "Grothe/Statement.lean": statement,
                  "Grothe/UpperResult.lean": upper, ENDPOINT_FILE: endpoint})
    files.update(docs or {})
    for rel, text in files.items():
        if text is None:
            continue
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
        self.assertEqual(cc.decimal(1404556407, 1000000000), "1.404556407")
        self.assertEqual(cc.decimal(14046, 10000), "1.4046")
        self.assertEqual(cc.decimal(3, 1), "3")
        with self.assertRaises(ValueError):
            cc.decimal(1, 3)

    def test_truncated(self):
        value = cc.Fraction(10**27, 711968558203721328194311213)
        self.assertEqual(cc.truncated(value, 13), "1.4045564069893")
        self.assertEqual(cc.truncated(cc.Fraction(1, 8), 2), "0.12")

    def test_good(self):
        (lo, up), problems = self.run_check()
        self.assertEqual((lo, up), ("1.40191", "1.40456"))
        self.assertEqual(problems, [])

    def test_missing_bound(self):
        _, problems = self.run_check(docs={"docs/LEAN_DETAILS.md": "We prove 1.40191 < K.\n"})
        self.assertEqual(problems, ["docs/LEAN_DETAILS.md: does not state the upper bound 1.40456"])

    def test_longer_decimal_is_not_the_bound(self):
        _, problems = self.run_check(docs={"docs/overview.tex": "1.401915 and 1.40456\n"})
        self.assertEqual(problems, ["docs/overview.tex: does not state the lower bound 1.40191"])

    def test_retired_in_strict(self):
        _, problems = self.run_check(docs={"README.md": GOOD + "Formerly 1.4018 < K ≤ 1.40455741.\n"})
        self.assertEqual(problems, ["README.md:2: mentions the older bound 1.4018",
                                    "README.md:2: mentions the older bound 1.40455741"])

    def test_retired_list_covers_the_earlier_bounds(self):
        for old in ("1.4018", "1.401700322371", "1.40191", "1.4019109461", "1.40191478", "1.40457588", "1.40455742", "1.40455741",
                    "1.40455641"):
            self.assertIn(old, cc.RETIRED)
        # a current bound is never reported as retired, and a longer decimal is not an older one
        _, problems = self.run_check(docs={"README.md": GOOD + "The exact endpoint is 1.4019101234.\n"})
        self.assertEqual(problems, [])

    def test_retired_elsewhere_is_allowed(self):
        _, problems = self.run_check(docs={"research/README.md": GOOD + "The design target was 1.4018.\n"})
        self.assertEqual(problems, [])

    def test_constants_page_needs_rationals(self):
        _, problems = self.run_check(docs={"docs/CONSTANTS.md": "1.40191 < K ≤ 1.40456\n"})
        self.assertEqual(len(problems), 4)
        self.assertTrue(all(p.startswith("docs/CONSTANTS.md: does not state the exact") for p in problems))

    def test_constants_page_needs_the_exact_values_digit_for_digit(self):
        _, problems = self.run_check(docs={"docs/CONSTANTS.md": GOOD.replace("711969", "7119691")})
        self.assertEqual(problems, ["docs/CONSTANTS.md: does not state the exact upper bound of Grothe.UpperSix.bound"])
        _, problems = self.run_check(docs={"docs/CONSTANTS.md": GOOD.replace("14019101 /", "14019102 /")})
        self.assertEqual(
            problems, ["docs/CONSTANTS.md: does not state the exact lower endpoint (endpoint_eq)"]
        )
        frac = GOOD.replace("$10^{6}/711969$", r"$\frac{10^{6}}{711969}$")
        _, problems = self.run_check(docs={"docs/CONSTANTS.md": frac})
        self.assertEqual(problems, [])

    # --- the Lean statement files: stale bounds in docstrings, roles, wrapped fractions -------------------------

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

    def test_stale_decimal_in_lean_docstring(self):
        stale = MAIN + "-- formerly `1.40455741`, from the older certificate.\n"
        _, problems = self.run_check(main=stale)
        self.assertEqual(len(problems), 1)
        self.assertTrue(problems[0].startswith("Grothe/MainResult.lean:6: quotes 1.40455741, which is neither"))

    def test_truncated_exact_values_are_allowed_only_with_an_ellipsis(self):
        _, problems = self.run_check(upper=UPPER + "-- exactly 1.40455553… and 1.4019101.\n")
        self.assertEqual(len(problems), 1)
        self.assertTrue(problems[0].startswith("Grothe/UpperResult.lean:4: quotes 1.4019101, which is neither"))
        _, problems = self.run_check(upper=UPPER + "-- exactly 1.40455554… here.\n")
        self.assertEqual(len(problems), 1)

    def test_lower_rational_claimed_as_upper(self):
        wrong = STATEMENT + "-- The upper bound is stated as `IsBound (140191 / 100000)`.\n"
        _, problems = self.run_check(statement=wrong)
        self.assertEqual(
            problems, ["Grothe/Statement.lean:2: IsBound (140191 / 100000) is not the upper bound of main_bounds"]
        )

    def test_upper_rational_claimed_as_lower(self):
        wrong = STATEMENT + "-- `LowerAbove (140456 / 100000)` holds.\n"
        _, problems = self.run_check(statement=wrong)
        self.assertEqual(
            problems, ["Grothe/Statement.lean:2: LowerAbove (140456 / 100000) is not the lower bound of main_bounds"]
        )

    def test_exact_form_of_the_upper_bound(self):
        for good in ("`IsBound ((10 : ℝ) ^ 6 / 711969)`", "`IsBound (10 ^ 6 / 711969)`", "`IsBound (10^6 /\n-- 711969)`",
                     "`IsBound (140456 / 100000)`", "`LowerAbove (140191 / 100000)`", "`IsBound K`, `IsBound (K : ℝ)`"):
            with self.subTest(good=good):
                _, problems = self.run_check(statement=STATEMENT + f"-- {good}\n")
                self.assertEqual(problems, [])
        _, problems = self.run_check(statement=STATEMENT + "-- `IsBound ((10 : ℝ) ^ 6 / 711968)`\n")
        self.assertEqual(
            problems,
            ["Grothe/Statement.lean:2: IsBound (10 ^ 6 / 711968) is not the exact upper bound of Grothe.UpperSix.bound"],
        )
        _, problems = self.run_check(statement=STATEMENT + "-- `LowerAbove ((10 : ℝ) ^ 6 / 711969)`\n")
        self.assertEqual(problems, ["Grothe/Statement.lean:2: the numeric argument of LowerAbove was not recognised"])
        _, problems = self.run_check(statement=STATEMENT + "-- `IsBound (1.40456)`\n")
        self.assertEqual(problems, ["Grothe/Statement.lean:2: the numeric argument of IsBound was not recognised"])

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

    # --- the two bounds are roundings of the exact values ------------------------------------------------------

    def test_upper_bound_must_round_the_exact_value_up(self):
        for wrong in ("140455", "140457"):
            with self.subTest(wrong=wrong):
                swap = {"140456 / 100000": f"{wrong} / 100000", "1.40456": cc.decimal(int(wrong), 100000)}
                main, upper = MAIN, UPPER
                docs = {rel: GOOD for rel in cc.QUOTING if not rel.endswith(".lean")}
                for old, new in swap.items():
                    main, upper = main.replace(old, new), upper.replace(old, new)
                    docs = {rel: text.replace(old, new) for rel, text in docs.items()}
                _, problems = self.run_check(main=main, upper=upper, docs=docs)
                self.assertEqual(len(problems), 1)
                self.assertIn("is not the exact bound 10^6 / 711969 rounded up", problems[0])

    def test_constant_le_must_agree_with_main_bounds(self):
        _, problems = self.run_check(upper=UPPER.replace("≤ 140456 / 100000", "≤ 14046 / 10000"))
        self.assertEqual(
            problems,
            [
                "Grothe/UpperResult.lean: constant_le states 14046 / 10000, main_bounds 140456 / 100000",
                "Grothe/UpperResult.lean:3: quotes 14046 / 10000, which is not a current bound",
            ],
        )
        _, problems = self.run_check(upper=UPPER.replace("theorem constant_le", "theorem constant_le'"))
        self.assertEqual(len(problems), 1)
        self.assertTrue(problems[0].startswith("Grothe/UpperResult.lean: the statement of constant_le was not recognised"))

    def test_exact_upper_bound_is_required(self):
        _, problems = self.run_check(upper=UPPER.replace("theorem bound :", "theorem bound' :"))
        self.assertTrue(problems[0].startswith("Grothe/UpperResult.lean: the exact upper bound `theorem bound :"))
        # without it, nothing in the file can be accepted as the exact value
        self.assertEqual(len(problems), 3)

    def test_lower_bound_must_round_the_endpoint_strictly_downward(self):
        for endpoint in ("140191 / 100000", "1401909 / 1000000", "1401921 / 1000000"):
            with self.subTest(endpoint=endpoint):
                docs = {"docs/CONSTANTS.md": GOOD.replace("14019101 / 10000000", endpoint)}
                _, problems = self.run_check(endpoint=ENDPOINT.replace("14019101 / 10000000", endpoint), docs=docs)
                self.assertEqual(len(problems), 1)
                self.assertIn("rounded strictly downward", problems[0])
        # the largest admissible endpoint: exactly the next grid point
        docs = {"docs/CONSTANTS.md": GOOD.replace("14019101 / 10000000", "140192 / 100000")}
        _, problems = self.run_check(endpoint=ENDPOINT.replace("14019101 / 10000000", "140192 / 100000"), docs=docs)
        self.assertEqual(problems, [])

    def test_exact_lower_endpoint_is_required(self):
        _, problems = self.run_check(endpoint=None)
        self.assertEqual(len(problems), 1)
        self.assertTrue(problems[0].startswith("Grothe/Lower/Cert/SharpEnvelope.lean: the exact lower endpoint"))
        _, problems = self.run_check(main=MAIN.replace("SharpEnvelope.rounded_lt", "SharpEnvelope.other"))
        self.assertEqual(len(problems), 1)
        self.assertIn("must use exactly one rounding lemma", problems[0])

    def test_the_lower_certificate_is_read_from_the_proof_of_main_bounds(self):
        # another certificate: its own module, its own endpoint; nothing in the script names it
        main = MAIN.replace("140191 / 100000", "140192 / 100000").replace("1.40191", "1.40192")
        main = main.replace("SharpEnvelope.rounded_lt", "SharedGate.rounded_lt")
        other = "theorem endpoint_eq : endpoint = 14019201 / 10000000 := by decide\n"
        swap = lambda text: (text.replace("140191 / 100000", "140192 / 100000").replace("1.40191", "1.40192")  # noqa: E731
                             .replace("14019101 / 10000000", "14019201 / 10000000"))
        docs = {rel: swap(GOOD) for rel in cc.QUOTING if not rel.endswith(".lean")}
        docs["Grothe/Lower/Cert/SharedGate.lean"] = other
        _, problems = self.run_check(main=main, docs=docs)
        self.assertEqual(problems, [])
        # the endpoint of the certificate that the proof no longer uses is not accepted
        _, problems = self.run_check(main=main, docs={**docs, "Grothe/Lower/Cert/SharedGate.lean": ENDPOINT})
        self.assertTrue(any("rounded strictly downward" in p for p in problems))

    # --- each statement is read whole, up to its `:=`; the rounding lemma only in the proof of main_bounds -----

    def test_main_bounds_with_a_longer_right_hand_side_is_refused(self):
        for tail in (" + 1", " * 2", " / 2", " ∨ True", " ^ 2"):
            with self.subTest(tail=tail):
                with self.assertRaises(ValueError):
                    self.run_check(main=MAIN.replace("≤ 140456 / 100000 :=", f"≤ 140456 / 100000{tail} :="))
        with self.assertRaises(ValueError):
            self.run_check(main=MAIN.replace("(140191 / 100000 : ℝ) <", "(140191 / 100000 : ℝ) - 1 <"))
        with self.assertRaises(ValueError):
            self.run_check(main=MAIN.replace("theorem main_bounds :", "theorem main_bounds : True ∨"))
        _, problems = self.run_check(main=MAIN.replace("≤ 140456 / 100000 :=", "≤ (140456 / 100000 : ℝ) :="))
        self.assertEqual(problems, [])

    def test_constant_le_with_a_longer_right_hand_side_is_refused(self):
        for tail in (" + 1", " * 2", " ∨ True"):
            with self.subTest(tail=tail):
                weak = UPPER.replace("≤ 140456 / 100000 := by", f"≤ 140456 / 100000{tail} := by")
                _, problems = self.run_check(upper=weak)
                self.assertEqual(len(problems), 1)
                self.assertIn("the statement of constant_le was not recognised", problems[0])

    def test_exact_bound_with_a_longer_argument_is_refused(self):
        for weak in ("Statement.IsBound ((10 : ℝ) ^ 6 / 711969 + 1) :=", "Statement.IsBound ((10 : ℝ) ^ 6 / 711969) ∨ True :="):
            with self.subTest(weak=weak):
                _, problems = self.run_check(upper=UPPER.replace("Statement.IsBound ((10 : ℝ) ^ 6 / 711969) :=", weak))
                self.assertTrue(problems[0].startswith("Grothe/UpperResult.lean: the exact upper bound `theorem bound :"))

    def test_statements_in_comments_are_not_read(self):
        hidden = "/- theorem constant_le : Statement.complexGrothendieckConstant ≤ 140456 / 100000 := by -/\n"
        weak = UPPER.replace("≤ 140456 / 100000 := by", "≤ 140456 / 100000 + 1 := by") + hidden
        _, problems = self.run_check(upper=weak)
        self.assertTrue(any("the statement of constant_le was not recognised" in p for p in problems))
        self.assertEqual(cc.strip_comments("a -- b\nc /- d /- e -/ f\n -/ g"), "a \nc \n g")

    def test_rounding_lemma_only_in_a_comment_is_refused(self):
        for comment in ("  -- uses Grothe.Lower.SharpEnvelope.rounded_lt\n",
                        "  /- Grothe.Lower.SharpEnvelope.rounded_lt -/\n"):
            with self.subTest(comment=comment):
                main = MAIN.replace("  simpa using (Rat.cast_lt (K := ℝ)).mpr Grothe.Lower.SharpEnvelope.rounded_lt\n",
                                    "  sorry\n" + comment)
                _, problems = self.run_check(main=main)
                self.assertEqual(len(problems), 1)
                self.assertIn("must use exactly one rounding lemma", problems[0])

    def test_rounding_lemma_only_after_the_theorem_is_refused(self):
        main = MAIN.replace("  simpa using (Rat.cast_lt (K := ℝ)).mpr Grothe.Lower.SharpEnvelope.rounded_lt\n", "  sorry\n")
        after = main + "\ntheorem other : True := by\n  have := Grothe.Lower.SharpEnvelope.rounded_lt\n  trivial\n"
        _, problems = self.run_check(main=after)
        self.assertEqual(len(problems), 1)
        self.assertIn("must use exactly one rounding lemma", problems[0])
        # and a lemma of another certificate below the theorem does not disturb the real one
        below = MAIN + "\nend Grothe.Statement\n-- Grothe.Lower.Other.rounded_lt\ntheorem t : True := Grothe.Lower.Other.rounded_lt\n"
        _, problems = self.run_check(main=below)
        self.assertEqual(problems, [])

    def test_unrecognised_statement(self):
        with self.assertRaises(ValueError):
            self.run_check(main="theorem main_bounds : True := trivial\n")


if __name__ == "__main__":
    unittest.main()

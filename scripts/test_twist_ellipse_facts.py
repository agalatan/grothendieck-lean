#!/usr/bin/env python3
"""Tiny finite-facts generator fixtures; no Lean. Agent-ID: codex-40e8, #343."""
from __future__ import annotations

import contextlib
from copy import deepcopy
from fractions import Fraction as Q
import hashlib
import io
import json
from pathlib import Path
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
import gen_twist_ellipse_facts as facts

plans = facts.plans


def fixture(count=2, error="1/1267650600228229401496703205376"):
    panels = [plans.Panel(Q(i), Q(i+1), 1, i) for i in range(count)]
    data = {"panel_count": count, "relaxed_radii": ["4/1000000000", "14/1000000000", "70/1000000000"],
            "tail_gap_reserve": "1/1000000000000000", "plans": [
                {"panel": i, "j": j, "lo": str(i), "hi": str(i+1), "order": 1,
                 "rho": "2", "m": 1, "R": "1", "tau": "1/2", "etaY": "1/2", "etaK": "1/2",
                 "mode": "Y", "M2cap": "1", "errorCap": error}
                for i in range(count) for j in (1, 2, 3)]}
    return panels, data


def write_fixture(root, count=2):
    panels, data = fixture(count)
    address, scan = root / plans.ADDRESS, root / plans.SCAN
    address.parent.mkdir(parents=True)
    literals = [f"⟨(({i} : ℚ) / 1), (({i+1} : ℚ) / 1), 1, {i}⟩" for i in range(count)]
    address.write_text("structure Panel where\n  lo : ℚ\n  hi : ℚ\n  order : ℕ\n  offset : ℕ\n"
                       "  deriving DecidableEq\n\ndef panelBlock000 : Array Panel := #[\n"
                       + ",\n".join(literals) + "]\n")
    scan.write_text("def sourcePanels : List Panel := panelBlock000.toList\n")
    source = root / "data/twist-ellipse/plans.json"
    source.parent.mkdir(parents=True)
    source.write_text(json.dumps(data))
    plan_file = root / "Grothe/UpperQuad/TwistEllipsePlans.lean"
    plan_file.parent.mkdir(parents=True)
    plan_file.write_text(plans.render(plans.validate_plans(data, panels), hashlib.sha256(source.read_bytes()).hexdigest()))
    return panels, data, source, plan_file


class FactTests(unittest.TestCase):
    def test_exact_budgets_are_recorded_not_defaults(self):
        _, data = fixture()
        radii, reserve, budgets = facts.budgets_from_data(data)
        self.assertEqual(reserve, Q(1, 10**15))
        self.assertEqual(budgets, [Q(3999999, 10**15), Q(13999999, 10**15), Q(69999999, 10**15)])
        self.assertEqual(facts.budgets_from_data(data, ",".join(map(str, budgets)))[2], budgets)
        with self.assertRaisesRegex(ValueError, "disagrees"):
            facts.budgets_from_data(data, ",".join(map(str, radii)))
        for mutate in (
            lambda d: d.pop("tail_gap_reserve"),
            lambda d: d.update(tail_gap_reserve=1e-15),
            lambda d: d.update(tail_gap_reserve=True),
            lambda d: d.update(tail_gap_reserve="-1"),
            lambda d: d.update(relaxed_radii=["1", "2"]),
            lambda d: d["relaxed_radii"].__setitem__(0, 4e-9),
            lambda d: d["relaxed_radii"].__setitem__(0, d["tail_gap_reserve"]),
        ):
            broken = deepcopy(data)
            mutate(broken)
            with self.assertRaises(ValueError):
                facts.budgets_from_data(broken)

    def test_ranges_cover_once_and_use_stop_not_length(self):
        panels, data = fixture(129)
        rows = plans.validate_plans(data, panels)
        budgets = facts.budgets_from_data(data)[2]
        files, entries, _ = facts.render(rows, len(panels), budgets, "a" * 64)
        self.assertEqual(facts.ranges(129), [(0, 64), (64, 128), (128, 129)])
        for j in (1, 2, 3):
            covered = [i for e in entries if e["j"] == j and e["kind"] == "range"
                       for i in range(e["first"], e["stop"])]
            self.assertEqual(covered, list(range(len(panels))))
            self.assertIn(f"shardOK ({j-1} : Power) 128 129 j{j}Certificates", files[f"J{j}Range02.lean"])
            self.assertIn(f"totalOK j{j}Certificates {plans.lean_q(budgets[j-1])}", files[f"J{j}Total.lean"])
        self.assertEqual(len(entries), 12)
        self.assertEqual(sum(text.count("native_decide") for text in files.values()), 12)
        self.assertNotIn("All.lean", files)
        self.assertNotIn("theorem", files["Checks.lean"].split("/-!")[0])
        again = facts.render(list(reversed(rows)), len(panels), budgets, "a" * 64)
        self.assertEqual((files, entries), again[:2])

    def test_missing_duplicate_or_wrong_power_coverage_fails(self):
        panels, data = fixture()
        rows = plans.validate_plans(data, panels)
        budgets = facts.budgets_from_data(data)[2]
        for broken in (rows[:-1], rows + rows[:1], rows[:-1] + rows[:1]):
            with self.assertRaisesRegex(ValueError, "coverage"):
                facts.render(broken, len(panels), budgets, "b" * 64)
        for count in (0, -1, True, 2.0):
            with self.assertRaises(ValueError):
                facts.ranges(count)

    def test_total_budget_boundary_is_exact(self):
        panels, data = fixture(error="1/1024")
        rows = plans.validate_plans(data, panels)
        budget = Q(1, 512)
        _, _, totals = facts.render(rows, len(panels), [budget]*3, "c" * 64)
        self.assertEqual(totals, [budget]*3)
        with self.assertRaisesRegex(ValueError, "exceeds"):
            facts.render(rows, len(panels), [budget-Q(1, 2**200)]*3, "c" * 64)
        with self.assertRaisesRegex(ValueError, "Fraction"):
            facts.render(rows, len(panels), [float(budget)]*3, "c" * 64)

    def test_registration_includes_ranges_and_totals(self):
        panels, data = fixture()
        rows = plans.validate_plans(data, panels)
        radii, reserve, budgets = facts.budgets_from_data(data)
        files, entries, totals = facts.render(rows, len(panels), budgets, "d"*64)
        manifest = facts.registration(files, entries, len(panels), radii, reserve, budgets, totals, "d"*64, {})
        self.assertEqual(len(manifest["native_txt_additions"]), 6)
        self.assertEqual(len(manifest["axioms_lean_additions"]), 6)
        for j in (1, 2, 3):
            fact = f"{facts.NAMESPACE}.j{j}Total"
            self.assertIn(fact + facts.NATIVE_SUFFIX, manifest["native_txt_additions"])
            self.assertIn("#print axioms " + fact, manifest["axioms_lean_additions"])
        self.assertEqual(set(manifest["generated_sha256"]), set(files))

    def test_cli_roundtrip_and_protected_registries(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            _, _, source, plan_file = write_fixture(root, 65)
            native, axioms = root / "data/axioms/native.txt", root / "scratch/Axioms.lean"
            for path in (native, axioms):
                path.parent.mkdir(parents=True)
                path.write_text("untouched\n")
            output = root / "Grothe/UpperQuad/TwistEllipseFacts"
            reg = root / "data/twist-ellipse/facts-registration.json"
            args = ["--repo", str(root)]
            with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
                self.assertEqual(facts.main(args + ["--check"]), 1)
                self.assertFalse(output.exists())
                self.assertEqual(facts.main(args), 0)
                self.assertEqual(facts.main(args + ["--check"]), 0)
                self.assertEqual(len(plans.read_json(reg)["facts"]), 9)
                original = (output / "J1Range01.lean").read_text()
                self.assertIn("64 65", original)
                for path in (native, axioms, source, plan_file, output / "Checks.lean"):
                    self.assertEqual(facts.main(args + ["--registration", str(path)]), 1)
                self.assertEqual(native.read_text(), "untouched\n")
                self.assertEqual(axioms.read_text(), "untouched\n")
                (output / "J1Range01.lean").write_text("stale")
                self.assertEqual(facts.main(args + ["--check"]), 1)
                self.assertEqual((output / "J1Range01.lean").read_text(), "stale")
                (output / "J1Range01.lean").write_text(original)
                (output / "J1Range99.lean").write_text("stale extra")
                self.assertEqual(facts.main(args), 1)
                self.assertEqual((output / "J1Range99.lean").read_text(), "stale extra")

    def test_missing_or_stale_inputs_write_nothing(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            _, data, source, plan_file = write_fixture(root)
            args = ["--repo", str(root)]
            output = root / "Grothe/UpperQuad/TwistEllipseFacts"
            with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
                expected_plan = plan_file.read_text()
                plan_file.write_text("stale")
                self.assertEqual(facts.main(args), 1)
                self.assertFalse(output.exists())
                plan_file.write_text(expected_plan)
                data["plans"].pop()
                source.write_text(json.dumps(data))
                self.assertEqual(facts.main(args), 1)
                self.assertFalse(output.exists())
                source.unlink()
                self.assertEqual(facts.main(args), 1)
                self.assertFalse(output.exists())


if __name__ == "__main__":
    unittest.main()

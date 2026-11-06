#!/usr/bin/env python3
"""Small serialization/coverage tests; no Lean invocation. Agent-ID: codex-40e8, #343."""
from __future__ import annotations

import contextlib
from copy import deepcopy
from fractions import Fraction as Q
import hashlib
import importlib.util
import io
import json
from pathlib import Path
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location("gen_twist_ellipse_plans", ROOT / "tools/gen_twist_ellipse_plans.py")
gen = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = gen
SPEC.loader.exec_module(gen)


def payload(panels):
    return {"panel_count": len(panels), "elapsed_seconds": 0.125, "plans": [
        {"panel": i, "j": j, "lo": str(p.lo), "hi": str(p.hi), "order": p.order,
         "rho": "2", "m": 1, "R": str(p.hi-p.lo), "tau": "1/2",
         "etaY": "1/3", "etaK": "2/3", "mode": ("Y", "K", "auto")[j-1],
         "M2cap": "4", "errorCap": "1/1024"}
        for i, p in enumerate(panels) for j in (1, 2, 3)]}


class PlanTests(unittest.TestCase):
    def setUp(self):
        self.panels = [gen.Panel(Q(0), Q(1), 2, 0), gen.Panel(Q(2), Q(3), 3, 2)]
        self.data = payload(self.panels)

    def test_complete_rows_are_canonical_and_exact(self):
        rows = gen.validate_plans(self.data, self.panels)
        reordered = deepcopy(self.data)
        reordered["plans"].reverse()
        self.assertEqual(rows, gen.validate_plans(reordered, self.panels))
        text = gen.render(rows, "a" * 64)
        self.assertEqual(text, gen.render(gen.validate_plans(reordered, self.panels), "a" * 64))
        self.assertEqual(text.count("massCap :="), 6)
        self.assertIn("def j3Certificates : Array Certificate", text)
        self.assertEqual(sum(row.error_cap for row in rows), Q(3, 512))

    def test_incomplete_duplicate_and_wrong_count_fail(self):
        for mutate in (
            lambda d: d["plans"].pop(),
            lambda d: d["plans"].append(deepcopy(d["plans"][0])),
            lambda d: d.update(panel_count=3),
            lambda d: d.update(panel_count=True),
            lambda d: d.update(panel_count=2.0),
        ):
            data = deepcopy(self.data)
            mutate(data)
            with self.assertRaises(ValueError):
                gen.validate_plans(data, self.panels)

    def test_bad_certificate_fields_fail(self):
        invalid = {
            "panel": [-1, 2, True, 0.0], "j": [0, 4, True, 1.0],
            "order": [0, 3, True, 2.0], "lo": ["1/2", False, 0.0],
            "hi": ["2", 1.0], "rho": ["1", "0", True, 2.0, "NaN", "2/0"],
            "m": [0, -1, True, 1.0], "R": ["-1", "1/100", 1.0],
            "tau": ["0", "1", 0.5], "etaY": ["0", "1", 0.5],
            "etaK": ["0", "1", 0.5], "M2cap": ["-1", 4.0, False],
            "errorCap": ["-1", 0.1, "1e-3"], "mode": ["y", "AUTO", "bogus", 1],
        }
        for field, values in invalid.items():
            for value in values:
                with self.subTest(field=field, value=value):
                    row = deepcopy(self.data["plans"][0])
                    row[field] = value
                    with self.assertRaises(ValueError):
                        gen.validate_row(row, self.panels)
        for field in self.data["plans"][0]:
            row = deepcopy(self.data["plans"][0])
            del row[field]
            with self.subTest(missing=field), self.assertRaises(ValueError):
                gen.validate_row(row, self.panels)

    def test_json_duplicate_keys_and_floats(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "plans.json"
            path.write_text('{"panel_count":2,"panel_count":2,"plans":[]}')
            with self.assertRaisesRegex(ValueError, "duplicate JSON key"):
                gen.read_json(path)
            path.write_text(json.dumps(self.data))
            self.assertEqual(len(gen.validate_plans(gen.read_json(path), self.panels)), 6)
            self.data["plans"][0]["rho"] = 2.0
            path.write_text(json.dumps(self.data))
            with self.assertRaises(ValueError):
                gen.validate_plans(gen.read_json(path), self.panels)
            path.write_text('{"bad": NaN}')
            with self.assertRaisesRegex(ValueError, "non-finite"):
                gen.read_json(path)

    def synthetic_repo(self, root):
        address = root / gen.ADDRESS
        scan = root / gen.SCAN
        address.parent.mkdir(parents=True)
        address.write_text("""structure Panel where
  lo : ℚ
  hi : ℚ
  order : ℕ
  offset : ℕ
  deriving DecidableEq
-- A commented phantom is not a source panel.
/- def panelBlock999 : Array Panel := #[ /- nested -/ ] -/
def panelBlock001 : Array Panel := #[⟨((2 : ℚ) / 1), ((3 : ℚ) / 1), 3, 2⟩]
def panelBlock000 : Array Panel := #[⟨((0 : ℚ) / 1), ((1 : ℚ) / 1), 2, 0⟩]
""")
        scan.write_text("def sourcePanels : List Panel := panelBlock000.toList ++ panelBlock001.toList\n")
        return address, scan

    def test_source_order_is_authoritative(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            address, scan = self.synthetic_repo(root)
            self.assertEqual(gen.read_panels(root), self.panels)
            original = scan.read_text()
            for body in ("panelBlock001.toList ++ panelBlock000.toList",
                         "panelBlock000.toList", "panelBlock000.toList ++ panelBlock000.toList"):
                scan.write_text("def sourcePanels : List Panel := " + body + "\n")
                with self.assertRaises(ValueError):
                    gen.read_panels(root)
            scan.write_text(original)
            address.write_text(address.read_text().replace("3, 2⟩", "3, 1⟩"))
            with self.assertRaisesRegex(ValueError, "order/offset"):
                gen.read_panels(root)

    def test_cli_roundtrip_check_and_no_write_on_failure(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self.synthetic_repo(root)
            source, output = root / "plans.json", root / "Plans.lean"
            source.write_text(json.dumps(self.data))
            args = ["--repo", str(root), "--input", str(source), "--output", str(output)]
            with contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
                self.assertEqual(gen.main(args + ["--check"]), 1)
                self.assertFalse(output.exists())
                self.assertEqual(gen.main(args), 0)
                original = output.read_bytes()
                self.assertEqual(gen.main(args + ["--check"]), 0)
                self.assertEqual(gen.main(args + ["--budgets", "0,0,0"]), 1)
                self.assertEqual(output.read_bytes(), original)
                output.write_text("stale")
                self.assertEqual(gen.main(args + ["--check"]), 1)
                self.assertEqual(output.read_text(), "stale")
                self.data["plans"].pop()
                source.write_text(json.dumps(self.data))
                self.assertEqual(gen.main(args), 1)
                self.assertEqual(output.read_text(), "stale")
                source.unlink()
                self.assertEqual(gen.main(args), 1)

    def test_actual_source_coverage_and_provenance(self):
        panels = gen.read_panels(ROOT)
        self.assertGreater(len(panels), 0)
        self.assertEqual(panels[-1].offset + panels[-1].order, sum(p.order for p in panels))
        data = payload(panels)
        self.assertEqual(len(gen.validate_plans(data, panels)), 3 * len(panels))
        data["source_sha256"] = {
            name: hashlib.sha256((ROOT / name).read_bytes()).hexdigest()
            for name in gen.PROVENANCE_FILES}
        data["source_sha256"]["prototype.py"] = "ignored producer implementation hash"
        gen.check_provenance(data, ROOT)
        data["source_sha256"][gen.ADDRESS] = "0" * 64
        with self.assertRaisesRegex(ValueError, "SHA256 mismatch"):
            gen.check_provenance(data, ROOT)
        del data["source_sha256"][gen.ADDRESS]
        with self.assertRaisesRegex(ValueError, "missing/malformed"):
            gen.check_provenance(data, ROOT)


if __name__ == "__main__":
    unittest.main()

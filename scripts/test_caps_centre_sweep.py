#!/usr/bin/env python3
"""Resume correctness tests; these do not run Lean or an SDP solver."""
import copy
import importlib.util
import json
from pathlib import Path
import shutil
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("centre_sweep", ROOT / "tools/caps_centre_sweep.py")
sweep = importlib.util.module_from_spec(spec)
spec.loader.exec_module(sweep)


class SweepTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        for name in ["scripts", "tools", "Grothe/LowerAnalytic", "Grothe/Lower",
                     "data/caps-m-pieces", "data/caps-m/plan/solved"]:
            (self.root / name).mkdir(parents=True, exist_ok=True)
        shutil.copy(ROOT / "scripts/caps_stamp.py", self.root / "scripts/caps_stamp.py")
        (self.root / "Grothe/LowerAnalytic/CapExport.lean").write_text("import Grothe.Lower.RowDataTypes\n")
        (self.root / "Grothe/Lower/RowDataTypes.lean").write_text("def capPad : ℚ := 1 / 100000000000\n")
        for path in ["GrotheCapsKernel.lean", "lean-toolchain", "lakefile.toml", "lake-manifest.json",
                     "tools/caps_plan.py", "tools/caps_lmi.py"]:
            (self.root / path).write_text("fixture\n")
        self.nodes = [{"k": 12, "i": 140, "s": "1/5", "cap": "7/5", "ds": ["1,0"],
                       "pieces": [{"nq": 256, "slack": 1e-5, "recipe": "1|1", "cons": []},
                                  {"nq": 1024, "slack": 1e-12, "recipe": "2|1",
                                   "cons": ["0,+,-3/1000,3/1000,1/5,0"]}]},
                      {"k": 13, "i": 141, "s": "1/4", "cap": "3/2", "ds": ["1,0"],
                       "pieces": [{"nq": 256, "slack": 1e-12, "recipe": "3|1", "cons": []}]}]
        sweep.write_json(self.root / sweep.PIECES, self.nodes)

    def add_history(self, grid=2, status="fixed", cap_up="0"):
        row = {"k": 12, "i": 140, "j": 1, "grid": grid, "status": status,
               "cap_up": cap_up, "lm": [["1/5", "0"]], "encl": True, "polyOK": True}
        sweep.write_json(self.root / sweep.PLAN / "solved/sol_fixture_g2.json", [row])
        return row

    def prepared(self):
        manifest = sweep.inventory(self.root)
        sweep.prepare(self.root, manifest, "codex15b7", limit=1)
        return manifest, manifest["entries"][0]

    def fake_export(self, manifest, entry):
        m = [["1" if i == j else "0" for j in range(13)] for i in range(13)]
        row = {"k": entry["k"], "i": entry["i"], "j": entry["j"], "grid": entry["grid"],
               "cap": "7/5", "s": "1/5", "capPad": "1/100000000000", "encl": True,
               "polyOK": True, "ok": True, "N": m,
               "cons": [{"lo": "-3/1000", "hi": "3/1000", "lam": "1/5", "mu": "0", "A": m, "B": m}]}
        path = self.root / entry["export"]
        path.write_text(json.dumps(row) + "\n")
        return path, row

    def test_inventory_uses_actual_centre_index_and_stored_grid(self):
        value = sweep.inventory(self.root)
        self.assertEqual([(e["j"], e["grid"]) for e in value["entries"]], [(1, 2), (0, 1)])
        self.assertEqual(value["provenance"]["baseline_capPad"], "1/100000000000")
        self.assertIn("additional", value["provenance"]["cap_up_convention"])

    def test_coarser_history_does_not_complete_a_centre(self):
        self.add_history(grid=1, status="cap_up", cap_up="1/1000000")
        value = sweep.inventory(self.root, True, "reviewed source and exact matrices")
        self.assertEqual(value["summary"]["historical_stored_grid_candidates"], 0)
        self.assertEqual(value["summary"]["pending_searches"], 2)
        self.assertEqual(len(value["ignored_historical_grids"]), 1)

    def test_finer_grid_cannot_stand_in_for_stored_grid(self):
        row = self.add_history()
        row.update(k=13, i=141, j=0, grid=2)
        sweep.write_json(self.root / sweep.PLAN / "solved/sol_fixture_g2.json", [row])
        self.assertEqual(sweep.inventory(self.root)["summary"]["historical_stored_grid_candidates"], 0)

    def test_history_is_separate_until_explicit_review(self):
        self.add_history()
        value = sweep.inventory(self.root)
        self.assertEqual(value["summary"]["pending_searches"], 2)
        with self.assertRaises(sweep.SweepError):
            sweep.inventory(self.root, True)
        value = sweep.inventory(self.root, True, "source and exact matrix review recorded")
        self.assertEqual(value["summary"]["pending_searches"], 1)
        self.assertEqual(value["entries"][0]["search_status"], "historical_adopted")

    def test_conflicting_history_is_not_silently_last_writer_wins(self):
        row = self.add_history()
        row["lm"] = [["2/5", "0"]]
        sweep.write_json(self.root / sweep.PLAN / "solved/sol_other_g2.json", [row])
        with self.assertRaisesRegex(sweep.SweepError, "conflicting"):
            sweep.inventory(self.root)

    def test_source_change_invalidates_manifest(self):
        manifest = sweep.inventory(self.root)
        (self.root / "Grothe/Lower/RowDataTypes.lean").write_text("def capPad : ℚ := 1 / 10000000000\n")
        with self.assertRaisesRegex(sweep.SweepError, "provenance changed"):
            sweep.check_manifest(self.root, manifest)

    def test_duplicate_manifest_entries_cannot_hide_missing_centre(self):
        manifest = sweep.inventory(self.root)
        manifest["entries"][1] = copy.deepcopy(manifest["entries"][0])
        with self.assertRaisesRegex(sweep.SweepError, "incomplete"):
            sweep.check_manifest(self.root, manifest)

    def test_prepare_is_idempotent_and_uses_selected_piece(self):
        manifest, entry = self.prepared()
        path = self.root / entry["module_file"]
        before = path.read_bytes()
        self.assertIn(" [1] 2", path.read_text())
        self.assertIn("Export already exists", path.read_text())
        sweep.prepare(self.root, manifest, "codex15b7", limit=1)
        self.assertEqual(path.read_bytes(), before)

    def test_completed_export_is_preserved_and_validated(self):
        manifest, entry = self.prepared()
        path, _ = self.fake_export(manifest, entry)
        before = path.read_bytes()
        sweep.prepare(self.root, manifest, "codex15b7", limit=1)
        self.assertEqual(path.read_bytes(), before)
        self.assertEqual(sweep.validate(self.root, manifest)["complete_exports"], ["12:140:1"])

    def test_partial_export_is_preserved_but_rejected(self):
        manifest, entry = self.prepared()
        path = self.root / entry["export"]
        path.write_text('{"k":12,')
        with self.assertRaisesRegex(sweep.SweepError, "partial/malformed"):
            sweep.prepare(self.root, manifest, "codex15b7", limit=1)
        self.assertEqual(path.read_text(), '{"k":12,')

    def test_wrong_grid_identity_or_padding_is_rejected(self):
        manifest, entry = self.prepared()
        path, row = self.fake_export(manifest, entry)
        for field, wrong in [("grid", 1), ("j", 0), ("capPad", "1/1000")]:
            bad = dict(row, **{field: wrong})
            path.write_text(json.dumps(bad) + "\n")
            with self.assertRaises(sweep.SweepError):
                sweep.export_record(self.root, manifest, entry)

    def test_nonempty_export_without_provenance_is_not_adopted(self):
        manifest, entry = self.prepared()
        self.fake_export(manifest, entry)
        (self.root / entry["export_provenance"]).unlink()
        with self.assertRaisesRegex(sweep.SweepError, "missing/stale"):
            sweep.prepare(self.root, manifest, "codex15b7", limit=1)

    def test_scratch_recipe_change_invalidates_an_existing_export(self):
        manifest, entry = self.prepared()
        self.fake_export(manifest, entry)
        path = self.root / entry["module_file"]
        path.write_text(path.read_text().replace("2|1", "999|1"))
        with self.assertRaisesRegex(sweep.SweepError, "scratch module changed"):
            sweep.validate(self.root, manifest)


if __name__ == "__main__":
    unittest.main()

#!/usr/bin/env python3
"""Resume correctness tests; these do not run Lean or an SDP solver."""
import contextlib
import copy
import importlib.util
import io
import json
from pathlib import Path
import shutil
import tempfile
import unittest
from unittest.mock import patch

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
        for name in ("caps_plan.py", "caps_lmi.py", "caps_centre_repair.py"):
            shutil.copyfile(ROOT / "tools" / name, self.root / "tools" / name)
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

    def test_duplicate_node_with_different_centre_index_is_rejected(self):
        duplicate = copy.deepcopy(self.nodes[0])
        duplicate["pieces"][0]["slack"] = 1e-12
        duplicate["pieces"][1]["slack"] = 1e-5
        with self.assertRaisesRegex(sweep.SweepError, "duplicate node"):
            sweep.centres([self.nodes[0], duplicate])

    def test_prepare_is_idempotent_and_uses_selected_piece(self):
        manifest, entry = self.prepared()
        path = self.root / entry["module_file"]
        before = path.read_bytes()
        self.assertIn(" [1] 2", path.read_text())
        self.assertIn("Export already exists", path.read_text())
        name = entry["module"].split(".")[-1]
        self.assertIn(f"def run_{name} : IO Unit := do", path.read_text())
        self.assertIn(f"#eval run_{name}", path.read_text())
        self.assertNotIn("#eval do", path.read_text())
        sweep.prepare(self.root, manifest, "codex15b7", limit=1)
        self.assertEqual(path.read_bytes(), before)

    def test_completed_export_is_preserved_and_validated(self):
        manifest, entry = self.prepared()
        path, _ = self.fake_export(manifest, entry)
        before = path.read_bytes()
        sweep.prepare(self.root, manifest, "codex15b7", limit=1)
        self.assertEqual(path.read_bytes(), before)
        self.assertEqual(sweep.validate(self.root, manifest)["complete_exports"], ["12:140:1"])

    def test_prepare_cli_emits_only_missing_export_targets(self):
        manifest = sweep.inventory(self.root)
        sweep.prepare(self.root, manifest, "codex15b7")
        self.fake_export(manifest, manifest["entries"][0])
        manifest_path = self.root / "manifest.json"
        sweep.write_json(manifest_path, manifest)
        output = io.StringIO()
        with patch.object(sweep, "ROOT", self.root), contextlib.redirect_stdout(output):
            sweep.main(["prepare", str(manifest_path), "--tag", "codex15b7"])
        self.assertEqual(output.getvalue().splitlines(), [manifest["entries"][1]["module"]])

    def test_nonpositive_prepare_limit_is_rejected(self):
        manifest = sweep.inventory(self.root)
        for limit in (0, -1):
            with self.assertRaisesRegex(sweep.SweepError, "limit must be positive"):
                sweep.prepare(self.root, manifest, "codex15b7", limit=limit)

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

    def run_search(self, manifest, result):
        # Only the optimizer is replaced. The normal import, exact rational
        # matrix loading, admissibility and LDL replay all run unchanged.
        import sys
        sys.path.insert(0, str(ROOT / "tools"))
        import caps_plan
        with patch.object(caps_plan, "verdict", return_value=result) as verdict, \
                contextlib.redirect_stdout(io.StringIO()):
            summary = sweep.solve(self.root, manifest)
        return summary, verdict.call_count

    def good_result(self, entry, status="fixed", cap_up="0"):
        return {"k": entry["k"], "i": entry["i"], "j": entry["j"], "grid": entry["grid"],
                "status": status, "cap_up": cap_up, "lm": [["1/5", "0"]],
                "encl": True, "polyOK": True}

    def test_fresh_and_resumed_exact_result_pass_without_repeating_search(self):
        manifest, entry = self.prepared()
        self.fake_export(manifest, entry)
        result = self.good_result(entry)
        self.assertEqual(self.run_search(manifest, result), ({"fixed": 1}, 1))
        self.assertEqual(self.run_search(manifest, None), ({"fixed": 1}, 0))

    def test_valid_positive_increase_is_exactly_replayed(self):
        manifest, entry = self.prepared()
        self.fake_export(manifest, entry)
        result = self.good_result(entry, status="cap_up", cap_up="1/7")
        self.assertEqual(self.run_search(manifest, result), ({"cap_up": 1}, 1))
        self.assertEqual(self.run_search(manifest, None), ({"cap_up": 1}, 0))

    def test_cap_minimisation_fallback_may_find_exact_zero(self):
        manifest, entry = self.prepared()
        self.fake_export(manifest, entry)
        result = self.good_result(entry, status="cap_up", cap_up="0")
        self.assertEqual(self.run_search(manifest, result), ({"cap_up": 1}, 1))

    def test_invalid_fresh_results_are_not_saved_or_counted(self):
        manifest, entry = self.prepared()
        self.fake_export(manifest, entry)
        original = self.good_result(entry)
        cases = [{"cap_up": "-1"}, {"cap_up": "1/7"}, {"status": "cap_up", "cap_up": "-1"},
                 {"status": "unknown"}, {"lm": []}, {"lm": [["-1", "0"]]},
                 {"lm": [["0", "-1"]]}, {"lm": [["2", "0"]]},
                 {"encl": False}, {"j": 0}]
        for changes in cases:
            with self.subTest(changes=changes), self.assertRaises(sweep.SweepError):
                self.run_search(manifest, {**original, **changes})
            self.assertFalse((self.root / entry["solved"]).exists())

    def test_tampered_resumed_result_is_rejected_even_with_current_provenance(self):
        manifest, entry = self.prepared()
        self.fake_export(manifest, entry)
        self.run_search(manifest, self.good_result(entry))
        path = self.root / entry["solved"]
        original = json.loads(path.read_text())
        for changes in [{"cap_up": "-1", "lm": []}, {"lm": [["2", "0"]]},
                        {"lm": [["-1", "0"]]}, {"status": "unknown"}]:
            bad = copy.deepcopy(original)
            bad[0].update(changes)
            sweep.write_json(path, bad)
            with self.subTest(changes=changes), self.assertRaises(sweep.SweepError):
                self.run_search(manifest, None)

    def test_failed_search_remains_explicitly_failed(self):
        manifest, entry = self.prepared()
        self.fake_export(manifest, entry)
        result = {**self.good_result(entry), "status": "fail", "cap_up": None,
                  "lm": None, "error": "no exact proposal"}
        self.assertEqual(self.run_search(manifest, result), ({"fail": 1}, 1))


if __name__ == "__main__":
    unittest.main()

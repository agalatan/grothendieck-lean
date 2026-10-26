#!/usr/bin/env python3
"""Portable preparation regressions; no Lean, solvers, subprocesses or real campaign writes."""
import copy
import json
from pathlib import Path
import shutil
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
import caps_centre_portable as portable
import caps_centre_sweep as sweep
import caps_centre_fine as fine


def matrix():
    return [["1" if i == j else "0" for j in range(13)] for i in range(13)]


def exported(entry, *, cap="7/5", s="1/5"):
    out = {k: entry[k] for k in ("k", "i", "j", "grid")}
    out.update(cap=cap, s=s, capPad="1/100000000000", encl=True, polyOK=True, ok=True,
               N=matrix(), cons=[])
    if "grid_spec" in entry:
        out["grid_spec"] = entry["grid_spec"]
    return out


def receipt(path, root, **extra):
    return {"path": path.relative_to(root).as_posix(), "sha256": sweep.sha(path), **extra}


def failed_solution(root, entry, provenance):
    out = {k: entry[k] for k in ("k", "i", "j", "grid")}
    out.update(status="fail", cap_up=None, error="old unsuccessful search preserved",
               provenance={"fingerprint": provenance["fingerprint"], "export_sha256": sweep.sha(root / entry["export"]),
                           "baseline_capPad": provenance["baseline_capPad"], "cap_up_convention": provenance["cap_up_convention"]})
    if "grid_spec" in entry:
        out["grid_spec"] = entry["grid_spec"]
        out["provenance"]["grid_spec"] = entry["grid_spec"]
    return out


class PortableTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name) / "original-mac-root"
        for name in ("scripts", "tools", "Grothe/Lower", "Grothe/LowerAnalytic", "data/caps-m-pieces",
                     "data/caps-m/plan/solved", "data/caps-m/plan/exports", "data/caps-m/plan/checkpoints"):
            (self.root / name).mkdir(parents=True, exist_ok=True)
        shutil.copy(ROOT / "scripts/caps_stamp.py", self.root / "scripts/caps_stamp.py")
        for name in ("caps_centre_campaign.py", "caps_centre_checkpoint.py", "caps_centre_portable.py",
                     "caps_centre_sweep.py", "caps_centre_fine.py", "caps_centre_repair.py", "caps_lmi.py", "caps_plan.py"):
            shutil.copy(ROOT / "tools" / name, self.root / "tools" / name)
        (self.root / "Grothe/Lower/RowDataTypes.lean").write_text("def capPad : ℚ := 1 / 100000000000\n")
        (self.root / "Grothe/LowerAnalytic/CapExport.lean").write_text("import Grothe.Lower.RowDataTypes\n")
        for name in ("GrotheCapsKernel.lean", "lean-toolchain", "lakefile.toml", "lake-manifest.json"):
            (self.root / name).write_text("fixture\n")
        self.nodes = [{"k": 12, "i": i, "s": "1/5", "cap": "7/5", "ds": ["0,0"],
                       "pieces": [{"nq": q, "slack": 1e-12, "recipe": "1|1", "cons": []}]}
                      for i, q in [(140, 1024), (141, 256), (142, 1024)]]
        sweep.write_json(self.root / sweep.PIECES, self.nodes)
        self.manifest = sweep.inventory(self.root)
        sweep.prepare(self.root, self.manifest, "OldMacTag")
        self.manifest_name = "data/caps-m/plan/old-full-manifest.json"
        sweep.write_json(self.root / self.manifest_name, self.manifest)
        entry = self.manifest["entries"][0]
        path = self.root / entry["export"]
        path.write_text(json.dumps(exported(entry)) + "\n")
        solved = {k: entry[k] for k in ("k", "i", "j", "grid")}
        solved.update(status="fixed", cap_up="0", lm=[])
        sweep.write_json(self.root / entry["solved"], [solved])
        r = {"origin": "fresh_or_resumed", "status": "complete", "residual_accepted": True,
             "best_residual": "0", "raw_cap_up": "0", "raw_exact_replayed": True,
             "raw_export": receipt(path, self.root),
             "raw_result": receipt(self.root / entry["solved"], self.root),
             "evidence": [receipt(self.root / entry["solved"], self.root)]}
        progress = {"agent_id": "codex-15b7", "status": "paused", "capPad_unchanged": "1/100000000000",
                    "centres": {sweep.key_string(e): r if index == 0 else {"status": "pending"}
                                for index, e in enumerate(self.manifest["entries"])},
                    "fingerprint": {"manifest_sha256": sweep.sha(self.root / self.manifest_name),
                                    "helpers_sha256": {}, "driver_sha256": sweep.sha(self.root / "tools/caps_centre_campaign.py"),
                                    "config": {"fine_np": 1600, "fine_nq": 1152, "fine_step": "1/200",
                                               "medium_grid": [3200, 256, "1/400"]}}}
        self.saved = {"format": "caps-centre-backup/v1", "agent_id": "codex-15b7",
                      "manifest": self.manifest_name, "worktree": str(self.root), "progress_snapshot": progress}
        self.checkpoint_name = "data/caps-m/plan/checkpoints/immutable-before-portable-1.json"
        sweep.write_json(self.root / self.checkpoint_name, self.saved)
        self.tag = "Codex15b7Portable"
        self.out = "data/caps-m/plan/portable/Codex15b7Portable/manifest.json"

    def prepare(self):
        return portable.prepare(self.root, self.manifest_name, self.checkpoint_name, self.tag, self.out)

    def test_full_inventory_and_completed_metadata_and_absolute_source_are_preserved(self):
        old_entry = copy.deepcopy(self.manifest["entries"][0])
        old_source = (self.root / old_entry["module_file"]).read_bytes()
        config_name, config = self.prepare()
        new = json.loads((self.root / self.out).read_bytes())
        self.assertEqual(len(new["entries"]), 3)
        self.assertEqual(new["entries"][0], old_entry)
        self.assertEqual(new["portable"]["completed_records"],
                         {"12:140:0": self.saved["progress_snapshot"]["centres"]["12:140:0"]})
        self.assertEqual((self.root / old_entry["module_file"]).read_bytes(), old_source)
        self.assertIn(old_entry["module"], new["portable"]["legacy_modules_never_build"])
        self.assertEqual(config["preserved_files"][old_entry["module_file"]], old_entry["module_source_sha256"])
        self.assertEqual(len(config["pending"]), 2)
        self.assertEqual(portable.check(self.root, config_name), config)

    def test_frozen_templates_differ_only_in_io_literal(self):
        reference = Path(self.tmp.name) / "reference-generator-root"
        shutil.copytree(self.root, reference)
        _, config = self.prepare()
        portable_manifest = json.loads((self.root / self.out).read_bytes())
        old = copy.deepcopy(self.manifest)
        old["campaign_tag"] = self.tag
        sweep.prepare(reference, old, self.tag, keys=["12:141:0"])
        ref_entry = old["entries"][1]
        relative = portable_manifest["entries"][1]
        ref = (reference / ref_entry["module_file"]).read_bytes()
        ref = ref.replace(json.dumps(str((reference / ref_entry["export"]).resolve())).encode(),
                          json.dumps(relative["export"]).encode())
        self.assertEqual(ref, (self.root / relative["module_file"]).read_bytes())
        pending = next(p for p in config["pending"] if p["key"] == "12:141:0")
        new_fine = json.loads((self.root / pending["fine_manifest"]).read_bytes())
        ref_fine = fine.prepare(reference, "12:141", self.tag + "Fine", [3200, 256, "1/400"])
        ref = (reference / ref_fine["entry"]["module_file"]).read_bytes()
        ref = ref.replace(json.dumps(str((reference / ref_fine["entry"]["export"]).resolve())).encode(),
                          json.dumps(new_fine["entry"]["export"]).encode())
        self.assertEqual(ref, (self.root / new_fine["entry"]["module_file"]).read_bytes())

    def test_all_new_io_paths_are_relative_and_fine_validators_accept(self):
        _, config = self.prepare()
        new = json.loads((self.root / self.out).read_bytes())
        sweep.check_manifest(self.root, new)
        for p in config["pending"]:
            entry = next(e for e in new["entries"] if sweep.key_string(e) == p["key"])
            source = (self.root / entry["module_file"]).read_text()
            self.assertIn('exportPiecesOn "data/caps-m/plan/', source)
            self.assertNotIn(str(self.root), source)
            self.assertIsNone(sweep.export_record(self.root, new, entry))
            fm = json.loads((self.root / p["fine_manifest"]).read_bytes())
            self.assertIsNone(fine.validate(self.root, fm))
            self.assertEqual(fm["entry"]["grid_spec"], [3200, 256, "1/400"] if entry["grid"] == 1 else [1600, 1152, "1/200"])
            self.assertNotIn(str(self.root), (self.root / fm["entry"]["module_file"]).read_text())

    def test_relocation_preserves_prepared_bytes_and_check_results(self):
        config_name, config = self.prepare()
        relocated = Path(self.tmp.name) / "linux-home-root"
        shutil.copytree(self.root, relocated)
        checked = portable.check(relocated, config_name)
        self.assertEqual(checked, config)
        for name, sha in config["outputs"].items():
            self.assertEqual(sweep.sha(relocated / name), sha)
        old_source = (relocated / self.manifest["entries"][0]["module_file"]).read_text()
        self.assertIn(str(self.root), old_source)

    def test_prepare_is_idempotent_without_overwriting_old_pending_sources(self):
        old_sources = {e["module_file"]: (self.root / e["module_file"]).read_bytes() for e in self.manifest["entries"]}
        first_name, first = self.prepare()
        before = {name: (self.root / name).read_bytes() for name in first["outputs"]}
        second_name, second = self.prepare()
        self.assertEqual((first_name, first), (second_name, second))
        for name, payload in {**old_sources, **before}.items():
            self.assertEqual((self.root / name).read_bytes(), payload)

    def test_check_and_prepare_remain_valid_after_new_results_appear(self):
        config_name, config = self.prepare()
        new = json.loads((self.root / self.out).read_bytes())
        entry = new["entries"][1]
        (self.root / entry["export"]).write_text(json.dumps(exported(entry)) + "\n")
        sweep.write_json(self.root / entry["solved"], [failed_solution(self.root, entry, new["provenance"])])
        fm = json.loads((self.root / config["pending"][0]["fine_manifest"]).read_bytes())
        (self.root / fm["entry"]["export"]).write_text(json.dumps(exported(fm["entry"])) + "\n")
        (self.root / fm["entry"]["solved"]).parent.mkdir(parents=True, exist_ok=True)
        sweep.write_json(self.root / fm["entry"]["solved"], [failed_solution(self.root, fm["entry"], fm["provenance"])])
        before = (self.root / fm["entry"]["solved"]).read_bytes()
        self.assertEqual(portable.check(self.root, config_name), config)
        self.assertEqual(self.prepare()[1], config)
        self.assertEqual((self.root / fm["entry"]["solved"]).read_bytes(), before)

    def test_changed_generated_output_refuses_before_any_other_write(self):
        config_name, config = self.prepare()
        module = config["pending"][0]["stored_module"].replace(".", "/") + ".lean"
        (self.root / module).write_text("changed/foreign bytes\n")
        before = (self.root / module).read_bytes()
        with self.assertRaisesRegex(sweep.SweepError, "changed existing output"):
            self.prepare()
        with self.assertRaises(sweep.SweepError):
            portable.check(self.root, config_name)
        self.assertEqual((self.root / module).read_bytes(), before)

    def test_pending_old_export_or_solved_is_not_recomputed_from_stale_snapshot(self):
        for field in ("export", "solved"):
            with self.subTest(field=field):
                path = self.root / self.manifest["entries"][1][field]
                path.write_text("partial or completed output outside immutable checkpoint\n")
                with self.assertRaisesRegex(sweep.SweepError, "Incomplete selected centre"):
                    self.prepare()
                self.assertFalse((self.root / self.out).exists())
                path.unlink()

    def test_path_escape_symlink_and_collision_refused(self):
        for out in ("../escape.json", "/tmp/escape.json", self.manifest_name):
            with self.subTest(out=out), self.assertRaises(sweep.SweepError):
                portable.prepare(self.root, self.manifest_name, self.checkpoint_name, self.tag, out)
        folder = self.root / "data/caps-m/plan/linked"
        folder.symlink_to(Path(self.tmp.name))
        with self.assertRaisesRegex(sweep.SweepError, "Symlink"):
            portable.prepare(self.root, self.manifest_name, self.checkpoint_name, self.tag, "data/caps-m/plan/linked/manifest.json")

    def test_generator_or_immutable_checkpoint_change_invalidates_config(self):
        config_name, _ = self.prepare()
        original = (self.root / portable.GENERATOR).read_bytes()
        (self.root / portable.GENERATOR).write_bytes(original + b"\n# changed generator\n")
        with self.assertRaises(sweep.SweepError):
            portable.check(self.root, config_name)
        (self.root / portable.GENERATOR).write_bytes(original)
        saved = copy.deepcopy(self.saved)
        saved["new_field"] = "changed immutable observation"
        sweep.write_json(self.root / self.checkpoint_name, saved)
        with self.assertRaises(sweep.SweepError):
            portable.check(self.root, config_name)

    def test_unsupported_grid_and_incomplete_inventory_refused(self):
        bad = copy.deepcopy(self.manifest)
        bad["entries"][1]["grid"] = 0
        sweep.write_json(self.root / self.manifest_name, bad)
        with self.assertRaises(sweep.SweepError):
            self.prepare()
        bad["entries"] = bad["entries"][:-1]
        sweep.write_json(self.root / self.manifest_name, bad)
        with self.assertRaises(sweep.SweepError):
            self.prepare()

    def test_completed_source_missing_or_changed_is_never_rebuilt(self):
        path = self.root / self.manifest["entries"][0]["module_file"]
        payload = path.read_bytes()
        path.unlink()
        with self.assertRaisesRegex(sweep.SweepError, "Missing/changed legacy scratch bytes"):
            self.prepare()
        self.assertFalse(path.exists())
        path.write_bytes(payload + b"\nchanged\n")
        with self.assertRaisesRegex(sweep.SweepError, "Missing/changed legacy scratch bytes"):
            self.prepare()

    def test_completed_failed_fine_attempt_and_original_fine_source_are_preserved(self):
        fm = fine.prepare(self.root, "12:140", "OldMacFine", [1600, 1152, "1/200"])
        fine_name = "data/caps-m/plan/fine-12x140-original.json"
        sweep.write_json(self.root / fine_name, fm)
        (self.root / fm["entry"]["export"]).write_text(json.dumps(exported(fm["entry"])) + "\n")
        (self.root / fm["entry"]["solved"]).parent.mkdir(parents=True, exist_ok=True)
        sweep.write_json(self.root / fm["entry"]["solved"], [failed_solution(self.root, fm["entry"], fm["provenance"])])
        failed_before = (self.root / fm["entry"]["solved"]).read_bytes()
        source_before = (self.root / fm["entry"]["module_file"]).read_bytes()
        rec = self.saved["progress_snapshot"]["centres"]["12:140:0"]
        rec["fine_grid_spec"] = fm["entry"]["grid_spec"]
        rec["evidence"] += [receipt(self.root / fine_name, self.root, kind="independently_pinned_fine_manifest"),
                            receipt(self.root / fm["entry"]["export"], self.root),
                            receipt(self.root / fm["entry"]["solved"], self.root)]
        sweep.write_json(self.root / self.checkpoint_name, self.saved)
        config_name, config = self.prepare()
        self.assertIn(fm["entry"]["module_file"], config["preserved_files"])
        self.assertIn(fm["entry"]["solved"], config["preserved_files"])
        self.assertEqual((self.root / fm["entry"]["solved"]).read_bytes(), failed_before)
        self.assertEqual((self.root / fm["entry"]["module_file"]).read_bytes(), source_before)
        portable.check(self.root, config_name)

    def test_new_result_identity_or_source_mismatch_is_rejected_without_overwrite(self):
        config_name, config = self.prepare()
        new = json.loads((self.root / self.out).read_bytes())
        entry = new["entries"][1]
        (self.root / entry["export"]).write_text(json.dumps(exported(entry)) + "\n")
        result = failed_solution(self.root, entry, new["provenance"])
        result["provenance"]["export_sha256"] = "0" * 64
        sweep.write_json(self.root / entry["solved"], [result])
        before = (self.root / entry["solved"]).read_bytes()
        with self.assertRaisesRegex(sweep.SweepError, "provenance mismatch"):
            portable.check(self.root, config_name)
        self.assertEqual((self.root / entry["solved"]).read_bytes(), before)

    def test_speculative_old_fine_results_for_pending_centre_are_not_duplicated(self):
        fm = fine.prepare(self.root, "12:141", "OldSpeculativeFine", [3200, 256, "1/400"])
        manifest_path = self.root / "data/caps-m/plan/fine-old-speculative.json"
        sweep.write_json(manifest_path, fm)
        # Prepared old source/sidecar alone is not completed computation.
        config_name, config = self.prepare()
        self.assertEqual(len(config["pending"]), 2)
        export = self.root / fm["entry"]["export"]
        export.write_text(json.dumps(exported(fm["entry"])) + "\n")
        before = export.read_bytes()
        with self.assertRaisesRegex(sweep.SweepError, "existing old fine export outside immutable checkpoint"):
            portable.check(self.root, config_name)
        with self.assertRaises(sweep.SweepError):
            self.prepare()
        self.assertEqual(export.read_bytes(), before)
        export.unlink()
        solved = self.root / fm["entry"]["solved"]
        solved.parent.mkdir(parents=True, exist_ok=True)
        sweep.write_json(solved, [{"status": "fail", "error": "preserve old unsuccessful attempt"}])
        with self.assertRaisesRegex(sweep.SweepError, "existing old fine solved outside immutable checkpoint"):
            self.prepare()
        self.assertTrue(solved.exists())


if __name__ == "__main__":
    unittest.main()

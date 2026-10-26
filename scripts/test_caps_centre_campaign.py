#!/usr/bin/env python3
"""Campaign resume/resource/state regressions; no Lean or real numeric searches."""
import contextlib
import copy
from fractions import Fraction as F
import importlib.util
import io
import json
from pathlib import Path
import signal
import sys
import tempfile
import unittest
from unittest.mock import Mock, patch

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
import caps_centre_campaign as campaign


def matrix():
    return [["1" if i == j else "0" for j in range(13)] for i in range(13)]


def result(entry, increase="0"):
    return {k: entry[k] for k in ("k", "i", "j", "grid")} | {
        "status": "fixed" if F(increase) == 0 else "cap_up", "cap_up": increase, "lm": []}


class FakeChild:
    pid = 987654
    def __init__(self, code=0, polls=1):
        self.code, self.polls, self.returncode = code, polls, None
    def poll(self):
        if self.polls:
            self.polls -= 1
            return None
        self.returncode = self.code
        return self.returncode
    def wait(self, timeout=None):
        if self.returncode is None:
            self.returncode = self.code
        return self.returncode


class CampaignTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.plan = self.root / campaign.sweep.PLAN
        for path in (self.root / "tools", self.plan / "solved", self.plan / "exports",
                     self.root / "data/caps-m-pieces", self.root / "handoff/caps-centre"):
            path.mkdir(parents=True, exist_ok=True)
        for name in ("caps_centre_sweep.py", "caps_centre_fine.py", "caps_centre_repair.py", "caps_lmi.py", "caps_plan.py"):
            (self.root / "tools" / name).write_text("fixture\n")
        self.entry = {"k": 12, "i": 140, "j": 0, "grid": 2, "nq": 1024, "search_status": "pending",
                      "module": "Grothe.LowerAnalytic.CapPlanRuns.Run_fixture",
                      "export": "data/caps-m/plan/exports/new.jsonl", "solved": "data/caps-m/plan/solved/new.json"}
        self.history = dict(self.entry, k=14, i=200, search_status="historical_adopted")
        old = result(self.history, "1/1000")
        old_path = self.plan / "solved/sol_history_g2.json"
        campaign.repair.atomic_json(old_path, [old])
        self.history["historical"] = {"file": str(old_path.relative_to(self.root)),
                                      "file_sha256": campaign.sweep.sha(old_path),
                                      "result_sha256": campaign.hashlib.sha256(campaign.sweep.canonical(old)).hexdigest()}
        self.manifest = {"entries": [self.entry, self.history],
                         "historical_review_note": "historical source/exact-matrix review recorded",
                         "provenance": {"fingerprint": "fixture-source", "baseline_capPad": "1/100000000000",
                                        "cap_up_convention": "additional to baseline"}}
        self.manifest_path = self.plan / "manifest.json"
        campaign.repair.atomic_json(self.manifest_path, self.manifest)
        self.config = campaign.Config(self.root, self.manifest_path, self.plan / "campaign-progress.json",
                                      self.root / "handoff/caps-centre/campaign", self.root / "handoff/caps-centre/STOP",
                                      poll_seconds=0.001)
        self.check = patch.object(campaign.sweep, "check_manifest")
        self.check.start()
        self.addCleanup(self.check.stop)
        self.runner = Mock()
        self.runner.run.side_effect = AssertionError("test must not launch a real heavy child")

    def driver(self):
        return campaign.Campaign(self.config, runner_factory=lambda *_: self.runner)

    def exported(self, entry=None, *, increase="0"):
        entry = entry or self.entry
        value = result(entry, increase)
        value.update(cap="7/5", s="1/5", capPad="1/100000000000", encl=True, polyOK=True,
                     ok=increase == "0", N=matrix(), cons=[])
        path = self.root / entry["export"]
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(json.dumps(value) + "\n")
        return value, path

    def solved(self, entry=None, increase="0"):
        entry = entry or self.entry
        value = result(entry, increase)
        value["provenance"] = {"fingerprint": self.manifest["provenance"]["fingerprint"],
                                "export_sha256": campaign.sweep.sha(self.root / entry["export"]),
                                "baseline_capPad": "1/100000000000", "cap_up_convention": "additional to baseline"}
        campaign.repair.atomic_json(self.root / entry["solved"], [value])
        return value

    def test_resumed_stored_solution_is_exactly_checked_without_optimizer(self):
        exported, _ = self.exported()
        self.solved()
        with patch.object(campaign.sweep, "export_record", return_value=exported), \
                patch("caps_plan.verdict", side_effect=AssertionError("must resume")):
            _, value = campaign.stored_solution(self.root, self.manifest, self.entry)
        self.assertEqual(value["cap_up"], "0")

    def test_resumed_status_and_matching_provenance_do_not_hide_invalid_multipliers(self):
        exported, _ = self.exported()
        value = self.solved()
        value["lm"] = [["0", "0"]]  # Wrong constraint count despite matching hashes/provenance.
        campaign.repair.atomic_json(self.root / self.entry["solved"], [value])
        with patch.object(campaign.sweep, "export_record", return_value=exported), \
                self.assertRaisesRegex(campaign.sweep.SweepError, "exact admissibility/LDL"):
            campaign.stored_solution(self.root, self.manifest, self.entry)

    def test_new_stored_solution_is_checked_before_persistence(self):
        exported, _ = self.exported()
        bad = dict(result(self.entry), lm=[["-1", "0"]])
        with patch.object(campaign.sweep, "export_record", return_value=exported), \
                patch("caps_plan.verdict", return_value=bad), self.assertRaises(campaign.sweep.SweepError):
            campaign.stored_solution(self.root, self.manifest, self.entry, create=True)
        self.assertFalse((self.root / self.entry["solved"]).exists())

    def test_historical_adoption_keeps_review_identity_and_original_result(self):
        old = campaign.historical_result(self.root, self.manifest, self.history)
        self.assertEqual(old["cap_up"], "1/1000")
        old["cap_up"] = "0"
        campaign.repair.atomic_json(self.root / self.history["historical"]["file"], [old])
        with self.assertRaisesRegex(campaign.sweep.SweepError, "bytes changed"):
            campaign.historical_result(self.root, self.manifest, self.history)

    def test_historical_export_requires_current_cap_location_and_region(self):
        node = {"k": 14, "i": 200, "s": "1/5", "cap": "7/5",
                "pieces": [{"cons": ["0,+,-1,1,0,0"]}]}
        campaign.repair.atomic_json(self.root / campaign.sweep.PIECES, [node])
        row, path = self.exported(self.history)
        row["cons"] = [{"lo": "-1", "hi": "1", "lam": "99", "mu": "0", "A": matrix(), "B": matrix()}]
        # The stored input multipliers may differ: independently replayed new
        # multipliers are the actual candidate certificate.
        candidate = dict(result(self.history, "1/1000"), lm=[["0", "0"]])
        for field, bad in [("cap", "8/5"), ("s", "1/4")]:
            invalid = dict(row, **{field: bad})
            path.write_text(json.dumps(invalid) + "\n")
            self.assertEqual(campaign.find_historical_export(self.root, self.manifest, self.history, candidate), (None, None))
        invalid = copy.deepcopy(row)
        invalid["cons"][0]["lo"] = "-2"
        path.write_text(json.dumps(invalid) + "\n")
        self.assertEqual(campaign.find_historical_export(self.root, self.manifest, self.history, candidate), (None, None))
        path.write_text(json.dumps(row) + "\n")
        got, found = campaign.find_historical_export(self.root, self.manifest, self.history, candidate)
        self.assertIsNotNone(got)
        self.assertEqual(found, path.relative_to(self.root))

    def test_positive_raw_result_still_gets_fine_attempt_when_stored_split_is_zero(self):
        driver = self.driver()
        self.exported()
        self.solved(increase="1/10")
        raw = result(self.entry, "1/10")
        driver.raw = Mock(return_value=(raw, {}, Path(self.entry["export"]), Path(self.entry["solved"]),
                                        "fresh_or_resumed_exact_replay"))
        driver.interval_repair = Mock(return_value=({"cap_up": "0"}, {"path": "checked-partition"}))
        fine_entry = dict(self.entry, grid=3, grid_spec=[1600, 1152, "1/200"])
        fm = {"entry": fine_entry}
        driver.finer = Mock(return_value=(fm, {}, dict(result(fine_entry, "1/20"), grid_spec=fine_entry["grid_spec"]),
                                          {"path": "independently-pinned-fine"}))
        driver.process(self.entry)
        driver.finer.assert_called_once_with(self.entry)
        rec = driver.state["centres"][campaign.sweep.key_string(self.entry)]
        self.assertEqual(rec["raw_cap_up"], "1/10")
        self.assertEqual(rec["best_residual"], "0")
        self.assertTrue(rec["fine_attempt_complete"])

    def test_existing_pinned_fine_zero_is_reused_without_build_or_reprepare(self):
        driver = self.driver()
        row, path = self.exported(self.history)
        fe = dict(self.history, grid=3, grid_spec=[1600, 1152, "1/200"])
        fm = {"entry": fe}
        fp = self.plan / "fine-14x200-codex-15b7.json"
        campaign.repair.atomic_json(fp, fm)
        self.solved(self.history)
        value = dict(result(fe), grid_spec=fe["grid_spec"])
        parsed = list(campaign.repair.load_exports(path))[0]
        parsed.update(grid=3, grid_spec=fe["grid_spec"])
        with patch.object(campaign.fine, "validate", return_value=parsed), \
                patch.object(campaign.fine, "solve", return_value=value) as solve, \
                patch.object(campaign.fine, "prepare", side_effect=AssertionError("existing pilot must win")):
            _, _, got, proof = driver.finer(self.history)
        self.assertEqual(got["cap_up"], "0")
        self.assertEqual(proof["path"], str(fp.relative_to(self.root)))
        solve.assert_called_once()
        self.runner.run.assert_not_called()

    def test_fine_zero_replaces_positive_raw_maximum(self):
        driver = self.driver()
        driver.c.repair_depth = 0
        self.exported()
        self.solved(increase="1/10")
        driver.raw = Mock(return_value=(result(self.entry, "1/10"), {}, Path(self.entry["export"]),
                                        Path(self.entry["solved"]), "fresh_or_resumed_exact_replay"))
        fe = dict(self.entry, grid=3, grid_spec=[1600, 1152, "1/200"])
        driver.finer = Mock(return_value=({"entry": fe}, {}, dict(result(fe), grid_spec=fe["grid_spec"]),
                                          {"path": "fine-manifest"}))
        driver.process(self.entry)
        rec = driver.state["centres"][campaign.sweep.key_string(self.entry)]
        self.assertEqual(rec["raw_cap_up"], "1/10")
        self.assertEqual(rec["best_residual"], "0")
        self.assertEqual(rec["best_kind"], "fine_grid")

    def test_medium_grid_reuses_radial_refinement_with_original_angular_grid(self):
        self.entry.update(grid=1, nq=256)
        campaign.repair.atomic_json(self.manifest_path, self.manifest)
        driver = self.driver()
        row, path = self.exported()
        self.solved()
        spec = [3200, 256, "1/400"]
        fe = dict(self.entry, grid=3, grid_spec=spec)
        fm = {"entry": fe}
        fp = self.plan / "fine-medium-radial.json"
        campaign.repair.atomic_json(fp, fm)
        parsed = list(campaign.repair.load_exports(path))[0]
        parsed.update(grid=3, grid_spec=spec)
        value = dict(result(fe), grid_spec=spec)
        with patch.object(campaign.fine, "validate", return_value=parsed), \
                patch.object(campaign.fine, "solve", return_value=value), \
                patch.object(campaign.fine, "prepare", side_effect=AssertionError("radial pilot must be reused")):
            got_manifest, _, got_result, _ = driver.finer(self.entry)
        self.assertEqual(got_manifest["entry"]["grid_spec"], spec)
        self.assertEqual(got_result["cap_up"], "0")
        self.runner.run.assert_not_called()

    def test_pause_signal_finishes_current_centre_then_pauses_before_next(self):
        driver = self.driver()
        calls = []
        def process(entry):
            ident = campaign.sweep.key_string(entry)
            calls.append(ident)
            driver.state["centres"][ident].update(status="complete", best_residual="0")
            driver.pause_signal(signal.SIGTERM, None)
        driver.process = process
        self.assertEqual(driver.run(), campaign.PAUSED_EXIT)
        self.assertEqual(len(calls), 1)
        self.assertEqual(driver.state["status"], "paused")
        self.assertEqual(driver.state["actual_exit"], 75)
        self.assertEqual(driver.state["summary"]["completed_centres"], 1)
        self.assertFalse(driver.state["summary"]["is_global_maximum"])

    def test_stop_file_pauses_without_any_child(self):
        driver = self.driver()
        self.config.stop_file.touch()
        self.assertEqual(driver.run(), 75)
        self.runner.run.assert_not_called()
        self.assertEqual(driver.state["summary"]["completed_centres"], 0)

    def test_inconclusive_fine_search_does_not_block_other_stored_centres(self):
        driver = self.driver()
        calls = []
        def process(entry):
            ident = campaign.sweep.key_string(entry)
            calls.append(ident)
            record = driver.state["centres"][ident]
            record["raw_cap_up"] = "1/10" if len(calls) == 1 else "0"
            if len(calls) == 1:
                record.update(status="awaiting_fine_search", best_residual_candidate="1/10")
                raise campaign.FineSearchPaused("exact fine search remains unresolved")
            record.update(status="complete", best_residual="0")
        driver.process = process
        self.assertEqual(driver.run(), 75)
        self.assertEqual(len(calls), 2)
        self.assertEqual(driver.state["phase"], "raw_sweep_complete_repairs_pending")
        self.assertEqual(driver.state["summary"]["raw_checked_centres"], 2)
        self.assertTrue(driver.state["summary"]["is_global_raw_maximum"])
        self.assertEqual(driver.state["summary"]["inconclusive_centres"], 1)
        self.assertFalse(driver.state["summary"]["is_global_maximum"])
        self.assertFalse(driver.state["centres"][calls[0]]["residual_accepted"])

    def test_requested_strict_fine_pause_remains_available(self):
        self.config.continue_inconclusive = False
        driver = self.driver()
        driver.process = Mock(side_effect=campaign.FineSearchPaused("unresolved fine search"))
        self.assertEqual(driver.run(), 75)
        self.assertEqual(driver.process.call_count, 1)
        self.assertEqual(driver.state["phase"], "paused_at_checkpoint")

    def test_surviving_recorded_child_is_not_restarted_or_signalled(self):
        record = {"owned_child": {"pid": 43210, "pgid": 43210}}
        with patch.object(campaign.os, "killpg", return_value=None) as probe, \
                self.assertRaises(campaign.SurvivingJob):
            campaign.check_previous_processes(record)
        probe.assert_called_once_with(43210, 0)

    def test_absent_recorded_child_allows_recovery(self):
        record = {"owned_child": {"pid": 43210, "pgid": 43210}}
        with patch.object(campaign.os, "killpg", side_effect=ProcessLookupError) as probe:
            campaign.check_previous_processes(record)
        probe.assert_called_once_with(43210, 0)

    def test_failed_and_resource_paused_are_distinct_from_complete(self):
        for exc, expected_status, code in [(RuntimeError("compiler failed"), "failed", 1),
                                           (campaign.ResourcePaused("RSS guard"), "paused", 75)]:
            with self.subTest(status=expected_status):
                self.config.progress.unlink(missing_ok=True)
                driver = self.driver()
                driver.process = Mock(side_effect=exc)
                self.assertEqual(driver.run(), code)
                self.assertEqual(driver.state["status"], expected_status)
                self.assertEqual(driver.state["summary"]["completed_centres"], 0)

    def test_complete_accounting_includes_historical_and_new_centres(self):
        driver = self.driver()
        def process(entry):
            driver.state["centres"][campaign.sweep.key_string(entry)].update(status="complete", best_residual="0")
        driver.process = process
        self.assertEqual(driver.run(), 0)
        self.assertEqual(driver.state["summary"]["total_centres"], 2)
        self.assertEqual(driver.state["summary"]["historical_adopted_centres"], 1)
        self.assertEqual(driver.state["summary"]["completed_new_centres"], 1)
        self.assertTrue(driver.state["summary"]["is_global_maximum"])

    def test_changed_helper_fails_closed_without_overwriting_progress(self):
        driver = self.driver()
        driver.update(status="paused")
        original = self.config.progress.read_bytes()
        (self.root / "tools/caps_plan.py").write_text("changed source\n")
        with self.assertRaisesRegex(campaign.sweep.SweepError, "checkpoint source/configuration changed"):
            self.driver()
        self.assertEqual(self.config.progress.read_bytes(), original)

    def test_cannot_coarsen_fine_attempt_below1152(self):
        self.config.fine_nq = 1024
        with self.assertRaisesRegex(ValueError, ">=1152"):
            self.driver()

    def test_owned_runner_uses_one_separate_child_group(self):
        child = FakeChild()
        popen = Mock(return_value=child)
        updates = []
        runner = campaign.OwnedRunner(self.config, lambda **kw: updates.append(kw), popen=popen,
                                      rss=lambda _: 0, sleep=lambda _: None)
        runner.child = child
        with self.assertRaisesRegex(RuntimeError, "second concurrent"):
            runner.run(["never"], "fixture", "12:140:0")
        runner.child = None
        record_path = runner.run(["python", "fixture.py"], "fixture", "12:140:0")
        self.assertTrue(popen.call_args.kwargs["start_new_session"])
        self.assertEqual(popen.call_args.kwargs["env"]["LEAN_NUM_THREADS"], "1")
        record = campaign.read_json(record_path)
        self.assertEqual(record["pgid"], child.pid)
        self.assertEqual(record["actual_exit"], 0)
        self.assertEqual(record["state"], "complete")
        self.assertIsNone(runner.child)

    def test_aggregate_fine_rss_guard_signals_only_owned_group_and_records_actual_exit(self):
        child = FakeChild(polls=100)
        updates, signals = [], []
        def killpg(pgid, sig):
            signals.append((pgid, sig))
            child.code = child.returncode = -15
        runner = campaign.OwnedRunner(self.config, lambda **kw: updates.append(kw),
                                      popen=Mock(return_value=child),
                                      rss=lambda _: self.config.rss_limit + 1 if child.returncode is None else 0,
                                      sleep=lambda _: None)
        with patch.object(campaign.os, "killpg", side_effect=killpg), self.assertRaises(campaign.ResourcePaused):
            runner.run(["lake", "build", "FineFixture"], "fine-export", "12:140:0", fine_grid=True)
        self.assertEqual(signals, [(child.pid, signal.SIGTERM)])
        record = updates[-1]["last_child"]
        self.assertEqual(record["actual_exit"], -15)
        self.assertEqual(record["state"], "resource_paused")
        self.assertGreater(record["peak_aggregate_rss_bytes"], self.config.rss_limit)
        self.assertIsNone(runner.child)

    def test_duplicate_driver_lock_does_not_overwrite_surviving_exit(self):
        self.config.run_dir.mkdir(parents=True)
        exit_path = self.config.run_dir / "actual-exit.txt"
        exit_path.write_text("75\n")
        with patch.object(campaign, "ROOT", self.root), \
                patch.object(campaign.fcntl, "flock", side_effect=BlockingIOError), \
                contextlib.redirect_stderr(io.StringIO()), \
                self.assertRaises(SystemExit):
            campaign.main(["run", "--agent-id", "codex-fixture", "--manifest", str(self.manifest_path),
                           "--run-dir", str(self.config.run_dir)])
        self.assertEqual(exit_path.read_text(), "75\n")


if __name__ == "__main__":
    unittest.main()

#!/usr/bin/env python3
"""One-worker local #87 SEARCH campaign, with exact evidence and graceful pause.

Run this driver in its own process group. All builds/optimizers are separate owned
child process groups, one at a time. SIGTERM/SIGINT request a checkpoint pause
after the current centre; a stop file does the same. Exit codes: complete=0,
failed=1, paused=75. Positive results receive an independently pinned refinement:
3200x256 for medium-grid centres, and1600x1152 for fine-grid centres. Unresolved
searches remain explicitly pending rather than becoming a final maximum.
This is research, not native certificate verification or cache publication.

Example:
  python3 tools/caps_centre_campaign.py run --agent-id codex-15b7 \
    --manifest data/caps-m/plan/centre-sweep-codex-15b7.json

Existing completed exports/solutions are validated and reused. Existing fine
manifests (including fine-14x200 and fine-12x280) are discovered before preparation.
No capPad, cover, certificate grid list, CapsRest, or wiring is changed.
"""
from __future__ import annotations

import argparse
import copy
from dataclasses import dataclass
from datetime import datetime, timezone
from fractions import Fraction as F
import fcntl
import hashlib
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parent))
import caps_centre_fine as fine
import caps_centre_repair as repair
import caps_centre_sweep as sweep

ROOT = Path(__file__).resolve().parents[1]
PAUSED_EXIT = 75
SCHEMA = 1
PURPOSE = "#87 local search; historical adoption is not new verification; final caps verification belongs to CI"


def now():
    return datetime.now(timezone.utc).isoformat()


def read_json(path):
    return json.loads(Path(path).read_text())


def checked_result(exported, result):
    sweep.validate_solution(exported, result, repair.checked_solution)
    checked = repair.checked_solution(exported, result)
    if checked is None:
        raise sweep.SweepError("search has no exact feasible result")
    return checked


def stored_solution(root, manifest, entry, create=False):
    """Validate both newly solved and resumed output; never trust status alone."""
    if sweep.export_record(root, manifest, entry) is None:
        raise sweep.SweepError("stored export missing: " + sweep.key_string(entry))
    exported = list(repair.load_exports(root / entry["export"]))[0]
    repair.validate_export(exported)
    path = root / entry["solved"]
    prov = {"fingerprint": manifest["provenance"]["fingerprint"],
            "export_sha256": sweep.sha(root / entry["export"]),
            "baseline_capPad": manifest["provenance"]["baseline_capPad"],
            "cap_up_convention": manifest["provenance"]["cap_up_convention"]}
    if path.exists():
        rows = read_json(path)
        if not isinstance(rows, list) or len(rows) != 1 or rows[0].get("provenance") != prov:
            raise sweep.SweepError("stale stored solved provenance: " + str(path))
        result = rows[0]
    else:
        if not create:
            raise sweep.SweepError("stored solved result missing: " + str(path))
        import caps_plan
        result = caps_plan.verdict(exported)
        result["provenance"] = prov
        checked_result(exported, result)
        repair.atomic_json(path, [result])
    checked_result(exported, result)
    return exported, result


def repair_fingerprint(export_path, solved_path, depth):
    return {"schema": repair.SCHEMA, "export_sha256": repair.digest(export_path),
            "solved_sha256": repair.digest(solved_path), "tool_sha256": repair.digest(repair.__file__),
            "caps_lmi_sha256": repair.digest(repair.caps_lmi.__file__),
            "config": {"max_depth": depth, "split_constraints": 2, "margin": "1/1000000000",
                       "strategy": "full_interval_cartesian_midpoints"}}


def checked_repair(root, path, exported, baseline, export_path, solved_path, depth):
    """Reconstruct every interval partition and exact leaf before using a residual."""
    state = read_json(root / path)
    ident = [exported[k] for k in ("k", "i", "j", "grid")]
    if (state.get("state") != "complete" or state.get("piece") != ident or
            state.get("fingerprint") != repair_fingerprint(root / export_path, root / solved_path, depth) or
            F(state.get("capPad_unchanged")) != F(exported["capPad"]) or
            F(state.get("baseline_cap_up")) != F(baseline["cap_up"])):
        raise sweep.SweepError("stale/incomplete repair checkpoint: " + str(path))
    attempts = copy.deepcopy(state["attempts"])
    before = copy.deepcopy(attempts)
    def forbidden(*_):
        raise RuntimeError("repair resume attempted an unrecorded optimizer call")
    replay = repair.repair_piece(exported, baseline, max_depth=depth, max_constraints=2,
                                 margin=1e-9, attempts=attempts, solve=forbidden)
    if attempts != before or replay != state.get("result") or replay.get("cap_up") is None:
        raise sweep.SweepError("repair replay is incomplete or disagrees with saved result: " + str(path))
    return replay


def evidence(root, path, **extra):
    path = Path(path)
    if not path.is_absolute():
        path = root / path
    try:
        name = path.relative_to(root).as_posix()
    except ValueError:
        name = str(path)
    return {"path": name, "sha256": sweep.sha(path), **extra}


def historical_result(root, manifest, entry):
    old = entry.get("historical")
    if entry.get("search_status") != "historical_adopted" or not old or not manifest.get("historical_review_note"):
        raise sweep.SweepError("historical result has not been explicitly reviewed/adopted")
    path = root / old["file"]
    if sweep.sha(path) != old["file_sha256"]:
        raise sweep.SweepError("historical solved bytes changed")
    rows = [r for r in read_json(path) if sweep.key(r) == sweep.key(entry) and r.get("grid") == entry["grid"]]
    if len(rows) != 1 or hashlib.sha256(sweep.canonical(rows[0])).hexdigest() != old["result_sha256"]:
        raise sweep.SweepError("historical identity/result hash changed")
    result = rows[0]
    if (result.get("status") not in sweep.SUCCESS or F(result["cap_up"]) < 0 or
            (result["status"] in {"pass", "fixed"} and F(result["cap_up"]) != 0)):
        raise sweep.SweepError("historical result is not a successful search certificate")
    return result


def find_historical_export(root, manifest, entry, result):
    """Replay old matrices when available; keep provenance explicitly historical."""
    nodes = read_json(root / sweep.PIECES)
    node = next(n for n in nodes if (n["k"], n["i"]) == (entry["k"], entry["i"]))
    expected_constraints = node["pieces"][entry["j"]]["cons"]
    # Stored-grid history lives directly in exports/. Research-grid exports in
    # fine/ have their own independent manifests and must not be substituted.
    for path in sorted((root / sweep.PLAN / "exports").glob("*.jsonl")):
        for row in repair.load_exports(path):
            if sweep.key(row) != sweep.key(entry) or row.get("grid") != entry["grid"]:
                continue
            repair.validate_export(row)
            if F(row["capPad"]) != F(manifest["provenance"]["baseline_capPad"]):
                continue
            if F(row["cap"]) != F(node["cap"]) or F(row["s"]) != F(node["s"]):
                continue
            if len(row["cons"]) != len(expected_constraints):
                continue
            # Multipliers may have been optimised historically; region bounds
            # and constraint count may not change. The proposed multipliers are
            # independently checked below on these exact matrices.
            if any([c["lo"], c["hi"]] !=
                   [F(v) if v != "*" else None for v in encoded.split(",")[2:4]]
                   for c, encoded in zip(row["cons"], expected_constraints)):
                continue
            if repair.checked_solution(row, result) is not None:
                return row, path.relative_to(root)
    return None, None


class Paused(Exception):
    pass


class ResourcePaused(Paused):
    pass


class FineSearchPaused(Paused):
    pass


class SurvivingJob(Paused):
    pass


def check_previous_processes(state):
    """Read-only crash guard. A surviving/reused group is never signalled away."""
    child = state.get("owned_child")
    if child is None and state.get("state") == "running" and "controller_pid" in state:
        child = state  # Persistent cross-progress-path child journal.
    if child is not None:
        pgid, pid = child.get("pgid"), child.get("pid")
        if type(pgid) is not int or pgid <= 0 or type(pid) is not int or pid != pgid:
            raise SurvivingJob("recorded owned child PID/PGID is malformed; inspect before resuming")
        try:
            os.killpg(pgid, 0)
        except ProcessLookupError:
            pass
        except PermissionError as exc:
            raise SurvivingJob(f"cannot establish whether recorded child group {pgid} survives; inspect it") from exc
        else:
            raise SurvivingJob(f"recorded child group {pgid} is alive (or its ID was reused); inspect it before resuming; no signal sent")
    controller_pid = state.get("controller_pid", state.get("pid"))
    controller_pgid = state.get("controller_pgid", state.get("pgid"))
    is_running = state.get("status", state.get("state")) == "running"
    if is_running and controller_pid is not None and controller_pid != os.getpid():
        if type(controller_pid) is not int or controller_pid <= 0 or type(controller_pgid) is not int or controller_pgid <= 0:
            raise SurvivingJob("recorded controller PID/PGID is malformed; inspect before resuming")
        try:
            os.kill(controller_pid, 0)
        except ProcessLookupError:
            pass
        except PermissionError as exc:
            raise SurvivingJob(f"cannot establish whether old controller {controller_pid}/{controller_pgid} survives") from exc
        else:
            raise SurvivingJob(f"old controller PID/PGID {controller_pid}/{controller_pgid} is alive or reused; inspect it; no signal sent")


@dataclass
class Config:
    root: Path
    manifest: Path
    progress: Path
    run_dir: Path
    stop_file: Path
    agent_id: str = "codex-15b7"
    fine_tag: str = "Codex15b7Fine"
    fine_nq: int = 1152
    medium_np: int = 3200
    repair_depth: int = 1
    rss_limit: int = 8 * 1024**3
    poll_seconds: float = 2.0
    fine_supplements: tuple[Path, ...] = ()
    continue_inconclusive: bool = True

    def validate(self):
        if self.fine_nq < 1152 or self.repair_depth not in (0, 1):
            raise ValueError("fine nq must be >=1152; optional complete interval repair depth is0 or1")
        if type(self.medium_np) is not int or self.medium_np <= 1600:
            raise ValueError("medium-grid radial refinement must have more than1600 rings")
        if self.rss_limit <= 0 or self.poll_seconds <= 0:
            raise ValueError("RSS limit and polling interval must be positive")


class OwnedRunner:
    """Exactly one child group; signals only groups created by this instance."""
    def __init__(self, config, update, *, popen=subprocess.Popen, rss=None, sleep=time.sleep):
        self.config, self.update = config, update
        self.popen, self.rss, self.sleep = popen, rss or self.group_rss, sleep
        self.child = None
        self.sequence = 0

    @staticmethod
    def group_rss(pgid):
        rows = subprocess.check_output(["ps", "-axo", "pgid=,rss="], text=True)
        return 1024 * sum(int(parts[1]) for row in rows.splitlines()
                          if len(parts := row.split()) == 2 and parts[0] == str(pgid))

    def terminate(self, child):
        # start_new_session below makes this group ours, including any children
        # left by a failed lake process. Never use name-based process selection.
        try:
            os.killpg(child.pid, signal.SIGTERM)
        except ProcessLookupError:
            return
        try:
            child.wait(timeout=10)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL)
            child.wait()
        # Waiting on lake alone does not reap its separate lean children.
        for _ in range(50):
            if not self.rss(child.pid):
                return
            self.sleep(0.2)
        try:
            os.killpg(child.pid, signal.SIGKILL)
        except ProcessLookupError:
            return
        for _ in range(50):
            if not self.rss(child.pid):
                return
            self.sleep(0.2)
        raise RuntimeError("owned child group still has live RSS after TERM/KILL")

    def run(self, argv, phase, ident, *, fine_grid=False):
        if self.child is not None:
            raise RuntimeError("refusing a second concurrent owned child")
        self.config.run_dir.mkdir(parents=True, exist_ok=True)
        self.sequence += 1
        stem = f"child-{os.getpid()}-{self.sequence:05d}-{phase}-{ident.replace(':', 'x')}"
        log = self.config.run_dir / (stem + ".log")
        record_path = self.config.run_dir / (stem + ".json")
        env = dict(os.environ, LEAN_NUM_THREADS="1", OPENBLAS_NUM_THREADS="1", OMP_NUM_THREADS="1",
                   MKL_NUM_THREADS="1", NUMEXPR_NUM_THREADS="1")
        record = {"agent_id": self.config.agent_id, "argv": list(map(str, argv)), "phase": phase,
                  "piece": ident, "started_at_utc": now(), "log": str(log), "fine_grid": fine_grid,
                  "controller_pid": os.getpid(), "controller_pgid": os.getpgrp()}
        journal = self.config.root / "handoff/caps-centre/active-child.json"
        peak, resource_abort, failure, rc = 0, False, None, None
        with log.open("ab") as output:
            child = self.popen(list(map(str, argv)), cwd=self.config.root, env=env,
                               stdout=output, stderr=subprocess.STDOUT, start_new_session=True)
            self.child = child
            record.update(pid=child.pid, pgid=child.pid, state="running")
            repair.atomic_json(journal, record)
            repair.atomic_json(record_path, record)
            self.update(owned_child=dict(record, record_path=str(record_path)))
            try:
                while child.poll() is None:
                    used = self.rss(child.pid)
                    peak = max(peak, used)
                    if fine_grid and used > self.config.rss_limit:
                        resource_abort = True
                        self.terminate(child)
                        break
                    self.sleep(self.config.poll_seconds)
                rc = child.wait()
                if self.rss(child.pid):
                    self.terminate(child)
                    if rc == 0:
                        raise RuntimeError("owned child exited successfully but left group members; group stopped")
            except BaseException as exc:
                failure = exc
                self.terminate(child)
                rc = child.wait()
            finally:
                self.child = None
        record.update(state="resource_paused" if resource_abort else "complete" if rc == 0 and failure is None else "failed",
                      actual_exit=rc, peak_aggregate_rss_bytes=peak, completed_at_utc=now())
        if failure is not None:
            record["error"] = f"{type(failure).__name__}: {failure}"
        repair.atomic_json(record_path, record)
        repair.atomic_json(journal, record)
        self.update(owned_child=None, last_child=record)
        if failure is not None:
            raise failure
        if resource_abort:
            raise ResourcePaused(f"owned fine child group {child.pid} exceeded {self.config.rss_limit} bytes; "
                                 f"partial exports preserved; inspect {record_path}")
        if rc:
            raise RuntimeError(f"owned child failed with actual exit {rc}: {record_path}")
        return record_path


class Campaign:
    def __init__(self, config, *, runner_factory=OwnedRunner):
        config.validate()
        self.c = config
        self.manifest = read_json(config.manifest)
        sweep.check_manifest(config.root, self.manifest)
        self.entries = {sweep.key_string(e): e for e in self.manifest["entries"]}
        if len(self.entries) != len(self.manifest["entries"]):
            raise sweep.SweepError("duplicate campaign centre")
        self.stop_requested = False
        self.stop_reason = None
        self.fingerprint = {"schema": SCHEMA, "manifest_sha256": sweep.sha(config.manifest),
                            "driver_sha256": sweep.sha(__file__),
                            "helpers_sha256": {name: sweep.sha(config.root / "tools" / name) for name in
                                               ("caps_centre_sweep.py", "caps_centre_fine.py",
                                                "caps_centre_repair.py", "caps_lmi.py", "caps_plan.py")},
                            "fine_supplement_sha256": {str(path): sweep.sha(path) for path in config.fine_supplements},
                            "config": {"fine_tag": config.fine_tag, "fine_np": 1600,
                                       "fine_nq": config.fine_nq, "fine_step": "1/200",
                                       "medium_grid": [config.medium_np, 256, str(F(8, config.medium_np))],
                                       "repair_depth": config.repair_depth, "rss_limit": config.rss_limit,
                                       "continue_inconclusive": config.continue_inconclusive}}
        if config.progress.exists():
            self.state = read_json(config.progress)
            if self.state.get("fingerprint") != self.fingerprint:
                raise sweep.SweepError("campaign checkpoint source/configuration changed; use a NEW progress path")
            check_previous_processes(self.state)
            if self.state.get("owned_child") is not None:
                self.state.setdefault("recovery_checks", []).append(
                    {"at_utc": now(), "prior_owned_child": self.state["owned_child"],
                     "group_is_absent": True, "actual_child_exit_is_unknown": True})
        else:
            self.state = {"schema": SCHEMA, "agent_id": config.agent_id, "purpose": PURPOSE,
                          "fingerprint": self.fingerprint, "started_at_utc": now(),
                          "capPad_unchanged": self.manifest["provenance"]["baseline_capPad"],
                          "centres": {ident: {"origin": "historical_adopted" if
                                               e["search_status"] == "historical_adopted" else "fresh_or_resumed",
                                               "status": "pending"} for ident, e in self.entries.items()}}
        journal = config.root / "handoff/caps-centre/active-child.json"
        if journal.exists():
            check_previous_processes(read_json(journal))
        self.runner = runner_factory(config, self.update)

    def update(self, **changes):
        self.state.update(changes, updated_at_utc=now(), pid=os.getpid(), pgid=os.getpgrp())
        records = self.state["centres"]
        completed = [r for r in records.values() if r.get("status") == "complete"]
        values = [(ident, F(r["best_residual"])) for ident, r in records.items()
                  if r.get("status") == "complete"]
        maximum = max((v for _, v in values), default=F(0))
        self.state["summary"] = {"total_centres": len(records), "completed_centres": len(completed),
                                 "historical_adopted_centres": sum(r["origin"] == "historical_adopted" for r in records.values()),
                                 "completed_new_centres": sum(r["origin"] == "fresh_or_resumed" for r in completed),
                                 "positive_best_residuals": sum(v > 0 for _, v in values),
                                 "maximum_best_residual_so_far": str(maximum),
                                 "maximum_nodes": [i for i, v in values if v == maximum],
                                 "is_global_maximum": len(completed) == len(records)}
        raw = [r for r in records.values() if "raw_cap_up" in r]
        self.state["summary"].update(
            raw_checked_centres=len(raw),
            inconclusive_centres=sum(r.get("status") == "repair_pending" for r in records.values()),
            maximum_raw_increase_so_far=str(max((F(r["raw_cap_up"]) for r in raw), default=F(0))),
            is_global_raw_maximum=len(raw) == len(records))
        repair.atomic_json(self.c.progress, self.state)

    def pause_signal(self, signum, _frame):
        self.stop_requested, self.stop_reason = True, signal.Signals(signum).name
        self.update(pause_requested=True, pause_reason=self.stop_reason)

    def check_pause(self):
        if self.stop_requested or self.c.stop_file.exists():
            raise Paused(self.stop_reason or f"stop file {self.c.stop_file}")

    def worker(self, action, *args, fine_grid=False):
        ident = self.state.get("current_piece", "none")
        return self.runner.run([sys.executable, self.c.root / "tools/caps_centre_campaign.py", "_worker", action,
                                "--manifest", self.c.manifest, *map(str, args)], action, ident,
                               fine_grid=fine_grid)

    def raw(self, entry):
        ident, root = sweep.key_string(entry), self.c.root
        if entry["search_status"] == "historical_adopted":
            result = historical_result(root, self.manifest, entry)
            exported, export_path = find_historical_export(root, self.manifest, entry, result)
            return result, exported, export_path, Path(entry["historical"]["file"]), "historical_adopted"
        self.update(phase="exporting_stored_centre")
        if sweep.export_record(root, self.manifest, entry) is None:
            self.runner.run(["lake", "build", entry["module"], "--wfail"], "stored-export", ident)
        if not (root / entry["solved"]).exists():
            self.update(phase="solving_stored_centre")
            self.worker("solve-stored", "--key", ident)
        exported, result = stored_solution(root, self.manifest, entry)
        return result, exported, Path(entry["export"]), Path(entry["solved"]), "fresh_or_resumed_exact_replay"

    def interval_repair(self, entry, exported, baseline, export_path, solved_path, label):
        ident, root = sweep.key_string(entry), self.c.root
        # Each source/configuration gets its own directory. Old checkpoints are
        # never rewritten to pretend they used the current implementation.
        fingerprint = repair_fingerprint(root / export_path, root / solved_path, self.c.repair_depth)
        suffix = hashlib.sha256(sweep.canonical(fingerprint)).hexdigest()[:16]
        folder = sweep.PLAN / "repairs" / "campaign" / suffix
        path = folder / f"repair_centre_{entry['k']}x{entry['i']}_j{entry['j']}_g{exported['grid']}.json"
        for previous in sorted((root / sweep.PLAN / "repairs").rglob(path.name)):
            saved = read_json(previous)
            if saved.get("fingerprint") != fingerprint:
                continue  # Preserve old implementations/configurations without adopting them.
            if saved.get("state") == "complete":
                prior = previous.relative_to(root)
                result = checked_repair(root, prior, exported, baseline, export_path, solved_path, self.c.repair_depth)
                return result, evidence(root, prior, kind=label + "_complete_interval_repair")
            if saved.get("state") == "in_progress":
                path, folder = previous.relative_to(root), previous.parent.relative_to(root)
                break
        if not (root / path).exists() or read_json(root / path).get("state") != "complete":
            self.update(phase="repairing_" + label)
            self.runner.run([sys.executable, "tools/caps_centre_repair.py", export_path, solved_path,
                             "--agent-id", self.c.agent_id, "--output-dir", folder,
                             "--max-depth", str(self.c.repair_depth), "--piece", ident],
                            label + "-repair", ident, fine_grid=exported["grid"] == 3)
        result = checked_repair(root, path, exported, baseline, export_path, solved_path, self.c.repair_depth)
        return result, evidence(root, path, kind=label + "_complete_interval_repair")

    def finer(self, entry):
        root, ident = self.c.root, sweep.key_string(entry)
        wanted_spec = ([self.c.medium_np, 256, str(F(8, self.c.medium_np))] if entry["nq"] == 256
                       else [1600, max(self.c.fine_nq, entry["nq"]), "1/200"])
        candidates = list((root / sweep.PLAN).glob("fine-*.json"))
        candidates += list((root / sweep.PLAN / "fine-campaign").glob("*.json"))
        found = []
        for path in sorted(candidates):
            fm = read_json(path)
            if sweep.key(fm["entry"]) == sweep.key(entry) and fm["entry"].get("grid_spec") == wanted_spec:
                fine.validate(root, fm)
                found.append((path, fm))
        if found:
            # Prefer a completed fine export; the already pinned 14:200 and
            # 12:280 pilots thus win over any unbuilt preparation manifest.
            found.sort(key=lambda pair: (not (root / pair[1]["entry"]["export"]).exists(), str(pair[0])))
            path, fm = found[0]
        else:
            fm = fine.prepare(root, f"{entry['k']}:{entry['i']}", self.c.fine_tag, wanted_spec)
            path = root / sweep.PLAN / "fine-campaign" / f"fine-{entry['k']}x{entry['i']}-{fm['provenance']['fingerprint'][:12]}.json"
            fine.preserve_json(path, fm)
        self.update(phase="exporting_fine_centre", current_fine_manifest=str(path), fine_grid_spec=wanted_spec)
        if fine.validate(root, fm) is None:
            self.runner.run(["lake", "build", fm["entry"]["module"], "--wfail"], "fine-export", ident, fine_grid=True)
        if not (root / fm["entry"]["solved"]).exists():
            self.update(phase="solving_fine_centre")
            self.worker("solve-fine", "--fine-manifest", path, fine_grid=True)
        exported = fine.validate(root, fm)
        if exported is None or not (root / fm["entry"]["solved"]).exists():
            raise sweep.SweepError("fine export/solution missing after child completion")
        result = fine.solve(root, fm)  # Existing result: strict provenance + exact replay, no optimizer.
        primary_path = root / fm["entry"]["solved"]
        candidates = []
        if result.get("status") in sweep.SUCCESS:
            checked_result(exported, result)
            candidates.append((result, primary_path))
        for supplemental in self.c.fine_supplements:
            rows = read_json(supplemental)
            if not isinstance(rows, list):
                raise sweep.SweepError("fine supplement must contain a JSON result list")
            for candidate in rows:
                if sweep.key(candidate) != sweep.key(entry) or candidate.get("grid") != 3:
                    continue
                if candidate.get("provenance") != result["provenance"] or candidate.get("grid_spec") != wanted_spec:
                    raise sweep.SweepError("fine supplemental result does not bind this exact export/source/grid")
                if (not isinstance(candidate.get("method"), str) or not candidate["method"].strip() or
                        not isinstance(candidate.get("retry_provenance"), dict) or not candidate["retry_provenance"]):
                    raise sweep.SweepError("fine supplemental result needs its own method and retry_provenance")
                checked_result(exported, candidate)
                candidates.append((candidate, supplemental))
        if not candidates:
            rec = self.state["centres"][ident]
            rec.update(status="awaiting_fine_search", fine_attempt_complete=False,
                       fine_grid_spec=wanted_spec, fine_search_status=result.get("status"),
                       fine_search_error=result.get("error"),
                       fine_manifest=evidence(root, path), fine_export=evidence(root, fm["entry"]["export"]),
                       fine_primary_result=evidence(root, primary_path))
            self.update()
            raise FineSearchPaused("fine matrices exported but optimizer found no exact feasible certificate for " +
                                   ident + "; original result preserved; supply an independently pinned --fine-supplement")
        result, chosen_path = min(candidates, key=lambda pair: F(pair[0]["cap_up"]))
        self.state["centres"][ident].update(fine_solution_method=result.get("method"),
                                            fine_retry_provenance=result.get("retry_provenance"))
        return fm, exported, result, evidence(root, path, kind="independently_pinned_fine_manifest",
                                             solution=evidence(root, chosen_path, kind="fine_exact_solution"),
                                             primary_result=evidence(root, primary_path))

    def process(self, entry):
        ident, root = sweep.key_string(entry), self.c.root
        sweep.check_manifest(root, self.manifest)
        self.update(current_piece=ident, phase="validating_centre")
        result, exported, export_path, solved_path, origin = self.raw(entry)
        raw_up = F(result["cap_up"])
        record = self.state["centres"][ident]
        record.update(status="in_progress", raw_status=result["status"], raw_cap_up=str(raw_up),
                      raw_origin=origin, raw_result=evidence(root, solved_path), evidence=[])
        if export_path is not None:
            record["raw_export"] = evidence(root, export_path)
            record["raw_exact_replayed"] = True
        else:
            record["raw_exact_replayed"] = False
            record["historical_review_note"] = self.manifest["historical_review_note"]
        best, best_kind = raw_up, "stored_grid" if origin != "historical_adopted" else "historical_adopted"
        record["evidence"].append(record["raw_result"])
        self.update()
        if raw_up > 0:
            record["fine_attempt_complete"] = False
            if self.c.repair_depth and exported is not None:
                repaired, proof = self.interval_repair(entry, exported, result, export_path, solved_path, "stored")
                record["evidence"].append(proof)
                if F(repaired["cap_up"]) < best:
                    best, best_kind = F(repaired["cap_up"]), "stored_interval_partition"
            record.update(best_residual_candidate=str(best), candidate_kind=best_kind,
                          residual_accepted=False)
            self.update()
            # Always try the independently exported fine grid for stored-positive
            # centres, even if an interval repair happened to remove the increase.
            fm, fd, fr, proof = self.finer(entry)
            chosen_solved = Path(proof.get("solution", {"path": fm["entry"]["solved"]})["path"])
            record["evidence"].extend([proof, evidence(root, fm["entry"]["export"], kind="fine_export"),
                                       evidence(root, chosen_solved, kind="fine_exact_solution")])
            record.update(fine_grid_spec=fm["entry"]["grid_spec"], fine_cap_up=fr["cap_up"], fine_attempt_complete=True)
            if F(fr["cap_up"]) < best:
                best, best_kind = F(fr["cap_up"]), "fine_grid"
            if self.c.repair_depth and F(fr["cap_up"]) > 0:
                repaired, proof = self.interval_repair(entry, fd, fr, Path(fm["entry"]["export"]),
                                                        chosen_solved, "fine")
                record["evidence"].append(proof)
                if F(repaired["cap_up"]) < best:
                    best, best_kind = F(repaired["cap_up"]), "fine_interval_partition"
        record.update(status="complete", best_residual=str(best), best_kind=best_kind,
                      completed_at_utc=now(), residual_accepted=True,
                      caution="exact research feasibility; no minimality or native-verification claim")
        self.update(last_completed_piece=ident)

    def run(self):
        self.update(status="running", phase="starting", actual_exit=None, owned_child=None, error=None)
        old_handlers = {sig: signal.getsignal(sig) for sig in (signal.SIGTERM, signal.SIGINT)}
        for sig in old_handlers:
            signal.signal(sig, self.pause_signal)
        try:
            ordered = sorted(self.entries.values(), key=lambda e: (e["search_status"] != "historical_adopted",
                                                                   e["grid"], e["k"], e["i"], e["j"]))
            for entry in ordered:
                self.check_pause()
                try:
                    self.process(entry)  # Revalidate saved certificates before reuse.
                except FineSearchPaused as exc:
                    if not self.c.continue_inconclusive:
                        raise
                    ident = sweep.key_string(entry)
                    self.state["centres"][ident].update(
                        status="repair_pending", residual_accepted=False, repair_pause_reason=str(exc))
                    self.update(phase="deferred_fine_search", last_deferred_piece=ident)
            pending = [ident for ident, record in self.state["centres"].items()
                       if record.get("status") == "repair_pending"]
            if pending:
                self.update(status="paused", phase="raw_sweep_complete_repairs_pending", current_piece=None,
                            pending_repair_nodes=pending, actual_exit=PAUSED_EXIT,
                            pause_reason="All stored centres checked; deferred matrix repairs still require attention")
                return PAUSED_EXIT
            self.update(status="complete", phase="all_centres_accounted", current_piece=None, actual_exit=0)
            return 0
        except Paused as exc:
            self.update(status="paused", phase="paused_at_checkpoint", pause_reason=str(exc), actual_exit=PAUSED_EXIT)
            return PAUSED_EXIT
        except BaseException as exc:
            self.update(status="failed", phase="failed", error=f"{type(exc).__name__}: {exc}", actual_exit=1)
            return 1
        finally:
            for sig, handler in old_handlers.items():
                signal.signal(sig, handler)


def worker_main(args):
    root = ROOT
    if args.action == "solve-stored":
        manifest = read_json(args.manifest)
        sweep.check_manifest(root, manifest)
        matches = [e for e in manifest["entries"] if sweep.key_string(e) == args.key]
        if len(matches) != 1:
            raise sweep.SweepError("worker centre identity missing/ambiguous")
        stored_solution(root, manifest, matches[0], create=True)
    else:
        manifest = read_json(args.fine_manifest)
        result = fine.solve(root, manifest)
        checked_result(fine.validate(root, manifest), result)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="command", required=True)
    run = sub.add_parser("run")
    run.add_argument("--agent-id", required=True)
    run.add_argument("--manifest", type=Path, required=True)
    run.add_argument("--progress", type=Path, default=Path("data/caps-m/plan/centre-campaign-progress-codex-15b7.json"))
    run.add_argument("--run-dir", type=Path, default=Path("handoff/caps-centre/campaign"))
    run.add_argument("--stop-file", type=Path, default=Path("handoff/caps-centre/STOP_REQUESTED"))
    run.add_argument("--fine-tag", default="Codex15b7Fine")
    run.add_argument("--fine-nq", type=int, default=1152)
    run.add_argument("--medium-np", type=int, default=3200,
                     help="Refine radial rings of stored1600x256 centres, retaining their angular grid")
    run.add_argument("--repair-depth", type=int, default=1, choices=(0, 1))
    run.add_argument("--pause-on-fine-failure", action="store_true",
                     help="Pause immediately instead of collecting other centres while retaining an unresolved repair")
    run.add_argument("--fine-supplement", type=Path, action="append", default=[],
                     help="separate exact fine result JSON; bind the original fine provenance/export, never overwrite failed search")
    child = sub.add_parser("_worker")
    child.add_argument("action", choices=("solve-stored", "solve-fine"))
    child.add_argument("--manifest", type=Path, required=True)
    child.add_argument("--key")
    child.add_argument("--fine-manifest", type=Path)
    args = parser.parse_args(argv)
    if args.command == "_worker":
        worker_main(args)
        return 0
    config = Config(ROOT, *(p if p.is_absolute() else ROOT / p for p in
                            (args.manifest, args.progress, args.run_dir, args.stop_file)),
                    agent_id=args.agent_id, fine_tag=args.fine_tag, fine_nq=args.fine_nq,
                    medium_np=args.medium_np,
                    repair_depth=args.repair_depth,
                    fine_supplements=tuple(p if p.is_absolute() else ROOT / p for p in args.fine_supplement),
                    continue_inconclusive=not args.pause_on_fine_failure)
    config.run_dir.mkdir(parents=True, exist_ok=True)
    # Acquire before touching progress/exit, so a duplicate invocation cannot
    # overwrite the surviving driver's evidence.
    common_lock = ROOT / "handoff/caps-centre/campaign.lock"
    common_lock.parent.mkdir(parents=True, exist_ok=True)
    with common_lock.open("a+") as lock:
        try:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError:
            parser.exit(1, "error: another campaign driver owns this run directory\n")
        exit_path = config.run_dir / "actual-exit.txt"
        exit_path.unlink(missing_ok=True)
        (config.run_dir / "driver.pid").write_text(str(os.getpid()) + "\n")
        (config.run_dir / "driver.pgid").write_text(str(os.getpgrp()) + "\n")
        try:
            code = Campaign(config).run()
        except Paused as exc:
            repair.atomic_json(config.run_dir / "startup-paused.json",
                               {"agent_id": config.agent_id, "state": "paused", "actual_exit": PAUSED_EXIT,
                                "reason": str(exc), "at_utc": now()})
            exit_path.write_text(str(PAUSED_EXIT) + "\n")
            print(f"paused: {exc}", file=sys.stderr)
            return PAUSED_EXIT
        except BaseException as exc:
            repair.atomic_json(config.run_dir / "startup-failure.json",
                               {"agent_id": config.agent_id, "state": "failed", "actual_exit": 1,
                                "error": f"{type(exc).__name__}: {exc}", "at_utc": now()})
            exit_path.write_text("1\n")
            parser.exit(1, f"error: {type(exc).__name__}: {exc}\n")
        exit_path.write_text(str(code) + "\n")
        return code


if __name__ == "__main__":
    sys.exit(main())

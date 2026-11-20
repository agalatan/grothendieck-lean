#!/usr/bin/env python3
"""Build the node caps' computational leaves in bounded groups, without certifying a cache.

usage: python3 scripts/build_caps_batches.py [--plan] [--jobs N] [--rss-limit-gib G] [--disk-floor-gib 3] [...]
       python3 scripts/build_caps_batches.py --write-registry    (the same as python3 scripts/caps_stamp.py --write-registry)

The plan comes from the registry data/tail-caps/build.json, which scripts/caps_stamp.py first checks against the sources
(nothing is built if they differ). Groups of at most --jobs modules, each one `lake build` whose Lean children run
single-threaded (a Lake overlay that adds only `weakLeanArgs = ["-j1"]`), in this order:
  pure      the computation closure of the leaves (the checker library, the row data, the ...Defs modules, CapCommon,
            the rows' Data and the pieces' D modules), in topological order;
  native    the leaves CapRowKK/AnchorRangeJJ, CapPieces/C* and CapPieces/R* (one native fact each), by the cost
            estimate of tools/gen_tail_caps.py's plan (recorded in the registry), heaviest first;
  pure      what the row assemblies import beyond that (the node theorems CapPieces/N*, CapCommonFacts and the
            analytic modules of the soundness chain), in topological order; derived from the import graph when
            planning, not registered (none of it is a caps leaf, though an analytic module may hold a native fact);
  assembly  the row assemblies CapRowKK/Assembly (one native fact each, chordsOKRowKK), last: they import the leaves.
Every import of a group's modules is built by an earlier group or within the group, so a group never runs more than
--jobs Lean processes. The groups of the proof layer (the second `pure` phase and the assemblies) hold at most one
module per GIB_PER_PROOF GiB of the RSS limit: their Lean processes load the analytic soundness chain, and the guard
adds up the resident sets (mapped .olean pages included) of all owned processes. --plan prints the plan as JSON
(`groups`: a list of [kind, [modules]]; every group that is not `pure` holds computational leaves) and builds
nothing. The guard pauses (exit 75) on foreign Lean/Lake work, owned RSS above the limit, free disk below the floor, a
stop file, or a Lean child without -j1; re-invoking the same command resumes (Lake reuses exactly what is built;
receipts never skip a target).

The registry is a source/build plan, not a verification receipt. Lake still checks its own traces on every invocation;
the full Grothe build, the axiom report, CI's probe and its cache upload must follow this preparatory step.
"""
from __future__ import annotations

import argparse
from contextlib import contextmanager
from datetime import datetime, timezone
import fcntl
import hashlib
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import subprocess
import sys
import time
import tomllib

from caps_stamp import ClosureError
import caps_stamp
import caps_coexist

ROOT = Path(__file__).resolve().parents[1]
REGISTRY = caps_stamp.REGISTRY


class BuildError(Exception):
    pass


class Pause(BuildError):
    """An owned build was safely paused; exit 75 does not verify its cache."""

    def __init__(self, message, observation=None):
        super().__init__(message)
        self.observation = observation


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def utc() -> str:
    return datetime.now(timezone.utc).isoformat()


def relative_path(value: str) -> str:
    if not isinstance(value, str) or not value or "\\" in value:
        raise BuildError(f"invalid repository path: {value!r}")
    path = Path(value)
    if path.is_absolute() or ".." in path.parts or str(path) != value:
        raise BuildError(f"invalid repository path: {value!r}")
    return value


def module(path: str) -> str:
    relative_path(path)
    if not path.endswith(".lean"):
        raise BuildError(f"expected Lean source: {path}")
    return path[:-5].replace("/", ".")


def source_path(name: str) -> str:
    return name.replace(".", "/") + ".lean"


def validate_registry(root: Path, registry: dict) -> dict:
    """The registry's checked view (caps_stamp.check_registry): it must be exactly what the sources give."""
    return caps_stamp.check_registry(caps_stamp.Sources(root), registry)


def assembly_prerequisites(root: Path, registry: dict) -> list[str]:
    """What the row assemblies import beyond the pure roots and the compute roots, in topological order."""
    order, _ = caps_stamp.graph(caps_stamp.Sources(root), [module(p) for p in registry["assembly_roots"]])
    built = set(registry["pure_roots"]) | set(registry["compute_roots"])
    return [source_path(name) for name in order if source_path(name) not in built]


def groups(registry: dict, jobs: int, prerequisites=(), proof_jobs: int | None = None):
    """(kind, modules) groups in build order (module docstring): at most `jobs` modules each, at most `proof_jobs`
    (default `jobs`) in the groups of the proof layer."""
    proof_jobs = jobs if proof_jobs is None else proof_jobs
    for value in (jobs, proof_jobs):
        if type(value) is not int or value < 1:
            raise BuildError("jobs must be a positive integer")
    cost = registry["leaf_cost_seconds"]
    last = set(registry["assembly_roots"])

    def by_cost(paths):
        return sorted(paths, key=lambda path: (-cost[path], path))

    for kind, paths, size in (("pure", list(registry["pure_roots"]), jobs),
                              ("native", by_cost(p for p in registry["compute_roots"] if p not in last), jobs),
                              ("pure", list(prerequisites), min(jobs, proof_jobs)),
                              ("assembly", by_cost(last), min(jobs, proof_jobs))):
        for i in range(0, len(paths), size):
            yield kind, list(map(module, paths[i:i + size]))


def plan_summary(registry: dict, plan: list, prerequisites: list, jobs: int, proof_jobs: int,
                 registry_sha256: str) -> dict:
    counts = registry["derived_counts"]
    group_counts = {}
    for kind, _ in plan:
        group_counts[kind] = group_counts.get(kind, 0) + 1
    return {"compute_roots": len(registry["compute_roots"]), "pure_roots": len(registry["pure_roots"]),
            "assembly_prerequisites": len(prerequisites),
            "native_kind_counts": {key: counts[key] for key in ("anchor_ranges", "covers", "piece_ranges", "assemblies")},
            "estimated_leaf_seconds": sum(registry["leaf_cost_seconds"].values()),
            "jobs": jobs, "proof_jobs": proof_jobs, "group_counts": group_counts, "groups": plan,
            "source_pins": len(registry["source_sha256"]), "registry_sha256": registry_sha256,
            "resume": "reinvoke unchanged command; Lake reuses exact existing outputs, receipts do not skip targets",
            "full_Grothe_audit_and_cache_upload_required_afterwards": True}


def overlay_bytes(source: bytes) -> bytes:
    """Add only trace-neutral Lean -j1; all other TOML values stay identical."""
    original = tomllib.loads(source.decode())
    if "weakLeanArgs" in original:
        raise BuildError("package weakLeanArgs already exists")

    def check(value):
        if isinstance(value, dict):
            for key, item in value.items():
                if key in {"weakLeanArgs", "moreLeanArgs"}:
                    if not isinstance(item, list) or any(not isinstance(a, str) for a in item):
                        raise BuildError("invalid Lean argument array")
                    if any(a.startswith(("-j", "--threads")) for a in item):
                        raise BuildError("conflicting Lean thread arguments")
                check(item)
        elif isinstance(value, list):
            for item in value:
                check(item)

    check(original)
    result = b'weakLeanArgs = ["-j1"]\n' + source
    parsed = tomllib.loads(result.decode())
    if parsed.pop("weakLeanArgs") != ["-j1"] or parsed != original:
        raise BuildError("Lake overlay changed canonical configuration")
    return result


GIB_PER_LEAF = 3.5        # peak RSS of one single-threaded leaf, with margin (measured: range pieces of the old checker
                          # 3.0 GiB; tail-checker leaves 1.9-2.5 GB on yo, LEAN_STAGE2_DESIGN.md §13)
RSS_HEADROOM_GIB = 6      # memory left to the OS, the runner and Lake itself
GIB_PER_PROOF = 8         # budget of one Lean process of the proof layer (node theorems, soundness chain, assemblies):
                          # not measured; they import far more of Mathlib than the leaves, and the guard counts the
                          # mapped .olean pages of every process


def proof_jobs(jobs: int, rss_limit_gib: float) -> int:
    """Proof-layer modules to build at once: at most `jobs`, and one per GIB_PER_PROOF GiB of the RSS limit."""
    return max(1, min(jobs, int(rss_limit_gib // GIB_PER_PROOF)))


def machine_jobs() -> int:
    """Leaves to run at once: one per usable CPU, but never more than the memory holds (GIB_PER_LEAF each)."""
    try:
        cpus = len(os.sched_getaffinity(0))
    except AttributeError:
        cpus = os.cpu_count() or 1
    return max(1, min(cpus, int((machine_memory_gib() - RSS_HEADROOM_GIB) // GIB_PER_LEAF)))


def machine_memory_gib() -> int:
    try:
        with open("/proc/meminfo") as f:
            for line in f:
                if line.startswith("MemTotal:"):
                    return int(line.split()[1]) // 2**20
    except OSError:
        pass
    return 24 + RSS_HEADROOM_GIB   # unknown platform: the original 24 GiB budget


def process_rows(proc=None) -> list[dict]:
    """Use stable /proc identity/argv, never the display-width-limited ps args column."""
    proc = proc or caps_coexist.ProcFS()
    rows = []
    for row in proc.snapshot():
        if row["comm"] == "lean":
            command = proc.command(row["pid"], expected_start=row["start_ticks"], expected_pgid=row["pgid"])
            if command is None:
                continue
            row = dict(command)
        rows.append(dict(row, args=row.get("args", [])))
    return rows


def group_members(pgid, proc=None):
    """Live owned-group inventory for cleanup, independent of argv/guard failures."""
    return [row["pid"] for row in (proc or caps_coexist.ProcFS()).snapshot() if row["pgid"] == pgid]


def arg_list(value):
    return value.split() if isinstance(value, str) else list(value)


def lean_diagnostic(row):
    argv = arg_list(row.get("args", []))
    shape = []
    for index, value in enumerate(argv):
        if index == 0:
            shape.append(Path(value).name)
        elif re.fullmatch(r"-j(?:\d+)?|--threads(?:=\d+)?|-+[A-Za-z][A-Za-z0-9_-]*", value):
            shape.append(value)
        elif value.endswith((".lean", ".olean", ".json")):
            shape.append("<file:" + Path(value).name[:120] + ">")
        elif value.startswith("Grothe.") and re.fullmatch(r"[A-Za-z0-9_.]+", value):
            shape.append(value[:160])
        else:
            shape.append("<arg>")
    return {"pid": row["pid"], "pgid": row["pgid"], "state": row.get("state", "unknown"),
            "start_ticks": row.get("start_ticks"), "comm": row["comm"],
            "executable": Path(argv[0]).name if argv else None,
            "module": next((Path(value).name for value in argv if value.endswith(".lean")), None),
            "command_source": row.get("command_source", "fixture-or-unavailable"), "argv_shape": shape,
            "thread_flags": [arg for arg in argv if re.fullmatch(r"-j(?:\d+)?|--threads(?:=\d+)?", arg)]}


def observe(root: Path, pgid: int | None, jobs: int, rss_limit: int, disk_floor: int, stop: Path,
            rows=None, free=None, allowed_pids=()) -> dict:
    rows = process_rows() if rows is None else rows
    # A zombie has already closed its files and address space. The Popen parent
    # is reaped separately; an orphaned zombie must not impersonate live work.
    live = [row for row in rows if not row.get("state", "").startswith(("Z", "X"))]
    own = [row for row in live if pgid is not None and row["pgid"] == pgid]
    lean = [row for row in own if row["comm"] == "lean"]
    foreign = [row for row in live if row["comm"] in {"lean", "lake"}
               and row["pgid"] != pgid and row["pid"] != os.getpid() and row["pid"] not in allowed_pids]
    rss = sum(row["rss"] for row in own)
    disk = shutil.disk_usage(root).free if free is None else free
    reason = None
    if stop.exists():
        reason = "owned stop file requested"
    elif foreign:
        reason = "foreign Lean/Lake work is active"
    elif disk < disk_floor:
        reason = "disk free below configured floor"
    elif rss > rss_limit:
        reason = "owned aggregate RSS exceeds configured limit"
    elif len(lean) > jobs:
        reason = "actual Lean concurrency exceeds explicit target budget"
    elif any("-j1" not in arg_list(row["args"]) for row in lean):
        reason = "actual Lean child lacks -j1"
    rejected = foreign if foreign else lean if reason and ("concurrency" in reason or "-j1" in reason) else []
    details = [lean_diagnostic(row) for row in rejected]
    return {"rss_bytes": rss, "disk_free_bytes": disk, "lean_processes": len(lean),
            "owned_pids": [row["pid"] for row in own],
            "owned_zombie_pids": [row["pid"] for row in rows if pgid is not None and row["pgid"] == pgid
                                   and row.get("state", "").startswith(("Z", "X"))],
            "rejected_processes": details, "pause_reason": reason}


def failure_diagnostics(record, log, *, max_bytes=16384, max_lines=40):
    """Expose the original failure and bounded real child output, even if cleanup also failed."""
    print(f"FAILED caps group {record.get('group_index')} ({record['phase']}): {', '.join(record['targets'])}", flush=True)
    print(f"Original failure: {record.get('reason', 'unknown')}", flush=True)
    if record.get("cleanup_error"):
        print(f"Additional owned-cleanup failure: {record['cleanup_error']}", flush=True)
    if record.get("receipt_error"):
        print(f"Additional receipt failure: {record['receipt_error']}", flush=True)
    if record.get("guard_observation"):
        print("Guard observation: " + json.dumps(record["guard_observation"], sort_keys=True), flush=True)
    print(f"Child log tail ({log}; at most {max_bytes} bytes/{max_lines} lines):", flush=True)
    try:
        with log.open("rb") as stream:
            size = stream.seek(0, os.SEEK_END)
            stream.seek(max(0, size - max_bytes))
            lines = stream.read(max_bytes).decode("utf-8", errors="replace").splitlines()[-max_lines:]
        for line in lines:
            print("| " + line, flush=True)
        if not lines:
            print("| (child log is empty)", flush=True)
    except OSError as error:
        print(f"| (cannot read child log: {type(error).__name__}: {error})", flush=True)


def atomic_json(path: Path, value: dict):
    temp = path.with_name(path.name + f".{os.getpid()}.tmp")
    temp.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")
    os.replace(temp, path)


@contextmanager
def build_lock(path: Path):
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.is_symlink():
        raise BuildError("common lock must not be a symlink")
    with path.open("a") as stream:
        try:
            fcntl.flock(stream, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as error:
            raise Pause("another bounded caps controller holds the common lock") from error
        try:
            yield
        finally:
            fcntl.flock(stream, fcntl.LOCK_UN)


class Runner:
    def __init__(self, args, registry, *, popen=subprocess.Popen, watch=observe, killpg=os.killpg,
                 clock=time.monotonic, sleep=time.sleep, validate=validate_registry, members=group_members):
        self.args, self.registry = args, registry
        self.popen, self.watch, self.killpg = popen, watch, killpg
        self.members = members
        self.clock, self.sleep, self.validate = clock, sleep, validate
        self.child = None
        self.coexist = getattr(args, "coexist_session", None)
        self.interrupted = False
        self.overlay_data = overlay_bytes((args.root / "lakefile.toml").read_bytes())
        self.overlay = args.run_dir / "lake-single-lean.toml"
        self.source_stats = None

    def overlay_is_regular(self):
        """The overlay is written and read only as a regular file: never through a symlink."""
        if self.overlay.is_symlink() or (self.overlay.exists() and not self.overlay.is_file()):
            raise BuildError("owned Lake overlay must be a regular file, not a symlink")

    def adopt_overlay(self):
        """The overlay is ours alone, but an orphaned child of a killed controller may still be reading
        it: a stale one (an older lakefile) is replaced only after the ownership/resource preflight
        finds no foreign Lean/Lake work, and never through a symlink."""
        self.overlay_is_regular()
        if not self.overlay.exists() or self.overlay.read_bytes() == self.overlay_data:
            return
        result = self.observation()
        if result["pause_reason"]:
            raise Pause("stale owned Lake overlay left untouched: " + result["pause_reason"], result)
        print("Replacing the stale owned Lake overlay of an earlier run", flush=True)
        self.overlay.write_bytes(self.overlay_data)

    def observation(self, pgid=None) -> dict:
        """The ownership/resource preflight: foreign Lean/Lake work, RSS, disk, stop file, concurrency."""
        if self.coexist is None:
            return self.watch(self.args.root, pgid, self.args.jobs,
                              int(self.args.rss_limit_gib * 2**30), int(self.args.disk_floor_gib * 2**30),
                              self.args.stop_file)
        rows, allowed = self.coexist.authorized_rows(process_rows(self.coexist.proc), pgid)
        result = observe(self.args.root, pgid, self.args.jobs,
                         int(self.args.rss_limit_gib * 2**30), int(self.args.disk_floor_gib * 2**30),
                         self.args.stop_file, rows=rows, allowed_pids=allowed)
        if self.coexist.proc.mem_available() < 3 * 2**30:
            result["pause_reason"] = "machine memory headroom below3GiB"
        return result

    def check(self, pgid=None, *, full=False):
        # Hash/parse the whole caps source once at the start and once at the end (full=True): a few
        # seconds each. Between groups and while polling, the inode/mtime/ctime/size of every pinned
        # source must be unchanged, which costs milliseconds.
        if full or self.source_stats is None:
            self.validate(self.args.root, self.registry)
        stats = {}
        for relative in self.registry["source_sha256"]:
            stat = (self.args.root / relative).stat()
            stats[relative] = (stat.st_dev, stat.st_ino, stat.st_size, stat.st_mtime_ns, stat.st_ctime_ns)
        if self.source_stats is not None and stats != self.source_stats:
            raise BuildError("pinned source metadata changed beneath bounded build")
        self.source_stats = stats
        if sha(self.args.registry.read_bytes()) != self.args.registry_sha256:
            raise BuildError("build registry changed beneath bounded build")
        self.overlay_is_regular()
        if self.overlay.exists() and self.overlay.read_bytes() != self.overlay_data:
            raise BuildError("owned Lake overlay changed")
        if self.interrupted:
            raise Pause("controller received a stop signal")
        result = self.observation(pgid)
        if result["pause_reason"]:
            raise Pause(result["pause_reason"], result)
        return result

    def stop_child(self):
        if self.child is None:
            return
        # The group is the start_new_session child we just spawned, never a PID read from disk.
        def live_members():
            # poll() calls waitpid(WNOHANG), so the direct child cannot remain a
            # zombie solely because this cleanup loop forgot to reap it.
            self.child.poll()
            return self.members(self.child.pid)

        remaining = live_members()
        if not remaining:
            self.child.wait(timeout=1)
            return
        for sig in (signal.SIGTERM, signal.SIGKILL):
            try:
                self.killpg(self.child.pid, sig)
            except ProcessLookupError:
                pass
            deadline = self.clock() + (10 if sig == signal.SIGTERM else 5)
            while self.clock() < deadline:
                remaining = live_members()
                if not remaining:
                    self.child.wait(timeout=1)
                    return
                self.sleep(0.2)
        raise BuildError(f"owned child group did not exit after termination; live pids {remaining}")

    def run_group(self, phase, targets, index):
        if self.child is not None:
            raise BuildError("refusing overlapping child groups")
        self.check()
        self.args.run_dir.mkdir(parents=True, exist_ok=True)
        self.overlay_is_regular()
        if not self.overlay.exists():
            self.overlay.write_bytes(self.overlay_data)
        argv = [self.args.lake, "-f", str(self.overlay.relative_to(self.args.root)), "build", *targets]
        stem = f"{os.getpid()}-{index:05d}-{phase}"
        log, receipt = self.args.run_dir / (stem + ".log"), self.args.run_dir / (stem + ".json")
        record = {"group_index": index, "phase": phase, "targets": targets, "argv": argv, "started_at_utc": utc(),
                  "controller_pid": os.getpid(), "state": "starting", "peak_rss_bytes": 0,
                  "peak_lean_processes": 0, "registry_sha256": self.args.registry_sha256,
                  "overlay_sha256": sha(self.overlay_data), "lake_parent_threads": self.args.jobs,
                  "lean_child_threads": 1, "verification_scope": "leaf build only; no verified cache claim"}
        env = dict(os.environ, LEAN_NUM_THREADS=str(self.args.jobs), OPENBLAS_NUM_THREADS="1",
                   OMP_NUM_THREADS="1", MKL_NUM_THREADS="1", NUMEXPR_NUM_THREADS="1",
                   PYTHONDONTWRITEBYTECODE="1")
        start, failure = self.clock(), None
        try:
            with log.open("xb") as stream:
                launch = self.popen if self.coexist is None else lambda *a, **k: self.coexist.launch_registered(self.popen, *a, **k)
                self.child = launch(argv, cwd=self.args.root, env=env, stdout=stream,
                                    stderr=subprocess.STDOUT, start_new_session=True)
                record.update(state="running", owned_pgid=self.child.pid)
                atomic_json(receipt, record)
                while self.child.poll() is None:
                    observation = self.check(self.child.pid)
                    record["peak_rss_bytes"] = max(record["peak_rss_bytes"], observation["rss_bytes"])
                    record["peak_lean_processes"] = max(record["peak_lean_processes"], observation["lean_processes"])
                    self.sleep(self.args.poll_seconds)
                record["exit_code"] = self.child.wait()
                self.check(self.child.pid)
                remaining = self.members(self.child.pid)
                if remaining:
                    raise BuildError("Lake exited while owned descendants remain")
                if record["exit_code"] != 0:
                    raise BuildError(f"{phase} Lake group failed with exit {record['exit_code']}; see {log}")
                record["state"] = "complete"
        except BaseException as error:
            failure = error
            record.update(state="paused" if isinstance(error, Pause) else "failed", reason=str(error))
            if isinstance(error, Pause) and error.observation:
                observation = error.observation
                record["guard_observation"] = observation
                record["peak_rss_bytes"] = max(record["peak_rss_bytes"], observation["rss_bytes"])
                record["peak_lean_processes"] = max(record["peak_lean_processes"], observation["lean_processes"])
            if self.child is not None:
                try:
                    self.stop_child()
                except BaseException as cleanup_error:
                    record["cleanup_error"] = str(cleanup_error)
                    record["state"] = "failed"
                    failure = BuildError(f"{error}; owned cleanup also failed: {cleanup_error}")
                record["exit_code"] = self.child.poll()
        finally:
            if self.coexist is not None and self.child is not None:
                try:
                    self.coexist.clear_child()
                except BaseException as cleanup_error:
                    record["cleanup_error"] = (record.get("cleanup_error", "") + "; " + str(cleanup_error)).lstrip("; ")
                    record["state"] = "failed"
                    failure = BuildError(f"{record.get('reason', 'coexist handoff failed')}; {record['cleanup_error']}")
            self.child = None
            record.update(finished_at_utc=utc(), elapsed_seconds=self.clock() - start)
            try:
                atomic_json(receipt, record)
            except BaseException as receipt_error:
                record["receipt_error"] = str(receipt_error)
                failure = failure or BuildError("could not write closed group receipt: " + str(receipt_error))
            if failure:
                record.setdefault("reason", str(failure))
                failure_diagnostics(record, log)
        if failure:
            raise failure
        return record

    def finish_shared(self):
        if self.coexist is None:
            return
        # The same transaction lock protects research spawn+registration. Once
        # this write completes no new research child can race the absence check.
        self.coexist.publish(phase="exclusive", child_pgid=None)
        deadline = self.clock() + 120
        while self.coexist.peer_child_present():
            if self.interrupted or self.args.stop_file.exists():
                raise Pause("stop requested during exclusive handoff")
            if self.clock() >= deadline:
                raise Pause("research child did not yield within exclusive handoff deadline")
            self.sleep(1)
        print("Shared caps phase ended; research child group absent. Full Grothe may proceed exclusively.", flush=True)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--root", type=Path, default=ROOT)
    parser.add_argument("--registry", type=Path, default=Path(REGISTRY))
    modes = parser.add_mutually_exclusive_group()
    modes.add_argument("--plan", action="store_true", help="validate and print groups; perform no builds or writes")
    modes.add_argument("--write-registry", action="store_true",
                       help="regenerate the registry from the sources (scripts/caps_stamp.py --write-registry)")
    parser.add_argument("--jobs", type=int, default=None,
                        help=f"leaves built at once (default: usable CPUs, at most one per {GIB_PER_LEAF} GiB of RAM "
                             f"beyond {RSS_HEADROOM_GIB} GiB headroom)")
    parser.add_argument("--rss-limit-gib", type=float, default=None,
                        help=f"pause when the owned leaves exceed this aggregate RSS (default: RAM minus {RSS_HEADROOM_GIB} GiB)")
    parser.add_argument("--disk-floor-gib", type=float, default=3)
    parser.add_argument("--max-batches", type=int, default=0, help="pause after N complete groups; 0 means the whole plan")
    parser.add_argument("--run-dir", type=Path, default=Path(".lake/caps-batches"))
    parser.add_argument("--stop-file", type=Path, default=Path(".lake/CAPS_BATCH_STOP"))
    parser.add_argument("--lake", default="lake")
    parser.add_argument("--poll-seconds", type=float, default=1)
    parser.add_argument("--coexist-dir", type=Path, help="optional reviewed CI20/research8 control directory")
    parser.add_argument("--research-root", type=Path, help="exact registered research checkout for coexist mode")
    args = parser.parse_args(argv)
    try:
        args.root = args.root.resolve()
        for field in ("registry", "run_dir", "stop_file"):
            path = getattr(args, field)
            if path.is_absolute():
                path.relative_to(args.root)
            else:
                relative_path(str(path))
                path = args.root / path
            setattr(args, field, path)
        for path in (args.registry, args.run_dir, args.stop_file):
            if not path.resolve().is_relative_to(args.root) or path.is_symlink():
                raise BuildError("registry/run/stop paths must stay inside the checkout without symlinks")
        for path in (args.run_dir, args.stop_file):
            if path.relative_to(args.root).parts[0] != ".lake":
                raise BuildError("owned run/stop paths must be under .lake")
        registry_name = args.registry.relative_to(args.root).as_posix()
        if args.write_registry:
            view = caps_stamp.write_registry(args.root, rel=registry_name)
            print(f"Wrote {registry_name}: {len(view['compute_roots'])} compute roots; "
                  "no Lean build or verification performed")
            return 0
        if args.jobs is None:
            args.jobs = machine_jobs()
        if args.rss_limit_gib is None:
            args.rss_limit_gib = max(GIB_PER_LEAF, machine_memory_gib() - RSS_HEADROOM_GIB)
        if (not all(map(math.isfinite, (args.rss_limit_gib, args.disk_floor_gib, args.poll_seconds)))
                or not (0 < args.rss_limit_gib <= machine_memory_gib()) or args.disk_floor_gib < 3
                or args.poll_seconds <= 0 or args.max_batches < 0 or args.jobs < 1):
            raise BuildError("require RSS in (0, RAM] GiB, disk floor >= 3 GiB, positive polling interval and jobs >= 1")
        data = args.registry.read_bytes()
        args.registry_sha256 = sha(data)
        registry = validate_registry(args.root, caps_stamp.parse_json(data, registry_name))
        prerequisites = assembly_prerequisites(args.root, registry)
        layer_jobs = proof_jobs(args.jobs, args.rss_limit_gib)
        plan = list(groups(registry, args.jobs, prerequisites, layer_jobs))
        if args.plan:
            print(json.dumps(plan_summary(registry, plan, prerequisites, args.jobs, layer_jobs, args.registry_sha256),
                             indent=2))
            return 0
        if not sys.platform.startswith("linux"):
            raise BuildError("actual bounded builds are supported only on the Linux droplet/CI; use --plan here")
        args.coexist_session = None
        if bool(args.coexist_dir) != bool(args.research_root):
            raise BuildError("coexist mode requires both --coexist-dir and --research-root")
        if args.coexist_dir:
            args.coexist_session = caps_coexist.Coexist(args.coexist_dir, role="ci", root=args.root,
                jobs=args.jobs, rss_limit_gib=args.rss_limit_gib, expected_ci=caps_coexist.github_identity(),
                research_root=args.research_root)
        runner = Runner(args, registry)
        previous = {}
        for sig in (signal.SIGTERM, signal.SIGINT):
            previous[sig] = signal.signal(sig, lambda *_: setattr(runner, "interrupted", True))
        try:
            with build_lock(args.root / ".lake/caps-batches.lock"):
                runner.adopt_overlay()
                if runner.coexist is not None:
                    runner.coexist.publish(phase="shared", child_pgid=None)
                for index, (phase, targets) in enumerate(plan, 1):
                    runner.run_group(phase, targets, index)
                    print(f"Complete group {index}/{len(plan)} ({phase}): {', '.join(targets)}", flush=True)
                    if args.max_batches and index >= args.max_batches and index < len(plan):
                        raise Pause("requested batch boundary reached; later invocations reuse Lake outputs")
                runner.check(full=True)
                runner.finish_shared()
        finally:
            if runner.coexist is not None and runner.coexist.current is not None:
                runner.coexist.close()
            for sig, handler in previous.items():
                signal.signal(sig, handler)
        print("Registered leaves and row assemblies built. The full Grothe build, the axiom report, the Bridge probe "
              "and the cache upload remain required.")
        return 0
    except Pause as error:
        print(f"PAUSED: {error}", file=sys.stderr)
        return 75
    except (BuildError, ClosureError, OSError, ValueError, KeyError, TypeError) as error:
        print(f"FAIL: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())

#!/usr/bin/env python3
"""Build the registered caps leaves in bounded groups, without certifying a cache.

The registry is a source/build plan, not a verification receipt. Lake still checks
its own traces on every invocation. The ordinary full Grothe build, strict audit,
Bridge probe and successful Actions upload must follow this preparatory step.
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

from caps_stamp import ClosureError, imports_of, is_project
import caps_coexist

ROOT = Path(__file__).resolve().parents[1]
REGISTRY = "data/caps-m/plan/row-certificates/row12-build.json"
OLD_ROWS = (*range(12), 16, 17, 18)
DIRECT = ["Grothe/LowerAnalytic/CapNodes.lean", "Grothe/LowerAnalytic/CapRow12/Assembly.lean"]
CONFIG = ["lakefile.toml", "lake-manifest.json", "lean-toolchain"]
EXECUTION = ["scripts/build_caps_batches.py", "scripts/caps_stamp.py", "scripts/caps_coexist.py"]
FORMAT = "caps-bounded-build-v1"


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


def lean_code(text: str) -> str:
    """Remove nested comments and strings before looking for native tactics."""
    out, i, depth, quoted = [], 0, 0, False
    while i < len(text):
        if depth:
            if text.startswith("/-", i):
                depth += 1
                i += 2
            elif text.startswith("-/", i):
                depth -= 1
                i += 2
            else:
                i += 1
        elif quoted:
            if text[i] == "\\":
                i += 2
            elif text[i] == '"':
                quoted = False
                i += 1
                out.append(" ")
            else:
                i += 1
        elif text.startswith("--", i):
            end = text.find("\n", i)
            i = len(text) if end < 0 else end
        elif text.startswith("/-", i):
            depth = 1
            i += 2
            out.append(" ")
        elif text[i] == '"':
            quoted = True
            i += 1
            out.append(" ")
        else:
            out.append(text[i])
            i += 1
    if depth or quoted:
        raise BuildError("unterminated Lean comment/string")
    return "".join(out)


class Graph:
    def __init__(self, root: Path, overlay: Path | None = None):
        self.root, self.overlay = root, overlay
        self.dependencies: dict[str, list[str]] = {}
        self.native: dict[str, bool] = {}

    def path(self, relative: str) -> Path:
        relative_path(relative)
        candidate = self.overlay / relative if self.overlay else None
        path = candidate if candidate and candidate.is_file() else self.root / relative
        if not path.is_file() or path.is_symlink():
            raise BuildError(f"missing or symlinked source: {relative}")
        return path

    def load(self, name: str) -> None:
        if name in self.dependencies:
            return
        path = self.path(source_path(name))
        self.dependencies[name] = [m for m in imports_of(path) if is_project(m)]
        self.native[name] = bool(re.search(r"\bnative_decide\b", lean_code(path.read_text())))
        for imported in self.dependencies[name]:
            self.load(imported)

    def ordered(self, roots: list[str]) -> list[str]:
        result, active, done = [], set(), set()

        def visit(name):
            if name in active:
                raise BuildError(f"project import cycle at {name}")
            if name in done:
                return
            self.load(name)
            active.add(name)
            for dependency in self.dependencies[name]:
                visit(dependency)
            active.remove(name)
            done.add(name)
            result.append(name)

        for name in roots:
            visit(name)
        return result


def expected_roots(root: Path) -> list[str]:
    plan = root / "data/caps-m/plan/row-certificates"
    generation = json.loads((plan / "row12-generation.json").read_text())
    pieces = json.loads((plan / "row12-pieces.json").read_text())
    anchors = json.loads((plan / "row12-anchors.json").read_text())
    chunk, span = generation["piece_chunk"], generation["anchor_range_size"]
    if generation["row"] != 12 or chunk != 4 or span != 16:
        raise BuildError("unexpected Row12 generation profile")
    if len(pieces) != 88 or len({p["i"] for p in pieces}) != 88:
        raise BuildError("expected 88 distinct Row12 localized nodes")
    roots = [f"Grothe/LowerAnalytic/CapRow{k:02d}.lean" for k in OLD_ROWS]
    roots += [f"Grothe/LowerAnalytic/CapPieces/C12x{p['i']}.lean" for p in pieces]
    roots += [f"Grothe/LowerAnalytic/CapPieces/R12x{p['i']}_{i}.lean"
              for p in pieces for i in range(math.ceil(len(p["pieces"]) / chunk))]
    roots += [f"Grothe/LowerAnalytic/CapRow12/AnchorRange{i:02d}.lean"
              for i in range(math.ceil(anchors["census"]["nodes"] / span))]
    if len(roots) != 1322:
        raise BuildError(f"expected 15 + 1307 compute roots, got {len(roots)}")
    return roots


def make_registry(root: Path, overlay: Path | None = None) -> dict:
    roots = expected_roots(root)
    graph = Graph(root, overlay)
    heavy = set(map(module, roots))
    ordered = graph.ordered(["GrotheCapsKernel", *map(module, roots)])
    for name in ordered:
        if graph.native[name] != (name in heavy):
            raise BuildError(f"unregistered native fact or non-native compute root: {name}")
        if name in heavy and any(dep in heavy for dep in graph.ordered(graph.dependencies[name])):
            raise BuildError(f"compute roots must be independent leaves: {name}")
    pure = [source_path(name) for name in ordered if name not in heavy]
    files = sorted(set(roots + pure + DIRECT + CONFIG))
    return {"format": FORMAT, "row": 12, "scope": "preparatory native leaf build; full Grothe/audit still required",
            "compute_roots": roots, "direct_hash_roots": DIRECT, "pure_roots": pure,
            "source_sha256": {path: sha(graph.path(path).read_bytes()) for path in files},
            "execution_source_sha256": {path: sha((root / path).read_bytes()) for path in EXECUTION},
            "compute_count": 1322, "row12_compute_count": 1307,
            "native_kind_counts": {"existing_row_modules": 15, "row12_coverage_leaves": 88,
                                   "row12_piece_range_leaves": 1194, "row12_anchor_range_leaves": 25},
            "max_parallel_leaves": 2, "lean_child_threads": 1}


def validate_registry(root: Path, registry: dict, *, census: bool = True) -> None:
    if registry.get("format") != FORMAT or registry.get("row") != 12:
        raise BuildError("unsupported caps build registry")
    roots, pure = registry.get("compute_roots"), registry.get("pure_roots")
    if not isinstance(roots, list) or not isinstance(pure, list) or not roots:
        raise BuildError("missing compute/pure roots")
    if len(set(roots + pure)) != len(roots + pure):
        raise BuildError("duplicate or overlapping caps build roots")
    if registry.get("direct_hash_roots") != DIRECT:
        raise BuildError("incorrect direct source boundary")
    if registry.get("max_parallel_leaves") != 2 or registry.get("lean_child_threads") != 1:
        raise BuildError("unsupported concurrency profile")
    if census and roots != expected_roots(root):
        raise BuildError("compute roots disagree with tracked Row12 generation inputs")
    pins = registry.get("source_sha256")
    if not isinstance(pins, dict) or set(pins) != set(roots + pure + DIRECT + CONFIG):
        raise BuildError("source pin inventory mismatch")
    execution = registry.get("execution_source_sha256")
    if not isinstance(execution, dict) or set(execution) != set(EXECUTION):
        raise BuildError("execution source pin inventory mismatch")
    for path, digest in {**pins, **execution}.items():
        relative_path(path)
        target = root / path
        if not re.fullmatch("[0-9a-f]{64}", digest) or not target.is_file() or target.is_symlink():
            raise BuildError(f"invalid pinned source: {path}")
        if sha(target.read_bytes()) != digest:
            raise BuildError(f"source changed: {path}; regenerate/review the build registry")
    graph = Graph(root)
    heavy = set(map(module, roots))
    actual = graph.ordered(["GrotheCapsKernel", *map(module, roots)])
    if [source_path(name) for name in actual if name not in heavy] != pure:
        raise BuildError("pure prerequisite closure/order mismatch")
    for name in actual:
        if graph.native[name] != (name in heavy):
            raise BuildError(f"hidden unregistered native import or invalid compute root: {name}")
        if name in heavy and any(dep in heavy for dep in graph.ordered(graph.dependencies[name])):
            raise BuildError(f"dependent native leaves: {name}")


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


def groups(registry: dict, jobs: int):
    if jobs not in (1, 2):
        raise BuildError("jobs must be 1 or 2")
    for phase, roots in (("pure", registry["pure_roots"]), ("native", registry["compute_roots"])):
        for i in range(0, len(roots), jobs):
            yield phase, list(map(module, roots[i:i + jobs]))


def process_rows() -> list[dict]:
    result = subprocess.run(["ps", "-eo", "pid=,pgid=,rss=,stat=,comm=,args="], check=True,
                            text=True, stdout=subprocess.PIPE).stdout
    rows = []
    for line in result.splitlines():
        fields = line.split(None, 5)
        if len(fields) >= 5:
            if fields[3].startswith(("Z", "X")):
                continue
            rows.append({"pid": int(fields[0]), "pgid": int(fields[1]), "rss": int(fields[2]) * 1024,
                         "state": fields[3], "comm": Path(fields[4]).name, "args": fields[5] if len(fields) == 6 else ""})
    return rows


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
    elif any("-j1" not in row["args"].split() for row in lean):
        reason = "actual Lean child lacks -j1"
    rejected = foreign if foreign else lean if reason and ("concurrency" in reason or "-j1" in reason) else []
    details = [{"pid": row["pid"], "pgid": row["pgid"], "state": row.get("state", "unknown"),
                "comm": row["comm"], "thread_flags": [arg for arg in row.get("args", "").split()
                    if re.fullmatch(r"-j(?:\d+)?|--threads(?:=\d+)?", arg)]} for row in rejected]
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
                 clock=time.monotonic, sleep=time.sleep, validate=validate_registry):
        self.args, self.registry = args, registry
        self.popen, self.watch, self.killpg = popen, watch, killpg
        self.clock, self.sleep, self.validate = clock, sleep, validate
        self.child = None
        self.coexist = getattr(args, "coexist_session", None)
        self.interrupted = False
        self.overlay_data = overlay_bytes((args.root / "lakefile.toml").read_bytes())
        self.overlay = args.run_dir / "lake-single-lean.toml"
        self.source_stats = None

    def check(self, pgid=None, *, full=False):
        # Hash/parse at child boundaries; polling checks stable inode/mtime/ctime/size.
        # This avoids repeatedly parsing the whole certificate source during a Lean check.
        if full or self.source_stats is None:
            self.validate(self.args.root, self.registry)
        stats = {}
        for relative in {*self.registry["source_sha256"], *self.registry["execution_source_sha256"]}:
            stat = (self.args.root / relative).stat()
            stats[relative] = (stat.st_dev, stat.st_ino, stat.st_size, stat.st_mtime_ns, stat.st_ctime_ns)
        if self.source_stats is not None and stats != self.source_stats:
            raise BuildError("pinned source metadata changed beneath bounded build")
        self.source_stats = stats
        if sha(self.args.registry.read_bytes()) != self.args.registry_sha256:
            raise BuildError("build registry changed beneath bounded build")
        if self.overlay.exists() and self.overlay.read_bytes() != self.overlay_data:
            raise BuildError("owned Lake overlay changed")
        if self.interrupted:
            raise Pause("controller received a stop signal")
        if self.coexist is None:
            result = self.watch(self.args.root, pgid, self.args.jobs,
                                int(self.args.rss_limit_gib * 2**30), int(self.args.disk_floor_gib * 2**30),
                                self.args.stop_file)
        else:
            rows = process_rows()
            allowed = self.coexist.authorized_foreign(rows, pgid)
            result = observe(self.args.root, pgid, self.args.jobs,
                             int(self.args.rss_limit_gib * 2**30), int(self.args.disk_floor_gib * 2**30),
                             self.args.stop_file, rows=rows, allowed_pids=allowed)
            if self.coexist.proc.mem_available() < 3 * 2**30:
                result["pause_reason"] = "machine memory headroom below3GiB"
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
            return self.watch(self.args.root, self.child.pid, self.args.jobs,
                              2**63, 0, self.args.stop_file)["owned_pids"]

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
        self.check(full=True)
        self.args.run_dir.mkdir(parents=True, exist_ok=True)
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
                self.check(self.child.pid, full=True)
                remaining = self.watch(self.args.root, self.child.pid, self.args.jobs,
                                       2**63, 0, self.args.stop_file)["owned_pids"]
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
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False)
    parser.add_argument("--root", type=Path, default=ROOT)
    parser.add_argument("--registry", type=Path, default=Path(REGISTRY))
    modes = parser.add_mutually_exclusive_group()
    modes.add_argument("--plan", action="store_true", help="validate and print groups; perform no builds or writes")
    modes.add_argument("--write-registry", action="store_true", help="regenerate the reviewed source/build inventory")
    parser.add_argument("--source-overlay", type=Path, help="registry preparation only: read candidate sources from this overlay")
    parser.add_argument("--jobs", type=int, choices=(1, 2), default=2)
    parser.add_argument("--rss-limit-gib", type=float, default=24)
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
        if args.source_overlay and not args.write_registry:
            raise BuildError("source overlay is allowed only when writing a preparation registry")
        if args.write_registry:
            value = make_registry(args.root, args.source_overlay)
            args.registry.parent.mkdir(parents=True, exist_ok=True)
            atomic_json(args.registry, value)
            print(f"Wrote {len(value['compute_roots'])} compute roots; no Lean build or verification performed")
            return 0
        if (not all(map(math.isfinite, (args.rss_limit_gib, args.disk_floor_gib, args.poll_seconds)))
                or not (0 < args.rss_limit_gib <= 24) or args.disk_floor_gib < 3
                or args.poll_seconds <= 0 or args.max_batches < 0):
            raise BuildError("require RSS in (0,24] GiB, disk floor >= 3 GiB and positive polling interval")
        data = args.registry.read_bytes()
        registry = json.loads(data)
        args.registry_sha256 = sha(data)
        validate_registry(args.root, registry)
        plan = list(groups(registry, args.jobs))
        if args.plan:
            print(json.dumps({"compute_roots": len(registry["compute_roots"]),
                              "pure_roots": len(registry["pure_roots"]), "groups": plan,
                              "native_kind_counts": registry.get("native_kind_counts", {}),
                              "source_pins": len(registry["source_sha256"]),
                              "registry_sha256": args.registry_sha256,
                              "resume": "reinvoke unchanged command; Lake reuses exact existing outputs, receipts do not skip targets",
                              "full_Grothe_audit_and_cache_upload_required_afterwards": True}, indent=2))
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
                if runner.coexist is not None:
                    runner.coexist.publish(phase="shared", child_pgid=None)
                for index, (phase, targets) in enumerate(plan, 1):
                    runner.run_group(phase, targets, index)
                    print(f"Complete group {index}/{len(plan)} ({phase}): {', '.join(targets)}", flush=True)
                    if args.max_batches and index >= args.max_batches and index < len(plan):
                        raise Pause("requested batch boundary reached; later invocations reuse Lake outputs")
                runner.finish_shared()
        finally:
            if runner.coexist is not None and runner.coexist.current is not None:
                runner.coexist.close()
            for sig, handler in previous.items():
                signal.signal(sig, handler)
        print("Registered leaves built. Full Grothe build, combined strict audit, Bridge probe and cache upload remain required.")
        return 0
    except Pause as error:
        print(f"PAUSED: {error}", file=sys.stderr)
        return 75
    except (BuildError, ClosureError, OSError, ValueError, KeyError, TypeError) as error:
        print(f"FAIL: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())

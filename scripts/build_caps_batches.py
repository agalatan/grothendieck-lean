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
import caps_stamp as active_registry
import caps_coexist

ROOT = Path(__file__).resolve().parents[1]
REGISTRY = "data/caps-m/plan/row-certificates/row12-build.json"
OLD_ROWS = (*range(12), 16, 17, 18)
DIRECT = ["Grothe/LowerAnalytic/CapNodes.lean", "Grothe/LowerAnalytic/CapRow12/Assembly.lean"]
CONFIG = ["lakefile.toml", "lake-manifest.json", "lean-toolchain"]
EXECUTION = ["scripts/build_caps_batches.py", "scripts/caps_stamp.py", "scripts/caps_coexist.py"]
FORMAT = "caps-bounded-build-v1"
ACTIVE_DECLARATION_FIELDS = {"format", "scope", "legacy_rows_input", "legacy_rows", "active_rows", "retained_proofs", "provenance"}
ACTIVE_DERIVED_FIELDS = ("compute_roots", "direct_hash_roots", "pure_roots", "native_declarations_by_root",
                         "input_sha256", "computation_input_sha256", "source_sha256", "execution_source_sha256",
                         "derived_counts", "max_parallel_leaves", "lean_child_threads")


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


def active_declaration(value: dict) -> dict:
    """Schema projection only; all row/input derivation belongs to caps_stamp."""
    required = {"format", "legacy_rows_input", "legacy_rows", "active_rows", "retained_proofs"}
    if (not isinstance(value, dict) or value.get("format") != active_registry.ACTIVE_FORMAT
            or not required <= set(value)
            or not set(value) <= ACTIVE_DECLARATION_FIELDS | set(ACTIVE_DERIVED_FIELDS)):
        raise BuildError("need an explicit complete v2 active-row declaration")
    return {key: item for key, item in value.items() if key in ACTIVE_DECLARATION_FIELDS}


def current_active_registry(root: Path):
    """Observe the ONE canonical registry, never discover active rows by glob."""
    path = active_registry._active_path(root, REGISTRY, optional=True)
    try:
        path.lstat()
    except FileNotFoundError:
        return path, None, None
    data = path.read_bytes()
    value = active_registry._active_json(data)
    known_v1 = (isinstance(value, dict) and value.get("format") == FORMAT
                and type(value.get("row")) is int and value["row"] == 12)
    known_v2 = isinstance(value, dict) and value.get("format") == active_registry.ACTIVE_FORMAT
    if not (known_v1 or known_v2):
        raise BuildError("existing canonical active registry is malformed or has an unknown format")
    return path, data, value


def preserve_active_declarations(previous, declaration):
    """Add rows/proofs; no implicit drop or replacement of an activated record."""
    if previous is None:
        return
    if not isinstance(previous, dict):
        raise BuildError("existing canonical active registry is malformed")
    rows = {item["row"]: item for item in declaration["active_rows"]}
    if previous.get("format") == FORMAT and type(previous.get("row")) is int and previous["row"] == 12:
        if 12 not in rows:
            raise BuildError("v1 Row12 must remain explicitly active during migration")
        # These are v1's fixed historical input locations, not a new row census.
        for key, suffix in (("generation_config", "generation"), ("pieces", "pieces"),
                            ("selection", "selection"), ("anchors", "anchors")):
            if rows[12][key] != f"data/caps-m/plan/row-certificates/row12-{suffix}.json":
                raise BuildError("v1 Row12 input declarations must be preserved")
        return
    old = active_declaration(previous)
    old_rows = old["active_rows"]
    if not isinstance(old_rows, list) or any(not isinstance(item, dict) or type(item.get("row")) is not int for item in old_rows):
        raise BuildError("existing active-row declarations are malformed")
    for item in old_rows:
        if not active_registry._active_equal(rows.get(item["row"]), item):
            raise BuildError("active row cannot be dropped/replaced by registry regeneration")
    for item in old["retained_proofs"]:
        if not any(active_registry._active_equal(item, new) for new in declaration["retained_proofs"]):
            raise BuildError("retained proof cannot be dropped/replaced by registry regeneration")


def registry_snapshot_unchanged(root, snapshot):
    _, data, _ = snapshot
    if current_active_registry(root)[1] != data:
        raise BuildError("canonical active registry changed during preparation")


def derive_active_build_registry(root: Path, declaration: dict, *, materialized: bool = True) -> dict:
    """Pure shared-source derivation; neither preparation nor regeneration writes."""
    root = Path(root).absolute()
    snapshot = current_active_registry(root)
    declaration = active_declaration(declaration)
    view = active_registry.derive_active_registry(root, declaration, require_materialized=materialized)
    preserve_active_declarations(snapshot[2], declaration)
    registry_snapshot_unchanged(root, snapshot)
    if not materialized:
        return {"format": "caps-active-registry-source-proposal/v1", "active_declaration": declaration,
                "declaration_view": view, "materialized": False, "active_registry_published": False,
                "native_verified": False, "cache_uploaded": False}
    return declaration | {name: view[name] for name in ACTIVE_DERIVED_FIELDS}


def make_registry(root: Path, overlay: Path | None = None, *, active_declaration_value: dict | None = None) -> dict:
    """Explicit regeneration; preserve the historical v1 call/return contract."""
    # Preserve v1's historical Path call contract (macOS /var may be aliased).
    # The explicit v2 derivation below still requires its canonical root.
    snapshot = current_active_registry(Path(root).resolve())
    previous = snapshot[2]
    if active_declaration_value is not None or (isinstance(previous, dict) and previous.get("format") == active_registry.ACTIVE_FORMAT):
        if overlay is not None:
            raise BuildError("v2 registry requires materialized canonical sources, never an inactive overlay")
        value = derive_active_build_registry(root, active_declaration_value if active_declaration_value is not None else previous)
        registry_snapshot_unchanged(Path(root).resolve(), snapshot)
        return value
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


def overlay_proposal_destination(root: Path, target: Path):
    """Inactive overlays may create only a NEW, clearly non-active artifact."""
    relative = str(target.relative_to(root))
    canonical = root / REGISTRY
    if target.resolve() == canonical.resolve():
        raise BuildError("an inactive overlay cannot publish the canonical active registry")
    active_registry._active_path(root, relative, optional=True)
    allowed = (".lake/caps-registry-proposals/", "handoff/caps-centre/registry-proposals/")
    if not relative.startswith(allowed) or not relative.endswith(".json") or target.exists():
        raise BuildError("overlay preparation requires a NEW confined inactive registry-proposal JSON path")


def propose_active_registry(root: Path, declaration_path: Path) -> dict:
    """Explicit declaration-only stdout proposal; no generated source discovery."""
    relative = str(declaration_path.relative_to(root))
    source = active_registry._active_path(root, relative)
    data = source.read_bytes()
    declaration = active_registry._active_json(data)
    if not isinstance(declaration, dict) or not set(declaration) <= ACTIVE_DECLARATION_FIELDS:
        raise BuildError("source proposal must contain declarations only, never materialized registry pins")
    value = derive_active_build_registry(root, declaration, materialized=False)
    if active_registry._active_path(root, relative).read_bytes() != data:
        raise BuildError("active declaration source changed while planning")
    return value | {"declaration_source": relative, "declaration_sha256": sha(data)}


def validate_registry(root: Path, registry: dict, *, census: bool = True) -> None:
    if isinstance(registry, dict) and registry.get("format") == active_registry.ACTIVE_FORMAT:
        if census is not True:
            raise BuildError("v2 materialized inventory validation cannot bypass its census")
        active_registry.read_active_registry(root, registry, require_materialized=True)
        return
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


GIB_PER_LEAF = 5          # peak RSS of one single-threaded leaf (measured at most 4.1 GiB), with margin
RSS_HEADROOM_GIB = 6      # memory left to the OS, the runner and Lake itself


def machine_jobs() -> int:
    """Leaves to run at once: one per usable CPU, but never more than the memory holds (8 GiB each)."""
    try:
        cpus = len(os.sched_getaffinity(0))
    except AttributeError:
        cpus = os.cpu_count() or 1
    return max(1, min(cpus, (machine_memory_gib() - RSS_HEADROOM_GIB) // GIB_PER_LEAF))


def machine_memory_gib() -> int:
    try:
        with open("/proc/meminfo") as f:
            for line in f:
                if line.startswith("MemTotal:"):
                    return int(line.split()[1]) // 2**20
    except OSError:
        pass
    return 24 + RSS_HEADROOM_GIB   # unknown platform: the original 24 GiB budget


def groups(registry: dict, jobs: int):
    if type(jobs) is not int or jobs < 1:
        raise BuildError("jobs must be a positive integer")
    for phase, roots in (("pure", registry["pure_roots"]), ("native", registry["compute_roots"])):
        for i in range(0, len(roots), jobs):
            yield phase, list(map(module, roots[i:i + jobs]))


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

    def adopt_overlay(self):
        """The overlay is ours alone; one left by an earlier run (an older lakefile) is replaced under the lock."""
        if self.overlay.exists() and self.overlay.read_bytes() != self.overlay_data:
            print("Replacing the stale owned Lake overlay of an earlier run", flush=True)
            self.overlay.write_bytes(self.overlay_data)

    def check(self, pgid=None, *, full=False):
        # Hash/parse the whole certificate source once at the start and once at the end (full=True):
        # about 9 s each. Between groups and while polling, the inode/mtime/ctime/size of every pinned
        # source must be unchanged, which costs milliseconds.
        if full or self.source_stats is None:
            self.validate(self.args.root, self.registry)
        stats = {}
        inputs = self.registry.get("input_sha256", {}) if self.registry.get("format") == active_registry.ACTIVE_FORMAT else {}
        for relative in {*self.registry["source_sha256"], *self.registry["execution_source_sha256"], *inputs}:
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
            rows, allowed = self.coexist.authorized_rows(process_rows(self.coexist.proc), pgid)
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
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False)
    parser.add_argument("--root", type=Path, default=ROOT)
    parser.add_argument("--registry", type=Path, default=Path(REGISTRY))
    modes = parser.add_mutually_exclusive_group()
    modes.add_argument("--plan", action="store_true", help="validate and print groups; perform no builds or writes")
    modes.add_argument("--write-registry", action="store_true", help="regenerate the reviewed source/build inventory")
    modes.add_argument("--propose-active-registry", type=Path, metavar="DECLARATION",
                       help="stdout-only additive v2 declaration proposal; no activation, builds or writes")
    parser.add_argument("--source-overlay", type=Path, help="registry preparation only: read candidate sources from this overlay")
    parser.add_argument("--jobs", type=int, default=None,
                        help="leaves built at once (default: usable CPUs, at most one per 8 GiB of RAM beyond 6 GiB headroom)")
    parser.add_argument("--rss-limit-gib", type=float, default=None,
                        help="pause when the owned leaves exceed this aggregate RSS (default: RAM minus 6 GiB)")
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
        if args.propose_active_registry:
            if args.source_overlay:
                raise BuildError("v2 declaration proposals use explicit canonical inputs, never a source overlay")
            proposal = args.propose_active_registry
            if not proposal.is_absolute():
                relative_path(str(proposal))
                proposal = args.root / proposal
            proposal.relative_to(args.root)
            print(json.dumps(propose_active_registry(args.root, proposal), indent=2, sort_keys=True))
            return 0
        if args.source_overlay and not args.write_registry:
            raise BuildError("source overlay is allowed only when writing a preparation registry")
        if args.write_registry:
            active_registry._active_path(args.root, str(args.registry.relative_to(args.root)), optional=True)
            if args.source_overlay:
                overlay_proposal_destination(args.root, args.registry)
            value = make_registry(args.root, args.source_overlay)
            args.registry.parent.mkdir(parents=True, exist_ok=True)
            if args.source_overlay:
                value = {"format": "caps-build-registry-overlay-proposal/v1", "registry_proposal": value,
                         "active_registry_published": False, "materialized": False, "native_verified": False}
                with args.registry.open("x") as stream:
                    stream.write(json.dumps(value, indent=2, sort_keys=True) + "\n")
            else:
                atomic_json(args.registry, value)
            print("Wrote an inactive source proposal; no activation or verification performed" if args.source_overlay else
                  f"Wrote {len(value['compute_roots'])} compute roots; no Lean build or verification performed")
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
        registry = active_registry._active_json(data)
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
                runner.adopt_overlay()
                if runner.coexist is not None:
                    runner.coexist.publish(phase="shared", child_pgid=None)
                for index, (phase, targets) in enumerate(plan, 1):
                    runner.run_group(phase, targets, index)
                    print(f"Complete group {index}/{len(plan)} ({phase}): {', '.join(targets)}", flush=True)
                runner.check(full=True)
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

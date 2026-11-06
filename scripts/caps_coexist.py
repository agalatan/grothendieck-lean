#!/usr/bin/env python3
"""Fail-closed, same-UID passports for the reviewed CI20 + research8 GiB window.

Only a newly spawned, unregistered child can be stopped here if registration
fails. Callers otherwise retain authority over their own children.
This protocol grants no mathematical verification or cache provenance.
"""
from contextlib import contextmanager
import fcntl
import hashlib
import json
import os
from pathlib import Path
import re
import signal
import stat
import subprocess
import time

GIB = 2**30
FORMAT = "caps-coexist-v1"
REPOSITORY = "agalatan/grothendieck-lean"
PROFILES = {"ci": {"jobs": 2, "rss_limit_bytes": 20 * GIB},
            "research": {"jobs": 1, "rss_limit_bytes": 8 * GIB}}
SCRIPTS = {"ci": "scripts/build_caps_batches.py", "research": "tools/caps_centre_coexist.py"}
LIBRARY_SHA256 = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
COMMAND_TIMEOUT_SECONDS = 1.0
COMMAND_RETRY_SECONDS = 0.01


class CoexistError(ValueError):
    pass


def require(condition, message):
    if not condition:
        raise CoexistError(message)


def identity(value):
    require(isinstance(value, dict) and set(value) == {"run_id", "sha", "repository"}, "invalid CI identity fields")
    require(isinstance(value["run_id"], str) and value["run_id"].isdigit(), "invalid GitHub run ID")
    require(isinstance(value["sha"], str) and re.fullmatch("[0-9a-f]{40}", value["sha"]), "invalid GitHub SHA")
    require(value["repository"] == REPOSITORY, "wrong GitHub repository")
    return dict(value)


def github_identity(environ=None):
    env = os.environ if environ is None else environ
    return identity({"run_id": env.get("GITHUB_RUN_ID"), "sha": env.get("GITHUB_SHA"),
                     "repository": env.get("GITHUB_REPOSITORY")})


class ProcFS:
    def basic(self, pid):
        """Public identity/ancestry only: never read environ, cwd or command line."""
        try:
            base = Path("/proc") / str(pid)
            raw = (base / "stat").read_text()
            end = raw.rfind(")")
            fields = raw[end + 2:].split()
            if fields[0] in {"Z", "X"}:
                return None
            uid = next(line for line in (base / "status").read_text().splitlines() if line.startswith("Uid:"))
            return {"pid": int(pid), "ppid": int(fields[1]), "pgid": int(fields[2]),
                    "start_ticks": int(fields[19]), "uid": int(uid.split()[1]), "state": fields[0],
                    "flags": int(fields[6]),
                    "rss": max(0, int(fields[21])) * os.sysconf("SC_PAGE_SIZE"),
                    "comm": raw[raw.index("(") + 1:end]}
        except FileNotFoundError:
            return None
        except (OSError, ValueError, IndexError, StopIteration, UnicodeError) as error:
            raise CoexistError(f"cannot read basic process {pid}: {type(error).__name__}") from error

    def command(self, pid, *, expected_start=None, expected_pgid=None):
        """Identity-bound argv retry; an empty command never proves exit.

        Linux can briefly expose empty/changing cmdline during exec or exit.
        Even PF_EXITING is only a task flag, so it is diagnostic, never a reason
        to drop a still-present process or bypass its normal resource checks.
        """
        started = time.monotonic()
        deadline = started + COMMAND_TIMEOUT_SECONDS
        first_identity, attempts, samples = None, 0, []
        fields = ("pid", "start_ticks", "pgid", "uid")

        def basic():
            nonlocal first_identity
            value = self.basic(pid)
            if value is None:
                return None
            require(expected_start is None or value["start_ticks"] == expected_start, "process PID/starttime changed")
            require(expected_pgid is None or value["pgid"] == expected_pgid, "process group identity changed")
            current = {field: value[field] for field in fields}
            if first_identity is None:
                first_identity = current
            require(current == first_identity, "process identity changed during command inspection")
            return value

        def public(value):
            return {field: value.get(field) for field in
                    ("pid", "ppid", "pgid", "start_ticks", "uid", "state", "flags", "rss", "comm")}

        while True:
            attempts += 1
            before = basic()
            if before is None:
                return None
            raw, raw_after = None, None
            after, final = before, before
            try:
                raw = (Path("/proc") / str(pid) / "cmdline").read_bytes()
                after = basic()
                if after is None:
                    return None
                raw_after = (Path("/proc") / str(pid) / "cmdline").read_bytes()
                final = basic()
                if final is None:
                    return None
            except FileNotFoundError:
                # A missing cmdline path alone must not hide a live/reused PID.
                final = basic()
                if final is None:
                    return None
            except OSError as error:
                raise CoexistError(f"cannot read process {pid} command: {type(error).__name__}") from error
            if raw and raw == raw_after and before["comm"] == after["comm"] == final["comm"]:
                try:
                    return dict(final, args=[v.decode() for v in raw.split(b"\0") if v], command_source="proc-cmdline")
                except UnicodeError as error:
                    raise CoexistError("invalid process command encoding") from error
            kind = ("cmdline-missing" if raw is None or raw_after is None else
                    "empty" if not raw or not raw_after else
                    "argv-changed" if raw != raw_after else "comm-changed")
            samples.append({"attempt": attempts, "kind": kind,
                            "process": [public(before), public(after), public(final)],
                            "raw_lengths": [None if value is None else len(value) for value in (raw, raw_after)],
                            "raw_sha256": [None if value is None else hashlib.sha256(value).hexdigest()
                                           for value in (raw, raw_after)]})
            samples = samples[-8:]  # Bounded metadata only; never argv or environ.
            remaining = deadline - time.monotonic()
            if remaining <= 0:
                break
            time.sleep(min(COMMAND_RETRY_SECONDS, remaining))
        # It may have exited during the last retry delay. Inspect independently
        # once more before declaring a still-live command inspection failure.
        final = basic()
        if final is None:
            return None
        diagnostic = {"attempt_count": attempts, "elapsed_ms": round((time.monotonic() - started) * 1000, 3),
                      "identity": first_identity, "final_process": public(final), "recent_samples": samples}
        raise CoexistError(f"process {pid} command did not stabilize: " + json.dumps(diagnostic, sort_keys=True))

    def read(self, pid):
        """Full authentication only for an explicitly required owned controller."""
        process = self.command(pid)
        if process is None:
            return None
        try:
            base = Path("/proc") / str(pid)
            env = {}
            for item in (base / "environ").read_bytes().split(b"\0"):
                if b"=" in item:
                    key, value = item.split(b"=", 1)
                    if key in {b"GITHUB_RUN_ID", b"GITHUB_SHA", b"GITHUB_REPOSITORY", b"GITHUB_WORKSPACE"}:
                        env[key.decode()] = value.decode()
            cwd = str((base / "cwd").resolve(strict=True))
            after = self.basic(pid)
            if after is None:
                return None
            require(all(process[field] == after[field] for field in ("pid", "start_ticks", "pgid", "uid")),
                    "controller identity changed during authentication")
            return dict(process, cwd=cwd, environ=env)
        except FileNotFoundError:
            return None
        except (OSError, ValueError, StopIteration, UnicodeError) as error:
            raise CoexistError(f"cannot validate process {pid}: {type(error).__name__}") from error

    def snapshot(self):
        """No environments or arguments are exposed by the process inventory."""
        rows = []
        for base in Path("/proc").iterdir():
            if not base.name.isdigit():
                continue
            process = self.basic(int(base.name))
            if process is not None:
                rows.append(process)
        return rows

    def mem_available(self):
        try:
            line = next(v for v in Path("/proc/meminfo").read_text().splitlines() if v.startswith("MemAvailable:"))
            return int(line.split()[1]) * 1024
        except (OSError, StopIteration, ValueError) as error:
            raise CoexistError("cannot read machine memory headroom") from error


class Coexist:
    def __init__(self, directory, *, role, root, jobs, rss_limit_gib, expected_ci,
                 research_root=None, proc=None, pid=None, uid=None, killpg=os.killpg):
        require(role in PROFILES, "unknown coexist role")
        self.directory, self.root = Path(directory), Path(root).resolve(strict=True)
        self.role, self.peer_role = role, "research" if role == "ci" else "ci"
        self.expected_ci = identity(expected_ci)
        self.proc, self.pid, self.uid = proc or ProcFS(), pid or os.getpid(), os.getuid() if uid is None else uid
        self.killpg = killpg
        require({"jobs": jobs, "rss_limit_bytes": int(rss_limit_gib * GIB)} == PROFILES[role], "unreviewed coexist resource profile")
        self.research_root = Path(research_root).resolve() if research_root is not None else self.root
        require(role != "ci" or research_root is not None, "CI must pin the exact research root")
        require(self.directory.is_absolute() and self.directory == self.directory.resolve(), "coexist directory must be absolute and not symlinked")
        self.directory.mkdir(mode=0o700, parents=False, exist_ok=True)
        self._check_directory()
        self.current = None
        self.last_peer_child = None
        self.initial_script_sha256 = hashlib.sha256((self.root / SCRIPTS[self.role]).read_bytes()).hexdigest()

    def _check_directory(self):
        s = self.directory.lstat()
        require(stat.S_ISDIR(s.st_mode) and s.st_uid == self.uid and stat.S_IMODE(s.st_mode) == 0o700,
                "coexist directory must be same-UID mode0700, without symlinks")

    def _open(self, path, flags):
        self._check_directory()
        fd = os.open(path, flags | os.O_NOFOLLOW, 0o600)
        s = os.fstat(fd)
        if not (stat.S_ISREG(s.st_mode) and s.st_uid == self.uid and stat.S_IMODE(s.st_mode) == 0o600 and s.st_nlink == 1):
            os.close(fd)
            raise CoexistError("passport/lock must be same-UID mode0600 and a single regular file")
        return fd

    @contextmanager
    def transaction(self):
        fd = self._open(self.directory / "coexist.lock", os.O_CREAT | os.O_RDWR)
        try:
            deadline = time.monotonic() + 10
            while True:
                try:
                    fcntl.flock(fd, fcntl.LOCK_EX | fcntl.LOCK_NB)
                    break
                except BlockingIOError:
                    if time.monotonic() > deadline:
                        raise CoexistError("coexist transaction lock is busy")
                    time.sleep(0.05)
            yield
        finally:
            fcntl.flock(fd, fcntl.LOCK_UN)
            os.close(fd)

    def _read(self, role):
        path = self.directory / (role + ".json")
        try:
            fd = self._open(path, os.O_RDONLY)
        except FileNotFoundError:
            return None
        try:
            raw = os.read(fd, 32769)
            require(len(raw) <= 32768, "oversized coexist passport")
            value = json.loads(raw)
        except (ValueError, UnicodeError) as error:
            raise CoexistError("malformed coexist passport") from error
        finally:
            os.close(fd)
        return value

    def _write(self, value):
        path = self.directory / (self.role + ".json")
        if path.exists() or path.is_symlink():
            fd = self._open(path, os.O_RDONLY)
            os.close(fd)
        temp = self.directory / f".{self.role}-{self.pid}.tmp"
        fd = self._open(temp, os.O_CREAT | os.O_EXCL | os.O_WRONLY)
        try:
            with os.fdopen(fd, "w") as stream:
                json.dump(value, stream, sort_keys=True)
                stream.write("\n")
                stream.flush()
                os.fsync(stream.fileno())
            os.replace(temp, path)
        finally:
            if temp.exists():
                temp.unlink()

    def _ancestors(self, pid, *, stop_pid=None, stop_worker=False):
        result, seen = [], set()
        while pid and pid not in seen:
            seen.add(pid)
            process = self.proc.basic(pid)
            if process is None:
                raise CoexistError("process ancestry disappeared")
            result.append(process)
            if pid == stop_pid or (stop_worker and process["comm"] in {"Runner.Worker", "Runner.Worker.exe"}):
                break
            pid = process["ppid"]
        return result

    def _controller(self, record, role, *, cleanup=False):
        require(isinstance(record, dict) and record.get("format") == FORMAT and record.get("role") == role,
                "wrong coexist passport format/role")
        require(record.get("identity") == self.expected_ci and record.get("profile") == PROFILES[role]
                and record.get("library_sha256") == LIBRARY_SHA256, "coexist identity/profile/library mismatch")
        require(record.get("phase") in {"shared", "exclusive", "closed"}, "invalid coexist phase")
        require(type(record.get("pid")) is int and record["pid"] > 0 and
                type(record.get("start_ticks")) is int and record["start_ticks"] > 0 and
                record.get("uid") == self.uid, "invalid controller PID/starttime/UID")
        basic = self.proc.basic(record["pid"])
        require(basic is not None and basic["start_ticks"] == record.get("start_ticks") and basic["uid"] == self.uid,
                "stale or wrong-UID coexist controller")
        process = self.proc.read(record["pid"])
        require(process is not None and process["pid"] == record["pid"] and
                process["start_ticks"] == record["start_ticks"] and process["uid"] == self.uid and
                all(process[field] == basic[field] for field in ("pid", "start_ticks", "pgid", "uid")),
                "controller identity changed during authentication")
        root = Path(record.get("root", ""))
        require(root.is_absolute() and str(root) == process["cwd"] and root == root.resolve(strict=True), "controller root mismatch")
        script = root / SCRIPTS[role]
        require(not script.is_symlink() and script.is_file() and
                hashlib.sha256(script.read_bytes()).hexdigest() == record.get("script_sha256"), "controller source changed")
        args = list(process["args"])
        require(args and re.fullmatch(r"python(?:3(?:\.\d+)?)?", Path(args.pop(0)).name), "controller is not a Python script process")
        while args and args[0] in {"-u", "-B"}:
            args.pop(0)
        require(args and not args[0].startswith("-") and (root / args[0]).resolve() == script,
                "wrong controller script position")
        if role == "research":
            require(root == self.research_root, "unregistered research root")
        else:
            require(github_identity(process["environ"]) == self.expected_ci and
                    process["environ"].get("GITHUB_WORKSPACE") == str(root), "CI process does not belong to the expected GitHub job")
            if cleanup:
                require(record["phase"] in {"exclusive", "closed"} and record["child"] is None and
                        self.current is not None and self.current["pid"] == process["pid"] and
                        self.current["start_ticks"] == process["start_ticks"] and
                        self.current["runner_worker"] == record["runner_worker"], "invalid reparented cleanup authority")
            else:
                ancestors = self._ancestors(process["ppid"], stop_worker=True)
                workers = [p for p in ancestors if p["comm"] in {"Runner.Worker", "Runner.Worker.exe"}]
                require(workers and workers[0]["uid"] == self.uid and
                        record.get("runner_worker") == {"pid": workers[0]["pid"], "start_ticks": workers[0]["start_ticks"]},
                        "closest registered Runner.Worker ancestor mismatch")
        return process

    def _child(self, record, controller):
        child = record.get("child")
        if child is None:
            return None
        require(isinstance(child, dict) and set(child) == {"pgid", "start_ticks"}, "invalid owned child registration")
        process = self.proc.basic(child["pgid"])
        rows = self.proc.snapshot()
        group = [r for r in rows if r["pgid"] == child["pgid"]]
        if not group:
            return None
        require(process is not None and process["pid"] == process["pgid"] and
                process["start_ticks"] == child["start_ticks"] and process["uid"] == self.uid,
                "stale/orphaned owned child group")
        require(controller["pid"] in {p["pid"] for p in self._ancestors(process["ppid"], stop_pid=controller["pid"])}, "child is not owned by registered controller")
        return child

    def _publish_locked(self, phase, child_pgid, *, cleanup=False):
        require(phase in {"shared", "exclusive", "closed"}, "invalid coexist phase")
        process = self.proc.read(self.pid)
        require(process is not None and process["uid"] == self.uid and process["cwd"] == str(self.root), "current controller identity mismatch")
        previous = self._read(self.role)
        if previous is not None:
            require(isinstance(previous, dict) and previous.get("format") == FORMAT and previous.get("role") == self.role
                    and type(previous.get("pid")) is int and type(previous.get("start_ticks")) is int,
                    "malformed previous controller passport")
        replacement = previous is not None and (previous["pid"] != self.pid or
                                                previous["start_ticks"] != process["start_ticks"])
        if replacement:
            existing = self.proc.basic(previous.get("pid"))
            require(existing is None or existing["start_ticks"] != previous.get("start_ticks"), "another live controller owns this passport")
            if previous.get("child") is not None:
                require(isinstance(previous["child"], dict) and type(previous["child"].get("pgid")) is int,
                        "malformed previous owned group")
                require(not any(p["pgid"] == previous["child"]["pgid"] for p in self.proc.snapshot()),
                        "previous controller left a live child group; inspect before replacing its passport")
        child = None
        if child_pgid is not None:
            if previous is not None and previous.get("child") and previous["child"]["pgid"] != child_pgid:
                require(not any(p["pgid"] == previous["child"]["pgid"] for p in self.proc.snapshot()),
                        "cannot replace a live owned child group")
            child_process = self.proc.basic(child_pgid)
            require(child_process is not None, "new child group disappeared before registration")
            child = {"pgid": child_pgid, "start_ticks": child_process["start_ticks"]}
        elif previous is not None and previous.get("pid") == self.pid and previous.get("child") is not None:
            require(not any(p["pgid"] == previous["child"]["pgid"] for p in self.proc.snapshot()), "cannot clear a live owned child group")
        script = self.root / SCRIPTS[self.role]
        require(hashlib.sha256(script.read_bytes()).hexdigest() == self.initial_script_sha256 and
                hashlib.sha256(Path(__file__).read_bytes()).hexdigest() == LIBRARY_SHA256,
                "own coexist execution source changed")
        record = {"format": FORMAT, "role": self.role, "identity": self.expected_ci, "profile": PROFILES[self.role],
                  "pid": self.pid, "start_ticks": process["start_ticks"], "uid": self.uid, "root": str(self.root),
                  "phase": phase, "child": child, "library_sha256": LIBRARY_SHA256,
                  "script_sha256": self.initial_script_sha256, "runner_worker": None}
        if self.role == "ci":
            if cleanup:
                require(self.current is not None and child_pgid is None, "cleanup requires established ownership and absent child")
                record["phase"] = "closed" if phase == "closed" else "exclusive"
                record["runner_worker"] = self.current["runner_worker"]
            else:
                workers = [p for p in self._ancestors(process["ppid"], stop_worker=True) if p["comm"] in {"Runner.Worker", "Runner.Worker.exe"}]
                require(workers, "CI controller has no Runner.Worker ancestor")
                record["runner_worker"] = {"pid": workers[0]["pid"], "start_ticks": workers[0]["start_ticks"]}
        controller = self._controller(record, self.role, cleanup=cleanup and self.role == "ci")
        self._child(record, controller)
        self._write(record)
        self.current = record
        return record

    def publish(self, phase="shared", child_pgid=None):
        with self.transaction():
            return self._publish_locked(phase, child_pgid)

    def peer(self):
        record = self._read(self.peer_role)
        if record is None:
            return None
        # A closed passport never authorizes a process. Its publisher already
        # checked that its owned group was absent; it may now have exited.
        if isinstance(record, dict) and record.get("phase") == "closed":
            require(record.get("format") == FORMAT and record.get("role") == self.peer_role and
                    record.get("identity") == self.expected_ci and record.get("profile") == PROFILES[self.peer_role]
                    and record.get("library_sha256") == LIBRARY_SHA256 and record.get("child") is None,
                    "malformed closed coexist passport")
            return record
        controller = self._controller(record, self.peer_role)
        self._child(record, controller)
        if record.get("child"):
            self.last_peer_child = record["child"]
        return record

    def _live_sample(self, rows):
        """Reconcile sampled identities; absence is removed, reuse never is."""
        live = []
        for row in rows:
            require(all(type(row.get(field)) is int for field in ("pid", "pgid", "start_ticks")),
                    "sample lacks PID/starttime/PGID identity")
            current = self.proc.basic(row["pid"])
            if current is None:
                continue  # independently absent/Z/X, never an authorized PID
            require(all(current[field] == row[field] for field in ("pid", "pgid", "start_ticks"))
                    and ("uid" not in row or current["uid"] == row["uid"]),
                    "sampled process identity changed")
            if current["comm"] == "lean":
                current = self.proc.command(row["pid"], expected_start=row["start_ticks"],
                                            expected_pgid=row["pgid"])
                if current is None:
                    continue
                require(all(current[field] == row[field] for field in ("pid", "pgid", "start_ticks"))
                        and ("uid" not in row or current["uid"] == row["uid"]),
                        "sampled command identity changed")
            # Frozen numerical rows may contain old exe/module/args fields.
            # Never classify a later exec through the previous executable.
            args = current.get("args", []) if current["comm"] == "lean" else []
            current = dict(current, args=args,
                           exe=Path(args[0]).name if args else current["comm"],
                           module=next((Path(arg).name for arg in args if arg.endswith(".lean")), None))
            # Current PPID is essential: a live reparented process must never
            # inherit authorization through an older sampled ancestry edge.
            live.append(dict(row, **current))
        return live

    def authorized_rows(self, rows, own_group=None):
        """One reconciled view for ancestry, resource checks and caller observe.

        The lock serializes peer spawn/registration/clear, but cannot stop an
        actual child exit. Such rows are independently removed, not whitelisted.
        No later process inventory is mixed into the sampled ancestry tree.
        """
        with self.transaction():
            record = self.peer()
            live = self._live_sample(rows)
            if record is None or record["phase"] == "closed":
                return live, set()
            require(record["phase"] == "shared", "peer requires exclusive phase")
            # A registered leader/controller can exit while individual rows
            # are sampled. Revalidate ownership, then drop any newly absent
            # rows before deriving authorization from the final live PPIDs.
            controller = self._controller(record, self.peer_role)
            self._child(record, controller)
            live = self._live_sample(live)
            controller = self._controller(record, self.peer_role)
            self._child(record, controller)
            allowed = {record["pid"]}
            changed = True
            while changed:
                before = len(allowed)
                allowed.update(row["pid"] for row in live if row["ppid"] in allowed)
                changed = len(allowed) != before
            if self.role == "research":
                allowed.add(record["runner_worker"]["pid"])
            # Only identities present in this reconciled view are authorized.
            allowed.intersection_update(row["pid"] for row in live)
            peer_rows = [row for row in live if row["pid"] in allowed and row["pid"] !=
                         (record.get("runner_worker") or {}).get("pid")]
            require(all(row["uid"] == self.uid for row in live if row["pid"] in allowed),
                    "allowed peer process has wrong UID")
            require(sum(row.get("rss", 0) for row in peer_rows) <= PROFILES[self.peer_role]["rss_limit_bytes"],
                    "peer exceeds registered RSS profile")
            lean = [row for row in peer_rows if row["comm"] == "lean"]
            require(len(lean) <= PROFILES[self.peer_role]["jobs"], "peer exceeds registered Lean concurrency")
            require(all("-j1" in row["args"] for row in lean), "peer Lean child lacks -j1")
            return live, allowed

    def authorized_foreign(self, rows, own_group=None):
        """Compatibility API: replace the caller's list with its admitted view.

        Existing numerical guards subsequently inspect this SAME list. Keeping
        stale rows there would recreate the expired-peer-as-foreign race.
        """
        require(isinstance(rows, list), "coexist process rows must be a mutable list")
        live, allowed = self.authorized_rows(rows, own_group)
        rows[:] = live
        return allowed

    def launch_registered(self, popen, argv, **kwargs):
        require(kwargs.get("start_new_session") is True, "coexist children must own a new process group")
        with self.transaction():
            if self.role == "research":
                record = self.peer()
                if record is None or record["phase"] == "closed":
                    inventory = self.proc.snapshot()
                    own = {self.pid}
                    changed = True
                    while changed:
                        previous = len(own)
                        own.update(p["pid"] for p in inventory if p["ppid"] in own)
                        changed = previous != len(own)
                    require(not any(p["pid"] not in own and p["comm"] in
                                    {"Runner.Worker", "Runner.Worker.exe", "lean", "lake"} for p in inventory),
                            "unregistered CI/foreign Lean prevents research spawn")
                else:
                    require(record["phase"] == "shared", "CI is not in the registered shared phase")
            require(self.current is not None and self.current["phase"] == "shared", "own shared phase is not registered")
            require(self.proc.mem_available() >= 3 * GIB, "machine memory headroom below3GiB")
            child = popen(argv, **kwargs)
            try:
                if self.proc.basic(child.pid) is None and child.poll() is not None and not any(
                        row["pgid"] == child.pid for row in self.proc.snapshot()):
                    self._publish_locked("shared", None)
                else:
                    self._publish_locked("shared", child.pid)
            except BaseException:
                # The caller never received this child. Retain ownership here and
                # never leave an unregistered process past the shared lock.
                try:
                    self.killpg(child.pid, signal.SIGTERM)
                except ProcessLookupError:
                    pass
                try:
                    child.wait(timeout=10)
                except subprocess.TimeoutExpired:
                    self.killpg(child.pid, signal.SIGKILL)
                    child.wait(timeout=10)
                if any(row["pgid"] == child.pid for row in self.proc.snapshot()):
                    try:
                        self.killpg(child.pid, signal.SIGKILL)
                    except ProcessLookupError:
                        pass
                    require(not any(row["pgid"] == child.pid for row in self.proc.snapshot()),
                            "new unregistered owned group survived cleanup")
                raise
            return child

    def clear_child(self):
        with self.transaction():
            phase = self.current["phase"] if self.current else "shared"
            try:
                return self._publish_locked(phase, None)
            except CoexistError:
                if self.role != "ci" or self.current is None:
                    raise
                return self._publish_locked(phase, None, cleanup=True)

    def peer_child_present(self):
        record = self.peer()
        child = (record.get("child") if record else None) or self.last_peer_child
        if child is None:
            return False
        return any(row["pgid"] == child["pgid"] for row in self.proc.snapshot())

    def close(self):
        with self.transaction():
            return self._publish_locked("closed", None, cleanup=self.role == "ci")

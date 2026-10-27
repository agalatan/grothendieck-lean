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
    def read(self, pid):
        try:
            base = Path("/proc") / str(pid)
            raw = (base / "stat").read_text()
            end = raw.rfind(")")
            fields = raw[end + 2:].split()
            if fields[0] in {"Z", "X"}:
                return None
            uid = next(line for line in (base / "status").read_text().splitlines() if line.startswith("Uid:"))
            env = {}
            for item in (base / "environ").read_bytes().split(b"\0"):
                if b"=" in item:
                    key, value = item.split(b"=", 1)
                    if key in {b"GITHUB_RUN_ID", b"GITHUB_SHA", b"GITHUB_REPOSITORY", b"GITHUB_WORKSPACE"}:
                        env[key.decode()] = value.decode()
            return {"pid": int(pid), "ppid": int(fields[1]), "pgid": int(fields[2]),
                    "start_ticks": int(fields[19]), "uid": int(uid.split()[1]),
                    "comm": raw[raw.index("(") + 1:end], "cwd": str((base / "cwd").resolve(strict=True)),
                    "args": [v.decode() for v in (base / "cmdline").read_bytes().split(b"\0") if v],
                    "environ": env}
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
            try:
                raw = (base / "stat").read_text()
                end = raw.rfind(")")
                fields = raw[end + 2:].split()
                if fields[0] in {"Z", "X"}:
                    continue  # no open files/address space; direct parents reap separately
                rows.append({"pid": int(base.name), "ppid": int(fields[1]), "pgid": int(fields[2]),
                             "start_ticks": int(fields[19]), "state": fields[0], "comm": raw[raw.index("(") + 1:end]})
            except FileNotFoundError:
                continue
            except (OSError, ValueError) as error:
                raise CoexistError("cannot validate process inventory") from error
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
            process = self.proc.read(pid)
            if process is None:
                raise CoexistError("process ancestry disappeared")
            result.append(process)
            if pid == stop_pid or (stop_worker and process["comm"] in {"Runner.Worker", "Runner.Worker.exe"}):
                break
            pid = process["ppid"]
        return result

    def _controller(self, record, role):
        require(isinstance(record, dict) and record.get("format") == FORMAT and record.get("role") == role,
                "wrong coexist passport format/role")
        require(record.get("identity") == self.expected_ci and record.get("profile") == PROFILES[role]
                and record.get("library_sha256") == LIBRARY_SHA256, "coexist identity/profile/library mismatch")
        require(record.get("phase") in {"shared", "exclusive", "closed"}, "invalid coexist phase")
        require(type(record.get("pid")) is int and record["pid"] > 0 and
                type(record.get("start_ticks")) is int and record["start_ticks"] > 0 and
                record.get("uid") == self.uid, "invalid controller PID/starttime/UID")
        process = self.proc.read(record.get("pid"))
        require(process is not None and process["start_ticks"] == record.get("start_ticks") and process["uid"] == self.uid,
                "stale or wrong-UID coexist controller")
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
        process = self.proc.read(child["pgid"])
        rows = self.proc.snapshot()
        group = [r for r in rows if r["pgid"] == child["pgid"]]
        if not group:
            return None
        require(process is not None and process["pid"] == process["pgid"] and
                process["start_ticks"] == child["start_ticks"] and process["uid"] == self.uid,
                "stale/orphaned owned child group")
        require(controller["pid"] in {p["pid"] for p in self._ancestors(process["ppid"], stop_pid=controller["pid"])}, "child is not owned by registered controller")
        return child

    def _publish_locked(self, phase, child_pgid):
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
            existing = self.proc.read(previous.get("pid"))
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
            child_process = self.proc.read(child_pgid)
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
            workers = [p for p in self._ancestors(process["ppid"], stop_worker=True) if p["comm"] in {"Runner.Worker", "Runner.Worker.exe"}]
            require(workers, "CI controller has no Runner.Worker ancestor")
            record["runner_worker"] = {"pid": workers[0]["pid"], "start_ticks": workers[0]["start_ticks"]}
        controller = self._controller(record, self.role)
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

    def authorized_foreign(self, rows, own_group=None):
        record = self.peer()
        if record is None:
            return set()
        if record["phase"] == "closed":
            return set()
        require(record["phase"] == "shared", "peer requires exclusive phase")
        inventory = self.proc.snapshot()
        allowed = {record["pid"]}
        changed = True
        while changed:
            before = len(allowed)
            allowed.update(p["pid"] for p in inventory if p["ppid"] in allowed)
            changed = len(allowed) != before
        if self.role == "research":
            allowed.add(record["runner_worker"]["pid"])
        for row in rows:
            if row["pid"] in allowed:
                process = self.proc.read(row["pid"])
                require(process is not None and process["uid"] == self.uid, "allowed peer process identity disappeared")
        peer_rows = [row for row in rows if row["pid"] in allowed and row["pid"] !=
                     (record.get("runner_worker") or {}).get("pid")]
        require(sum(row.get("rss", 0) for row in peer_rows) <= PROFILES[self.peer_role]["rss_limit_bytes"],
                "peer exceeds registered RSS profile")
        lean = [row for row in peer_rows if row["comm"] == "lean"]
        require(len(lean) <= PROFILES[self.peer_role]["jobs"], "peer exceeds registered Lean concurrency")
        require(all("-j1" in self.proc.read(row["pid"])["args"] for row in lean), "peer Lean child lacks -j1")
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
                if self.proc.read(child.pid) is None and child.poll() is not None and not any(
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
        return self.publish(phase=self.current["phase"] if self.current else "shared", child_pgid=None)

    def peer_child_present(self):
        record = self.peer()
        child = (record.get("child") if record else None) or self.last_peer_child
        if child is None:
            return False
        return any(row["pgid"] == child["pgid"] for row in self.proc.snapshot())

    def close(self):
        return self.publish(phase="closed", child_pgid=None)

#!/usr/bin/env python3
"""Pure fixtures and fake children: these tests never execute Lake or Lean."""
import argparse
from contextlib import contextmanager, redirect_stdout, redirect_stderr
import io
import json
import os
from pathlib import Path
import signal
import tempfile
import unittest
from unittest.mock import patch

import build_caps_batches as b
import caps_coexist as c
VALIDATE = b.validate_registry


class Fixture(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        for path, text in {
            "lakefile.toml": 'name = "grothe"\n[[lean_lib]]\nname = "GrotheCapsKernel"\nprecompileModules = true\n',
            "lake-manifest.json": "{}\n", "lean-toolchain": "leanprover/lean4:v4.34.1\n",
            "GrotheCapsKernel.lean": "import GrotheCapsKernel.Basic\n",
            "GrotheCapsKernel/Basic.lean": "def plain : Nat := 1\n",
            "Grothe/Data.lean": "import GrotheCapsKernel.Basic\ndef data : Nat := 2\n",
            "Grothe/A.lean": "import Grothe.Data\ntheorem a : True := by native_decide\n",
            "Grothe/B.lean": "import Grothe.Data\ntheorem b : True := by native_decide\n",
            b.DIRECT[0]: "-- directly hashed assembly\n",
            b.DIRECT[1]: "-- directly hashed Row12 assembly\n",
            b.EXECUTION[0]: "# fixture runner source\n", b.EXECUTION[1]: "# fixture stamp source\n",
            b.EXECUTION[2]: "# fixture coexist source\n",
        }.items():
            self.write(path, text)
        self.registry_path = self.root / b.REGISTRY
        self.registry = self.regenerate()
        self.args = argparse.Namespace(root=self.root, registry=self.registry_path,
                                       registry_sha256=b.sha(self.registry_path.read_bytes()),
                                       run_dir=self.root / ".lake/caps-batches", stop_file=self.root / ".lake/CAPS_BATCH_STOP",
                                       jobs=2, rss_limit_gib=24, disk_floor_gib=3, lake="lake", poll_seconds=0.001)

    def write(self, path, text):
        destination = self.root / path
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_text(text)

    def regenerate(self):
        graph = b.Graph(self.root)
        roots = ["Grothe/A.lean", "Grothe/B.lean"]
        ordered = graph.ordered(["GrotheCapsKernel", *map(b.module, roots)])
        pure = [b.source_path(name) for name in ordered if b.source_path(name) not in roots]
        registry = {"format": b.FORMAT, "row": 12, "compute_roots": roots, "pure_roots": pure,
                    "direct_hash_roots": b.DIRECT, "max_parallel_leaves": 2, "lean_child_threads": 1,
                    "execution_source_sha256": {path: b.sha((self.root / path).read_bytes()) for path in b.EXECUTION},
                    "source_sha256": {path: b.sha((self.root / path).read_bytes())
                                      for path in set(roots + pure + b.DIRECT + b.CONFIG)}}
        self.registry_path.parent.mkdir(parents=True, exist_ok=True)
        self.registry_path.write_text(json.dumps(registry))
        return registry

    def validate(self, root=None, registry=None):
        VALIDATE(root or self.root, registry or self.registry, census=False)


class GraphTests(Fixture):
    def test_exact_pure_closure(self):
        self.validate()
        self.assertEqual(self.registry["pure_roots"], ["GrotheCapsKernel/Basic.lean", "GrotheCapsKernel.lean", "Grothe/Data.lean"])

    def test_hidden_native_import_rejected(self):
        self.write("Grothe/Data.lean", "theorem hidden : True := by native_decide\n")
        self.registry = self.regenerate()
        with self.assertRaisesRegex(b.BuildError, "hidden unregistered native"):
            self.validate()

    def test_comment_and_string_mentions_are_pure(self):
        self.write("Grothe/Data.lean", '/- native_decide /- nested -/ -/\n-- native_decide\ndef s := "native_decide"\n')
        self.registry = self.regenerate()
        self.validate()

    def test_native_leaf_must_not_depend_on_native_leaf(self):
        self.write("Grothe/B.lean", "import Grothe.A\ntheorem b : True := by native_decide\n")
        self.registry = self.regenerate()
        with self.assertRaisesRegex(b.BuildError, "dependent native leaves"):
            self.validate()

    def test_cycle_rejected(self):
        self.write("Grothe/Data.lean", "import Grothe.A\n")
        with self.assertRaisesRegex(b.BuildError, "import cycle"):
            self.regenerate()

    def test_missing_project_import_rejected(self):
        self.write("Grothe/Data.lean", "import Grothe.Missing\n")
        with self.assertRaisesRegex(b.BuildError, "missing or symlinked"):
            self.regenerate()

    def test_missing_source_pin_rejected(self):
        self.registry["source_sha256"].pop("Grothe/A.lean")
        with self.assertRaisesRegex(b.BuildError, "pin inventory"):
            self.validate()

    def test_duplicate_root_rejected(self):
        self.registry["compute_roots"].append("Grothe/A.lean")
        with self.assertRaisesRegex(b.BuildError, "duplicate"):
            self.validate()

    def test_changed_source_rejected(self):
        self.write("Grothe/A.lean", "theorem a : True := by native_decide\n-- changed\n")
        with self.assertRaisesRegex(b.BuildError, "source changed"):
            self.validate()

    def test_symlinked_source_rejected(self):
        path = self.root / "Grothe/A.lean"
        path.rename(self.root / "Grothe/Original.lean")
        path.symlink_to(self.root / "Grothe/Original.lean")
        with self.assertRaisesRegex(b.BuildError, "invalid pinned source"):
            self.validate()

    def test_unsupported_import_syntax_rejected(self):
        self.write("Grothe/Data.lean", "import GrotheCapsKernel.Basic; import Grothe.A\n")
        with self.assertRaises(Exception):
            self.regenerate()

    def test_groups_are_at_most_jobs_and_pure_first(self):
        plan = list(b.groups(self.registry, 2))
        self.assertEqual([phase for phase, _ in plan], ["pure", "pure", "native"])
        self.assertTrue(all(len(targets) <= 2 for _, targets in plan))
        self.assertEqual(list(b.groups(self.registry, 1))[-2:], [("native", ["Grothe.A"]), ("native", ["Grothe.B"])])
        self.assertTrue(all(len(targets) <= 3 for _, targets in b.groups(self.registry, 3)))
        for bad in (0, -1, 2.0):
            with self.assertRaises(b.BuildError):
                list(b.groups(self.registry, bad))
        self.assertGreaterEqual(b.machine_jobs(), 1)


def idle_watch(*_):
    return {"rss_bytes": 0, "disk_free_bytes": 5 * 2**30, "lean_processes": 0, "owned_pids": [], "pause_reason": None}


class OverlayTests(unittest.TestCase):
    def test_stale_overlay_is_left_alone_while_foreign_work_is_active(self):
        class Stale(Fixture):
            def runTest(self): pass
        fixture = Stale(); fixture.setUp()
        try:
            def busy(*_):
                return {"rss_bytes": 0, "disk_free_bytes": 5 * 2**30, "lean_processes": 0, "owned_pids": [],
                        "pause_reason": "foreign Lean/Lake work is active"}
            runner = b.Runner(fixture.args, fixture.registry, watch=busy)
            runner.overlay.parent.mkdir(parents=True, exist_ok=True)
            stale = b'weakLeanArgs = ["-j1"]\nname = "older"\n'
            runner.overlay.write_bytes(stale)
            with self.assertRaisesRegex(b.Pause, "foreign Lean/Lake work"):
                runner.adopt_overlay()
            self.assertEqual(runner.overlay.read_bytes(), stale)
        finally:
            fixture.tearDown()

    def test_overlay_symlink_is_rejected_and_its_target_untouched(self):
        class Linked(Fixture):
            def runTest(self): pass
        fixture = Linked(); fixture.setUp()
        try:
            runner = b.Runner(fixture.args, fixture.registry, watch=idle_watch, validate=lambda *a, **k: None)
            runner.overlay.parent.mkdir(parents=True, exist_ok=True)
            target = fixture.root / "elsewhere.toml"
            target.write_bytes(b"external = true\n")
            runner.overlay.symlink_to(target)
            for action in (runner.adopt_overlay, runner.check, runner.overlay_is_regular):
                with self.assertRaisesRegex(b.BuildError, "regular file"):
                    action()
            self.assertEqual(target.read_bytes(), b"external = true\n")
            self.assertTrue(runner.overlay.is_symlink())
        finally:
            fixture.tearDown()

    def test_stale_overlay_of_an_earlier_run_is_replaced(self):
        class Stale(Fixture):
            def runTest(self): pass
        fixture = Stale(); fixture.setUp()
        try:
            runner = b.Runner(fixture.args, fixture.registry, watch=idle_watch)
            runner.overlay.parent.mkdir(parents=True, exist_ok=True)
            runner.overlay.write_bytes(b'weakLeanArgs = ["-j1"]\nname = "older"\n')
            self.assertNotEqual(runner.overlay.read_bytes(), runner.overlay_data)
            runner.adopt_overlay()
            self.assertEqual(runner.overlay.read_bytes(), runner.overlay_data)
            runner.adopt_overlay()
            self.assertEqual(runner.overlay.read_bytes(), runner.overlay_data)
        finally:
            fixture.tearDown()

    def test_only_weak_args_change(self):
        source = b'name="grothe"\n[[lean_lib]]\nname="GrotheCapsKernel"\nprecompileModules=true\n'
        result = b.overlay_bytes(source)
        parsed = b.tomllib.loads(result.decode())
        self.assertEqual(parsed.pop("weakLeanArgs"), ["-j1"])
        self.assertEqual(parsed, b.tomllib.loads(source.decode()))
        self.assertTrue(result.endswith(source))

    def test_existing_package_weak_args_rejected(self):
        with self.assertRaises(b.BuildError):
            b.overlay_bytes(b'weakLeanArgs=["-j1"]\nname="grothe"\n')

    def test_nested_thread_override_rejected(self):
        for option in ('"-j8"', '"--threads=8"'):
            with self.subTest(option=option), self.assertRaises(b.BuildError):
                b.overlay_bytes(f'name="grothe"\n[[lean_lib]]\nname="Grothe"\nmoreLeanArgs=[{option}]\n'.encode())

    def test_malformed_args_rejected(self):
        with self.assertRaises(b.BuildError):
            b.overlay_bytes(b'name="grothe"\n[[lean_lib]]\nname="Grothe"\nmoreLeanArgs="-j1"\n')

    def test_unterminated_lean_comment_is_not_silently_pure(self):
        with self.assertRaises(b.BuildError):
            b.lean_code("/- native_decide")


class GuardTests(Fixture):
    def observation(self, rows=(), **kwargs):
        return b.observe(self.root, 100, 2, 24 * 2**30, 3 * 2**30, self.args.stop_file,
                         rows=list(rows), free=kwargs.get("free", 5 * 2**30))

    def row(self, pid, pgid=100, rss=2**30, comm="lean", args="lean -j1 Grothe/A.lean"):
        return dict(pid=pid, pgid=pgid, rss=rss, comm=comm, args=args)

    def test_actual_two_single_thread_leaves(self):
        self.assertIsNone(self.observation([self.row(101), self.row(102)])["pause_reason"])

    def test_actual_three_leaves_pause(self):
        self.assertIn("concurrency", self.observation([self.row(i) for i in range(101, 104)])["pause_reason"])

    def test_missing_child_j1_pauses(self):
        self.assertIn("lacks -j1", self.observation([self.row(101, args="lean -j8")])["pause_reason"])

    def test_defunct_lean_is_not_an_active_thread_or_foreign_worker(self):
        rows = [dict(self.row(101, rss=0, args="[lean] <defunct>"), state="Z"),
                dict(self.row(102, pgid=999, rss=0, args="[lean] <defunct>"), state="X")]
        observed = self.observation(rows)
        self.assertIsNone(observed["pause_reason"])
        self.assertEqual(observed["lean_processes"], 0)
        self.assertEqual(observed["owned_pids"], [])

    def test_live_zero_rss_still_requires_j1_and_has_safe_rejection_details(self):
        row = dict(self.row(101, rss=0, args="lean -j8 private-sensitive-argument"), state="R")
        observed = self.observation([row])
        self.assertIn("lacks -j1", observed["pause_reason"])
        self.assertEqual(observed["owned_pids"], [101])
        self.assertEqual(observed["rejected_processes"], [{"pid": 101, "pgid": 100, "state": "R",
            "start_ticks": None, "comm": "lean", "executable": "lean", "module": None,
            "command_source": "fixture-or-unavailable", "argv_shape": ["lean", "-j8", "<arg>"],
            "thread_flags": ["-j8"]}])
        self.assertNotIn("private-sensitive", json.dumps(observed))

    def test_process_inventory_uses_proc_argv_and_retains_live_zero_rss(self):
        proc = FakeProcFS()
        proc.rows[103] = dict(self.row(103, rss=0, args=["lean", "-j1"]), start_ticks=9, state="S")
        with patch.object(b.subprocess, "run", side_effect=AssertionError("ps is not argv authority")):
            rows = b.process_rows(proc)
        self.assertEqual([r["pid"] for r in rows], [103])
        self.assertEqual(rows[0]["rss"], 0)
        self.assertEqual(rows[0]["args"], ["lean", "-j1"])

    def test_process_exiting_after_inventory_does_not_become_empty_argv(self):
        proc = FakeProcFS()
        proc.rows[103] = dict(self.row(103, rss=0), start_ticks=9)
        with patch.object(proc, "command", return_value=None):
            self.assertEqual(b.process_rows(proc), [])

    def test_aggregate_memory_and_disk_pause(self):
        self.assertIn("RSS", self.observation([self.row(101, rss=25 * 2**30)])["pause_reason"])
        self.assertIn("disk", self.observation(free=2 * 2**30)["pause_reason"])

    def test_foreign_lean_pauses_without_killing_it(self):
        self.assertIn("foreign", self.observation([self.row(101, pgid=999)])["pause_reason"])

    def test_stop_file_pauses(self):
        self.args.stop_file.parent.mkdir(parents=True)
        self.args.stop_file.touch()
        self.assertIn("stop file", self.observation()["pause_reason"])

    def test_lock_is_nonblocking(self):
        with b.build_lock(self.root / ".lake/lock"):
            with self.assertRaises(b.Pause):
                with b.build_lock(self.root / ".lake/lock"):
                    self.fail("lock collision was allowed")


class FakeProcess:
    pid = 4312

    def __init__(self, exit_code=0, exit_after_poll=2):
        self.exit_code, self.polls, self.alive = exit_code, 0, True
        self.exit_after_poll = exit_after_poll

    def poll(self):
        self.polls += 1
        if self.polls < self.exit_after_poll and self.alive:
            return None
        self.alive = False
        return self.exit_code

    def wait(self, timeout=None):
        self.alive = False
        return self.exit_code


class FakeProcFS:
    def __init__(self):
        self.rows = {}
        self.denied = set()
        self.available = 32 * c.GIB

    def basic(self, pid):
        row = self.rows.get(pid)
        return None if row is None else {k: v for k, v in row.items() if k not in {"args", "cwd", "environ"}}

    def command(self, pid, *, expected_start=None, expected_pgid=None):
        row = self.rows.get(pid)
        if row is not None:
            c.require(expected_start is None or row["start_ticks"] == expected_start, "process PID/starttime changed")
            c.require(expected_pgid is None or row["pgid"] == expected_pgid, "process group identity changed")
        return row

    def read(self, pid):
        if pid in self.denied:
            raise c.CoexistError("fixture process permission denied")
        return self.rows.get(pid)

    def snapshot(self):
        return [dict(row) for row in self.rows.values()]

    def mem_available(self):
        return self.available


class CoexistTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name).resolve()
        self.ci_root, self.num_root = self.root / "ci", self.root / "research"
        for root, name in ((self.ci_root, c.SCRIPTS["ci"]), (self.num_root, c.SCRIPTS["research"])):
            path = root / name
            path.parent.mkdir(parents=True)
            path.write_text("# pinned fixture controller\n")
        self.proc = FakeProcFS()
        self.ident = {"run_id": "40459025380", "sha": "a" * 40, "repository": c.REPOSITORY}
        self.add(90, 10, self.ci_root, "Runner.Worker", ["Runner.Worker", "spawnclient"])
        self.add(100, 90, self.ci_root, "python3", ["python3", c.SCRIPTS["ci"]], environ={
            "GITHUB_RUN_ID": self.ident["run_id"], "GITHUB_SHA": self.ident["sha"],
            "GITHUB_REPOSITORY": self.ident["repository"], "GITHUB_WORKSPACE": str(self.ci_root)})
        self.add(200, 20, self.num_root, "python3", ["python3", c.SCRIPTS["research"]])
        self.proc.denied.add(10)  # valid ancestry must stop at the matching Worker before this system PID
        self.signals = []
        self.ci = self.session("ci", 100, self.ci_root)
        self.num = self.session("research", 200, self.num_root)
        self.ci.publish()
        self.num.publish()

    def add(self, pid, ppid, root, comm, args, *, pgid=None, environ=None, rss=0):
        self.proc.rows[pid] = {"pid": pid, "ppid": ppid, "pgid": pid if pgid is None else pgid,
            "uid": os.getuid(), "start_ticks": pid * 100, "cwd": str(root), "comm": comm,
            "args": args, "environ": environ or {}, "rss": rss}

    def session(self, role, pid, root, **kwargs):
        return c.Coexist(self.root / "share", role=role, root=root,
            jobs=c.PROFILES[role]["jobs"], rss_limit_gib=c.PROFILES[role]["rss_limit_bytes"] / c.GIB,
            expected_ci=self.ident, research_root=self.num_root if role == "ci" else None,
            proc=self.proc, pid=pid, killpg=lambda pgid, sig: self.kill(pgid, sig), **kwargs)

    def kill(self, pgid, sig):
        self.signals.append((pgid, sig))
        for pid in [p["pid"] for p in self.proc.snapshot() if p["pgid"] == pgid]:
            self.proc.rows.pop(pid)

    def mutate_passport(self, role, **changes):
        path = self.root / "share" / (role + ".json")
        value = json.loads(path.read_text())
        value.update(changes)
        path.write_text(json.dumps(value))

    def test_exact_ci_worker_only_is_authorized(self):
        self.add(101, 100, self.ci_root, "lake", ["lake"], rss=c.GIB)
        self.add(102, 101, self.ci_root, "lean", ["lean", "-j1"], pgid=101, rss=c.GIB)
        self.add(91, 10, self.ci_root, "Runner.Worker", ["Runner.Worker"])
        self.add(301, 20, self.num_root, "lean", ["lean", "-j1"])
        self.ci.publish(child_pgid=101)
        allowed = self.num.authorized_foreign(self.proc.snapshot())
        self.assertTrue({90, 100, 101, 102} <= allowed)
        self.assertNotIn(91, allowed)
        self.assertNotIn(301, allowed)

    def test_ci_only_authorizes_registered_research_tree(self):
        self.add(201, 200, self.num_root, "lake", ["lake"])
        self.add(202, 201, self.num_root, "lean", ["lean", "-j1"], pgid=201)
        self.num.publish(child_pgid=201)
        self.assertEqual(self.ci.authorized_foreign(self.proc.snapshot()), {200, 201, 202})

    def observed(self, rows):
        return b.observe(self.ci_root, 999, 2, 20 * c.GIB, 3 * c.GIB,
                         self.root / "STOP", rows=rows, free=5 * c.GIB)

    def test_cached_peer_lake_exits_after_sample_and_is_removed_not_whitelisted(self):
        self.add(201, 200, self.num_root, "lake", ["lake"], rss=c.GIB)
        self.num.publish(child_pgid=201)
        sampled = b.process_rows(self.proc)
        self.proc.rows.pop(201)
        self.num.clear_child()
        rows, allowed = self.ci.authorized_rows(sampled)
        self.assertNotIn(201, {row["pid"] for row in rows})
        self.assertNotIn(201, allowed)
        self.assertIsNone(b.observe(self.ci_root, 999, 2, 20*c.GIB, 3*c.GIB, self.root/"STOP",
                                   rows=rows, free=5*c.GIB, allowed_pids=allowed)["pause_reason"])

    def test_numerical_compatibility_guard_uses_same_reconciled_list(self):
        self.add(101, 100, self.ci_root, "lake", ["lake"])
        self.ci.publish(child_pgid=101)
        sampled = b.process_rows(self.proc)
        self.proc.rows.pop(101); self.ci.clear_child()
        identity = id(sampled)
        allowed = self.num.authorized_foreign(sampled)
        self.assertEqual(id(sampled), identity)
        self.assertNotIn(101, {row["pid"] for row in sampled})
        self.assertNotIn(101, allowed)

    def test_peer_closes_after_sample_does_not_make_expired_child_foreign(self):
        self.add(201, 200, self.num_root, "lake", ["lake"])
        self.num.publish(child_pgid=201)
        sampled = b.process_rows(self.proc)
        self.proc.rows.pop(201); self.num.clear_child(); self.num.close(); self.proc.rows.pop(200)
        rows, allowed = self.ci.authorized_rows(sampled)
        self.assertEqual(allowed, set())
        self.assertFalse({200,201} & {row["pid"] for row in rows})
        self.assertIsNone(self.observed(rows)["pause_reason"])

    def test_peer_exits_during_admission_is_pruned_before_observe(self):
        self.add(201, 200, self.num_root, "lake", ["lake"])
        self.num.publish(child_pgid=201)
        sampled = b.process_rows(self.proc)
        original = self.ci._live_sample
        def exiting(rows):
            result = original(rows); self.proc.rows.pop(201, None); return result
        with patch.object(self.ci, "_live_sample", side_effect=exiting):
            rows, allowed = self.ci.authorized_rows(sampled)
        self.assertNotIn(201, allowed)
        self.assertNotIn(201, {row["pid"] for row in rows})

    def test_reused_stale_sample_pid_fails_instead_of_authorizing_or_dropping_it(self):
        self.add(201, 200, self.num_root, "lake", ["lake"])
        self.num.publish(child_pgid=201); sampled = b.process_rows(self.proc)
        self.proc.rows.pop(201); self.num.clear_child()
        self.add(201, 1, self.num_root, "lake", ["lake"])
        self.proc.rows[201]["start_ticks"] += 1
        with self.assertRaisesRegex(c.CoexistError, "sampled process identity changed"):
            self.ci.authorized_rows(sampled)

    def test_wrong_sample_pgid_and_uid_stay_fail_closed(self):
        self.add(301, 1, self.num_root, "lake", ["lake"])
        sampled = b.process_rows(self.proc)
        for field in ("pgid", "uid"):
            with self.subTest(field=field):
                old = self.proc.rows[301][field]; self.proc.rows[301][field] += 1
                with self.assertRaisesRegex(c.CoexistError, "identity changed"):
                    self.ci.authorized_rows(sampled)
                self.proc.rows[301][field] = old

    def test_unidentified_dead_row_is_not_silently_whitelisted(self):
        self.add(301, 1, self.num_root, "lake", ["lake"])
        sampled = b.process_rows(self.proc)
        next(row for row in sampled if row["pid"] == 301).pop("start_ticks")
        self.proc.rows.pop(301)
        with self.assertRaisesRegex(c.CoexistError, "sample lacks"):
            self.ci.authorized_rows(sampled)

    def test_live_unregistered_peer_lookalike_remains_foreign(self):
        self.add(301, 1, self.num_root, "lake", ["lake"])
        rows, allowed = self.ci.authorized_rows(b.process_rows(self.proc))
        self.assertNotIn(301, allowed)
        self.assertIn("foreign", b.observe(self.ci_root,999,2,20*c.GIB,3*c.GIB,self.root/"STOP",
                         rows=rows,free=5*c.GIB,allowed_pids=allowed)["pause_reason"])

    def test_live_reparented_descendant_is_not_authorized_through_old_ppid(self):
        self.add(201, 200, self.num_root, "lake", ["lake"])
        self.add(202, 201, self.num_root, "lean", ["lean", "-j1"], pgid=201)
        self.num.publish(child_pgid=201); sampled = b.process_rows(self.proc)
        self.proc.rows[202]["ppid"] = 1
        rows, allowed = self.ci.authorized_rows(sampled)
        self.assertIn(201, allowed); self.assertNotIn(202, allowed)
        self.assertEqual(next(row for row in rows if row["pid"] == 202)["ppid"],1)
        self.assertIn("foreign", b.observe(self.ci_root,999,2,20*c.GIB,3*c.GIB,self.root/"STOP",
                         rows=rows,free=5*c.GIB,allowed_pids=allowed)["pause_reason"])

    def test_leader_exit_during_sampling_cannot_authorize_live_orphan(self):
        self.add(201, 200, self.num_root, "lake", ["lake"])
        self.add(202, 201, self.num_root, "lean", ["lean", "-j1"], pgid=201)
        self.num.publish(child_pgid=201); sampled = b.process_rows(self.proc)
        original = self.ci._live_sample
        def orphaning(rows):
            result = original(rows); self.proc.rows.pop(201,None); self.proc.rows[202]["ppid"] = 1
            return result
        with patch.object(self.ci,"_live_sample",side_effect=orphaning):
            with self.assertRaisesRegex(c.CoexistError,"orphaned"):
                self.ci.authorized_rows(sampled)

    def test_exec_transition_refreshes_frozen_exe_module_and_args(self):
        self.add(201, 200, self.num_root, "lean", ["lean", "-j1", "Old.lean"])
        self.num.publish(child_pgid=201); sampled = b.process_rows(self.proc)
        next(row for row in sampled if row["pid"] == 201).update(exe="lean",module="Old.lean")
        self.proc.rows[201].update(comm="gcc",args=["gcc","compiler-input"])
        rows, allowed = self.ci.authorized_rows(sampled)
        current = next(row for row in rows if row["pid"] == 201)
        self.assertEqual((current["comm"],current["exe"],current["module"],current["args"]),("gcc","gcc",None,[]))
        self.assertIn(201,allowed)

    def test_admission_liveness_checks_hold_common_transaction_lock(self):
        original = self.ci._live_sample
        def checked(rows):
            with (self.root/"share/coexist.lock").open("r+") as lock:
                with self.assertRaises(BlockingIOError):c.fcntl.flock(lock,c.fcntl.LOCK_EX|c.fcntl.LOCK_NB)
            return original(rows)
        with patch.object(self.ci,"_live_sample",side_effect=checked):
            self.ci.authorized_rows(b.process_rows(self.proc))

    def test_pid_reuse_fails_closed(self):
        self.proc.rows[100]["start_ticks"] += 1
        with self.assertRaisesRegex(c.CoexistError, "stale"):
            self.num.authorized_foreign(self.proc.snapshot())

    def test_pid_reuse_between_basic_and_full_read_cannot_authenticate_old_passport(self):
        original = self.proc.read
        def reused(pid):
            process = original(pid)
            return dict(process, start_ticks=process["start_ticks"] + 1) if pid == 100 else process
        with patch.object(self.proc, "read", side_effect=reused):
            with self.assertRaisesRegex(c.CoexistError, "identity changed"):
                self.num.peer()

    def test_wrong_ci_environment_fails_closed(self):
        self.proc.rows[100]["environ"]["GITHUB_SHA"] = "b" * 40
        with self.assertRaises(c.CoexistError):
            self.num.peer()

    def test_python_c_spoof_is_rejected(self):
        self.proc.rows[100]["args"] = ["python3", "-c", "print('unrelated')", c.SCRIPTS["ci"]]
        with self.assertRaisesRegex(c.CoexistError, "script position"):
            self.num.peer()

    def test_wrong_uid_and_profile_fail_closed(self):
        self.proc.rows[200]["uid"] += 1
        with self.assertRaises(c.CoexistError):
            self.ci.peer()
        self.proc.rows[200]["uid"] = os.getuid()
        self.mutate_passport("research", profile={"jobs": 7, "rss_limit_bytes": 8 * c.GIB})
        with self.assertRaises(c.CoexistError):
            self.ci.peer()

    def test_missing_ancestry_above_worker_is_not_read(self):
        self.assertEqual(self.num.peer()["runner_worker"]["pid"], 90)

    def test_ancestors_need_no_protected_environment_or_cwd(self):
        self.proc.denied.add(90)
        self.assertEqual(self.num.peer()["runner_worker"]["pid"], 90)

    def reparent_ci(self):
        self.add(1, 0, self.ci_root, "systemd", ["systemd"])
        self.proc.denied.add(1)
        self.proc.rows[100]["ppid"] = 1

    def test_reparented_controller_cannot_grant_shared_work_but_can_withdraw(self):
        self.reparent_ci()
        with self.assertRaisesRegex(c.CoexistError, "Worker ancestor"):
            self.ci.publish()
        with self.assertRaisesRegex(c.CoexistError, "ancestor mismatch"):
            self.num.peer()
        self.assertEqual(self.ci.clear_child()["phase"], "exclusive")
        self.assertEqual(self.ci.close()["phase"], "closed")
        self.assertEqual(self.num.authorized_foreign(self.proc.snapshot()), set())
        self.assertEqual(self.signals, [])

    def test_cleanup_cannot_clear_a_live_child_after_reparenting(self):
        self.add(101, 100, self.ci_root, "lake", ["lake"])
        self.ci.publish(child_pgid=101)
        self.reparent_ci()
        with self.assertRaisesRegex(c.CoexistError, "live owned child"):
            self.ci.clear_child()
        with self.assertRaisesRegex(c.CoexistError, "live owned child"):
            self.ci.close()
        self.assertEqual(self.signals, [])

    def test_reparented_cleanup_keeps_identity_and_source_checks(self):
        self.reparent_ci()
        self.proc.rows[100]["environ"]["GITHUB_SHA"] = "b" * 40
        with self.assertRaises(c.CoexistError):
            self.ci.close()
        self.proc.rows[100]["environ"]["GITHUB_SHA"] = self.ident["sha"]
        (self.ci_root / c.SCRIPTS["ci"]).write_text("# changed\n")
        with self.assertRaises(c.CoexistError):
            self.ci.close()

    def test_permission_error_in_required_controller_fails_closed(self):
        self.proc.denied.add(100)
        with self.assertRaises(c.CoexistError):
            self.num.peer()

    def test_source_change_is_rejected(self):
        (self.ci_root / c.SCRIPTS["ci"]).write_text("# changed\n")
        with self.assertRaisesRegex(c.CoexistError, "source changed"):
            self.num.peer()

    def test_own_passport_cannot_relabel_changed_running_source(self):
        (self.num_root / c.SCRIPTS["research"]).write_text("# changed underneath controller\n")
        with self.assertRaisesRegex(c.CoexistError, "own coexist execution source changed"):
            self.num.publish()

    def test_peer_rss_budget_is_checked_before_whitelist(self):
        self.add(201, 200, self.num_root, "lean", ["lean", "-j1"], rss=9 * c.GIB)
        self.num.publish(child_pgid=201)
        with self.assertRaisesRegex(c.CoexistError, "RSS"):
            self.ci.authorized_foreign(self.proc.snapshot())

    def test_peer_thread_and_process_budget_is_checked(self):
        self.add(201, 200, self.num_root, "lean", ["lean", "-j8"])
        self.num.publish(child_pgid=201)
        with self.assertRaisesRegex(c.CoexistError, "-j1"):
            self.ci.authorized_foreign(self.proc.snapshot())
        self.proc.rows[201]["args"] = ["lean", "-j1"]
        self.add(202, 201, self.num_root, "lean", ["lean", "-j1"], pgid=201)
        with self.assertRaisesRegex(c.CoexistError, "concurrency"):
            self.ci.authorized_foreign(self.proc.snapshot())

    def test_insecure_or_symlinked_passport_fails_closed(self):
        path = self.root / "share/ci.json"
        path.chmod(0o644)
        with self.assertRaises(c.CoexistError):
            self.num.peer()
        path.chmod(0o600)
        path.rename(self.root / "copy.json")
        path.symlink_to(self.root / "copy.json")
        with self.assertRaises((c.CoexistError, OSError)):
            self.num.peer()

    def test_stale_child_group_is_not_authorized(self):
        self.add(201, 200, self.num_root, "lake", ["lake"])
        self.num.publish(child_pgid=201)
        self.proc.rows[201]["start_ticks"] += 1
        with self.assertRaisesRegex(c.CoexistError, "stale"):
            self.ci.peer()

    def test_dead_controller_cannot_erase_live_old_python_group(self):
        self.add(201, 200, self.num_root, "python3", ["python3", "solve.py"])
        self.num.publish(child_pgid=201)
        self.proc.rows.pop(200)
        self.add(210, 20, self.num_root, "python3", ["python3", c.SCRIPTS["research"]])
        replacement = self.session("research", 210, self.num_root)
        with self.assertRaisesRegex(c.CoexistError, "left a live child"):
            replacement.publish()
        self.assertEqual(json.loads((self.root / "share/research.json").read_text())["pid"], 200)
        self.assertEqual(self.signals, [])

    def test_reused_controller_pid_cannot_erase_live_old_group(self):
        self.add(201, 200, self.num_root, "python3", ["python3", "solve.py"])
        self.num.publish(child_pgid=201)
        self.proc.rows[200]["start_ticks"] += 1
        with self.assertRaisesRegex(c.CoexistError, "left a live child"):
            self.num.publish()

    def test_exclusive_phase_prevents_new_research_spawn(self):
        self.ci.publish(phase="exclusive")
        with self.assertRaisesRegex(c.CoexistError, "shared phase"):
            self.num.launch_registered(lambda *_a, **_k: self.fail("spawned after exclusive handoff"), ["python"], start_new_session=True)

    def child_factory(self, *_args, **_kwargs):
        self.add(201, 200, self.num_root, "lake", ["lake"])
        outer = self
        class Child:
            pid = 201
            def poll(self):
                return None if 201 in outer.proc.rows else 0
            def wait(self, timeout=None):
                outer.proc.rows.pop(201, None)
                return 0
        return Child()

    def test_spawn_and_registration_are_inside_common_lock(self):
        def factory(*args, **kwargs):
            path = self.root / "share/coexist.lock"
            with path.open("r+") as stream:
                with self.assertRaises(BlockingIOError):
                    c.fcntl.flock(stream, c.fcntl.LOCK_EX | c.fcntl.LOCK_NB)
            return self.child_factory(*args, **kwargs)
        child = self.num.launch_registered(factory, ["lake"], start_new_session=True)
        self.assertEqual(self.ci.peer()["child"]["pgid"], child.pid)
        self.assertTrue(self.ci.peer_child_present())
        child.wait()
        self.num.clear_child()
        self.assertFalse(self.ci.peer_child_present())

    def test_failed_registration_stops_only_new_owned_group(self):
        with patch.object(self.num, "_write", side_effect=c.CoexistError("injected atomic write failure")):
            with self.assertRaisesRegex(c.CoexistError, "atomic write"):
                self.num.launch_registered(self.child_factory, ["lake"], start_new_session=True)
        self.assertEqual(self.signals, [(201, signal.SIGTERM)])
        self.assertNotIn(201, self.proc.rows)
        self.assertIn(100, self.proc.rows)

    def test_machine_headroom_prevents_spawn(self):
        self.proc.available = 2 * c.GIB
        with self.assertRaisesRegex(c.CoexistError, "headroom"):
            self.num.launch_registered(lambda *_a, **_k: self.fail("spawned without headroom"), ["lake"], start_new_session=True)

    def test_missing_or_closed_ci_does_not_whitelist_runner(self):
        self.ci.close()
        self.proc.rows.pop(100)
        self.assertEqual(self.num.authorized_foreign(self.proc.snapshot()), set())
        with self.assertRaisesRegex(c.CoexistError, "unregistered"):
            self.num.launch_registered(self.child_factory, ["lake"], start_new_session=True)
        self.proc.rows.pop(90)
        child = self.num.launch_registered(self.child_factory, ["lake"], start_new_session=True)
        child.wait()
        self.num.clear_child()
        (self.root / "share/ci.json").unlink()
        self.assertEqual(self.num.authorized_foreign(self.proc.snapshot()), set())

    def test_future_research_root_can_be_absent_before_deployment(self):
        absent = self.root / "not-deployed-yet/repo"
        session = c.Coexist(self.root / "share", role="ci", root=self.ci_root, jobs=2, rss_limit_gib=20,
                            expected_ci=self.ident, research_root=absent, proc=self.proc, pid=100)
        self.assertEqual(session.research_root, absent)

    def test_shared_proc_inventory_ignores_z_and_x_before_argv_or_memory_checks(self):
        base = self.root / "proc-fixture"
        for pid, state in ((1, "Z"), (2, "X"), (3, "S")):
            directory = base / str(pid)
            directory.mkdir(parents=True)
            fields = [state, "200", str(pid), *("0" for _ in range(19))]
            fields[19] = "12345"
            (directory / "stat").write_text(f"{pid} (lean) " + " ".join(fields))
            (directory / "status").write_text(f"Uid:\t{os.getuid()}\t{os.getuid()}\t{os.getuid()}\t{os.getuid()}\n")
        real_path = c.Path
        with patch.object(c, "Path", side_effect=lambda value: base if str(value) == "/proc" else real_path(value)):
            rows = c.ProcFS().snapshot()
            self.assertIsNone(c.ProcFS().read(1))
            self.assertIsNone(c.ProcFS().read(2))
        self.assertEqual([r["pid"] for r in rows], [3])


class ProcCommandTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.base = Path(self.temp.name)
        self.pid_dir = self.base / "103"
        self.pid_dir.mkdir()
        self.stat()
        (self.pid_dir / "status").write_text(f"Uid:\t{os.getuid()}\t{os.getuid()}\t{os.getuid()}\t{os.getuid()}\n")
        real_path = c.Path
        self.path_patch = patch.object(c, "Path", side_effect=lambda value: self.base if str(value) == "/proc" else real_path(value))
        self.path_patch.start()
        self.addCleanup(self.path_patch.stop)

    def stat(self, *, start=99, state="R", pgid=100, flags=0, rss_pages=0, comm="lean"):
        fields = [state, "100", str(pgid), *("0" for _ in range(19))]
        fields[6] = str(flags)
        fields[19] = str(start)
        fields[21] = str(rss_pages)
        (self.pid_dir / "stat").write_text("103 (" + comm + ") " + " ".join(fields))

    def command(self, argv):
        (self.pid_dir / "cmdline").write_bytes(b"\0".join(value.encode() for value in argv) + b"\0")

    @contextmanager
    def clock(self, on_sleep=lambda elapsed, sleeps: None):
        elapsed, sleeps = [0.0], []
        def sleep(seconds):
            sleeps.append(seconds)
            elapsed[0] += seconds
            on_sleep(elapsed[0], sleeps)
        with patch.object(c.time, "monotonic", side_effect=lambda: elapsed[0]), patch.object(c.time, "sleep", side_effect=sleep):
            yield elapsed, sleeps

    def test_full_nul_argv_preserves_j1_after_long_path(self):
        argv = ["/a/" + "b" * 400 + "/lean", "-o", "output with spaces.olean", "-j1", "Grothe/A.lean"]
        self.command(argv)
        value = c.ProcFS().command(103, expected_start=99, expected_pgid=100)
        self.assertEqual(value["args"], argv)
        self.assertEqual(value["command_source"], "proc-cmdline")
        rows = b.process_rows(c.ProcFS())
        self.assertIsNone(b.observe(self.base, 100, 2, 24*c.GIB, 3*c.GIB, self.base / "STOP", rows=rows, free=5*c.GIB)["pause_reason"])

    def test_genuinely_live_wrong_threads_fail_with_sanitized_diagnostics(self):
        self.command(["/bin/lean", "-j8", "Grothe/A.lean", "secret-token-value"])
        rows = b.process_rows(c.ProcFS())
        observed = b.observe(self.base, 100, 2, 24*c.GIB, 3*c.GIB, self.base / "STOP", rows=rows, free=5*c.GIB)
        self.assertEqual(observed["pause_reason"], "actual Lean child lacks -j1")
        self.assertEqual(observed["rejected_processes"][0]["command_source"], "proc-cmdline")
        self.assertEqual(observed["rejected_processes"][0]["thread_flags"], ["-j8"])
        self.assertNotIn("secret-token", json.dumps(observed))

    def test_stable_empty_command_fails_closed(self):
        for flags in (0, 4):  # PF_EXITING describes a task, never an argv bypass.
            with self.subTest(flags=flags):
                self.stat(flags=flags, rss_pages=23)
                (self.pid_dir / "cmdline").write_bytes(b"")
                with self.clock() as (elapsed, sleeps), self.assertRaisesRegex(c.CoexistError, "did not stabilize") as caught:
                    c.ProcFS().command(103)
                diagnostic = json.loads(str(caught.exception).split(": ", 1)[1])
                self.assertGreater(diagnostic["attempt_count"], 3)
                self.assertGreaterEqual(elapsed[0], c.COMMAND_TIMEOUT_SECONDS)
                self.assertLessEqual(elapsed[0], c.COMMAND_TIMEOUT_SECONDS + 0.000001)
                self.assertEqual(diagnostic["final_process"]["flags"], flags)
                self.assertEqual(diagnostic["final_process"]["rss"], 23 * os.sysconf("SC_PAGE_SIZE"))
                self.assertEqual(diagnostic["recent_samples"][-1]["raw_lengths"], [0, 0])
                self.assertLessEqual(len(diagnostic["recent_samples"]), 8)
                self.assertTrue(sleeps)

    def test_command_stabilizes_after_more_than_the_old_retry_window(self):
        (self.pid_dir / "cmdline").write_bytes(b"")
        argv = ["lean", "-j1", "Grothe/A.lean"]
        def ready(elapsed, sleeps):
            if len(sleeps) == 5:
                self.command(argv)
        with self.clock(ready) as (elapsed, sleeps):
            value = c.ProcFS().command(103)
        self.assertEqual(value["args"], argv)
        self.assertEqual(len(sleeps), 5)
        self.assertGreater(elapsed[0], 0.03)

    def test_changing_command_has_bounded_retry_and_private_diagnostics(self):
        self.command(["lean", "-j1", "secret-token-value", "PRIVATE_ENV_VALUE"])
        original = Path.read_bytes
        counts = []
        def changing(path):
            if path.name == "cmdline":
                counts.append(path)
                return original(path) + (b"\0" if len(counts) % 2 else b"")
            return original(path)
        with patch.object(Path, "read_bytes", side_effect=changing, autospec=True), self.clock(), self.assertRaises(c.CoexistError) as caught:
            c.ProcFS().command(103)
        diagnostic = json.loads(str(caught.exception).split(": ", 1)[1])
        self.assertEqual(diagnostic["recent_samples"][-1]["kind"], "argv-changed")
        self.assertEqual(len(diagnostic["recent_samples"][-1]["raw_sha256"]), 2)
        for private in ("secret-token-value", "PRIVATE_ENV_VALUE", "Grothe/A.lean", "-j1"):
            self.assertNotIn(private, str(caught.exception))

    def test_changing_nonempty_command_can_stabilize_after_old_window(self):
        self.command(["lean", "-j1", "Grothe/A.lean"])
        original, counts = Path.read_bytes, []
        def changing(path):
            if path.name == "cmdline":
                counts.append(path)
                return original(path) + (b"\0" if len(counts) <= 10 and len(counts) % 2 else b"")
            return original(path)
        with patch.object(Path, "read_bytes", side_effect=changing, autospec=True), self.clock() as (elapsed, sleeps):
            value = c.ProcFS().command(103)
        self.assertEqual(value["args"], ["lean", "-j1", "Grothe/A.lean"])
        self.assertEqual(len(sleeps), 5)
        self.assertGreater(elapsed[0], 0.03)

    def test_exec_transition_retries_and_returns_current_command(self):
        self.command(["lean", "-j1", "Grothe/A.lean"])
        proc, calls = c.ProcFS(), []
        original = proc.basic
        def exec_transition(pid):
            value = original(pid)
            calls.append(pid)
            if len(calls) == 1:
                self.stat(comm="gcc")
                self.command(["gcc", "-c", "generated.c"])
            return value
        with patch.object(proc, "basic", side_effect=exec_transition), self.clock():
            value = proc.command(103)
        self.assertEqual(value["comm"], "gcc")
        self.assertEqual(value["args"], ["gcc", "-c", "generated.c"])

    def test_empty_command_exit_after_old_window_is_independently_absent(self):
        for state in ("Z", "X", "absent"):
            with self.subTest(state=state):
                self.stat()
                (self.pid_dir / "cmdline").write_bytes(b"")
                def exiting(elapsed, sleeps):
                    if len(sleeps) == 5:
                        if state == "absent":
                            (self.pid_dir / "stat").unlink()
                        else:
                            self.stat(state=state)
                with self.clock(exiting) as (elapsed, sleeps):
                    self.assertIsNone(c.ProcFS().command(103))
                self.assertGreater(elapsed[0], 0.03)

    def test_missing_cmdline_does_not_hide_a_live_process(self):
        with self.clock(), self.assertRaisesRegex(c.CoexistError, "did not stabilize") as caught:
            c.ProcFS().command(103)
        diagnostic = json.loads(str(caught.exception).split(": ", 1)[1])
        self.assertEqual(diagnostic["recent_samples"][-1]["kind"], "cmdline-missing")
        self.assertEqual(diagnostic["final_process"]["start_ticks"], 99)

    def test_missing_cmdline_can_reappear_without_adopting_another_identity(self):
        with self.clock(lambda elapsed, sleeps: self.command(["lean", "-j1"]) if len(sleeps) == 5 else None):
            value = c.ProcFS().command(103)
        self.assertEqual(value["start_ticks"], 99)
        self.assertEqual(value["args"], ["lean", "-j1"])

    def test_retry_keeps_first_identity_without_expected_fields(self):
        for field in ("start", "pgid", "uid"):
            with self.subTest(field=field):
                self.stat()
                (self.pid_dir / "status").write_text(f"Uid:\t{os.getuid()}\t{os.getuid()}\t{os.getuid()}\t{os.getuid()}\n")
                (self.pid_dir / "cmdline").write_bytes(b"")
                def reused(elapsed, sleeps):
                    if len(sleeps) == 5:
                        if field == "uid":
                            (self.pid_dir / "status").write_text("Uid:\t987654\t987654\t987654\t987654\n")
                        else:
                            self.stat(**{field: 101})
                        self.command(["lean", "-j1"])
                with self.clock(reused), self.assertRaisesRegex(c.CoexistError, "identity changed"):
                    c.ProcFS().command(103)

    def test_budget_expiry_performs_final_independent_liveness_check(self):
        (self.pid_dir / "cmdline").write_bytes(b"")
        proc = c.ProcFS()
        original = proc.basic
        expired, clocks, basics = [False], [], []
        def clock():
            clocks.append(True)
            expired[0] = len(clocks) > 1
            return 2.0 if expired[0] else 0.0
        def disappearing(pid):
            basics.append(pid)
            return None if expired[0] else original(pid)
        with patch.object(c.time, "monotonic", side_effect=clock), patch.object(proc, "basic", side_effect=disappearing):
            self.assertIsNone(proc.command(103))
        self.assertEqual(len(basics), 4)  # Three attempt samples, then the independent final one.

    def test_live_missing_j1_and_rss_still_guarded_after_retry(self):
        for argv in (["lean", "-j8", "Grothe/A.lean"], ["lean", "Grothe/A.lean"]):
            with self.subTest(argv=argv):
                self.stat(flags=4, rss_pages=23)
                (self.pid_dir / "cmdline").write_bytes(b"")
                with self.clock(lambda elapsed, sleeps: self.command(argv) if len(sleeps) == 5 else None):
                    rows = b.process_rows(c.ProcFS())
                observed = b.observe(self.base, 100, 2, 24*c.GIB, 3*c.GIB, self.base / "STOP", rows=rows, free=5*c.GIB)
                self.assertEqual(observed["pause_reason"], "actual Lean child lacks -j1")
                self.assertEqual(observed["rss_bytes"], 23 * os.sysconf("SC_PAGE_SIZE"))

    def test_pid_reuse_or_pgid_change_fails_closed(self):
        self.command(["lean", "-j1"])
        for kwargs in ({"expected_start": 98}, {"expected_pgid": 101}):
            with self.assertRaises(c.CoexistError):
                c.ProcFS().command(103, **kwargs)

    def test_exit_during_command_read_returns_absent(self):
        self.command(["lean", "-j1"])
        proc = c.ProcFS()
        original = proc.basic
        calls = []
        def exiting(pid):
            calls.append(pid)
            return original(pid) if len(calls) == 1 else None
        with patch.object(proc, "basic", side_effect=exiting):
            self.assertIsNone(proc.command(103))

    def test_changing_pid_start_during_command_read_is_rejected(self):
        self.command(["lean", "-j1"])
        proc = c.ProcFS()
        original = proc.basic
        def reused(pid):
            value = original(pid)
            self.stat(start=100)
            return value
        with patch.object(proc, "basic", side_effect=reused):
            with self.assertRaisesRegex(c.CoexistError, "identity changed"):
                proc.command(103)


class RunnerTests(Fixture):
    def runner(self, *, exit_code=0, pause=False):
        self.calls, self.signals = [], []
        process = FakeProcess(exit_code, exit_after_poll=100 if pause else 2)

        def popen(argv, **kwargs):
            self.calls.append((argv, kwargs))
            return process

        def watch(root, pgid, *_):
            own = pgid is not None and process.alive
            return {"rss_bytes": 7 * 2**30 if own else 0, "disk_free_bytes": 5 * 2**30,
                    "lean_processes": 2 if own else 0, "owned_pids": [4313, 4314] if own else [],
                    "pause_reason": "foreign work" if pause and own else None}

        def killpg(pgid, sig):
            self.signals.append((pgid, sig))
            process.alive = False

        return b.Runner(self.args, self.registry, popen=popen, watch=watch, killpg=killpg,
                        sleep=lambda _: None, validate=lambda root, registry: self.validate(root, registry),
                        members=lambda pgid: [process.pid] if process.alive else [])

    def test_success_records_real_group_and_does_not_mark_cache(self):
        record = self.runner().run_group("native", ["Grothe.A", "Grothe.B"], 1)
        self.assertEqual(record["state"], "complete")
        self.assertEqual(record["exit_code"], 0)
        self.assertEqual(record["peak_lean_processes"], 2)
        argv, kwargs = self.calls[0]
        self.assertEqual(argv[-3:], ["build", "Grothe.A", "Grothe.B"])
        self.assertTrue(kwargs["start_new_session"])
        self.assertEqual(kwargs["env"]["LEAN_NUM_THREADS"], "2")
        self.assertFalse((self.root / ".lake/build/caps-closure.sha").exists())
        self.assertEqual(self.signals, [])

    def test_nonzero_child_is_failure(self):
        with redirect_stdout(io.StringIO()), self.assertRaisesRegex(b.BuildError, "exit 7"):
            self.runner(exit_code=7).run_group("native", ["Grothe.A"], 1)
        receipt = next(self.args.run_dir.glob("*.json"))
        self.assertEqual(json.loads(receipt.read_text())["state"], "failed")

    def test_guard_pause_signals_only_owned_new_group(self):
        with redirect_stdout(io.StringIO()), self.assertRaisesRegex(b.Pause, "foreign work"):
            self.runner(pause=True).run_group("native", ["Grothe.A"], 1)
        self.assertEqual(self.signals, [(4312, signal.SIGTERM)])
        record = json.loads(next(self.args.run_dir.glob("*.json")).read_text())
        self.assertEqual(record["peak_rss_bytes"], 7 * 2**30)
        self.assertEqual(record["state"], "paused")

    def test_resume_reinvokes_lake_instead_of_trusting_receipt(self):
        first = self.runner()
        first.run_group("native", ["Grothe.A"], 1)
        self.assertEqual(len(self.calls), 1)
        second = self.runner()
        second.run_group("native", ["Grothe.A"], 2)
        self.assertEqual(len(self.calls), 1)
        self.assertEqual(len(list(self.args.run_dir.glob("*.json"))), 2)

    def test_registry_change_prevents_child_launch(self):
        runner = self.runner()
        self.registry_path.write_text(self.registry_path.read_text() + "\n")
        with self.assertRaisesRegex(b.BuildError, "registry changed"):
            runner.run_group("native", ["Grothe.A"], 1)
        self.assertFalse(self.calls)

    def test_source_change_between_groups_prevents_new_child(self):
        runner = self.runner()
        runner.run_group("native", ["Grothe.A"], 1)
        self.write("Grothe/Data.lean", "def changed : Nat := 3\n")
        with self.assertRaisesRegex(b.BuildError, "source (metadata )?changed"):
            runner.run_group("native", ["Grothe.B"], 2)
        self.assertEqual(len(self.calls), 1)

    def test_changed_execution_helper_rejected(self):
        self.write(b.EXECUTION[0], "# changed runner\n")
        with self.assertRaisesRegex(b.BuildError, "source (metadata )?changed"):
            self.runner().run_group("native", ["Grothe.A"], 1)
        self.assertFalse(self.calls)

    def test_controller_signal_does_not_launch_a_new_group(self):
        runner = self.runner()
        runner.interrupted = True
        with self.assertRaisesRegex(b.Pause, "stop signal"):
            runner.run_group("native", ["Grothe.A"], 1)
        self.assertFalse(self.calls)

    def test_exclusive_handoff_waits_for_research_group_absence(self):
        events = []
        class Session:
            def publish(self, **kwargs):
                events.append(("publish", kwargs))
            def peer_child_present(self):
                events.append(("observe", None))
                return len([e for e in events if e[0] == "observe"]) == 1
        runner = self.runner()
        runner.coexist = Session()
        runner.sleep = lambda _: events.append(("wait", None))
        with redirect_stdout(io.StringIO()):
            runner.finish_shared()
        self.assertEqual(events, [("publish", {"phase": "exclusive", "child_pgid": None}),
                                  ("observe", None), ("wait", None), ("observe", None)])

    def test_cleanup_polls_and_reaps_parent_before_testing_group_absence(self):
        runner = self.runner()
        events = []
        class Parent:
            pid, zombie, reaped = 4312, False, False
            def poll(self):
                events.append("poll")
                if self.zombie:
                    self.reaped = True
                    return -15
                return None
            def wait(self, timeout=None):
                self.reaped = True
                events.append("wait")
                return -15
        parent = Parent()
        runner.child = parent
        runner.members = lambda _: [] if parent.reaped else [parent.pid]
        def kill(pgid, sig):
            self.assertEqual(pgid, 4312)
            self.assertEqual(sig, signal.SIGTERM)
            events.append("term")
            parent.zombie = True
        runner.killpg = kill
        runner.stop_child()
        self.assertEqual(events, ["poll", "term", "poll", "wait"])
        self.assertTrue(parent.reaped)

    def test_cleanup_does_not_reuse_the_failing_command_guard(self):
        runner = self.runner(pause=True)
        original = runner.popen
        runner.child = original([], stdout=None)
        runner.watch = lambda *_: (_ for _ in ()).throw(c.CoexistError("cmdline unreadable"))
        runner.stop_child()
        self.assertEqual(self.signals, [(4312, signal.SIGTERM)])
        self.assertEqual(runner.child.poll(), 0)

    def test_owned_group_inventory_reads_no_command_or_environment(self):
        proc = FakeProcFS()
        proc.rows[4312] = {"pid": 4312, "pgid": 4312, "start_ticks": 10, "state": "S", "comm": "lake"}
        proc.rows[4313] = {"pid": 4313, "pgid": 9999, "start_ticks": 11, "state": "R", "comm": "lean"}
        with patch.object(proc, "command", side_effect=AssertionError("command read during cleanup")), \
                patch.object(proc, "read", side_effect=AssertionError("protected fields during cleanup")):
            self.assertEqual(b.group_members(4312, proc), [4312])

    def test_cleanup_failure_preserves_original_reason_and_real_log_tail(self):
        runner = self.runner(exit_code=7)
        original_popen = runner.popen
        def popen(argv, **kwargs):
            kwargs["stdout"].write(b"error: C12x167 exact coverage check failed\n")
            return original_popen(argv, **kwargs)
        runner.popen = popen
        with patch.object(runner, "stop_child", side_effect=b.BuildError("injected cleanup failure")), \
                redirect_stdout(io.StringIO()) as output, self.assertRaisesRegex(b.BuildError, "exit 7.*cleanup"):
            runner.run_group("native", ["Grothe.A"], 85)
        self.assertIn("Original failure: native Lake group failed with exit 7", output.getvalue())
        self.assertIn("Additional owned-cleanup failure: injected cleanup failure", output.getvalue())
        self.assertIn("| error: C12x167 exact coverage check failed", output.getvalue())
        record = json.loads(next(self.args.run_dir.glob("*.json")).read_text())
        self.assertIn("exit 7", record["reason"])
        self.assertEqual(record["cleanup_error"], "injected cleanup failure")

    def test_failure_tail_is_bounded_real_output(self):
        path = self.root / "large-child.log"
        path.write_text("first-line-must-not-appear\n" + "middle\n" * 10000 + "last-real-line\n")
        record = {"group_index": 85, "phase": "native", "targets": ["Grothe.A"], "reason": "actual pause"}
        with redirect_stdout(io.StringIO()) as output:
            b.failure_diagnostics(record, path, max_bytes=128, max_lines=3)
        self.assertNotIn("first-line-must-not-appear", output.getvalue())
        self.assertIn("last-real-line", output.getvalue())
        self.assertLessEqual(sum(line.startswith("| ") for line in output.getvalue().splitlines()), 3)

    def test_plan_and_registry_mutation_are_mutually_exclusive(self):
        with redirect_stderr(io.StringIO()), self.assertRaises(SystemExit):
            b.main(["--plan", "--write-registry"])

    def test_run_directory_cannot_escape_through_symlink(self):
        with tempfile.TemporaryDirectory() as outside:
            (self.root / ".lake").symlink_to(outside)
            with redirect_stderr(io.StringIO()):
                self.assertEqual(b.main(["--root", str(self.root), "--plan"]), 1)

    def test_plan_is_read_only_and_does_not_spawn(self):
        before = sorted(str(p.relative_to(self.root)) for p in self.root.rglob("*"))
        with patch.object(b, "validate_registry", side_effect=lambda root, registry: self.validate(root, registry)), \
                patch.object(b.subprocess, "Popen", side_effect=AssertionError("plan spawned a child")), \
                redirect_stdout(io.StringIO()) as output:
            result = b.main(["--root", str(self.root), "--plan"])
        self.assertEqual(result, 0)
        self.assertEqual(json.loads(output.getvalue())["compute_roots"], 2)
        self.assertEqual(before, sorted(str(p.relative_to(self.root)) for p in self.root.rglob("*")))


if __name__ == "__main__":
    unittest.main()

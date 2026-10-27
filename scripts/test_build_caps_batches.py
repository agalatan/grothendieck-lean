#!/usr/bin/env python3
"""Pure fixtures and fake children: these tests never execute Lake or Lean."""
import argparse
from contextlib import redirect_stdout, redirect_stderr
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

    def test_groups_are_at_most_two_and_pure_first(self):
        plan = list(b.groups(self.registry, 2))
        self.assertEqual([phase for phase, _ in plan], ["pure", "pure", "native"])
        self.assertTrue(all(len(targets) <= 2 for _, targets in plan))
        self.assertEqual(list(b.groups(self.registry, 1))[-2:], [("native", ["Grothe.A"]), ("native", ["Grothe.B"])])
        with self.assertRaises(b.BuildError):
            list(b.groups(self.registry, 3))


class OverlayTests(unittest.TestCase):
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

    def __init__(self, exit_code=0):
        self.exit_code, self.polls, self.alive = exit_code, 0, True

    def poll(self):
        self.polls += 1
        if self.polls == 1 and self.alive:
            return None
        self.alive = False
        return self.exit_code

    def wait(self):
        self.alive = False
        return self.exit_code


class FakeProcFS:
    def __init__(self):
        self.rows = {}
        self.denied = set()
        self.available = 32 * c.GIB

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

    def test_pid_reuse_fails_closed(self):
        self.proc.rows[100]["start_ticks"] += 1
        with self.assertRaisesRegex(c.CoexistError, "stale"):
            self.num.authorized_foreign(self.proc.snapshot())

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


class RunnerTests(Fixture):
    def runner(self, *, exit_code=0, pause=False):
        self.calls, self.signals = [], []
        process = FakeProcess(exit_code)

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
                        sleep=lambda _: None, validate=lambda root, registry: self.validate(root, registry))

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
        with self.assertRaisesRegex(b.BuildError, "exit 7"):
            self.runner(exit_code=7).run_group("native", ["Grothe.A"], 1)
        receipt = next(self.args.run_dir.glob("*.json"))
        self.assertEqual(json.loads(receipt.read_text())["state"], "failed")

    def test_guard_pause_signals_only_owned_new_group(self):
        with self.assertRaisesRegex(b.Pause, "foreign work"):
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
        with self.assertRaisesRegex(b.BuildError, "source changed"):
            runner.run_group("native", ["Grothe.B"], 2)
        self.assertEqual(len(self.calls), 1)

    def test_changed_execution_helper_rejected(self):
        self.write(b.EXECUTION[0], "# changed runner\n")
        with self.assertRaisesRegex(b.BuildError, "source changed"):
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

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

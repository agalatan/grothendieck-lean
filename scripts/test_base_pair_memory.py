#!/usr/bin/env python3
"""Owned dummy-process regressions; no Lean build or RSS acceptance.

Agent-ID: codex-7c2e. Every process is in a new session created by this test.
The deliberately surviving child ignores TERM; finalizers kill only that
session's process group. No foreign job or cache is inspected or changed.
"""
import importlib.util
import os
from pathlib import Path
import signal
import subprocess
import sys
import tempfile
import time
import unittest
from unittest import mock


ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    'base_pair_memory', ROOT / 'tools/q0_quadrature/check_base_pair_memory.py')
MEMORY = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MEMORY)
REAL_POPEN = subprocess.Popen


def alive(pid):
    if sys.platform == 'linux':
        try:
            state = (Path('/proc') / str(pid) / 'stat').read_text().rsplit(')', 1)[1].split()[0]
            return state not in ('Z', 'X')
        except FileNotFoundError:
            return False
    result = subprocess.run(['/bin/ps', '-p', str(pid), '-o', 'stat='],
                            capture_output=True, text=True)
    return result.returncode == 0 and not result.stdout.lstrip().startswith('Z')


def leader_command(directory, exit_after_ready):
    ready = str(directory / 'ready')
    pidfile = str(directory / 'child')
    child = ("import os,signal,time; from pathlib import Path; "
             "signal.signal(signal.SIGTERM,signal.SIG_IGN); "
             f"Path({pidfile!r}).write_text(str(os.getpid())); "
             f"Path({ready!r}).write_text('ready'); time.sleep(60)")
    leader = ("import subprocess,sys,time; from pathlib import Path; "
              f"subprocess.Popen([sys.executable,'-c',{child!r}]); "
              f"p=Path({ready!r}); "
              "exec('while not p.exists(): time.sleep(0.01)'); "
              + ("sys.exit(0)" if exit_after_ready else "time.sleep(60)"))
    return [sys.executable, '-c', leader]


class OwnedGroupCleanupTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        # On Linux, reap our own orphaned dummy child rather than leave it
        # to a container PID 1. This changes only this test process.
        if sys.platform == 'linux':
            import ctypes
            cls.libc = ctypes.CDLL(None)
            if cls.libc.prctl(36, 1, 0, 0, 0) != 0:
                raise OSError('cannot enable owned-child subreaper')

    def wait_child(self, directory):
        deadline = time.monotonic() + 5
        while not (directory / 'ready').exists():
            if time.monotonic() >= deadline:
                self.fail('owned child did not start')
            time.sleep(0.01)
        return int((directory / 'child').read_text())

    def assert_child_stopped(self, pid):
        deadline = time.monotonic() + 2
        while alive(pid) and time.monotonic() < deadline:
            time.sleep(0.02)
        self.assertFalse(alive(pid), 'TERM-resistant owned child survived cleanup')

    def cleanup(self, leader, child):
        if MEMORY.process_group_exists(leader.pid):
            try:
                os.killpg(leader.pid, signal.SIGKILL)
            except ProcessLookupError:
                pass
        leader.wait(timeout=3)
        if child is not None and sys.platform == 'linux':
            try:
                os.waitpid(child, 0)
            except ChildProcessError:
                pass

    def test_cleanup_after_leader_exited(self):
        with tempfile.TemporaryDirectory(prefix='7c2e-owned-group-') as tmp:
            directory = Path(tmp)
            leader = REAL_POPEN(leader_command(directory, False), start_new_session=True)
            child = None
            try:
                child = self.wait_child(directory)
                self.assertEqual(os.getpgid(child), leader.pid)
                leader.terminate()
                leader.wait(timeout=3)
                self.assertTrue(alive(child))
                MEMORY.stop_own_group(leader, grace=0.15)
                self.assert_child_stopped(child)
            finally:
                self.cleanup(leader, child)

    def test_measure_fails_closed_when_group_outlives_leader(self):
        with tempfile.TemporaryDirectory(prefix='7c2e-owned-measure-') as tmp:
            directory = Path(tmp)
            processes = []
            real_stop = MEMORY.stop_own_group

            def dummy_time(command, **kwargs):
                self.assertEqual(command[:3], ['/usr/bin/time', '-v', '-o'])
                # Timing is fake in this control-flow regression. It is
                # neither a compiler timing nor memory acceptance evidence.
                Path(command[3]).write_text('Maximum resident set size (kbytes): 1\n')
                proc = REAL_POPEN(command[4:], **kwargs)
                processes.append(proc)
                return proc

            child = None
            try:
                with mock.patch.object(MEMORY.subprocess, 'Popen', side_effect=dummy_time), \
                     mock.patch.object(MEMORY, 'stop_own_group',
                                       side_effect=lambda proc: real_stop(proc, grace=0.15)):
                    result = MEMORY.measure(leader_command(directory, True),
                                            'owned-dummy', directory, 5)
                child = self.wait_child(directory)
                self.assertFalse(result['passed'])
                self.assertEqual(result['stopped'], 'owned process group outlived leader')
                self.assert_child_stopped(child)
            finally:
                if child is None and (directory / 'child').exists():
                    child = int((directory / 'child').read_text())
                for proc in processes:
                    self.cleanup(proc, child)


if __name__ == '__main__':
    unittest.main()

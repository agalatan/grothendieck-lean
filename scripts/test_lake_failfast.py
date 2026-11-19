# scripts/test_lake_failfast.py
"""Exercise cancellation and failure using only owned, harmless subprocesses.

Agent-ID: codex-9c42. Refs #486. No Lake/Lean process is started.
"""
import os
from pathlib import Path
import signal
import subprocess
import sys
import tempfile
import time
import unittest

WRAPPER = Path(__file__).with_name('lake_failfast.sh')


def live(pid):
    # A killed orphan can briefly remain a zombie until its new parent reaps it.
    result = subprocess.run(['ps', '-o', 'stat=', '-p', str(pid)],
                            text=True, capture_output=True, check=False)
    return bool(result.stdout.strip()) and not result.stdout.strip().startswith('Z')


class FailFastTests(unittest.TestCase):
    def launch(self, command, env=None):
        proc = subprocess.Popen(['bash', str(WRAPPER), *command],
                                env={**os.environ, 'FAILFAST_GRACE': '0', **(env or {})},
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                                text=True, start_new_session=True)
        self.addCleanup(self.stop, proc)
        return proc

    @staticmethod
    def stop(proc):
        try:
            os.killpg(proc.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
        proc.communicate(timeout=5)

    def wait_file(self, path):
        deadline = time.monotonic()+5
        while time.monotonic()<deadline:
            if path.exists() and path.read_text().strip():
                return int(path.read_text())
            time.sleep(.02)
        self.fail(f'child did not start: {path}')

    def test_exit_status_and_output(self):
        for status in [0, 7]:
            with self.subTest(status=status):
                proc=self.launch(['bash', '-c', f'echo completed; exit {status}'])
                out,_=proc.communicate(timeout=8)
                self.assertEqual(proc.returncode,status,out)
                self.assertIn('completed',out)

    def test_failure_line_at_exit_is_failure(self):
        proc=self.launch(['bash','-c','printf "✖ fake failed module\n"; exit 0'])
        out,_=proc.communicate(timeout=8)
        self.assertEqual(proc.returncode,1,out)

    def tree(self, directory, fail=False):
        parent_file=directory/'parent'; child_file=directory/'child'
        child_code=('import os,signal,time; '
                    'signal.signal(signal.SIGTERM,signal.SIG_IGN); '
                    'open(os.environ["CHILD_FILE"],"w").write(str(os.getpid())); time.sleep(60)')
        parent_code=('import os,signal,subprocess,sys,time; '
                     'signal.signal(signal.SIGTERM,signal.SIG_IGN); '
                     'open(os.environ["PARENT_FILE"],"w").write(str(os.getpid())); '
                     f'subprocess.Popen([sys.executable,"-c",{child_code!r}]); '
                     + ('time.sleep(.1); print("✖ fake failed module",flush=True); ' if fail else '')
                     + 'time.sleep(60)')
        proc=self.launch([sys.executable,'-c',parent_code],
                         {'PARENT_FILE':str(parent_file),'CHILD_FILE':str(child_file)})
        parent=self.wait_file(parent_file); child=self.wait_file(child_file)
        def stop_build():
            try: os.killpg(parent,signal.SIGKILL)
            except ProcessLookupError: pass
        self.addCleanup(stop_build)
        return proc,parent,child

    def test_cancellation_stops_separate_build_group(self):
        for sig,status,whole_group in [(signal.SIGTERM,143,True),
                                       (signal.SIGTERM,143,False),
                                       (signal.SIGINT,130,True)]:
            with self.subTest(sig=sig,whole_group=whole_group), tempfile.TemporaryDirectory() as td:
                proc,parent,child=self.tree(Path(td))
                self.assertNotEqual(os.getpgid(parent),os.getpgid(proc.pid))
                (os.killpg if whole_group else os.kill)(proc.pid,sig)
                out,_=proc.communicate(timeout=10)
                self.assertEqual(proc.returncode,status,out)
                self.assertFalse(live(parent),out)
                self.assertFalse(live(child),out)

    def test_fail_fast_escalates_for_term_ignoring_children(self):
        with tempfile.TemporaryDirectory() as td:
            proc,parent,child=self.tree(Path(td),fail=True)
            out,_=proc.communicate(timeout=10)
            self.assertEqual(proc.returncode,1,out)
            self.assertFalse(live(parent),out)
            self.assertFalse(live(child),out)


if __name__=='__main__':
    unittest.main()

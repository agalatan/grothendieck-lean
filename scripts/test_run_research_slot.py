"""Exercise the actual slot launcher with a local stand-in for the cgroup manager."""
import os
from pathlib import Path
import subprocess
import tempfile
import time
import unittest

SCRIPT = Path(__file__).with_name("run_research_slot.sh")


class SlotTests(unittest.TestCase):
    def setUp(self):
        temp = tempfile.TemporaryDirectory()
        self.addCleanup(temp.cleanup)
        self.root = Path(temp.name)
        self.bin = self.root / "bin"
        self.bin.mkdir()
        self.env = dict(os.environ, HOME=str(self.root), PATH=f"{self.bin}:{os.environ['PATH']}",
                        MACHINE_CPUS="48")
        self.tool("getconf", 'test "$1" = _NPROCESSORS_ONLN && echo "$MACHINE_CPUS"')
        self.tool("systemd-run", '''
test "$1 $2 $3 $4 $6 $7 $8" = "--user --scope --quiet -p -- taskset -c" || exit 3
printf '%s %s\\n' "$9" "$5" > scope
shift 9
exec "$@"
''')

    def tool(self, name, body):
        path = self.bin / name
        path.write_text("#!/bin/sh\n" + body + "\n")
        path.chmod(0o755)

    def start(self, name, slot, *cmd):
        cwd = self.root / name
        cwd.mkdir(exist_ok=True)
        return subprocess.Popen([str(SCRIPT), "codex-062a", slot, *cmd], cwd=cwd,
                                env=self.env, start_new_session=True,
                                stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    def test_competitor_cannot_start_or_replace_owner(self):
        hold = self.root / "release"
        first = self.start("winner", "24-31", "sh", "-c",
                           'while [ ! -e "$1" ]; do sleep 0.05; done', "sh", str(hold))
        try:
            deadline = time.monotonic() + 5
            while not (self.root / "winner/scope").exists():
                self.assertIsNone(first.poll())
                self.assertLess(time.monotonic(), deadline)
                time.sleep(0.02)
            owner = self.root / "research-slots/24-31/owner"
            saved = owner.read_text()
            self.assertEqual(int(saved.split()[1]), first.pid)
            loser = self.start("loser", "24-31", "true")
            self.assertNotEqual(loser.wait(timeout=5), 0)
            self.assertEqual(owner.read_text(), saved)
            self.assertFalse((self.root / "loser/job.pid").exists())
            self.assertFalse((self.root / "loser/scope").exists())
        finally:
            hold.touch()
            first.wait(timeout=5)
        self.assertEqual(first.returncode, 0)
        self.assertFalse(owner.parent.exists())
        self.assertEqual(self.start("loser", "24-31", "true").wait(timeout=5), 0)

    def test_limits_by_machine_and_slot(self):
        for cores, entries in [(48, [("24-31", 16), ("32-39", 16), ("40-47", 15)]),
                               (32, [("16-23", 48), ("24-31", 48)])]:
            self.env["MACHINE_CPUS"] = str(cores)
            for slot, cap in entries:
                with self.subTest(cores=cores, slot=slot):
                    self.assertEqual(self.start("limits", slot, "true").wait(timeout=5), 0)
                    self.assertEqual((self.root / "limits/scope").read_text().strip(),
                                     f"{slot} MemoryMax={cap}G")
        self.assertNotEqual(self.start("wrong-machine", "40-47", "true").wait(timeout=5), 0)
        self.assertFalse((self.root / "wrong-machine/scope").exists())

    def test_failed_scope_releases_its_slot(self):
        self.tool("systemd-run", "exit 41")
        self.assertEqual(self.start("failed", "40-47", "true").wait(timeout=5), 41)
        self.assertFalse((self.root / "research-slots/40-47").exists())


if __name__ == "__main__":
    unittest.main()

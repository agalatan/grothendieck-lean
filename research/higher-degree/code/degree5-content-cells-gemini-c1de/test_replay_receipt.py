"""Exercise receipt publication with real inputs and controlled native output (issue #933)."""

from contextlib import redirect_stdout
import io
import json
import math
from pathlib import Path
import stat
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import verify


class ReceiptReplayTest(unittest.TestCase):
    def setUp(self):
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        self.recorded = Path(tmp.name, "recorded.json")
        self.original = (HERE / "result.json").read_bytes()
        self.recorded.write_bytes(self.original)
        self.recorded.chmod(0o640)

    def replay(self, output, *, producer_fails=False, **options):
        def run(command, *, check):
            if "--verify-all" in command:
                Path(command[3]).write_bytes(output)
                if producer_fails:
                    raise subprocess.CalledProcessError(1, command)

        with patch.object(verify.subprocess, "run", side_effect=run), redirect_stdout(io.StringIO()):
            verify.verify_all(result_path=self.recorded, replay_cpp=True, **options)

    def test_read_only_and_update(self):
        self.replay(self.original)
        result = json.loads(self.original)
        # Widen a certified negative upper bound by one representable step.
        cell = result["cells"][0]
        cell["worst_M_A"] = math.nextafter(cell["worst_M_A"], 0)
        candidate = json.dumps(result).encode()
        with self.assertRaisesRegex(ValueError, "differs from committed"):
            self.replay(candidate)
        self.replay(candidate, audit_local=True)
        self.assertEqual(self.recorded.read_bytes(), self.original)
        link = self.recorded.with_name("linked.json")
        link.symlink_to(self.recorded)
        self.recorded = link
        self.replay(candidate, update_result=True)
        self.assertTrue(link.is_symlink())
        self.assertEqual(self.recorded.read_bytes(), candidate)
        self.assertEqual(stat.S_IMODE(self.recorded.stat().st_mode), 0o640)

    def test_failed_producer_preserves_the_receipt(self):
        with self.assertRaises(subprocess.CalledProcessError):
            self.replay(b'{"status":', producer_fails=True, update_result=True)
        self.assertEqual(self.recorded.read_bytes(), self.original)

    def test_audit_rejects_bad_native_output(self):
        result = json.loads(self.original)
        result["cells"][-1]["worst_M_B"] = 0
        for mode in ("audit_local", "update_result"):
            with self.subTest(mode=mode), self.assertRaisesRegex(ValueError, "supremum not strictly negative"):
                self.replay(json.dumps(result).encode(), **{mode: True})
            self.assertEqual(self.recorded.read_bytes(), self.original)


if __name__ == "__main__":
    unittest.main()

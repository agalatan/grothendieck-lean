#!/usr/bin/env python3
"""Tests of lean_payload.py and of the selector replay's comparison with the live upper files. Agent-ID: claude-b9ee.

    python3 research/upper-channels/code/test_lean_payload.py [--sources DIR]

Without --sources the pinned copies are read from git (commit SIX of fetch_sources.sh). With --sources (a directory
prepared by fetch_sources.sh) and python-flint installed, it also runs the end-to-end six-column replay of
angular-selector-transfer-codex-a7c4/verify.py on the live tree and on a tree with one coefficient changed.
"""
import argparse
import shutil
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SIX = "f6620f3b6bb3a8defc0ab37569eb744e4afa4726"
sys.path.insert(0, str(HERE))
from lean_payload import LIVE, payload, same_payload  # noqa: E402

SOURCES = None


def pinned(path):
    return subprocess.run(["git", "-C", str(ROOT), "show", f"{SIX}:{path}"], check=True, capture_output=True,
                          text=True).stdout


def mutate(text):
    """Change one digit of the first coefficient line (not a structure line)."""
    lines = text.splitlines(keepends=True)
    for i, line in enumerate(lines):
        if payload(line) and any(c.isdigit() for c in line) and not line.lstrip().startswith(("--", "/-")):
            j = next(k for k, c in enumerate(line) if c.isdigit())
            lines[i] = line[:j] + str((int(line[j]) + 1) % 10) + line[j + 1:]
            return "".join(lines)
    raise AssertionError("no coefficient line")


class PayloadTests(unittest.TestCase):
    def test_live_files_have_the_pinned_payload(self):
        for old in ("Grothe/UpperSix/Haagerup/Data/OverlapData.lean", "Grothe/UpperSix/Haagerup/Parameters.lean"):
            with self.subTest(path=old):
                live = (ROOT / LIVE[old]).read_text()
                self.assertNotEqual(live, pinned(old))          # bytes differ: imports and namespaces moved
                self.assertTrue(same_payload(live, pinned(old)))

    def test_one_coefficient_mutation_is_rejected(self):
        for old in ("Grothe/UpperSix/Haagerup/Data/OverlapData.lean", "Grothe/UpperSix/Haagerup/Parameters.lean"):
            with self.subTest(path=old):
                live = (ROOT / LIVE[old]).read_text()
                self.assertFalse(same_payload(mutate(live), pinned(old)))

    def test_live_paths_exist(self):
        for new in LIVE.values():
            self.assertTrue((ROOT / new).is_file(), new)


@unittest.skipUnless(SOURCES is not None or "--sources" in sys.argv, "needs --sources and python-flint")
class ReplayTests(unittest.TestCase):
    def replay(self, root):
        sys.path.insert(0, str(HERE / "angular-selector-transfer-codex-a7c4"))
        import verify
        saved = verify.ROOT
        verify.ROOT = root
        try:
            return verify.six_columns(SOURCES)
        finally:
            verify.ROOT = saved

    def test_replay_passes_on_the_live_tree_and_rejects_a_mutation(self):
        import verify  # noqa: F401  (python-flint must be installed)
        rows, caps, weights = self.replay(ROOT)
        old = verify.fixed_lower(rows, caps, weights)
        self.assertTrue(verify.CURRENT <= old)
        with tempfile.TemporaryDirectory() as tmp:
            for new in LIVE.values():
                (Path(tmp) / new).parent.mkdir(parents=True, exist_ok=True)
                shutil.copy(ROOT / new, Path(tmp) / new)
            target = Path(tmp) / LIVE["Grothe/UpperSix/Haagerup/Data/OverlapData.lean"]
            target.write_text(mutate(target.read_text()))
            with self.assertRaises(ArithmeticError):
                self.replay(Path(tmp))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--sources", type=Path)
    args, rest = parser.parse_known_args()
    if args.sources:
        SOURCES = args.sources.resolve()
        sys.path.insert(0, str(HERE / "angular-selector-transfer-codex-a7c4"))
    unittest.main(argv=[sys.argv[0]] + rest)

#!/usr/bin/env python3
"""Tests of scripts/land_push_refusal.sh, the classifier of a refused landing push (scripts/land_ready.sh)."""
import os
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "scripts/land_push_refusal.sh"
PERMISSION = ("! [remote rejected] merge-candidate -> master (refusing to allow a GitHub App to create or update "
              "workflow `.github/workflows/lean.yml` without `workflows` permission)\n")
OTHER = "! [rejected] merge-candidate -> master (fetch first)\n"


def git(repo, *args):
    env = dict(os.environ, GIT_AUTHOR_NAME="t", GIT_AUTHOR_EMAIL="t@t", GIT_COMMITTER_NAME="t",
               GIT_COMMITTER_EMAIL="t@t")
    return subprocess.run(["git", *args], cwd=repo, check=True, capture_output=True, text=True, env=env).stdout.strip()


class RefusalTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.repo = Path(self.tmp.name)
        git(self.repo, "init", "-q")
        (self.repo / "a.txt").write_text("a\n")
        git(self.repo, "add", "."); git(self.repo, "commit", "-qm", "base")
        self.base = git(self.repo, "rev-parse", "HEAD")

    def tearDown(self):
        self.tmp.cleanup()

    def commit(self, files):
        for name, text in files.items():
            path = self.repo / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text)
        git(self.repo, "add", "."); git(self.repo, "commit", "-qm", "change")
        return git(self.repo, "rev-parse", "HEAD")

    def classify(self, candidate, stderr):
        err = self.repo / "push.err"
        err.write_text(stderr)
        out = subprocess.run(["bash", "-o", "pipefail", str(SCRIPT), self.base, candidate, str(err)], cwd=self.repo,
                             capture_output=True, text=True)
        self.assertEqual(out.returncode, 0, out.stderr)
        return out.stdout.strip()

    def test_workflow_change_with_permission_message(self):
        # many workflow files: a `git diff --name-only | grep -q` would hit SIGPIPE (exit 141) under pipefail
        files = {f".github/workflows/w{i}.yml": f"{i}\n" * 2000 for i in range(50)}
        candidate = self.commit(files)
        self.assertEqual(self.classify(candidate, PERMISSION), "workflow-permission")

    def test_workflow_change_with_another_message(self):
        candidate = self.commit({".github/workflows/lean.yml": "x\n"})
        self.assertEqual(self.classify(candidate, OTHER), "workflow-unexplained")

    def test_no_workflow_change(self):
        candidate = self.commit({"b.txt": "b\n"})
        self.assertEqual(self.classify(candidate, PERMISSION), "other")

    def test_land_ready_uses_the_classifier(self):
        text = (ROOT / "scripts/land_ready.sh").read_text()
        self.assertIn("scripts/land_push_refusal.sh", text)
        self.assertNotIn("| grep -q '^\\.github/workflows/'", text)


if __name__ == "__main__":
    unittest.main()

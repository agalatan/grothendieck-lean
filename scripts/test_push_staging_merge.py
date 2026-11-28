"""Exercise the freeze push against a temporary bare Git remote and fixture PRs."""

import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest

SCRIPT = Path(__file__).with_name("push_staging_merge.sh").resolve()
GH = """#!/usr/bin/env python3
import json, os, pathlib, sys
root = pathlib.Path(os.environ["FIXTURE"])
args = sys.argv[1:]
if args[:2] == ["repo", "view"]:
    assert args[2] == str(root / "remote")
    print("https://github.com/fixture/repo")
elif os.environ.get("GH_REPO") != "github.com/fixture/repo":
    sys.exit(11)
elif args[:1] == ["api"]:
    assert args[1] == "repos/{owner}/{repo}/commits/"+(root / "head").read_text()+"/statuses?per_page=100"
    print((root / "approval").read_text())
elif args[:3] == ["pr", "view", "925"]:
    if "labels" == args[4]:  # hold_notice.sh after a successful push
        print((root / "late").read_text())
    else:
        print((root / "pr").read_text())
elif args[:3] == ["pr", "comment", "925"]:
    (root / "notice").write_text(args[-1])
else:
    sys.exit(12)
"""


class StagingPushTests(unittest.TestCase):
    def setUp(self):
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        self.root = Path(tmp.name)
        self.repo = self.root / "work"
        self.repo.mkdir()
        self.remote = self.root / "remote"
        self.env = {**os.environ, "GIT_CONFIG_NOSYSTEM": "1", "GIT_CONFIG_GLOBAL": os.devnull,
                    "GIT_AUTHOR_NAME": "Test", "GIT_COMMITTER_NAME": "Test",
                    "GIT_AUTHOR_EMAIL": "test@example.org", "GIT_COMMITTER_EMAIL": "test@example.org",
                    "FIXTURE": str(self.root), "PATH": str(self.root) + os.pathsep + os.environ["PATH"]}
        self.git("init", "--bare", str(self.remote))
        self.git("init", "-b", "staging")
        self.git("commit", "--allow-empty", "-m", "base")
        self.base = self.git("rev-parse", "HEAD")
        self.git("remote", "add", "origin", str(self.remote))
        self.git("push", "origin", "staging")
        self.git("switch", "-c", "codex-1234/topic")
        self.git("commit", "--allow-empty", "-m", "source")
        self.source = self.git("rev-parse", "HEAD")
        self.git("switch", "staging")
        self.git("merge", "--no-ff", "codex-1234/topic", "-m", "prepared")
        self.merge = self.git("rev-parse", "HEAD")
        self.pr = dict(state="OPEN", isDraft=False, isCrossRepository=False, headRefOid=self.source,
                       headRefName="codex-1234/topic", baseRefName="staging", baseRefOid=self.base, labels=[])
        self.write_pr()
        (self.root / "head").write_text(self.source)
        (self.root / "approval").write_text("success\t[claude-abcd] approve: checked")
        (self.root / "late").write_text("")
        gh = self.root / "gh"
        gh.write_text(GH)
        gh.chmod(0o755)

    def git(self, *args):
        return subprocess.run(["git", *args], cwd=self.repo, env=self.env, check=True,
                              capture_output=True, text=True).stdout.strip()

    def write_pr(self, **changes):
        (self.root / "pr").write_text(json.dumps({**self.pr, **changes}))

    def push(self):
        return subprocess.run([str(SCRIPT), "925", self.source], cwd=self.repo, env=self.env,
                              capture_output=True, text=True)

    def refs(self):
        return self.git("--git-dir", str(self.remote), "for-each-ref", "--format=%(refname) %(objectname)")

    def test_approved_merge_preserves_hook_and_reports_late_holder(self):
        hooks = self.repo / "custom"
        hooks.mkdir()
        self.git("config", "core.hooksPath", "custom")
        hook = hooks / "pre-push"
        hook.write_text('#!/bin/sh\ntest -f "$(git rev-parse --git-path hooks)/config-for-hooks" || exit 23\ncat > "$FIXTURE/hook-stdin"\nprintf "%s\\n" "$@" > "$FIXTURE/hook-args"\n')
        hook.chmod(0o755)
        (hooks / "config-for-hooks").touch()
        (self.root / "late").write_text("HOLD:gemini-1234")
        result = self.push()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.refs(), "refs/heads/staging " + self.merge)
        self.assertEqual((self.root / "hook-stdin").read_text().split(),
                         [self.merge, self.merge, "refs/heads/staging", self.base])
        self.assertEqual((self.root / "hook-args").read_text().splitlines(), ["origin", str(self.remote)])
        self.assertIn("HOLD:gemini-1234", (self.root / "notice").read_text())
        self.assertEqual(self.git("config", "core.hooksPath"), "custom")

    def test_hold_added_during_existing_hook_prevents_push(self):
        hook = self.repo / ".git/hooks/pre-push"
        hook.write_text("""#!/bin/sh
jq '.labels = [{"name":"HOLD:codex-062a"}]' "$FIXTURE/pr" > "$FIXTURE/held" && mv "$FIXTURE/held" "$FIXTURE/pr"
""")
        hook.chmod(0o755)
        result = self.push()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("HOLD:codex-062a", result.stderr)
        self.assertEqual(self.refs(), "refs/heads/staging " + self.base)

    def test_pr_state_must_be_current_readable_and_landable(self):
        for changes in [dict(labels=[{"name": "WIP"}]), dict(labels=[{"name": "RFC"}]), dict(labels=None),
                        dict(labels=[{}]), dict(baseRefName="master"), dict(state="CLOSED"), dict(isDraft=True),
                        dict(isCrossRepository=True), dict(headRefOid=self.base), dict(baseRefOid=self.source)]:
            with self.subTest(changes=changes):
                self.write_pr(**changes)
                self.assertNotEqual(self.push().returncode, 0)
                self.assertEqual(self.refs(), "refs/heads/staging " + self.base)
        (self.root / "pr").unlink()
        self.assertNotEqual(self.push().returncode, 0)
        self.assertEqual(self.refs(), "refs/heads/staging " + self.base)

    def test_approval_must_be_independent_and_current(self):
        for review in ["", "failure\t[claude-abcd] block: fix", "success\t[codex-abcd] approve: same family"]:
            (self.root / "approval").write_text(review)
            self.assertNotEqual(self.push().returncode, 0)
            self.assertEqual(self.refs(), "refs/heads/staging " + self.base)

    def test_deleted_staging_is_not_recreated(self):
        self.git("--git-dir", str(self.remote), "update-ref", "-d", "refs/heads/staging")
        self.assertNotEqual(self.push().returncode, 0)
        self.assertEqual(self.refs(), "")

    def test_different_advertised_base_even_if_it_would_fast_forward(self):
        self.git("push", "origin", self.source + ":refs/heads/staging")
        self.assertNotEqual(self.push().returncode, 0)
        self.assertEqual(self.refs(), "refs/heads/staging " + self.source)

    def test_wrong_merge_is_rejected_before_git_push(self):
        self.git("switch", "--detach", self.source)
        self.assertNotEqual(self.push().returncode, 0)
        self.assertEqual(self.refs(), "refs/heads/staging " + self.base)

    def test_refusal_from_original_hook_survives(self):
        hook = self.repo / ".git/hooks/pre-push"
        hook.write_text("#!/bin/sh\nexit 1\n")
        hook.chmod(0o755)
        self.assertNotEqual(self.push().returncode, 0)
        self.assertEqual(self.refs(), "refs/heads/staging " + self.base)


if __name__ == "__main__":
    unittest.main()

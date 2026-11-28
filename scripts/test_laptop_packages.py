#!/usr/bin/env python3
"""The laptop's master builder and worktree setup choose the packages of each checkout's own manifest
(scripts/master_build_job.sh, scripts/clone_master_build.sh, scripts/package_store.sh): a new Mathlib gets a new store,
and the main checkout's .lake/packages, which older worktrees link to, is never switched. macOS only (cp -c)."""
import hashlib
import json
import os
import platform
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ENV = dict(os.environ, GIT_AUTHOR_NAME="t", GIT_AUTHOR_EMAIL="t@t", GIT_COMMITTER_NAME="t", GIT_COMMITTER_EMAIL="t@t")
STUB = r'''#!/usr/bin/env python3
import json, os, subprocess, sys
from pathlib import Path
rev = next(p["rev"] for p in json.load(open("lake-manifest.json"))["packages"] if p["name"] == "mathlib")
t = Path(".lake/packages/mathlib")
if not (t / ".git").exists():
    subprocess.run(["git", "clone", "-q", os.environ["TEMPLATE"], str(t)], check=True)
subprocess.run(["git", "-C", str(t), "checkout", "-q", rev], check=True)
o = t / ".lake/build/lib/lean/Mathlib.olean"; o.parent.mkdir(parents=True, exist_ok=True); o.write_text(rev)
if sys.argv[1:2] == ["build"]:
    Path(".lake/build").mkdir(parents=True, exist_ok=True); (Path(".lake/build") / "x.olean").write_text(rev)
'''


def git(cwd, *a):
    return subprocess.run(["git", *a], cwd=cwd, check=True, capture_output=True, text=True, env=ENV).stdout.strip()


@unittest.skipUnless(platform.system() == "Darwin", "the laptop scripts use cp -c (APFS)")
class LaptopPackageTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(); b = Path(self.tmp.name)
        self.template = b / "mathlib"; self.template.mkdir(); git(self.template, "init", "-q")
        self.revs = []
        for v in ("old", "new"):
            (self.template / "v").write_text(v); git(self.template, "add", "."); git(self.template, "commit", "-qm", v)
            self.revs.append(git(self.template, "rev-parse", "HEAD"))
        self.origin = b / "origin.git"; git(b, "init", "-q", "--bare", str(self.origin))
        seed = b / "seed"; seed.mkdir(); git(seed, "init", "-q", "-b", "master")
        (seed / "scripts").mkdir()
        shutil.copy(ROOT / "scripts/package_store.sh", seed / "scripts/package_store.sh")
        (seed / "scripts/local_build_targets.py").write_text("print('Grothe')\n")
        (seed / "lean-toolchain").write_text("leanprover/lean4:v4.34.1\n")
        self.commit(seed, self.revs[0], "old")
        git(seed, "remote", "add", "origin", str(self.origin)); git(seed, "push", "-q", "origin", "master")
        self.seed = seed
        self.main = b / "main"; git(b, "clone", "-q", str(self.origin), str(self.main))
        self.legacy = self.main / ".lake/packages"; self.legacy.mkdir(parents=True)
        bin_ = b / "bin"; bin_.mkdir(); (bin_ / "lake").write_text(STUB); (bin_ / "lake").chmod(0o755)
        self.stores = b / "stores"
        self.env = dict(ENV, PATH=f"{bin_}:{os.environ['PATH']}", TEMPLATE=str(self.template),
                        GROTHE_MAIN=str(self.main), GROTHE_BUILDER=str(b / "builder"),
                        PACKAGE_STORE_ROOT=str(self.stores))

    def tearDown(self):
        self.tmp.cleanup()

    def commit(self, repo, rev, msg):
        (repo / "lake-manifest.json").write_text(json.dumps({"packages": [{"name": "mathlib", "rev": rev}]}) + "\n")
        git(repo, "add", "."); git(repo, "commit", "-qm", msg)

    def store(self, repo):
        key = hashlib.sha256((repo / "lake-manifest.json").read_bytes()).hexdigest()[:16]
        return self.stores / f"packages-{key}"

    def run_ok(self, *cmd, cwd=None):
        out = subprocess.run(["bash", *cmd], cwd=cwd, env=self.env, capture_output=True, text=True)
        self.assertEqual(out.returncode, 0, out.stdout + out.stderr)

    def test_builder_and_new_worktrees_take_the_store_of_their_manifest(self):
        old_wt = Path(self.tmp.name) / "old-wt"
        git(self.main, "worktree", "add", "-q", "--detach", str(old_wt), "origin/master")
        (old_wt / ".lake").mkdir(); os.symlink(self.legacy, old_wt / ".lake/packages")   # an existing 4.34 worktree
        job = ROOT / "scripts/master_build_job.sh"
        self.run_ok(str(job))                                                       # target 1: old manifest
        builder = Path(self.env["GROTHE_BUILDER"])
        self.assertEqual(Path(os.readlink(builder / ".lake/packages")), self.store(builder))
        old_store = self.store(builder)
        self.commit(self.seed, self.revs[1], "new"); git(self.seed, "push", "-q", "origin", "master")
        self.run_ok(str(job))                                                       # target 2: new manifest
        self.assertEqual(Path(os.readlink(builder / ".lake/packages")), self.store(builder))
        self.assertNotEqual(self.store(builder), old_store)
        self.assertEqual(git(self.store(builder) / "mathlib", "rev-parse", "HEAD"), self.revs[1])
        self.assertEqual(git(old_store / "mathlib", "rev-parse", "HEAD"), self.revs[0])
        # the legacy tree and the worktree linked to it are untouched
        self.assertEqual(sorted(p.name for p in self.legacy.iterdir()), [])
        self.assertEqual(Path(os.readlink(old_wt / ".lake/packages")), self.legacy)
        # a new worktree of the new master gets the new store
        new_wt = Path(self.tmp.name) / "new-wt"
        git(self.main, "fetch", "-q", "origin")
        git(self.main, "worktree", "add", "-q", "--detach", str(new_wt), "origin/master")
        self.run_ok(str(ROOT / "scripts/clone_master_build.sh"), str(new_wt))
        self.assertEqual(Path(os.readlink(new_wt / ".lake/packages")), self.store(builder))

    def test_resumed_worktrees_relink_after_adopting_a_new_manifest(self):
        wts = []
        for name in ("wt-a", "wt-b"):                      # two existing 4.34 worktrees on the legacy tree
            wt = Path(self.tmp.name) / name
            git(self.main, "worktree", "add", "-q", "-b", f"t/{name}", str(wt), "origin/master")
            (wt / ".lake").mkdir(); os.symlink(self.legacy, wt / ".lake/packages")
            wts.append(wt)
        self.run_ok("-c", "lake build", cwd=wts[0])         # the legacy Mathlib at the old revision
        self.assertEqual(git(self.legacy / "mathlib", "rev-parse", "HEAD"), self.revs[0])
        self.commit(self.seed, self.revs[1], "new"); git(self.seed, "push", "-q", "origin", "master")
        # the documented resume of wt-a: merge master (adopting the new manifest), relink, then the first lake command
        git(wts[0], "fetch", "-q", "origin"); git(wts[0], "merge", "-q", "--no-edit", "origin/master")
        self.run_ok("-c", f"bash {ROOT}/scripts/package_store.sh --if-needed && lake build", cwd=wts[0])
        self.assertEqual(Path(os.readlink(wts[0] / ".lake/packages")), self.store(wts[0]))
        # wt-b, still on the old manifest, keeps the legacy tree at the old revision
        self.assertEqual(Path(os.readlink(wts[1] / ".lake/packages")), self.legacy)
        self.assertEqual(git(self.legacy / "mathlib", "rev-parse", "HEAD"), self.revs[0])
        self.run_ok("-c", f"bash {ROOT}/scripts/package_store.sh --if-needed", cwd=wts[1])   # nothing to do
        self.assertEqual(Path(os.readlink(wts[1] / ".lake/packages")), self.legacy)


if __name__ == "__main__":
    unittest.main()

#!/usr/bin/env python3
"""Tests of scripts/package_store.sh: one package store per lake-manifest.json, and a runner shared by two Lean
generations (the old workflow in the root checkout, the new one in its per-manifest workspace ws-<key>)."""
import hashlib
import json
import os
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "scripts/package_store.sh"
GIT_ENV = dict(os.environ, GIT_AUTHOR_NAME="t", GIT_AUTHOR_EMAIL="t@t", GIT_COMMITTER_NAME="t",
               GIT_COMMITTER_EMAIL="t@t")

# a recording Lake: checks the manifest's Mathlib revision out in .lake/packages/mathlib (as Lake materialises a
# dependency) and fakes Mathlib's compiled files there
STUB = r'''#!/usr/bin/env python3
import json, os, subprocess, sys
from pathlib import Path
rev = next(p["rev"] for p in json.load(open("lake-manifest.json"))["packages"] if p["name"] == "mathlib")
target = Path(".lake/packages/mathlib")
if sys.argv[1:] == ["exe", "cache", "get"] and os.environ.get("SLOW_FETCH") and not (target / ".git").exists():
    import time; time.sleep(float(os.environ["SLOW_FETCH"]))   # widen the window of a cold store
if not (target / ".git").exists():
    subprocess.run(["git", "clone", "-q", os.environ["TEMPLATE"], str(target)], check=True)
subprocess.run(["git", "-C", str(target), "checkout", "-q", rev], check=True)
olean = target / ".lake/build/lib/lean/Mathlib.olean"
olean.parent.mkdir(parents=True, exist_ok=True); olean.write_text(rev)
with open(os.environ["LAKE_CALLS"], "a") as f:
    f.write(os.getcwd() + " " + " ".join(sys.argv[1:]) + "\n")
'''


def git(cwd, *args):
    return subprocess.run(["git", *args], cwd=cwd, check=True, capture_output=True, text=True,
                          env=GIT_ENV).stdout.strip()


class PackageStoreTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        base = Path(self.tmp.name)
        self.template = base / "mathlib-template"; self.template.mkdir()
        git(self.template, "init", "-q")
        self.revs = []
        for v in ("old", "new"):
            (self.template / "version").write_text(v)
            git(self.template, "add", "."); git(self.template, "commit", "-qm", v)
            self.revs.append(git(self.template, "rev-parse", "HEAD"))
        self.store_root = base / "grothe-caps"
        self.old_shared = self.store_root / ".lake/packages"; self.old_shared.mkdir(parents=True)
        self.bin = base / "bin"; self.bin.mkdir()
        (self.bin / "lake").write_text(STUB); (self.bin / "lake").chmod(0o755)
        self.calls = base / "lake-calls"
        self.env = dict(GIT_ENV, PATH=f"{self.bin}:{os.environ['PATH']}", TEMPLATE=str(self.template),
                        LAKE_CALLS=str(self.calls))
        self.runner = base / "runner"; self.runner.mkdir()     # the runner's persistent root checkout

    def tearDown(self):
        self.tmp.cleanup()

    def manifest(self, rev):
        return json.dumps({"packages": [{"name": "mathlib", "rev": rev}]}) + "\n"

    def key(self, text):
        return hashlib.sha256(text.encode()).hexdigest()[:16]

    def sh(self, cwd, script):
        out = subprocess.run(["bash", "-c", script], cwd=cwd, env=self.env, capture_output=True, text=True)
        return out.returncode, out.stdout + out.stderr

    def old_job(self):
        """The v4.34 workflow (on staging): root checkout, keeps an existing link, else the old shared tree."""
        (self.runner / "lake-manifest.json").write_text(self.manifest(self.revs[0]))
        rc, log = self.sh(self.runner, f"mkdir -p .lake; [ -e .lake/packages ] || ln -s {self.old_shared} "
                                       ".lake/packages; lake build")
        self.assertEqual(rc, 0, log)

    def new_job(self):
        """The v4.36 workflow: its own workspace ws-<key>, linked by package_store.sh."""
        text = self.manifest(self.revs[1])
        ws = self.runner / f"ws-{self.key(text)}"; ws.mkdir(exist_ok=True)
        (ws / "lake-manifest.json").write_text(text)
        rc, log = self.sh(ws, f"bash {SCRIPT} {self.store_root} && lake build")
        self.assertEqual(rc, 0, log)
        return ws

    def head(self, packages):
        return git(packages / "mathlib", "rev-parse", "HEAD")

    def test_old_new_old_new_on_one_runner(self):
        for _ in range(2):
            self.old_job()
            ws = self.new_job()
            # the root checkout still uses the old shared tree at the old revision
            self.assertEqual(Path(os.readlink(self.runner / ".lake/packages")), self.old_shared)
            self.assertEqual(self.head(self.old_shared), self.revs[0])
            # the new workspace uses its keyed store at the new revision
            store = self.store_root / f"packages-{self.key(self.manifest(self.revs[1]))}"
            self.assertEqual(Path(os.readlink(ws / ".lake/packages")), store)
            self.assertEqual(self.head(store), self.revs[1])
        fetches = [l for l in self.calls.read_text().splitlines() if l.endswith("exe cache get")]
        self.assertEqual(len(fetches), 1)   # the keyed store is filled once

    def test_a_store_holding_another_mathlib_revision_is_refused(self):
        ws = self.new_job()
        store = Path(os.readlink(ws / ".lake/packages"))
        git(store / "mathlib", "checkout", "-q", self.revs[0])     # something moved the store's checkout
        rc, log = self.sh(ws, f"bash {SCRIPT} {self.store_root}")
        self.assertNotEqual(rc, 0); self.assertIn("refusing", log)

    def test_a_store_recorded_for_another_manifest_is_refused(self):
        ws = self.new_job()
        store = Path(os.readlink(ws / ".lake/packages"))
        (store / ".manifest-sha256").write_text("0" * 64 + "\n")
        rc, log = self.sh(ws, f"bash {SCRIPT} {self.store_root}")
        self.assertNotEqual(rc, 0); self.assertIn("another manifest", log)

    def test_a_private_packages_directory_is_left_alone(self):
        d = self.runner / "private"; d.mkdir()
        (d / "lake-manifest.json").write_text(self.manifest(self.revs[1]))
        self.assertEqual(self.sh(d, "lake build")[0], 0)            # a real .lake/packages directory
        rc, log = self.sh(d, f"bash {SCRIPT} {self.store_root}")
        self.assertEqual(rc, 0, log)
        self.assertFalse((d / ".lake/packages").is_symlink())

    def test_a_private_directory_is_refreshed_when_the_manifest_changes(self):
        d = self.runner / "private2"; d.mkdir()
        (d / "lake-manifest.json").write_text(self.manifest(self.revs[0]))
        self.assertEqual(self.sh(d, "lake build")[0], 0)            # a real directory with the old Mathlib
        self.assertEqual(self.sh(d, f"bash {SCRIPT} {self.store_root}")[0], 0)   # stamps the old manifest
        (d / "lake-manifest.json").write_text(self.manifest(self.revs[1]))       # same directory, new manifest
        before = len(self.calls.read_text().splitlines())
        rc, log = self.sh(d, f"bash {SCRIPT} {self.store_root}")
        self.assertEqual(rc, 0, log)
        fetched = self.calls.read_text().splitlines()[before:]
        self.assertEqual([l.split()[-3:] for l in fetched], [["exe", "cache", "get"]])
        self.assertEqual(self.head(d / ".lake/packages"), self.revs[1])
        stamp = (d / ".lake/packages/.cache-stamp").read_text().split()[0]
        self.assertEqual(stamp, hashlib.sha256(self.manifest(self.revs[1]).encode()).hexdigest())
        # a second run with the same manifest fetches nothing
        rc, _ = self.sh(d, f"bash {SCRIPT} {self.store_root}")
        self.assertEqual(rc, 0); self.assertEqual(len(self.calls.read_text().splitlines()), before + 1)

    def test_two_concurrent_first_uses_of_a_cold_store(self):
        text = self.manifest(self.revs[1])
        procs = []
        env = dict(self.env, SLOW_FETCH="1.5")
        for name in ("c1", "c2"):
            d = self.runner / name; d.mkdir()
            (d / "lake-manifest.json").write_text(text)
            procs.append(subprocess.Popen(["bash", str(SCRIPT), str(self.store_root)], cwd=d, env=env,
                                          stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True))
        results = [(p.wait(), p.stdout.read()) for p in procs]
        for rc, log in results:
            self.assertEqual(rc, 0, log)
        fetches = [l for l in self.calls.read_text().splitlines() if l.endswith("exe cache get")]
        self.assertEqual(len(fetches), 1)      # the second waited for the lock, then found the stamp
        store = self.store_root / f"packages-{self.key(text)}"
        self.assertEqual(self.head(store), self.revs[1])

    def test_if_needed_relinks_only_after_a_manifest_change(self):
        d = self.runner / "wt"; d.mkdir()
        (d / "lake-manifest.json").write_text(self.manifest(self.revs[0]))
        (d / ".lake").mkdir(); os.symlink(self.old_shared, d / ".lake/packages")
        self.assertEqual(self.sh(d, "lake build")[0], 0)               # the legacy tree at the old revision
        rc, log = self.sh(d, f"bash {SCRIPT} --if-needed {self.store_root}")
        self.assertEqual(rc, 0, log); self.assertIn("nothing to do", log)
        self.assertEqual(Path(os.readlink(d / ".lake/packages")), self.old_shared)
        (d / "lake-manifest.json").write_text(self.manifest(self.revs[1]))   # adopts the new manifest (merge)
        rc, log = self.sh(d, f"bash {SCRIPT} --if-needed {self.store_root} && lake build")
        self.assertEqual(rc, 0, log)
        self.assertEqual(Path(os.readlink(d / ".lake/packages")),
                         self.store_root / f"packages-{self.key(self.manifest(self.revs[1]))}")
        self.assertEqual(self.head(self.old_shared), self.revs[0])     # the legacy tree did not move


if __name__ == "__main__":
    unittest.main()

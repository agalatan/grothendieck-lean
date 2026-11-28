#!/usr/bin/env python3
"""Tests of scripts/package_store.sh: one package store per lake-manifest.json, the old shared tree untouched."""
import hashlib
import os
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "scripts/package_store.sh"


class PackageStoreTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        base = Path(self.tmp.name)
        self.store_root = base / "grothe-caps"
        (self.store_root / ".lake/packages/mathlib").mkdir(parents=True)   # the old shared tree
        self.bin = base / "bin"; self.bin.mkdir()
        self.calls = base / "lake-calls"
        stub = self.bin / "lake"   # records `lake exe cache get` and fakes Mathlib's compiled files
        stub.write_text("#!/bin/sh\necho \"$@\" >> %s\nmkdir -p .lake/packages/mathlib/.lake/build/lib/lean\n"
                        "touch .lake/packages/mathlib/.lake/build/lib/lean/Mathlib.olean\n" % self.calls)
        stub.chmod(0o755)

    def tearDown(self):
        self.tmp.cleanup()

    def checkout(self, name, manifest):
        d = Path(self.tmp.name) / name
        d.mkdir()
        (d / "lake-manifest.json").write_text(manifest)
        return d

    def run_script(self, cwd):
        env = dict(os.environ, PATH=f"{self.bin}:{os.environ['PATH']}")
        out = subprocess.run(["bash", str(SCRIPT), str(self.store_root)], cwd=cwd, env=env, capture_output=True,
                             text=True)
        self.assertEqual(out.returncode, 0, out.stderr)

    def key(self, manifest):
        return hashlib.sha256(manifest.encode()).hexdigest()[:16]

    def test_manifests_get_separate_stores_and_the_old_tree_is_untouched(self):
        old = self.checkout("old", '{"v": "4.34.1"}\n')
        new = self.checkout("new", '{"v": "4.36.0"}\n')
        (new / ".lake").mkdir()
        os.symlink(self.store_root / ".lake/packages", new / ".lake/packages")   # the old-style shared link
        self.run_script(old); self.run_script(new)
        for d, m in ((old, '{"v": "4.34.1"}\n'), (new, '{"v": "4.36.0"}\n')):
            self.assertEqual(Path(os.readlink(d / ".lake/packages")), self.store_root / f"packages-{self.key(m)}")
        self.assertNotEqual(os.readlink(old / ".lake/packages"), os.readlink(new / ".lake/packages"))
        self.assertEqual(sorted(p.name for p in (self.store_root / ".lake/packages").iterdir()), ["mathlib"])
        self.assertFalse((self.store_root / ".lake/packages/mathlib/.lake").exists())

    def test_same_manifest_shares_a_store_and_fetches_once(self):
        a = self.checkout("a", "{}\n"); b = self.checkout("b", "{}\n")
        self.run_script(a); self.run_script(b)
        self.assertEqual(os.readlink(a / ".lake/packages"), os.readlink(b / ".lake/packages"))
        self.assertEqual(self.calls.read_text().splitlines(), ["exe cache get"])

    def test_a_private_packages_directory_is_left_alone(self):
        d = self.checkout("private", "{}\n")
        (d / ".lake/packages/mathlib/.lake/build/lib/lean").mkdir(parents=True)
        (d / ".lake/packages/mathlib/.lake/build/lib/lean/Mathlib.olean").touch()
        self.run_script(d)
        self.assertFalse((d / ".lake/packages").is_symlink())
        self.assertFalse(self.calls.exists())


if __name__ == "__main__":
    unittest.main()

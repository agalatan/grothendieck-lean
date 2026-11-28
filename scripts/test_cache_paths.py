#!/usr/bin/env python3
"""Every build-cache producer and consumer uses the same archive path (it is part of a cache entry's version):
lean.yml's build job (saves and restores), its weekly keepalive, and cloud.yml (restores)."""
import re
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PATH = "ws/.lake/build"


def cache_steps(workflow):
    """(action, path, key, restore-keys) of every actions/cache step, read from the step's `with:` block."""
    text = (ROOT / ".github/workflows" / workflow).read_text()
    steps = []
    for m in re.finditer(r"uses: actions/cache/(save|restore)@v\d+\n((?:\s+.*\n)+?)(?=\s*- |\Z|\n\s*\n)", text):
        block = m.group(2)
        path = re.search(r"^\s+path: (\S+)", block, re.M)
        key = re.search(r"^\s+key: (.+)$", block, re.M)
        steps.append((m.group(1), path and path.group(1), key and key.group(1).strip(), block))
    return steps


class CachePathTests(unittest.TestCase):
    def test_one_archive_path_for_producer_and_consumers(self):
        lean, cloud = cache_steps("lean.yml"), cache_steps("cloud.yml")
        self.assertTrue(any(a == "save" for a, *_ in lean))           # the producer
        self.assertTrue(any(a == "restore" for a, *_ in cloud))      # the cloud consumer
        keepalive = (ROOT / ".github/workflows/lean.yml").read_text().split("  keepalive:", 1)[1]
        self.assertIn(f"path: {PATH}", keepalive)                    # the weekly consumer
        for name, steps in (("lean.yml", lean), ("cloud.yml", cloud)):
            for action, path, key, _ in steps:
                with self.subTest(workflow=name, action=action, key=key):
                    self.assertEqual(path, PATH)

    def test_the_toolchain_hash_reads_the_same_files(self):
        for name in ("lean.yml", "cloud.yml"):
            text = (ROOT / ".github/workflows" / name).read_text()
            for m in re.finditer(r"lake-build-v3-\$\{\{ hashFiles\(([^)]*)\)", text):
                with self.subTest(workflow=name, args=m.group(1)):
                    files = [a.strip(" '") for a in m.group(1).split(",")]
                    if len(files) == 2 and all(f.startswith("format(") is False for f in files):
                        self.assertEqual([f.split("/")[-1] for f in files], ["lean-toolchain", "lake-manifest.json"])

    def test_the_heavy_workspace_is_reached_as_ws(self):
        text = (ROOT / ".github/workflows/lean.yml").read_text()
        self.assertIn('ln -sfn "$WSDIR" ws', text)
        self.assertIn('echo "ws=ws" >> "$GITHUB_OUTPUT"', text)


if __name__ == "__main__":
    unittest.main()

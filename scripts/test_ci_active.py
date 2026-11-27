"""Regression tests for the per-agent CI allowance. Agent-ID: codex-a7c4."""
import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest

SCRIPT = Path(__file__).with_name("ci_active.sh")
AGENT = "codex-abcd"


def run(workflow, branch, title="", status="queued"):
    return dict(workflowName=workflow, headBranch=branch, displayTitle=title,
                status=status, databaseId=1, createdAt="2026-11-25T12:00:00Z")


class CapacityTest(unittest.TestCase):
    def invoke(self, runs, *legacy, shards=1, need=1):
        with tempfile.TemporaryDirectory() as directory:
            gh = Path(directory) / "gh"
            gh.write_text('#!/bin/sh\ncase "$1" in\n  run) echo "$MOCK_RUNS";;\n'
                          '  api) echo "$MOCK_SHARDS";;\n  *) exit 1;;\nesac\n')
            gh.chmod(0o755)
            env = {**os.environ, "PATH": directory + os.pathsep + os.environ["PATH"],
                   "MOCK_RUNS": json.dumps(runs), "MOCK_SHARDS": str(shards), "CI_NEED": str(need)}
            return subprocess.run([str(SCRIPT), AGENT, *legacy], env=env,
                                  capture_output=True, text=True)

    def test_two_own_branches_fill_capacity_without_explicit_refs(self):
        result = self.invoke([run("Lean proof check", AGENT + "/" + topic) for topic in ("a", "b")])
        self.assertEqual(result.returncode, 1)
        self.assertIn("2 CI job(s)", result.stdout)

    def test_master_and_other_agents_do_not_consume_our_capacity(self):
        result = self.invoke([run("Lean proof check", "master"),
                              run("Lean proof check", "claude-dcba/topic"),
                              run("Cloud job", "master", "cloud claude-dcba-test"),
                              run("Lean proof check", AGENT + "/done", status="completed")],
                             "master", "claude-dcba/topic", need=2)
        self.assertEqual(result.returncode, 0)
        self.assertIn("0 CI job(s)", result.stdout)

    def test_legacy_ref_and_cloud_shards_are_counted(self):
        runs = [run("Lean proof check", "work/old"), run("Cloud job", "master", "cloud " + AGENT + "-run")]
        result = self.invoke(runs, "work/old", shards=1)
        self.assertEqual(result.returncode, 1)
        self.assertIn("2 CI job(s)", result.stdout)
        result = self.invoke(runs[1:], shards=2)
        self.assertEqual(result.returncode, 1)
        self.assertIn("2 CI job(s)", result.stdout)


if __name__ == "__main__":
    unittest.main()

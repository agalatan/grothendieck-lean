"""Real Git histories for the proof router, with offline GitHub responses."""
import contextlib
import io
import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

import proof_scope as route


ROOT = Path(__file__).resolve().parents[1]
WORKFLOW = (ROOT / ".github/workflows/lean.yml").read_text()
LEAN_PATHS = re.search(r"LEAN_PATHS='([^']+)'", WORKFLOW)[1]
MASTER = "refs/remotes/origin/master"
STAGING = "refs/remotes/origin/staging"
REPO = "owner/project"


class ScopeTest(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        cwd = os.getcwd()
        os.chdir(self.tmp.name)
        self.addCleanup(os.chdir, cwd)
        env = patch.dict(os.environ, LEAN_PATHS=LEAN_PATHS, GITHUB_REPOSITORY=REPO,
                         GITHUB_STEP_SUMMARY=str(Path.cwd() / "summary"))
        env.start()
        self.addCleanup(env.stop)
        self.api = patch.object(route, "api").start()
        self.addCleanup(patch.stopall)
        self.api.side_effect = AssertionError("unexpected GitHub request")
        route.git("init", "-q")
        route.git("config", "user.name", "Router test")
        route.git("config", "user.email", "router@example.invalid")
        route.git("config", "commit.gpgsign", "false")
        route.git("config", "core.hooksPath", "/dev/null")
        self.master = self.commit("Grothe/Upper/Gate.lean", "old")
        route.git("update-ref", MASTER, self.master)

    def commit(self, name, value):
        path = Path(name)
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(value)
        route.git("add", "--", name)
        route.git("commit", "-qm", name)
        return route.git("rev-parse", "HEAD")

    def freeze(self):
        self.base = self.commit("Grothe/Upper/Gate.lean", "staged")
        route.git("update-ref", STAGING, self.base)
        return self.base

    def responses(self, conclusion="success", *, skipped=None, run_fields=None,
                  upper="Six-channel upper axiom report"):
        run = dict(head_sha=self.base, head_branch="staging", event="push", conclusion=conclusion,
                   id=17, run_attempt=2, head_repository={"full_name": REPO}, html_url="https://example.invalid/run/17")
        run.update(run_fields or {})
        steps = [dict(name=s, conclusion="skipped" if s == skipped else "success")
                 for s in route.PROOF_STEPS | {upper}]
        self.api.side_effect = [{"workflow_runs": [run]}, {"jobs": [
            dict(name="build", conclusion="success", steps=steps)]}]

    def scope(self, branch="agent/topic", **kwargs):
        with contextlib.redirect_stdout(io.StringIO()):
            return route.proof_scope(branch, **kwargs)

    def test_no_freeze_routing_and_master_before(self):
        self.commit("note.md", "docs")
        self.assertEqual(self.scope(), (False, False))
        self.assertEqual(self.scope("master", before=self.master), (False, False))
        self.commit("Grothe/New.lean", "proof")
        self.assertEqual(self.scope(), (True, False))
        self.assertEqual(self.scope("master", before="0" * 40), (True, True))

    def test_only_inherit_exact_proven_fork_even_if_staging_has_advanced(self):
        self.freeze()
        tip = self.commit("Grothe/New.lean", "later")
        route.git("update-ref", STAGING, tip)
        route.git("checkout", "-q", "--detach", self.base)
        self.commit("note.md", "docs")
        self.responses()
        self.assertEqual(self.scope(), (False, False))
        self.assertIn(self.base, Path("summary").read_text())
        self.assertIn(f"head_sha={self.base}&", self.api.call_args_list[0].args[0])
        self.assertIn("/runs/17/attempts/2/jobs", self.api.call_args_list[1].args[0])
        self.assertNotIn(tip, Path("summary").read_text())

    def test_docs_only_branch_never_builds_even_without_a_green_fork(self):
        # The fork point's own staging check covers the proof (#893): no build,
        # and the summary says the fork's proof is not yet verified.
        self.freeze()
        self.commit("research/note.md", "docs")
        for state in (None, "failure", "cancelled", "skipped"):
            with self.subTest(state=state):
                self.responses(state)
                self.assertEqual(self.scope(), (False, False))
        for step in route.PROOF_STEPS | {"Six-channel upper axiom report"}:
            with self.subTest(skipped=step):
                self.responses(skipped=step)
                self.assertEqual(self.scope(), (False, False))
        for response in ({"workflow_runs": []}, {}, ValueError("incomplete API response"),
                         subprocess.CalledProcessError(1, "gh")):
            with self.subTest(response=response):
                self.api.side_effect = [response]
                self.assertEqual(self.scope(), (False, False))
        summary = Path("summary").read_text()
        self.assertIn("not yet green", summary)
        self.assertNotIn("Proof inherited", summary)

    def test_lean_change_on_unverified_fork_still_builds(self):
        self.freeze()
        self.commit("Grothe/New.lean", "proof")
        self.assertEqual(self.scope(), (True, True))

    def test_renamed_upper_report_still_requires_a_completed_audit(self):
        self.freeze()
        self.commit("note.md", "docs")
        upper = "Upper axiom report"
        self.responses(upper=upper)
        self.assertEqual(self.scope(), (False, False))
        self.assertIn("Proof inherited", Path("summary").read_text().splitlines()[-1])
        self.responses(upper=upper, skipped=upper)
        self.assertEqual(self.scope(), (False, False))
        self.assertIn("not yet green", Path("summary").read_text().splitlines()[-1])

    def test_cli_outputs_for_explicit_caps(self):
        output = Path.cwd() / "outputs"
        env = {**os.environ, "MODE": "caps", "GITHUB_REF_NAME": "master", "GITHUB_OUTPUT": str(output)}
        subprocess.run([sys.executable, "-B", str(ROOT / "scripts/proof_scope.py")],
                       env=env, check=True, capture_output=True)
        self.assertEqual(output.read_text(), "lean=true\nheavy=true\n")

    def test_other_heads_events_and_repositories_cannot_supply_the_proof(self):
        self.freeze()
        self.commit("note.md", "docs")
        for fields in ({"head_sha": self.master}, {"event": "workflow_dispatch"},
                       {"head_branch": "other"}, {"head_repository": {"full_name": "other/project"}}):
            with self.subTest(fields=fields):
                self.responses(run_fields=fields)
                self.assertEqual(self.scope(), (False, False))
        self.assertNotIn("Proof inherited", Path("summary").read_text())

    def test_staging_itself_and_landing_keep_master_baselines(self):
        self.freeze()
        self.assertEqual(self.scope("staging"), (True, True))
        self.commit("notes.md", "docs")
        self.assertEqual(self.scope(land=True, pinned_master=self.master), (True, True))
        self.assertEqual(self.scope(land=True, pinned_master=self.base), (False, False))

    def test_caps_is_explicit_even_for_commit_already_on_master(self):
        self.assertEqual(self.scope(), (False, False))
        self.assertEqual(self.scope(mode="caps"), (True, True))

    def test_new_proof_and_revert_of_staged_change_both_build(self):
        self.freeze()
        self.commit("Grothe/Upper/Gate.lean", "old")
        self.assertEqual(self.scope(), (True, True))
        self.commit("Grothe/New.lean", "another proof")
        self.assertEqual(self.scope(), (True, True))

    def test_branch_based_only_on_master_during_freeze(self):
        self.freeze()
        route.git("checkout", "-q", "--detach", self.master)
        self.commit("note.md", "docs")
        self.assertEqual(self.scope(), (False, False))

    def test_moving_lean_file_out_of_scope_is_a_heavy_deletion(self):
        route.git("mv", "Grothe/Upper/Gate.lean", "doc.md")
        route.git("commit", "-qm", "move out of proof tree")
        self.assertEqual(self.scope(), (True, True))

    def test_workflow_runs_router_and_checks_its_inputs(self):
        self.assertIn("python3 scripts/proof_scope.py", WORKFLOW)
        self.assertIn("python3 scripts/test_proof_scope.py", WORKFLOW)
        for name in route.PROOF_STEPS:
            self.assertIn(f"- name: {name}\n", WORKFLOW)
        self.assertTrue(any(f"- name: {name}\n" in WORKFLOW for name in route.UPPER_REPORT_NAMES))
        for name in ("scripts/proof_scope.py", "scripts/test_proof_scope.py", ".github/workflows/lean.yml"):
            self.assertRegex(name, LEAN_PATHS)


if __name__ == "__main__":
    unittest.main()

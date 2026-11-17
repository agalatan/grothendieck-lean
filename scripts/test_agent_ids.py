"""Exercise the common identity rules and the review command without GitHub."""

import os
from pathlib import Path
import subprocess
import unittest


SCRIPTS = Path(__file__).resolve().parent
FAMILIES = ("claude", "codex", "gemini")
REVIEWED = "a" * 40
MOVED = "b" * 40


def identity_call(*args):
    return subprocess.run(
        ["bash", "-c", 'source "$1"; shift; "$@"', "bash", str(SCRIPTS / "agent_ids.sh"), *args],
        capture_output=True,
        text=True,
        timeout=5,
    )


def review_call(branch, reviewer, tip=REVIEWED, verdict="approve"):
    mocks = r"""
        git() {
            if [[ "$1" == ls-remote && "$2" == origin && "$3" == refs/heads/* ]]; then
                printf '%s\t%s\n' "$MOCK_REVIEW_TIP" "$3"
            else
                return 97
            fi
        }
        gh() {
            case "$1 $2" in
                'repo view') echo 'owner/repo' ;;
                'api -X') printf 'Mock API %s\n' "$*" >&2 ;;
                *) return 98 ;;
            esac
        }
        source "$@"
    """
    return subprocess.run(
        ["bash", "-c", mocks, "bash", str(SCRIPTS / "review.sh"), branch, REVIEWED, verdict,
         reviewer, "checked"],
        env={**os.environ, "MOCK_REVIEW_TIP": tip},
        capture_output=True,
        text=True,
        timeout=5,
    )


class AgentIdentityTests(unittest.TestCase):
    def test_agent_ids_have_exact_families_and_lowercase_hex(self):
        for family in FAMILIES:
            with self.subTest(family=family):
                self.assertEqual(identity_call("is_agent_id", f"{family}-3e2a").returncode, 0)
        for invalid in ("gemini", "gemini-3E2a", "gemini-a12", "gemini-a1234", "gemini-zzzz",
                        "gemini-3e2a/topic", "geminix-3e2a", "other-3e2a"):
            with self.subTest(invalid=invalid):
                self.assertNotEqual(identity_call("is_agent_id", invalid).returncode, 0)

    def test_landing_accepts_only_a_successful_review_from_another_family(self):
        for author in FAMILIES:
            for family in FAMILIES:
                reviewer = f"{family}-3e2a"
                with self.subTest(author=author, reviewer=reviewer):
                    result = identity_call(
                        "approved_reviewer", f"{author}-a12b", f"success\t[{reviewer}] approve: checked"
                    )
                    if author == family:
                        self.assertNotEqual(result.returncode, 0)
                    else:
                        self.assertEqual(result.returncode, 0, result.stderr)
                        self.assertEqual(result.stdout.strip(), reviewer)
        for review in ("", "failure\t[codex-3e2a] block: changed", "pending\t[codex-3e2a]",
                       "success\t[other-3e2a]", "success\tcodex-3e2a"):
            with self.subTest(review=review):
                self.assertNotEqual(
                    identity_call("approved_reviewer", "gemini-a12b", review).returncode, 0
                )

    def test_review_writes_pinned_status_for_gemini_in_both_roles(self):
        for branch, reviewer in (("gemini-a12b/topic", "codex-3e2a"),
                                 ("claude-a12b/topic", "gemini-3e2a")):
            for verdict, state in (("approve", "success"), ("block", "failure")):
                with self.subTest(branch=branch, reviewer=reviewer, verdict=verdict):
                    result = review_call(branch, reviewer, verdict=verdict)
                    self.assertEqual(result.returncode, 0, result.stderr)
                    self.assertIn(f"statuses/{REVIEWED}", result.stderr)
                    self.assertIn(f"state={state}", result.stderr)
                    self.assertIn(f"[{reviewer}] {verdict}: checked", result.stderr)

    def test_review_refuses_same_family_and_moved_branch(self):
        same_family = review_call("gemini-a12b/topic", "gemini-3e2a")
        self.assertEqual(same_family.returncode, 2, same_family.stderr)
        self.assertIn("different agent family", same_family.stderr)
        self.assertNotIn("Mock API", same_family.stderr)

        stale = review_call("gemini-a12b/topic", "codex-3e2a", tip=MOVED)
        self.assertEqual(stale.returncode, 3, stale.stderr)
        self.assertIn("gemini-a12b/topic has moved", stale.stderr)
        self.assertNotIn("Mock API", stale.stderr)


if __name__ == "__main__":
    unittest.main()

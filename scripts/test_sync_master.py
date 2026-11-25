"""Exercise the branch audit with recorded-shape GitHub responses and no network."""
import json
import os
from datetime import datetime, timedelta, timezone
from pathlib import Path
import subprocess
import unittest


SCRIPT = Path(__file__).with_name("sync_master.sh")
BRANCH = "codex-abcd/example"
TIP = "a" * 40
OLD = "b" * 40
APPROVED = {"context": "Independent review", "state": "success",
            "description": "[claude-1234] approve: verified"}

# Run the real report and its jq filters. Repository state and API reads are local fixtures.
MOCKS = r"""
git() {
    if [[ "$1" == -C ]]; then shift 2; fi
    case "$1" in
        fetch|config|worktree|-c) return 0 ;;
        merge-base) return 1 ;;
        rev-parse) echo "$TIP" ;;
        rev-list) echo 0 ;;
        branch) echo "origin/$BRANCH" ;;
        *) echo "Unexpected Git command $*" >&2; return 98 ;;
    esac
}
gh() {
    local data
    case "$1 $2" in
        'run list') data=$RUNS ;;
        'pr list') data=$PRS ;;
        'api '*) [[ "$2" == */commits/"$PR_TIP"/statuses* ]] || return 97
                 [[ "$REVIEWS" != unavailable ]] || return 1
                 data=$REVIEWS ;;
        *) return 98 ;;
    esac
    jq -r "${!#}" <<< "$data"
}
source "$1"
"""


def audit(*, status="completed", conclusion="success", run_tip=TIP, pr_tip=TIP,
          review=APPROVED, labels=(), hours=0):
    created = datetime.now(timezone.utc) - timedelta(hours=hours)
    run = {"headBranch": BRANCH, "headSha": run_tip, "status": status, "conclusion": conclusion,
           "databaseId": 123, "createdAt": created.strftime("%Y-%m-%dT%H:%M:%SZ")}
    pr = {"headRefName": BRANCH, "headRefOid": pr_tip, "number": 99, "isDraft": False,
          "labels": [{"name": name} for name in labels]}
    reviews = "unavailable" if review == "unavailable" else json.dumps([review] if review else [])
    result = subprocess.run(
        ["bash", "-c", MOCKS, "bash", str(SCRIPT)],
        env={**os.environ, "AGENT_ID": "codex-abcd", "TIP": TIP, "PR_TIP": pr_tip, "BRANCH": BRANCH,
             "RUNS": json.dumps([run] if run_tip else []), "PRS": json.dumps([pr]), "REVIEWS": reviews},
        capture_output=True, text=True, timeout=10, check=True,
    )
    return result.stdout


class BranchAuditTests(unittest.TestCase):
    def test_only_green_current_head_with_independent_review_can_land(self):
        self.assertIn("/land codex-abcd", audit(labels=["has spaces"]))
        for changes, expected in [
            ({"run_tip": OLD}, "no reported check for its current head"),
            ({"run_tip": None}, "no reported check for its current head"),
            ({"pr_tip": OLD}, "moved after the fetch"),
            ({"conclusion": "failure"}, "--log-failed"),
            ({"review": None}, "review: none"),
            ({"review": "unavailable"}, "could not be read"),
            ({"review": dict(APPROVED, description="[codex-1234] approve")}, "waits for a review"),
            ({"review": dict(APPROVED, state="failure")}, "blocked by review"),
            ({"labels": ["has spaces", "WIP"]}, "RFC/WIP/draft"),
        ]:
            with self.subTest(changes=changes):
                result = audit(**changes)
                self.assertIn(expected, result)
                self.assertNotIn("/land codex-abcd", result)

    def test_approved_pending_check_reports_only_a_real_stall(self):
        for status in ("in_progress", "queued"):
            with self.subTest(status=status):
                result = audit(status=status, conclusion="")
                self.assertIn("review: success [claude-1234]", result)
                self.assertNotIn("-> ACTION:", result)
        self.assertIn("running or queued for 3h", audit(status="queued", conclusion="", hours=3))


if __name__ == "__main__":
    unittest.main()

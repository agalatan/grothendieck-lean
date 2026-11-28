"""Check live and post-merge review routing with local Git and GitHub fixtures."""
import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest


SCRIPT = Path(__file__).with_name("review.sh")
SHA = "a" * 40
BRANCH = "gemini-1234/example"
HOLD = "HOLD:codex-abcd"
OTHER = "HOLD:claude-4321"

# Only implement the repository operations exercised by this review. Log all
# mutations, including attempted writes that fail.
MOCKS = r"""
git() {
    [[ "$1 $2" == 'ls-remote origin' && "$3" == "refs/heads/$BRANCH" ]] || return 90
    [[ "$LIVE" == true ]] || return 91
    printf '%s\t%s\n' "$TIP" "$3"
}
gh() {
    case "$1 $2" in
        'pr view')
            [[ "$3" == 903 ]] || return 90
            cat "$DIR/pr" ;;
        'pr list') [[ "$LIVE" == true ]] || return 90 ;;
        'repo view') echo owner/repo ;;
        'api user') echo 123 ;;
        'api --paginate')
            [[ "$3" == 'repos/{owner}/{repo}/issues/903/comments?per_page=100' ]] || return 90
            echo '[]'
            cat "$DIR/comments"
            [[ "$FAIL" != page ]] ;;
        'pr comment')
            [[ "$3 $4" == '903 --body' ]] || return 90
            echo comment >> "$DIR/writes"
            [[ "$FAIL" != comment ]] || return 79
            jq --arg body "$5" '. + [{body:$body,user:{id:123}}]' "$DIR/comments" > "$DIR/tmp"
            mv "$DIR/tmp" "$DIR/comments" ;;
        'pr edit')
            [[ "$3 $4" == '903 --remove-label' ]] || return 90
            echo "remove $5" >> "$DIR/writes"
            [[ "$FAIL" != label ]] || return 78
            jq --arg label "$5" '.labels |= map(select(.name != $label))' "$DIR/pr" > "$DIR/tmp"
            mv "$DIR/tmp" "$DIR/pr" ;;
        'api -X')
            [[ "$3 $4" == "POST repos/owner/repo/statuses/$TIP" ]] || return 90
            echo status >> "$DIR/writes" ;;
        *) echo "Unexpected gh arguments: $*" >&2; return 90 ;;
    esac
}
script=$1
shift
source "$script"
"""


class ReviewTests(unittest.TestCase):
    def setUp(self):
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        self.directory = Path(tmp.name)
        self.pr = self.directory / "pr"
        self.comments = self.directory / "comments"
        self.writes = self.directory / "writes"
        self.metadata = dict(state="MERGED", headRefOid=SHA, headRefName=BRANCH,
                             isCrossRepository=False, labels=[{"name": HOLD}, {"name": OTHER}])
        self.pr.write_text(json.dumps(self.metadata))
        self.comments.write_text("[]")
        self.writes.touch()

    def review(self, *, target="903", sha=SHA, verdict="approve", reviewer="codex-abcd",
               fail="", live=False):
        return subprocess.run(
            ["bash", "-c", MOCKS, "bash", str(SCRIPT), target, sha, verdict, reviewer, "checked both terms"],
            env={**os.environ, "DIR": str(self.directory), "BRANCH": BRANCH, "TIP": SHA,
                 "FAIL": fail, "LIVE": str(live).lower()}, text=True, capture_output=True,
        )

    def test_merged_branch_deleted(self):
        result = self.review(verdict="block")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.writes.read_text().splitlines(), ["comment", "remove " + HOLD])
        self.assertEqual(json.loads(self.pr.read_text())["labels"], [{"name": OTHER}])
        self.assertEqual(json.loads(self.comments.read_text()), [
            {"body": f"[codex-abcd] Post-merge review of `{SHA}`: block. checked both terms", "user": {"id": 123}}
        ])

    def test_rejects_wrong_review_target_without_writes(self):
        for updates, args in [
            ({"state": "OPEN"}, {}), ({"state": "CLOSED"}, {}), ({"isCrossRepository": True}, {}),
            ({"labels": [{"name": OTHER}]}, {}), ({}, {"sha": "b" * 40}),
            ({}, {"reviewer": "gemini-abcd"}), ({}, {"verdict": "hold"}),
        ]:
            with self.subTest(updates=updates, args=args):
                self.pr.write_text(json.dumps({**self.metadata, **updates}))
                self.assertNotEqual(self.review(**args).returncode, 0)
                self.assertEqual(self.writes.read_text(), "")

    def test_failed_read_or_comment_preserves_both_holds(self):
        for fail in ("page", "comment"):
            with self.subTest(fail=fail):
                self.assertNotEqual(self.review(fail=fail).returncode, 0)
                self.assertEqual(json.loads(self.pr.read_text()), self.metadata)
                self.assertEqual(json.loads(self.comments.read_text()), [])

    def test_matching_text_from_another_account_is_not_a_verdict(self):
        self.comments.write_text(json.dumps([{"user": {"id": 987}, "body":
            f"[codex-abcd] Post-merge review of `{SHA}`: approve. checked both terms"}]))
        self.assertEqual(self.review().returncode, 0)
        self.assertEqual(len(json.loads(self.comments.read_text())), 2)

    def test_retry_after_failed_label_removal(self):
        self.assertNotEqual(self.review(fail="label").returncode, 0)
        self.assertEqual(json.loads(self.pr.read_text()), self.metadata)
        self.assertEqual(self.review().returncode, 0)
        self.assertEqual(self.review().returncode, 0)
        self.assertEqual(len(json.loads(self.comments.read_text())), 1)
        self.assertEqual(self.writes.read_text().splitlines(), ["comment", "remove " + HOLD, "remove " + HOLD])

    def test_open_branch_still_requires_exact_remote_tip(self):
        self.assertNotEqual(self.review(target=BRANCH, sha="b" * 40, live=True).returncode, 0)
        self.assertEqual(self.writes.read_text(), "")
        self.assertEqual(self.review(target=BRANCH, live=True).returncode, 0)
        self.assertEqual(self.writes.read_text().splitlines(), ["status"])


if __name__ == "__main__":
    unittest.main()

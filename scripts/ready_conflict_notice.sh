#!/usr/bin/env bash
# Report a ready/ branch that does not merge into master (called by lean.yml's route after a failed merge).
#
#   scripts/ready_conflict_notice.sh <branch> <conflicting file>...
#
# Writes the conflicting files and the branch's owners (the Agent-ID lines of its commits) to the run's summary and
# comments once per branch commit on every issue its commits reference (Refs/Closes #n), so the owner, the user and
# the janitor (AGENTS.md §7) see it without having to notice it. DRY_RUN=1 prints the comment instead of posting it.
set -u
branch=$1; shift
files=("$@")
tip=$(git rev-parse --short "origin/$branch")
master=$(git rev-parse --short origin/master)
log=$(git log --reverse --format=%B "origin/master..origin/$branch")   # oldest first: the creator leads
owners=$(printf '%s\n' "$log" | sed -nE 's/.*Agent-ID: *([A-Za-z]+-[0-9a-f]+).*/\1/p')
# the owner named by the branch (AGENTS.md §3: ready/<agent-id>-<topic>) comes first
[[ "$branch" =~ ^ready/((codex|claude)-[0-9a-f]{4})- ]] && owners="${BASH_REMATCH[1]}
$owners"
owners=$(printf '%s\n' "$owners" | awk 'NF && !seen[$0]++' | paste -sd ' ' -)
issues=$(printf '%s\n' "$log" | grep -oiE '(refs|close[sd]?|fix(e[sd])?|resolve[sd]?) +#[0-9]+' \
         | grep -oE '[0-9]+' | sort -un)
marker="<!-- ready-conflict:$branch:$tip -->"
list=$(printf -- '- `%s`\n' "${files[@]}")
body="[grothe-ci] \`$branch\` (\`$tip\`) does not merge into master (\`$master\`). Conflicting files:
$list

Owner(s): ${owners:-unknown}. Merge \`origin/master\` into the branch, resolve every conflict by understanding both sides, and push the same \`ready/\` branch (AGENTS.md §6, §7). Until then nothing of it reaches master. If the owner does not act, the janitor (AGENTS.md §7) resolves mechanical conflicts and reports the others here.
$marker"

echo "::error::$branch does not merge into master: conflicts in ${files[*]} (owners: ${owners:-unknown})"
[ -n "${GITHUB_STEP_SUMMARY:-}" ] && printf '%s\n' "$body" >> "$GITHUB_STEP_SUMMARY"
for n in $issues; do
  if [ "${DRY_RUN:-0}" = 1 ]; then echo "--- would comment on #$n:"; printf '%s\n' "$body"; continue; fi
  # once per branch commit: a re-run of the same commit does not comment again
  gh issue view "$n" --json comments -q '.comments[].body' 2>/dev/null | grep -qF "$marker" && continue
  gh issue comment "$n" --body "$body" > /dev/null || true
done
exit 0

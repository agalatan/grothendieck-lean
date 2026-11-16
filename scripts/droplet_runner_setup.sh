#!/usr/bin/env bash
# Install (or restart) the self-hosted GitHub Actions runner on a droplet: labels self-hosted, heavy.
# Run on the LAPTOP (needs `gh` logged in as a repository admin and `ssh <host>`):
#     scripts/droplet_runner_setup.sh                                   # the droplet `yo`, runner `yo-droplet`
#     RUNNER_HOST=big RUNNER_LABELS=heavy,big scripts/droplet_runner_setup.sh   # another droplet (runner `big-droplet`)
# RUNNER_HOST is the ssh alias, RUNNER_NAME the runner's name (default <host>-droplet), RUNNER_LABELS its labels
# (default heavy; `big` or `mega` in addition if it is to take cap shards, see CAPS_SHARDS in lean.yml).
#
# A HEAVY RUNNER NEEDS A WARM WORKSPACE.  On a fresh machine the heavy job restores the 14 GB build cache from GitHub
# first, and from a DigitalOcean droplet that does not finish: measured on 16 November 2026 at 0.4 MB/s per connection
# (the cache action uses eight), while the signed download link expires after ten minutes.  The job then goes on
# WITHOUT a cache and compiles the whole repository, node caps and native facts included (days).  So:
#   * create the droplet from a snapshot whose runner workspace already holds a CI-built tree
#     (`big-caps-2026-11-08-final`, `mega-caps-2026-11-08-final`), then run this script on it to register it again;
#   * never seed a workspace by hand (AGENTS.md section 10: only CI writes builds that become caches);
#   * if a heavy job's step "Restore the verified build cache" fails or reports no cache on an empty workspace,
#     cancel the run at once.
# The remote user must be the one the workflow expects (`/home/agalatan/grothe-caps/.lake/packages` is hard-coded in
# lean.yml) and must have elan installed.
# What it does on the droplet, as the normal user (no sudo):
#   * downloads the runner into ~/actions-runner (once) and registers it for this repository only
#     (a one-hour registration token is minted with `gh`; no personal access token is stored anywhere);
#   * starts it in its own process group (pid in ~/actions-runner/runner.pid, log ~/actions-runner/runner.log);
#   * adds a `@reboot` crontab line so it comes back after a droplet reboot.
# The runner executes only this repository's workflow jobs with `runs-on: [self-hosted, heavy]` (lean.yml, job "heavy").
# Stop it:      ssh <host> 'kill -- -"$(cat ~/actions-runner/runner.pid)"'
# Remove it:    ssh <host> 'cd ~/actions-runner && ./config.sh remove --token <token from: gh api -X POST repos/agalatan/grothendieck-lean/actions/runners/remove-token --jq .token>'
set -euo pipefail
REPO=agalatan/grothendieck-lean
HOST=${RUNNER_HOST:-yo}
NAME=${RUNNER_NAME:-$HOST-droplet}
LABELS=${RUNNER_LABELS:-heavy}
VER=$(gh api repos/actions/runner/releases/latest --jq .tag_name | tr -d v)
TOKEN=$(gh api -X POST "repos/$REPO/actions/runners/registration-token" --jq .token)
ssh "$HOST" bash -s -- "$VER" "$TOKEN" "$REPO" "$NAME" "$LABELS" <<'REMOTE'
set -euo pipefail
VER=$1; TOKEN=$2; REPO=$3; NAME=$4; LABELS=$5
mkdir -p ~/actions-runner && cd ~/actions-runner
if [ ! -f run.sh ]; then
  curl -sSL -o r.tgz "https://github.com/actions/runner/releases/download/v$VER/actions-runner-linux-x64-$VER.tar.gz"
  tar xzf r.tgz && rm r.tgz
fi
if [ ! -f .runner ]; then
  ./config.sh --unattended --url "https://github.com/$REPO" --token "$TOKEN" \
    --name "$NAME" --labels "$LABELS" --work _work --replace
fi
if [ -f runner.pid ] && kill -0 "$(cat runner.pid)" 2>/dev/null; then
  echo "runner already running (pgid $(cat runner.pid))"
else
  bash -c 'set -m; nohup ./run.sh > runner.log 2>&1 & echo $! > runner.pid'
  echo "runner started (pgid $(cat runner.pid))"
fi
LINE="@reboot cd $HOME/actions-runner && bash -c 'set -m; nohup ./run.sh > runner.log 2>&1 & echo \$! > runner.pid'"
# (crontab -l fails on an empty crontab; with set -e/pipefail that must not abort before the new line is written)
{ crontab -l 2>/dev/null | grep -v 'actions-runner' || true; echo "$LINE"; } | crontab -
echo "crontab:"; crontab -l | grep actions-runner
REMOTE
gh api "repos/$REPO/actions/runners" --jq '.runners[] | "\(.name) \(.status) \([.labels[].name]|join(","))"'

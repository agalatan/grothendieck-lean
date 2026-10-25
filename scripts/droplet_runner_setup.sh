#!/usr/bin/env bash
# Install (or restart) the self-hosted GitHub Actions runner on the droplet: labels self-hosted, heavy.
# Run on the LAPTOP (needs `gh` logged in as a repository admin and `ssh yo`):
#     scripts/droplet_runner_setup.sh
# What it does on the droplet, as the normal user (no sudo):
#   * downloads the runner into ~/actions-runner (once) and registers it for this repository only
#     (a one-hour registration token is minted with `gh`; no personal access token is stored anywhere);
#   * starts it in its own process group (pid in ~/actions-runner/runner.pid, log ~/actions-runner/runner.log);
#   * adds a `@reboot` crontab line so it comes back after a droplet reboot.
# The runner executes only this repository's workflow jobs with `runs-on: [self-hosted, heavy]` (lean.yml, job "heavy").
# Stop it:      ssh yo 'kill -- -"$(cat ~/actions-runner/runner.pid)"'
# Remove it:    ssh yo 'cd ~/actions-runner && ./config.sh remove --token <token from: gh api -X POST repos/agalatan/grothendieck-lean/actions/runners/remove-token --jq .token>'
set -euo pipefail
REPO=agalatan/grothendieck-lean
VER=$(gh api repos/actions/runner/releases/latest --jq .tag_name | tr -d v)
TOKEN=$(gh api -X POST "repos/$REPO/actions/runners/registration-token" --jq .token)
ssh yo bash -s -- "$VER" "$TOKEN" "$REPO" <<'REMOTE'
set -euo pipefail
VER=$1; TOKEN=$2; REPO=$3
mkdir -p ~/actions-runner && cd ~/actions-runner
if [ ! -f run.sh ]; then
  curl -sSL -o r.tgz "https://github.com/actions/runner/releases/download/v$VER/actions-runner-linux-x64-$VER.tar.gz"
  tar xzf r.tgz && rm r.tgz
fi
if [ ! -f .runner ]; then
  ./config.sh --unattended --url "https://github.com/$REPO" --token "$TOKEN" \
    --name yo-droplet --labels heavy --work _work --replace
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

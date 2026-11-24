#!/usr/bin/env bash
# Regression test of fetch_sources.sh: files that already exist under the target survive, and the listed files appear.
# Agent-ID: claude-b9ee.   Usage: test_fetch_sources.sh
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
mkdir -p "$tmp/src6/keep" "$tmp/src18"
echo sentinel > "$tmp/src6/keep/mine.txt"; echo sentinel > "$tmp/src18/mine.txt"; echo sentinel > "$tmp/other.txt"
bash "$here/fetch_sources.sh" "$tmp" > /dev/null
for f in src6/keep/mine.txt src18/mine.txt other.txt; do
  [ "$(cat "$tmp/$f")" = sentinel ] || { echo "FAIL: $f was removed or changed" >&2; exit 1; }
done
for f in src6/Grothe/UpperSix/Haagerup/Parameters.lean src18/data/upper-replacement/cell-inputs.npz; do
  [ -s "$tmp/$f" ] || { echo "FAIL: $f was not written" >&2; exit 1; }
done
[ -z "$(find "$tmp" -name '*.tmp.*')" ] || { echo "FAIL: a temporary file was left behind" >&2; exit 1; }
echo "test_fetch_sources: OK"

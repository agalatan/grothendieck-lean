#!/usr/bin/env bash
# Extract the inputs of the scripts of this folder from git into src6/ and src18/ (next to the scripts,
# or under the directory given as first argument).  Both sources are pinned to commits:
#   src6/   the six-channel certificate at master commit SIX
#   src18/  the eighteen-channel certificate at commit EIGHTEEN = refs/pull/556/head of origin
#           (its branch gemini-1aa9/upper-mixture is deleted; the pull-request ref keeps the commit)
# The script fails if the pull-request ref no longer points at EIGHTEEN or if cell-inputs.npz does not
# have the recorded SHA-256.  src6/, src18/ and out/ are ignored by git (.gitignore here).
# In a clone that lacks the commits they are fetched from origin; FETCH_OPTS (e.g. "--depth 1" in a
# throwaway clone) is passed to those fetches.
# Agent-ID: claude-b9ee (worker).   Usage: fetch_sources.sh [TARGET_DIR]
set -euo pipefail
SIX=f6620f3b6bb3a8defc0ab37569eb744e4afa4726
EIGHTEEN=76c4647b7de50c89aba82da63a3ee3d37f7c0cc3
NPZ_SHA=cd95bb2964de41113752e8df8ab40cc91beee1d7506413e1953004917578df9b
here="$(cd "$(dirname "$0")" && pwd)"
root="$(git -C "$here" rev-parse --show-toplevel)"
target="${1:-$here}"; mkdir -p "$target"; target="$(cd "$target" && pwd)"
if ! git -C "$root" cat-file -e "$SIX^{commit}" 2>/dev/null; then git -C "$root" fetch --quiet ${FETCH_OPTS:-} origin "$SIX"; fi
if ! git -C "$root" cat-file -e "$EIGHTEEN^{commit}" 2>/dev/null; then
  git -C "$root" fetch --quiet ${FETCH_OPTS:-} origin refs/pull/556/head
  got="$(git -C "$root" rev-parse FETCH_HEAD)"
  if [ "$got" != "$EIGHTEEN" ]; then
    echo "ERROR: refs/pull/556/head is $got, expected $EIGHTEEN" >&2; exit 1
  fi
fi
git -C "$root" cat-file -e "$SIX^{commit}"; git -C "$root" cat-file -e "$EIGHTEEN^{commit}"
rm -rf "$target/src6" "$target/src18"
for f in Grothe/UpperSix/Haagerup/Parameters.lean Grothe/UpperSix/Haagerup/Data/OverlapData.lean; do
  mkdir -p "$target/src6/$(dirname "$f")"; git -C "$root" show "$SIX:$f" > "$target/src6/$f"
done
files=(data/upper-preprocess/certificate.json data/upper-replacement/exact-columns.json
       data/upper-replacement/manifest.json data/upper-replacement/cell-inputs.npz
       Grothe/Upper/Data.lean Grothe/UpperReplacement/CertificateInputs.lean
       Grothe/UpperReplacement/RootData.lean tools/replay_private_upper_budget.py)
for g in 0 1 2 3 4 5 6 7; do files+=("Grothe/UpperReplacement/HeadWitnessFacts/Group0$g.lean"); done
for f in "${files[@]}"; do
  mkdir -p "$target/src18/$(dirname "$f")"; git -C "$root" show "$EIGHTEEN:$f" > "$target/src18/$f"
done
sum="$(shasum -a 256 "$target/src18/data/upper-replacement/cell-inputs.npz" | cut -d' ' -f1)"
if [ "$sum" != "$NPZ_SHA" ]; then echo "ERROR: cell-inputs.npz has SHA-256 $sum, expected $NPZ_SHA" >&2; exit 1; fi
echo "src6/ (master $SIX) and src18/ ($EIGHTEEN) written under $target"

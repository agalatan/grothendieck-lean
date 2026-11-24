#!/usr/bin/env bash
# Extract the inputs of the scripts of this folder from git into src6/ and src18/ (next to the scripts).
#   src6/   from the checkout itself (the six-channel certificate, on master)
#   src18/  from the eighteen-channel branch, pinned to the commit the experiment used
# Both folders and out/ are ignored by git (.gitignore here).  Agent-ID: claude-b9ee (worker).
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
root="$(git -C "$here" rev-parse --show-toplevel)"
commit="${1:-76c4647b7de50c89aba82da63a3ee3d37f7c0cc3}"   # origin/gemini-1aa9/upper-mixture on 24 November 2026
git -C "$root" cat-file -e "$commit^{commit}" || git -C "$root" fetch origin gemini-1aa9/upper-mixture
for f in Grothe/UpperSix/Haagerup/Parameters.lean Grothe/UpperSix/Haagerup/Data/OverlapData.lean; do
  mkdir -p "$here/src6/$(dirname "$f")"; cp "$root/$f" "$here/src6/$f"
done
files=(data/upper-preprocess/certificate.json data/upper-replacement/exact-columns.json
       data/upper-replacement/manifest.json data/upper-replacement/cell-inputs.npz
       Grothe/Upper/Data.lean Grothe/UpperReplacement/CertificateInputs.lean
       Grothe/UpperReplacement/RootData.lean tools/replay_private_upper_budget.py)
for g in 0 1 2 3 4 5 6 7; do files+=("Grothe/UpperReplacement/HeadWitnessFacts/Group0$g.lean"); done
for f in "${files[@]}"; do
  mkdir -p "$here/src18/$(dirname "$f")"; git -C "$root" show "$commit:$f" > "$here/src18/$f"
done
echo "src6/ and src18/ written under $here"

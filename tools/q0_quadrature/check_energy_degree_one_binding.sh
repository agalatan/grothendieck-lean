#!/usr/bin/env bash
# UNAPPROVED COMMAND ARTIFACT. Never run before a scoped human decision.
# CI owner only, following successful exact-candidate import builds in ordinary
# hosted Lean setup. No package setup, dependency build or marker creation here.
set -euo pipefail
approved_sha=${1:?approved exact candidate full SHA required}
[[ "$approved_sha" =~ ^[0-9a-f]{40}$ ]]
test "$(git rev-parse HEAD)" = "$approved_sha"
test -z "$(git status --porcelain --untracked-files=no)"
test "$(uname -s)" = Linux
test -x /usr/bin/time
command -v timeout >/dev/null
python3 scripts/caps_stamp.py --check-cache
python3 tools/gen_energy_degree_one_lookup.py --check
test -f .lake/build/lib/lean/Grothe/Upper/Final.olean
test -f .lake/build/lib/lean/Grothe/UpperChaos/LegacySingleCharacterSplit.olean
result_dir=${OUT:?use the existing hosted job result directory}/source-binding-once
mkdir "$result_dir"
git rev-parse HEAD > "$result_dir/commit.txt"
# Mere olean existence is insufficient. Lake must verify both exact-source
# prerequisite closures as up to date, after genuine successful import builds
# performed by the ordinary hosted Lean job. Exit 3 means STOP, never build here.
timeout --signal=TERM --kill-after=10s 60s lake build --no-build \
  Grothe.Upper.Final Grothe.UpperChaos.LegacySingleCharacterSplit \
  > "$result_dir/imports-no-build.log" 2>&1
sha256sum Grothe/Upper/EnergyDegreeOneLookup.lean Grothe/Upper/Data.lean \
  GrotheKernel/Table.lean tools/gen_energy_degree_one_lookup.py \
  tools/templates/energy_degree_one_lookup.lean.in > "$result_dir/source.sha256"
set +e
timeout --signal=TERM --kill-after=10s 300s /usr/bin/time -v \
  -o "$result_dir/time.txt" lake env lean -DwarningAsError=true \
  -o "$result_dir/EnergyDegreeOneLookup.olean" \
  Grothe/Upper/EnergyDegreeOneLookup.lean > "$result_dir/lean.log" 2>&1
compile_status=$?
set -e
printf '%s\n' "$compile_status" > "$result_dir/status.txt"
test "$compile_status" -eq 0
python3 - "$result_dir" <<'PY'
import json,re,sys
from pathlib import Path
p=Path(sys.argv[1]); time=(p/'time.txt').read_text()
peak=re.search(r'Maximum resident set size \(kbytes\):\s*(\d+)',time)
assert peak, 'GNU time peak RSS missing'
rss_bytes=int(peak[1])*1024
assert rss_bytes < 2_000_000_000, f'peak RSS {rss_bytes} breaches strict ceiling'
log=(p/'lean.log').read_text()
assert not re.search(r'(?im)^.*\b(?:error|warning):',log), 'Lean diagnostic present'
(p/'resources.json').write_text(json.dumps({'max_process_rss_bytes':rss_bytes,
  'wall_timeout_seconds':300,'compile_status':0,'scope':'actual lookup only'},indent=2)+'\n')
PY
sha256sum "$result_dir/EnergyDegreeOneLookup.olean" > "$result_dir/artifact.sha256"

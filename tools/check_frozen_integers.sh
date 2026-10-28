#!/usr/bin/env bash
# Focused actual typed-source checks; run in the coordinator's owned warm slot.
# Agent-ID: codex-7c2e.
set -euo pipefail
test "$(cat lean-toolchain)" = 'leanprover/lean4:v4.34.1'
lean --version
test -n "${OUT:?Set OUT to an owned result directory}"
mkdir -p "$OUT"
python3 tools/gen_frozen_integer_data.py --check
python3 tools/gen_frozen_integer_checks.py --check
python3 - <<'PY'
import json, pathlib, subprocess
for package in json.loads(pathlib.Path('lake-manifest.json').read_text())['packages']:
    if package['type'] != 'git':
        raise SystemExit('Unexpected package kind')
    revision = subprocess.check_output(['git', '-C', '.lake/packages/' + package['name'],
                                        'rev-parse', 'HEAD'], text=True).strip()
    if revision != package['rev']:
        raise SystemExit('Dependency revision differs: ' + package['name'])
print('All dependency revisions match the committed manifest.')
PY
lake --wfail build Grothe.UpperChaos.FrozenSource.Grade000Check \
  Grothe.UpperChaos.FrozenSource.Grade090Check \
  Grothe.UpperChaos.FrozenSource.Sizes \
  Grothe.UpperChaos.FrozenSourceBinding \
  Grothe.UpperChaos.FrozenSource.Grade000Production \
  Grothe.UpperChaos.FrozenSource.Grade090Production

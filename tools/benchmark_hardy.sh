#!/usr/bin/env bash
# Bounded Hardy performance experiment with the pinned official compiler release.
# The release digest is from GitHub's leanprover/lean4 v4.34.1 asset metadata.
# This avoids the releases.lean-lang.org redirect's intermittent TLS failure.
# Agent-ID: codex-7c2e.
set -euo pipefail

test "$(cat lean-toolchain)" = 'leanprover/lean4:v4.34.1'
test "$(uname -m)" = x86_64
HARDY_TOOLCHAIN="$PWD/.lake/hardy-toolchain"
HARDY_ARCHIVE="$PWD/.lake/hardy-toolchain.tar.zst"
mkdir -p "$HARDY_TOOLCHAIN"
curl --fail --location --retry 3 --retry-all-errors --connect-timeout 30 \
  'https://github.com/leanprover/lean4/releases/download/v4.34.1/lean-4.34.1-linux.tar.zst' \
  --output "$HARDY_ARCHIVE"
python3 - "$HARDY_ARCHIVE" <<'PY'
import hashlib, pathlib, sys
with pathlib.Path(sys.argv[1]).open('rb') as archive:
    actual = hashlib.file_digest(archive, 'sha256').hexdigest()
expected = '47bf4bbd78f70c2e9670598ab7124d92b6efb7330ff33e5fbb4030f6fd72e4e4'
if actual != expected:
    raise SystemExit('Official compiler asset digest differs from the pinned release.')
print('Official Lean 4.34.1 archive digest verified.')
PY
tar --zstd -xf "$HARDY_ARCHIVE" -C "$HARDY_TOOLCHAIN" --strip-components=1
rm "$HARDY_ARCHIVE"
export PATH="$HARDY_TOOLCHAIN/bin:$PATH"
lean --version
lake --version
if [ "${1:-}" = profile ]; then
  lake exe cache get Mathlib
else
  lake exe cache get Mathlib.Data.Rat.Init
fi
git diff --exit-code -- lean-toolchain lake-manifest.json
python3 - <<'PY'
import json, pathlib, subprocess
for package in json.loads(pathlib.Path('lake-manifest.json').read_text())['packages']:
    if package['type'] != 'git':
        raise SystemExit('Unexpected non-git dependency: ' + package['name'])
    root = pathlib.Path('.lake/packages') / package['name']
    actual = subprocess.check_output(['git', '-C', str(root), 'rev-parse', 'HEAD'], text=True).strip()
    if actual != package['rev']:
        raise SystemExit('Dependency revision differs: ' + package['name'])
print('All dependency revisions match the committed manifest.')
PY
if [ "${1:-}" = profile ]; then
  python3 - <<'PY'
import json, os, pathlib, subprocess
target = 'Grothe/UpperChaos/HardyArcSound.lean'
out = pathlib.Path(os.environ.get('OUT', 'handoff/hardy-profile'))
out.mkdir(parents=True, exist_ok=True)
setup = subprocess.check_output(['lake', 'setup-file', target], text=True)
json.loads(setup)
setup_file = out / 'profile.setup.json'
setup_file.write_text(setup)
cmd = ['lake', 'env', 'lean', '--setup=' + str(setup_file.resolve()), '--profile', target]
with (out / 'profile.txt').open('w') as log:
    result = subprocess.run(cmd, stdout=log, stderr=subprocess.STDOUT, timeout=1800)
print((out / 'profile.txt').read_text())
raise SystemExit(result.returncode)
PY
  exit
fi
lake build Grothe.UpperChaos.HardyArcEval:dynlib Grothe.UpperChaos.HardyArcData --log-level=warning
python3 - <<'INNER'
import json, os, pathlib, subprocess
libs = list(pathlib.Path('.lake/build/lib/lean').glob('*HardyArcEval*.so'))
if len(libs) != 1:
    raise SystemExit('Expected exactly one native HardyArcEval library: ' + repr(libs))
out = pathlib.Path(os.environ.get('OUT', 'handoff/hardy-benchmark'))
out.mkdir(parents=True, exist_ok=True)
setup = json.loads(subprocess.check_output(['lake', 'setup-file', 'tools/benchmark_hardy.lean'], text=True))
setup['dynlibs'].append(str(libs[0].resolve()))
setup_file = out / 'benchmark.setup.json'
setup_file.write_text(json.dumps(setup))
print('Native libraries in dependency order:', setup['dynlibs'], flush=True)
cmd = ['lake', 'env', 'lean', '--setup=' + str(setup_file.resolve()), '--run', 'tools/benchmark_hardy.lean']
with (out / 'benchmark.txt').open('w') as log:
    result = subprocess.run(cmd, stdout=log, stderr=subprocess.STDOUT, timeout=1200)
print((out / 'benchmark.txt').read_text())
raise SystemExit(result.returncode)
INNER

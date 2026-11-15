// codex-c7e2-research/replay.mjs — Agent-ID: codex-c7e2.
// Replays exact scalar checks; it does not formalize the accompanying proofs.
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const cwd = fileURLToPath(new URL('.', import.meta.url));
const checks = [
  ['Near-Gaussian scalar constants', 'python3', ['-I', 'remote/check_constants.py']],
  ['Retained regional certificate', 'python3', ['-I', 'boundary/verify_anisotropic.py']],
  ['Simultaneous odd-sector certificate', 'python3', ['-I', 'variational/joint_odd_cost_check.py']],
  ['Sharp norm identities', process.execPath, ['joint/verify_paired_norm.mjs']],
];
if (process.argv.includes('--numerical')) {
  checks.push(['Local-stability algebra and numerical cross-checks', 'python3', ['-I', 'all-sector/check_local_stability.py']]);
}
for (const [name, command, args] of checks) {
  const result = spawnSync(command, args, {
    cwd,
    encoding: 'utf8',
    env: { ...process.env, OPENBLAS_NUM_THREADS: '1' },
    maxBuffer: 4 * 1024 * 1024,
  });
  if (result.error || result.status !== 0) {
    process.stderr.write(`${name}: FAILED\n${result.error ?? ''}\n${result.stdout ?? ''}${result.stderr ?? ''}`);
    process.exit(result.status || 1);
  }
  process.stdout.write(`${name}: PASS\n`);
  if (process.argv.includes('--verbose')) process.stdout.write(result.stdout);
}
process.stdout.write('These checks support partial theorems. Full Conjecture K is not proved.\n');

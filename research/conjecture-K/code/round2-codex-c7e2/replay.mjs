// codex-c7e2-round2/replay.mjs; Agent-ID: codex-c7e2.
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
import path from 'node:path';

const cwd = path.dirname(fileURLToPath(import.meta.url));
const args = process.argv.slice(2);
if (args.some(arg => arg !== '--interval')) {
  throw new Error('Usage: node replay.mjs [--interval]');
}
const jobs = [
  [process.execPath, ['variational/check_explicit_edgeworth.mjs']],
  [process.execPath, ['variational/check_taylor_constants.mjs']],
  [process.execPath, ['root/check_two_coordinate_radius.mjs']],
];
if (args.includes('--interval')) {
  jobs.push(
    ['python3', ['-O', 'remotenumerics/certify_free_radial.py', '--n', '7', '--den', '16']],
    ['python3', ['-O', 'global/certify_inverse_neighborhood.py']],
  );
}
for (const [command, argv] of jobs) {
  console.log(`Running ${argv.join(' ')}`);
  const result = spawnSync(command, argv, { cwd, stdio: 'inherit' });
  if (result.error) throw result.error;
  if (result.status !== 0) process.exit(result.status ?? 1);
}
console.log('PASS: all requested certificate replays. Analytic proofs require mathematical review.');

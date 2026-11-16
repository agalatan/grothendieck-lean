// conjecture_k_uniform_local_codex_4d8a/run_checks.mjs; Agent-ID: codex-4d8a
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
const root = dirname(fileURLToPath(import.meta.url));
const checks = [
  ['node', ['remote-dependence/verify_content.mjs']],
  ['node', ['matrix/verify_tradeoff.mjs']],
  ['python3', ['-I', 'variational/verify_driver_tails.py']],
  ['python3', ['-I', 'matrix/trig_intervals.py', 'verify', 'matrix/trig128.txt']],
  ['python3', ['-I', 'matrix/verify_certificate.py']],
];
for (const [command, args] of checks) {
  console.log(`Checking ${args.join(' ')}`);
  const result = spawnSync(command, args, { cwd: root, encoding: 'utf8' });
  if (result.error || result.status !== 0) {
    process.stderr.write(result.stdout || '');
    process.stderr.write(result.stderr || '');
    throw result.error || new Error(`${command} exited ${result.status}`);
  }
  console.log('PASS');
}
console.log('All quick exact checks passed. The full interval recompute is separate.');

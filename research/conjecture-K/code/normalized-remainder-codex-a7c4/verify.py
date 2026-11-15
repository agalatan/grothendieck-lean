#!/usr/bin/env python3
"""Agent-ID: codex-a7c4. Refs #431. Certify an amplitude-complete tube of (P).

No claim of a full compact cover. SHARD/NSHARDS partition the endpoint checks;
each shard produces a partial receipt, never a full-tube PASS. Use --combine
on all receipts to check complete coverage. No saved receipt is an input to
fresh endpoint certification. Requires clang++ and the Python standard library.
"""
import argparse
from fractions import Fraction as F
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile

if not __debug__:
    raise RuntimeError("Assertions must be enabled")
HERE = Path(__file__).resolve().parent
CODE = HERE.parent
REPO = HERE.parents[3]
W = (F(2457, 4096), F(2459, 4096))
DIRECTIONS = [(F(1), F(1)), (-F(1, 4096), F(1, 4096)),
              (F(2367, 4096), F(2369, 4096)), (-F(1, 4096), F(1, 4096))]
SMAX = sum(max(abs(l), abs(h))**2 for l, h in DIRECTIONS)
PC = F(2500, 1891) - F(463, 5000)


def manifest():
    """Exact amplitude partition and sufficient endpoint reserves."""
    nodes = {F(1, 64), F(7, 8)}
    for octave in range(6):
        lo = F(2**octave, 64)
        nodes.update(lo*(1 + F(j, 16)) for j in range(17) if lo*(1+F(j, 16)) <= F(7, 8))
    nodes = sorted(nodes)
    intervals = list(zip(nodes[:-1], nodes[1:]))
    reserves = dict.fromkeys(nodes, F(0))
    for lo, hi in intervals:
        M = (2*PC + W[1]**2)*SMAX + 12*hi**2*SMAX**2
        need = M*(hi-lo)**2/(8*lo**2) + F(1, 10**6)
        # Round UP to a dyadic accepted exactly by the C++ rational parser.
        scaled = need*2**24
        need = F(-(-scaled.numerator//scaled.denominator), 2**24)
        for point in (lo, hi):
            reserves[point] = max(reserves[point], need)
    assert nodes[0] == F(1, 64) and nodes[-1] == F(7, 8)
    assert all(x[1] == y[0] for x, y in zip(intervals, intervals[1:]))
    # S >= amplitude^2, so the inherited S>=3/4 exterior handles amplitude>=7/8.
    assert F(7, 8)**2 > F(3, 4)
    jobs = [(F(0), F(1, 64), F(0))] + [(x, x, reserves[x]) for x in nodes]
    return jobs, intervals


def dependencies():
    return [HERE/'normalized_integral.cpp', HERE/'verify.py',
            CODE/'compact-joint-2026-11-15/hessian_integral.cpp',
            CODE/'compact-joint-2026-11-15/strip_check.py',
            CODE/'progress-2026-11-15-codex-a7c4/joint_target_tail.py',
            *[CODE/'tilted-sector-2026-11-15'/n for n in
              ('secant_verify.cpp', 'theta_verify.cpp', 'localization_circle.hpp')]]


def hashes():
    return {str(p.relative_to(REPO)): hashlib.sha256(p.read_bytes()).hexdigest() for p in dependencies()}


def check_output(stdout):
    m = re.fullmatch(r'PASS NORMALIZED w=\S+ rho=\S+ Sdir=\S+ upper=(\S+) target_lower=(\S+) cells=(\d+)\n', stdout)
    assert m, stdout
    assert F(m[1]) < F(m[2])
    return {'upper': m[1], 'target_lower': m[2], 'cells': int(m[3])}


def combine(paths, output):
    jobs, intervals = manifest()
    all_rows = {}
    for path in paths:
        data = json.loads(path.read_text())
        assert data['sha256'] == hashes(), 'stale/different source receipt'
        assert data['status'] == 'PASS assigned endpoint checks; full (P) remains open'
        for row in data['rows']:
            index = row['index']
            assert index not in all_rows, 'duplicated endpoint'
            assert row['job'] == list(map(str, jobs[index]))
            assert row['result'] == check_output(row['stdout'])
            all_rows[index] = row
    assert sorted(all_rows) == list(range(len(jobs))), 'missing endpoint/strip'
    result = {'agent_id': 'codex-a7c4', 'status': 'PASS amplitude-complete tube; full (P) remains open',
              'complete_interior': False, 'complete_tube': True,
              'w': list(map(str, W)), 'directions': [list(map(str, x)) for x in DIRECTIONS],
              'amplitude_intervals': [[str(l), str(h)] for l, h in intervals],
              'rows': [all_rows[i] for i in range(len(jobs))], 'sha256': hashes()}
    output.write_text(json.dumps(result, indent=2)+'\n')
    print(result['status'], 'endpoints/strip', len(jobs), 'amplitude cells', len(intervals))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--combine', type=Path, nargs='+')
    parser.add_argument('--output', type=Path)
    parser.add_argument('--smoke', action='store_true')
    args = parser.parse_args()
    output = args.output or Path(os.environ.get('OUT', str(REPO/'handoff/codex-a7c4-compact-next')))/'normalized-receipt.json'
    output.parent.mkdir(parents=True, exist_ok=True)
    if args.combine:
        combine(args.combine, output)
        return
    shard, nshards = int(os.environ.get('SHARD', 0)), int(os.environ.get('NSHARDS', 1))
    assert 0 <= shard < nshards
    scratch = REPO/'handoff'; scratch.mkdir(exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='codex-a7c4-normalized-', dir=scratch) as td:
        temp = Path(td)
        inherited = CODE/'tilted-sector-2026-11-15'
        text = (inherited/'secant_verify.cpp').read_text()
        assert text.count('int main(') == 1
        text = text.replace('int main(', 'int inherited_secant_main(')
        for name in ('theta_verify.cpp', 'localization_circle.hpp'):
            text = text.replace(f'#include "{name}"', f'#include "{inherited/name}"')
        (temp/'inherited_secant.hpp').write_text(text)
        base = (CODE/'compact-joint-2026-11-15/hessian_integral.cpp').read_text()
        assert base.count('std::array<J2,6> hk') == 1
        (temp/'normalized_base.hpp').write_text(base[:base.index('std::array<J2,6> hk')])
        flags = ['clang++', '-O2', '-std=c++17', '-frounding-math', '-ffp-contract=off',
                 '-fno-fast-math', '-I', str(temp)]
        source = str(HERE/'normalized_integral.cpp'); binary = temp/'normalized_integral'
        subprocess.run(flags+[source, '-o', str(binary)], check=True)
        for bad in ('-DNDEBUG', '-ffast-math'):
            r = subprocess.run(flags+[bad, '-fsyntax-only', source], capture_output=True)
            assert r.returncode != 0
        for script in (CODE/'compact-joint-2026-11-15/strip_check.py',
                       CODE/'progress-2026-11-15-codex-a7c4/joint_target_tail.py'):
            subprocess.run([sys.executable, '-I', str(script)], check=True, capture_output=True)
        for opt in ('-O', '-OO'):
            r = subprocess.run([sys.executable, '-I', opt, str(HERE/'verify.py')], capture_output=True)
            assert r.returncode != 0
        # A deliberately impossible reserve must never certify, even on Sdir=1.
        r = subprocess.run([str(binary), '0', '1', '0', '0', '0', '0', '1000', '240'], capture_output=True)
        assert r.returncode == 1 and b'UNRESOLVED' in r.stdout
        jobs, _ = manifest(); rows = []
        indices = [0] if args.smoke else range(shard, len(jobs), nshards)
        for i in indices:
            lo, hi, reserve = jobs[i]
            pairs = [W, *DIRECTIONS, (lo, hi)]
            command = [str(binary), *[str(x) for pair in pairs for x in pair], str(reserve), '300000']
            r = subprocess.run(command, capture_output=True, text=True)
            if r.returncode:
                raise RuntimeError(f'UNRESOLVED job {i} {jobs[i]}: {r.stdout}\n{r.stderr}')
            row = {'index': i, 'job': list(map(str, jobs[i])), 'stdout': r.stdout, 'result': check_output(r.stdout)}
            rows.append(row)
            print('PASS job', i, 'of', len(jobs), 'amplitude', str(lo), str(hi), 'cells', row['result']['cells'], flush=True)
        result = {'status': 'PASS assigned endpoint checks; full (P) remains open', 'rows': rows,
                  'complete_interior': False, 'complete_tube': False, 'sha256': hashes()}
        output.write_text(json.dumps(result, indent=2)+'\n')
        print(result['status'], output, flush=True)


if __name__ == '__main__':
    main()

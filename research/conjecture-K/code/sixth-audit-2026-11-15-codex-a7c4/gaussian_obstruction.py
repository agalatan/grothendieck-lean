#!/usr/bin/env python3
"""Finite Gaussian-marginal obstruction. Agent-ID: codex-a7c4. Refs #415.

python3 -I gaussian_obstruction.py [--dependency-dir EXISTING_FLINT_DIR]
Fresh kernel derivative constants and direct Rice benchmark; no saved data input.
"""
import argparse
import contextlib
from fractions import Fraction as Q
import hashlib
import io
import json
from pathlib import Path
import runpy
import subprocess
import sys

if not __debug__:
    raise RuntimeError('Assertions required; do not use -O.')
sys.dont_write_bytecode = True
BASE = Path(__file__).resolve().parents[1]


def verify(dependency_dir=None):
    kernel = BASE/'third-audit-2026-11-15-codex-a7c4/content_kernels_exact.py'
    benchmark = BASE/'reaudit-2026-11-15-codex-a7c4/remote_benchmark_crosscheck.py'
    with contextlib.redirect_stdout(io.StringIO()):
        kernels = runpy.run_path(str(kernel))
    ma = kernels['peak'][2]
    assert ma[1].lo > Q(43,20) and ma[2].hi < Q(117,10)
    exp = kernels['lib']['exp_positive']
    # F_2(1)>1/4 and F_2(5/2)<3/4.
    assert exp(Q(1)).lo > Q(8,3)
    assert exp(Q(5,2)).hi < 14
    # sin(2*pi*y)>=sqrt(2)/2>7/10 on [1/8,1/4].
    assert Q(1,2) > Q(7,10)**2
    variance = Q(403448,10**7)
    assert variance > Q(1,25)
    derivative_lower = Q(43,20)-Q(5,2)*variance*Q(117,10)
    w_gap_lower = Q(3,4)*variance*derivative_lower
    imaginary_J_lower = Q(1,8)*Q(7,10)*w_gap_lower
    assert imaginary_J_lower > Q(1,400)
    amplitude, price = Q(1,1250), Q(2500,1891)
    # sqrt(variance)>1/5; supporting plane is a global lower bound.
    norm_gain_lower = 4*Q(1,5)*Q(1,400)*amplitude-price*amplitude**2
    command = [sys.executable,'-I',str(benchmark)]
    if dependency_dir:
        command += ['--dependency-dir',str(dependency_dir)]
    replay = subprocess.run(command,capture_output=True,text=True,check=True)
    assert not replay.stderr, replay.stderr
    evidence = json.loads(replay.stdout)
    assert evidence['status']=='PASS'
    assert Q(evidence['support_variance'])==variance
    lower = Q(evidence['support_value_enclosure'][0])
    upper = Q(evidence['S_enclosure'][1])
    excess_lower = norm_gain_lower-(upper-lower)
    assert excess_lower > Q(7,10**7)
    return {'agent_id':'codex-a7c4','task':415,'status':'PASS',
            'variance':str(variance),'A_amplitude':str(amplitude),
            'M1_A_lower':'43/20','M2_A_upper':'117/10',
            'imaginary_J_lower':str(imaginary_J_lower),
            'norm_gain_lower':str(norm_gain_lower),
            'Gaussian_benchmark_gap_upper':str(upper-lower),
            'raw_excess_over_S_lower':str(excess_lower),
            'simple_excess_lower':'7/10000000',
            'kernel_derivatives':[v.enclosure() for v in ma[:3]],
            'source_sha256':{f.name:hashlib.sha256(f.read_bytes()).hexdigest()
                             for f in [kernel,benchmark,BASE/'audit-2026-11-15-codex-a7c4/odd_cost_check.py']},
            'scope':'Exactly Gaussian remote marginal, first-chaos orthogonal, but not a Wick cubic. Refutes law-only exact shared-A domination; does not refute K or the 1e-4 allowance.',
            'trust':'Paper supplies smooth phase transport and supporting-plane inequality; derivative and benchmark inputs freshly replayed.'}


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--dependency-dir',type=Path)
    parser.add_argument('--write-result',action='store_true')
    args=parser.parse_args()
    dependency=args.dependency_dir.resolve(strict=True) if args.dependency_dir else None
    output=json.dumps(verify(dependency),indent=2,sort_keys=True)+'\n'
    if args.write_result:
        Path(__file__).with_name('gaussian_obstruction_result.json').write_text(output)
    print(output,end='')


if __name__=='__main__':
    main()

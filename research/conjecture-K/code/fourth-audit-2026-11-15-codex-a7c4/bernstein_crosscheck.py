"""Reconstruct the third audit's positive polynomials from Bernstein controls.

Agent-ID: codex-a7c4. Refs #406. python3 -I; standard library only.
Independent reverse basis expansion checks the six actual cell certificates,
not sampled values. Mathematical identities and trust limits: REMOTE.md.
"""
import argparse
import contextlib
from fractions import Fraction as Q
import io
import json
from math import comb
from pathlib import Path
import runpy
import sys

if not __debug__:
    raise RuntimeError('Assertions must be enabled; do not use -O.')
sys.dont_write_bytecode=True


def reconstruct(controls,left,right):
    """Expand sum c_i binom(n,i)(x-l)^i(r-x)^(n-i)/(r-l)^n."""
    n=len(controls)-1
    result=[Q(0)]*(n+1)
    for i,c in enumerate(controls):
        for j in range(i+1):
            first=Q(comb(i,j))*(-left)**(i-j)
            for k in range(n-i+1):
                second=Q(comb(n-i,k))*right**(n-i-k)*(-1)**k
                result[j+k]+=c*comb(n,i)*first*second/(right-left)**n
    return result


def verify():
    third=Path(__file__).resolve().parent.parent/'third-audit-2026-11-15-codex-a7c4'
    potential=runpy.run_path(str(third/'potential_bounds.py'))
    # This also replays the content endpoint/occupancy budget acceptance.
    with contextlib.redirect_stdout(io.StringIO()):
        content=runpy.run_path(str(third/'content_kernels_exact.py'))
    add,mul,scale=(potential[s] for s in ['add','mul','scale'])
    i0,exp=(potential[s] for s in ['i0_upper','exp_lower'])
    constant=add(scale(exp(21),Q(147,125)**2),[Q(0)]+scale(mul(i0(4,1),i0(4,1)),-Q(44,7)))
    far=add(mul([Q(1,25),Q(2,5),Q(1)],exp(42)),
            [Q(0)]*3+scale(mul(i0(10,3),i0(10,3)),-Q(44,7)))
    atom=list(map(Q,[3,-21,42,-8]))
    cases=[('potential_constant',constant,Q(0),Q(1,2),potential['bernstein']),
           ('potential_constant',constant,Q(1,2),Q(3,4),potential['bernstein']),
           ('potential_constant',constant,Q(3,4),Q(1),potential['bernstein']),
           ('potential_far',far,Q(1),Q(3),potential['bernstein']),
           ('content_atom',atom,Q(0),Q(1,4),content['bernstein']),
           ('content_atom',atom,Q(1,4),Q(1,2),content['bernstein'])]
    results=[]
    for name,poly,left,right,forward in cases:
        controls=forward(poly,left,right)
        assert all(c>0 for c in controls)
        assert reconstruct(controls,left,right)==poly
        results.append({'name':name,'degree':len(poly)-1,
                        'interval':[str(left),str(right)],
                        'minimum_control':str(min(controls))})
    assert potential['verify']()['status']=='PASS'
    return {'agent_id':'codex-a7c4','task':406,'status':'PASS',
            'method':'Exact reverse basis expansion of every actual positive cell polynomial',
            'certificates':results,
            'scope':'Bernstein arithmetic in the third audit only; no claim to audit Python/FLINT internals or all historical libraries.'}


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-result',action='store_true')
    args=parser.parse_args()
    output=json.dumps(verify(),indent=2)+'\n'
    if args.write_result:
        Path(__file__).with_name('bernstein_crosscheck_result.json').write_text(output)
    print(output,end='')


if __name__=='__main__':
    main()

#!/usr/bin/env python3
"""codex-6e2b: freshly certify additional global Hermite caps beyond s=2.

The Bernstein-function fourth-derivative sign and archived Arb integrator
are inherited mathematical/code dependencies. No saved integral is trusted.
"""
from fractions import Fraction as Q
import importlib.util
import json
from pathlib import Path
import time
from flint import arb
ROOT=Path(__file__).resolve().parent
ARCHIVE=ROOT.parents[2]/'research/conjecture-K/code/audit-2026-11-15-codex-a7c4/remote_stein_original'
spec=importlib.util.spec_from_file_location('remote_profile',ARCHIVE/'profile.py')
profile=importlib.util.module_from_spec(spec);spec.loader.exec_module(profile)


def ar(q):
    q=Q(q);return arb(q.numerator)/q.denominator


def upward(value):
    scale=10**15
    z=(value*scale).upper().ceil().unique_fmpz()
    assert z is not None
    q=Q(int(z)+1,scale)
    assert ar(q)>value
    return str(q)


def generate(emit=True):
    start=time.time()
    nodes=list(map(Q,[2,3,4,6,8,12,16,24,32,48,64]))
    vals={x:profile.evaluate(ar(x)) for x in nodes}
    cells=[]
    for l,r in zip(nodes,nodes[1:]):
        aa,d=ar(l),ar(r-l);fl,dl=vals[l];fr,dr=vals[r]
        c2=(3*(fr-fl)-d*(2*dl+dr))/d**2
        c3=(d*(dl+dr)-2*(fr-fl))/d**3
        H=[fl-aa*dl+aa**2*c2-aa**3*c3,dl-2*aa*c2+3*aa**2*c3,c2-3*aa*c3,c3]
        coeff=list(map(upward,H))
        assert Q(coeff[-1])>0
        cells.append({'interval':[str(l),str(r)],'nodes':[str(l),str(r)],'coefficients':coeff})
    f,d=vals[nodes[-1]]
    tail=[upward(f-ar(nodes[-1])*d),upward(d)]
    data={'Agent-ID':'codex-6e2b','status':'C: freshly recomputed additional Hermite and tangent profile caps',
          'cells':cells,'tail':tail,'seconds':time.time()-start}
    if emit:print(json.dumps({'claim':data['status'],'cells':len(cells),'seconds':data['seconds']}),flush=True)
    return data


if __name__=='__main__':
    data=generate()
    (ROOT/'deficit_dual_profile_caps.json').write_text(json.dumps(data,indent=2)+'\n')

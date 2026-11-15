#!/usr/bin/env python3
"""Agent-ID: codex-a7c4. Exact conditional A/B scalar assembly.

P+C by author, pending external review. This checks rational multipliers
only; it does not certify the pointwise premise or inherited content inputs.
Run from the repository root:
  python3 -I research/conjecture-K/code/progress-2026-11-15-codex-a7c4/joint_target_check.py
"""
from fractions import Fraction as F
from pathlib import Path
import json
if not __debug__:
    raise SystemExit('Refusing optimized Python: acceptance uses assertions.')

def verify(path):
    rho=F(5053,10000); d=1+rho*rho
    alpha=F(31,100); beta=F(2,25); E0=F(463,10000); total=F(80051,10**6)
    err=F(7532,10**7); eta=F(6,10**6); gamma=F(3,10); cap=F(49,10**6)
    assert err*err >= F(7,2000)**2*E0
    a,b=rho*err/d,err/d
    lambdas=json.loads(path.read_text())['multipliers']
    assert len(lambdas)==1000
    largest=None
    for i,value in enumerate(lambdas):
        lam=F(value)
        lo,hi=total*i/1000,total*(i+1)/1000
        # u <= E0 and u+V <= total; V in [lo,hi].
        correction=2*min(hi,total-E0)
        A,B=alpha-correction/d+lam,beta-correction/d+lam
        assert A>0 and B>0
        q2=1/A-1/gamma
        q1=2*a/A
        q0=a*a/A+b*b/B+eta/gamma+lam*d*(hi if lam>=0 else lo)
        # Max over 0 <= C <= 1/50 after completing the R,U squares.
        candidates=[q0,q2/F(2500)+q1/F(50)+q0]
        if q2<0:
            vertex=-q1/(2*q2)
            if 0<vertex<F(1,50):
                candidates.append(q0-q1*q1/(4*q2))
        upper=max(candidates)
        assert upper<cap,(i,str(upper))
        if largest is None or upper>largest[0]:largest=(upper,i)
    return {'accepted':True,'status':'P+C by author, pending external review; conditional on open pointwise premise and inherited content bounds; not a proof of K',
            'agent_id':'codex-a7c4','pointwise_premise_certified':False,
            'cells':len(lambdas),'gain_minus_D_plus_strict_cap':str(cap),
            'worst_cell':largest[1],'worst_upper_exact':str(largest[0]),
            'remote_allowance':str(F(36,10**8)),
            'total_conditional_allowance':str(cap+F(36,10**8))}

if __name__=='__main__':
    print(json.dumps(verify(Path(__file__).with_name('joint_target_multipliers.json')),indent=2))

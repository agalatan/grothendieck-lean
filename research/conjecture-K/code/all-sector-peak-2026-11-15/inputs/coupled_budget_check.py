#!/usr/bin/env python3
"""Exact conditional coupled R/U budget. Agent-ID codex-91d4; #430.

Adapts the scalar proof of codex-a7c4's joint_target_check.py. Freshly
checks every rational multiplier, interval, and quadratic maximum.
It proves no odd majorant, no A/B premise (P), and no content input.
Standard library only; writes nothing unless --output is requested.
"""
from pathlib import Path
from fractions import Fraction as Q
from math import isqrt
import argparse,hashlib,json,sys
if not __debug__ or sys.flags.optimize:
    raise SystemExit('Assertions required; no -O/-OO')
HERE=Path(__file__).resolve().parent


def verify(path):
    data=json.loads(path.read_text());assert data['cells']==1000
    expected=[('0','1/100','1/20000','49/1000000'),
              ('1/1000','1/100','9/200000','531/10000000'),
              ('3/1000','1/100','7/200000','1/16000'),
              ('1/200','1/100','1/40000','721/10000000')]
    assert [tuple(Q(c[k]) for k in ['x','y','odd_eta','scalar_cap']) for c in data['cases']]==[
        tuple(map(Q,row)) for row in expected],'coupled target contract mismatch'
    rho=Q(5053,10000);d=1+rho*rho
    e0=Q(463,10000);total=Q(80051,1000000)
    gamma=Q(3,10);eta_A=Q(3,500000);content_cap=Q(1,50)
    error=Q(1883,2500000);remote=Q(9,25000000)
    assert error*error>=Q(7,2000)**2*e0
    a,b=rho*error/d,error/d
    rows=[]
    for case in data['cases']:
        x,y,odd_eta,cap=map(Q,[case['x'],case['y'],case['odd_eta'],case['scalar_cap']])
        assert 0<=x<Q(31,100) and 0<=y<Q(2,25) and odd_eta>=0
        assert cap+odd_eta+remote<Q(1,10000)
        lambdas=list(map(Q,case['multipliers']));assert len(lambdas)==1000
        worst=None
        for i,lam in enumerate(lambdas):
            lo,hi=total*i/1000,total*(i+1)/1000
            correction=2*min(hi,total-e0)
            A=Q(31,100)-x-correction/d+lam
            B=Q(2,25)-y-correction/d+lam
            assert A>0 and B>0,(x,y,i,'nonpositive completion coefficient')
            q2=1/A-1/gamma
            q1=2*a/A
            q0=a*a/A+b*b/B+eta_A/gamma+lam*d*(hi if lam>=0 else lo)
            candidates=[(q0,Q(0)),
                        (q2*content_cap**2+q1*content_cap+q0,content_cap)]
            if q2<0:
                vertex=-q1/(2*q2)
                if 0<vertex<content_cap:
                    candidates.append((q0-q1*q1/(4*q2),vertex))
            upper,at_C=max(candidates)
            assert upper<cap,(x,y,i,str(upper),str(cap))
            if worst is None or upper>worst[0]:worst=(upper,i,at_C)
        rows.append({'x':str(x),'y':str(y),'odd_eta':str(odd_eta),
                     'scalar_strict_cap':str(cap),'total_strict_cap':str(cap+odd_eta+remote),
                     'reserve_below_1e_4':str(Q(1,10000)-cap-odd_eta-remote),
                     'worst_upper_exact':str(worst[0]),'worst_upper_decimal':float(worst[0]),
                     'worst_cell':worst[1],'maximizing_C_in_that_cell':str(worst[2])})
    # The genuine one-Y diagnostic: exact brackets, no quadrature input.
    scale=10**30;n=isqrt(2*scale*scale)
    sl,sh=Q(n,scale),Q(n+1,scale)
    assert sl*sl<2<sh*sh
    alpha=Q(179,3500);beta0=Q(439,3500)
    base_R=alpha*alpha+2*rho*rho*beta0*beta0
    base_U=2*beta0*beta0+rho*rho*alpha*alpha
    cross=2*rho*alpha*beta0
    Rlo,Rhi=base_R+cross*sl,base_R+cross*sh
    Ulo,Uhi=base_U-cross*sh,base_U-cross*sl
    W=Q(1467,1000000)
    return {'Agent-ID':'codex-91d4','issue':430,
            'status':'PASS EXACT CONDITIONAL COUPLED SCALAR BUDGET',
            'odd_majorant_proved':False,'pointwise_AB_premise_proved':False,
            'cells_per_case':1000,'cases':rows,
            'candidate_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),
            'genuine_diagnostic_coordinates':{'R_squared_interval':[str(Rlo),str(Rhi)],
                  'U_squared_interval':[str(Ulo),str(Uhi)],
                  'R_squared_decimal':float(Rlo),'U_squared_decimal':float(Ulo),
                  'odd_energy':str(W),
                  'main_target_rhs_without_kappa_decimal':float(Ulo/Q(100)+Q(1,20000))}}


if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--input',type=Path,default=HERE/'coupled_budget_multipliers.json')
    p.add_argument('--output',type=Path)
    args=p.parse_args();result=verify(args.input)
    body=json.dumps(result,indent=2)+'\n'
    if args.output:args.output.write_text(body)
    print(body,end='')

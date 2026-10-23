#!/usr/bin/env python3
"""Exact two-complex-disc support dual certificates.

Default: verify a JSON file using ONLY the standard library. --propose uses a
floating SDP solver to propose prices, then accepts them only through exact
rational principal-minor checks. No Gaussian norm or endpoint is certified.
"""
import argparse
import json
from fractions import Fraction as F
from pathlib import Path


def cx(z):
    return tuple(map(F,z))


def conj(z):
    return z[0],-z[1]


def mul(z,w):
    return z[0]*w[0]-z[1]*w[1],z[0]*w[1]+z[1]*w[0]


def norm2(z):
    return z[0]**2+z[1]**2


def psd_minors(case, prices):
    a,b=F(case['a']),F(case['b'])
    p,q,w=map(cx,[case['p'],case['q'],case['w']])
    d0,d1,d2=prices[0],prices[1]-a,prices[2]-b
    s01=tuple(-v/2 for v in conj(p))
    s02=tuple(-v/2 for v in conj(q))
    s12=tuple(-v for v in w)
    det=d0*d1*d2+2*mul(mul(s01,s12),conj(s02))[0]-d0*norm2(s12)-d1*norm2(s02)-d2*norm2(s01)
    return [d0,d1,d2,d0*d1-norm2(s01),d0*d2-norm2(s02),
            d1*d2-norm2(s12),det]


def value(case,u,v):
    a,b=F(case['a']),F(case['b'])
    p,q,w=map(cx,[case['p'],case['q'],case['w']])
    return a*norm2(u)+b*norm2(v)+mul(conj(p),u)[0]+mul(conj(q),v)[0]+2*mul(mul(conj(u),w),v)[0]


def verify(data):
    for case in data['cases']:
        prices=list(map(F,case['prices']))
        assert prices[1]>=0 and prices[2]>=0, 'negative inequality price'
        assert all(v>=0 for v in psd_minors(case,prices)), 'non-PSD dual slack'
        upper=sum(prices)
        u,v=map(cx,[case['u'],case['v']])
        assert norm2(u)<=1 and norm2(v)<=1, 'infeasible lower witness'
        lower=value(case,u,v)
        assert lower==F(case['lower']) and upper==F(case['upper'])
        assert 0<=upper-lower<=F(data['accepted_gap']), 'local certificate gap too large'
        # A meaningful rejection check: subtract .01 from every dual price.
        tampered=[p-F(1,100) for p in prices]
        assert (tampered[1]<0 or tampered[2]<0 or any(v<0 for v in psd_minors(case,tampered)))
        print(case['name'],'PASS exact two-disc interval; gap <',data['accepted_gap'],flush=True)
    print('PASS all rational PSD checks and tampered-price rejections')


def propose(path):
    import cvxpy as cp
    import numpy as np
    cases=[dict(name='bilinear',a='0',b='0',p=['0','0'],q=['0','0'],w=['1','0'],u=['1','0'],v=['1','0']),
           dict(name='interior-independent',a='-1',b='-1',p=['1','0'],q=['1','0'],w=['0','0'],u=['1/2','0'],v=['1/2','0']),
           dict(name='interior-coupled',a='-1',b='-1',p=['1','0'],q=['1','0'],w=['1/4','0'],u=['2/3','0'],v=['2/3','0']),
           dict(name='complex-linear',a='0',b='0',p=['3/5','4/5'],q=['0','1'],w=['0','0'],u=['3/5','4/5'],v=['0','1'])]
    for case in cases:
        z=lambda v:complex(float(F(v[0])),float(F(v[1])))
        p,q,w=z(case['p']),z(case['q']),z(case['w'])
        H=np.array([[0,p.conjugate()/2,q.conjugate()/2],[p/2,float(F(case['a'])),w],
                    [q/2,w.conjugate(),float(F(case['b']))]],dtype=complex)
        lam=cp.Variable(3)
        prob=cp.Problem(cp.Minimize(cp.sum(lam)),[lam[1:]>=0,cp.diag(lam)-H>>0])
        prob.solve(solver='CLARABEL',tol_gap_abs=1e-11,tol_feas=1e-11,tol_gap_rel=1e-11,max_iter=200)
        if lam.value is None:
            raise ValueError(prob.status)
        rounded=[F(float(v)).limit_denominator(10**12) for v in lam.value]
        rounded[1:]=[max(F(0),v) for v in rounded[1:]]
        pad=F(1,10**12)
        for _ in range(60):
            prices=[v+pad for v in rounded]
            if all(v>=0 for v in psd_minors(case,prices)):
                break
            pad*=2
        else:
            raise ValueError('exact PSD loading failed')
        lower=value(case,cx(case['u']),cx(case['v']))
        case.update(prices=list(map(str,prices)),lower=str(lower),upper=str(sum(prices)),
                    exact_loading=str(pad),solver_status=prob.status)
    data={'scope':__doc__,'accepted_gap':'1/100000000','cases':cases}
    verify(data)
    path.write_text(json.dumps(data,indent=2)+'\n')


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('path',type=Path)
    p.add_argument('--propose',action='store_true')
    args=p.parse_args()
    if args.propose:
        propose(args.path)
    else:
        verify(json.loads(args.path.read_text()))


if __name__=='__main__':
    main()

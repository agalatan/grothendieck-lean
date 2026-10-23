#!/usr/bin/env python3
"""FLOAT common-tail spectral screen; exact rational price export.

All noise residuals use the SAME signed Hermite coefficients. The price is
bounded at every index: an exact finite front plus a geometric tail budget.
Input integrals remain floating estimates. Optional errors are assumptions,
not confidence bounds; this script never certifies an improved endpoint.
"""
import argparse
from fractions import Fraction as Q
import json
from pathlib import Path

import numpy as np
from scipy.optimize import linprog


def solve(data,cutoff,cap,ehead,ekernel):
    r=np.array([float(Q(v['rho'])) for v in data['tests']]);q=len(r)
    c0=np.array([float(Q(v['c0'])) for v in data['midpoint_columns']])
    c1=np.array([float(Q(v['c1'])) for v in data['midpoint_columns']])
    K=np.array([[float(Q(x)) for x in v['kernels']] for v in data['midpoint_columns']]).T
    R=K-r[:,None]*c0-r[:,None]**3*c1
    # v,s,a[0:q],t[0:q],u0,u1. The last variables bound the
    # absolute low-mode weights, giving a sharper interval error ledger.
    N=2+2*q+2;u0=N-2;u1=N-1;A=[];b=[]
    for j in range(len(c0)):
        row=np.zeros(N);row[0]=-1;row[1]=-c1[j];row[2:2+q]=-R[:,j]
        # Baseline enclosures are replayed separately by verify_spectral_prices.
        # Numerical columns still need actual integral enclosures; ehead and
        # ekernel are explicit assumptions, never estimated confidence bounds.
        err0=ehead if j<len(c0)-2 else 1e-13
        errK=ekernel if j<len(c0)-2 else 1e-13
        row[2+q:2+2*q]=errK;row[u0]=err0;row[u1]=err0
        A.append(row);b.append(-c0[j])
    for k in range(2,cutoff+1):
        row=np.zeros(N);row[2:2+q]=r**(2*k+1)
        A.extend([row,-row]);b.extend([1,1])
    for i in range(q):
        row=np.zeros(N);row[2+i]=1;row[2+q+i]=-1
        A.append(row);b.append(0)
        row=row.copy();row[2+i]=-1;A.append(row);b.append(0)
    row=np.zeros(N);row[2+q:2+2*q]=r**(2*cutoff+3)
    A.append(row);b.append(1)
    row=np.zeros(N);row[2+q:2+2*q]=1;A.append(row);b.append(cap)
    for sign in [-1,1]:
        row=np.zeros(N);row[2:2+q]=sign*r;row[u0]=-1
        A.append(row);b.append(-sign)
        row=np.zeros(N);row[1]=-sign;row[2:2+q]=sign*r**3;row[u1]=-1
        A.append(row);b.append(0)
    fit=linprog(np.r_[1.,np.zeros(N-1)],A_ub=A,b_ub=b,
                bounds=[(None,None),(-1,1)]+[(None,None)]*q+[(0,None)]*(q+2),method='highs')
    assert fit.success,fit.message
    qr=[Q(v['rho']) for v in data['tests']]
    a=[Q(str(x)).limit_denominator(10**7) for x in fit.x[2:2+q]]
    scale=max([Q(1),sum(abs(x)*t**(2*cutoff+3) for x,t in zip(a,qr))]+
              [abs(sum(x*t**(2*k+1) for x,t in zip(a,qr))) for k in range(2,cutoff+1)])
    a=[x/scale for x in a];s=max(Q(-1),min(Q(1),Q(str(fit.x[1])).limit_denominator(10**7)))
    w0=1+sum(x*t for x,t in zip(a,qr));w1=-s+sum(x*t**3 for x,t in zip(a,qr))
    bounds=[]
    for j,v in enumerate(data['midpoint_columns']):
        z0,z1=Q(v['c0']),Q(v['c1']);kk=list(map(Q,v['kernels']))
        value=w0*z0+w1*z1-sum(x*y for x,y in zip(a,kk))
        eh=Q(str(ehead)) if j<len(c0)-2 else Q(1,10**13)
        ek=Q(str(ekernel)) if j<len(c0)-2 else Q(1,10**13)
        value+=eh*(abs(w0)+abs(w1))+ek*sum(map(abs,a))
        bounds.append(value)
    cert={'scope':'Exact all-index price and algebra on stored floating inputs. Errors are assumed.',
          'cutoff':cutoff,'cubic_price':str(s),
          'tests':[{'rho':str(t),'price':str(x)} for t,x in zip(qr,a)],
          'midpoint_columns':data['midpoint_columns'],'analytic_last_columns':2,
          'head_error_assumption':str(Q(str(ehead))),'kernel_error_assumption':str(Q(str(ekernel))),
          'analytic_baseline_error':'1/10000000000000',
          'bound':str(max(bounds))}
    return {'cutoff':cutoff,'price_l1_cap':cap,'head_error_assumption':ehead,
            'kernel_error_assumption':ekernel,'midpoint_or_conditional_upper_screen':float(max(bounds)),
            'head_weights':[float(w0),float(w1)],'price_l1':float(sum(map(abs,a))),
            'prices':list(map(float,a)),'rational_certificate':cert,
            'warning':'Not an achieved score or a certified pool exclusion.'}


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('input',type=Path)
    p.add_argument('--out',type=Path,required=True);a=p.parse_args()
    data=json.loads(a.input.read_text())['rational_midpoint_screen'];out=[]
    for cap in [10,50,200]:
        for eh,ek in [(0.,0.),(1e-6,1e-5),(1e-5,1e-4)]:
            r=solve(data,64,cap,eh,ek);out.append(r)
            a.out.write_text(json.dumps(out,indent=2)+'\n')
            print(cap,eh,ek,r['midpoint_or_conditional_upper_screen'],r['price_l1'],flush=True)


if __name__=='__main__':main()

#!/usr/bin/env python3
"""Exact finite primal witness for the named table-and-cut relaxation ONLY.

No assertion that a law is a Gaussian cubic law, that the table is the exact
fibre potential, or that this is a Grothendieck lower/upper witness is made.
Uses only the standard library. It recomputes rational moments, every listed
cut, the piecewise affine table objective and its strict target comparison.
"""
import argparse
from bisect import bisect_right
from fractions import Fraction as Q
import json
from pathlib import Path
import sys

if sys.flags.optimize:
    raise SystemExit("Frozen exact countermodel replay refuses Python -O/-OO: assertions are proof checks.")

# Frozen from the read-only source verifier on 23 October 2026, then hardened
# only with the optimization guard and input validation below.
ORIGINAL_SOURCE_SHA256 = "759daaa6540ac54fa7bdc4f0781c774e0d94efe64bfcb57e14104236a29543be"


def cut(no,u):
    rv=list(map(Q,no['rv']));mesh=[v*v for v in rv]
    ph=list(map(Q,no['phi']))+[Q(0)]
    i=bisect_right(mesh,u)-1
    primitive=sum((ph[j]+ph[j+1])*(mesh[j+1]-mesh[j])/2 for j in range(i))
    lo=mesh[i]
    slope=(ph[i+1]-ph[i])/(mesh[i+1]-lo) if i+1<len(mesh) else Q(0)
    du=u-lo;phi=ph[i]+slope*du;Phi=primitive+ph[i]*du+slope*du*du/2
    d=phi-Phi/u if u else Q(0)
    lam,mu,t,be,nu=(Q(no.get(k,'0')) for k in ['lam','mu','t','beta','nu'])
    af,ag=lam/3,mu/3
    if 'tensor_budget' in no:af,ag=Q(no['tensor_budget']['A'])/2,Q(no['tensor_budget']['B'])/2
    assert not no.get('extra_budgets')
    z=Q(no.get('sixth_joint',{}).get('weight','0'))
    ff=-(phi+be)/2+(2*t+af)*u;gg=-d/2+(t+ag-nu/2)*u
    return ff*ff/lam+gg*gg/mu+Phi-phi+(nu/3-2*t)*(u*u-2)+z*(-u**3+9*u*u-12)


def table(row,s):
    pairs=[(Q(x),Q(y)) for x,y in row['table']]
    k=bisect_right([x for x,y in pairs],s)-1
    assert k>=0
    x,y=pairs[k]
    if k+1==len(pairs):return y+Q(row['smax'])*(s-x)
    xx,yy=pairs[k+1];return y+(yy-y)*(s-x)/(xx-x)


def solve3(A,b):
    A=[list(row)+[v] for row,v in zip(A,b)]
    for j in range(3):
        k=next(k for k in range(j,3) if A[k][j]);A[j],A[k]=A[k],A[j]
        pivot=A[j][j];A[j]=[v/pivot for v in A[j]]
        for k in range(3):
            if k!=j:
                pivot=A[k][j];A[k]=[a-pivot*v for a,v in zip(A[k],A[j])]
    return [A[j][3] for j in range(3)]


def rationalize(v,w,rec,rows,bank):
    indices=[i for i,q in enumerate(w) if q>1e-10]
    vs=[Q(float(v[i])).limit_denominator(10**8) for i in indices]
    ws=[Q(round(float(w[i])*10**18),10**18) for i in indices]
    us=[a*a for a in vs];x=Q(rec['envelope_argmax']['x'])
    targets=[Q(1),Q(1),2+x*x]
    picks=[0,len(us)//2,len(us)-1]
    assert len(set(picks))==3
    A=[[us[j]**k for j in picks] for k in range(3)]
    rhs=[targets[k]-sum(q*u**k for q,u in zip(ws,us)) for k in range(3)]
    correction=solve3(A,rhs)
    for j,delta in zip(picks,correction):ws[j]+=delta
    rr=[{'weight':str(q),'row':rows[i]} for i,q in rec['rows']]
    return {'scope':__doc__,'index':rec['index'],'witness_epsilon':'149/200',
            'point':rec['envelope_argmax'],'row_parameters':rec['row_parameters'],
            'support':[{'v':str(a),'weight':str(q)} for a,q in zip(vs,ws)],
            'rows':rr,'cuts':[{'name':name,'data':no} for name,no in bank],
            'comparison_target':'500/701'}


def verify(d):
    if Q(d['witness_epsilon']) != Q(149,200):
        raise ValueError("this frozen verifier supports only witness epsilon 149/200")
    if not d.get('cuts') or not d.get('rows'):
        raise ValueError("the finite model must contain nonempty cut and row banks")
    atoms=[(Q(z['v']),Q(z['weight'])) for z in d['support']]
    assert atoms and all(v>=0 and w>0 for v,w in atoms)
    t,tau,x=(Q(d['point'][k]) for k in ['t','tau','x'])
    moment=lambda k:sum(w*v**k for v,w in atoms)
    assert moment(0)==1 and moment(2)==1 and moment(4)==2+x*x
    assert moment(1)<=Q(973612157,10**9)
    m6=6+9*x*x+Q(4045313,100000)*x**3
    assert moment(6)<=m6
    minimum=None
    for item in d['cuts']:
        no=item['data']
        assert x<=Q(no.get('sixth_joint',{}).get('xmax','31/4'))
        q=sum(w*cut(no,v*v) for v,w in atoms)
        assert q>=0,('cut',item['name'],float(q))
        if minimum is None or q<minimum[0]:minimum=(q,item['name'])
    assert sum(Q(r['weight']) for r in d['rows'])==1
    ell,beta,price=(Q(d['row_parameters'][k]) for k in ['ell','beta','price'])
    # Validate the profile parameters and Schur price against the supplied rows.
    vr=[]
    for item in d['rows']:
        r=item['row'];de=Q(r['delta']);E=list(map(Q,r['E']));b=list(map(Q,r['b']))
        vr.append([Q(r['ell']),Q(r['beta']),E[0]-Q(149,200)+2*de*(1+b[0]),
                   E[1]+de*b[1],E[2]+de*b[2],E[3],E[4],E[5]])
    vr=[sum(Q(r['weight'])*a[k] for r,a in zip(d['rows'],vr)) for k in range(8)]
    _,_,kk,h1,h2,c1,c2,c3=vr;det=c1*c3-c2*c2
    assert det>0 and c1>0 and vr[:2]==[ell,beta]
    assert price==kk-(c3*h1*h1-2*c2*h1*h2+c1*h2*h2)/det
    phi=sum(Q(r['weight'])*sum(w*table(r['row'],Q(r['row']['delta'])*tau*v) for v,w in atoms) for r in d['rows'])
    score=t*t-2*ell*t+2*beta*beta/Q(149,200)+phi-price*tau*tau+Q(1,10**11)
    target=Q(d['comparison_target'])
    assert score>target
    return {'score':str(score),'score_float':float(score),'target':str(target),
            'strict_excess':str(score-target),'cuts':len(d['cuts']),'atoms':len(atoms),
            'sixth_moment':str(moment(6)),'sixth_slack':str(m6-moment(6)),
            'minimum_cut_slack':str(minimum[0]),'minimum_cut':minimum[1]}


if __name__=='__main__':
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('certificate',type=Path)
    a=ap.parse_args();r=verify(json.loads(a.certificate.read_text()))
    print('PASS exact finite table-and-cut countermodel',json.dumps(r,sort_keys=True))

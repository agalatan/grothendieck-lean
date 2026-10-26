#!/usr/bin/env python3
"""Replay a localized S-lemma node and transport every piece to ONE scalar test.

All integration enclosures and final acceptance arithmetic are exact integer or
Fraction operations. Floats propose positive cell prices and a scalar test only.
The archived moment tables are inherited unless separately authenticated by
check_moments.py; their hashes and every integration dependency are recorded.
"""
import argparse
from fractions import Fraction as F
import hashlib
import json
import math
from pathlib import Path
import sys
import time

sys.path.insert(0,str(Path(__file__).resolve().parent))
from rankone_analytic_transport import (dot,mv,old_cap,qeval,ceil_grid,row_geometry,sha)


def propose_scalar(pieces,r):
    """Finite float proposal; final accepted value is re-evaluated exactly."""
    x=float(r)
    data=[(float(p['alpha']),float(p['b0'])+x*float(p['b1']),
           float(p['q'][0])+x*float(p['q'][1])+x*x*float(p['q'][2])) for p in pieces]
    candidates=[0.0]+[b/a for a,b,c in data if a>0]
    for i,(a,b,c) in enumerate(data):
        for aa,bb,cc in data[i+1:]:
            A,B,C=a-aa,-2*(b-bb),c-cc
            if abs(A)<1e-14:
                if abs(B)>1e-14:candidates.append(-C/B)
            else:
                disc=B*B-4*A*C
                if disc>=0:
                    candidates.extend([(-B-math.sqrt(disc))/(2*A),(-B+math.sqrt(disc))/(2*A)])
    f=min(candidates,key=lambda f:max(a*f*f-2*b*f+c for a,b,c in data))
    return F(round(f*10**9),10**9)


def finite_transport(X,Q,Cu,hu,Hu,cons,A,v,d,c):
    n=len(Q)
    assert n==len(hu)==len(A)==len(v)==12
    K=[[Q[i][j]-Hu[i][j] for j in range(n)] for i in range(n)]
    w0=[F(0)]*n
    cst=F(0)
    for direction,lo,hi,lam,mu in cons:
        assert lam>=0 and mu>=0 and (hi is not None or lam==0)
        for i in range(n):
            for j in range(n):K[i][j]+=lam*direction[i]*direction[j]
        coeff=(lam*(lo+hi) if lam else F(0))+mu
        for i in range(n):w0[i]+=coeff*direction[i]/2
        cst-=(lam*lo*hi if lam else F(0))+mu*lo
    factor=X.ldl(K)
    assert factor is not None,'S-lemma matrix not positive definite'
    L,piv=factor
    l0=[a+b for a,b in zip(hu,w0)]
    HA,HV=mv(Hu,A),mv(Hu,v)
    x0=X.solve_ldl(L,piv,l0)
    xA=X.solve_ldl(L,piv,HA)
    xV=X.solve_ldl(L,piv,HV)
    q=[Cu+cst+dot(l0,x0),2*dot(hu,A)+2*dot(l0,xA),dot(A,HA)+dot(HA,xA)]
    b0=dot(hu,v)+dot(l0,xV)
    b1=dot(A,HV)+dot(HA,xV)-c
    alpha=d+dot(v,HV)+dot(HV,xV)
    # Check the translated Schur formula directly for varied source and test.
    for r,f in [(F(0),F(0)),(F(-1),F(2)),(F(1,2),F(-3,100)),(F(1),F(1))]:
        shift=[r*a-f*b for a,b in zip(A,v)]
        force=[x+y for x,y in zip(l0,mv(Hu,shift))]
        direct=Cu+cst+2*dot(hu,shift)+dot(shift,mv(Hu,shift))+dot(force,X.solve_ldl(L,piv,force))+d*f*f+2*c*r*f
        assert direct==qeval(q,r)-2*(b0+b1*r)*f+alpha*f*f
    return dict(q=q,b0=b0,b1=b1,alpha=alpha,minimum_LDL_pivot=min(piv))


def stringify(p):
    return {k:[str(x) for x in v] if isinstance(v,list) else str(v) for k,v in p.items()}


def main():
    if not __debug__:
        raise SystemExit('Reject -O/-OO: exact acceptance requires assertions')
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
    ap.add_argument('--row',default='0.85',choices=['0.84','0.845','0.85','0.855'])
    ap.add_argument('--source-s',default='53/200')
    ap.add_argument('--r',default='1/2')
    ap.add_argument('--f',help='freeze a chosen rational scalar instead of minimax proposal')
    ap.add_argument('--recipe',type=Path)
    ap.add_argument('--out',type=Path,required=True)
    args=ap.parse_args()
    repo=args.repo
    toolsdir=repo/'handoff/lower-stein/cert-0745e/tools'
    sys.path.insert(0,str(toolsdir))
    import exactint as X
    import replay_midcaps_exact as R
    sourcepath=repo/f'handoff/lower-stein/cert-0745e/row_{args.row}.json'
    source=json.loads(sourcepath.read_text())
    recipepath=args.recipe or repo/f'handoff/lower-stein/cert-0745d/midcaps/mc_a_{args.row}.json'
    recipes=json.loads(recipepath.read_text())
    assert recipes['t']==args.row
    indices=[i for i,nd in enumerate(recipes['nodes']) if F(nd['s'])==F(args.source_s)]
    assert len(indices)==1,'source node must exist in recipe'
    ni=indices[0]
    node=recipes['nodes'][ni]
    assert R.coverage(node),'Incomplete original piece coverage'
    th=list(map(F,source['theta']))
    eps=F(source['eps'])
    name={'0.84':'m12','0.845':'m13','0.85':'m14','0.855':'m15'}[args.row]
    discpath=repo/f'handoff/research-third-decimal/attack-20261022/step22_mix_{name}.json'
    disc=json.loads(discpath.read_text())
    w=[F(str(x)) for x in disc['res']['cone']['w']]
    A,v,d,c,L10min=row_geometry(th,eps,w)
    A+= [F(0)]*9
    v+= [F(0)]*9
    setups={}
    momentfiles={}
    pieces=[]
    started=time.monotonic()
    for pi,piece in enumerate(node['pieces']):
        nq=piece.get('nq',recipes['NQ'])
        if nq not in setups:
            mompath=toolsdir/f'moments_1600_{nq}.json'
            setups[nq]=X.ExactSetup(source,json.loads(mompath.read_text()))
            momentfiles[str(nq)]=dict(path=str(mompath.relative_to(repo)),sha256=sha(mompath))
        S=setups[nq]
        start=time.monotonic()
        PA,PB=S.prices([R.pf(x) for x in piece['anchor']],
            [[R.pf(x) for x in f] for f in piece['var']],float(F(piece.get('scale','1'))))
        C,h,H=S.integrate(PA,PB)
        Cu,hu,Hu,rho=X.upper(C,h,H)
        cons=R.cons_of(node,piece)
        got=finite_transport(X,S.Q,Cu,hu,Hu,cons,A,v,d,c)
        original=X.piece_quadratic_multi(S.Q,S.a,Cu,hu,Hu,cons)
        assert original is not None
        # Original source formula at f=0 must agree after s=delta*r.
        assert got['q']==[original[0],th[9]*original[1],th[9]**2*original[2]]
        pieces.append(got)
        print('PASS exact localized transport',args.row,'source-s',args.source_s,
              'piece',pi+1,'/',len(node['pieces']),'seconds',round(time.monotonic()-start,2),flush=True)
    r=F(args.r)
    f=F(args.f) if args.f is not None else propose_scalar(pieces,r)
    values=[qeval(p['q'],r)-2*(p['b0']+p['b1']*r)*f+p['alpha']*f*f for p in pieces]
    worst=max(range(len(values)),key=values.__getitem__)
    cap=ceil_grid(values[worst])
    old=old_cap(source,r)
    old_piece_cap=max(qeval(p['q'],F(args.source_s)/th[9]) for p in pieces)
    assert old_piece_cap<=F(node['cap']),'Replayed original node fails its original cap'
    report=dict(version='rankone-localized-transport-v1',scope=__doc__,row=args.row,
        physical_r=str(r),source_s_at_target=str(th[9]*r),recipe_source_s=args.source_s,
        scalar_f=str(f),cap=str(cap),old_effective_cap=str(old),saving=str(old-cap),
        saving_float=float(old-cap),cap_float=float(cap),worst_piece=worst,
        original_recipe_cap_rechecked=True,piece_coverage_rechecked=True,
        source_row=str(sourcepath.relative_to(repo)),source_row_sha256=sha(sourcepath),
        recipe=str(recipepath.relative_to(repo)),recipe_sha256=sha(recipepath),recipe_node_index=ni,
        moments=momentfiles,dependencies={p.name:sha(p) for p in [toolsdir/'exactint.py',toolsdir/'replay_midcaps_exact.py']},
        w=list(map(str,w)),d=str(d),c=str(c),semiconvex_coefficient=str(c*c/d),
        minimum_L10_principal_minor=str(L10min),
        interpretation='Each piece bound is q(r)-2(b0+b1*r)*f+alpha*f^2. One scalar f is used for every piece before taking the maximum.',
        pieces=[dict(piece=i,**stringify(p)) for i,p in enumerate(pieces)],
        piece_values_at_target=list(map(str,values)),seconds=round(time.monotonic()-started,3),
        remaining_hypotheses=['Polar moment tables retain inherited status until check_moments.py is replayed.',
            'Scalar anchored-pair inequality, polar integral identities and symmetry reduction are paper proofs.',
            'No complete law cover or endpoint bound is asserted.'])
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(report,indent=2)+'\n')
    print('PASS localized fixed-test cap',args.row,'r',r,'f',f,'cap',float(cap),'saving',float(old-cap),flush=True)


if __name__=='__main__':
    main()

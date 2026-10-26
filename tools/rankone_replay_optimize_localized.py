#!/usr/bin/env python3
"""Choose and exactly evaluate ONE rational f for all regenerated local pieces.

Candidate selection uses Decimal root approximations. Acceptance is an exact
rational evaluation of the maximum over every piece, so no root approximation
is a proof input. No global optimality assertion or whole-cover assertion.
"""
import argparse
from decimal import Decimal, localcontext
from fractions import Fraction as F
import hashlib
import json
from pathlib import Path
import sys

REPO=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(Path(__file__).resolve().parent))
from rankone_source_paths import resolve_archived_handoff_path
sys.path.insert(0,str(REPO/'handoff/lower-stein/cert-0745d/tools'))


def readmat(x):
    return [[F(v) for v in row]for row in x]


def evalq(q,x):
    return q[0]+x*q[1]+x*x*q[2]


def dec(x):
    return Decimal(x.numerator)/Decimal(x.denominator)


def main():
    if not __debug__:raise SystemExit('Reject -O/-OO')
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('source',type=Path)
    ap.add_argument('--out',required=True,type=Path)
    args=ap.parse_args()
    import exactint as X
    from replay_midcaps_exact import cons_of, coverage
    d=json.loads(args.source.read_text());assert d['status']=='PASS'
    rp=resolve_archived_handoff_path(d['source_recipe'],REPO)
    rowp=resolve_archived_handoff_path(d['row'],REPO)
    assert hashlib.sha256(rp.read_bytes()).hexdigest()==d['source_sha256']
    assert hashlib.sha256(rowp.read_bytes()).hexdigest()==d['row_sha256']
    nd=json.loads(rp.read_text())['nodes'][d['node_index']];assert coverage(nd)
    row=json.loads(rowp.read_text());th=list(map(F,row['theta']));eps=F(row['eps'])
    E=[[th[0],th[1],th[2]],[th[1],th[3],th[4]],[th[2],th[4],th[5]]]
    R=[[th[6],th[7]],[th[7],th[8]]]
    M=[[F(0)]*12 for _ in range(12)]
    for off in (0,3):
        for i in range(3):
            for j in range(3):M[off+i][off+j]=E[i][j]
    for off in (6,8):
        for i in range(2):
            for j in range(2):M[off+i][off+j]=R[i][j]
    M[10][10]=M[11][11]=eps
    Q=X.inv(M);a=[1+th[10],th[11],th[12]]+[F(0)]*9
    s=F(d['source_s']);r=F(d['physical_r']);v=list(map(F,d['v']));costd=F(d['d']);c=F(d['c'])
    pieces=[]
    for p,rec in zip(nd['pieces'],d['pieces']):
        Cu=F(rec['C_upper']);hu=list(map(F,rec['h_rational']));Hu=readmat(rec['H_upper']);cons=cons_of(nd,p)
        def at(f):
            ae=[a[i]-(v[i]*f/s if i<3 else 0)for i in range(12)]
            q=X.piece_quadratic_multi(Q,ae,Cu,hu,Hu,cons);assert q is not None
            return evalq(q,s)+costd*f*f+2*c*r*f
        gamma=at(F(0));plus=at(F(1));minus=at(F(-1));beta=(plus-minus)/2;alpha=(plus+minus)/2-gamma
        assert alpha>0
        coefficients=[gamma,beta,alpha]
        assert gamma==F(rec['old_cap'])
        assert evalq(coefficients,F(d['common_f']))==F(rec['shifted_cap'])
        pieces.append(coefficients)
    candidates={F(0),F(d['common_f'])}
    # Keep the accepted common shift on a compact exact rational grid.
    candidates.update(F(round((-q[1]/(2*q[2]))*10**12),10**12)for q in pieces)
    with localcontext() as ctx:
        ctx.prec=90
        for i,p in enumerate(pieces):
            for q in pieces[i+1:]:
                C,B,A=[x-y for x,y in zip(p,q)]
                if A==0:
                    if B:candidates.add(F(round((-C/B)*10**12),10**12))
                    continue
                disc=B*B-4*A*C
                if disc<0:continue
                root=dec(disc).sqrt()
                for sign in (-1,1):
                    x=(-dec(B)+sign*root)/(2*dec(A))
                    candidates.add(F(round(x*10**12),10**12))
    ranked=sorted((max(evalq(p,f)for p in pieces),f)for f in candidates)
    best,f=ranked[0];old=max(p[0]for p in pieces)
    perpiece=[evalq(p,f)for p in pieces]
    report=dict(status='PASS',source=str(args.source.resolve()),source_sha256=hashlib.sha256(args.source.read_bytes()).hexdigest(),
                common_f=str(f),piece_count=len(pieces),all_piece_f_equal=True,
                candidate_count=len(candidates),old_max=str(old),new_max=str(best),
                rounded_new_cap=str(F(-((-best.numerator*10**12)//best.denominator),10**12)),
                exact_gain=str(old-best),improvement=best<old,
                piece_polynomials=[[str(x)for x in p]for p in pieces],
                piece_caps_at_common_f=list(map(str,perpiece)),
                float_summary=dict(common_f=float(f),old_max=float(old),new_max=float(best),gain=float(old-best)),
                scope=__doc__)
    args.out.parent.mkdir(parents=True,exist_ok=True);args.out.write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report['float_summary'],indent=2));print('PASS exact all-piece maximum at one common rational f')


if __name__=='__main__':main()

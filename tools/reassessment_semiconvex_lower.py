#!/usr/bin/env python3
"""Exact rank-one cone checks and semiconvex-chord coefficient ledger.

Standard-library rational arithmetic only. Reconstructs the nine archived
Step-22 choices from exact current row profiles. The test vectors are exact
decimal rationals as stored in the discovery JSON; acceptance uses all principal
minors, not rounded eigenvalues. No Gaussian integral or whole cover is checked.
"""
import argparse
import hashlib
import json
from fractions import Fraction as F
from itertools import combinations,product
from pathlib import Path


def dot(a,b):
    return sum((x*y for x,y in zip(a,b)),F(0))


def mv(A,x):
    return [dot(r,x) for r in A]


def det(A):
    if not A:return F(1)
    if len(A)==1:return A[0][0]
    return sum(((-1)**j*A[0][j]*det([r[:j]+r[j+1:] for r in A[1:]])
                for j in range(len(A))),F(0))


def psd_minors(A):
    ans=[]
    for n in range(1,len(A)+1):
        for ids in combinations(range(len(A)),n):
            v=det([[A[i][j] for j in ids] for i in ids])
            assert v>=0,('non-PSD principal minor',ids,str(v))
            ans.append(v)
    return min(ans)


def main():
    if not __debug__:
        raise SystemExit('Reject -O/-OO: exact acceptance assertions must be enabled')
    ap=argparse.ArgumentParser()
    ap.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
    ap.add_argument('--out',type=Path)
    args=ap.parse_args()
    repo=args.repo
    source=repo/'outputs/binding-audit-20261023/row-profiles.json'
    rows=json.loads(source.read_text())
    eps=F(149,200)
    results=[]
    for name in ['m12','m13','m14','m15','m16','m1213','m1314','m1415','m1415h']:
        oldpath=repo/f'handoff/research-third-decimal/attack-20261022/step22_mix_{name}.json'
        old=json.loads(oldpath.read_text())
        weights={int(k):F(str(v)) for k,v in old['wd'].items()}
        assert sum(weights.values())==1
        theta={i:[F(x) for x in rows[i]['theta']] for i in weights}
        th=[sum((wt*theta[i][j] for i,wt in weights.items()),F(0)) for j in range(15)]
        # Average TRUE-scale coupling vectors; A(average theta) is different.
        coup=[sum((wt*theta[i][9]*((F(1) if j==0 else F(0))+theta[i][10+j])
                   for i,wt in weights.items()),F(0)) for j in range(3)]
        E=[[th[0],th[1],th[2]],[th[1],th[3],th[4]],[th[2],th[4],th[5]]]
        w=[F(str(x)) for x in old['res']['cone']['w']]
        v=mv(E,w)
        d=dot(w,v)
        assert d>0
        S=[[E[i][j]-(F(-1) if i==0 else eps) if i==j else E[i][j]
            for j in range(3)] for i in range(3)]
        L10=[S[i]+[-v[i]] for i in range(3)]+[[-x for x in v]+[d]]
        minimum=psd_minors(L10)
        C=[r[1:] for r in E[1:]]
        cd=det(C)
        assert C[0][0]>0 and cd>0
        h=[E[j][0]+coup[j] for j in [1,2]]
        Cinvv=[(C[1][1]*v[1]-C[0][1]*v[2])/cd,
               (-C[1][0]*v[1]+C[0][0]*v[2])/cd]
        c=v[0]-dot(h,Cinvv)
        semi=c*c/d
        assert semi<=F(207,1000)
        results.append({'name':name,'weights':{str(k):str(x) for k,x in weights.items()},
            'w':list(map(str,w)),'d':str(d),'c':str(c),'c_squared_over_d':str(semi),
            'c_squared_over_d_float':float(semi),
            'L10_minimum_principal_minor':str(minimum),
            'source_sha256':hashlib.sha256(oldpath.read_bytes()).hexdigest()})
        print(name,'L10 PSD PASS; c^2/d =',format(float(semi),'.12g'))
    # The only nonconvex term has an exact completed-square chord identity.
    count=0
    for a,b,t,x,y,c,d in product([F(0),F(1,3)], [F(1),F(2)],
            [F(0),F(1,4),F(1,2),F(1)], [F(-2),F(1)], [F(-1),F(3)],
            [F(-2,3),F(1,5)], [F(1,4),F(2)]):
        s=t*a+(1-t)*b
        z=t*x+(1-t)*y
        q=lambda u,v:d*v*v+2*c*u*v
        lhs=t*q(a,x)+(1-t)*q(b,y)-q(s,z)
        rhs=t*(1-t)*(d*((x-y)+(c/d)*(a-b))**2-(c*c/d)*(a-b)**2)
        assert lhs==rhs
        count+=1
    # Worst interpolation price, EU=1, at a rational mesh width 1/500.
    mesh=F(1,500)
    price=F(207,1000)*mesh*mesh/4
    assert price==F(207,1000000000)
    # Sharpness/negative test: Psi=0, c=d=207/1000 gives g(r)=-A r².
    # A plain chord and any smaller universal coefficient fail at the midpoint.
    A=F(207,1000)
    g=lambda r:-A*r*r
    at,bt,mid=F(0),F(1),F(1,2)
    plain=(g(at)+g(bt))/2
    assert g(mid)>plain
    assert g(mid)==plain+A/4
    assert g(mid)>plain+F(206,1000)/4
    output={'scope':__doc__,'epsilon':str(eps),'source_rows_sha256':
        hashlib.sha256(source.read_bytes()).hexdigest(),
        'semiconvex_universal_table_bound':'207/1000',
        'tau_mesh_width':str(mesh),'maximum_chord_allowance':str(price),
        'exact_identity_fixtures':count,
        'negative_tests':'PASS: plain convex chord and coefficient 206/1000 rejected by sharp toy',
        'results':results}
    if args.out:
        args.out.parent.mkdir(parents=True,exist_ok=True)
        args.out.write_text(json.dumps(output,indent=2)+'\n')
    print('PASS',count,'exact chord identities; width 1/500 costs at most',str(price))
    print('No Gaussian integration, new node majorant, complete cover, or endpoint asserted.')


if __name__=='__main__':
    main()

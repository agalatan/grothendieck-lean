"""Exact acceptance of a finite spectral/Stein certificate on [0,infinity)."""
from pathlib import Path
from fractions import Fraction as Q
from bisect import bisect_right
import json
from exact import *

ROOT=Path(__file__).resolve().parent
C=Q(4045313,100000);p=Q(2500,1891)

def load_caps():
    data=json.loads((ROOT/'profile-caps.json').read_text())
    caps=[(Q(d['interval'][0]),Q(d['interval'][1]),list(map(Q,d['coefficients']))) for d in data['cells']]
    caps.append((caps[-1][1],None,list(map(Q,data['tail']))))
    return caps

def check_node(row,caps,depth=18):
    v=Q(row['v']);knots=list(map(Q,row['knots']));values=list(map(Q,row['phi']))
    beta,t,lam,mu,nu=map(Q,[row[k] for k in ['beta','t','lam','mu','nu']])
    assert lam>0 and mu>0 and nu>=0 and knots[0]==0
    assert len(knots)==len(values) and all(a<b for a,b in zip(knots,knots[1:]))
    P=list(map(Q,row['coefficients']));assert len(P)==4 and P[3]>=0
    pieces=test_pieces(knots,values)
    starts=[c[0]/v for c in caps]
    tail=Q(128)
    assert tail>max(knots[-1],starts[-1])
    pts=sorted(set(knots+starts+[tail]))
    for a,b in zip(pts,pts[1:]):
        j=bisect_right(knots,a)-1;k=bisect_right(starts,a)-1
        _,_,A,B,e=pieces[j]
        cap=[c*v**i for i,c in enumerate(caps[k][2])]
        R=add(shift(add(P,scale(cap,-1)),2),scale(cut_numerator(A,B,e,beta,t,lam,mu,nu),-1))
        if a==0:
            assert R[0]==R[1]==0
            R=R[2:]
        if not positive(R,a,b,depth):return False,('finite',str(a),str(b))
    _,_,A,B,e=pieces[-1];cap=[c*v**i for i,c in enumerate(caps[-1][2])]
    R=add(shift(add(P,scale(cap,-1)),2),scale(cut_numerator(A,B,e,beta,t,lam,mu,nu),-1))
    if not tail_positive(R,tail):return False,('tail',)
    # J(x)=P0+P1+2P2+6P3+(P2+9P3)x^2+C P3 x^3-pv.
    # Its maximum on 0<=x<=1/5 is at an endpoint.
    upper=max(P[0]+P[1]+P[2]*(2+x*x)+P[3]*(6+9*x*x+C*x**3)-p*v for x in [Q(0),Q(1,5)])
    return True,upper

def verify():
    caps=load_caps();rows=json.loads((ROOT/'stein-nodes.json').read_text())
    assert len(rows)==45
    uppers=[]
    for i,row in enumerate(rows):
        assert Q(row['v'])==Q(7,200)+Q(i,4000)
        ok,result=check_node(row,caps)
        assert ok,(i,result)
        uppers.append(result)
    # |h''|<3: the explicit density calculation is in PROOF.md.
    a=Q(699,1250);b=Q(179,1250)
    assert (a**-3+4*b*a**-4)/4<3
    interpolation=Q(3)*Q(51,25)*Q(1,4000)**2/8
    upper=max(uppers)+interpolation
    print('[C] 45 Stein nodes: every finite interval, zero and the entire tail PASS',flush=True)
    print('[C] Variance interpolation allowance:',interpolation,flush=True)
    print('[C] Central rectangle upper:',upper,flush=True)
    assert upper<Q(1373953883,10**9)
    return upper

if __name__=='__main__':verify()

"""Recompute all NEW numerical inputs. Standard library + python-flint only.

The inherited sixth-moment theorem with C=4045313/100000 is a mathematical
input from the supplied extract, not a theorem re-proved by this script.
Run without -O: python verify.py. No optimizer or cached integral is trusted.
"""
from fractions import Fraction as Q
from pathlib import Path
from functools import lru_cache
import json,runpy,sys,time
from flint import arb,ctx
from profile import evaluate
from exact import bernstein
from check_stein import verify as verify_stein

if not __debug__:raise RuntimeError('Assertions must be enabled; do not use -O.')
ctx.prec=100
ROOT=Path(__file__).resolve().parent
C=Q(4045313,100000);p=Q(2500,1891);TARGET=Q(1373953883,10**9)
SLOW=Q('1.3739535256614')
def ball(q):
    q=Q(q);return arb(q.numerator)/q.denominator
@lru_cache(None)
def val(q):return evaluate(ball(q))
def check_hermite(nodes,coefficients):
    a,b=map(Q,nodes);assert 0<a<b
    aa=ball(a);d=ball(b-a);fl,dl=val(a);fr,dr=val(b)
    c2=(3*(fr-fl)-d*(2*dl+dr))/d**2
    c3=(d*(dl+dr)-2*(fr-fl))/d**3
    H=[fl-aa*dl+aa*aa*c2-aa**3*c3,dl-2*aa*c2+3*aa*aa*c3,c2-3*aa*c3,c3]
    P=list(map(Q,coefficients));assert len(P)==4 and P[3]>0
    assert all(ball(pc)>hc for pc,hc in zip(P,H))
    return P

def profile_caps():
    data=json.loads((ROOT/'profile-caps.json').read_text());last=Q(0)
    for i,d in enumerate(data['cells']):
        a,b=map(Q,d['interval']);assert a==last and b>a
        check_hermite(d['nodes'],d['coefficients']);last=b
    assert last==2
    f,d=val(last);c0,c1=map(Q,data['tail'])
    assert ball(c0)>f-ball(last)*d and ball(c1)>d
    print('[C] Recomputed',len(data['cells']),'profile Hermite caps and the infinite tangent cap: PASS',flush=True)

def outer_cover():
    rows=json.loads((ROOT/'moment-boxes.json').read_text())
    boxes=[list(map(Q,z['box'])) for z in rows]
    central=[Q(7,200),Q(23,500),Q(0),Q(1,5)]
    allboxes=boxes+[central];area=Q(0)
    for i,(a,b,c,d) in enumerate(allboxes):
        assert 0<=a<b<=Q(3,20) and 0<=c<d<=Q(31,4)
        area+=(b-a)*(d-c)
        for A,B,C0,D in allboxes[:i]:
            assert max(a,A)>=min(b,B) or max(c,C0)>=min(d,D)
    assert area==Q(93,80)
    assert Q(31,4)**2>60
    worst=Q(0)
    for i,(row,(a,b,c,d)) in enumerate(zip(rows,boxes)):
        P=check_hermite(row['nodes'],row['coefficients'])
        upper=max(max(bernstein([P[0],P[1]-p,P[2]*(2+x*x),P[3]*(6+9*x*x+C*x**3)],a,b)) for x in [c,d])
        assert upper<TARGET,(i,upper)
        worst=max(worst,upper)
        if i%25==0:print('[C] Outer rectangles checked:',i+1,flush=True)
    print('[C] Exact cover:',len(rows),'outer rectangles plus the Stein rectangle: PASS',flush=True)
    print('[C] Outer-cover upper:',worst,flush=True)
    return worst

def endpoints():
    v=Q(3,20);f,d=val(v)
    assert f-ball(p*v)<ball(TARGET) and d<ball(p)
    assert arb(387)*arb.pi().sqrt()/500<ball(TARGET)
    print('[C] Zero variance and every variance >= 3/20: PASS',flush=True)

if __name__=='__main__':
    start=time.monotonic()
    profile_caps();central=verify_stein();outer=outer_cover();endpoints()
    print('[C] Recomputing the inherited Gaussian benchmark enclosure...',flush=True)
    runpy.run_path(str(ROOT/'benchmark.py'),run_name='__main__')
    assert TARGET<SLOW+Q(9,25000000)
    print('[C] Exact comparison slack S_lower + 3.6e-7 - TARGET:',SLOW+Q(9,25000000)-TARGET,flush=True)
    print('[P,C] Lambda(q) < 1.373953883 < S + 0.00000036',flush=True)
    print('ALL NEW CERTIFICATES PASSED; inherited inputs are identified in PROOF.md.',flush=True)
    print('Elapsed seconds:',round(time.monotonic()-start,2),flush=True)

"""Exact (rational) checks of the Stein-energy identity of ADDENDUM.md (standard library only; label C).

For q in H_{2,1}(C^n), u = E|q|^2, c2 = sum_j |dbar_j q|^2, x = c2 - u, V = |q|^2, Q = q^2,
J1[a,b] = E[d_a q conj(d_b q)], I2[a,b] = E[conj(dbar_a q) dbar_b q]:
 (K1) <:y_a conj(y_b):, c2> = J1[a,b] for all a, b; hence ||P11 c2||^2 = ||J1||_HS^2
 (K2) ||P22 c2||^2 = ||I2||_HS^2, and c2 has no other nonconstant chaos components
 (K3) ||c2 - u||^2 = ||J1||_HS^2 + ||I2||_HS^2
 (K4) delta = ||P20 Q||^2 + ||P31 Q||^2 + 2 ||J1||_HS^2 + 2 ||I2||_HS^2;  so ||J1||^2 + ||I2||^2 <= delta/2
 (K5) ||P22 V||^2 = (1/2)||P20 Q||^2 + ||P31 Q||^2 + ||J1||^2 + ||I2||^2 - 4 tr(J1 I2)
Instances: random rational cubics in n = 1, 2, 3 variables; the Wick monomial; X^2 conj(Y) (equality in K4's bound);
X^2 (a conj(X) + b conj(Y)) (rank-one J1 and I2: l1 = 2u, l2 = u).
Run: python3 -I check_stein_energy_exact.py
"""
import random, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
from wick_exact import *
def check(n,f,label):
    q=wick_cubic(n,f); qb=conj(q); V=mul(q,qb); u=E(V).r; zero=(0,)*n
    if u==0: return None
    y=[{(tuple(1 if k==j else 0 for k in range(n)),zero):G(1)} for j in range(n)]
    dq=[d(q,j) for j in range(n)]; dbq=[db(q,j) for j in range(n)]
    c2=lin(*[(1,mul(dbq[j],conj(dbq[j]))) for j in range(n)]); x=lin((1,c2),(-u,const(n,1)))
    I2=[[E(mul(conj(dbq[a]),dbq[b])) for b in range(n)] for a in range(n)]
    J1=[[E(mul(dq[a],conj(dq[b]))) for b in range(n)] for a in range(n)]
    hs=lambda A: sum(A[i][j].abs2() for i in range(n) for j in range(n))
    # K1
    for a in range(n):
        for b in range(n):
            w=mul(y[a],conj(y[b]))
            if a==b: w=lin((1,w),(-1,const(n,1)))
            assert E(mul(conj(w),c2))==J1[a][b], "K1 coefficient"
    assert proj_norm2(c2,n,1,1)==hs(J1), "K1 norm"
    # K2
    assert proj_norm2(c2,n,2,2)==hs(I2), "K2"
    other=sum(proj_norm2(c2,n,p,r) for p in range(4) for r in range(4) if (p,r) not in [(0,0),(1,1),(2,2)])
    assert other==0, "K2 support"
    # K3
    x2=E(mul(x,conj(x))).r
    assert x2==hs(J1)+hs(I2), "K3"
    # K4
    Q=mul(q,q); A=proj_norm2(Q,n,2,0); B=proj_norm2(Q,n,3,1)
    delta=E(mul(V,V)).r-2*u*u
    assert delta==A+B+2*hs(J1)+2*hs(I2), "K4"
    assert 2*(hs(J1)+hs(I2))<=delta
    # K5
    tr=G()
    for i in range(n):
        for j in range(n): tr=tr+J1[i][j]*I2[j][i]
    assert tr.i==0
    assert proj_norm2(V,n,2,2)==Fr(1,2)*A+B+hs(J1)+hs(I2)-4*tr.r, "K5"
    print(f"PASS {label}: u={u}, chi={float(delta/u/u):.4f}, (||J1||^2+||I2||^2)/delta={float((hs(J1)+hs(I2))/delta):.4f}, "
          f"||P20 Q||^2/delta={float(A/delta):.4f}, ||P31 Q||^2/delta={float(B/delta):.4f}")
    return delta/u/u
def tensor(n,entries):
    f=[[[G(0) for _ in range(n)] for _ in range(n)] for _ in range(n)]
    for (a,b,c),v in entries.items():
        f[a][b][c]=G(v); f[b][a][c]=G(v)
    return f
if __name__=="__main__":
    rng=random.Random(20261117); cnt=0
    for n,trials in [(1,2),(2,5),(3,3)]:
        t=0
        while t<trials:
            if check(n,random_f(n,rng,den=5,size=3),f"random n={n} trial={t}") is None: continue
            t+=1; cnt+=1
    check(1,tensor(1,{(0,0,0):1}),"Wick monomial :X^2 conj(X):"); cnt+=1
    chi=check(2,tensor(2,{(0,0,1):1}),"X^2 conj(Y)"); cnt+=1
    assert chi==10
    for a,b in [(1,1),(1,2),(2,1),(1,3),(3,1)]:
        chi=check(2,tensor(2,{(0,0,0):a,(0,0,1):b}),f"X^2({a} conj X + {b} conj Y)"); cnt+=1
        assert 10<=chi<=42
    print(f"ALL {cnt} EXACT CHECKS PASSED")

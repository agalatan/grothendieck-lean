"""Exact (rational) verification of the algebraic identities of the note, on random cubics.

Checks, for q in H_{2,1}(C^n), u = E|q|^2, V = |q|^2, Q = q^2,
  a = sum_j d_j q * dbar_j q,  c1 = sum_j |d_j q|^2,  c2 = sum_j |dbar_j q|^2,  x = c2 - u:
 (I0)  E q conj(y_j) = 0, E c2 = u, E c1 = 2u, E a = 0
 (I1)  E|q|^4 = E[conj(q)^2 a] + 2 E[|q|^2 c2]              (Lemma 1 with G = conj(q)|q|^2)
 (I2)  a = P20(Q) + (1/2) P31(Q): ||a||^2 = ||P20 Q||^2 + ||P31 Q||^2/4, <Q,a> = ||P20Q||^2 + ||P31Q||^2/2,
       and a has no other chaos component
 (I3)  delta = ||P20 Q||^2 + ||P31 Q||^2 + 2 ||x||^2           (complex fourth-moment identity)
 (I4)  <V - c2, x> = ||P31 Q||^2 / 4
 (I5)  P11(c1+c2) = 2 P11 V, P22(c1+c2) = P22 V, P33(c1+c2) = 0   (c1+c2 = (3-N2)V)
 (I6)  delta = (2/3)||P20Q||^2 + (1/3)||P31Q||^2 + (4/3)||P11V||^2 + (2/3)||P22V||^2
 (I7)  2||c1+c2-3u||^2 + 4||a||^2 = 6 delta - ||P31Q||^2 - 2||P22V||^2   (exact trace-sensitive real Stein budget)
 (I7b) (1/2)||c1+c2-3u||^2 + 2||a||^2 = 3 delta - ||P31Q||^2/2 - 2||P11V||^2 - (3/2)||P22V||^2
       (= sum_{a,b} Var Gamma_ab, the budget of ledger 11.29)
Run: python3 -I check_identities_exact.py   (standard library only; prints PASS lines)
"""
import random, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
from wick_exact import *
def ip(P,Q): return E(mul(conj(P),Q))
def check(n,f):
    q=wick_cubic(n,f); qb=conj(q)
    u=E(mul(q,qb)); assert u.i==0; u=u.r
    for j in range(n):
        y={tuple(1 if k==j else 0 for k in range(n)),}
    zero=(0,)*n
    for j in range(n):
        yj={(tuple(1 if k==j else 0 for k in range(n)),zero):G(1)}
        assert E(mul(q,conj(yj))).iszero()
    a=lin(*[(1,mul(d(q,j),db(q,j))) for j in range(n)])
    c1=lin(*[(1,mul(d(q,j),conj(d(q,j)))) for j in range(n)])
    c2=lin(*[(1,mul(db(q,j),conj(db(q,j)))) for j in range(n)])
    assert E(c2)==G(u) and E(c1)==G(2*u) and E(a).iszero()
    V=mul(q,qb); Q=mul(q,q)
    EV2=E(mul(V,V)); assert EV2.i==0
    delta=EV2.r-2*u*u
    I1=E(mul(conj(Q),a))+2*E(mul(V,c2)); assert I1==EV2, "I1"
    q20=proj_norm2(Q,n,2,0); q31=proj_norm2(Q,n,3,1)
    na=ip(a,a).r
    assert na==q20+q31/4, "I2a"
    assert ip(Q,a)==G(q20+q31/2), "I2b"
    assert proj_norm2(a,n,2,0)+proj_norm2(a,n,3,1)==na, "I2c"
    x=lin((1,c2),(-u,const(n,1)))
    nx=ip(x,x).r
    assert delta==q20+q31+2*nx, "I3"
    assert ip(lin((1,V),(-1,c2)),x)==G(q31/4), "I4"
    S=lin((1,c1),(1,c2))
    for (p,mult) in [(1,2),(2,1),(3,0)]:
        lhs=proj_norm2(lin((1,S),(-mult,V)),n,p,p)
        assert lhs==0, f"I5 {p}"
    v11=proj_norm2(V,n,1,1); v22=proj_norm2(V,n,2,2)
    assert delta==Fr(2,3)*q20+Fr(1,3)*q31+Fr(4,3)*v11+Fr(2,3)*v22, "I6"
    Sm=lin((1,S),(-3*u,const(n,1)))
    assert 2*ip(Sm,Sm).r+4*na==6*delta-q31-2*v22, "I7"
    assert Fr(1,2)*ip(Sm,Sm).r+2*na==3*delta-q31/2-2*v11-Fr(3,2)*v22, "I7b"
    return delta, na+2*nx, q31
if __name__=="__main__":
    rng=random.Random(20261116)
    count=0
    for n,trials in [(1,4),(2,6),(3,2)]:
        for t in range(trials):
            f=random_f(n,rng)
            delta,b,q31=check(n,f); count+=1
            print(f"PASS n={n} trial={t}: delta={float(delta):.6g}  ||a||^2+2||c2-u||^2={float(b):.6g}  (3/4)||P31 q^2||^2={float(3*q31/4):.6g}")
    print(f"ALL {count} EXACT CHECKS PASSED")

# ---------------------------------------------------------------------------------------------
# Representation identities with polynomial profiles (exact):
#  (I8) content:  E[conj(y_e) q h(V)] = E[conj(y_e) k'(V) (conj(q) a + q (c2-u))],  k = (1-u d/dv)^{-1} h,
#       for h(v) = v^m:  k(v) = E (v+u tau)^m = sum_i C(m,i) i! u^i v^(m-i)
#  (I9) deficit:  E phi(u tau) - E phi(V) = -E[(c2-u) K'(V)] + E[conj(q)^2 a g'(V)],
#       K(v) = E phi(v+u tau), g(v) = (E phi(u tau) - K(v))/v,  for phi(v) = v^m
from math import comb, factorial as fact
def poly_of_V(coeffs,V,n):
    """sum_i coeffs[i] V^i as a polynomial (coeffs Fractions)."""
    out={}; P=const(n,1)
    for i,c in enumerate(coeffs):
        if c!=0: out=lin((1,out),(c,P))
        P=mul(P,V)
    return out
def deriv(coeffs): return [i*c for i,c in enumerate(coeffs)][1:] or [Fr(0)]
def check_repr(n,f,ecoef):
    q=wick_cubic(n,f); qb=conj(q); u=E(mul(q,qb)).r; V=mul(q,qb)
    a=lin(*[(1,mul(d(q,j),db(q,j))) for j in range(n)])
    c2=lin(*[(1,mul(db(q,j),conj(db(q,j)))) for j in range(n)])
    x=lin((1,c2),(-u,const(n,1)))
    zero=(0,)*n
    ye=lin(*[(ecoef[j],{(tuple(1 if k==j else 0 for k in range(n)),zero):G(1)}) for j in range(n)])
    yeb=conj(ye)
    Z=lin((1,mul(qb,a)),(1,mul(q,x)))          # conj(q) a + q (c2-u)
    for m in range(0,4):
        h=[Fr(0)]*m+[Fr(1)]                      # h(v)=v^m
        k=[Fr(0)]*(m+1)
        for i in range(m+1): k[m-i]+=comb(m,i)*fact(i)*Fr(u)**i
        lhs=E(mul(mul(yeb,q),poly_of_V(h,V,n)))
        rhs=E(mul(mul(yeb,poly_of_V(deriv(k),V,n)),Z))
        assert lhs==rhs, f"I8 m={m}"
    for m in range(1,4):
        K=[Fr(0)]*(m+1)
        for i in range(m+1): K[m-i]+=comb(m,i)*fact(i)*Fr(u)**i
        Ephi_g=fact(m)*Fr(u)**m                  # E (u tau)^m
        Gc=[-c for c in K]; Gc[0]+=Ephi_g        # G = E phi(u tau) - K(v), G(0)=0
        assert Gc[0]==0
        g=Gc[1:]                                 # g = G/v
        lhs=Ephi_g-E(poly_of_V([Fr(0)]*m+[Fr(1)],V,n)).r
        rhs=-E(mul(x,poly_of_V(deriv(K),V,n)))+E(mul(mul(conj(mul(q,q)),a),poly_of_V(deriv(g),V,n)))
        assert rhs==G(lhs), f"I9 m={m}"
if __name__=="__main__":
    rng=random.Random(7)
    for n,tr in [(1,2),(2,2)]:
        for t in range(tr):
            f=random_f(n,rng,den=5,size=3)
            e=[G(Fr(rng.randint(-3,3)),Fr(rng.randint(-3,3))) for _ in range(n)]
            if all(v.iszero() for v in e): e[0]=G(1)
            check_repr(n,f,e)
            print(f"PASS I8 (content representation, h=v^0..v^3) and I9 (deficit representation, phi=v^1..v^3): n={n} trial={t}")
    print("ALL REPRESENTATION CHECKS PASSED")

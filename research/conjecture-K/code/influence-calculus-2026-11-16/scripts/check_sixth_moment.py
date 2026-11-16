"""Exact check of Proposition 12 on random rational cubics: E|q|^6 >= (3/2) (E|q|^4)^2 / E|q|^2,
and of the real moment relations used in its proof (m2 = u/2, m4 = (3/8)E|q|^4, m6 = (5/16)E|q|^6 for X = Re q).
Standard library only.  Run: python3 -I check_sixth_moment.py
"""
import random, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
from wick_exact import *
def moments(n,f):
    q=wick_cubic(n,f); qb=conj(q); V=mul(q,qb); V2=mul(V,V)
    u=E(V).r; m4=E(V2).r; m6=E(mul(V2,V)).r
    # X = Re q = (q + conj q)/2
    X=lin((Fr(1,2),q),(Fr(1,2),qb)); X2=mul(X,X); X4=mul(X2,X2)
    r2=E(X2).r; r4=E(X4).r; r6=E(mul(X4,X2)).r
    assert r2==u/2 and r4==Fr(3,8)*m4 and r6==Fr(5,16)*m6
    assert r4*r4<=Fr(3,5)*r2*r6
    return u,m4,m6
if __name__=="__main__":
    rng=random.Random(12)
    one=[[[G(1)]]]                                    # q = :y y conj(y): = y(|y|^2-2), u = 2
    u,m4,m6=moments(1,one); assert (u,m4,m6)==(2,176,90816), (u,m4,m6)
    print(f"Wick monomial (u=2): E|q|^4 = {m4} = 44u^2, E|q|^6 = {m6} = 11352u^3; (3/2)(E|q|^4)^2/u = {Fr(3,2)*m4*m4/u} = 2904u^3")
    for n,trials in [(1,1),(2,5)]:
        for t in range(trials):
            f=random_f(n,rng,den=5,size=3); u,m4,m6=moments(n,f)
            lhs=m6; rhs=Fr(3,2)*m4*m4/u; assert lhs>=rhs
            chi=m4/u**2-2
            print(f"PASS n={n} trial={t}: chi={float(chi):.3f}  E|q|^6/u^3={float(m6/u**3):.2f} >= {float(rhs/u**3):.2f};  kappa6c/u^3={float(m6/u**3-6-9*chi):.2f} >= {float(Fr(3,2)*chi*(chi-2)):.2f}")
    print("ALL SIXTH-MOMENT CHECKS PASSED")

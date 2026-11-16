"""Exact (rational) verification of the identities of NOTE2.md on random cubics (standard library only).

For q in H_{2,1}(C^n), u = E|q|^2, V = |q|^2, a = sum_j d_j q dbar_j q, x = sum_j |dbar_j q|^2 - u,
a unit-free direction e (Gaussian rational), d_e = sum_j conj(e_j) d_j, dbar_e = sum_j e_j dbar_j, y_e = sum_j e_j y_j:
 (J1) Theorem 6 for h(v) = v^m, m = 0..3:
        E[conj(y_e) q V^m] = (m+1) E[d_e q * V^m] + m E[q^2 * conj(dbar_e q) * V^(m-1)]
 (J2) Theorem 7: M_ab := E[d_a dbar_b V] = I2[a,b] + J1[a,b],  I2[a,b] = E[conj(dbar_a q) dbar_b q],
        J1[a,b] = E[d_a q conj(d_b q)];  ||P11 V||^2 = sum_ab |M_ab|^2;  tr J1 = 2u, tr I2 = u
 (J3) ||J1||_HS^2 + ||I2||_HS^2 <= ||M||_HS^2  (tr(J1 I2) is real and >= 0)
 (J4) (4/3) ||M||_HS^2 <= delta      (from 6.3.21)
 (J6) Proposition 11 for psi(v) = v^m, m = 1..3, and every w = :y_a conj(y_b): (K = E psi(. + u tau) - E psi(u tau), rho = K/v):
        E[conj(w) V^m] = E[conj(q) rho(V) conj(y_a) dbar_b q] + E[conj(w) x K'(V)] + E[conj(w) conj(q)^2 a rho'(V)]
 (J5) Proposition 10 for m(v) = v^k, k = 0..2, and every w = y_a y_b:
        E[conj(w) q^2 (V^k - u k V^(k-1))] = (k+1) E[conj(w) a V^k] + k E[conj(w) q^2 V^(k-1) x]
Run: python3 -I check_influence_exact.py
"""
import random, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
from wick_exact import *
def power(P,k,n):
    out=const(n,1)
    for _ in range(k): out=mul(out,P)
    return out
def check(n,f,e):
    q=wick_cubic(n,f); qb=conj(q); u=E(mul(q,qb)).r; V=mul(q,qb); zero=(0,)*n
    y=[{(tuple(1 if k==j else 0 for k in range(n)),zero):G(1)} for j in range(n)]
    ye=lin(*[(e[j],y[j]) for j in range(n)]); yeb=conj(ye)
    dq=[d(q,j) for j in range(n)]; dbq=[db(q,j) for j in range(n)]
    deq=lin(*[(e[j].conj(),dq[j]) for j in range(n)]); dbeq=lin(*[(e[j],dbq[j]) for j in range(n)])
    a=lin(*[(1,mul(dq[j],dbq[j])) for j in range(n)])
    c2=lin(*[(1,mul(dbq[j],conj(dbq[j]))) for j in range(n)]); x=lin((1,c2),(-u,const(n,1)))
    Q=mul(q,q)
    # J1
    for m in range(4):
        lhs=E(mul(mul(yeb,q),power(V,m,n)))
        rhs=(m+1)*E(mul(deq,power(V,m,n)))
        if m>=1: rhs=rhs+m*E(mul(mul(Q,conj(dbeq)),power(V,m-1,n)))
        assert lhs==rhs, f"J1 m={m}"
    # J2
    M=[[E(db(d(V,a_),b_)) for b_ in range(n)] for a_ in range(n)]
    I2=[[E(mul(conj(dbq[a_]),dbq[b_])) for b_ in range(n)] for a_ in range(n)]
    J1=[[E(mul(dq[a_],conj(dq[b_]))) for b_ in range(n)] for a_ in range(n)]
    for a_ in range(n):
        for b_ in range(n): assert M[a_][b_]==I2[a_][b_]+J1[a_][b_], "J2 sum"
    hs=lambda A: sum(A[i][j].abs2() for i in range(n) for j in range(n))
    assert proj_norm2(V,n,1,1)==hs(M), "J2 norm"
    assert sum(J1[i][i].r for i in range(n))==2*u and sum(I2[i][i].r for i in range(n))==u
    # J3
    tr=G()
    for i in range(n):
        for j in range(n): tr=tr+J1[i][j]*I2[j][i]
    assert tr.i==0 and tr.r>=0 and hs(J1)+hs(I2)<=hs(M), "J3"
    assert hs(M)==hs(J1)+hs(I2)+2*tr.r
    # J4
    delta=E(mul(V,V)).r-2*u*u
    assert Fr(4,3)*hs(M)<=delta, "J4"
    # J5
    for a_ in range(n):
        for b_ in range(a_,n):
            wb=conj(mul(y[a_],y[b_]))
            for k in range(3):
                lhs=E(mul(mul(wb,Q),power(V,k,n)))
                if k>=1: lhs=lhs-u*k*E(mul(mul(wb,Q),power(V,k-1,n)))
                rhs=(k+1)*E(mul(mul(wb,a),power(V,k,n)))
                if k>=1: rhs=rhs+k*E(mul(mul(mul(wb,Q),power(V,k-1,n)),x))
                assert lhs==rhs, f"J5 k={k}"
    # J6
    from math import comb, factorial as fact
    def polyV(coeffs):
        out={}
        for i,c in enumerate(coeffs):
            if c!=0: out=lin((1,out),(c,power(V,i,n)))
        return out
    qb2=mul(qb,qb)
    for a_ in range(n):
        for b_ in range(n):
            w=mul(y[a_],conj(y[b_]))
            if a_==b_: w=lin((1,w),(-1,const(n,1)))
            wb=conj(w)
            for m in range(1,4):
                K=[Fr(0)]*(m+1)
                for i in range(m+1): K[m-i]+=comb(m,i)*fact(i)*Fr(u)**i
                K[0]=Fr(0)                                # subtract E psi(u tau)
                rho=K[1:]; Kp=[i*c for i,c in enumerate(K)][1:]; rhop=[i*c for i,c in enumerate(rho)][1:] or [Fr(0)]
                lhs=E(mul(wb,power(V,m,n)))
                rhs=E(mul(mul(mul(qb,polyV(rho)),conj(y[a_])),dbq[b_]))+E(mul(mul(wb,x),polyV(Kp)))+E(mul(mul(mul(wb,qb2),a),polyV(rhop)))
                assert lhs==rhs, f"J6 m={m}"
    return float(hs(M)/delta), float((hs(J1)+hs(I2))/hs(M))
if __name__=="__main__":
    rng=random.Random(20261116)
    cnt=0
    for n,trials in [(1,2),(2,4),(3,2)]:
        for t in range(trials):
            f=random_f(n,rng,den=5,size=3)
            e=[G(Fr(rng.randint(-3,3)),Fr(rng.randint(-3,3))) for _ in range(n)]
            if all(v.iszero() for v in e): e[0]=G(1)
            r=check(n,f,e); cnt+=1
            print(f"PASS n={n} trial={t}: J1-J6 hold exactly; ||P11 V||^2/delta = {r[0]:.4f} (<= 0.75), (||J1||^2+||I2||^2)/||M||^2 = {r[1]:.4f}")
    print(f"ALL {cnt} EXACT CHECKS PASSED")

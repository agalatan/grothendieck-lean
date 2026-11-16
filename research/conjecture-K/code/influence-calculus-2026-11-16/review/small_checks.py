#!/usr/bin/env python3
"""Reviewer's small checks (labels: (1) exact; (2)-(5) N).
(1) Corollary 6.1 on equal independent Wick blocks :X^2 conj X: + :Y^2 conj Y: for h = v, v^2, v^3, exactly;
(2) the constant 2.734 of NOTE2 section 2;
(3) Wick monomial, tilt: T9/u^2 and H/T9 with H = min(gamma*delta, (19321/10^6)u, 1/2500)   (ledger 11.30, 11.49);
(4) the two-point laws {0, v1} with mass u/v1 at v1: the largest (sqrt2 sA + sB)^2/u, against W0 of own_lawlevel.py;
(5) the plain Bessel bound Bz = E[V h^2] - (E[V h])^2/u against T9 on the Wick monomial law and on the Gaussian law.
usage: small_checks.py <review-dir>      (needs tab_reviewer.npz written by own_numerics.py)
"""
import sys, os, math
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
import exact_wickbasis as E
from own_numerics import Prof, R1, W1, law_functionals, GAMMA, Bbench, S2

def main():
    out = sys.argv[1]
    A = E.W(2); f = {(0, 0, 0): 1, (1, 1, 1): 1}
    q = E.cubic(A, f); qb = A.conj(q); V = A.mul(q, qb); Q = A.mul(q, q); u = A.n2(q)
    Vp = [A.const(1), V, A.mul(V, V)]; Vp.append(A.mul(Vp[2], V)); y = [A.y(j) for j in range(2)]
    print("(1) q = :X^2 conj X: + :Y^2 conj Y:  (u = %d); lam1 = 2u/2 = %d, lam2 = u/2 = %d" % (u, u, u // 2))
    for m in (1, 2, 3):
        psi = A.lin((m + 1, Vp[m])); Ah = A.proj(psi, 1, 1); Bh = A.proj(A.lin((m, A.mul(Q, Vp[m - 1]))), 2, 0)
        c = [A.EP(A.mul(A.mul(A.conj(y[j]), q), Vp[m - 1]), V) for j in range(2)]
        c2 = sum(E.cabs2(z) for z in c); nA = A.n2(Ah); nB = A.n2(Bh)
        off = Ah.get((1, 0, 0, 1), (0, 0)); diag = Ah.get((1, 0, 1, 0), (0, 0))
        b = (math.sqrt(u * nA) + math.sqrt(u / 2 * nB)) ** 2
        print(f"    h = v^{m}: |c|^2 = {c2}; A_h: coefficient of :X conj X: = {diag[0]}, of :X conj Y: = {off[0]}; ||A_h||^2 = {nA}, ||B_h||^2 = {nB}; (Cor 6.1)^2/|c|^2 - 1 = {b/c2 - 1:.3e}")
    t = np.linspace(0, np.pi / 2, 2000001); al = math.sqrt(3) / 2 * np.cos(t); be = math.sqrt(6) / 2 * np.sin(t)
    v = al * ((2 * al) ** (4 / 3) + be ** (4 / 3)) ** 1.5
    print(f"(2) max of alpha((2 alpha)^(4/3)+beta^(4/3))^(3/2) on (4/3)alpha^2+(2/3)beta^2=1: {v.max():.4f} at t={t[v.argmax()]:.3f}  (NOTE2: 2.734);  3 sqrt15/4 = {0.75*math.sqrt(15):.4f}, 3 sqrt10/4 = {0.75*math.sqrt(10):.4f}, 3 sqrt6/4 = {0.75*math.sqrt(6):.4f}")
    P = Prof(os.path.join(out, "tab_reviewer.npz"))
    print("(3) Wick monomial, tilt 3/5:")
    for u in (0.009, 0.02, 0.03, 0.0463):
        V = u * R1 * (R1 - 2) ** 2 / 2; sA, sB, Ephi = law_functionals(P, "tilt", V, W1)
        T9 = u * (S2 * sA + sB) ** 2; dl = 42 * u * u; H = min(GAMMA[u] * dl, 19321e-6 * u, 1 / 2500); D = Bbench(P, u) - Ephi
        print(f"    u={u}: T9/u^2 = {T9/u**2:.4f}, H/u^2 = {H/u**2:.4f}, H/T9 = {H/T9:.3f}, gamma*delta/T9 = {GAMMA[u]*dl/T9:.3f}, T9/D = {T9/D:.5f}, H/D = {H/D:.5f}, D/u^2 = {D/u**2:.4f}")
    v1 = np.linspace(0.05, 3.0, 29501); h1 = P.h("tilt", v1); hp1 = P.hp("tilt", v1); psi1 = h1 + v1 * hp1
    print("(4) two-point laws {0, v1}:")
    for u in (0.009, 0.02, 0.03, 0.0463):
        p = u / v1
        val = np.where(p <= 1, (S2 * np.sqrt(p * np.maximum(1 - p, 0)) * abs(psi1) + np.sqrt(p) * abs(v1 * hp1)) ** 2 / u, -1.0); k = int(np.argmax(val))
        print(f"    u={u}: max over v1 of T9/u^2 = {val[k]:.4f} at v1 = {v1[k]:.4f} (mass {p[k]:.4f}; chi of this law {p[k]*v1[k]**2/u**2-2:.2f})")
    print("(5) plain Bessel bound against Theorem 9, in units of u^2 (and the bounds of 11.30: (19321/10^6)/u, 1/(2500u^2)):")
    for u in (0.009, 0.02, 0.03, 0.0463):
        o = []
        for name, V in (("Wick monomial law", u * R1 * (R1 - 2) ** 2 / 2), ("Gaussian law", u * R1)):
            sA, sB, Ephi = law_functionals(P, "tilt", V, W1); hv = P.h("tilt", V)
            Bz = float(np.sum(W1 * V * hv * hv) - np.sum(W1 * V * hv) ** 2 / np.sum(W1 * V)); T9 = u * (S2 * sA + sB) ** 2
            o.append(f"{name}: Bz/u^2 = {Bz/u**2:.4f}, T9/u^2 = {T9/u**2:.4f}, Bz/T9 = {Bz/T9:.2f}")
        print(f"    u={u}: " + "; ".join(o) + f";  11.30: {19321e-6/u:.4f}, {1/(2500*u*u):.4f}")

if __name__ == "__main__":
    main()

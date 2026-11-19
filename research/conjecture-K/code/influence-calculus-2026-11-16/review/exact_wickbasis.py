#!/usr/bin/env python3
"""Reviewer's independent exact check of NOTE2.md (Theorems 6-9, Propositions 10-12, and ledger 6.3.21 as used).

Method (different from the package's wick_exact.py, which works in the MONOMIAL basis y^alpha conj(y)^beta with
E = delta * alpha! and projections E[d^alpha dbar^beta F]/(alpha! beta!)):

  * every polynomial is stored in the WICK basis  :y^alpha conj(y)^beta:  (products of complex Hermite polynomials);
  * products use the contraction (product) formula, per variable,
        H_{a,b} H_{c,d} = sum_{i<=min(a,d), j<=min(b,c)} C(a,i)C(d,i) i! C(b,j)C(c,j) j!  H_{a+c-i-j, b+d-i-j};
  * expectation = the constant coefficient; chaos projection P_{p,q} = selection of the bidegree; norms and
    inner products from <:y^a cj^b:, :y^a cj^b:> = alpha! beta!;  d_j :y^a cj^b: = a_j :y^(a-e_j) cj^b: (Appell);
  * the cubic is written down directly as a Wick polynomial sum f_abc :y_a y_b conj(y_c): (no subtraction table).
  Coefficients are Gaussian integers (pairs of Python ints): every identity checked is homogeneous in q and e, so
  integer data lose no generality.  A self-test validates the product formula against monomial multiplication
  (explicit Hermite polynomials) and the moments E[y^a conj(y)^b] = delta_ab a!.

Run:  python3 -I exact_wickbasis.py
"""
import sys, time
from fractions import Fraction as Fr
from math import comb, factorial, prod, sqrt
from itertools import product as iproduct
from functools import lru_cache

# ------------------------------------------------------------------ Gaussian-integer helpers (pairs of ints)
def cmul(a, b): return (a[0] * b[0] - a[1] * b[1], a[0] * b[1] + a[1] * b[0])
def cadd(a, b): return (a[0] + b[0], a[1] + b[1])
def cconj(a): return (a[0], -a[1])
def cabs2(a): return a[0] * a[0] + a[1] * a[1]
def C(x): return x if isinstance(x, tuple) else (x, 0)
ZERO = (0, 0)

# ------------------------------------------------------------------ Wick-basis polynomials: {alpha+beta: coeff}
@lru_cache(maxsize=None)
def ctr(a, b, c, d):
    """contractions of H_{a,b} with H_{c,d} in one variable: list of (weight, a', b')."""
    out = []
    for i in range(min(a, d) + 1):
        wi = comb(a, i) * comb(d, i) * factorial(i)
        for j in range(min(b, c) + 1):
            out.append((wi * comb(b, j) * comb(c, j) * factorial(j), a + c - i - j, b + d - i - j))
    return out

class W:
    """n variables; all operations exact."""
    def __init__(s, n): s.n = n; s.z = (0,) * (2 * n)
    def clean(s, F): return {k: v for k, v in F.items() if v != ZERO}
    def const(s, c): return s.clean({s.z: C(c)})
    def y(s, j):
        k = [0] * (2 * s.n); k[j] = 1; return {tuple(k): (1, 0)}
    def lin(s, *pairs):
        R = {}
        for c, F in pairs:
            c = C(c)
            for k, v in F.items():
                R[k] = cadd(R.get(k, ZERO), cmul(c, v))
        return s.clean(R)
    def mul(s, F, G):
        n = s.n; R = {}
        for k1, c1 in F.items():
            for k2, c2 in G.items():
                c = cmul(c1, c2)
                lists = [ctr(k1[j], k1[n + j], k2[j], k2[n + j]) for j in range(n)]
                for combo in iproduct(*lists):
                    w = 1
                    for t in combo: w *= t[0]
                    key = tuple(t[1] for t in combo) + tuple(t[2] for t in combo)
                    o = R.get(key)
                    R[key] = (w * c[0], w * c[1]) if o is None else (o[0] + w * c[0], o[1] + w * c[1])
        return s.clean(R)
    def power(s, F, m):
        out = s.const(1)
        for _ in range(m): out = s.mul(out, F)
        return out
    def conj(s, F):
        n = s.n; return {k[n:] + k[:n]: cconj(v) for k, v in F.items()}
    def d(s, F, j):          # d/dy_j
        R = {}
        for k, v in F.items():
            if k[j]:
                k2 = list(k); k2[j] -= 1; R[tuple(k2)] = (v[0] * k[j], v[1] * k[j])
        return R
    def db(s, F, j):         # d/dconj(y_j)
        n = s.n; R = {}
        for k, v in F.items():
            if k[n + j]:
                k2 = list(k); k2[n + j] -= 1; R[tuple(k2)] = (v[0] * k[n + j], v[1] * k[n + j])
        return R
    def E(s, F): return F.get(s.z, ZERO)
    @staticmethod
    def kfact(k): return prod(factorial(x) for x in k)
    def EP(s, F, G):
        """E[F*G] without forming the product: sum F[a,b] G[b,a] a! b!."""
        n = s.n; tot = ZERO
        for k, v in F.items():
            t = G.get(k[n:] + k[:n])
            if t is not None:
                w = s.kfact(k); p = cmul(v, t); tot = (tot[0] + w * p[0], tot[1] + w * p[1])
        return tot
    def ip(s, F, G):         # <F, G> = E[conj(F) G]
        return s.EP(s.conj(F), G)
    def n2(s, F): return sum(cabs2(v) * s.kfact(k) for k, v in F.items())
    def proj(s, F, p, q):
        n = s.n; return {k: v for k, v in F.items() if sum(k[:n]) == p and sum(k[n:]) == q}
    def chaos(s, F, deg):    # real chaos of total degree deg
        return {k: v for k, v in F.items() if sum(k) == deg}
    def ofV(s, coeffs, Vp):
        """sum_i coeffs[i] V^i with Vp = [1, V, V^2, ...] precomputed."""
        return s.lin(*[(c, Vp[i]) for i, c in enumerate(coeffs) if c != 0]) if any(c != 0 for c in coeffs) else {}

# ------------------------------------------------------------------ self-test of the calculus
def to_mono(Wn, F):
    """Wick basis -> monomial basis with H_{a,b} = sum_k (-1)^k k! C(a,k) C(b,k) y^(a-k) cj^(b-k)."""
    n = Wn.n; R = {}
    for k, v in F.items():
        lists = [[((-1) ** t * factorial(t) * comb(k[j], t) * comb(k[n + j], t), k[j] - t, k[n + j] - t)
                  for t in range(min(k[j], k[n + j]) + 1)] for j in range(n)]
        for combo in iproduct(*lists):
            w = 1
            for t in combo: w *= t[0]
            key = tuple(t[1] for t in combo) + tuple(t[2] for t in combo)
            R[key] = cadd(R.get(key, ZERO), (w * v[0], w * v[1]))
    return {k: v for k, v in R.items() if v != ZERO}
def mono_mul(F, G):
    R = {}
    for k1, c1 in F.items():
        for k2, c2 in G.items():
            key = tuple(a + b for a, b in zip(k1, k2)); R[key] = cadd(R.get(key, ZERO), cmul(c1, c2))
    return {k: v for k, v in R.items() if v != ZERO}
def mono_E(n, F):
    tot = ZERO
    for k, v in F.items():
        if k[:n] == k[n:]:
            w = prod(factorial(x) for x in k[:n]); tot = (tot[0] + w * v[0], tot[1] + w * v[1])
    return tot
def selftest():
    import random
    rng = random.Random(7)
    # one variable, all index pairs up to 4
    A = W(1)
    for a in range(5):
        for b in range(5):
            for c in range(5):
                for d in range(5):
                    F = {(a, b): (1, 0)}; G = {(c, d): (1, 0)}
                    assert to_mono(A, A.mul(F, G)) == mono_mul(to_mono(A, F), to_mono(A, G)), (a, b, c, d)
                    assert A.E(A.mul(F, G)) == mono_E(1, mono_mul(to_mono(A, F), to_mono(A, G)))
                    assert A.E(A.mul(F, G)) == A.EP(F, G)
    # two and three variables, random polynomials
    for n in (2, 3):
        A = W(n)
        for _ in range(12):
            def rnd(terms, deg):
                F = {}
                for _ in range(terms):
                    k = [0] * (2 * n)
                    for _ in range(rng.randint(0, deg)): k[rng.randrange(2 * n)] += 1
                    F[tuple(k)] = (rng.randint(-4, 4), rng.randint(-4, 4))
                return A.clean(F)
            F, G, H = rnd(5, 3), rnd(5, 3), rnd(4, 2)
            FG = A.mul(F, G)
            assert to_mono(A, FG) == mono_mul(to_mono(A, F), to_mono(A, G))
            assert A.E(FG) == A.EP(F, G) == mono_E(n, to_mono(A, FG))
            assert A.mul(FG, H) == A.mul(F, A.mul(G, H))                       # associativity
            for j in range(n):                                                  # Leibniz and E[conj(y_j)F]=E[d_jF]
                assert A.d(FG, j) == A.lin((1, A.mul(A.d(F, j), G)), (1, A.mul(F, A.d(G, j))))
                assert A.db(FG, j) == A.lin((1, A.mul(A.db(F, j), G)), (1, A.mul(F, A.db(G, j))))
                assert A.E(A.mul(A.conj(A.y(j)), F)) == A.E(A.d(F, j))
                assert A.E(A.mul(A.y(j), F)) == A.E(A.db(F, j))
    print("self-test: product formula = monomial multiplication; E, EP, Leibniz, Gaussian IBP: OK")

# ------------------------------------------------------------------ the checks
def cubic(A, f):
    """q = sum f[(a,b,c)] :y_a y_b conj(y_c):  (keys with a <= b)."""
    n = A.n; q = {}
    for (a, b, c), v in f.items():
        k = [0] * (2 * n); k[a] += 1; k[b] += 1; k[n + c] += 1
        q[tuple(k)] = cadd(q.get(tuple(k), ZERO), C(v))
    return A.clean(q)

def real(c, what=""):
    assert c[1] == 0, f"not real: {what} {c}"
    return c[0]

def check(name, n, f, e, mmax=3, do_p10=True, do_p11=True, do_p12=True, verbose=True):
    t0 = time.time()
    A = W(n); q = cubic(A, f); qb = A.conj(q)
    assert all(sum(k[:n]) == 2 and sum(k[n:]) == 1 for k in q)
    u = A.n2(q); V = A.mul(q, qb); Q = A.mul(q, q)
    assert A.E(V) == (u, 0) and A.E(Q) == ZERO
    Vp = [A.const(1), V, A.mul(V, V)]                                           # V^0, V^1, V^2
    EV2 = real(A.EP(V, V)); delta = EV2 - 2 * u * u
    dq = [A.d(q, j) for j in range(n)]; dbq = [A.db(q, j) for j in range(n)]
    y = [A.y(j) for j in range(n)]
    ye = A.lin(*[(e[j], y[j]) for j in range(n)]); yeb = A.conj(ye)
    deq = A.lin(*[(cconj(C(e[j])), dq[j]) for j in range(n)])                   # d_e q   = sum conj(e_j) d_j q
    dbeq = A.lin(*[(e[j], dbq[j]) for j in range(n)])                           # dbar_e q = sum e_j dbar_j q
    assert all(sum(k[:n]) == 1 and sum(k[n:]) == 1 for k in deq) and all(sum(k[:n]) == 2 and sum(k[n:]) == 0 for k in dbeq)
    a = A.lin(*[(1, A.mul(dq[j], dbq[j])) for j in range(n)])
    c2 = A.lin(*[(1, A.mul(dbq[j], A.conj(dbq[j]))) for j in range(n)])
    c1 = A.lin(*[(1, A.mul(dq[j], A.conj(dq[j]))) for j in range(n)])
    x = A.lin((1, c2), (-u, A.const(1)))
    assert A.E(c2) == (u, 0) and A.E(c1) == (2 * u, 0) and A.E(a) == ZERO

    # ---------------- Theorem 6, h = v^m: E[conj(y_e) q V^m] = (m+1) E[d_e q V^m] + m E[q^2 conj(dbar_e q) V^(m-1)]
    F1 = A.mul(yeb, q); G2 = A.mul(Q, A.conj(dbeq))
    def EV(F, m):                                                               # E[F V^m], m <= 4
        if m <= 2: return A.EP(F, Vp[m])
        return A.EP(A.mul(F, Vp[m - 2]), Vp[2])
    t6 = []
    for m in range(mmax + 1):
        lhs = EV(F1, m)
        t1 = EV(deq, m); rhs = ((m + 1) * t1[0], (m + 1) * t1[1])
        if m >= 1:
            t2 = EV(G2, m - 1); rhs = (rhs[0] + m * t2[0], rhs[1] + m * t2[1])
        assert lhs == rhs, f"Theorem 6, m={m}: {lhs} != {rhs}"
        t6.append(lhs)
    # ---------------- Theorem 6, operator form with explicit shadows, for the coordinate directions
    #   c_j = E[conj(y_j) q h(V)] = <conj(d_j q), A_h> + <dbar_j q, B_h>,  A_h = P11[(vh)'(V)], B_h = P20[q^2 h'(V)]
    cor61 = []
    if n <= 2 and mmax >= 3: Vp.append(A.mul(Vp[2], V))                         # V^3, for the operator form with h = v^3
    for m in range(1, min(mmax, len(Vp) - 1) + 1):
        psi = A.lin((m + 1, Vp[m]))                                             # (v h)' = (m+1) v^m
        Ah = A.proj(psi, 1, 1)
        Bh = A.proj(A.lin((m, A.mul(Q, Vp[m - 1]))), 2, 0)                      # q^2 h'(V) = m q^2 V^(m-1)
        cvec = []
        for j in range(n):
            cj = EV(A.mul(A.conj(y[j]), q), m)
            assert cj == cadd(A.ip(A.conj(dq[j]), Ah), A.ip(dbq[j], Bh)), f"shadow form, m={m}, j={j}"
            cvec.append(cj)
        # law functionals of Theorem 9 for h = v^m:  sA^2 = Var[(m+1)V^m],  sB^2 = E[V^2 (m V^(m-1))^2] = m^2 E V^(2m)
        EVm = real(A.E(Vp[m]))
        EV2m = real(A.EP(Vp[m], Vp[m]))
        sA2 = (m + 1) ** 2 * (EV2m - EVm * EVm); sB2 = m * m * EV2m
        assert A.n2(Ah) <= sA2 and A.n2(Bh) <= sB2, "Bessel"
        cor61.append((m, sum(cabs2(c) for c in cvec), A.n2(Ah), A.n2(Bh), sA2, sB2))

    # ---------------- Theorem 7
    def coef11(F, a_, b_):
        k = [0] * (2 * n); k[a_] = 1; k[n + b_] = 1; return F.get(tuple(k), ZERO)
    M = [[coef11(V, a_, b_) for b_ in range(n)] for a_ in range(n)]            # read off the Wick expansion of V
    I2 = [[A.ip(dbq[a_], dbq[b_]) for b_ in range(n)] for a_ in range(n)]      # E[conj(dbar_a q) dbar_b q]
    J1 = [[A.ip(dq[b_], dq[a_]) for b_ in range(n)] for a_ in range(n)]        # E[d_a q conj(d_b q)]
    for a_ in range(n):
        for b_ in range(n):
            assert M[a_][b_] == cadd(I2[a_][b_], J1[a_][b_]), "Theorem 7(a)"
            assert I2[a_][b_] == cconj(I2[b_][a_]) and J1[a_][b_] == cconj(J1[b_][a_]), "Hermitian"
            assert coef11(c2, a_, b_) == J1[a_][b_], "reviewer's remark: P11(c2) = J1"
            assert coef11(c1, a_, b_) == cadd(cadd(I2[a_][b_], I2[a_][b_]), J1[a_][b_]), "reviewer's remark: P11(c1) = 2 I2 + J1"
    hs = lambda X: sum(cabs2(X[i][j]) for i in range(n) for j in range(n))
    v11 = A.n2(A.proj(V, 1, 1)); v22 = A.n2(A.proj(V, 2, 2)); v33 = A.n2(A.proj(V, 3, 3))
    q20 = A.n2(A.proj(Q, 2, 0)); q31 = A.n2(A.proj(Q, 3, 1)); q42 = A.n2(A.proj(Q, 4, 2))
    assert v11 == hs(M), "||P11 V||^2 = ||M||_HS^2"
    assert sum(J1[i][i][0] for i in range(n)) == 2 * u and sum(I2[i][i][0] for i in range(n)) == u, "traces"
    tr = ZERO
    for i in range(n):
        for j in range(n): tr = cadd(tr, cmul(J1[i][j], I2[j][i]))
    assert tr[1] == 0 and tr[0] >= 0 and hs(M) == hs(J1) + hs(I2) + 2 * tr[0], "tr(J1 I2) >= 0"
    assert EV2 == u * u + v11 + v22 + v33 == q20 + q31 + q42, "Parseval for V and q^2"
    # ledger 6.3.21, both identities (used by Theorems 7, 8 and Proposition 10)
    nx = A.n2(x); na = A.n2(a)
    assert delta == q20 + q31 + 2 * nx, "6.3.21 first identity"
    assert 3 * delta == 2 * q20 + q31 + 4 * v11 + 2 * v22, "6.3.21 second identity"
    assert 4 * (na + 2 * nx) == 4 * delta - 3 * q31, "||a||^2 + 2||x||^2 = delta - (3/4)||P31 q^2||^2"
    assert 4 * hs(M) <= 3 * delta, "Theorem 7(b): ||P11 V||^2 <= (3/4) delta"
    # reviewer's sharpening of Theorem 7(b):  ||c2 - u||^2 = ||J1||_HS^2 + ||I2||_HS^2  (P11 c2 = J1, ||P22 c2|| = ||I2||_HS),
    # hence  delta = ||P20 q^2||^2 + ||P31 q^2||^2 + 2(||J1||^2 + ||I2||^2)  and  lam1^2 + lam2^2 <= delta/2
    assert A.n2(A.proj(c2, 2, 2)) == hs(I2) and A.n2(A.proj(c2, 1, 1)) == hs(J1), "components of c2"
    assert nx == hs(J1) + hs(I2), "reviewer: ||c2-u||^2 = ||J1||^2 + ||I2||^2"
    assert delta == q20 + q31 + 2 * (hs(J1) + hs(I2)) and 2 * (hs(J1) + hs(I2)) <= delta, "reviewer: lam1^2+lam2^2 <= delta/2"
    # (these three lines are Theorem 13 and Corollary 13.1 of the package's second version; next: its Corollary 13.3)
    assert 2 * v22 == q20 + 2 * q31 + 2 * (hs(J1) + hs(I2)) - 8 * tr[0], "Corollary 13.3: |P22 V|^2 = |P20 q^2|^2/2 + |P31 q^2|^2 + |J1|^2 + |I2|^2 - 4 tr(J1 I2)"
    # eigenvalues (floating, for information and for the inequality lam1^2 + lam2^2 <= ||M||^2)
    import numpy as np
    tom = lambda X: np.array([[complex(X[i][j][0], X[i][j][1]) for j in range(n)] for i in range(n)])
    l1 = float(np.linalg.eigvalsh(tom(J1))[-1]); l2 = float(np.linalg.eigvalsh(tom(I2))[-1])
    assert l1 <= 2 * u * (1 + 1e-12) and l2 <= u * (1 + 1e-12) and l1 * l1 + l2 * l2 <= hs(M) * (1 + 1e-12)
    assert l1 * l1 + l2 * l2 <= (hs(J1) + hs(I2)) * (1 + 1e-12) <= 0.5 * delta * (1 + 1e-12)
    assert np.linalg.eigvalsh(tom(J1))[0] >= -1e-9 * u and np.linalg.eigvalsh(tom(I2))[0] >= -1e-9 * u
    # ---------------- Theorem 8 (h = v) and Theorem 9 / Corollary 6.1 on polynomial profiles (floating comparisons)
    t8 = None
    for (m, c2n, nA, nB, sA2, sB2) in cor61:
        C_ = sqrt(c2n)
        b61 = sqrt(l1) * sqrt(nA) + sqrt(l2) * sqrt(nB)
        b9 = sqrt(l1) * sqrt(sA2) + sqrt(l2) * sqrt(sB2)
        b9a = sqrt(u) * (sqrt(2) * sqrt(sA2) + sqrt(sB2))
        b9b = (0.75 * delta) ** 0.25 * (sA2 ** (2 / 3) + sB2 ** (2 / 3)) ** 0.75
        assert C_ <= b61 * (1 + 1e-12) <= b9 * (1 + 1e-11) and b9 <= b9a * (1 + 1e-12) and b9 <= b9b * (1 + 1e-12), "T9 chain"
        if m == 1:
            # Theorem 8: A_h = 2 P11 V, B_h = P20 q^2
            assert nA == 4 * v11 and nB == q20
            cs = (3 * l1 + 1.5 * l2) * (4 / 3 * v11 + 2 / 3 * q20)
            assert c2n <= b61 ** 2 * (1 + 1e-12) <= cs * (1 + 1e-11) and cs <= min(7.5 * u * delta, 0.75 * sqrt(15) * delta ** 1.5) * (1 + 1e-12)
            t8 = (c2n, b61 ** 2, cs, 7.5 * u * delta, 0.75 * sqrt(15) * delta ** 1.5)

    # ---------------- Proposition 10: w = y_a y_b, m(v) = v^k, eta = m - u m' :
    #   E[conj(w) q^2 eta(V)] = E[conj(w) a (v m)'(V)] + E[conj(w) q^2 m'(V) x]
    if do_p10:
        for a_ in range(n):
            for b_ in range(a_, n):
                wb = A.conj(A.mul(y[a_], y[b_])); wQ = A.mul(wb, Q); wa = A.mul(wb, a); wQx = A.mul(wQ, x)
                for k in range(3):
                    lhs = EV(wQ, k)
                    if k >= 1:
                        t = EV(wQ, k - 1); lhs = (lhs[0] - u * k * t[0], lhs[1] - u * k * t[1])
                    t = EV(wa, k); rhs = ((k + 1) * t[0], (k + 1) * t[1])
                    if k >= 1:
                        t = EV(wQx, k - 1); rhs = (rhs[0] + k * t[0], rhs[1] + k * t[1])
                    assert lhs == rhs, f"Proposition 10, k={k}"
    # ---------------- Proposition 11: w = :y_a conj(y_b):, psi = v^m, Kfull = E psi(v + u tau), K = Kfull - Kfull(0), rho = K/v
    #   E[conj(w) psi(V)] = E[conj(q) rho(V) sum_j conj(dbar_j w) dbar_j q] + E[conj(w) x K'(V)] + E[conj(w) conj(q)^2 a rho'(V)]
    if do_p11:
        qb2 = A.mul(qb, qb); qb2a = A.mul(qb2, a)
        for a_ in range(n):
            for b_ in range(n):
                k = [0] * (2 * n); k[a_] = 1; k[n + b_] = 1; w = {tuple(k): (1, 0)}; wb = A.conj(w)
                # sum_j conj(dbar_j w) dbar_j q = conj(y_a) dbar_b q
                first = A.mul(qb, A.mul(A.conj(y[a_]), dbq[b_])); wbx = A.mul(wb, x); third = A.mul(wb, qb2a)
                for m in range(1, 4):
                    Kf = [comb(m, m - i) * factorial(m - i) * u ** (m - i) for i in range(m + 1)]   # coefficient of v^i
                    K = [0] + Kf[1:]; rho = K[1:]; Kp = [i * c for i, c in enumerate(K)][1:]
                    rhop = [i * c for i, c in enumerate(rho)][1:]
                    # sanity: K - u K' = v^m - const
                    chk = [K[i] - u * (Kp[i] if i < len(Kp) else 0) for i in range(m + 1)]
                    assert chk[1:] == [0] * (m - 1) + [1], "K - uK' = psi - const"
                    lhs = EV(wb, m)
                    rhs = ZERO
                    for i, c in enumerate(rho):
                        if c: t = EV(first, i); rhs = (rhs[0] + c * t[0], rhs[1] + c * t[1])
                    for i, c in enumerate(Kp):
                        if c: t = EV(wbx, i); rhs = (rhs[0] + c * t[0], rhs[1] + c * t[1])
                    for i, c in enumerate(rhop):
                        if c: t = EV(third, i); rhs = (rhs[0] + c * t[0], rhs[1] + c * t[1])
                    assert lhs == rhs, f"Proposition 11, m={m}, w=({a_},{b_})"
    # ---------------- Proposition 12 and every step of its proof, with X2 = 2 Re q = q + conj(q)
    p12 = None
    if do_p12:
        EV3 = real(A.EP(Vp[2], V))
        assert 2 * u * EV3 >= 3 * EV2 * EV2, "Proposition 12"
        k6c = EV3 - 6 * u ** 3 - 9 * u * delta
        assert 2 * k6c * u >= 3 * delta * (delta - 2 * u * u), "kappa6c >= (3/2) chi (chi-2) u^3"
        X = A.lin((1, q), (1, qb))                                             # X = 2 Re q  (real)
        assert A.conj(X) == X
        X2 = A.mul(X, X); X3 = A.mul(X2, X)
        m2 = real(A.E(X2)); m4 = real(A.EP(X2, X2)); m6 = real(A.EP(X3, X3))  # moments of 2 Re q
        assert m2 == 2 * u and m4 == 6 * EV2 and m6 == 20 * EV3, "circular moments: m2=u/2, m4=(3/8)E|q|^4, m6=(5/16)E|q|^6"
        assert 5 * m4 * m4 <= 3 * m2 * m6
        # spectral step for P(t) = t^3 - c t with several c:  E[Gamma P'(X)^2] = sum_k k ||J_k P(X)||^2 <= 9 E[P(X)^2],
        # Gamma = |grad X|^2 = 2 sum_j |d_j X|^2 (real gradient), and the Stein identity E[Gamma phi'(X)] = 3 E[X phi(X)]
        dX = [A.d(X, j) for j in range(n)]
        Gam = A.lin(*[(2, A.mul(dX[j], A.conj(dX[j]))) for j in range(n)])
        assert A.E(Gam) == (3 * m2, 0)
        for cnum in (0, 1, 5 * u, -3 * u, 20 * u):
            P = A.lin((1, X3), (-cnum, X)); Pp = A.lin((3, X2), (-cnum, A.const(1)))
            EGP = real(A.EP(A.mul(Gam, Pp), Pp))
            dirichlet = sum(dg * A.n2(A.chaos(P, dg)) for dg in range(10))
            assert set(sum(k) for k in P) <= set(range(10))
            assert EGP == dirichlet, "E[Gamma P'(X)^2] = <P(X), -L P(X)>"
            EP2 = A.n2(P); assert EP2 == m6 - 2 * cnum * m4 + cnum * cnum * m2
            assert dirichlet <= 9 * EP2
            assert 5 * EGP == 3 * (9 * m6 - 10 * cnum * m4 + 5 * cnum * cnum * m2), "Stein identity with phi = int P'^2"
        p12 = (EV3, k6c)
    if verbose:
        chi = Fr(delta, u * u)
        print(f"PASS {name}: n={n}, u={u}, delta={delta}, chi={float(chi):.4f}  [{time.time()-t0:.1f} s]")
        print(f"     Theorem 6 exact for h=v^m, m=0..{mmax} (direction e={e}); operator form with explicit shadows exact for m=1..{len(cor61)}")
        print(f"     Theorem 7: M=I2+J1 exact; ||P11V||^2={v11}, ||J1||^2+||I2||^2={hs(J1)+hs(I2)}, tr(J1 I2)={tr[0]}; "
              f"||P11V||^2/delta={float(Fr(v11, delta)):.4f} (<= 0.75); lam1/u={l1/u:.4f}, lam2/u={l2/u:.4f}, (lam1^2+lam2^2)/delta={(l1*l1+l2*l2)/delta:.4f}")
        print(f"     reviewer: ||c2-u||^2 = ||J1||^2+||I2||^2 = {nx} exactly; (||J1||^2+||I2||^2)/delta = {float(Fr(hs(J1)+hs(I2), delta)):.4f} (<= 0.5)")
        print(f"     6.3.21: |P20 q^2|^2={q20}, |P31 q^2|^2={q31}, |P11 V|^2={v11}, |P22 V|^2={v22}, |x|^2={nx}, |a|^2={na}: both identities exact")
        if t8: print(f"     Theorem 8: |Pi1(q|q|^2)|^2={t8[0]} <= (2 sqrt(l1)|P11V| + sqrt(l2)|P20q^2|)^2={t8[1]:.6g} <= CS {t8[2]:.6g} <= min(7.5 u delta={t8[3]:.6g}, (3 sqrt15/4) delta^1.5={t8[4]:.6g}); ratio bound/truth {(t8[1]/t8[0] if t8[0] else float('inf')):.4f}")
        for (m, c2n, nA, nB, sA2, sB2) in cor61:
            b61 = (sqrt(l1) * sqrt(nA) + sqrt(l2) * sqrt(nB)) ** 2; b9 = (sqrt(l1) * sqrt(sA2) + sqrt(l2) * sqrt(sB2)) ** 2
            rr = lambda p_, q_: (p_ / q_ if q_ else float('inf'))
            print(f"     h=v^{m}: |c|^2={c2n}; Cor 6.1 x{rr(b61, c2n):.3f}; Theorem 9 (true influences) x{rr(b9, c2n):.3f}; Bessel: sA^2/|A|^2={rr(sA2, nA):.3f}, sB^2/|B|^2={rr(sB2, nB):.3f}")
        if p12: print(f"     Proposition 12: E|q|^6/u^3={float(Fr(p12[0], u**3)):.3f} >= 1.5 (chi+2)^2={1.5*float(chi+2)**2:.3f}; proof steps (moments, Dirichlet form, Stein identity) exact; Propositions 10, 11 exact")
    return dict(u=u, delta=delta, v11=v11, v22=v22, q20=q20, q31=q31, nx=nx, na=na, M=M, t6=t6, l1=l1, l2=l2, hsJ=hs(J1), hsI=hs(I2))

def ccl413(n, f, r):
    """Chen-Chen-Liu, arXiv:2304.08088v1, equation (4.13), in bidegree (p, q) = (2, 1), term by term, with the
    paper's contractions  f (x)_{i,j} g  (i holomorphic slots of f against antiholomorphic slots of g, j the converse)
    and h the reverse complex conjugate of f;  q = I_{2,1}(f) = sum f_{ab;c} :y_a y_b conj(y_c):, f symmetric in (a, b):

        delta = 16|f(x)_{1,0}h|^2 + 4|f(x)_{0,1}h|^2 + 4|f(x)_{2,0}h|^2 + 16|f(x)_{1,1}h|^2      (first sum)
              + 6 |phi_1|^2,  phi_1 = 2 f(x~)_{1,0} f + 2 f(x~)_{0,1} f                           (= |P31 q^2|^2)
              + 32 |f(x)_{1,1} f|^2                                                               (= |P20 q^2|^2).
    Checked against the Wick-basis values r of the same cubic, together with the identification of the first sum
    with 2|c2 - u|^2 = 2|J1|_HS^2 + 2|I2|_HS^2 (ledger 6.3.21, first identity)."""
    from itertools import permutations
    T = {}
    for (a, b, c), v in f.items():
        v = C(v)
        if a == b: T[(a, a, c)] = cadd(T.get((a, a, c), ZERO), (Fr(v[0]), Fr(v[1])))
        else:
            for k in ((a, b, c), (b, a, c)): T[k] = cadd(T.get(k, ZERO), (Fr(v[0], 2), Fr(v[1], 2)))
    g = lambda a, b, c: T.get((a, b, c), ZERO)
    R = range(n)
    def csum(it):
        t = ZERO
        for z in it: t = cadd(t, z)
        return t
    nrm = lambda d: sum(cabs2(z) for z in d.values())
    T10 = {(b, c, c2, b2): csum(cmul(g(a, b, c), cconj(g(a, b2, c2))) for a in R) for b in R for c in R for c2 in R for b2 in R}
    T01 = {(a, b, a2, b2): csum(cmul(g(a, b, c), cconj(g(a2, b2, c))) for c in R) for a in R for b in R for a2 in R for b2 in R}
    T20 = {(c, c2): csum(cmul(g(a, b, c), cconj(g(a, b, c2))) for a in R for b in R) for c in R for c2 in R}
    T11 = {(b, b2): csum(cmul(g(a, b, c), cconj(g(a, b2, c))) for a in R for c in R) for b in R for b2 in R}
    first = 16 * nrm(T10) + 4 * nrm(T01) + 4 * nrm(T20) + 16 * nrm(T11)
    F10 = {(b, a2, b2, c): csum(cmul(g(l, b, c), g(a2, b2, l)) for l in R) for b in R for a2 in R for b2 in R for c in R}
    F01 = {(a, b, b2, c2): csum(cmul(g(a, b, l), g(l, b2, c2)) for l in R) for a in R for b in R for b2 in R for c2 in R}
    def sym3(D):
        out = {}
        for i in R:
            for j in R:
                for k in R:
                    for c in R:
                        t = csum(D[(pp[0], pp[1], pp[2], c)] for pp in permutations((i, j, k)))
                        out[(i, j, k, c)] = (t[0] / 6, t[1] / 6)
        return out
    S10, S01 = sym3(F10), sym3(F01)
    phi1 = {k: (2 * S10[k][0] + 2 * S01[k][0], 2 * S10[k][1] + 2 * S01[k][1]) for k in S10}
    F11 = {(b, b2): csum(cmul(g(l, b, m), g(m, b2, l)) for l in R for m in R) for b in R for b2 in R}
    assert 6 * nrm(phi1) == r["q31"], "(4.13) second term = |P31 q^2|^2"
    assert 32 * nrm(F11) == r["q20"], "(4.13) third term = |P20 q^2|^2"
    assert first == 2 * r["nx"] == 2 * (r["hsJ"] + r["hsI"]), "(4.13) first sum = 2|c2-u|^2"
    assert 4 * nrm(T01) == 4 * nrm(T20) == r["hsI"] and 16 * nrm(T10) == 16 * nrm(T11) == r["hsJ"], "contraction norms"
    assert first + 6 * nrm(phi1) + 32 * nrm(F11) == r["delta"], "(4.13) in bidegree (2,1)"
    # the companion identity (4.14) of the same paper in bidegree (2,1):
    #   delta = 8|f(x)_{1,0}f|^2 + 8|f(x)_{0,1}f|^2 + 4|psi_1|^2 + |psi_2|^2 + 16|f(x)_{1,1}f|^2,
    #   with 4|psi_1|^2 = |P22 V|^2, |psi_2|^2 = |P11 V|^2, 16|f(x)_{1,1}f|^2 = |P20 q^2|^2 / 2
    assert 8 * nrm(F10) + 8 * nrm(F01) + r["v22"] + r["v11"] + Fr(r["q20"], 2) == r["delta"], "(4.14) in bidegree (2,1)"
    return first

if __name__ == "__main__":
    T0 = time.time()
    selftest()
    I = (0, 1)
    # (1) Wick monomial q = :y^2 conj(y): = y(|y|^2 - 2): hand values of the review
    r = check("Wick monomial y(|y|^2-2)", 1, {(0, 0, 0): 1}, [1])
    assert (r["u"], r["delta"], r["q20"], r["q31"], r["nx"], r["v11"], r["v22"]) == (2, 168, 32, 96, 20, 36, 100)
    assert r["M"] == [[(6, 0)]] and r["t6"][1] == (32, 0) and r["t6"][0] == ZERO
    print("     hand values confirmed: u=2, delta=168, P11|q|^2 = 6(|y|^2-1), content coefficient 32 (= 24 + 8) for h=v")
    # (2) two variables, all six basis elements, repeated-index terms present ((0,0,0), (0,1,0), (0,1,1), (1,1,1))
    f2 = {(0, 0, 0): (2, 1), (0, 0, 1): (1, -2), (0, 1, 0): (-1, 1), (0, 1, 1): (3, 0), (1, 1, 0): (0, 2), (1, 1, 1): (1, 1)}
    check("two variables, all six basis elements (repeated indices)", 2, f2, [(1, 2), (-3, 1)])
    # (3) X^2 conj(Y): P31(q^2) = 0, ||P11 V||^2/delta = 1/2
    r = check("X^2 conj(Y)", 2, {(0, 0, 1): 1}, [(1, 1), (2, -1)])
    assert r["q31"] == 0 and 2 * r["v11"] == r["delta"]
    # (4) X(|Y|^2 - 1) = :X Y conj(Y):
    check("X(|Y|^2-1)", 2, {(0, 1, 1): 1}, [(1, 0), (1, 1)])
    # (4b) equal independent Wick blocks H(X) + H(Y): Corollary 6.1 is an equality for h = v, v^2 and strict for h = v^3
    check("H(X)+H(Y), equal independent Wick blocks", 2, {(0, 0, 0): 1, (1, 1, 1): 1}, [(1, 0), (0, 1)])
    # (5) three variables: 14 of the 18 basis elements, with repeated-index and all-distinct terms
    f3 = {(0, 0, 0): (1, 1), (0, 0, 1): (2, 0), (0, 0, 2): (0, -1), (0, 1, 0): (1, -1), (0, 1, 1): (-2, 1), (0, 1, 2): (3, 1),
          (0, 2, 0): (0, 2), (0, 2, 1): (1, 0), (0, 2, 2): (-1, -1), (1, 1, 0): (1, 2), (1, 1, 2): (-1, 0), (1, 2, 0): (2, -1),
          (1, 2, 2): (0, 1), (2, 2, 1): (1, 1)}
    check("three variables, 14 basis elements", 3, f3, [(1, 0), (0, 1), (2, -1)])
    # (6) three variables, all-distinct indices only
    check("three variables, y0 y1 conj(y2) + i y0 y2 conj(y1) - 2 y1 y2 conj(y0)", 3, {(0, 1, 2): 1, (0, 2, 1): I, (1, 2, 0): -2}, [(1, 1), (1, -1), (0, 2)])
    # Chen-Chen-Liu (4.13) in bidegree (2,1), term by term, on the cubics above
    for nm, n_, f_ in (("Wick monomial", 1, {(0, 0, 0): 1}), ("two variables, six basis elements", 2, f2), ("X^2 conj(Y)", 2, {(0, 0, 1): 1}),
                       ("X(|Y|^2-1)", 2, {(0, 1, 1): 1}), ("three variables, 14 basis elements", 3, f3)):
        r = check(nm, n_, f_, [1] * n_, mmax=1, do_p10=False, do_p11=False, do_p12=False, verbose=False)
        fs = ccl413(n_, f_, r)
        print(f"PASS Chen-Chen-Liu (4.13), bidegree (2,1), term by term on {nm}: first sum {fs} = 2|c2-u|^2, 6|phi_1|^2 = |P31 q^2|^2 = {r['q31']}, 32|f x_(1,1) f|^2 = |P20 q^2|^2 = {r['q20']}, total = delta = {r['delta']}")
    # the family q = a H-type monomial + b X^2 conj(Y) = :X^2 conj(aX + bY):  has lam1 = 2u, lam2 = u for every (a, b):
    # the corner of the cap set of Theorem 9 is attained for every chi between 10 and 42
    fam = []
    for a_, b_ in ((0, 1), (1, 4), (1, 2), (1, 1), (2, 1), (4, 1), (1, 0)):
        f_ = {k: v for k, v in {(0, 0, 0): a_, (0, 0, 1): b_}.items() if v}
        r = check("family", 2, f_, [1, 1], mmax=1, do_p10=False, do_p11=False, do_p12=False, verbose=False)
        assert abs(r["l1"] - 2 * r["u"]) < 1e-9 * r["u"] and abs(r["l2"] - r["u"]) < 1e-9 * r["u"]
        fam.append(f"|a|^2/(|a|^2+|b|^2)={Fr(a_*a_, a_*a_+b_*b_)}: chi={float(Fr(r['delta'], r['u']**2)):.4f}")
    print("PASS family :X^2 conj(aX+bY): has (lam1, lam2) = (2u, u) for all (a, b); " + "; ".join(fam))
    # random batch (quiet): every check above on random Gaussian-integer cubics
    import random
    rng = random.Random(20261116); cnt = 0; worst = Fr(0)
    for n_, trials, dens in ((1, 2, 1.0), (2, 12, 0.8), (3, 8, 0.6), (4, 2, 0.25)):
        for _ in range(trials):
            f_ = {}
            for a_ in range(n_):
                for b_ in range(a_, n_):
                    for c_ in range(n_):
                        if rng.random() < dens: f_[(a_, b_, c_)] = (rng.randint(-4, 4), rng.randint(-4, 4))
            f_ = {k: v for k, v in f_.items() if v != (0, 0)}
            if not f_: continue
            e_ = [(rng.randint(-3, 3), rng.randint(-3, 3)) for _ in range(n_)]
            r = check("random", n_, f_, e_, mmax=3 if n_ <= 3 else 2, do_p10=n_ <= 3, do_p11=n_ <= 3, verbose=False)
            ccl413(n_, f_, r); cnt += 1
            worst = max(worst, Fr(r["hsJ"] + r["hsI"], r["delta"]))
    print(f"PASS random batch: {cnt} random cubics (n = 1, 2, 3, 4): all checks; largest (|J1|^2+|I2|^2)/delta = {float(worst):.4f} (<= 1/2)")
    print(f"ALL REVIEWER EXACT CHECKS PASSED in {time.time()-T0:.1f} s")

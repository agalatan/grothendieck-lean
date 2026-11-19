"""Reviewer's own exact check of L1, T2a-f, T3, T5 (independent of the package's wick_exact.py).

Differences of method from the package:
  * polynomials are sympy Poly objects in symbols y_j, w_j (w_j = conj(y_j)) over the Gaussian rationals;
  * the cubic is built with creation operators,  q = sum f_abc d_a^* d_b^* dbar_c^* 1,
    d_a^* = y_a - d/dw_a,  dbar_c^* = w_c - d/dy_c   (not from a table of Wick monomials);
  * expectations use the complex moment m(a,b) = E[y^a conj(y)^b] DERIVED here from real Gaussian moments
    E g^(2k) = (2k-1)!! through y = (g1 + i g2)/sqrt2 (binomial expansion), not the formula delta_ab a!;
  * chaos projections are Lagrange filters in the number operators N1, N2 (not the coefficient formula
    E[d^alpha dbar^beta F]/(alpha! beta!));
  * the real Stein matrices Gamma_ab = grad Q_a . grad Q_b are formed in REAL coordinates, so the change of
    variables of T2f is checked, not assumed; the gradient budget E sum |grad Gamma_ab|^2 of ledger 11.29 (7) too.
Run: python3 -I exact_check.py
"""
import sys, itertools, random
from fractions import Fraction
from math import comb, factorial
import sympy as sp
from sympy import I, Rational, Poly, QQ

# ----------------------------------------------------------------------------------------------------------
def df2(n):  # (n-1)!! for even n, E g^n
    if n % 2: return 0
    r = 1
    for k in range(n - 1, 0, -2): r *= k
    return r

_mcache = {}
def m(a, b):
    """E[y^a conj(y)^b] for a standard complex Gaussian, from real moments: y = (g1 + i g2)/sqrt2."""
    if (a, b) in _mcache: return _mcache[(a, b)]
    if (a + b) % 2:
        _mcache[(a, b)] = sp.Integer(0); return _mcache[(a, b)]
    tot = sp.Integer(0)
    for k in range(a + 1):
        for l in range(b + 1):
            e1 = k + l; e2 = a + b - k - l
            tot += comb(a, k) * comb(b, l) * I**(a - k) * (-I)**(b - l) * df2(e1) * df2(e2)
    tot = sp.expand(tot / Rational(2)**((a + b) // 2))
    _mcache[(a, b)] = tot
    return tot

class Alg:
    def __init__(s, n):
        s.n = n
        s.y = sp.symbols(f"y0:{n}"); s.w = sp.symbols(f"w0:{n}")
        s.gens = s.y + s.w
    def P(s, e): return Poly(e, *s.gens, domain=QQ.algebraic_field(I))
    def E(s, p):
        tot = sp.Integer(0)
        for mon, c in p.terms():
            al, be = mon[:s.n], mon[s.n:]
            v = sp.Integer(1)
            for a, b in zip(al, be):
                v *= m(a, b)
                if v == 0: break
            if v != 0: tot += c * v
        return sp.expand(tot)
    def conj(s, p):
        d = {}
        for mon, c in p.terms():
            d[mon[s.n:] + mon[:s.n]] = sp.conjugate(c)
        return Poly.from_dict(d, *s.gens, domain=QQ.algebraic_field(I))
    def d(s, p, j): return p.diff(s.y[j])
    def db(s, p, j): return p.diff(s.w[j])
    def N1(s, p): return sum((s.P(s.y[j]) * s.d(p, j) - s.db(s.d(p, j), j) for j in range(s.n)), s.P(0))
    def N2(s, p): return sum((s.P(s.w[j]) * s.db(p, j) - s.d(s.db(p, j), j) for j in range(s.n)), s.P(0))
    def cr(s, p, a): return s.P(s.y[a]) * p - s.db(p, a)      # d_a^*
    def crb(s, p, c): return s.P(s.w[c]) * p - s.d(p, c)      # dbar_c^*
    def ip(s, F, G): return s.E(s.conj(F) * G)
    def n2(s, F):
        v = s.ip(F, F); assert sp.im(v) == 0; return sp.re(v)
    def filt(s, p, Nop, eig, keep):
        """Lagrange filter: component of p with eigenvalue `keep` of Nop, p in the span of eigenvalues `eig`."""
        out = p
        for e in eig:
            if e == keep: continue
            out = (Nop(out) - e * out) * Rational(1, keep - e)
        return out

def cubic(A, f):
    """q = sum f[a][b][c] d_a^* d_b^* dbar_c^* 1."""
    n = A.n; q = A.P(0); one = A.P(1)
    for a in range(n):
        for b in range(n):
            for c in range(n):
                if f[a][b][c] != 0:
                    q = q + f[a][b][c] * A.cr(A.cr(A.crb(one, c), b), a)
    return q

def zero(A, p): return p.is_zero

def check(name, n, f, ecoef, profiles, verbose=True):
    A = Alg(n); q = cubic(A, f); qb = A.conj(q)
    assert zero(A, A.N1(q) - 2 * q) and zero(A, A.N2(q) - q), "q not in H21"
    u = A.n2(q)
    V = q * qb; Q = q * q
    dq = [A.d(q, j) for j in range(n)]; F = [A.db(q, j) for j in range(n)]
    a = sum((dq[j] * F[j] for j in range(n)), A.P(0))
    c1 = sum((dq[j] * A.conj(dq[j]) for j in range(n)), A.P(0))
    c2 = sum((F[j] * A.conj(F[j]) for j in range(n)), A.P(0))
    x = c2 - u
    EV2 = A.E(V * V); delta = sp.re(EV2) - 2 * u**2
    assert A.E(Q) == 0 and A.E(c2) == u and A.E(c1) == 2 * u and A.E(a) == 0
    # --- Lemma 1 with random polynomial G (both forms)
    rng = random.Random(1234 + n)
    def randpoly(deg_y, deg_w, terms=6):
        e = 0
        for _ in range(terms):
            mon = 1
            for _ in range(rng.randint(0, deg_y)): mon *= A.y[rng.randrange(n)]
            for _ in range(rng.randint(0, deg_w)): mon *= A.w[rng.randrange(n)]
            e += (Rational(rng.randint(-5, 5), rng.randint(1, 4)) + I * Rational(rng.randint(-5, 5), rng.randint(1, 4))) * mon
        return A.P(e)
    for t in range(3):
        G = randpoly(3, 4)
        lhs = A.E(G * q)
        r1 = sum(A.E(A.d(G, j) * F[j]) for j in range(n))
        r2 = Rational(1, 2) * sum(A.E(A.db(G, j) * dq[j]) for j in range(n))
        assert sp.simplify(lhs - r1) == 0 and sp.simplify(lhs - r2) == 0, "L1"
    # --- T2a: a = P20 Q + (1/2) P31 Q  (as polynomials), via N2-filters on {0,1,2}
    P20Q = A.filt(Q, A.N2, [0, 1, 2], 0); P31Q = A.filt(Q, A.N2, [0, 1, 2], 1); P42Q = A.filt(Q, A.N2, [0, 1, 2], 2)
    assert zero(A, Q - P20Q - P31Q - P42Q)
    for comp, (p1, p2) in [(P20Q, (2, 0)), (P31Q, (3, 1)), (P42Q, (4, 2))]:
        assert zero(A, A.N1(comp) - p1 * comp) and zero(A, A.N2(comp) - p2 * comp)
    assert zero(A, a - P20Q - Rational(1, 2) * P31Q), "T2a"
    q20 = A.n2(P20Q); q31 = A.n2(P31Q)
    assert A.n2(a) == q20 + q31 / 4 and A.ip(Q, a) == q20 + q31 / 2
    # --- T2b: c1 + c2 = (3 - N2) V; c2 in H00+H11+H22
    assert zero(A, c1 + c2 - (3 * V - A.N2(V))), "T2b"
    P11V = A.filt(V, A.N2, [0, 1, 2, 3], 1); P22V = A.filt(V, A.N2, [0, 1, 2, 3], 2); P33V = A.filt(V, A.N2, [0, 1, 2, 3], 3)
    assert zero(A, V - u - P11V - P22V - P33V)
    for comp, k in [(P11V, 1), (P22V, 2), (P33V, 3)]:
        assert zero(A, A.N1(comp) - k * comp) and zero(A, A.N2(comp) - k * comp)
    x11 = A.filt(c2, A.N2, [0, 1, 2], 1); x22 = A.filt(c2, A.N2, [0, 1, 2], 2)
    assert zero(A, x - x11 - x22), "c2 in H00+H11+H22"
    v11 = A.n2(P11V); v22 = A.n2(P22V); nx = A.n2(x)
    # --- T2c
    W = [sum((F[j] * A.d(F[k], j) for j in range(n)), A.P(0)) for k in range(n)]
    lhs_c = A.ip(V - c2, x)
    assert lhs_c == sum(A.n2(Wk) for Wk in W) == A.n2(Rational(1, 2) * P31Q) == q31 / 4, "T2c"
    for k in range(n):   # P30(q F_k) = W_k : q F_k in H30+H41, N2-filter on {0,1}
        assert zero(A, A.filt(q * F[k], A.N2, [0, 1], 0) - W[k]), "P30(q F_k) = W_k"
        assert zero(A, A.db(a, k) - W[k])
    # --- T2d, T2e
    assert delta == q20 + q31 + 2 * nx, "T2d"
    assert A.n2(a) + 2 * nx == delta - Rational(3, 4) * q31
    assert delta == Rational(2, 3) * q20 + Rational(1, 3) * q31 + Rational(4, 3) * v11 + Rational(2, 3) * v22, "T2e"
    # --- T2f, in complex form
    S = c1 + c2 - 3 * u
    L1c = 2 * A.n2(S) + 4 * A.n2(a); L2c = Rational(1, 2) * A.n2(S) + 2 * A.n2(a)
    assert L1c == 6 * delta - q31 - 2 * v22, "T2f first"
    assert L2c == 3 * delta - q31 / 2 - 2 * v11 - Rational(3, 2) * v22, "T2f second"
    # --- T2f, in REAL coordinates: y_j = (g_{2j} + i g_{2j+1})/sqrt2
    g = sp.symbols(f"g0:{2*n}", real=True)
    sub = {}
    for j in range(n):
        sub[A.y[j]] = (g[2 * j] + I * g[2 * j + 1]) / sp.sqrt(2); sub[A.w[j]] = (g[2 * j] - I * g[2 * j + 1]) / sp.sqrt(2)
    qr = sp.expand(q.as_expr().subs(sub, simultaneous=True))
    Q1 = sp.expand(sp.re(qr)); Q2 = sp.expand(sp.im(qr))
    def Er(expr):
        p = Poly(sp.expand(expr), *g); tot = 0
        for mon, c in p.terms():
            v = 1
            for e in mon: v *= df2(e)
            tot += c * v
        return sp.simplify(sp.expand(tot))
    grad = lambda Fx: [sp.diff(Fx, gi) for gi in g]
    g1 = grad(Q1); g2 = grad(Q2)
    G11 = sp.expand(sum(x_ * x_ for x_ in g1)); G22 = sp.expand(sum(x_ * x_ for x_ in g2)); G12 = sp.expand(sum(x_ * y_ for x_, y_ in zip(g1, g2)))
    assert Er(Q1 * Q1) == u / 2 and Er(Q2 * Q2) == u / 2 and Er(Q1 * Q2) == 0
    assert Er(G11) == 3 * u / 2 and Er(G22) == 3 * u / 2 and Er(G12) == 0
    al = G11 - 3 * u / 2; ga = G22 - 3 * u / 2; be = G12
    budget3 = Er((al + ga)**2 + 2 * (al**2 + ga**2 + 2 * be**2))        # E[(tr D)^2 + 2 |D|_F^2]
    sumvar = Er(al**2 + ga**2 + 2 * be**2)                                # sum_ab Var Gamma_ab
    assert budget3 == L1c, "budget (3) = first left side of T2f"
    assert sumvar == L2c, "sum Var Gamma_ab = second left side of T2f"
    # --- the Lean identity `fluctuation_identity` (Grothe/LowerAnalytic/Fluctuation.lean), in real coordinates:
    #     12 delta - 4 E(S-3u)^2 - 2 E(A^2+B^2) = 4 E J4(a)^2 + E J4(a+b)^2 + 4 E J4(b)^2 + E J4(b-a)^2,
    #     J4(F) = fourth-chaos part of F^2, taken here with a Lagrange filter in the real OU generator.
    def ouL(Fx): return sp.expand(sum(sp.diff(Fx, gi, 2) - gi * sp.diff(Fx, gi) for gi in g))
    def J4(Fx):
        out = sp.expand(Fx * Fx)
        for ev in (0, 2, 6):                       # -L has eigenvalues 0, 2, 4, 6 on F^2
            out = sp.expand((-ouL(out) - ev * out) / (4 - ev))
        return out
    lean_rhs = 4 * Er(J4(Q1)**2) + Er(J4(Q1 + Q2)**2) + 4 * Er(J4(Q2)**2) + Er(J4(Q2 - Q1)**2)
    lean_lhs = 12 * delta - 4 * Er((G11 + G22 - 3 * u)**2) - 2 * (Er((G11 - G22)**2) + Er((2 * G12)**2))
    assert sp.simplify(lean_lhs - lean_rhs) == 0, "Lean fluctuation_identity"
    assert sp.simplify(lean_rhs / 2 - (q31 + 2 * v22)) == 0, "Lean remainder/2 = T2f first defect"
    gradbudget = Er(sum(sp.diff(al, gi)**2 + sp.diff(ga, gi)**2 + 2 * sp.diff(be, gi)**2 for gi in g))   # (7) of 11.29
    assert gradbudget == 4 * v11 + 4 * q20 + 2 * v22 + 2 * q31, "gradient budget formula (reviewer)"
    # --- T3 and T5 with polynomial profiles
    vv = sp.Symbol("v")
    ye = sum((ecoef[j] * A.P(A.y[j]) for j in range(n)), A.P(0)); yeb = A.conj(ye)
    Z = qb * a + q * x
    def of_V(expr):
        pc = Poly(expr, vv).all_coeffs()[::-1]; out = A.P(0); pw = A.P(1)
        for c in pc:
            out = out + c * pw; pw = pw * V
        return out
    for h in profiles:
        # k = (1 - u D)^(-1) h  (Neumann series; the polynomial solution of k - u k' = h)
        k = 0; term = h
        while term != 0:
            k += term; term = sp.expand(u * sp.diff(term, vv))
        k = sp.expand(k); assert sp.expand(k - u * sp.diff(k, vv) - h) == 0
        # cross-check: k(v) = E h(v + u tau)
        tau = sp.Symbol("tau", positive=True)
        assert sp.expand(sp.integrate(sp.exp(-tau) * h.subs(vv, vv + u * tau), (tau, 0, sp.oo)) - k) == 0
        lhs = A.E(yeb * q * of_V(h)); rhs = A.E(yeb * of_V(sp.diff(k, vv)) * Z)
        assert sp.simplify(lhs - rhs) == 0, f"T3 h={h}"
        if sp.im(sp.Poly(h, vv).LC()) == 0 and all(sp.im(c) == 0 for c in sp.Poly(h, vv).all_coeffs()) and sp.degree(h, vv) >= 1:
            phi = h; K = k; Bphi = K.subs(vv, 0)
            gam = sp.cancel((Bphi - K) / vv)
            lhs5 = Bphi - A.E(of_V(phi)); rhs5 = -A.E(x * of_V(sp.diff(K, vv))) + A.E(qb * qb * a * of_V(sp.diff(gam, vv)))
            assert sp.simplify(lhs5 - rhs5) == 0, f"T5 phi={phi}"
    if verbose:
        print(f"PASS {name}: n={n} u={u} delta={delta} chi={delta/u**2} ~ {float(delta/u**2):.4f}")
        print(f"      |P20Q|^2={q20} |P31Q|^2={q31} |x|^2={nx} |a|^2={A.n2(a)} |P11V|^2={v11} |P22V|^2={v22}")
        print(f"      budget(3)=E[(trD)^2+2|D|_F^2]={budget3}  vs 6delta={6*delta}: factor {float(6*delta/budget3):.4f}")
        print(f"      sum Var Gamma_ab={sumvar}  vs 3delta={3*delta}: factor {float(3*delta/sumvar):.4f}")
        print(f"      E sum|grad Gamma_ab|^2={gradbudget}  vs 12delta={12*delta}: factor {float(12*delta/gradbudget):.4f}   (budget (7) actually used in 11.29)")
        print(f"      (|a|^2+2|x|^2)/delta = {float((A.n2(a)+2*nx)/delta):.4f}")
        print(f"      Lean fluctuation_identity remainder / 2 = {sp.simplify(lean_rhs/2)} = |P31Q|^2 + 2|P22V|^2 = {q31 + 2*v22}")
    return dict(u=u, delta=delta, q20=q20, q31=q31, nx=nx, v11=v11, v22=v22)

if __name__ == "__main__":
    import time
    t0 = time.time()
    # sanity of the moment routine against the closed form
    for a_ in range(7):
        for b_ in range(7):
            assert m(a_, b_) == (factorial(a_) if a_ == b_ else 0), (a_, b_, m(a_, b_))
    print("moments from real Gaussians: E[y^a conj(y)^b] = delta_ab a!  (a, b <= 6) OK")
    v = sp.Symbol("v")
    profs = [sp.Integer(1), v, v**2, (1 + 2 * I) * v + I * v**2]
    # (i) Wick monomial, n = 1:  q = z(|z|^2-2)   (u = 2, delta = 168)
    r = check("Wick monomial z(|z|^2-2)", 1, [[[sp.Integer(1)]]], [sp.Integer(1)], profs + [v**3, 1 - v + v**3 / 3])
    assert r["delta"] == 168 and r["q20"] + r["q31"] == 96 + 32 - 32 + 0 or True
    assert (r["u"], r["delta"], r["q20"], r["q31"], r["nx"], r["v11"], r["v22"]) == (2, 168, 32, 96, 20, 36, 100)
    # (ii) two variables, all six basis directions, Gaussian-rational coefficients
    rng = random.Random(20261117)
    def rf(n, dens=1.0):
        f = [[[sp.Integer(0)] * n for _ in range(n)] for _ in range(n)]
        for a_ in range(n):
            for b_ in range(a_, n):
                for c_ in range(n):
                    if rng.random() > dens: continue
                    val = Rational(rng.randint(-4, 4), rng.randint(1, 3)) + I * Rational(rng.randint(-4, 4), rng.randint(1, 3))
                    f[a_][b_][c_] = val; f[b_][a_][c_] = val
        return f
    check("random cubic A", 2, rf(2), [Rational(1, 2) + I, Rational(-2, 3)], profs)
    check("random cubic B", 2, rf(2), [sp.Integer(1), I], profs[:3])
    # the zero-P31 example  q = y0^2 conj(y1): equality in ||a||^2 + 2||x||^2 <= delta
    f = [[[sp.Integer(0)] * 2 for _ in range(2)] for _ in range(2)]; f[0][0][1] = sp.Integer(1)
    r = check("y0^2 conj(y1) (P31 q^2 = 0)", 2, f, [sp.Integer(1), sp.Integer(1)], profs[:3])
    assert r["q31"] == 0
    # (iii) three variables, sparse
    check("random cubic C (n=3, sparse)", 3, rf(3, 0.45), [sp.Integer(1), I, Rational(1, 2)], profs[:2])
    print("ALL REVIEWER EXACT CHECKS PASSED in %.1f s" % (time.time() - t0))

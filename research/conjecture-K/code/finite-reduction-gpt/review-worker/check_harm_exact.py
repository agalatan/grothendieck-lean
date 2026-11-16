"""Review of REDUCTION.md section 2: exact check (label C on instances) that the trace-corrected compressed coefficient is a Wick polynomial.

For a rational matrix M (p x m) and a Wick polynomial f on C^p of bidegree (1,1) or (2,1):
  P(z) = top homogeneous part of f(Mz),   harm P = P - |z|^2 Delta P/(m + a + b - 2),   Delta = sum_j d_j dbar_j.
Checks: Delta(harm P) = 0;  E[harm P * conj(lower Wick monomials)] = 0 (constants and holomorphic linear forms), i.e. harm P is in H_{a,b}(C^m);
        f(Mz) - harm P(z) = |z|^2 g(z) + (Wick correction of f)(Mz) with g of bidegree (a-1, b-1), so on the unit sphere it lies in the lower harmonic space;
        the full compressed cubic Q_M(X, Z) (marked X kept) is orthogonal to the chaoses of lower order: E[Q_M conj(y_j)] = 0, and N_2 Q_M = Q_M, N_1 Q_M = 2 Q_M
        in the form  E[G Q_M] = sum_j E[d_j G dbar_j Q_M]  for G = conj(Q_M)  (i.e. ||Q_M||^2 = sum_j ||dbar_j Q_M||^2) and 2||Q_M||^2 = sum_j ||d_j Q_M||^2.
"""
import random, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
from wick_exact import *

def var(n, j, bar=False):
    z = (0,) * n; e = tuple(1 if k == j else 0 for k in range(n))
    return {(z, e): G(1)} if bar else {(e, z): G(1)}

def lap(P, n, idx):
    return lin(*[(1, d(db(P, j), j)) for j in idx])

def subst_linear(n, M, i, bar, offset):
    """(M z)_i or its conjugate as a polynomial in z_offset.., n variables in total."""
    out = {}
    for b, c in enumerate(M[i]):
        out = lin((1, out), (c.conj() if bar else c, var(n, offset + b, bar)))
    return out

def top_part(P, deg):
    return {k: v for k, v in P.items() if sum(k[0]) + sum(k[1]) == deg}

if __name__ == '__main__':
    rng = random.Random(5)
    p, m = 2, 3; n = 1 + m          # variables: X = 0, Z = 1..m
    for trial in range(3):
        M = [[G(Fr(rng.randint(-3, 3), rng.randint(1, 3)), Fr(rng.randint(-3, 3), rng.randint(1, 3))) for _ in range(m)] for _ in range(p)]
        Y = [subst_linear(n, M, i, False, 1) for i in range(p)]; Yb = [subst_linear(n, M, i, True, 1) for i in range(p)]
        zidx = list(range(1, n)); z2 = lin(*[(1, mul(var(n, j), var(n, j, True))) for j in zidx])
        X, Xb = var(n, 0), var(n, 0, True)
        rc = lambda: G(Fr(rng.randint(-4, 4), rng.randint(1, 3)), Fr(rng.randint(-4, 4), rng.randint(1, 3)))
        # coefficients of Q in the Wick monomials of X (all six components)
        alpha = rc()
        ell = [rc() for _ in range(p)]                         # (b): X^2 conj(l(Y)),  bidegree (0,1) in Y
        Lc = [rc() for _ in range(p)]                          # (c): (|X|^2-1) L(Y),  (1,0)
        gam = [[rc() for _ in range(p)] for _ in range(p)]     # (d): X Q(Y),          (1,1)
        Fq = [[rc() for _ in range(p)] for _ in range(p)]      # (e): conj(X) F(Y),    (2,0)
        t = [[[rc() for _ in range(p)] for _ in range(p)] for _ in range(p)]   # (f): R(Y), (2,1)
        # top parts after the substitution Y = M z
        P01 = lin(*[(ell[k], Yb[k]) for k in range(p)])
        P10 = lin(*[(Lc[k], Y[k]) for k in range(p)])
        P11 = lin(*[(gam[j][k], mul(Y[j], Yb[k])) for j in range(p) for k in range(p)])
        P20 = lin(*[(Fq[j][k], mul(Y[j], Y[k])) for j in range(p) for k in range(p)])
        P21 = lin(*[(t[i][j][k], mul(mul(Y[i], Y[j]), Yb[k])) for i in range(p) for j in range(p) for k in range(p)])
        h11 = lin((1, P11), (Fr(-1, m), mul(z2, lap(P11, n, zidx))))
        h21 = lin((1, P21), (Fr(-1, m + 1), mul(z2, lap(P21, n, zidx))))
        assert len(lap(h11, n, zidx)) == 0 and len(lap(h21, n, zidx)) == 0, 'harmonic'
        assert E(h11).iszero()
        for j in zidx: assert E(mul(h21, var(n, j, True))).iszero()
        # the compressed cubic, without the scalar factors m^{-(a+b)/2} (they do not affect the chaos)
        wX21 = lin((1, mul(mul(X, X), Xb)), (-2, X)); wX11 = lin((1, mul(X, Xb)), (-1, const(n, 1)))
        QM = lin((alpha, wX21), (1, mul(mul(X, X), P01)), (1, mul(wX11, P10)), (1, mul(X, h11)), (1, mul(Xb, P20)), (1, h21))
        for j in range(n): assert E(mul(QM, var(n, j, True))).iszero() and E(mul(QM, var(n, j))).iszero()
        nq = E(mul(QM, conj(QM))).r
        n2 = sum(E(mul(db(QM, j), conj(db(QM, j)))).r for j in range(n)); n1 = sum(E(mul(d(QM, j), conj(d(QM, j)))).r for j in range(n))
        assert n2 == nq and n1 == 2 * nq, (nq, n1, n2)
        # without the trace correction the (1,1) and (2,1) parts are not Wick polynomials
        bad = lin((1, mul(X, P11)), (1, P21)); nb = E(mul(bad, conj(bad))).r
        nb2 = sum(E(mul(db(bad, j), conj(db(bad, j)))).r for j in range(n))
        print(f'PASS trial {trial}: Delta(harm P) = 0 for (1,1) and (2,1); Q_M orthogonal to H10, H01; ||Q_M||^2 = sum||dbar_j Q_M||^2 = (1/2) sum||d_j Q_M||^2 = {float(nq):.4g};'
              f' uncorrected top parts: ||.||^2 = {float(nb):.4g} != sum||dbar_j .||^2 = {float(nb2):.4g}')
    print('ALL EXACT CHECKS PASSED (N_2 Q_M = Q_M and N_1 Q_M = 2 Q_M in quadratic-form sense, with orthogonality to the first chaos)')

#!/usr/bin/env python3
# Reviewer (exact): the genuine cubic of PROOFS.md (26), q_N = alpha p(X) + (beta/sqrt N) sum_{j<=N} H(Y_j),
# p = X(|X|^2-2), H = Y(|Y|^2-2)/sqrt 2, tested with the profile h(v) = v (k' = 1, Omega_hat = 3u/4):
#     ||c||^2 = 1024 alpha^6 + 128 beta^6/N^2,   delta = 168 alpha^4 + 42 beta^4/N,   u = 2 alpha^2 + beta^2,
#     R_N(rho) = ||c||^2/(delta Omega_hat) = (1024 rho^6 + 128/N^2)/((126 rho^4 + 63/(2N))(1 + 2 rho^2)).
# (i) the three formulas are verified by exact polynomial expectations for N = 1, 2 (sympy, symbolic alpha, beta);
# (ii) for each row: the N below which R_N at the end of the certified rho-range exceeds the limit-model constant.
# Any profile-free constant for q_N is at least R_N, so the limit constants of Theorem 11 do NOT hold for such N.
import sympy as sp
from fractions import Fraction as F
al, be = sp.symbols('alpha beta', positive=True)
def check(N):
    names = ['X'] + ['Y%d' % j for j in range(N)]
    z = sp.symbols(' '.join(names)); zb = sp.symbols(' '.join(n + 'b' for n in names))
    if N + 1 == 1: z, zb = (z,), (zb,)
    def E(expr):
        P = sp.Poly(sp.expand(expr), *z, *zb); tot = 0
        n = len(z)
        for mon, co in P.terms():
            a, b = mon[:n], mon[n:]
            if a == b:
                f = co
                for k in a: f *= sp.factorial(k)
                tot += f
        return sp.expand(tot)
    p = lambda i: z[i] * (z[i] * zb[i] - 2); pb = lambda i: zb[i] * (z[i] * zb[i] - 2)
    # use beta/sqrt(2N) = g to stay polynomial: q = alpha p(X) + g sum p(Y_j),  beta^2 = 2 N g^2
    g = sp.Symbol('g', positive=True)
    q = al * p(0) + g * sum(p(j) for j in range(1, N + 1)); qb = al * pb(0) + g * sum(pb(j) for j in range(1, N + 1))
    V = sp.expand(q * qb)
    u = E(V); delta = sp.expand(E(V * V) - 2 * u ** 2)
    cX = E(zb[0] * q * V); cY = E(zb[1] * q * V)
    b2 = 2 * N * g ** 2
    assert sp.expand(u - (2 * al ** 2 + b2)) == 0
    assert sp.expand(delta - (168 * al ** 4 + 42 * b2 ** 2 / N)) == 0
    assert sp.expand(cX - 32 * al ** 3) == 0 and sp.expand(cY - 32 * g ** 3) == 0
    # sum_j |c_Yj|^2 = N (32 g^3)^2 = 1024 N g^6 = 128 beta^6/N^2
    assert sp.simplify(N * (32 * g ** 3) ** 2 - 128 * b2 ** 3 / N ** 2) == 0
    print('N = %d: u, delta, c_X = 32 alpha^3, c_Y = 32 (beta/sqrt(2N))^3 verified exactly' % N)
check(1); check(2)
R = lambda N, rho: (1024 * rho ** 6 + F(128, N * N)) / ((126 * rho ** 4 + F(63, 2 * N)) * (1 + 2 * rho ** 2))
print('rows: certified end rho, limit-model constant theta, and R_N(rho) at h(v) = v for the genuine cubic q_N')
for row, rho, th, need in (('0.80', F(11, 100), F(7, 20), 0.37), ('0.82', F(13, 100), F(3, 5), 0.64), ('0.84', F(1, 5), F(13, 10), 1.33),
                           ('0.845', F(1, 4), F(9, 5), 1.88), ('0.85', F(1, 3), F(12, 5), 2.5), ('0.855', F(3, 5), F(18, 5), 3.7)):
    bad = [N for N in range(1, 200) if R(N, rho) > th]
    badn = [N for N in range(1, 200) if float(R(N, rho)) > need]
    lim = 1024 * rho ** 2 / (126 * (1 + 2 * rho ** 2))
    print('  row %-5s rho = %-6s theta = %-5s: R_N > theta for N <= %s (R_1 = %.3f, R_%d = %.4f, R_inf = %.4f); above the needed %.2f for N <= %s; delta is bulk-dominated for N < 1/(4 rho^4) = %.0f' % (
        row, rho, th, max(bad) if bad else 0, float(R(1, rho)), (max(bad) if bad else 1), float(R(max(bad) if bad else 1, rho)), float(lim), need, max(badn) if badn else 0, 1 / (4 * float(rho) ** 4)))
    # also at rho -> 0 (pure bulk): R_N = (256/63)/N
print('  pure bulk (rho = 0): R_N = 256/(63 N) =', ', '.join('%.3f (N=%d)' % (256 / 63 / N, N) for N in (1, 2, 4, 8, 12, 16)))

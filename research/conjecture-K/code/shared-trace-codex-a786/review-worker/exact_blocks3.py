# Review of codex-a786's third content-law package (review worker of claude-b9ee, 16 Nov 2026).
# Own exact rational checks (C) on shared matrix blocks, with own moment code (Gamma moments, generating functions):
#   q = sum_j a_j Q_{d_j, lam_j} + a_0 W,   Q_{d,lam} = Y^*GY - tr G + sqrt(lam) sum conj(Z_ab) Y_a Y_b,   W = U V conj(Z) (E D^k = (k!)^2).
#   Given the Y_j: q ~ CN(0, A), A = sum_j a_j^2 A_j(S_j) + a_0^2 D, A_j(S) = (1 + lam) S^2 - 2S + d, S_j ~ Gamma(d_j, 1).
#   trace-coordinate content for h = v^n:    c_j = (a_j/sqrt(d_j)) (n+1)! E[(S_j - d_j) A^n]                  (the package's (11))
#   signed pairing for k' = v^n:             c_j = (a_j/sqrt(d_j)) (n+1)! E[A^n N_j],  N_j = (S_j - d_j)(A - u) + a_j^2 S_j A_j'(S_j)   ((14))
# Checks: u and delta against the eight models stored in results/replay.json; (11) = (14) on polynomial profiles;
# the inequality with Theta = max Theta_{d_j}; the exact supremum of the ratio over polynomial profiles of bounded degree.
# usage: exact_blocks3.py <results/replay.json of the package>
import sys, json
from fractions import Fraction as Fr
from math import factorial, comb
import mpmath as mp

def ok(cond, msg):
    print(('  ok   ' if cond else '  FAIL ') + msg); assert cond, msg

def rising(d, k):
    r = 1
    for j in range(k): r *= d + j
    return r
def pmul(a, b):
    r = [Fr(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): r[i + j] += x * y
    return r
def theta_d(d):
    pol = Fr(d ** 4 - d ** 3 + 30 * d * d + 6 * d + 4, 6 * d * d * (2 * d * d + d + 1))
    return pol if d < 4 else min(pol, Fr(20 * d ** 3 - 51 * d * d + 28 * d - 4, 3 * d * (d - 2) * (d - 1) * (2 * d * d + d + 1)))

class Model:
    def __init__(self, blocks, a0=0):
        """blocks: list of (d, a, lam)."""
        self.blocks = [(d, Fr(a), Fr(lam)) for d, a, lam in blocks]; self.a0 = Fr(a0)
        self.u = sum(a * a * (d * d + lam * d * (d + 1)) for d, a, lam in self.blocks) + self.a0 ** 2
        L = lambda d, lam: 2 * d * ((2 * d * d + d + 1) + (4 * d * d + 6 * d + 2) * lam + (2 * d * d + 5 * d + 3) * lam * lam)
        self.delta = sum(2 * a ** 4 * L(d, lam) for d, a, lam in self.blocks) + 6 * self.a0 ** 4
        self.theta = max(theta_d(d) for d, a, lam in self.blocks if a != 0)
    def _egf(self, mark, N):
        """coefficients of E[A^n g_mark]/n!, n <= N; mark = (j, poly in S multiplying the j-th block) or None."""
        prod = [Fr(1)] + [Fr(0)] * N
        mul = lambda p, e: [sum(p[i] * e[k - i] for i in range(k + 1)) for k in range(N + 1)]
        for j, (d, a, lam) in enumerate(self.blocks):
            Aj = [Fr(d), Fr(-2), 1 + lam]; g = mark[1] if (mark and mark[0] == j) else [Fr(1)]
            e = []; pw = [Fr(1)]
            for c in range(N + 1):
                poly = pmul(pw, g); e.append(a ** (2 * c) * sum(co * rising(d, k) for k, co in enumerate(poly)) / factorial(c)); pw = pmul(pw, Aj)
            prod = mul(prod, e)
        return mul(prod, [self.a0 ** (2 * c) * factorial(c) for c in range(N + 1)])            # E D^c/c! = c!
    def EA(self, n, mark=None): return factorial(n) * self._egf(mark, n)[n]
    def EV(self, n): return factorial(n) * self.EA(n)
    def cdir(self, j, n):                         # sqrt(d_j)/a_j times the content of h = v^n
        d = self.blocks[j][0]; return factorial(n + 1) * self.EA(n, (j, [Fr(-d), Fr(1)]))
    def cpair(self, j, n):                        # sqrt(d_j)/a_j times <pairing with k' = v^n>
        d, a, lam = self.blocks[j]
        # N_j = (S - d)(A - u) + a^2 S A_j'(S):  E[A^n (S-d) A] - u E[A^n (S-d)] + a^2 E[A^n S (2(1+lam) S - 2)]
        return factorial(n + 1) * (self.EA(n + 1, (j, [Fr(-d), Fr(1)])) - self.u * self.EA(n, (j, [Fr(-d), Fr(1)])) + a * a * self.EA(n, (j, [Fr(0), Fr(-2), 2 * (1 + lam)])))
    def kprime(self, h):
        u = self.u; dd = len(h); k = [Fr(0)] * dd
        for n in range(dd):
            for j in range(n + 1): k[j] += Fr(h[n]) * Fr(factorial(n), factorial(j)) * u ** (n - j)
        return [k[j + 1] * (j + 1) for j in range(dd - 1)]
    def evaluate(self, h):
        kp = self.kprime(h); r = len(self.blocks)
        direct = [sum(Fr(h[n]) * self.cdir(j, n) for n in range(len(h))) for j in range(r)]
        pairing = [sum(kp[n] * self.cpair(j, n) for n in range(len(kp))) for j in range(r)]
        n2 = sum(self.blocks[j][1] ** 2 / self.blocks[j][0] * direct[j] ** 2 for j in range(r))
        g = sum(kp[i] * kp[j] * self.EV(i + j + 1) for i in range(len(kp)) for j in range(len(kp))); mean = sum(kp[i] * self.EV(i + 1) for i in range(len(kp)))
        om = Fr(3, 2) * g - Fr(3, 4) * mean ** 2 / self.u
        return direct, pairing, n2, om
    def poly_sup(self, n):
        u = self.u; r = len(self.blocks)
        C = [[Fr(1, j + 1) * self.cdir(i, j + 1) - u * self.cdir(i, j) for j in range(n)] for i in range(r)]
        Q = [[Fr(3, 2) * self.EV(i + j + 1) - Fr(3, 4) * self.EV(i + 1) * self.EV(j + 1) / u for j in range(n)] for i in range(n)]
        mp.mp.dps = 80; f = lambda x: mp.mpf(x.numerator) / x.denominator
        Cm = mp.matrix([[f(x) * mp.sqrt(f(self.blocks[i][1] ** 2 / self.blocks[i][0])) for x in row] for i, row in enumerate(C)]); Qm = mp.matrix([[f(x) for x in row] for row in Q])
        Gm = Cm * mp.inverse(mp.cholesky(Qm)).T
        ev = mp.eigsy(Gm * Gm.T, eigvals_only=True) if r > 1 else [sum(x * x for x in Gm)]
        return float(max(ev) / f(self.delta))

stored = json.load(open(sys.argv[1]))['wickModels']
mine = [Model([(2, 1, 0)]), Model([(3, 1, 0)]), Model([(2, 1, 0), (3, Fr(1, 2), 0)], Fr(2, 3)), Model([(4, Fr(2, 3), 0)], Fr(1, 4)), Model([(3, Fr(1, 2), 0), (3, Fr(3, 2), 0)], Fr(1, 3)),
        Model([(2, 1, 1)]), Model([(3, 1, 4)]), Model([(3, 1, Fr(1, 4)), (4, Fr(1, 3), 1)], Fr(1, 2))]
print('1. the eight models of results/replay.json (lam = square of the holomorphic amplitude)')
for M, st in zip(mine, stored):
    same = (str(M.u) == st['u'] and str(M.delta) == st['delta'] and [str(b[2]) for b in M.blocks] == st['sharedHolomorphicLambda'] and [b[0] for b in M.blocks] == st['dimensions'])
    assert same and M.EV(1) == M.u and M.EV(2) - 2 * M.u ** 2 == M.delta, (st, M.u, M.delta)
ok(True, 'u and delta of all eight stored models reproduced exactly; E V = u, E V^2 - 2u^2 = delta by own moment code')
print('2. content (11) = signed pairing (14), and the inequality, on polynomial profiles')
nchk = 0; worst = Fr(0)
for M in mine:
    for h in ([0, 1], [0, 0, 1], [0, 0, 0, 1], [1, -2, 3], [0, 1, 0, -1], [1, 0, 0, 0, 1], [3, -2, Fr(1, 7), Fr(-1, 100)]):
        direct, pairing, n2, om = M.evaluate(h)
        assert direct == pairing and om >= 0 and n2 <= M.theta * M.delta * om; nchk += len(direct)
        if h == [0, 1]:
            assert n2 == sum(16 * a ** 6 * (d * d + lam * d * (d + 1)) ** 2 / d for d, a, lam in M.blocks) and om == Fr(3, 4) * M.u
        if om: worst = max(worst, n2 / (M.theta * M.delta * om))
ok(True, '%d coordinate checks of (11) = (14), 56 instances of the inequality (largest ratio/Theta = %.4f); h = v gives ||c||^2 = 16 sum a_j^6 u_j^2/d_j' % (nchk, float(worst)))
print('3. supremum of ||c||^2/(delta Omhat) over polynomial profiles, deg k\' <= 0 (h = v), 2, 5; proved Theta')
for name, M in (('Q_2', Model([(2, 1, 0)])), ('Q_3', Model([(3, 1, 0)])), ('Q_4', Model([(4, 1, 0)])), ('Q_5', Model([(5, 1, 0)])), ('Q_8', Model([(8, 1, 0)])),
                ('Q_2, lam = 1', Model([(2, 1, 1)])), ('Q_3, lam = 4', Model([(3, 1, 4)])), ('Q_2 + Q_3 (equal energies)', Model([(2, Fr(3, 2), 0), (3, 1, 0)])),
                ('2 x Q_2 + bulk', Model([(2, 1, 0), (2, 1, 0)], 2)), ('Q_3 + Q_4 lam = 1 + bulk', Model([(3, 1, Fr(1, 4)), (4, Fr(1, 3), 1)], Fr(1, 2)))):
    s1, s3, s6 = M.poly_sup(1), M.poly_sup(3), M.poly_sup(6)
    ok(s1 <= s3 * (1 + 1e-12) <= s6 * (1 + 1e-12) and s6 <= float(M.theta), '   %-28s chi %.4f | %.6f | %.6f | %.6f | Theta = %s = %.6f (Theta/sup = %.3f)' % (name, float(M.delta / M.u ** 2), s1, s3, s6, M.theta, float(M.theta), float(M.theta) / s6))
print('4. reviewer\'s remark: the proof and the formula Theta^pol extend to d = 1, Q_1 = X(|Y|^2 - 1), with Theta_1 = 5/3')
#    N_1 = S^2 (S - 1), R_1 = (S - 1)^2: N_1^2/R_1 = S^4 (B_1 = 24, the remainder of (21) vanishes), (S - 1)^2/R_1 = 1 (b_1 = 1), L_1 = 8.
ok(theta_d(1) == Fr(24 + 16, 3 * 8) == Fr(5, 3) and Fr(1, 3) <= Fr(5, 3), 'Theta^pol_1 = (B_1 + 16)/(3 L_1) = 40/24 = 5/3; second requirement b_1/3 = 1/3')
ONE = [Model([(1, 1, 0)]), Model([(1, 1, 0), (1, 2, 0)]), Model([(1, 1, 0), (1, 1, 0), (1, Fr(1, 2), 0)], Fr(3, 2)), Model([(1, 1, 0), (2, 1, 0), (3, Fr(1, 2), 0)], 1), Model([(1, 2, 0), (4, Fr(1, 3), 1)], Fr(1, 2))]
ok(ONE[0].u == 1 and ONE[0].delta == 16, 'Q_1: u = 1, delta = 16 (chi = 16)')
nchk = 0; worst = Fr(0)
for M in ONE:
    assert M.theta == Fr(5, 3)
    for h in ([0, 1], [0, 0, 1], [0, 0, 0, 1], [1, -2, 3], [0, 1, 0, -1], [1, 0, 0, 0, 1], [3, -2, Fr(1, 7), Fr(-1, 100)]):
        direct, pairing, n2, om = M.evaluate(h); assert direct == pairing and n2 <= M.theta * M.delta * om; nchk += 1
        if om: worst = max(worst, n2 / (M.theta * M.delta * om))
ok(True, '%d instances with blocks of dimension 1 (alone, several, with bulk, mixed with d = 2, 3, 4): (11) = (14) and the inequality with 5/3 (largest ratio/Theta = %.4f)' % (nchk, float(worst)))
for name, M in (('Q_1', ONE[0]), ('Q_1 + Q_1 (a = 1, 2)', ONE[1]), ('3 x Q_1 + bulk', ONE[2]), ('Q_1 + Q_2 + Q_3 + bulk', ONE[3])):
    s1, s6 = M.poly_sup(1), M.poly_sup(6)
    ok(s1 <= s6 * (1 + 1e-12) and s6 <= float(M.theta), '   %-28s chi %.4f | h = v %.6f | polynomial sup (deg k\' <= 5) %.6f | 5/3 = 1.666667' % (name, float(M.delta / M.u ** 2), s1, s6))
print('5. d = 1 and the tangent divergence of the signed-pairing package (higher-degree ledger 4.21), exact')
#    q = X (S - 1), S = |Y|^2, T = |X|^2 (both Exp(1)); Z = X (2 T S - 1) (6.3.23); N = X (2 P^2 + 4 C - 4 T C), P = S - 1, C = S;
#    the trace representative of this package at d = 1 is Z_1 = q N_1/R_1 = X S^2.
import sympy as sp
T, S = sp.symbols('T S')
def E(expr):
    return sum(c * sp.factorial(a) * sp.factorial(b) for (a, b), c in sp.Poly(sp.expand(expr), T, S).terms())
z = 2 * T * S - 1; n = 2 * (S - 1) ** 2 + 4 * S - 4 * T * S; z1 = S ** 2
ok(sp.expand(z + n / 2 - z1) == 0, 'X S^2 = Z + N/2: the trace representative at d = 1 is Z plus half the tangent divergence')
ZZ, ZN, NN = E(T * z * z), E(T * z * n), E(T * n * n)
ok((ZZ, ZN, NN) == (41, -38, 84) and E(T * (S - 1) * n) == 0 and E(T * (S - 1) * z) == 4, '||Z||^2 = 41, <Z, N> = -38, ||N||^2 = 84, <N, q> = 0, <Z, q> = 4')
th = lambda t: sp.Rational(2, 48) * (ZZ + 2 * t * ZN + t * t * NN + 16)
ok(th(0) == sp.Rational(19, 8) and th(sp.Rational(1, 2)) == sp.Rational(5, 3) and th(sp.Rational(19, 42)) == sp.Rational(209, 126),
   'theta(Z) = 19/8, theta(Z + N/2) = 5/3 (this package at d = 1), theta(Z + (19/42) N) = 209/126 (the best multiple, ledger 4.21)')
dd = sp.symbols('d', positive=True)
ok(sp.simplify((S ** 2 - 2 * S + dd) - (S - dd) ** 2 / dd - (1 - 1 / dd) * S ** 2) == 0, 'R_d(S) = (S - d)^2/d + (1 - 1/d) S^2: trace part plus traceless part of the conditional variance')
print('ALL CHECKS PASSED')

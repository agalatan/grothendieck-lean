# Review of codex-a786's second content-law package ("blocks"), by a review worker of claude-b9ee, 16 Nov 2026.
# Own exact checks (label C for my own arithmetic; they corroborate, they do not replace the re-derivation on paper).
#   A1  the identities behind (12)-(14), (20), (31a)                     [sympy, symbolic]
#   A2  every constant of PROOFS.md sections 4-5 and INTERVAL_PROOF.md section 4, thresholds with minimality   [Fractions]
#   A3  own exact multi-block polynomial instances (moments by convolution over the eigenvalues, not by the package's
#       cumulant recursion); comparison with the nine examples stored in results_exact.json; the balanced identity (14)
#   A4  the supremum of ||c||^2/(delta Omhat) over polynomial profiles of bounded degree for multi-block cubics
#       (exact matrices, eigenvalue in 60-digit arithmetic), against the proved constants: the test of "no factor r"
#   A5  COORDINATE_OBSTRUCTION formula (1) on random rational subspaces, by the projector formula
#       ||E[q_m | F_E]||^2 = (1/m) sum_{j,l>=1} (Pi_00 Pi_jl^2 + Pi_0l Pi_j0 Pi_jl)
# usage: exact_checks2.py <results_exact.json of the package>
import sys, json, math, random
from fractions import Fraction as Fr
from math import comb, factorial
import sympy as sp
import mpmath as mp
from scipy.optimize import brentq

def ok(cond, msg):
    print(('  ok   ' if cond else '  FAIL ') + msg); assert cond, msg

# ------------------------------------------------------------------------------------------------------------- A1
print('A1. symbolic identities')
T, b, rho, Bv, Pv, Cv, Av = sp.symbols('T b rho B P C A', positive=True)
ET = lambda f: sp.integrate(sp.expand(f) * sp.exp(-T), (T, 0, sp.oo))
H = 2 + (T - 2) * b
ok(sp.simplify(ET(T * (2 * H - 1) ** 2) - (9 + 8 * b ** 2)) == 0 and sp.simplify(ET(T * H ** 2) - (4 + 2 * b ** 2)) == 0 and sp.simplify(ET(T * H) - 2) == 0,
   '(20): E_T[T(2H-1)^2] = 9 + 8b^2, E_T[T H^2] = 4 + 2b^2, E_T[T H] = 2   (H = 2 + (T-2)b)')
ok(sp.simplify(ET(4 * T * H * (2 * H - 1)) - (24 + 16 * b ** 2)) == 0 and sp.simplify(ET(4 * T * H ** 2) - (16 + 8 * b ** 2)) == 0,
   '(31a): the cross and square coefficients are 24 + 16b^2 and 16 + 8b^2')
# (12) + (13) = (14):  with C/A = 1 - b,  rho R = A b:
lhs = Pv * (2 * rho * Bv * T - 1) + Pv * Cv * (1 + 2 * rho * Bv / Av * (2 - T))
rhs = rho * (2 * H * Pv * Bv - Pv) + Pv * (Cv - (1 - rho))
ok(sp.simplify((lhs - rhs).subs(Cv, Av * (1 - b))) == 0, '(12) + (13) = (14) pointwise, using C_i = A(1 - b_i), E C_i = 1 - rho_i')
n = sp.symbols('n', integer=True, nonnegative=True)
for k in range(0, 7):   # E_T[T(2-T) f(cT)] = -c E_T[T^2 f'(cT)] for f = v^k  (the exponential integration by parts in (13))
    assert 2 * factorial(k + 1) - factorial(k + 2) == -k * factorial(k + 1)
ok(True, 'E_T[T(2-T)T^k] = -k E_T[T^(k+1)] for k = 0..6 (the T-integration by parts behind (13), on monomials)')

# ------------------------------------------------------------------------------------------------------------- A2
print('A2. constants')
def theta_general(K, M, a2): return Fr(2, 3) * (K + 16 * M) + a2 / 3
# (27) at kappa0 = 1/64 and 1/576 with the stated radical bounds
k0 = Fr(1, 64); a2 = Fr(1, 4)
ok(4 * 17 * a2 * 24 * k0 == Fr(51, 8) and Fr(81, 32) ** 2 > Fr(51, 8), 'kappa <= 1/64: 2 sqrt(17 alpha^2 24 kappa) = sqrt(51/8) < 81/32')
th64 = theta_general((17 * a2 + Fr(81, 32) + 24 * k0) / (4 + 12 * k0), k0 / (4 + 12 * k0), a2)
ok(th64 == Fr(1015, 804) and th64 < Fr(13, 10), '   theta = 79/67 + 1/12 = 1015/804 = %.6f < 13/10' % float(th64))
k0 = Fr(1, 576); a2 = Fr(1, 12)
ok(4 * 17 * a2 * 24 * k0 == Fr(17, 72) and Fr(35, 72) ** 2 > Fr(17, 72), 'kappa <= 1/576: 2 sqrt(17 alpha^2 24 kappa) = sqrt(17/72) < 35/72')
th576 = theta_general((17 * a2 + Fr(35, 72) + 24 * k0) / (4 + 12 * k0), k0 / (4 + 12 * k0), a2)
ok(th576 == Fr(2465, 6948) and th576 < Fr(37, 100), '   theta = 568/1737 + 1/36 = 2465/6948 = %.6f < 37/100' % float(th576))
F = lambda x: 2 / (3 * (4 + 12 * x)) * (34 * math.sqrt(x) + 40 * x + 2 * math.sqrt(816) * x ** 0.75) + 2 * math.sqrt(x) / 3
print('         (27) in floating point: F(1/64) = %.6f, F(1/576) = %.6f; F reaches 0.37, 0.64, 1.33, 1.88, 2.5 at kappa = %s' % (
    F(1 / 64), F(1 / 576), ', '.join('1/%.1f' % (1 / brentq(lambda x: F(x) - tg, 1e-9, 1 / 3)) for tg in (0.37, 0.64, 1.33, 1.88, 2.5))))
xs = sp.symbols('x', positive=True)
for p_ in (sp.Rational(1, 2), sp.Rational(3, 4), 1):
    d = sp.simplify(sp.diff(xs ** p_ / (4 + 12 * xs), xs) * (4 + 12 * xs) ** 2 / xs ** (p_ - 1))          # = 4p + 12(p-1)x
    assert sp.simplify(d - (4 * p_ + 12 * (p_ - 1) * xs)) == 0 and d.subs(xs, sp.Rational(1, 3)) >= 0
ok(True, 'x^p/(4+12x) increases on [0, 1/3] for p = 1/2, 3/4, 1 (derivative has the sign of 4p + 12(p-1)x)')
# (31b), (31), rank one
ok(Fr(5, 6) ** 2 > Fr(2, 3) and Fr(34, 3) + 24 + 8 * Fr(5, 6) == 42, '(31b): 17(2/3) + 24 + 8 sqrt(2/3) <= 34/3 + 24 + 20/3 = 42')
th_an = lambda m: Fr(39, 16) if m == 1 else Fr(29, 3 * (m + 3)) + Fr(2, 9 * m)
m_ = sp.symbols('m', positive=True)
ok(sp.simplify(sp.Rational(2, 3) * (sp.Rational(42, 4) / (m_ + 3) + sp.Rational(16, 4) / (m_ + 3)) + sp.Rational(2, 9) / m_ - (sp.Rational(29, 3) / (m_ + 3) + sp.Rational(2, 9) / m_)) == 0,
   '(31): (2/3)(42 + 16)/(4(m+3)) + 2/(9m) = 29/(3(m+3)) + 2/(9m)')
ok(Fr(3, 2) ** 2 > 2 and Fr(17, 2) + 24 + 4 * Fr(3, 2) == Fr(77, 2) and Fr(49, 18) ** 2 < 8 and theta_general(Fr(77, 32), Fr(1, 16), Fr(1, 2)) == Fr(39, 16)
   and Fr(42, 20) <= Fr(77, 32) and Fr(1, 20) <= Fr(1, 16) and Fr(1, 3) <= Fr(1, 2), 'rank one: L_1 <= 17/2 + 24 + 4 sqrt2 < 77/2, theta = (2/3)(77/32 + 1) + 1/6 = 39/16, and m >= 2 is covered by it')
targets = [('0.80', Fr(37, 100)), ('0.82', Fr(16, 25)), ('0.84', Fr(133, 100)), ('0.845', Fr(47, 25)), ('0.85', Fr(5, 2)), ('0.855', Fr(37, 10))]
# the analytic bound valid for every rank >= m: max over m' >= m of th_an(m') (th_an is decreasing from m = 2, and th_an(1) covers all)
an_valid = lambda m: Fr(39, 16) if m == 1 else min(Fr(39, 16), th_an(m))
ok(all(th_an(k + 1) < th_an(k) for k in range(2, 400)), 'the analytic bound 29/(3(m+3)) + 2/(9m) decreases in m')
need_an = [min(m for m in range(1, 200) if an_valid(m) < tg) for _, tg in targets]
ok(need_an == [24, 13, 5, 3, 1, 1], 'analytic minimum ranks for the six targets: %s (PROOFS section 5: 24, 13, 5, 3, 1, 1), with minimality' % need_an)
ok([an_valid(m) for m in need_an] == [Fr(119, 324), Fr(1163, 1872), Fr(451, 360), Fr(91, 54), Fr(39, 16), Fr(39, 16)], 'their constants: 119/324, 1163/1872, 451/360, 91/54, 39/16, 39/16')
# INTERVAL_PROOF section 4 (taking the twelve certified bounds on alpha_m^2 as given)
cert = {2: Fr(21, 100), 3: Fr(21, 100), 4: Fr(11, 100), 5: Fr(11, 100), 6: Fr(11, 100), 12: Fr(11, 250), 13: Fr(1, 20), 23: Fr(3, 125), 24: Fr(3, 125), 25: Fr(3, 125), 26: Fr(3, 125), 27: Fr(3, 125)}
a2_bound = lambda m: min(cert.get(m, Fr(1)), Fr(2, 3 * m))                    # best available bound on alpha_m^2
def consequence(m0, root_bound):
    """constant valid for all ranks >= m0: K from the certified alpha at m0 (with the stated rational bound on sqrt(alpha^2/m0)),
    the analytic K for larger ranks, a^2 = sup over ranks >= m0 of the best bound, M = 1/(4(m0+3))."""
    assert root_bound ** 2 > cert[m0] / m0
    K0 = (17 * cert[m0] + Fr(24, m0) + 8 * root_bound) / (4 + Fr(12, m0)); Krest = Fr(42, 4 * (m0 + 4))
    a2 = max(a2_bound(m) for m in range(m0, 400)); assert Fr(2, 3 * 400) < a2
    return theta_general(max(K0, Krest), Fr(1, 4 * (m0 + 3)), a2), K0, Krest, a2
for m0, rb, th_claim, tg in ((2, Fr(13, 40), Fr(1361, 750), Fr(47, 25)), (4, Fr(1, 6), Fr(8153, 6300), Fr(13, 10)), (12, Fr(1, 16), Fr(91, 144), Fr(16, 25)), (23, Fr(1, 30), Fr(16226, 43875), Fr(37, 100))):
    th, K0, Krest, a2 = consequence(m0, rb)
    ok(th <= th_claim < tg, 'all ranks >= %2d: K_%d <= %s = %.5f, K_m (m > %d) <= %s, a^2 <= %s, theta <= %s = %.6f <= claimed %s < %s' % (m0, m0, K0, float(K0), m0, Krest, a2, th, float(th), th_claim, tg))
iv_valid = lambda m: min([an_valid(m)] + [c for m0, c in ((2, Fr(1361, 750)), (4, Fr(8153, 6300)), (12, Fr(91, 144)), (23, Fr(16226, 43875))) if m >= m0])
need_iv = [min(m for m in range(1, 200) if iv_valid(m) < tg) for _, tg in targets]
ok(need_iv == [23, 12, 4, 2, 1, 1], 'minimum ranks with the interval constants: %s (INTERVAL_PROOF: 23, 12, 4, 2, 1, 1), with minimality among the stated bounds' % need_iv)

# ------------------------------------------------------------------------------------------------------------- A3
print('A3. own exact multi-block polynomial instances')
DER = [sum(comb(k, j) * (-1) ** (k - j) * factorial(j) for j in range(k + 1)) for k in range(80)]          # E (T-1)^k
class Factor:
    """P = sum lam_j (T_j - 1), B = sum lam_j^2 T_j; moments by convolution over the eigenvalues."""
    def __init__(self, lam, K=40):
        self.lam = [Fr(x) for x in lam]; assert sum(x * x for x in self.lam) == 1
        self.kappa = sum(x ** 4 for x in self.lam); self.s = sum(x ** 3 for x in self.lam); self.chi = 4 + 12 * self.kappa; self.K = K
        # group equal eigenvalues: moments of one term, then repeated convolution (binary powering for multiplicities)
        def conv(a, c): return [sum(Fr(comb(k, j)) * a[j] * c[k - j] for j in range(k + 1)) for k in range(K + 1)]
        def one(l): return [l ** k * DER[k] for k in range(K + 1)]
        def power(a, n_):
            r = [Fr(1)] + [Fr(0)] * K
            while n_:
                if n_ & 1: r = conv(r, a)
                a = conv(a, a); n_ >>= 1
            return r
        mult = {}
        for l in self.lam: mult[l] = mult.get(l, 0) + 1
        self.mom = [Fr(1)] + [Fr(0)] * K
        for l, c in mult.items(): self.mom = conv(self.mom, power(one(l), c))
        # E[P^n B] = sum_j lam_j^2 E[P^n T_j]: remove one copy of eigenvalue l, convolve with the moments of l(T-1) weighted by T
        self.momB = [Fr(0)] * (K + 1)
        for l, c in mult.items():
            rest = [Fr(1)] + [Fr(0)] * K
            for l2, c2 in mult.items(): rest = conv(rest, power(one(l2), c2 - (1 if l2 == l else 0)))
            oneT = [l ** k * (DER[k + 1] + DER[k]) for k in range(K + 1)]                       # E[(l(T-1))^k T]
            both = conv(rest, oneT)
            for k in range(K + 1): self.momB[k] += c * l * l * both[k]
        assert self.mom[1] == 0 and self.mom[2] == 1 and self.mom[4] == 3 + 6 * self.kappa and self.momB[0] == 1 and self.momB[1] == self.s

class Model:
    """q = sum_i a_i X_i P_i + a_0 W;  given the cofactors, q ~ CN(0, S), S = sum a_i^2 P_i^2 + a_0^2 D.
    bulk 'UV': W = U V conj(Z), E D^k = (k!)^2 (the package's);  'U2': W = U^2 conj(Z)/sqrt2, E D^k = (2k)!/2^k."""
    def __init__(self, factors, amps, a0=0, bulk='UV'):
        self.f = factors; self.a = [Fr(x) for x in amps]; self.a0 = Fr(a0); self.w = [x * x for x in self.a]; self.w0 = self.a0 ** 2
        self.u = sum(self.w) + self.w0; self.bulk = bulk
        varD = {'UV': 3, 'U2': 5}[bulk]
        self.delta = sum(w * w * F_.chi for w, F_ in zip(self.w, self.f)) + 2 * self.w0 ** 2 * varD
        self.chi = self.delta / self.u ** 2
    def _egf(self, i, a, bflag, N):
        """coefficients E[S^n P_i^a B_i^bflag]/n!, n <= N (product of exponential generating functions over the independent pieces)."""
        prod = [Fr(1)] + [Fr(0)] * N
        def mul(p, e): return [sum(p[j] * e[k - j] for j in range(k + 1)) for k in range(N + 1)]
        for j, (F_, w) in enumerate(zip(self.f, self.w)):
            src = F_.momB if (j == i and bflag) else F_.mom; sh = a if j == i else 0
            prod = mul(prod, [w ** c * src[2 * c + sh] / factorial(c) for c in range(N + 1)])
        dk = (lambda c: factorial(c) ** 2) if self.bulk == 'UV' else (lambda c: Fr(factorial(2 * c), 2 ** c))
        return mul(prod, [self.w0 ** c * dk(c) / factorial(c) for c in range(N + 1)])
    def ES(self, n, i=-1, a=0, bflag=0): return factorial(n) * self._egf(i, a, bflag, n)[n]
    def EV(self, n): return factorial(n) * self.ES(n)
    def content(self, i, n): return self.a[i] * factorial(n + 1) * self.ES(n, i, 1)                # E[conj(X_i) q V^n]
    def kprime(self, h):
        u = self.u; d = len(h); k = [Fr(0)] * d
        for dd in range(d):
            for j in range(dd + 1): k[j] += Fr(h[dd]) * Fr(factorial(dd), factorial(j)) * u ** (dd - j)
        return [k[j + 1] * (j + 1) for j in range(d - 1)]
    def evaluate(self, h):
        kp = self.kprime(h); c = [sum(Fr(h[n]) * self.content(i, n) for n in range(len(h))) for i in range(len(self.f))]
        A_ = sum(kp[i] * kp[j] * self.EV(i + j + 1) for i in range(len(kp)) for j in range(len(kp))); B_ = sum(kp[i] * self.EV(i + 1) for i in range(len(kp)))
        om = Fr(3, 2) * A_ - Fr(3, 4) * B_ ** 2 / self.u
        return c, om, sum(x * x for x in c)
    def balanced(self, i, h):
        """the right side of (14), times sqrt(u rho_i): a_i u sum_n kp_n (n+1)! { 4 rho E[S^n P B] + 2 n rho w E[S^(n-1) P^3 B]
        - E[S^n P] + (E[S^(n+1) P] - w E[S^n P^3])/u }."""
        kp = self.kprime(h); u = self.u; w = self.w[i]; rho = w / u; tot = Fr(0)
        for n_, x in enumerate(kp):
            v = 4 * rho * self.ES(n_, i, 1, 1) - self.ES(n_, i, 1) + (self.ES(n_ + 1, i, 1) - w * self.ES(n_, i, 3)) / u
            if n_ > 0: v += 2 * n_ * rho * w * self.ES(n_ - 1, i, 3, 1)
            tot += x * factorial(n_ + 1) * v
        return self.a[i] * u * tot
    def poly_sup(self, n):
        """sup over profiles with k' polynomial of degree <= n-1 of ||c||^2/(delta Omhat): largest eigenvalue of Q^-1 C^T C / delta."""
        u = self.u; r = len(self.f)
        C = [[Fr(1, j + 1) * self.content(i, j + 1) - u * self.content(i, j) for j in range(n)] for i in range(r)]
        Q = [[Fr(3, 2) * self.EV(i + j + 1) - Fr(3, 4) * self.EV(i + 1) * self.EV(j + 1) / u for j in range(n)] for i in range(n)]
        mp.mp.dps = 80
        Cm = mp.matrix([[mp.mpf(x.numerator) / x.denominator for x in row] for row in C]); Qm = mp.matrix([[mp.mpf(x.numerator) / x.denominator for x in row] for row in Q])
        Li = mp.inverse(mp.cholesky(Qm)); Gm = Cm * Li.T                        # c = C f, f = L^-T g:  ||C L^-T g||^2 / |g|^2
        ev = mp.eigsy(Gm * Gm.T, eigvals_only=True) if r > 1 else [sum(x * x for x in Gm)]
        return float(max(ev) / (mp.mpf(self.delta.numerator) / self.delta.denominator))

F1 = Factor([1]); F4 = Factor([Fr(1, 2)] * 4); F9 = Factor([Fr(1, 3)] * 9); F64 = Factor([Fr(1, 8)] * 64, K=24); F576 = Factor([Fr(1, 24)] * 576, K=24)
Fp = Factor([Fr(3, 5), Fr(4, 5)]); Fm = Factor([Fr(3, 5), Fr(-4, 5)])
LAB = {'equal-1': F1, 'equal-4': F4, 'equal-9': F9, 'equal-64': F64, 'equal-576': F576, '3/5,4/5': Fp, '3/5,-4/5': Fm}
stored = json.load(open(sys.argv[1])); nm = 0
for ex in stored['examples']:
    Mdl = Model([LAB[l] for l in ex['factors']], [Fr(x) for x in ex['amplitudes']], Fr(ex['bulkAmp']), 'UV')
    c, om, n2 = Mdl.evaluate([Fr(x) for x in ex['profile']])
    same = (Mdl.u == Fr(ex['u']) and Mdl.delta == Fr(ex['delta']) and c == [Fr(x) for x in ex['content']] and om == Fr(ex['omega']) and n2 == Fr(ex['norm2']) and n2 / (Mdl.delta * om) == Fr(ex['ratio']))
    assert same, ex['factors']; nm += 1
    assert Mdl.EV(1) == Mdl.u and Mdl.EV(2) - 2 * Mdl.u ** 2 == Mdl.delta
ok(nm == 9 and stored['polynomialInstances'] == 72 and len(stored['independentWick']) == 5, 'the nine stored examples (h = v) reproduced exactly by independent code: u, delta, every content coordinate, Omhat, ratio')
nb = 0
for facs, amps, a0 in (([F1, F1], [1, 1], 0), ([F1, F4], [Fr(1, 2), Fr(3, 2)], 1), ([Fp, Fm], [1, 2], 1), ([F1, Fp, Fm], [Fr(1, 2), 1, Fr(3, 4)], Fr(2, 3)), ([F4] * 7, [1] * 7, 2), ([F9, F9, F9], [1, Fr(2, 3), Fr(1, 5)], Fr(1, 2))):
    for bulk in ('UV', 'U2'):
        Mdl = Model(facs, amps, a0, bulk)
        for h in ([0, 1], [0, 0, 1], [0, 0, 0, 1], [3, -2, Fr(1, 7)], [-1, 2, -3, Fr(1, 2), Fr(1, 1000)]):
            c, om, n2 = Mdl.evaluate(h)
            for i in range(len(facs)):
                assert Mdl.balanced(i, h) == c[i]; nb += 1
ok(True, 'the balanced identity (14) equals the direct content exactly in %d coordinate checks (6 models x 2 bulks x 5 polynomial profiles), own moment code' % nb)

# ------------------------------------------------------------------------------------------------------------- A4
print('A4. supremum over polynomial profiles (deg k\' <= 5) of ||c||^2/(delta Omhat), multi-block; proved constant; h = v value 64 sum rho_i^3 s_i^2/(3 chi)')
def proved(facs):
    if all(len(set(F_.lam)) == 1 and F_.lam[0] > 0 for F_ in facs): return iv_valid(min(len(F_.lam) for F_ in facs)), 'equal'
    return None, 'general'
print('     model                                            | chi    | h = v    | deg<=2   | deg<=5   | proved theta')
rows_ = [('1 x m=1', [F1], [1], 0), ('2 x m=1, equal weights', [F1, F1], [1, 1], 0), ('4 x m=1, equal weights', [F1] * 4, [1] * 4, 0), ('7 x m=1, equal weights', [F1] * 7, [1] * 7, 0),
         ('2 x m=1, weights 4 : 1', [F1, F1], [2, 1], 0), ('2 x m=1 with bulk UV (rho_0 = 1/3)', [F1, F1], [1, 1], 1), ('m = 1 and m = 4, weights 1 : 9, bulk', [F1, F4], [Fr(1, 2), Fr(3, 2)], 1),
         ('4 x m=4, equal weights', [F4] * 4, [1] * 4, 0), ('7 x m=4 with bulk', [F4] * 7, [1] * 7, 2), ('3 x m=9, unequal weights, bulk', [F9, F9, F9], [1, Fr(2, 3), Fr(1, 5)], Fr(1, 2)),
         ('(3/5,4/5) and (3/5,-4/5), weights 1 : 4, bulk', [Fp, Fm], [1, 2], 1)]
for name, facs, amps, a0 in rows_:
    Mdl = Model(facs, amps, a0, 'UV'); hv = float(64 * sum((w / Mdl.u) ** 3 * F_.s ** 2 for w, F_ in zip(Mdl.w, facs)) / (3 * Mdl.chi))
    s1, s3, s6 = Mdl.poly_sup(1), Mdl.poly_sup(3), Mdl.poly_sup(6); th, kind = proved(facs)
    if th is None:                                                         # Lemma 2 route, floating point (rational bounds are in verify.mjs)
        al = [min(1.0, 2 * math.sqrt(float(F_.kappa))) for F_ in facs]
        K_ = max((math.sqrt(17 * a_) + math.sqrt(24 * float(F_.kappa))) ** 2 / float(F_.chi) for a_, F_ in zip(al, facs)); M_ = max(float(F_.s ** 2 / F_.chi) for F_ in facs)
        thf = 2 * (K_ + 16 * M_) / 3 + max(al) / 3
    else: thf = float(th)
    ok(abs(s1 - hv) < 1e-12 and s1 <= s3 * (1 + 1e-12) <= s6 * (1 + 1e-12) and s6 <= thf, '%-48s | %.4f | %.6f | %.6f | %.6f | %.6f%s' % (name, float(Mdl.chi), hv, s3, s6, thf, '' if th is not None else ' (Lemma 2, alpha^2 <= min(1, 2 sqrt kappa))'))

# ------------------------------------------------------------------------------------------------------------- A5
print('A5. COORDINATE_OBSTRUCTION (1): ||E[q_m | F_E]||^2 = (c/m)(k - 1 + 2(1-c)^2), c = ||Proj_E X||^2, on random rational subspaces')
def projector(V):
    Vm = sp.Matrix(V); return Vm * (Vm.T * Vm).inv() * Vm.T
random.seed(20261116); ntest = 0
for m in (2, 3, 5, 8):
    for k in range(1, m + 2):
        for trial in range(3):
            while True:
                V = [[random.randint(-3, 3) for _ in range(k)] for _ in range(m + 1)]
                if sp.Matrix(V).rank() == k: break
            Pi = projector(V); c = Pi[0, 0]
            val = sum(Pi[0, 0] * Pi[j, l] ** 2 + Pi[0, l] * Pi[j, 0] * Pi[j, l] for j in range(1, m + 1) for l in range(1, m + 1)) / m
            assert sp.simplify(val - c * (k - 1 + 2 * (1 - c) ** 2) / m) == 0 and Pi.trace() == k; ntest += 1
ok(True, 'formula (1) holds exactly on %d random rational subspaces (m = 2, 3, 5, 8; every k from 1 to m + 1; real coefficients)' % ntest)
cs = sp.symbols('c')
ok(sp.expand(sp.Rational(8, 27) - 2 * cs * (1 - cs) ** 2 - 2 * (cs - sp.Rational(1, 3)) ** 2 * (sp.Rational(4, 3) - cs)) == 0, 'k = 1: 8/27 - 2c(1-c)^2 = 2(c - 1/3)^2 (4/3 - c) >= 0 on [0, 1]')
kk = sp.symbols('k')
ok(sp.expand((kk - 1) - cs * (kk - 1 + 2 * (1 - cs) ** 2) - (1 - cs) * (kk - 1 - 2 * cs * (1 - cs))) == 0, 'k >= 2: (k-1) - c(k-1+2(1-c)^2) = (1-c)(k-1-2c(1-c)) >= 0')
print('ALL CHECKS PASSED')

# Review of codex-a786's content-law package (worker of claude-b9ee, 16 Nov 2026).
# Own checks of the identities and constants of PROOFS.md.  Parts A (exact rational / symbolic: label C),
# B (mpmath, 40 digits: N) and C (the sharp profile-free constant on P1, floating point: N).
# usage: exact_checks.py <results_exact.json of the package>
import sys, json, math
from fractions import Fraction as Fr
from math import comb, factorial
import sympy as sp
import mpmath as mp
import numpy as np
from numpy.polynomial.legendre import leggauss

def ok(cond, msg):
    print(('  ok   ' if cond else '  FAIL ') + msg); assert cond, msg

# ----------------------------------------------------------------------------------------------------------------- A
print('A1. exponential moments used in (14), (16), (26)  [exact]')
T, b = sp.symbols('T b', positive=True)
E = lambda f: sp.integrate(sp.expand(f) * sp.exp(-T), (T, 0, sp.oo))
H = b * T + 2 * (1 - b)
ok(sp.simplify(E(T * (2 * H - 1) ** 2) - (9 + 8 * b ** 2)) == 0, 'E_T[T(2H-1)^2] = 9 + 8b^2   (H = bT + 2(1-b))')
ok(sp.simplify(E(T * H ** 2) - (4 + 2 * b ** 2)) == 0, 'E_T[T H^2] = 4 + 2b^2')
ok(sp.simplify(E(T * H) - 2) == 0, 'E_T[T H] = 2, hence E_T[T(2H-1)] = 3 for every b (so E_mu d = 4/sqrt m in (26))')
ok(E(T * (2 * T - 1) ** 2) == 17 and E(T * (2 * T) ** 2) == 24 and E(T * 2 * T) == 4, 'b = 1: 17, 24, 4')
ok(E(T * (2 * T - 1) * (2 * T)) == 20, 'cross moment E[S(2S-1)(2S)] = 20: the cross term of (16) is (2/sqrt m)*20*E[p(R)] = 0 because E P_m = 0')

print('A2. the constants  [exact]')
m = sp.symbols('m', positive=True)
ok(sp.simplify(sp.Rational(2, 3) * (17 * sp.Rational(2, 3) / m + 40 / m) / (4 + 12 / m) - sp.Rational(77, 9) / (m + 3)) == 0, '(17) with alpha^2 = 2/(3m) is 77/(9(m+3))')
r17 = sp.symbols('r17', positive=True)                    # stands for sqrt 17
thc = sp.Rational(2, 3) / (4 + 12 / m) * (17 * sp.Rational(2, 3) / m + 2 * r17 * sp.sqrt(sp.Rational(2, 3) * 24) / m + 24 / m + 16 / m)
ok(sp.simplify(thc - (sp.Rational(77, 9) + sp.Rational(4, 3) * r17) / (m + 3)) == 0, '(28) with alpha^2 = 2/(3m), rho = 1 is (77/9 + (4/3) sqrt17)/(m+3)')
ok(Fr(77, 9) + Fr(4, 3) * Fr(33, 8) == Fr(253, 18) and Fr(33, 8) ** 2 > 17, '77/9 + (4/3)(33/8) = 253/18, (33/8)^2 > 17')
ok(Fr(1, 24) * (Fr(17, 2) + 24 + 30 + 16) == Fr(157, 48) and 15 ** 2 > 204 and Fr(157, 48) + Fr(1, 6) == Fr(55, 16) and Fr(49, 18) ** 2 < 8, 'm = 1: 157/48 + 1/6 = 55/16 (alpha_1^2 <= 1/2 from e^2 < 8)')
x = Fr(1, 12); a8 = x - x ** 2 / 2 + x ** 3 / 6
th8 = Fr(4, 33) * (17 * a8 + 5 + Fr(101, 25)) + a8 / 3
ok(a8 == Fr(829, 10368) and 51 * a8 < Fr(101, 50) ** 2 and th8 == Fr(11009947, 8553600) and th8 < Fr(13, 10), 'm = 8: alpha^2 <= 829/10368, theta = 11009947/8553600 = %.6f < 13/10 (a SUM: (4/33)(...) + 829/31104; (29a) prints a product)' % float(th8))
ok(Fr(253, 18 * 11) + Fr(2, 72) > Fr(13, 10), 'm = 8 without the refinement: %.5f > 13/10, so the refinement is needed for the common target 13/10 only' % float(Fr(253, 198) + Fr(1, 36)))

p1 = lambda mm: Fr(77, 9 * (mm + 3))
p2 = lambda mm: Fr(55, 16) if mm == 1 else (th8 if mm == 8 else Fr(253, 18 * (mm + 3)) + Fr(2, 9 * mm))
low = lambda mm: Fr(16, 3 * (mm + 3))                     # the ratio of h(v) = v, (31)
targets = [('0.80', Fr(37, 100)), ('0.82', Fr(16, 25)), ('0.84', Fr(133, 100)), ('0.845', Fr(47, 25)), ('0.85', Fr(5, 2)), ('0.855', Fr(37, 10))]
claimed = {'0.80': (21, 36), '0.82': (11, 20), '0.84': (4, 8), '0.845': (2, 5), '0.85': (1, 3), '0.855': (1, 1)}
print('A3. rank thresholds of PROOFS section 7, with minimality  [exact]')
pairs = 0; impossible = 0
for t, tg in targets:
    m1 = min(mm for mm in range(1, 200) if all(p1(k) < tg for k in range(mm, 200)))
    m2 = min(mm for mm in range(1, 200) if all(p2(k) < tg for k in range(mm, 200)))
    mlow = min(mm for mm in range(1, 200) if low(mm) < tg)
    pairs += m1 - 1; impossible += mlow - 1
    ok((m1, m2) == claimed[t], 't = %-5s target %-7s: P1 needs m >= %2d (theta %s), P2 needs m >= %2d (theta %s); h(v) = v alone has ratio >= target for m <= %d' % (t, tg, m1, p1(m1), m2, p2(m2), mlow - 1))
ok(pairs == 34, 'row/rank pairs not covered by P1: %d (SCALAR_REDUCTION.md: 34)' % pairs)
print('  note  %d of these %d pairs cannot be covered by ANY constant valid for all admissible profiles (or for all u > 0 with a fixed smooth profile): 16/(3(m+3)) >= target' % (impossible, pairs))
ok(all(p1(k + 1) < p1(k) for k in range(1, 300)) and all(p2(k) < p2(k - 1) for k in range(3, 300) if k not in (8, 9)) and p2(9) < p2(8) < p2(7), 'both constants decrease in m (m = 1, 8 refinements included)')

print('A4. the Wick control q = X(|X|^2 - 2), h(v) = v  [exact]')
ES = lambda poly: sum(c * factorial(j) for j, c in enumerate(poly))        # E of a polynomial in S ~ Exp(1)
u_, m4, c_ = ES([0, 4, -4, 1]), ES([0, 0, 16, -32, 24, -8, 1]), ES([0, 0, -8, 12, -6, 1])
ok((u_, m4, c_) == (2, 176, 32) and Fr(c_ ** 2, (m4 - 2 * u_ ** 2)) / Fr(3 * u_, 4) == Fr(256, 63), 'u = 2, E|q|^4 = 176, delta = 168, c = 32, Omhat = 3/2, ratio 1024/252 = 256/63')

# ---- own exact polynomial instances (independent of verify.mjs: direct content only, own moment code)
def cgamma(mm, K):                                         # mu_k = E (G - m)^k, G ~ Gamma(m, 1)
    rise = [1]
    for j in range(K): rise.append(rise[-1] * (mm + j))
    return [sum(comb(k, j) * (-mm) ** (k - j) * rise[j] for j in range(k + 1)) for k in range(K + 1)]

def bulk_moments(N, K):                                    # E (sum_{n<=N} |U_n|^4)^k
    one = [factorial(2 * k) for k in range(K + 1)]; v = [1] + [0] * K
    for _ in range(N): v = [sum(comb(k, j) * v[j] * one[k - j] for j in range(k + 1)) for k in range(K + 1)]
    return v

class Cubic:
    """q = X (G - m) + bb * sum_{j<=N} U_j^2 conj(Z_j): given (Y, U), q ~ CN(0, Sc), Sc = (G-m)^2 + bb^2 Dt."""
    def __init__(self, mm, N, bb, K):
        self.m, self.N, self.bb = mm, N, bb; self.mu = cgamma(mm, 4 * K + 8); self.dm = [Fr(bb) ** (2 * k) * v for k, v in enumerate(bulk_moments(N, 2 * K + 4))]
        self.u = Fr(mm + 2 * bb * bb * N); self.delta = Fr(4 * mm * mm + 12 * mm + 40 * bb ** 4 * N)
    def mix(self, a, k): return sum(comb(k, j) * self.mu[a + 2 * j] * self.dm[k - j] for j in range(k + 1))     # E[(G-m)^a Sc^k]
    def EV(self, k): return factorial(k) * self.mix(0, k)                                                    # E V^k
    def content(self, i): return factorial(i + 1) * self.mix(1, i)                                           # E[conj(X) q V^i]
    def ratio_poly(self, h):
        """h: coefficients of the profile.  Returns (content, Omhat, ratio)."""
        u = self.u; d = len(h); k = [Fr(0)] * d
        for dd in range(d):
            for j in range(dd + 1): k[j] += Fr(h[dd]) * Fr(factorial(dd), factorial(j)) * u ** (dd - j)
        kp = [k[j + 1] * (j + 1) for j in range(d - 1)]
        c = sum(Fr(h[i]) * self.content(i) for i in range(d))
        A = sum(kp[i] * kp[j] * self.EV(i + j + 1) for i in range(len(kp)) for j in range(len(kp))); Bm = sum(kp[i] * self.EV(i + 1) for i in range(len(kp)))
        om = Fr(3, 2) * A - Fr(3, 4) * Bm ** 2 / u
        return c, om, (c * c / (self.delta * om) if om != 0 else None)
    def sharp_poly(self, n):
        """sup of the ratio over polynomial profiles with deg k' <= n-1 (exact): C^T Q^-1 C / delta."""
        u = self.u; S_ = lambda fr: sp.Rational(Fr(fr).numerator, Fr(fr).denominator)
        C = sp.Matrix([S_(Fr(1, j + 1) * self.content(j + 1) - u * self.content(j)) for j in range(n)])
        Q = sp.Matrix(n, n, lambda i, j: S_(Fr(3, 2) * self.EV(i + j + 1) - Fr(3, 4) * self.EV(i + 1) * self.EV(j + 1) / u))
        return (C.T * Q.LUsolve(C))[0, 0] / S_(self.delta)

print('A5. own exact polynomial instances against the stored results_exact.json  [exact]')
stored = json.load(open(sys.argv[1])); nmatch = 0
for inst in stored['instances']:
    cb = Cubic(inst['m'], inst['N'], inst['b'], inst['degree'] + 1); h = [0] * inst['degree'] + [1]
    c, om, ra = cb.ratio_poly(h)
    same = (str(cb.u) == inst['u'] and str(cb.delta) == inst['delta'] and Fr(inst['content']) == c and Fr(inst['omega']) == om and Fr(inst['ratio']) == ra)
    ok(cb.EV(1) == cb.u and cb.EV(2) - 2 * cb.u ** 2 == cb.delta, 'm=%d N=%d b=%d: E V = u, E V^2 - 2u^2 = delta' % (inst['m'], inst['N'], inst['b'])) if nmatch < 1 else None
    assert same, inst; nmatch += 1
ok(nmatch == len(stored['instances']), 'all %d stored instances reproduced exactly (content, Omhat, ratio) by independent code' % nmatch)
ok(stored['polynomialInstances'] == 246 and len(stored['rowComparisons']) == 6, 'stored report: 246 instances, 6 row comparisons')

print('A6. the best polynomial profile of bounded degree (exact supremum over the polynomial subspace), against the proved constants')
print('    P1 (N = 0):  m | deg k\' <= 0 (h = v) | <= 2 | <= 5 | <= 9 | proved 77/(9(m+3))')
for mm in (1, 2, 4, 8, 21):
    cb = Cubic(mm, 0, 0, 12); vals = [cb.sharp_poly(n) for n in (1, 3, 6, 10)]
    ok(vals[0] == sp.Rational(16, 3 * (mm + 3)) and all(v <= sp.Rational(77, 9 * (mm + 3)) for v in vals) and all(vals[i] <= vals[i + 1] for i in range(3)),
       '   m=%2d | %.6f | %.6f | %.6f | %.6f | %.6f   (sup over polynomials <= theta: exact comparison)' % ((mm,) + tuple(float(v) for v in vals) + (77 / (9 * (mm + 3)),)))
print('    P2 with the finite bulk W_N (b = 1; rho = m/(m+2N)):  m, N | chi | deg k\' <= 0 | <= 2 | <= 5 | proved constant')
for mm, N in ((1, 1), (1, 3), (2, 1), (4, 1), (4, 7), (8, 3), (9, 1)):
    cb = Cubic(mm, N, 1, 8); vals = [cb.sharp_poly(n) for n in (1, 3, 6)]; th = p2(mm)
    ok(all(v <= sp.Rational(th.numerator, th.denominator) for v in vals), '   m=%d N=%d rho=%.3f | %.3f | %.6f | %.6f | %.6f | %.6f' % (mm, N, mm / (mm + 2 * N), float(cb.delta / cb.u ** 2), float(vals[0]), float(vals[1]), float(vals[2]), float(th)))

print('A7. a bulk outside the replay\'s family: W proportional to conj(Z) U1 U2 (F = U1 U2, not diagonal; D = |U1 U2|^2, E D^k = (k!)^2)  [exact]')
class CubicUV(Cubic):
    """q = X (G - m) + bb * conj(Z) U1 U2: given (Y, U), q ~ CN(0, (G-m)^2 + bb^2 |U1 U2|^2); u = m + bb^2, delta = 4m^2 + 12m + 6 bb^4."""
    def __init__(self, mm, bb, K):
        self.m, self.N, self.bb = mm, None, bb; self.mu = cgamma(mm, 4 * K + 8); self.dm = [Fr(bb) ** (2 * k) * factorial(k) ** 2 for k in range(2 * K + 5)]
        self.u = Fr(mm + bb * bb); self.delta = Fr(4 * mm * mm + 12 * mm + 6 * bb ** 4)
for mm, bb in ((1, 1), (1, 2), (2, 1), (4, 1), (4, 3), (9, 2)):
    cb = CubicUV(mm, bb, 8); vals = [cb.sharp_poly(n) for n in (1, 3, 6)]; th = p2(mm)
    ok(cb.EV(1) == cb.u and cb.EV(2) - 2 * cb.u ** 2 == cb.delta and all(v <= sp.Rational(th.numerator, th.denominator) for v in vals),
       '   m=%d b=%d rho=%.3f | chi %.3f | sup over polynomials, deg k\' <= 0, 2, 5: %.6f, %.6f, %.6f | proved constant %.6f' % (mm, bb, mm / (mm + bb * bb), float(cb.delta / cb.u ** 2), float(vals[0]), float(vals[1]), float(vals[2]), float(th)))

# ----------------------------------------------------------------------------------------------------------------- B
mp.mp.dps = 40
print('B1. the Hellinger affinity (20), Binet bound (21) and the sign bias (18), (19), (22)  [40-digit quadrature]')
print('     m | A_m quadrature           | closed form (20)        | exp(-2 r(m/2))          | alpha_m^2 exact (18) | 1 - A_m^2  | 1 - e^{-2/(3m)} | 2/(3m)   | exact/bound')
alpha2 = {}
for mm in (1, 2, 3, 4, 5, 8, 11, 21, 36, 64):
    f = lambda p: mp.sqrt(mm) * mp.exp((mm - 1) * mp.log(mm + mp.sqrt(mm) * p) - (mm + mp.sqrt(mm) * p) - mp.loggamma(mm)) if mm + mp.sqrt(mm) * p > 0 else mp.mpf(0)
    rt = mp.sqrt(mm)
    Aq = mp.quad(lambda p: mp.sqrt(f(p) * f(-p)), mp.linspace(-rt, rt, 9))
    Ac = mp.mpf(mm) ** mm * mp.exp(-mm) * mp.sqrt(mp.pi) * mp.gamma(mp.mpf(mm + 1) / 2) / (mp.gamma(mm) * mp.gamma(mp.mpf(mm + 2) / 2))
    r = lambda xx: mp.loggamma(xx) - (xx - mp.mpf(1) / 2) * mp.log(xx) + xx - mp.log(2 * mp.pi) / 2
    Ar = mp.exp(-2 * r(mp.mpf(mm) / 2))
    binet = 2 * mp.quad(lambda t: mp.atan(2 * t / mm) / mp.expm1(2 * mp.pi * t), [0, 1, 5, 20])
    al = mp.quad(lambda p: (f(p) - f(-p)) ** 2 / (f(p) + f(-p)), list(mp.linspace(0, rt, 5)) + [rt + 1, rt + 6, rt + 30, rt + 120])
    alpha2[mm] = float(al)
    cond = (abs(Aq - Ac) < mp.mpf(10) ** -25 and abs(Ac - Ar) < mp.mpf(10) ** -30 and abs(binet - r(mp.mpf(mm) / 2)) < mp.mpf(10) ** -20 and 0 < r(mp.mpf(mm) / 2) < mp.mpf(1) / (6 * mm)
            and al <= 1 - Ac ** 2 <= 1 - mp.exp(-mp.mpf(2) / (3 * mm)) <= mp.mpf(2) / (3 * mm))
    ok(cond, '%3d | %s | %s | %s | %.10f | %.8f | %.8f | %.6f | %.4f' % (mm, mp.nstr(Aq, 22), mp.nstr(Ac, 22), mp.nstr(Ar, 22), float(al), float(1 - Ac ** 2), float(1 - mp.exp(-mp.mpf(2) / (3 * mm))), 2 / (3 * mm), float(al * 3 * mm / 2)))
a1 = (2 / mp.e) * (mp.sinh(1) - 2 * mp.atan(mp.tanh(mp.mpf(1) / 2))) + mp.exp(-2)
ok(abs(a1 - alpha2[1]) < 1e-12, 'm = 1 closed form: alpha_1^2 = (2/e)(sinh 1 - 2 arctan tanh(1/2)) + e^-2 = %.10f (the package uses the bound 1 - 4/e^2 = %.6f <= 1/2)' % (float(a1), float(1 - 4 / mp.e ** 2)))
print('  note  alpha_m^2 * 3m/2 -> 1: the Hellinger bound 2/(3m) is asymptotically exact (Edgeworth: skewness 2/sqrt m gives alpha^2 ~ 2/(3m))')

print('B2. the dual form (9): |E df|^2 <= (E d^2 + (E d)^2)(E f^2 - (1/2)(E f)^2), with equality at f = d + E d  [random discrete measures]')
rng = np.random.default_rng(7); worst = -1e9
for _ in range(20000):
    n = int(rng.integers(2, 9)); w = rng.random(n); w /= w.sum(); d = rng.standard_normal(n) * rng.random() * 3 + rng.standard_normal(); f = rng.standard_normal(n) + rng.standard_normal() * 2
    lhs = (w @ (d * f)) ** 2; rhs = (w @ d ** 2 + (w @ d) ** 2) * (w @ f ** 2 - 0.5 * (w @ f) ** 2); worst = max(worst, (lhs - rhs) / max(rhs, 1e-300))
    fe = d + w @ d; eqg = abs((w @ (d * fe)) ** 2 - (w @ d ** 2 + (w @ d) ** 2) * (w @ fe ** 2 - 0.5 * (w @ fe) ** 2))
    assert eqg < 1e-9 * (1 + (w @ d ** 2) ** 2)
ok(worst < 1e-12, '20000 random cases: largest (lhs - rhs)/rhs = %.1e; equality at f = (I + Pi) d in every case' % worst)

# ----------------------------------------------------------------------------------------------------------------- C
print('C1. three levels of conditioning on P1, and the sharp constant  [floating point]')
print('    theta_none = (2/3)(17 + 40/m)/(4 + 12/m)          (Cauchy-Schwarz in (13) without conditioning: does not decay)')
print('    theta_(17) = (2/3)(17 alpha_m^2 + 40/m)/(4 + 12/m) (the package: conditioning on (R, S); exact alpha_m^2)')
print('    theta_*    = (2/3)(E_mu[E_mu[d | V]^2] + 16/m)/(4 + 12/m)   (conditioning on V: the supremum over ALL profiles, by duality in (9))')
def gl(edges, nq=10):
    x, w = leggauss(nq); ed = np.asarray(edges, float)
    return (np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(len(ed) - 1)]),
            np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(len(ed) - 1)]))
from scipy.special import gammaln
def sharp(mm, nw=3600):
    rt = math.sqrt(mm); pmax = 14 + 34 / rt
    geo = lambda top: np.concatenate([[0.0], top * 2.0 ** (-np.arange(200, -1, -1) / 4.0)])          # geometric panels: resolve exp(-w/p^2) for every w
    pp, wp = gl(geo(pmax)); pn, wn = gl(geo(rt))
    p = np.concatenate([pp, -pn]); w = np.concatenate([wp, wn]); g = mm + rt * p
    dens = rt * np.exp((mm - 1) * np.log(g) - g - gammaln(mm)); wd = w * dens
    B = 1 + p / rt
    xs = np.linspace(math.log(1e-20), math.log(4e5), nw); ws = np.exp(xs)                             # P(W < 1e-20) ~ 1e-10
    n_ = np.empty(nw); gW = np.empty(nw)
    for i in range(0, nw, 200):
        W = ws[i:i + 200][:, None]; e = np.exp(-W / (p * p)[None, :])
        n_[i:i + 200] = (e * (W / p[None, :] ** 3) * (2 * W * B[None, :] / (p * p)[None, :] - 1)) @ wd
        gW[i:i + 200] = (e / (p * p)[None, :]) @ wd
    dx = xs[1] - xs[0]; tr = lambda y: float(dx * (y.sum() - 0.5 * (y[0] + y[-1])))
    chk = (tr(gW * ws), tr(gW * ws * ws), tr(n_ * ws) * rt / 4)            # 1, 1 (E W = E P^2 S), 1 (E_mu d = 4/sqrt m)
    Ed2 = tr(n_ * n_ / np.maximum(gW, 1e-300) * (gW > 1e-280))           # int n^2/(w gW) dw = int n^2/gW dx
    return Ed2, chk
for mm in (1, 2, 4, 8, 21):
    Ed2, chk = sharp(mm); den = 3 * (4 + 12 / mm)
    th_none = 2 * (17 + 40 / mm) / den; th17 = 2 * (17 * alpha2[mm] + 40 / mm) / den; ths = 2 * (Ed2 + 16 / mm) / den
    cb = Cubic(mm, 0, 0, 12); poly = float(cb.sharp_poly(10))
    ok(16 / (3 * (mm + 3)) <= ths * (1 + 1e-6) and poly <= ths * (1 + 1e-6) and ths <= th17 <= 77 / (9 * (mm + 3)) and max(abs(c - 1) for c in chk) < 1e-6,
       'm=%2d: h = v: %.5f <= polynomials (deg k\' <= 9, exact): %.5f <= theta_* = %.5f <= theta_(17) = %.5f <= 77/(9(m+3)) = %.5f | theta_none = %.4f | checks %.1e' % (
           mm, 16 / (3 * (mm + 3)), poly, ths, th17, 77 / (9 * (mm + 3)), th_none, max(abs(c - 1) for c in chk)))
print('ALL CHECKS PASSED')

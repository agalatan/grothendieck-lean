#!/usr/bin/env python3
"""The bipartite family of cubics and the largest sector-A ratio in it (PROBLEM_V2.md, section 3).   Floating point (N).

With X = y_0 the content direction, a cluster A of p variables and a cluster B of q variables (n = 1 + p + q):

    q = sqrt(u) [ a H(X) + X sum_j m_j (|Y_j|^2 - 1) + sum_{c in A} ( conj(Y_c) P_c(Y_B) + Y_c N_c(Y_B) ) ],

H(X) = X(|X|^2 - 2)/sqrt 2, P_c a holomorphic quadratic and N_c a (1,1)-form in the variables of B (Wick ordered),
a real, m_j complex: 1 + p + q + p(3q^2 + q)/2 coefficients, normalised to sum |coefficient|^2 = 1 in the orthonormal
basis of Wick monomials.  The script maximises   r = ||c[h_A]||^2 / (delta Omega-hat[h_A])   over the family:
  * delta = E|q|^4 - 2u^2 exactly (q as a polynomial; E y^a conj(y)^b = a! [a = b]);
  * the other integrals on a FITTING sample (scrambled Sobol points, 2^M2 of them); analytic gradient, L-BFGS-B;
  * the value printed FIRST is the ratio of the cubic found on two INDEPENDENT samples of 2^21 points (other scramble
    seeds): quote that one.  The value on the fitting sample ("fit") is biased upward.
Reference values (row 0.80, u = 0.85 u*):  p,q = 1,1: 0.1925;  1,2: 0.2104;  2,2: 0.2246;  2,3: 0.2378
(the largest ratios found over ALL cubics in n = 3, 4, 5, 6 variables are 0.1925, 0.2104, 0.2246, 0.2386).
Run time on one core with M2 = 20: 98, 194, 344 and 426 s (measured on a core shared with another job); about a third of
it is the evaluation on the independent samples.  With M2 = 16 the search for (1,1) takes seconds.

usage:  python3 ref/bipartite.py ROW U_OVER_USTAR P Q [SID] [M2] [KIT]
        e.g.  python3 ref/bipartite.py 0.80 0.85 1 2        (from the folder that contains kit/ and ref/)
ROW is 0.80, 0.82, 0.84, 0.845, 0.85 or 0.855;  SID 0, 1 (two starts and fitting samples), default 0;  M2 default 20.
Needs numpy and scipy only.
"""
import sys, json, math, itertools, time
import numpy as np
from math import factorial
from numpy.polynomial.laguerre import laggauss
from scipy.interpolate import CubicSpline
from scipy.optimize import minimize
from scipy.sparse import csr_matrix
from scipy.special import ive
from scipy.stats import qmc

TLO = {'0.80': 0.7850, '0.82': 0.8117, '0.84': 0.8348, '0.845': 0.8424, '0.85': 0.8476, '0.855': 0.8523}; E1 = 0.78

def rho(x):                                             # the response function of section 2
    return math.sqrt(math.pi) / 2 * ((1 + x) * ive(0, x / 2) + x * ive(1, x / 2))

def nodes(n, seed, m2):
    """2^m2 quasi-random points of C^n with the standard complex Gaussian law; the phase of y_0 is fixed (it is irrelevant)."""
    pts = qmc.Sobol(d=2 * n - 1, scramble=True, seed=seed).random_base2(m2); t = -np.log(1 - pts[:, :n] * (1 - 1e-12))
    return np.array([np.sqrt(t[:, 0]) + 0j] + [np.sqrt(t[:, j]) * np.exp(2j * np.pi * pts[:, n + j - 1]) for j in range(1, n)])

def monomials(n, y):
    """the orthonormal Wick monomials of H_{2,1}(C^n), with labels:  ('H', i): y_i(|y_i|^2 - 2)/sqrt2;  ('sq', i, k): y_i^2 conj(y_k)/sqrt2;
    ('cof', a, b): y_a(|y_b|^2 - 1);  ('mix', i, j, k): y_i y_j conj(y_k), i < j."""
    T = np.abs(y) ** 2; s2 = math.sqrt(2)
    for i in range(n): yield ('H', i), y[i] * (T[i] - 2) / s2
    for i in range(n):
        for k in range(n):
            if k != i: yield ('sq', i, k), y[i] ** 2 * np.conj(y[k]) / s2
    for a in range(n):
        for b in range(n):
            if a != b: yield ('cof', a, b), y[a] * (T[b] - 1)
    for i, j in itertools.combinations(range(n), 2):
        for k in range(n):
            if k != i and k != j: yield ('mix', i, j, k), y[i] * y[j] * np.conj(y[k])

def in_family(p, q):
    A = set(range(1, 1 + p)); Bq = set(range(1 + p, 1 + p + q))
    def keep(lab):
        if lab == ('H', 0) or (lab[0] == 'cof' and lab[1] == 0): return True          # the junta and X (|Y_j|^2 - 1)
        if 0 in lab[1:]: return False
        if lab[0] == 'sq': return lab[1] in Bq and lab[2] in A                         # conj(Y_c) Y_b^2
        if lab[0] == 'cof': return lab[1] in A and lab[2] in Bq                        # Y_c (|Y_b|^2 - 1)
        if lab[0] == 'mix':
            i, j, k = lab[1:]
            return (i in Bq and j in Bq and k in A) or (k in Bq and ((i in A and j in Bq) or (j in A and i in Bq)))
        return False
    return keep

class Quartic:
    """E|q|^4 for q = sum_b coef_b B_b (B_b the kept Wick monomials), exactly, with its gradient."""
    def __init__(self, n, labels):
        e = lambda *idx: tuple(sum(1 for i in idx if i == j) for j in range(n)); z = tuple([0] * n); s2 = math.sqrt(2); mono = {}; rows = []; cols = []; vals = []
        def add(ib, a, b, v):
            if (a, b) not in mono: mono[(a, b)] = len(mono)
            rows.append(mono[(a, b)]); cols.append(ib); vals.append(v)
        for ib, lab in enumerate(labels):
            if lab[0] == 'H': add(ib, e(lab[1], lab[1]), e(lab[1]), 1 / s2); add(ib, e(lab[1]), z, -2 / s2)
            elif lab[0] == 'sq': add(ib, e(lab[1], lab[1]), e(lab[2]), 1 / s2)
            elif lab[0] == 'cof': add(ib, e(lab[1], lab[2]), e(lab[2]), 1.0); add(ib, e(lab[1]), z, -1.0)
            else: add(ib, e(lab[1], lab[2]), e(lab[3]), 1.0)
        self.nm = len(mono); self.Lm = csr_matrix((vals, (rows, cols)), shape=(self.nm, len(labels))); keys = [None] * self.nm
        for key, i in mono.items(): keys[i] = key
        prod = {}; I1 = []; I2 = []; mult = []; KK = []
        for i in range(self.nm):
            for j in range(i, self.nm):
                K = (tuple(x + y for x, y in zip(keys[i][0], keys[j][0])), tuple(x + y for x, y in zip(keys[i][1], keys[j][1])))
                if K not in prod: prod[K] = len(prod)
                I1.append(i); I2.append(j); mult.append(1.0 if i == j else 2.0); KK.append(prod[K])
        self.I1 = np.array(I1); self.I2 = np.array(I2); self.mult = np.array(mult); self.KK = np.array(KK); nK = len(prod); pk = [None] * nK
        for K, i in prod.items(): pk[i] = K
        self.S = csr_matrix((np.ones(len(KK)), (self.KK, np.arange(len(KK)))), shape=(nK, len(KK))); groups = {}
        for i, (a, b) in enumerate(pk): groups.setdefault(tuple(x - y for x, y in zip(a, b)), []).append(i)
        gr = []; gc = []; gv = []
        for idx in groups.values():
            for i in idx:
                for j in idx: gr.append(i); gc.append(j); gv.append(float(np.prod([factorial(x + y) for x, y in zip(pk[i][0], pk[j][1])])))
        self.Gam = csr_matrix((gv, (gr, gc)), shape=(nK, nK))
    def value(self, coef):
        d = self.Lm @ coef; P = self.S @ (self.mult * d[self.I1] * d[self.I2]); W = self.Gam @ P; E4 = float(np.real(np.vdot(P, W)))
        cw = np.conj(W)[self.KK] * self.mult; gm = np.zeros(self.nm, complex); np.add.at(gm, self.I2, cw * d[self.I1]); np.add.at(gm, self.I1, cw * d[self.I2])
        return E4, self.Lm.T @ gm                                   # dE4 = 2 Re sum_b g_b dcoef_b

class Model:
    def __init__(self, row, frac, n, keep, seed=11, m2=20, kit='kit/profiles/'):
        """n variables; keep(label) selects the Wick monomials of the family (see monomials())."""
        d = json.load(open(kit + 'band_row_%s.json' % row)); S = np.array(d['S']); Gs = CubicSpline(S, np.array(d['GA']) + 0.4 * np.array(d['G0']))
        self.G = lambda s: Gs(np.minimum(s, S[-1])); self.u = u = frac * d['ustar']; self.row = row; self.tlo = d.get('t_lo', TLO.get(row, float('nan'))); self.n = n   # the low rows carry t_lo in the file
        sg = np.linspace(0, 6, 2401); H = np.empty_like(sg); H[1:] = self.G(sg[1:]) / sg[1:]; H[0] = 2 * H[1] - H[2]
        self.Hs = CubicSpline(sg, H, bc_type=((1, 0.0), 'not-a-knot')); self.dHs = self.Hs.derivative()               # h(v) = Hs(sqrt v), amplitudes up to 6
        tau, wtau = laggauss(64); v = sg ** 2; hfun = lambda vv: self.G(np.sqrt(np.maximum(vv, 1e-18))) / np.sqrt(np.maximum(vv, 1e-18))
        k = np.array([wtau @ hfun(vi + u * tau) for vi in v]); self.kp = CubicSpline(sg, (k - hfun(v)) / u); self.dkp = self.kp.derivative()   # k'(v) as a function of sqrt v
        self.y = nodes(n, seed, m2); N = self.y.shape[1]; self.w = np.full(N, 1.0 / N)
        self.labels = [lab for lab, _ in monomials(n, self.y[:, :2]) if keep(lab)]; self.dim = len(self.labels); self.keep = keep
        self.Bm = np.array([v_ for lab, v_ in monomials(n, self.y) if keep(lab)]); self.yc = np.conj(self.y); self.quart = Quartic(n, self.labels)
        self.sg = sg
    def parts(self, q):
        V = (q * np.conj(q)).real; s = np.sqrt(V); ins = s < 6.0; sc = np.where(ins, s, 6.0); s_ = np.maximum(s, 1e-9); return V, ins, sc, s_
    def fg(self, x):
        """minus the ratio on the fitting sample and its gradient; x = (Re coef, Im coef), normalised inside."""
        d = self.dim; nx = np.linalg.norm(x); xh = x / nx; coef = xh[:d] + 1j * xh[d:]; w = self.w; u = self.u; su = math.sqrt(u)
        q = su * (coef @ self.Bm); V, ins, sc, s_ = self.parts(q); E4, gq = self.quart.value(coef); delta = u * u * (E4 - 2.0)
        h = self.Hs(sc) * np.where(ins, 1.0, 6.0 / s_); cont = self.yc @ (w * q * h); N = float(np.sum(np.abs(cont) ** 2))
        kp = self.kp(sc); A2 = float(w @ (V * kp ** 2)); A1 = float(w @ (V * kp)); Om = 1.5 * A2 - 0.75 * A1 ** 2 / u; ratio = N / (delta * Om)
        hp = np.where(ins, self.dHs(sc) / (2 * s_), -self.Hs(6.0) * 6.0 / (2 * s_ ** 3)); kpp = np.where(ins, self.dkp(sc) / (2 * s_), 0.0)
        a = np.conj(cont) @ self.yc; qc = np.conj(q); GN = w * (a * (h + V * hp) + np.conj(a) * qc * qc * hp)
        GO = w * qc * (1.5 * (kp ** 2 + 2 * V * kp * kpp) - 1.5 * (A1 / u) * (kp + V * kpp))
        gam = su * (self.Bm @ (-ratio * (GN / N - GO / Om))) + (ratio / delta) * u * u * gq
        Gam = np.concatenate([2 * gam.real, -2 * gam.imag]); return -ratio, (Gam - xh * (xh @ Gam)) / nx
    def independent(self, coef, seed, m2=21):
        """ratio, chi, the response margin min_lambda [E rho(lambda^2 V) - lambda u / e_1], and the content vector, on a fresh sample."""
        u = self.u; su = math.sqrt(u); n = self.n; delta = u * u * (self.quart.value(coef)[0] - 2.0); y = nodes(n, seed, m2); N = y.shape[1]; lam = np.linspace(0.3, 3.0, 10)
        cont = np.zeros(n, complex); A1 = A2 = 0.0; Tl = np.zeros(len(lam))
        for i in range(0, N, 1 << 16):
            yy = y[:, i:i + (1 << 16)]; q = su * (coef @ np.array([v for lab, v in monomials(n, yy) if self.keep(lab)])); V, ins, sc, s_ = self.parts(q)
            h = self.Hs(sc) * np.where(ins, 1.0, 6.0 / s_); cont += np.conj(yy) @ (q * h); kp = self.kp(sc); A2 += float(np.sum(V * kp ** 2)); A1 += float(np.sum(V * kp)); Tl += np.array([float(np.sum(rho(l * l * V))) for l in lam])
        cont /= N; A1 /= N; A2 /= N; Tl /= N; Om = 1.5 * A2 - 0.75 * A1 ** 2 / u
        return float(np.sum(np.abs(cont) ** 2)) / (delta * Om), delta / u ** 2, float(np.min(Tl - lam * u / E1)), cont

def report(M, c0, title, m2, t0):
    """search from the start c0 and print the result (the independent-sample value first)."""
    x0 = np.concatenate([c0.real, c0.imag]); x0 = x0 / np.linalg.norm(x0)
    r_ = minimize(M.fg, x0, jac=True, method='L-BFGS-B', options={'maxiter': 900, 'maxfun': 1200, 'ftol': 1e-11, 'gtol': 1e-8})
    c = r_.x[:M.dim] + 1j * r_.x[M.dim:]; c = c / np.linalg.norm(c); c = c * np.conj(c[0]) / abs(c[0])          # global phase: the junta coefficient a > 0
    ra, chi, Ta, ct = M.independent(c, 23); rb, _, Tb, _ = M.independent(c, 41)
    sh = {'junta': 0.0, 'X Q': 0.0, 'R3': 0.0}
    for z, lab in zip(c, M.labels): sh['junta' if lab == ('H', 0) else ('X Q' if lab[1] == 0 else 'R3')] += abs(z) ** 2
    print(title)
    print('  ratio %.4f   (mean of two independent samples of 2^21 points: %.4f, %.4f)' % (0.5 * (ra + rb), ra, rb))
    print('  fit   %.4f   (the fitting sample, 2^%d points; biased upward, do not quote)' % (-r_.fun, m2))
    print('  chi = delta/u^2 = %.2f;  response margin %.4f against t_lo = %.4f (%s);  content along X: %.3f of ||c||^2' % (chi, min(Ta, Tb), M.tlo, 'a possible response' if min(Ta, Tb) >= M.tlo else 'NOT a possible response', abs(ct[0]) ** 2 / float(np.sum(np.abs(ct) ** 2))))
    print('  shares of the energy: junta %.3f, X Q %.3f, R3 %.3f;  eigenvalues m_j: %s' % (sh['junta'], sh['X Q'], sh['R3'], ', '.join('%.3f e^{%+.2f pi i}' % (abs(z), np.angle(z) / np.pi) for z, lab in zip(c, M.labels) if lab[0] == 'cof' and lab[1] == 0)))
    print('  %d iterations, %.0f s' % (r_.nit, time.time() - t0))
    if '--coef' in sys.argv:
        for z, lab in zip(c, M.labels): print('   ', lab, '%+.5f %+.5fi' % (z.real, z.imag))
    return c

if __name__ == '__main__':
    if len(sys.argv) < 5: print(__doc__); sys.exit(1)
    row = sys.argv[1]; frac = float(sys.argv[2]); p = int(sys.argv[3]); q = int(sys.argv[4]); sid = int(sys.argv[5]) if len(sys.argv) > 5 else 0; m2 = int(sys.argv[6]) if len(sys.argv) > 6 else 20
    kit = sys.argv[7] if len(sys.argv) > 7 else 'kit/profiles/'; t0 = time.time(); M = Model(row, frac, 1 + p + q, in_family(p, q), seed=11 + sid, m2=m2, kit=kit); n = M.n; rng = np.random.default_rng(9000 + 100 * p + 10 * q + sid)
    c0 = np.zeros(M.dim, complex)                                   # start: eigenvalues as at the maximisers found, the rest random
    for i, lab in enumerate(M.labels):
        if lab == ('H', 0): c0[i] = 0.40
        elif lab[0] == 'cof' and lab[1] == 0: c0[i] = (0.36 * np.exp(-0.26j * np.pi) * math.sqrt(2 / p) if lab[2] <= p else 0.30 * np.exp(0.18j * np.pi) * math.sqrt(2 / q)) * (0.5 if n == 3 else 1.0)
        else: c0[i] = 0.62 * (rng.standard_normal() + 1j * rng.standard_normal()) / math.sqrt(2 * max(M.dim - n, 1))
    report(M, c0, 'row %s, u = %.2f u*, bipartite p = %d, q = %d (n = %d, %d coefficients), start %d:' % (row, frac, p, q, n, M.dim, sid), m2, t0)

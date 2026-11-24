#!/usr/bin/env python3
"""The three-cluster family reduced to one scalar law (PROBLEM_V2.md, section 3).   Floating point (N).

Three clusters of c variables (x, y, z below; n = 3c + 1 with the content direction X).  R3 = sum of B y_a y_b conj(y_c)
over the 3 c^3 monomials with a, b, c in three different clusters.  Each monomial has one variable from each cluster, so
R3(y) = (S1 S2 S3)^(1/2) R3(omega), omega uniform on the product of the unit spheres, independent of the cluster sums S_k.
With eigenvalues constant on clusters,

    q = sqrt(u) [ X (a (|X|^2 - 2)/sqrt 2 + sum_k m_k (S_k - c)) + (s_R S1 S2 S3 / c^3 * G)^(1/2) e^{i psi} ],
    G = c^3 |R3(omega)|^2 / ||R3||^2  (E G = 1),   a^2 + c sum_k |m_k|^2 + s_R = 1,

and the ratio is an integral over |X|^2 ~ Exp(1), S_k ~ Gamma(c), G and one angle.  kappa = E G^2
= (c/(c+1))^3 E|R3|^4 / (E|R3|^2)^2  (Gaussian expectations; 2 for a conditionally Gaussian bulk, 1 for a fixed modulus).

  python3 ref/kappa.py explicit
        the cubic z_2 (conj(x_1) y_1 + conj(x_2) y_2) + conj(z_1) (x_1 y_2 - x_2 y_1) for c = 2: kappa = 4/3 exactly
  python3 ref/kappa.py min C [NSTARTS]
        minimise kappa over the 3 C^3 coefficients (exact fourth moments).  Found: 4/3, 1.5800, 1.6000, 1.7057, 1.7481,
        1.7930, 1.7997, 1.8476 for C = 2, 3, 4, 5, 6, 7, 8, 10 (seconds for C <= 5, a minute for C = 8, ten for C = 10)
  python3 ref/kappa.py formula ROW U_OVER_USTAR C KAPPA [KIT]
        the largest ratio of the formula over (a, m_k, s_R) with G ~ Gamma(k)/k, k = 1/(KAPPA - 1) (KAPPA = 2: exponential,
        the Gaussian bulk).  Row 0.80, 0.85 u*, C = 4, KAPPA = 1.6: this prints 0.272 (plain quasi-random sampling, good to
        about 1 %; product quadrature gives 0.2738).  About two minutes.
  python3 ref/kappa.py formula ROW U_OVER_USTAR C ref/bulk/bulk_cC.json [KIT] [--direct]
        the same with the law of G of the cubic in the file (the bulks of smallest kappa found are in ref/bulk/);
        --direct then evaluates the cubic in 3C + 1 variables on two independent samples, like the table entries
        (C = 4: 0.2743 by the formula, 0.2756 direct at 0.85 u*; 0.2470 and 0.2482 at u*; two minutes; C = 8: ten minutes).
The pieces below 0.80 (PROBLEM_V3.md): give the folder kit/profiles_low/ as KIT; ROW is the piece t and U_OVER_USTAR is in
units of the u* of its covering row; the response restriction is then taken at the t_lo of the file.  Example:
  python3 ref/kappa.py formula 0.70 1.612 4 ref/bulk/bulk_c4.json kit/profiles_low/ --direct
        formula 0.159 (product quadrature 0.1601), direct 0.1609 [0.1606, 0.1611], a possible response; 80 s
Needs numpy and scipy, ref/bipartite.py and ref/clusters.py beside it, and kit/profiles/ (kit/profiles_low/).
"""
import sys, os, json, math, time
import numpy as np
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from bipartite import Quartic, Model
from scipy.optimize import minimize
from scipy.stats import qmc, gamma as gamma_law

def family(c):
    n = 3 * c; cl = lambda j: j // c
    return [('mix', i, j, k) for i in range(n) for j in range(i + 1, n) for k in range(n) if len({cl(i), cl(j), cl(k)}) == 3]

def kappa_of(c, labels, coef, Q=None):
    Q = Q or Quartic(3 * c, labels); coef = np.asarray(coef, complex); return (c / (c + 1.0)) ** 3 * Q.value(coef)[0] / float(np.vdot(coef, coef).real) ** 2

def minimise(c, ns, seed=0):
    labels = family(c); Q = Quartic(3 * c, labels); d = len(labels); fac = (c / (c + 1.0)) ** 3; rng = np.random.default_rng(100 * c + seed); best = None; vals = []
    def fg(x):
        z = x[:d] + 1j * x[d:]; N = float(np.vdot(z, z).real); E4, g = Q.value(z); return fac * E4 / N ** 2, fac * (np.concatenate([2 * g.real, -2 * g.imag]) / N ** 2 - 4 * E4 * x / N ** 3)
    for _ in range(ns):
        x0 = rng.standard_normal(2 * d); r = minimize(fg, x0 / np.linalg.norm(x0), jac=True, method='L-BFGS-B', options={'maxiter': 4000, 'maxfun': 6000, 'ftol': 1e-13, 'gtol': 1e-9}); vals.append(r.fun)
        if best is None or r.fun < best.fun: best = r
    z = best.x[:d] + 1j * best.x[d:]; return labels, z / np.linalg.norm(z), sorted(vals)

def sample_G(c, labels, coef, N, rng):
    out = []
    for _ in range(max(1, N >> 16)):                                # in pieces of 2^16 points
        n1 = min(N, 1 << 16); y = rng.standard_normal((3 * c, n1)) + 1j * rng.standard_normal((3 * c, n1))
        for k in range(3): y[k * c:(k + 1) * c] /= np.linalg.norm(y[k * c:(k + 1) * c], axis=0)[None, :]
        r = np.zeros(n1, complex)
        for z, l in zip(coef, labels): r += z * y[l[1]] * y[l[2]] * np.conj(y[l[3]])
        out.append(c ** 3 * np.abs(r) ** 2 / float(np.vdot(coef, coef).real))
    G = np.concatenate(out); return G / G.mean()

class Formula:
    """the ratio as an integral over (|X|^2, S1, S2, S3, G, angle): quasi-random points for the first four and the angle."""
    def __init__(self, row, frac, c, G, kit, m2=18, seed=3):
        self.M = M = Model(row, frac, 2, lambda lab: lab == ('H', 0), seed=1, m2=4, kit=kit); self.u = M.u; self.c = c; N = 1 << m2
        U = qmc.Sobol(5, scramble=True, seed=seed).random(N); self.R = -np.log1p(-U[:, 0]); self.S = [gamma_law.ppf(U[:, 1 + k], c) for k in range(3)]; self.cosphi = np.cos(2 * np.pi * U[:, 4])
        self.G = np.random.default_rng(seed).permutation(np.resize(np.sort(G), N)) if len(G) != N else np.random.default_rng(seed).permutation(G)
        self.kappa = float(np.mean(np.asarray(G) ** 2))
    def ratio(self, a, ms, sR):
        u = self.u; c = self.c; R = self.R; A = a * (R - 2) / math.sqrt(2) + sum(m * (S - c) for m, S in zip(ms, self.S)); absA = np.abs(A)
        s2 = sR * self.S[0] * self.S[1] * self.S[2] / c ** 3 * self.G; cross = np.sqrt(R * s2) * self.cosphi; V = u * (R * absA ** 2 + s2 + 2 * absA * cross)
        s = np.sqrt(np.maximum(V, 1e-18)); ins = s < 6.0; sc = np.where(ins, s, 6.0); h = self.M.Hs(sc) * np.where(ins, 1.0, 6.0 / s); kp = self.M.kp(sc)
        cx = math.sqrt(u) * np.mean((R * A + (A / np.maximum(absA, 1e-12)) * cross) * h); Om = 1.5 * np.mean(V * kp ** 2) - 0.75 * np.mean(V * kp) ** 2 / u
        sig2 = sR * self.S[0] * self.S[1] * self.S[2] / c ** 3                      # delta without the noise of G and of the angle:
        delta = u * u * (np.mean(R ** 2 * absA ** 4 + 4 * R * absA ** 2 * sig2 + self.kappa * sig2 ** 2) - 2.0)   # E V^2 = u^2 E[R^2|A|^4 + 4 R|A|^2 sigma^2 + kappa sigma^4], E V = u
        return abs(cx) ** 2 / (delta * Om), delta / u ** 2, float(V.mean() / u)
    def unpack(self, x):
        v = np.asarray(x, float); a = abs(v[0]); m = v[1:4] + 1j * v[4:7]; sR = v[7] ** 2; nrm2 = a * a + self.c * float(np.sum(np.abs(m) ** 2)) + sR; return a / math.sqrt(nrm2), m / math.sqrt(nrm2), sR / nrm2

if __name__ == '__main__':
    if len(sys.argv) < 2: print(__doc__); sys.exit(1)
    mode = sys.argv[1]; t0 = time.time()
    if mode == 'explicit':
        labels = family(2); co = {('mix', 2, 5, 0): 1.0, ('mix', 3, 5, 1): 1.0, ('mix', 0, 3, 4): 1.0, ('mix', 1, 2, 4): -1.0}      # x = (y_0, y_1), y = (y_2, y_3), z = (y_4, y_5)
        print('c = 2, R3 = z_2 <x, y> + conj(z_1) (x ^ y):  kappa = %.10f  (4/3 = %.10f);  the first term alone: %.10f (16/9)' % (
            kappa_of(2, labels, [co.get(l, 0.0) for l in labels]), 4 / 3, kappa_of(2, labels, [co.get(l, 0.0) if l[3] < 2 else 0.0 for l in labels])))
    elif mode == 'min':
        c = int(sys.argv[2]); ns = int(sys.argv[3]) if len(sys.argv) > 3 else 4; labels, z, vals = minimise(c, ns)
        w = [float(sum(abs(a) ** 2 for a, l in zip(z, labels) if l[3] // c == k)) for k in range(3)]
        print('c = %d (%d coefficients): smallest kappa found %.6f; all starts: %s; one flat type alone: %.4f; weights of the three types %s  [%.0f s]' % (
            c, len(labels), vals[0], ', '.join('%.6f' % v for v in vals), 2 * (1 + 3 / c) / (1 + 1 / c) ** 3, ', '.join('%.3f' % a for a in w), time.time() - t0))
        if '--save' in sys.argv: json.dump(dict(c=c, kappa=vals[0], labels=[list(l) for l in labels], coef=[[round(float(a.real), 12), round(float(a.imag), 12)] for a in z]), open('bulk_c%d_found.json' % c, 'w'))
    elif mode == 'formula':
        row = sys.argv[2]; frac = float(sys.argv[3]); c = int(sys.argv[4]); src = sys.argv[5]; rest = [a for a in sys.argv[6:] if not a.startswith('--')]; kit = rest[0] if rest else 'kit/profiles/'; rng = np.random.default_rng(7 + c)
        if src.endswith('.json'):
            kj = json.load(open(src)); assert kj['c'] == c; labels = [tuple(l) for l in kj['labels']]; coef = np.array([complex(a, b) for a, b in kj['coef']]); G1 = sample_G(c, labels, coef, 1 << 18, rng); G2 = sample_G(c, labels, coef, 1 << 21, rng); name = 'the bulk of %s (kappa %.4f)' % (src, kj['kappa'])
        else:
            kap = float(src); kk = 1.0 / (kap - 1.0); G1 = gamma_law.ppf((np.arange(1 << 18) + 0.5) / (1 << 18), kk) / kk; G2 = gamma_law.ppf((np.arange(1 << 21) + 0.5) / (1 << 21), kk) / kk; name = 'G ~ Gamma(%.3f)/%.3f (kappa %.3f)' % (kk, kk, kap)
        F = Formula(row, frac, c, G1, kit); x0 = np.concatenate([[0.26], 0.55 / math.sqrt(3 * c) * np.cos(np.array([-0.12, -0.12, 0.24]) * np.pi), 0.55 / math.sqrt(3 * c) * np.sin(np.array([-0.12, -0.12, 0.24]) * np.pi), [0.79]])
        r_ = minimize(lambda x: -F.ratio(*F.unpack(x))[0], x0, method='Nelder-Mead', options={'maxiter': 900, 'xatol': 2e-4, 'fatol': 1e-8}); a, ms, sR = F.unpack(r_.x)
        F2 = Formula(row, frac, c, G2, kit, m2=21, seed=17); ra, chi, en = F2.ratio(a, ms, sR)
        print('row %s, u = %.2f u*, three clusters of %d (n = %d), %s:' % (row, frac, c, 3 * c + 1, name))
        print('  ratio %.4f   (the formula on an independent sample of 2^21 points; on the sample used for the search: %.4f)' % (ra, -r_.fun))
        print('  chi %.2f;  a^2 = %.3f, c sum |m_k|^2 = %.3f, s_R = %.3f;  m_k = %s  [%.0f s]' % (chi, a * a, c * float(np.sum(np.abs(ms) ** 2)), sR, ', '.join('%.3f e^{%+.2f pi i}' % (abs(z), np.angle(z) / np.pi) for z in ms), time.time() - t0))
        if '--direct' in sys.argv and src.endswith('.json'):
            from clusters import in_family
            n = 3 * c + 1; keep, cl = in_family([c, c, c]); M = Model(row, frac, n, keep, seed=11, m2=8, kit=kit); T = {l[1:]: z for l, z in zip(labels, coef / np.linalg.norm(coef))}; cf = np.zeros(M.dim, complex)
            for i, lab in enumerate(M.labels):
                if lab == ('H', 0): cf[i] = a
                elif lab[0] == 'cof': cf[i] = ms[cl[lab[2]]]
                else: p_, q_ = sorted(lab[1:3]); cf[i] = math.sqrt(sR) * T[(p_ - 1, q_ - 1, lab[3] - 1)]
            cf = cf / np.linalg.norm(cf); r1, chi1, T1, _ = M.independent(cf, 23); r2, _, T2, _ = M.independent(cf, 41)
            print('  the cubic in %d variables, direct: ratio %.4f (two independent samples of 2^21 points: %.4f, %.4f); chi %.2f; response margin %.4f against t_lo = %.4f (%s)  [%.0f s]' % (
                n, 0.5 * (r1 + r2), r1, r2, chi1, min(T1, T2), M.tlo, 'a possible response' if min(T1, T2) >= M.tlo else 'NOT a possible response', time.time() - t0))
    else: print(__doc__)

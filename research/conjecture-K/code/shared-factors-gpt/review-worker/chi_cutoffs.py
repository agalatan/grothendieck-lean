#!/usr/bin/env python3
# Reviewer (N): what Theorem 2 of the shared-factors package gives on the six band rows.
#   Theorem 2:  ||c[h]||^2 <= (13/2) delta^{3/2} E D_h^2(V),  so  ||c||^2 <= theta delta Omega_hat  as soon as
#       C sqrt(chi) <= theta,     C := (13/2) u E D_h^2(V) / Omega_hat[h]      (sqrt(delta) = u sqrt(chi)).
#   The cutoff is chi_cut = (theta_row / C)^2.
# Profiles and derivatives: data/prof_jets_<t>.npz (prof_jets.py: from the definitions, Taylor-mode derivatives).
#   D_h^2(v) = 3 E1^2 + max(E3^2, E2^2),  E1 = 2h' + 4v h'' = psi'',  E2 = 6h' = 3 psi'/r,  E3 = 6h' + 24 v h'' + 8 v^2 h''' = Gamma''',
#   psi = Gamma/r, r = sqrt v.
# Reported per row, profile and energy u/u* in {0.5, 0.75, 1, 1.3}:
#   C_G, chi_cut      with the exponential law of V (the Gaussian limit chi -> 0);
#   C_split           with the linear part split off (the remark after Corollary 3), optimised over the slope;
#   chi_(10)          the package's sup-norm test (10);
#   C_spike           the exact small-chi constant of the spike family: ratio/sqrt(chi) -> 0.4703 u (E[tau k'(u tau)])^2/Omega_hat;
# and the same C for laws of actual cubics: the spike family and sums of N independent Wick monomials, at chi = 1e-4 ... 1.
#   argv: <scripts dir> <data dir> <out json>
import sys, json, math
import numpy as np
from scipy.interpolate import CubicSpline
from scipy.special import j0
from scipy.optimize import minimize_scalar, brentq
sys.path.insert(0, sys.argv[1])
import prof_jets as PJ, siglib as L
DATA = sys.argv[2]
K3 = 3 * math.sqrt(6) / 4            # Corollary 3
C13 = 13 / 2

class Prof:
    R0 = 0.03
    def __init__(self, npz, X):
        self.R = npz['R']; G = npz['J'][:, X, :]; self.odd = npz['J0'][X, 1::2]
        cols = np.array([PJ.derived(r, g) for r, g in zip(self.R, G)])       # h, hp, E1, E2, E3
        v = self.R ** 2
        hpp = (cols[:, 2] - 2 * cols[:, 1]) / (4 * v)
        self.sp = [CubicSpline(self.R, c) for c in list(cols.T) + [hpp, G[:, 0]]]
        a1, a3, a5, a7 = self.odd
        t0 = np.array(PJ.derived_taylor(self.R[0], self.odd)); self.seam = float(np.abs(t0 - cols[0]).max() / np.abs(cols[0]).max())
        self.Ginf = float(G[-1, 0]); self.Rmax = float(self.R[-1])
    def ev(self, r):
        """h, h', E1, E2, E3, h'' at radii r (array)."""
        r = np.asarray(r, float); out = np.zeros((6,) + r.shape)
        lo = r < self.R0; hi = r > self.Rmax; mid = ~(lo | hi)
        if lo.any():
            t = PJ.derived_taylor(r[lo], self.odd)
            for i in range(5): out[i][lo] = t[i]
            out[5][lo] = 2 * self.odd[2] + 6 * self.odd[3] * r[lo] ** 2
        if mid.any():
            for i in range(6): out[i][mid] = self.sp[i](r[mid])
        if hi.any():                       # Gamma frozen beyond the grid (negligible weights there)
            g, rr = self.Ginf, r[hi]
            out[0][hi] = g / rr; out[1][hi] = -g / (2 * rr ** 3); out[2][hi] = 2 * g / rr ** 3; out[3][hi] = -3 * g / rr ** 3; out[4][hi] = 0.0
            out[5][hi] = 3 * g / (4 * rr ** 5)
        return out
    def G(self, r):
        r = np.asarray(r, float)
        a1, a3, a5, a7 = self.odd
        return np.where(r < self.R0, a1 * r + a3 * r ** 3 + a5 * r ** 5 + a7 * r ** 7, np.where(r > self.Rmax, self.Ginf, self.sp[6](np.clip(r, self.R0, self.Rmax))))

TQ, WQ = L.panels(list(np.linspace(0, 6, 25)) + list(np.linspace(6, 46, 21)[1:]), 8); WQ = WQ * np.exp(-TQ)      # tau ~ Exp(1)

def transforms(pr, u, v):
    """k'(v) = E h'(v + u tau), k''(v) = E h''(v + u tau)."""
    x = np.sqrt(v[:, None] + u * TQ[None, :]); e = pr.ev(x.ravel())
    return e[1].reshape(x.shape) @ WQ, e[5].reshape(x.shape) @ WQ

def D2(e, lam=0.0):
    return 3 * (e[2] - 2 * lam) ** 2 + np.maximum((e[4] - 6 * lam) ** 2, (e[3] - 6 * lam) ** 2)

def law_values(pr, u, v, w):
    """for a law of V (nodes v, weights w): E D_h^2, Omega_hat, E[V k'^2], E[V k']."""
    e = pr.ev(np.sqrt(v)); kp, kpp = transforms(pr, u, v)
    EVk2 = float(w @ (v * kp * kp)); EVk = float(w @ (v * kp))
    return dict(ED2=float(w @ D2(e)), Om=1.5 * EVk2 - 0.75 * EVk * EVk / u, EVk2=EVk2, EVk=EVk, e=e, kp=kp, kpp=kpp)

# laws ------------------------------------------------------------------------------------------------------------
TL, WL = L.panels(list(np.linspace(0, 8, 65)) + list(np.linspace(8, 60, 53)[1:]), 8); WL = WL * np.exp(-TL)
def exp_law(u): return u * TL, WL

TG = L.t_grid(40.0, 0.1)
def spike_law(u, chi):
    """Q = alpha p(X) + beta W with 168 alpha^4 = chi u^2: nodes of V = |Q|^2, weights, and the content kernel."""
    x = math.sqrt(chi / 168.0)                    # alpha^2/u = rho^2/(1 + 2 rho^2)
    rho = math.sqrt(x / (1 - 2 * x)); beta = math.sqrt(u / (1 + 2 * rho * rho))
    s, ws = L.s_grid(240 * rho + 14); p, w1, zp = L.limit_kernels(rho, s, TG)
    return (beta * s) ** 2, ws * p, beta * s, ws * w1, rho, beta

def nsum_law(u, N):
    """q = sqrt(u/N) sum_{j<=N} H(Y_j), H = Y(|Y|^2-2)/sqrt2:  radial density by Hankel inversion of phi_H(k/sqrt N)^N."""
    t, wt = L.panels(list(np.linspace(0, 2, 81)) + list(np.linspace(2, 44, 421)[1:]), 8); wt = wt * np.exp(-t)
    aH = np.sqrt(t / 2) * np.abs(t - 2)
    k, wk = L.panels(np.linspace(0, 16, 321), 8)
    phiH = np.array([float(wt @ j0(kk / math.sqrt(N) * aH)) for kk in k])
    phiN = phiH ** N
    s, ws = L.panels(list(np.linspace(0, 6, 241)) + list(np.linspace(6, 12, 61)[1:]), 6)
    dens = np.array([ss * float((wk * k * phiN) @ j0(k * ss)) for ss in s])
    m0, m2, m4 = float(ws @ dens), float(ws @ (dens * s ** 2)), float(ws @ (dens * s ** 4))
    return u * s ** 2, ws * dens, (m0, m2, m4 - 2 * m2 * m2)

out = []
ROWS = ('0.80', '0.82', '0.84', '0.845', '0.85', '0.855'); FR = (0.5, 0.75, 1.0, 1.3)
print('C = (13/2) u E D_h^2 / Omega_hat with the exponential law;  chi_cut = (theta/C)^2;  C_split: linear part removed;  chi_(10): the package\'s sup-norm test;')
print('C_spike: exact small-chi constant of the spike family (true ratio = C_spike sqrt(chi) as chi -> 0)\n')
for t in ROWS:
    npz = np.load('%s/prof_jets_%s.npz' % (DATA, t)); ustar = float(npz['ustar']); theta = float(npz['theta'])
    print('row t = %s   theta needed %.2f   u* = %.6f' % (t, theta, ustar))
    print('  %-4s %-5s | %9s %9s %10s | %9s %8s %10s | %10s | %8s %9s | %9s %9s' % ('prof', 'u/u*', 'E D_h^2', 'Omega_hat', 'C_G', 'chi_cut', 'C_split', 'chi_split', 'chi_(10)', 'C_spike', 'C_G/C_spk', 'M0=supD2', 'h\'(0)'))
    rowmin = dict(cut=1e9, split=1e9, t10=1e9)
    for X, name in ((0, 'A'), (1, 'B')):
        pr = Prof(npz, X)
        for fr in FR:
            u = fr * ustar; v, w = exp_law(u); a = law_values(pr, u, v, w)
            CG = C13 * u * a['ED2'] / a['Om']; cut = (theta / CG) ** 2
            # linear split
            def Cs(lam):
                return (abs(lam) * math.sqrt(K3) + math.sqrt(C13 * float(w @ D2(a['e'], lam)))) ** 2
            res = minimize_scalar(Cs, bounds=(-2 * abs(pr.odd[1]) - 1, 2 * abs(pr.odd[1]) + 1), method='bounded', options={'xatol': 1e-8})
            Csplit = u * res.fun / a['Om']; cut_s = (theta / Csplit) ** 2
            # the sup-norm test (10)
            rg = np.linspace(0, 3.5, 3501); vg = rg ** 2; eg = pr.ev(rg); kpg, kppg = transforms(pr, u, vg)
            M0 = float(D2(eg).max()); gprime = kpg ** 2 + 2 * vg * kpg * kppg; L0 = 2.25 * float(np.abs(gprime).max()); b = a['EVk2']
            t10 = (3 * theta * b / (u * (26 * M0 + 3 * theta * L0))) ** 2
            # spike family, chi -> 0
            m1 = float(WL @ (TL * a['kp']))                     # E[tau k'(u tau)]
            Cspk = (1024 / 168 ** 1.5) * u * m1 * m1 / a['Om']
            rowmin['cut'] = min(rowmin['cut'], cut); rowmin['split'] = min(rowmin['split'], cut_s); rowmin['t10'] = min(rowmin['t10'], t10)
            out.append(dict(t=t, prof=name, ufrac=fr, u=u, theta=theta, ED2=a['ED2'], Om=a['Om'], CG=CG, chi_cut=cut, lam=float(res.x), Csplit=Csplit, chi_split=cut_s,
                            M0=M0, L0=L0, b=b, chi_10=t10, Cspike=Cspk, hp0=float(pr.odd[1]), seam=pr.seam))
            print('  %-4s %-5g | %9.4f %9.6f %10.2f | %9.2e %8.2f %10.2e | %10.2e | %8.4f %9.0f | %9.2f %+9.4f' % (name, fr, a['ED2'], a['Om'], CG, cut, Csplit, cut_s, t10, Cspk, CG / Cspk, M0, pr.odd[1]), flush=True)
    print('  row cutoff (both profiles, all four energies): chi <= %.2e (Theorem 2 as stated); %.2e (with the linear split); %.2e (the test (10))\n' % (rowmin['cut'], rowmin['split'], rowmin['t10']))
    out.append(dict(t=t, rowmin=rowmin))

print('laws of actual cubics (row 0.84 and 0.855, u = u*): C(chi) = (13/2) u E D_h^2 / Omega_hat, and for the spike family the true ratio ||c||^2/(delta Omega_hat)')
for t in ('0.84', '0.855'):
    npz = np.load('%s/prof_jets_%s.npz' % (DATA, t)); ustar = float(npz['ustar']); theta = float(npz['theta']); u = ustar
    for X, name in ((0, 'A'), (1, 'B')):
        pr = Prof(npz, X); v, w = exp_law(u); a0 = law_values(pr, u, v, w); C0 = C13 * u * a0['ED2'] / a0['Om']
        line = ['exp: C = %.2f' % C0]
        for chi in (1e-6, 1e-4, 1e-2, 0.1, 1.0):
            vv, ww, sphys, wcont, rho, beta = spike_law(u, chi); a = law_values(pr, u, vv, ww)
            c = float(wcont @ pr.G(sphys)); ratio = c * c / (chi * u * u * a['Om'])
            line.append('spike chi=%g (c=%.3f): C = %.2f, true ratio %.2e = %.4f sqrt(chi), bound %.3g' % (chi, math.sqrt(2 * rho * rho / (1 + 2 * rho * rho)), C13 * u * a['ED2'] / a['Om'], ratio, ratio / math.sqrt(chi), C13 * u * a['ED2'] / a['Om'] * math.sqrt(chi)))
            out.append(dict(t=t, prof=name, law='spike', chi=chi, C=C13 * u * a['ED2'] / a['Om'], ratio=ratio))
        for N in (42, 420, 4200, 420000):
            vv, ww, chk = nsum_law(u, N); a = law_values(pr, u, vv, ww)
            line.append('sum of N=%d monomials (chi = %.4g; check: mass %.6f, E s^2 %.6f, excess %.5f): C = %.2f' % (N, 42 / N, chk[0], chk[1], chk[2], C13 * u * a['ED2'] / a['Om']))
            out.append(dict(t=t, prof=name, law='nsum', N=N, chi=42 / N, C=C13 * u * a['ED2'] / a['Om']))
        print('  row %s profile %s (theta %.2f): ' % (t, name, theta) + '\n      '.join(line), flush=True)
json.dump(out, open(sys.argv[3], 'w'), indent=1)

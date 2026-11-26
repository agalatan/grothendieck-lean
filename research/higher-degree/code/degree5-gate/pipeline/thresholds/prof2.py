#!/usr/bin/env python3
"""Radial profiles of one capped row with their EXACT s-derivatives (N, accurate quadrature).  claude-b9ee worker d5newcap, 16 Nov 2026.

Replaces prof.py + tilt.py + mu_tilt.py of the content study for this folder.  Why: the study tabulated Gamma_A, Gamma_B, Gamma_0
on a polar z-grid centred at 0 (table accuracy about 1e-4, because ph A+ has a vortex at the zero of A+) and took Gamma' as
the derivative of a cubic spline through that table; with table spacings 0.0005-0.0025 that derivative is wrong by 1e-2 to
4e-2 at small radii, and the law-layer test (a maximum over laws) exploits it (coordinator's note of 16 Nov, from the review).

Here, with A+ = L'(z) + s D(z),  L' = z g(|z|^2),  g(T) = l + beta (T - 2) + nu5 (T^2 - 6 T + 6)/sqrt 12,
D = 1 - bA e11 - bB e20  (e11 = |z|^2 - 1, e20 = z^2/sqrt 2), and the symmetry A-(z) = -A+(-z):
    psi(s)  = 2 E|A+|                              psi'(s) = 2 E Re(conj(ph A+) D)
    G_X(s)  = 2 Re E[conj(e_X) ph A+]               G_X'(s) = 2 Re E[conj(e_X) i ph(A+) Im(conj(ph A+) D)/|A+|]     (e_X = e11, e20, 1)
    M(s)    = E[Im(B conj ph A+) Im(B conj ph A+)^T / |A+|]   (second variation; B = the four real directions)
The derivative is that of the defining integral (d ph(A)/ds = i ph(A) Im(conj(ph A) D)/|A|), not of an interpolant.
Quadrature: a smooth partition of unity.  The zeros of A+ lie on the real axis (found by root bracketing); around each zero x0
a disc carries the integrand times a C-infinity bump, in polar coordinates centred at x0 (there ph A+ and rho/|A+| are smooth
in the radius for each direction); the rest, which vanishes near the zeros, is integrated on the polar grid centred at 0.
Checks printed by the main: (i) exact derivative against a central difference of direct values at three small radii,
(ii) against a finer quadrature, (iii) the spline derivative of the table, for the record.
usage: D5_E1=.. D5_ETA=.. prof2.py k [s,t s,t ...]      (k = line of rows5.lines; tilts for the margins, default 0,0 0.4,0.3)
       -> out/prof_<k>.npz (S, psi, GA, GB, G0, dpsi, dGA, dGB, dG0, M, rec), out/mu_<k>.json, a log on stdout"""
import sys, os, json, math, time
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.optimize import brentq
from scipy.interpolate import CubicSpline

E1, ETA = float(os.environ['D5_E1']), float(os.environ['D5_ETA'])
SQ12, SQ2 = math.sqrt(12.0), math.sqrt(2.0)
SGRID = np.concatenate([np.linspace(0, 0.02, 41), np.linspace(0.02, 1.2, 473)[1:], np.linspace(1.2, 6.0, 193)[1:]])

def bump(x):
    """C-infinity cut-off: 1 for x <= 1/2, 0 for x >= 1."""
    t = np.clip(2.0 * (1.0 - np.asarray(x, float)), 0.0, 1.0)
    out = np.zeros_like(t); out[t >= 1.0] = 1.0
    m = (t > 0.0) & (t < 1.0); tm = t[m]
    a = np.exp(-1.0 / tm); b = np.exp(-1.0 / (1.0 - tm)); out[m] = a / (a + b)
    return out

def gfun(rec, T): return rec['l'] + rec['beta'] * (T - 2) + rec['nu5'] * (T * T - 6 * T + 6) / SQ12

def parts(rec, z):
    T = z.real ** 2 + z.imag ** 2
    e11 = T - 1.0; e20 = z * z / SQ2
    return z * gfun(rec, T), 1.0 - rec['bA'] * e11 - rec['bB'] * e20, e11, e20

def real_zeros(rec, s, R=7.5, n=3001):
    """zeros of A+ on the real axis (A+ is real there)."""
    f = lambda x: x * gfun(rec, x * x) + s * (1.0 - rec['bA'] * (x * x - 1.0) - rec['bB'] * x * x / SQ2)
    x = np.linspace(-R, R, n); v = f(x); roots = [float(x[i]) for i in np.where(v == 0.0)[0]]
    for i in np.where(np.sign(v[:-1]) * np.sign(v[1:]) < 0)[0]:
        roots.append(brentq(f, x[i], x[i + 1], xtol=1e-15, rtol=1e-15))
    return sorted(roots)

class Quad:
    def __init__(self, npan=64, nq=8, nth=512, R=6.8, dpan=16, dth=256):
        x, w = leggauss(nq); ed = np.linspace(0, R, npan + 1)
        r = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(npan)])
        wr = np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(npan)]) * 2 * r * np.exp(-r * r)
        th = (np.arange(nth) + 0.5) * 2 * np.pi / nth
        self.zb = (r[:, None] * np.exp(1j * th)[None, :]).ravel(); self.wb = (wr[:, None] * np.ones(nth)[None, :] / nth).ravel()
        ed = np.linspace(0, 1, dpan + 1)
        rho = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(dpan)])
        wrho = np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(dpan)])
        ph = (np.arange(dth) + 0.5) * 2 * np.pi / dth
        self.dz = (rho[:, None] * np.exp(1j * ph)[None, :]).ravel()
        self.dw = ((wrho * rho * bump(rho))[:, None] * np.ones(dth)[None, :] * (2.0 / dth)).ravel()       # bump(rho) rho drho dphi / pi
    def nodes(self, zeros, rad=1.0):
        """nodes and weights for E_z of a function whose only singular points are the real numbers in zeros."""
        zs = sorted(zeros); wsum = np.zeros(len(self.zb)); Z, W = [], []
        for x0 in zs:
            d = min([abs(x0 - y) for y in zs if y != x0] + [np.inf]); rj = min(rad, 0.9 * d)
            wsum += bump(np.abs(self.zb - x0) / rj)
            zz = x0 + rj * self.dz
            Z.append(zz); W.append(self.dw * rj * rj * np.exp(-(zz.real ** 2 + zz.imag ** 2)))
        Z.append(self.zb); W.append(self.wb * (1.0 - wsum))
        return np.concatenate(Z), np.concatenate(W)

def tilt_cost(sa, tb):
    p1 = 1.0 / E1
    C = np.diag([p1 - sa ** 2, p1 - sa ** 2, p1 - tb ** 2, p1 - tb ** 2])
    C[0, 2] = C[2, 0] = -sa * tb; C[1, 3] = C[3, 1] = -sa * tb
    return C

def eval_s(rec, s, Q, tilts=(), deriv=True):
    zeros = real_zeros(rec, s)
    z, w = Q.nodes(zeros)
    base, Dz, e11, e20 = parts(rec, z)
    A = base + s * Dz; a = np.maximum(np.abs(A), 1e-300); p = A / a; cpj = np.conj(p)
    out = dict(nz=len(zeros), psi=2 * float(w @ a))
    gA = 2 * (w @ (e11 * p)); gB = 2 * (w @ (np.conj(e20) * p)); g0 = 2 * (w @ p)
    out.update(GA=gA.real, GB=gB.real, G0=g0.real, GAi=gA.imag, GBi=gB.imag)
    if deriv:
        dp = 1j * p * np.imag(cpj * Dz) / a
        out.update(dpsi=2 * float(w @ np.real(cpj * Dz)), dGA=2 * float(np.real(w @ (e11 * dp))), dGB=2 * float(np.real(w @ (np.conj(e20) * dp))),
                   dG0=2 * float(np.real(w @ dp)))
        wa = w / a
        def Mmat(Bm):
            Im_ = np.imag(Bm * cpj[None, :]); M = (Im_ * wa[None, :]) @ Im_.T; return (M + M.T) / 2
        out['M'] = Mmat(np.array([e11 + 0j, 1j * e11, e20, 1j * e20]))
        out['tilt'] = {}
        for sa, tb in tilts:
            Mi = Mmat(np.array([e11 + sa + 0j, 1j * (e11 + sa), e20 + tb, -1j * e20 + 1j * tb])); C = tilt_cost(sa, tb)
            Li = np.linalg.inv(np.linalg.cholesky(C))
            out['tilt'][(sa, tb)] = (float(np.linalg.eigvalsh(Li @ Mi @ Li.T)[-1]), float(np.linalg.eigvalsh(C - Mi)[0]))
    return out

def tables(rec, S=SGRID, Q=None, tilts=()):
    Q = Q or Quad(); keys = ('psi', 'GA', 'GB', 'G0', 'GAi', 'GBi', 'dpsi', 'dGA', 'dGB', 'dG0')
    T = {k: np.zeros(len(S)) for k in keys}; T['M'] = np.zeros((len(S), 4, 4)); T['nz'] = np.zeros(len(S), int)
    mu = {tl: np.zeros((len(S), 2)) for tl in tilts}
    for i, s in enumerate(S):
        o = eval_s(rec, float(s), Q, tilts)
        for k in keys: T[k][i] = o[k]
        T['M'][i] = o['M']; T['nz'][i] = o['nz']
        for tl in tilts: mu[tl][i] = o['tilt'][tl]
    return T, mu

if __name__ == '__main__':
    k = int(sys.argv[1]); t0 = time.time()
    tilts = [tuple(float(x) for x in a.split(',')) for a in sys.argv[2:]] or [(0.0, 0.0), (0.4, 0.3)]
    rec = json.loads(open('rows5.lines').read().splitlines()[k - 1])
    Q = Quad(); T, mu = tables(rec, SGRID, Q, tilts)
    print('row t=%s (game e1 %s eta %s): %d radii, zeros of A+ per radius: min %d max %d; max |imag| GA %.1e GB %.1e; rho_AB(0) %.6f  [%.0fs]' % (
        rec['t'], E1, ETA, len(SGRID), T['nz'].min(), T['nz'].max(), np.abs(T['GAi']).max(), np.abs(T['GBi']).max(), np.linalg.eigvalsh(T['M'][0])[-1] * E1, time.time() - t0), flush=True)
    # ---- checks of the derivative: central difference of direct values; finer quadrature; the spline derivative of the table
    Qf = Quad(npan=96, nth=768, dpan=24, dth=384); spl = {n: CubicSpline(SGRID, T[n]) for n in ('GA', 'GB', 'G0')}
    old = None
    if os.path.exists('out/prof_%d_spline.npz' % k):
        d_ = np.load('out/prof_%d_spline.npz' % k); old = {n: CubicSpline(d_['S'], d_[n]) for n in ('GA', 'GB', 'G0') if n in d_}
    worst = 0.0
    for s0 in (0.02, 0.088, 0.25, 0.6):
        h = 1e-4; op, om, oc, of = eval_s(rec, s0 + h, Q, deriv=False), eval_s(rec, s0 - h, Q, deriv=False), eval_s(rec, s0, Q), eval_s(rec, s0, Qf)
        for n in ('GA', 'GB', 'G0'):
            cd = (op[n] - om[n]) / (2 * h); ex = oc['d' + n]; worst = max(worst, abs(cd - ex), abs(of['d' + n] - ex))
            print('  check s = %.3f %s: value %.9f (finer quadrature %+.1e) | derivative: exact %.8f | central difference of direct values %.8f (diff %+.1e) | finer quadrature %+.1e | spline of this table %+.1e%s' % (
                s0, n, oc[n], of[n] - oc[n], ex, cd, cd - ex, of['d' + n] - ex, float(spl[n](s0, 1)) - ex,
                (' | spline of the study-style table (polar grid at 0) %+.1e' % (float(old[n](s0, 1)) - ex)) if old and n in old else ''), flush=True)
    print('  largest |central difference - exact| and |finer - exact| over the checks: %.2e' % worst, flush=True)
    os.makedirs('out', exist_ok=True)
    np.savez('out/prof_%d.npz' % k, S=SGRID, rec=json.dumps(rec), exact_deriv=1, **{n: T[n] for n in ('psi', 'GA', 'GB', 'G0', 'GAi', 'GBi', 'dpsi', 'dGA', 'dGB', 'dG0', 'M')})
    res = dict(t=rec['t'], k=k, quadrature='prof2 (partition of unity at the zeros of A+)', tilts=[])
    sel = SGRID <= 3.0
    for tl in tilts:
        arr = mu[tl][sel]; i = int(np.argmin(arr[:, 1]))
        res['tilts'].append(dict(s=tl[0], t=tl[1], mu=float(arr[i, 1]), at_q=float(SGRID[sel][i]), mu_at_0=float(arr[0, 1]), ratio_max=float(arr[:, 0].max())))
        print('  tilt (%.2f, %.2f): mu = %.5f at |q| = %.3f (mu at 0: %.5f; worst curvature/cost %.5f)' % (tl[0], tl[1], arr[i, 1], SGRID[sel][i], arr[0, 1], arr[:, 0].max()), flush=True)
    json.dump(res, open('out/mu_%d.json' % k, 'w'), indent=1)
    print('  done in %.0fs' % (time.time() - t0), flush=True)

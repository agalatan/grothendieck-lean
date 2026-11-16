# One-spike family through the sector expansion (N).  q = sigma (c H21(y) + sqrt(1-c^2) W), y one remote coordinate,
# W diffuse.  Value = E Psi5(|q|) - cost  +  sum_j  max_a [ Re(conj(a) gam_j) + (1/2)|a|^2 A2_j - (1/2) Re(a^2 B2_j) - c_j |a|^2 ],
# where the adversary's sector j uses the spike polynomial e_{H_j}(y) (the only part of H_j(w) that survives the
# diffuse limit), gam_j = E[Gamma_j(q) conj(e_H(y))] is its first-order content and A2, B2 its exact second variation.
import sys, os, json, math; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng as D, sectors as SC
from numpy.polynomial.legendre import leggauss
from scipy.interpolate import CubicSpline
from scipy.optimize import minimize

FIRST = ['rA', 'rB', 'p10', 'p01', 'p21', 'p12', 'p30']

def profiles(rec, smax=6.0, ns=241):
    z, wz = D.zgrid(half=True)
    T = np.abs(z) ** 2
    L = z * (rec['l'] + rec['beta'] * (T - 2)); base = L + rec['nu5'] * D.e_ab(3, 2, z)
    Dz = 1 - rec['bA'] * D.e_ab(1, 1, z) - rec['bB'] * D.e_ab(2, 0, z)
    idx = {s[0]: i for i, s in enumerate(SC.SECT)}
    S = np.linspace(0, smax, ns)
    G = {nm: np.zeros(ns) for nm in FIRST}; A2 = {nm: np.zeros(ns) for nm in FIRST}; B2 = {nm: np.zeros(ns) for nm in FIRST}
    PS = np.zeros(ns)
    Ej = {nm: D.e_ab(SC.SECT[idx[nm]][2], SC.SECT[idx[nm]][3], z) for nm in FIRST}
    sg = {nm: (1.0 if SC.SECT[idx[nm]][1] == 'h' else -1.0) for nm in FIRST}
    for i, s in enumerate(S):
        Ap, Am = base + s * Dz, base - s * Dz; aP, aM = np.abs(Ap), np.abs(Am); pP, pM = Ap / aP, Am / aM
        PS[i] = (aP + aM) @ wz
        for nm in FIRST:
            e = Ej[nm]
            G[nm][i] = np.real((np.conj(e) * (pP + sg[nm] * pM)) @ wz)
            A2[nm][i] = np.real((np.abs(e) ** 2 * (1 / (2 * aP) + 1 / (2 * aM))) @ wz)
            B2[nm][i] = np.real((e * e * (np.conj(pP) ** 2 / (2 * aP) + np.conj(pM) ** 2 / (2 * aM))) @ wz)
    return S, PS, G, A2, B2

def ygrid(npan=36, nq=6, nth=96, R=6.0):
    x, w = leggauss(nq); ed = np.linspace(0, R, npan + 1)
    r = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(npan)])
    wr = np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(npan)]) * 2 * r * np.exp(-r * r)
    return r, wr / wr.sum()

class Spike:
    def __init__(self, rec, e1=D.E1, eta=D.ETA):
        self.rec, self.e1, self.eta = rec, e1, eta
        self.S, PS, G, A2, B2 = profiles(rec)
        self.ps = CubicSpline(self.S, PS); self.g = {k: CubicSpline(self.S, v) for k, v in G.items()}
        self.a2 = {k: CubicSpline(self.S, v) for k, v in A2.items()}; self.b2 = {k: CubicSpline(self.S, v) for k, v in B2.items()}
        r, wr = ygrid(); th = (np.arange(96) + 0.5) * 2 * np.pi / 96
        R, TH = np.meshgrid(r, th, indexing='ij'); self.y = (R * np.exp(1j * TH)).ravel(); self.wy = (wr[:, None] * np.ones(96)[None] / 96).ravel()
        self.Wr, self.wW = ygrid(npan=30, nq=6)
        idx = {s[0]: i for i, s in enumerate(SC.SECT)}
        self.meta = {nm: (SC.SECT[idx[nm]][1], SC.remote(*SC.SECT[idx[nm]][1:])) for nm in FIRST}
        self.eH = {nm: D.e_ab(self.meta[nm][1][0], self.meta[nm][1][1], self.y) for nm in FIRST}
        self.cj = {nm: self.meta[nm][1][0] - self.meta[nm][1][1] for nm in FIRST}
        self.Hy = D.e_ab(2, 1, self.y)
    def value(self, sig, c, detail=False):
        rec = self.rec; smax = self.S[-1]
        Wr = self.Wr if c < 1 else np.array([0.0]); wW = self.wW if c < 1 else np.array([1.0])
        q = sig * (c * self.Hy[:, None] + math.sqrt(max(1 - c * c, 0)) * Wr[None, :])     # (Ny, NW)
        W2 = self.wy[:, None] * wW[None, :]
        s = np.minimum(np.abs(q), smax); ph = np.where(np.abs(q) > 0, q / np.maximum(np.abs(q), 1e-300), 1.0)
        val = (W2 * self.ps(s)).sum() - sig ** 2 / self.e1 + (rec['bA'] ** 2 + rec['bB'] ** 2) * sig ** 2 / self.eta - rec['nu5'] ** 2 / self.eta
        gains = {}
        for nm in FIRST:
            side, H = self.meta[nm]; cst = 1 / self.e1 if side == 'k' else 1 / self.eta; cj = self.cj[nm]
            eH = self.eH[nm][:, None]
            gam = (W2 * self.g[nm](s) * ph ** cj * np.conj(eH)).sum()
            A2 = (W2 * np.abs(eH) ** 2 * self.a2[nm](s)).sum()
            B2 = (W2 * eH ** 2 * np.conj(ph) ** (2 * cj) * self.b2[nm](s)).sum()
            # maximise Re(conj(a) gam) + 0.5|a|^2 A2 - 0.5 Re(a^2 B2) - cst |a|^2 over a = x + i y
            # quadratic form: -[x y] M [x y]^T with M = (cst - A2/2) I + (1/2) [[Re B2, -Im B2], [-Im B2, -Re B2]]
            M = (cst - A2 / 2) * np.eye(2) + 0.5 * np.array([[B2.real, -B2.imag], [-B2.imag, -B2.real]])
            v = np.array([gam.real, gam.imag])
            ev = np.linalg.eigvalsh(M)
            gains[nm] = 0.25 * v @ np.linalg.solve(M, v) if ev[0] > 0 else float('inf')
        tot = val + sum(gains.values())
        return (tot, val, gains) if detail else tot

if __name__ == '__main__':
    rec = json.loads(sys.argv[1])
    sp = Spike(rec)
    # Gaussian reference on the same quadrature: c = 0
    best0 = max((sp.value(s, 0.0), s) for s in np.linspace(0.0, 0.5, 51))
    print('Gaussian family (c=0) on this quadrature: %.8f at sigma %.3f' % best0)
    out = []
    for c in (0.0, 0.3, 0.6, 0.8, 0.9, 0.95, 1.0):
        res = minimize(lambda x: -sp.value(abs(x[0]), c), [0.08 if c > 0.5 else 0.2], method='Nelder-Mead', options={'xatol': 1e-6, 'fatol': 1e-12})
        sig = abs(res.x[0]); tot, val, g = sp.value(sig, c, detail=True)
        out.append(dict(c=c, sig=sig, total=tot, qonly=val, gains=g))
        print('c=%.2f sigma=%.4f  total-Gauss=%+.3e  q-only-Gauss=%+.3e  gains: %s' % (c, sig, tot - best0[0], val - best0[0], ' '.join('%s %.2e' % (k, v) for k, v in g.items())), flush=True)
    json.dump(dict(rec=rec, gauss=best0, scan=out), open(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'out', 'spike_t%.3f.json' % rec['t']), 'w'), indent=1)

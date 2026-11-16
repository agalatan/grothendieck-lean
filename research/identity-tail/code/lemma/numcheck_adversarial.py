"""Adversarial FLOAT search for counterexamples to Theorem 1 of PROOF.tex (claude-b9ee worker, stage 0b, 15 Nov 2026).  N only.

Parameters are drawn from wide, extreme ranges (e_min/e_max down to 1e-4, R/sig in 1e-4 .. 1e2, nu/sig in 0 .. 1e2), g = gstar(R).
(R) reduced 2-angle form (Lemma 3): minimise  Gamma_s^2 N - Ht^2  normalised by Gamma_s^2 N + Ht^2  over (phi, psi) and s in [0, 2R]:
    200 x 200 grid + Nelder-Mead from the 8 best grid points;
(F) the full lemma: minimise  [Phi_d - (g/16) h^2 - Psi_nu](L + p, L - p) / (1 + |Phi_d|)  over p in C and |L| in [0, R] by
    Nelder-Mead from 24 starts (random, near the binding far vertex, near the tangent point, on the radial line).
usage: python3 numcheck_adversarial.py [ncase] [seed]"""
import sys, numpy as np
from scipy.optimize import minimize
from numcheck import psi, phi_d, centre, gstar

def draw(rng):
    sig = 1.0
    q = 10 ** rng.uniform(-4, 0) if rng.random() < 0.5 else rng.uniform(0.2, 1)   # e_min/e_max
    e2 = sig / (1 + q); e3 = sig - e2
    if rng.random() < 0.5: e2, e3 = e3, e2
    nu = 0.0 if rng.random() < 0.1 else 10 ** rng.uniform(-3, 2)
    R = 10 ** rng.uniform(-4, 2)
    return nu, e2 + nu, e3 + nu, R

def reduced(e2, e3, s):
    sg = e2 + e3; eta = (e3 - e2) / (e2 * e3); dl = abs(e3 - e2); G = 4 + abs(eta) * (s + dl)
    def F(v):
        f = np.exp(1j * v[0]); g = np.exp(1j * v[1]); N = abs(s - e2 * f - e3 * g) ** 2
        Ht = 2 * s * (f.real - g.real) + eta * (sg * sg - s * s)
        return (G * G * N - Ht * Ht) / (G * G * N + Ht * Ht + 1e-300)
    return F

if __name__ == "__main__":
    ncase = int(sys.argv[1]) if len(sys.argv) > 1 else 200; seed = int(sys.argv[2]) if len(sys.argv) > 2 else 7
    rng = np.random.default_rng(seed); worstR = (np.inf, None); worstF = (np.inf, None); th = np.linspace(-np.pi, np.pi, 200)
    PH, PS = np.meshgrid(th, th, indexing='ij')
    for k in range(ncase):
        nu, d2, d3, R = draw(rng); e2, e3 = d2 - nu, d3 - nu; c0, c1 = centre(d2, d3, nu); g = gstar(d2, d3, nu, R)
        # (R)
        for s in (0.0, 2 * R, 2 * R * rng.random(), abs(e3 - e2)):
            F = reduced(e2, e3, s); f = np.exp(1j * PH); gg = np.exp(1j * PS); sg = e2 + e3; eta = (e3 - e2) / (e2 * e3)
            G = 4 + abs(eta) * (s + abs(e3 - e2)); N = abs(s - e2 * f - e3 * gg) ** 2; Ht = 2 * s * (f.real - gg.real) + eta * (sg * sg - s * s)
            V = (G * G * N - Ht * Ht) / (G * G * N + Ht * Ht + 1e-300); idx = np.argsort(V.ravel())[:8]
            for i in idx:
                r = minimize(F, [PH.ravel()[i], PS.ravel()[i]], method='Nelder-Mead', options=dict(xatol=1e-12, fatol=1e-16, maxiter=2000))
                if r.fun < worstR[0]: worstR = (r.fun, dict(nu=nu, d2=d2, d3=d3, s=s, phi=r.x.tolist()))
        # (F)
        def E(v):
            l = R * (np.tanh(v[2]) + 1) / 2; p = v[0] + 1j * v[1]
            M = phi_d(l, p, d2, d3, nu) - g / 16 * (4 * l * p.real - c0 - c1 * l * l) ** 2
            Fv = psi(np.array([l + p]), np.array([l - p]), nu)[0]
            return (M - Fv) / (1 + abs(M))
        sc = max(R, nu, d2, d3); starts = []
        D = d2 * d3 - nu * nu; cP = (d2 + d3 - 2 * nu) / (2 * D); l = R; c = c0 + c1 * l * l
        for sgn in (1.0, -1.0):          # vertex of the far piece of sign sgn at |L| = R
            b0 = (d3 - d2) * l / D - 2 * sgn; al = cP - g * l * l; be = b0 + g * l * c / 2
            if al > 0: starts.append([-be / (2 * al), 0.0, 8.0])
        for _ in range(16): starts.append([rng.standard_normal() * sc * 3, rng.standard_normal() * sc, rng.uniform(-3, 8)])
        for _ in range(6): starts.append([rng.uniform(-4, 4) * sc, 0.0, rng.uniform(-3, 8)])
        for st in starts:
            r = minimize(E, st, method='Nelder-Mead', options=dict(xatol=1e-12, fatol=1e-16, maxiter=1500))
            if r.fun < worstF[0]: worstF = (r.fun, dict(nu=nu, d2=d2, d3=d3, R=R, p=[r.x[0], r.x[1]], l=R * (np.tanh(r.x[2]) + 1) / 2))
        if (k + 1) % 50 == 0: print(f"  {k+1} cases: worst reduced {worstR[0]:+.3e}, worst full {worstF[0]:+.3e}", flush=True)
    print(f"ADVERSARIAL seed={seed} cases={ncase}: (R) min normalised (Gamma^2 N - Ht^2) = {worstR[0]:+.3e} at {worstR[1]}")
    print(f"  (F) min normalised (majorant - Psi_nu) over p in C, |L| <= R, g = gstar(R) = {worstF[0]:+.3e} at {worstF[1]}")

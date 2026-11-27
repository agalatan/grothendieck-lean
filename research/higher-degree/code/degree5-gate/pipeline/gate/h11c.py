# [copy from degree5-cert/{gate/code,share/code,capgate}; claude-b9ee worker d5newcap, 16 Nov 2026: module path made local,
#  game constants from the environment D5_E1, D5_ETA (d5eng.py); nothing else changed]
# Item 3: the 7.2.10 analogue at degree 5 for the k-side odd sectors O = z Q + zbar P (Q in H11, P in H20; nu3 is a global
# constant and is treated separately), cost p1 = 1/e1.  Pointwise in s = |q| (arbitrary sharing), exact, finite amplitude:
#   ratio_inf(s) = worst-direction second variation / (p1 ||O||^2),
#   Emax(s) = max_{O} [ E_z(|A+ + O| + |A- - O| - |A+| - |A-|) - p1 ||O||^2 ]  (>= 0; > 0 means arbitrary-sharing pure cost fails),
# and the W-averaged independent-driver curve (real driver, worst fixed phase) for z Q at finite amplitude.  N.
import sys, os, json, math; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng as D
from numpy.polynomial.laguerre import laggauss
from scipy.optimize import minimize

def run(rec):
    p1 = 1 / D.E1
    z, wz = D.zgrid(half=False); T = np.abs(z) ** 2
    base = z * (rec['l'] + rec['beta'] * (T - 2)) + rec['nu5'] * D.e_ab(3, 2, z)
    Dz = 1 - rec['bA'] * D.e_ab(1, 1, z) - rec['bB'] * D.e_ab(2, 0, z)
    B = np.array([z, 1j * z, np.conj(z), 1j * np.conj(z)])          # Re Q, Im Q, Re P, Im P
    out = dict(t=rec['t'], pointwise=[])
    for s in np.linspace(0, 1.2, 25):
        Ap, Am = base + s * Dz, base - s * Dz; aP, aM = np.abs(Ap), np.abs(Am)
        M = np.zeros((4, 4))
        for A, a in ((Ap, aP), (Am, aM)):
            Im_ = np.imag(B * np.conj(A / a)[None, :]); M += (Im_ * (wz / (2 * a))[None, :]) @ Im_.T
        w_, V = np.linalg.eigh((M + M.T) / 2)
        rQ = None
        MQ = M[:2, :2]; rQ = float(np.linalg.eigvalsh((MQ + MQ.T) / 2)[-1] / p1)
        rec_s = dict(s=float(s), ratio_QP=float(w_[-1] / p1), ratio_Q=rQ)
        if w_[-1] / p1 > 0.98:      # finite amplitude: maximise the excess over O = x . B (4 reals)
            def neg(x):
                O = x @ B
                return -(((np.abs(Ap + O) + np.abs(Am - O) - aP - aM) @ wz) - p1 * float(x @ x))
            best = (0.0, 0.0)
            for d in (V[:, -1], V[:, -2]):
                for tau in np.geomspace(1e-3, 0.5, 18):
                    v = -neg(tau * d)
                    if v > best[0]: best = (v, tau)
            if best[0] > 0:
                d0 = V[:, -1] * best[1]
                r = minimize(neg, d0, method='Nelder-Mead', options={'xatol': 1e-6, 'fatol': 1e-12, 'maxiter': 400})
                best = (max(best[0], -r.fun), float(np.linalg.norm(r.x)))
            rec_s['Emax'] = float(best[0]); rec_s['tau_at'] = float(best[1])
        else:
            rec_s['Emax'] = 0.0
        out['pointwise'].append(rec_s)
    # averaged (independent real driver for Q, worst fixed phase), W-law of the row's sigma
    sig = rec['sig'] if rec['sig'] > 1e-6 else 0.0
    UL, WL = laggauss(24) if sig > 0 else (np.array([0.0]), np.array([1.0]))
    xi, wxi = np.polynomial.hermite_e.hermegauss(16); wxi = wxi / wxi.sum(); xi = xi / math.sqrt(2)
    profs = []; Mt = np.zeros((2, 2)); BQ = B[:2]
    for u, wu in zip(UL, WL):
        s = sig * math.sqrt(u); Ap, Am = base + s * Dz, base - s * Dz; aP, aM = np.abs(Ap), np.abs(Am)
        M = np.zeros((2, 2))
        for A, a in ((Ap, aP), (Am, aM)):
            Im_ = np.imag(BQ * np.conj(A / a)[None, :]); M += (Im_ * (wz / (2 * a))[None, :]) @ Im_.T
        Mt += wu * 0.5 * M; profs.append((wu, Ap, Am, aP, aM))
    w_, V = np.linalg.eigh(Mt); d = V[:, -1]; O = d @ BQ
    curve = []
    for tau in np.geomspace(1e-3, 1.0, 13):
        acc = 0.0
        for (wu, Ap, Am, aP, aM) in profs:
            for x, wx in zip(xi, wxi):
                acc += wu * wx * ((np.abs(Ap + tau * x * O) + np.abs(Am - tau * x * O) - aP - aM) @ wz)
        curve.append((float(tau), float(acc / (p1 * tau * tau * 0.5))))
    out['averaged'] = dict(sig=sig, ratio_inf=float(w_[-1] / (p1 * 0.5)), curve=curve)
    # lossy allowance under arbitrary sharing: Emax weighted by the Gaussian law of |q| at the row's sigma, and sup
    S = np.array([r['s'] for r in out['pointwise']]); Em = np.array([r['Emax'] for r in out['pointwise']])
    if sig > 0:
        uu = np.linspace(0, 30, 3001); dens = np.exp(-uu); ss = sig * np.sqrt(uu)
        out['allow_gauss_law'] = float(np.trapezoid(np.interp(ss, S, Em) * dens, uu))
    out['allow_sup'] = float(Em.max())
    return out

if __name__ == '__main__':
    rec = json.loads(sys.argv[1]); print(json.dumps(run(rec)))

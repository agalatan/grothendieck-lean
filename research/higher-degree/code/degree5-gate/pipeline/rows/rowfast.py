# Gaussian-ideal gate-free rows of a degree-5 game (N), fast version.  claude-b9ee worker d5newcap, 16 Nov 2026.
#
# Same objective as degree5-cert/cert2/rowopt2.py (engine d5eng2: row value = t^2 - 2 l t + 2 beta^2/e1 + sup_{sigma, nu5}
# [E_U Psi5(sigma sqrt U; nu5) - kappa sigma^2 - nu5^2/eta], Gaussian law U ~ Exp(1), both branches).  The row value is
# convex in p = (l, beta, bA, bB) (a supremum of convex functions), so instead of Nelder-Mead this uses BFGS with the
# envelope (Danskin) gradient: the inner supremum is located with the engine's spline table, and the gradient is the
# p-gradient of the inner function at the maximiser, by direct quadrature
#   d E|A+-|/dp = E Re(conj(ph A+-) dA+-/dp),  A+- = z(l + beta(|z|^2 - 2)) + nu e32 +- s (1 - bA e11 - bB e20).
# The final value is recomputed on the fine grid with both branches, exactly as rowopt2.py does.
# usage: D5_E1=.. D5_ETA=.. rowfast.py t [l beta bA bB]   -> one JSON line (same fields as rowopt2.py)
import sys, os, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng2 as D
from scipy.optimize import minimize

KEEP = np.where(D.WL > 1e-22)[0]

def inner_grad(rw, sig, nu, smax=9.0):
    """value and p-gradient of  E_U Psi(sig sqrt U; nu) + (bA^2 + bB^2) sig^2/eta  at fixed (sig, nu), direct quadrature."""
    z = rw.z; T = np.abs(z) ** 2
    base = rw.L + nu * rw.E32
    e11 = D.e_ab(1, 1, z); e20 = D.e_ab(2, 0, z)
    val = 0.0; g = np.zeros(4)
    for k in KEEP:
        s = min(sig * np.sqrt(D.UL[k]), smax)
        Ap = base + s * rw.D; Am = base - s * rw.D
        ap = np.abs(Ap); am = np.abs(Am)
        val += D.WL[k] * ((ap + am) @ rw.wz)
        pp = np.conj(Ap / np.maximum(ap, 1e-300)); pm = np.conj(Am / np.maximum(am, 1e-300))
        sm = pp + pm; df = pp - pm
        g[0] += D.WL[k] * (np.real(sm * z) @ rw.wz)
        g[1] += D.WL[k] * (np.real(sm * z * (T - 2)) @ rw.wz)
        g[2] += D.WL[k] * (np.real(df * (-s * e11)) @ rw.wz)
        g[3] += D.WL[k] * (np.real(df * (-s * e20)) @ rw.wz)
    val += (rw.bA ** 2 + rw.bB ** 2) * sig ** 2 / rw.eta
    g[2] += 2 * rw.bA * sig ** 2 / rw.eta; g[3] += 2 * rw.bB * sig ** 2 / rw.eta
    return val, g

def fg(t, p, grid):
    l, beta, bA, bB = p
    rw = D.Row(t, l, beta, bA, bB, grid=grid); inn = D.Inner(rw)
    v, sig, nu = inn.sup()
    _, g = inner_grad(rw, sig, nu)
    g = g + np.array([-2 * t, 4 * beta / rw.e1, 0.0, 0.0])
    return rw.const() + v, g, (sig, nu)

if __name__ == '__main__':
    t = float(sys.argv[1])
    p0 = [float(x) for x in sys.argv[2:6]] if len(sys.argv) >= 6 else [t, 0.17 * t, -0.055 * t, -0.033 * t]
    gc = D.zgrid(npan=40, nq=8, nth=256, half=True); gf = D.zgrid(half=True)
    t0 = time.time(); hist = []
    def f(p):
        v, g, at = fg(t, p, gc); hist.append((v, at)); return v, g
    res = minimize(f, p0, jac=True, method='BFGS', options={'gtol': 2e-7, 'maxiter': 60})
    p = list(res.x)
    # polish: a short Nelder-Mead from the BFGS point (guards against the kink where the two branches tie)
    if os.environ.get('ROW_POLISH', '0') == '1':
        r2 = minimize(lambda q: D.row_value(t, q, grid=gc), p, method='Nelder-Mead',
                      options={'xatol': 2e-5, 'fatol': 2e-9, 'maxiter': 60,
                               'initial_simplex': [p] + [[p[j] + (2e-4 if j == i else 0) for j in range(4)] for i in range(4)]})
        if r2.fun < res.fun: p = list(r2.x)
    val, sig, nu, inn = D.row_value(t, p, grid=gf, ret=True)
    (vp, _, nup), (vd, sd, nud) = inn.branches(lo=0.05)
    c = inn.row.const()
    print(json.dumps(dict(t=t, l=p[0], beta=p[1], bA=p[2], bB=p[3], c5=0.0, row=val, sig=sig, nu5=nu, C=val - t * t + 2 * p[0] * t,
                          plain=vp + c, plain_nu5=nup, driver=vd + c, driver_sig=sd, driver_nu5=nud, coarse=float(res.fun),
                          nfev=int(res.nfev), gnorm=float(np.abs(res.jac).max()), e1=D.E1, eta=D.ETA, start=p0,
                          secs=time.time() - t0)), flush=True)

# Identity-tail games [N]: lam = (lam_0..lam_K, nu, nu, ...) = sum_{k<=K} (lam_k - nu) P_k + nu Id.
# For unimodular charge-one pairs the identity part is pointwise: sum_{k>K} c_k = Re E[conj(f) g] - sum_{k<=K} c_k exactly.
# Best response: f = ph( sum_{k<=K} (lam_k - nu) P_k g + nu g ).  (claude-b9ee worker, 16 Nov 2026)
import numpy as np
from scipy.special import ellipe, ellipk
from scipy.optimize import minimize
from gm import phase_coeffs, compose_phase

def h_full(s):
    """phase kernel h(s) = E[ph X conj ph Y] at real correlation s in [-1, 1] (closed form)"""
    s = float(s); a = abs(s)
    if a < 1e-12: return np.pi / 4 * s
    if a >= 1: return float(np.sign(s))
    m = a * a
    return float(np.sign(s) * (ellipe(m) - (1 - m) * ellipk(m)) / a)

def _mass_weights(M, F, w0=None):
    A = F
    for i in reversed(range(len(M.vars))):
        w = w0 if (i == 0 and w0 is not None) else M.vars[i].w
        A = np.tensordot(A, w, axes=([i], [0]))
    return complex(A)

def alternate_tail(M, lam, nu, c0, iters=400, tol=1e-11):
    """alternating best response in the tail game.  Returns the value and the converged pair (f, g) through its
    generators: f = ph(A_f + nu g), g = ph(A_g + nu f), A_f = sum (lam-nu) ghat e, A_g = sum (lam-nu) fhat e."""
    lv = M.lamvec(lam) - nu
    h = M.evaluate(np.asarray(c0, complex)); g = h / np.maximum(np.abs(h), 1e-300); gh = M.project(g)
    vold = -9; v = None
    for it in range(iters):
        H = M.evaluate(lv * gh) + nu * g
        a = np.abs(H); f = H / np.maximum(a, 1e-300); fh = M.project(f)
        v = float(M.mass(a).real)                         # Re<f, T g> = E|T g|
        pair = (f, fh, g, gh)
        g, gh = f, fh
        if it > 4 and abs(v - vold) < tol: break
        vold = v
    f, fh, g, gh = pair
    c = M.pair_coeffs(fh, gh); ident = float(np.real(M.mass(np.conj(f) * g)))
    return dict(value=v, it=it, a_f=lv * gh, a_g=lv * fh, c=c, tail=ident - c.sum())

def score_tail_pair(M, lam, nu, a_f, a_g, chunk=None, fp_iters=80):
    """the explicit pair f = ph(A_f + nu g), g = ph(A_g + nu f) on M's grid (pointwise fixed point, chunked over
    the visible-z nodes); returns (c_0..c_K, tail t, payoff sum lam_k c_k + nu t)"""
    n0 = M.vars[0].n; chunk = chunk or n0; fh = 0; gh = 0; idt = 0
    for s in range(0, n0, chunk):
        sl = slice(s, min(n0, s + chunk)); T0 = M.T[0][:, sl]; Tw0 = M.Tw[0][:, sl]; w0 = M.vars[0].w[sl]
        Af = M.evaluate(a_f, T0=T0); Ag = M.evaluate(a_g, T0=T0)
        f = Af / np.maximum(np.abs(Af), 1e-300); g = Ag / np.maximum(np.abs(Ag), 1e-300)
        for _ in range(fp_iters):
            g2 = Ag + nu * f; g2 = g2 / np.maximum(np.abs(g2), 1e-300)
            f2 = Af + nu * g2; f2 = f2 / np.maximum(np.abs(f2), 1e-300)
            d = max(float(np.abs(f2 - f).max()), float(np.abs(g2 - g).max())); f, g = f2, g2
            if d < 1e-13: break
        fh = fh + M.project(f, Tw0=Tw0); gh = gh + M.project(g, Tw0=Tw0); idt = idt + _mass_weights(M, np.conj(f) * g, w0)
    c = M.pair_coeffs(fh, gh); t = float(np.real(idt)) - c.sum()
    return c, t, float(np.dot(np.asarray(lam, float), c) + nu * t)

def rho_tail_value(lam, nu, rho):
    lam = np.asarray(lam, float); K = len(lam) - 1
    comp = compose_phase(np.asarray(rho, float), K)
    return float(np.dot(lam - nu, comp) + nu * h_full(np.sum(rho))), comp

def best_rho_tail(lam, nu, warm=(), starts=30, seed=0):
    """max over sum|rho_j| <= 1 of sum_k (lam_k - nu)[h o rho]_k + nu h(rho(1)); returns rho, value, c, tail"""
    lam = np.asarray(lam, float); K = len(lam) - 1; n = K + 1
    def f(x):
        return -rho_tail_value(lam, nu, x[:n] - x[n:])[0]
    cons = [dict(type='ineq', fun=lambda x: 1 - x.sum())]
    rng = np.random.default_rng(seed); inits = []
    for w in warm:
        w = np.asarray(w, float)[:n]; inits.append(np.concatenate([np.maximum(w, 0), np.maximum(-w, 0)]))
    inits.append(np.concatenate([np.eye(n)[0], np.zeros(n)]))
    inits.append(np.concatenate([np.zeros(n), np.eye(n)[1] if n > 1 else np.eye(n)[0]]))
    for s in range(starts):
        r = rng.normal(size=n) * np.exp(-rng.uniform(0.3, 1.5) * np.arange(n)); r /= np.abs(r).sum()
        inits.append(np.concatenate([np.maximum(r, 0), np.maximum(-r, 0)]))
    best = (None, -9)
    for x0 in inits:
        res = minimize(f, x0, method='SLSQP', bounds=[(0, 1)] * (2 * n), constraints=cons, options=dict(ftol=1e-14, maxiter=300))
        x = np.clip(res.x, 0, None); x = x / max(1.0, x.sum()); rho = x[:n] - x[n:]
        v = rho_tail_value(lam, nu, rho)[0]
        if v > best[1]: best = (rho, v)
    rho = best[0]; v, comp = rho_tail_value(lam, nu, rho)
    return rho, v, comp, float(h_full(np.sum(rho)) - comp.sum())

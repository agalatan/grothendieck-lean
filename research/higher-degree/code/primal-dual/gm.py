# Graded-model engine for complex charge-one Hermite games  T = sum_{k<=K} lam_k P_{k+1,k}   [N = numerical]
# claude-b9ee primal/dual worker, 16 Nov 2026.
#
# Model: visible z (bidegree (1,0)), reduced to z = r >= 0 by the charge-one symmetry, plus independent remote
# graded Gaussians: complex variables of bidegree (a,b) (a diffuse sum of (a,b)-Wick monomials; (1,0) = another
# ordinary coordinate) and real charge-0 variables of bidegree (a,a).  The chaos P_{m,n} of the original space is,
# in the model, the span of products prod_i H_{p_i,q_i}(G_i) of total bidegree (m,n).  Best response f = ph(T g).
# Quadrature: tensor grids (z radial Gauss-Legendre panels; complex variables polar = radial panels x uniform
# angle; real variables Gauss-Hermite); evaluation and projection by successive tensor contractions, so the
# memory is O(#grid points), never O(#basis x #points).
import numpy as np, itertools, math
from math import comb, factorial
from numpy.polynomial.legendre import leggauss
from numpy.polynomial.hermite_e import hermegauss

def herm_c(p, q, z):
    """normalised complex Hermite H_{p,q}(z)/sqrt(p!q!), E|z|^2 = 1"""
    zc = np.conj(z); out = np.zeros_like(z, dtype=complex)
    for k in range(min(p, q) + 1):
        out = out + (-1) ** k * factorial(k) * comb(p, k) * comb(q, k) * z ** (p - k) * zc ** (q - k)
    return out / math.sqrt(factorial(p) * factorial(q))

def herm_r(n, y):
    """normalised probabilists' Hermite He_n(y)/sqrt(n!)"""
    h0, h1 = np.ones_like(y), y
    if n == 0: return h0.astype(complex)
    for m in range(1, n):
        h0, h1 = h1, y * h1 - m * h0
    return h1.astype(complex) / math.sqrt(factorial(n))

def gl_panels(R, npan, q):
    x, w = leggauss(q); ed = np.linspace(0, R, npan + 1)
    r = np.concatenate([(ed[i] + ed[i + 1]) / 2 + (ed[i + 1] - ed[i]) / 2 * x for i in range(npan)])
    wr = np.concatenate([(ed[i + 1] - ed[i]) / 2 * w for i in range(npan)])
    return r, wr * 2 * r * np.exp(-r * r)          # density of |z| for a standard complex Gaussian

class Var:
    def __init__(self, kind, bideg, n1=64, n2=48, R=6.5, q=8, name=None):
        self.kind, self.bideg, self.name = kind, tuple(bideg), name or f'{kind}{bideg}'
        if kind == 'z':
            r, w = gl_panels(R, max(1, n1 // q), q); self.pts, self.w = r.astype(complex), w
        elif kind == 'c':
            s, ws = gl_panels(R, max(1, n1 // q), q); th = (np.arange(n2) + 0.5) * 2 * np.pi / n2
            S, TH = np.meshgrid(s, th, indexing='ij')
            self.pts = (S * np.exp(1j * TH)).ravel(); self.w = (ws[:, None] * np.ones(n2)[None] / n2).ravel()
        elif kind == 'r':
            y, wy = hermegauss(n1); self.pts, self.w = y.astype(complex), wy / wy.sum()
        else:
            raise ValueError(kind)
        self.w = self.w / self.w.sum()          # exact probability weights on every grid
        self.n = self.pts.size
    def contrib(self, idx):
        a, b = self.bideg
        if self.kind == 'r': return (idx * a, idx * a)
        p, q = idx; return (p * a + q * b, p * b + q * a)
    def indices(self, maxdeg):
        a, b = self.bideg; out = []
        if self.kind == 'r':
            n = 0
            while 2 * a * n <= maxdeg: out.append(n); n += 1
            return out
        for p in range(maxdeg + 1):
            for q in range(maxdeg + 1):
                if (p + q) * (a + b) <= maxdeg: out.append((p, q))
        return out
    def table(self, idxs):
        if self.kind == 'r': return np.array([herm_r(n, self.pts.real) for n in idxs])
        return np.array([herm_c(p, q, self.pts) for (p, q) in idxs])

class Model:
    """vars[0] must be the visible z.  K: game degree index (total degree 2K+1)."""
    def __init__(self, vars, K, Kbasis=None):
        self.vars = vars; self.K = K; Kb = K if Kbasis is None else Kbasis; self.Kb = Kb
        maxdeg = 2 * Kb + 1
        cand = [v.indices(maxdeg) for v in vars]
        basis = []
        for combo in itertools.product(*cand):
            m = n = 0
            for v, idx in zip(vars, combo):
                dm, dn = v.contrib(idx); m += dm; n += dn
            if m == n + 1 and n <= Kb:
                basis.append((n, combo))
        basis.sort(key=lambda t: (t[0], str(t[1])))
        self.basis = basis; self.nb = len(basis); self.kof = np.array([b[0] for b in basis])
        # per-variable factor lists
        self.J = []; self.jidx = []
        for i, v in enumerate(vars):
            used = sorted(set(b[1][i] for b in basis), key=str)
            self.J.append(used)
        pos = [{idx: j for j, idx in enumerate(Ji)} for Ji in self.J]
        self.jpos = np.array([[pos[i][b[1][i]] for i in range(len(vars))] for b in basis])
        self.T = [v.table(Ji) for v, Ji in zip(vars, self.J)]                       # (|J_i|, n_i)
        self.Tw = [np.conj(t) * v.w[None, :] for t, v in zip(self.T, vars)]          # conj * weights
        self.shape = tuple(len(Ji) for Ji in self.J)
        self.gshape = tuple(v.n for v in vars)
        self.wgrid = None
    def coef_tensor(self, c):
        C = np.zeros(self.shape, complex)
        np.add.at(C, tuple(self.jpos.T), c)
        return C
    def evaluate(self, c):
        """h on the tensor grid, shape gshape"""
        A = self.coef_tensor(c)
        for i in range(len(self.vars)):
            # contract axis i (still a J axis at position i) with table i -> grid axis appended at the end
            A = np.tensordot(A, self.T[i], axes=([0], [0]))   # removes leading J axis, appends grid axis
        return A
    def project(self, F):
        """<F, e_b> for all basis b (weights included)"""
        A = F
        for i in range(len(self.vars)):
            A = np.tensordot(A, self.Tw[i], axes=([0], [1]))   # removes leading grid axis, appends J axis
        return A[tuple(self.jpos.T)]
    def mass(self, F):
        """E F"""
        A = F
        for v in self.vars:
            A = np.tensordot(A, v.w, axes=([0], [0]))
        return A
    def gram_err(self, nsample=None):
        """max deviation of the Gram matrix of the basis from identity (quadrature check)"""
        G = np.zeros((self.nb, self.nb), complex)
        for b in range(self.nb):
            e = np.zeros(self.nb, complex); e[b] = 1
            G[b] = np.conj(self.project(self.evaluate(e)))
        return np.abs(G - np.eye(self.nb)).max()
    # ----- best response
    def lamvec(self, lam):
        lam = np.asarray(lam, float); out = np.zeros(self.nb)
        for i, (k, _) in enumerate(self.basis):
            out[i] = lam[k] if k < len(lam) else 0.0
        return out
    def pair_coeffs(self, fhat, ghat, K=None):
        K = self.Kb if K is None else K
        c = np.zeros(K + 1)
        prod = np.real(np.conj(fhat) * ghat)
        np.add.at(c, self.kof, prod)
        return c[:K + 1]
    def energies(self, fhat, K=None):
        K = self.Kb if K is None else K
        e = np.zeros(K + 1); np.add.at(e, self.kof, np.abs(fhat) ** 2); return e

def alternate(model, lam, c0, iters=600, tol=1e-12):
    """alternating best response phi_{n+1} = ph(T phi_n).  Returns the value Re<f, T g> of the final pair
    f = ph(h_{cf}), g = ph(h_{cg}) (cf = T g, cg = T f_prev), their projections and kernel coefficients."""
    lv = model.lamvec(lam); c = np.asarray(c0, complex)
    hist = []; vold = -9; v = None
    for it in range(iters):
        h = model.evaluate(c); a = np.abs(h)
        f = h / np.maximum(a, 1e-300)
        fhat = model.project(f)
        hist.append((c, fhat)); hist = hist[-2:]
        if len(hist) == 2:
            v = float(np.real(np.sum(lv * np.conj(hist[1][1]) * hist[0][1])))
            if it > 4 and abs(v - vold) < tol: break
            vold = v
        c = lv * fhat
    (cg, ghat), (cf, fhat) = hist[0], hist[1]
    return dict(value=v, it=it, cf=cf, cg=cg, fhat=fhat, ghat=ghat, c=model.pair_coeffs(fhat, ghat))

def eval_pair(model, cf, cg):
    """re-evaluate an explicit pair f = ph(h_cf), g = ph(h_cg) on this model's grid"""
    out = []
    for c in (cf, cg):
        h = model.evaluate(np.asarray(c, complex)); out.append(model.project(h / np.maximum(np.abs(h), 1e-300)))
    return out[0], out[1], model.pair_coeffs(out[0], out[1])

# ---------------------------------------------------------------- exact one-variable kernels
def phase_coeffs(K):
    """h_k: ph-kernel Taylor coefficients, h(t) = sum h_k t|t|^{2k}"""
    out = []; a = 1.0
    for k in range(K + 1):
        if k > 0: a *= (k - 0.5) ** 2 / (k * (k + 1))
        out.append(np.pi / 4 * a)
    return np.array(out)

def compose_phase(rho, K):
    """coefficients (k=0..K) of h(rho(t)) for a real odd series rho(t) = sum rho_j t^{2j+1} (real t)."""
    h = phase_coeffs(K)
    rho = np.zeros(K + 1) if rho is None else np.pad(np.asarray(rho, float), (0, max(0, K + 1 - len(rho))))[:K + 1]
    # power series in s = t^2 of rho(t)/t = R(s); rho^{2k+1} = t^{2k+1} R^{2k+1}
    R = rho.copy(); out = np.zeros(K + 1)
    P = R.copy()                                # R^{1}
    R2 = np.convolve(R, R)[:K + 1]
    for k in range(K + 1):
        # contribution h_k t^{2k+1} R(s)^{2k+1}: coefficient of t^{2m+1} is h_k [s^{m-k}] R^{2k+1}
        out[k:] += h[k] * P[:K + 1 - k]
        P = np.convolve(P, R2)[:K + 1]
    return out

def best_rho(lam, J=None, starts=60, seed=0):
    """exact oracle: max over preprocessors rho (sum|rho_j| <= 1) of sum_k lam_k [h o rho]_k  (phase rounding of a
    preprocessed vector; rho_j < 0 realised by flipping the grade-j variable on one side)."""
    from scipy.optimize import minimize
    lam = np.asarray(lam, float); K = len(lam) - 1; J = K if J is None else J
    def coeffs(u):
        rho = u / max(1.0, np.abs(u).sum()); return compose_phase(rho, K)
    def obj(u): return -float(np.dot(lam, coeffs(u)))
    rng = np.random.default_rng(seed); best = (None, -9)
    inits = [np.eye(J + 1)[0]] + [rng.normal(size=J + 1) * np.exp(-0.7 * np.arange(J + 1)) for _ in range(starts)]
    for u0 in inits:
        r = minimize(obj, u0, method='Nelder-Mead', options=dict(xatol=1e-12, fatol=1e-14, maxiter=20000, maxfev=40000))
        if -r.fun > best[1]: best = (r.x / max(1.0, np.abs(r.x).sum()), -r.fun)
    rho = best[0]; return rho, best[1], compose_phase(rho, K)

def _series_pow_odd(rho, K):
    """list P[n] = coefficients (in s = t^2) of (rho(t)/t)^n, n = 0..2K+1, truncated at s^K"""
    R = np.zeros(K + 1); R[:min(K + 1, len(rho))] = rho[:K + 1]
    P = [np.eye(K + 1)[0]]
    for n in range(1, 2 * K + 2):
        P.append(np.convolve(P[-1], R)[:K + 1])
    return P

def rho_value_grad(lam, rho):
    """F(rho) = sum_k lam_k [h o rho]_k and its gradient in rho_j (j = 0..K)"""
    lam = np.asarray(lam, float); K = len(lam) - 1; h = phase_coeffs(K)
    P = _series_pow_odd(rho, K)
    comp = np.zeros(K + 1); dcomp = np.zeros(K + 1)     # h o rho (odd, as s-series of /t);  h' o rho (even, s-series)
    for m in range(K + 1):
        comp[m:] += h[m] * P[2 * m + 1][:K + 1 - m]
        dcomp[m:] += (2 * m + 1) * h[m] * P[2 * m][:K + 1 - m]
    val = float(lam @ comp)
    grad = np.array([sum(lam[k] * dcomp[k - j] for k in range(j, K + 1)) for j in range(K + 1)])
    return val, grad, comp

def best_rho2(lam, warm=(), starts=40, seed=0):
    """max over sum|rho_j| <= 1 of sum_k lam_k [h o rho]_k: SLSQP on rho = p - q, p,q >= 0, sum(p+q) <= 1."""
    from scipy.optimize import minimize
    lam = np.asarray(lam, float); K = len(lam) - 1; n = K + 1
    def f(x):
        v, g, _ = rho_value_grad(lam, x[:n] - x[n:]); return -v, -np.concatenate([g, -g])
    cons = [dict(type='ineq', fun=lambda x: 1 - x.sum(), jac=lambda x: -np.ones(2 * n))]
    rng = np.random.default_rng(seed); inits = []
    for w in warm:
        w = np.asarray(w, float); inits.append(np.concatenate([np.maximum(w, 0), np.maximum(-w, 0)]))
    inits.append(np.concatenate([np.eye(n)[0], np.zeros(n)]))
    for s in range(starts):
        r = rng.normal(size=n) * np.exp(-rng.uniform(0.3, 1.5) * np.arange(n)); r /= np.abs(r).sum()
        inits.append(np.concatenate([np.maximum(r, 0), np.maximum(-r, 0)]))
    best = (None, -9)
    for x0 in inits:
        res = minimize(f, x0, jac=True, method='SLSQP', bounds=[(0, 1)] * (2 * n), constraints=cons,
                       options=dict(ftol=1e-15, maxiter=500))
        x = np.clip(res.x, 0, None); x = x / max(1.0, x.sum()); rho = x[:n] - x[n:]
        v = rho_value_grad(lam, rho)[0]
        if v > best[1]: best = (rho, v)
    rho = best[0]; return rho, best[1], rho_value_grad(lam, rho)[2]

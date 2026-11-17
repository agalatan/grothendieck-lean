# omega3lib.py -- shared numerics for the Omega_3 test (claude-b9ee research worker, 17 Nov 2026).
#
# Objects (unit P in the d-th chaos, d odd):
#   N_t(x) = E sign P(sqrt(t) x + sqrt(1-t) G),  I(s) = phi(Phi^{-1}((1+s)/2)),  mu(t) = E I(N_t),
#   A(t) = E[I(N_t) Gamma],  Gamma = |grad P|^2/d,
#   Cov(Wbar, Gamma) = int_0^1 d t^(d-1) (A(t)/mu(t) - 1) dt,   R^2 = (2/pi)(1 + Cov),
#   B = int_0^1 sqrt(-mu'(t)) sqrt(8 t^(d-1) d A(t)) dt.
# t-grid: Gauss-Legendre in v, t = 1 - (1-v)^2 (so sqrt(1-t) = 1-v is smooth at the endpoint t = 1).
import numpy as np
from scipy.special import ndtri, ndtr

SQ2PI = np.sqrt(2*np.pi)

def phi(x):
    return np.exp(-0.5*x*x)/SQ2PI

def I_of_p(p):
    """I(2p-1) = phi(Phi^{-1}(p)) for p = P(sign > 0); symmetric in p <-> 1-p."""
    q = np.minimum(p, 1.0-p)
    q = np.clip(q, 0.0, 0.5)
    out = np.zeros_like(q)
    m = q > 1e-300
    out[m] = phi(ndtri(q[m]))
    return out

def tgrid(nv):
    v, wv = np.polynomial.legendre.leggauss(nv)
    v = 0.5*(v+1.0); wv = 0.5*wv
    t = 1.0-(1.0-v)**2
    wt = wv*2.0*(1.0-v)          # dt = 2(1-v) dv
    return v, wv, t, wt

def spectral_dmu_dv(v, mu):
    """Derivative in v of the polynomial interpolating mu at the nodes v (barycentric differentiation matrix)."""
    n = len(v)
    w = np.ones(n)
    for j in range(n):
        w[j] = 1.0/np.prod(v[j]-np.delete(v, j))
    D = np.zeros((n, n))
    for i in range(n):
        for j in range(n):
            if i != j:
                D[i, j] = (w[j]/w[i])/(v[i]-v[j])
        D[i, i] = -np.sum(D[i, :])
    return D @ mu

# ---------------------------------------------------------------------------------------------------
# P(c0 + c1 g + c2 g^2 + c3 g^3 > 0) for g ~ N(0,1), vectorised, robust to degree drop.
L_RANGE = 40.0

def _cubic_real_roots(c0, c1, c2, c3):
    """Real roots (NaN where absent) of c3 g^3 + c2 g^2 + c1 g + c0 with c3 != 0; returns (B,3) sorted, NaN last."""
    a = c2/c3; b = c1/c3; c = c0/c3
    p = b - a*a/3.0
    q = 2.0*a**3/27.0 - a*b/3.0 + c
    disc = (q/2.0)**2 + (p/3.0)**3          # > 0: one real root; < 0: three real roots
    B = c0.shape[0]
    roots = np.full((B, 3), np.nan)
    one = disc >= 0
    if np.any(one):
        qq = q[one]; dd = np.sqrt(disc[one])
        A = -np.sign(qq)*np.cbrt(np.abs(qq)/2.0 + dd)
        A = np.where(qq == 0, np.cbrt(dd), A)
        Bc = np.where(A != 0, -p[one]/(3.0*np.where(A != 0, A, 1.0)), 0.0)
        roots[one, 0] = A + Bc - a[one]/3.0
    three = ~one
    if np.any(three):
        pp = p[three]; qq = q[three]
        r = np.sqrt(-pp/3.0)
        arg = np.clip((-qq/2.0)/(r**3), -1.0, 1.0)
        th = np.arccos(arg)
        for k in range(3):
            roots[three, k] = 2.0*r*np.cos((th - 2.0*np.pi*k)/3.0) - a[three]/3.0
    # Newton polish (two steps) on the original polynomial
    for _ in range(2):
        g = roots
        f = ((c3[:, None]*g + c2[:, None])*g + c1[:, None])*g + c0[:, None]
        fp = (3.0*c3[:, None]*g + 2.0*c2[:, None])*g + c1[:, None]
        step = np.where(np.abs(fp) > 1e-300, f/np.where(np.abs(fp) > 1e-300, fp, 1.0), 0.0)
        ok = np.isfinite(step) & (np.abs(step) < 1e-2*(1.0+np.abs(g)))
        roots = np.where(ok, g - step, g)
    roots = np.sort(roots, axis=1)          # NaN sorts last
    return roots

def poly_pos_mass(c0, c1, c2, c3):
    """P(c0 + c1 g + c2 g^2 + c3 g^3 > 0), g ~ N(0,1). Arrays of equal shape (any)."""
    shp = c0.shape
    c0 = c0.ravel().astype(float); c1 = c1.ravel().astype(float)
    c2 = c2.ravel().astype(float); c3 = c3.ravel().astype(float)
    Bn = c0.size
    L = L_RANGE
    scale = np.maximum.reduce([np.abs(c0), np.abs(c1)*L, np.abs(c2)*L*L, np.abs(c3)*L**3]) + 1e-300
    deg = np.full(Bn, 0)
    deg[np.abs(c1)*L > 1e-13*scale] = 1
    deg[np.abs(c2)*L*L > 1e-13*scale] = 2
    deg[np.abs(c3)*L**3 > 1e-13*scale] = 3
    roots = np.full((Bn, 3), np.nan)
    lead = np.where(deg == 3, c3, np.where(deg == 2, c2, np.where(deg == 1, c1, c0)))
    m3 = (deg == 3) & (np.abs(c3)*L**3 >= 1e-3*scale)
    if np.any(m3):
        roots[m3] = _cubic_real_roots(c0[m3], c1[m3], c2[m3], c3[m3])
    m3b = (deg == 3) & ~m3            # badly scaled cubic (small leading term): companion eigenvalues
    if np.any(m3b):
        nb = int(m3b.sum())
        Cm = np.zeros((nb, 3, 3))
        Cm[:, 0, :] = -np.stack([c2[m3b], c1[m3b], c0[m3b]], 1)/c3[m3b][:, None]
        Cm[:, 1, 0] = 1.0; Cm[:, 2, 1] = 1.0
        ev = np.linalg.eigvals(Cm)
        re_ = np.where(np.abs(ev.imag) <= 1e-9*(1.0+np.abs(ev.real)), ev.real, np.nan)
        roots[m3b] = np.sort(re_, axis=1)
    m2 = deg == 2
    if np.any(m2):
        A = c2[m2]; Bq = c1[m2]; C = c0[m2]
        D = Bq*Bq - 4*A*C
        has = D >= 0
        sD = np.sqrt(np.where(has, D, 0.0))
        qv = -0.5*(Bq + np.where(Bq >= 0, 1.0, -1.0)*sD)
        r1 = np.where(qv != 0, qv/A, 0.0)
        r2 = np.where(qv != 0, C/np.where(qv != 0, qv, 1.0), 0.0)
        rr = np.sort(np.stack([r1, r2], 1), axis=1)
        rr[~has] = np.nan
        tmp = np.full((m2.sum(), 3), np.nan); tmp[:, :2] = rr
        roots[m2] = tmp
    m1 = deg == 1
    if np.any(m1):
        tmp = np.full((m1.sum(), 3), np.nan); tmp[:, 0] = -c0[m1]/c1[m1]
        roots[m1] = tmp
    # sign on the leftmost interval: sign(lead) * (-1)^deg ; alternate at each real root
    s_left = np.sign(lead)*np.where(deg % 2 == 1, -1.0, 1.0)
    # interval endpoints
    nreal = np.sum(np.isfinite(roots), axis=1)
    ends = np.where(np.isfinite(roots), roots, np.inf)
    ends = np.clip(ends, -L, L)
    ends = np.where(np.isfinite(roots), ends, np.inf)
    # cumulative Phi at endpoints
    Phi_e = np.where(np.isfinite(ends), ndtr(ends), 1.0)
    # intervals: (-inf, r1), (r1, r2), (r2, r3), (r3, inf); missing roots -> empty intervals
    left = np.concatenate([np.zeros((Bn, 1)), Phi_e], axis=1)     # Phi at left end of interval k
    right = np.concatenate([Phi_e, np.ones((Bn, 1))], axis=1)     # Phi at right end
    # for missing roots: right end = 1 for interval nreal and later; make later intervals empty
    k = np.arange(4)[None, :]
    right = np.where(k < nreal[:, None], right, 1.0)
    left = np.where(k <= nreal[:, None], left, 1.0)
    mass = np.clip(right - left, 0.0, 1.0)
    sgn = s_left[:, None]*np.where(k % 2 == 0, 1.0, -1.0)
    pos = np.sum(np.where(sgn > 0, mass, 0.0), axis=1)
    pos = np.where(deg == 0, (c0 > 0).astype(float), pos)
    return pos.reshape(shp)

# ---------------------------------------------------------------------------------------------------
# Generic cubic objects. Each provides: val(x) (B,n)->(B,), grad(x)->(B,n), line(m,e)->(c0,c1,c2,c3) of P(m+s e).
class TensorCubic:
    """P(x) = T(x,x,x) - 3 <trT, x> (Wick cubic), T symmetric (n,n,n); unit norm iff 6||T||^2 = 1."""
    def __init__(self, T, normalise=True):
        T = np.array(T, float)
        # symmetrise
        T = (T + T.transpose(0, 2, 1) + T.transpose(1, 0, 2) + T.transpose(1, 2, 0) + T.transpose(2, 0, 1) + T.transpose(2, 1, 0))/6.0
        if normalise:
            T = T/np.sqrt(6.0*np.sum(T*T))
        self.T = T; self.n = T.shape[0]
        self.tr = np.einsum('iik->k', T)
        self.Tf = T.reshape(self.n, self.n*self.n)
    def _Tm(self, m):            # (B,n,n): T(m,.,.)
        return (m @ self.Tf).reshape(m.shape[0], self.n, self.n)
    def val(self, x):
        Tm = self._Tm(x)
        return np.einsum('bij,bi,bj->b', Tm, x, x) - 3.0*(x @ self.tr)
    def grad(self, x):
        Tm = self._Tm(x)
        return 3.0*np.einsum('bij,bj->bi', Tm, x) - 3.0*self.tr[None, :]
    def line(self, m, e):
        Tm = self._Tm(m)
        Tmm = np.einsum('bij,bj->bi', Tm, m)           # T(m,m,.)
        c0 = np.einsum('bi,bi->b', Tmm, m) - 3.0*(m @ self.tr)
        c1 = 3.0*np.einsum('bi,bi->b', Tmm, e) - 3.0*(e @ self.tr)
        Te = self._Tm(e)
        Tee = np.einsum('bij,bj->bi', Te, e)
        c2 = 3.0*np.einsum('bi,bi->b', Tee, m)
        c3 = np.einsum('bi,bi->b', Tee, e)
        return c0, c1, c2, c3

class DiagCubic:
    """P(x) = sum_i lam_i h3(x_i), h3 = He3/sqrt6; unit norm iff sum lam^2 = 1."""
    def __init__(self, lam, normalise=True):
        lam = np.array(lam, float)
        if normalise:
            lam = lam/np.sqrt(np.sum(lam*lam))
        self.lam = lam; self.n = len(lam); self.k = lam/np.sqrt(6.0)
    def val(self, x):
        return (x**3 - 3*x) @ self.k
    def grad(self, x):
        return (3*x*x - 3)*self.k[None, :]
    def line(self, m, e):
        k = self.k[None, :]
        c0 = np.sum((m**3 - 3*m)*k, 1)
        c1 = np.sum((3*m*m*e - 3*e)*k, 1)
        c2 = np.sum(3*m*e*e*k, 1)
        c3 = np.sum(e**3*k, 1)
        return c0, c1, c2, c3

# ---------------------------------------------------------------------------------------------------
def _unit_dir(P, m0):
    n = m0.shape[1]
    e = P.grad(m0)
    nr = np.linalg.norm(e, axis=1, keepdims=True)
    bad = nr[:, 0] < 1e-12
    return np.where(bad[:, None], np.eye(n)[0][None, :], e/np.where(nr > 0, nr, 1.0))

def nested_run(P, d, t, nout, M, rng, chunk=256, x_given=None, inner='mc', ngh=200):
    """Per-outer-sample estimates of I(N_t(x)) on the t-grid.
    N_t(x) = E sign P(sqrt(t) x + sqrt(1-t) G) is Rao-Blackwellised along e = grad P(sqrt(t) x)/|.|: given the component
    G_perp of G orthogonal to e, the Gaussian mass of {P > 0} on the line is exact (real roots of a cubic).
    inner='mc': G_perp by Monte Carlo, M/2 antithetic pairs, common random numbers across t, and the concavity bias of
                I removed by the delete-one-pair jackknife (Ijk); the uncorrected plug-in is returned as Iraw.
    inner='gh': n = 2 only, G_perp = g e_perp with g on ngh Gauss-Hermite nodes (deterministic inner integral).
    inner='none': n = 1 (exact).
    Returns Pval (nout,), Gam (nout,), Ijk (nout, nt), Iraw (nout, nt)."""
    n = P.n; nt = len(t)
    Pv = np.empty(nout); Gm = np.empty(nout)
    Ijk = np.empty((nout, nt)); Iraw = np.empty((nout, nt))
    Mp = max(M//2, 1)
    if inner == 'gh':
        gx, gw = np.polynomial.hermite_e.hermegauss(ngh); gw = gw/np.sum(gw)
    for s0 in range(0, nout, chunk):
        s1 = min(nout, s0+chunk); B = s1-s0
        x = rng.standard_normal((B, n)) if x_given is None else x_given[s0:s1]
        Pv[s0:s1] = P.val(x)
        g = P.grad(x)
        Gm[s0:s1] = np.sum(g*g, 1)/d
        if inner == 'mc':
            G = rng.standard_normal((B, Mp, n))      # common random numbers across t
        for it, tt in enumerate(t):
            sig = np.sqrt(1.0-tt); m0 = np.sqrt(tt)*x
            e = _unit_dir(P, m0)
            if inner == 'none':
                c0, c1, c2, c3 = P.line(m0, e)
                pb = poly_pos_mass(c0, c1*sig, c2*sig**2, c3*sig**3)
                Ijk[s0:s1, it] = Iraw[s0:s1, it] = I_of_p(pb)
                continue
            if inner == 'gh':
                eperp = np.stack([-e[:, 1], e[:, 0]], 1)
                m = (m0[:, None, :] + sig*gx[None, :, None]*eperp[:, None, :]).reshape(B*ngh, n)
                ee = np.repeat(e, ngh, axis=0)
                c0, c1, c2, c3 = P.line(m, ee)
                pp = poly_pos_mass(c0, c1*sig, c2*sig**2, c3*sig**3).reshape(B, ngh)
                pb = pp @ gw
                Ijk[s0:s1, it] = Iraw[s0:s1, it] = I_of_p(pb)
                continue
            Gp = G - np.einsum('bkn,bn->bk', G, e)[:, :, None]*e[:, None, :]
            ps = []
            for sgn in (1.0, -1.0):
                m = (m0[:, None, :] + sgn*sig*Gp).reshape(B*Mp, n)
                ee = np.repeat(e, Mp, axis=0)
                c0, c1, c2, c3 = P.line(m, ee)
                pp = poly_pos_mass(c0, c1*sig, c2*sig**2, c3*sig**3).reshape(B, Mp)
                ps.append(pp)
            y = 0.5*(ps[0]+ps[1])                    # pair averages, iid over the Mp pairs
            pbar = y.mean(1)
            Ifull = I_of_p(pbar)
            pdel = (Mp*pbar[:, None] - y)/(Mp-1)    # jackknife, delete one pair
            Idel = I_of_p(pdel).mean(1)
            Ijk[s0:s1, it] = Mp*Ifull - (Mp-1)*Idel
            Iraw[s0:s1, it] = Ifull
    return Pv, Gm, Ijk, Iraw

def summarise(Gm, Ih, t, wt, d, v=None, wv=None):
    """Cov(Wbar, Gamma) = int d t^(d-1) (A/mu - E Gamma) dt with E Gamma = 1 (cov) or with the sample mean of Gamma
    as a control variate (cov_cv; same limit). Standard errors by linearisation over the iid outer samples
    (they include the inner noise). B from the spectral derivative of mu in v."""
    nout = len(Gm)
    mu = Ih.mean(0)
    A = (Ih*Gm[:, None]).mean(0)
    wtd = wt*d*t**(d-1)
    Gbar = Gm.mean()
    cov = np.sum(wtd*(A/mu - 1.0))
    cov_cv = np.sum(wtd*(A/mu - Gbar))
    infl = np.sum(wtd[None, :]*Ih*(Gm[:, None] - (A/mu)[None, :])/mu[None, :], axis=1)
    infl_cv = infl - (Gm - Gbar)*np.sum(wtd)
    se = infl.std(ddof=1)/np.sqrt(nout); se_cv = infl_cv.std(ddof=1)/np.sqrt(nout)
    R = np.sqrt(2/np.pi)*np.sqrt(1+cov_cv)
    out = dict(cov=cov, cov_se=se, cov_cv=cov_cv, cov_cv_se=se_cv, R=R,
               R_se=np.sqrt(2/np.pi)*se_cv/(2*np.sqrt(1+cov_cv)), mu=mu, A=A, ct=A/mu-Gbar, EG=Gbar,
               infl_cv=infl_cv)
    if v is not None:
        dmudv = spectral_dmu_dv(v, mu)
        integrand = np.sqrt(np.maximum(-dmudv*8*t**(d-1)*d*A*2*(1-v), 0.0))
        out['B'] = np.sum(wv*integrand)
    return out

class SparseCubic:
    """Multilinear (square-free) cubic P(x) = sum_r c_r x_{i_r} x_{j_r} x_{k_r} over distinct triples (already Wick);
    unit norm iff sum c_r^2 = 1."""
    def __init__(self, terms, normalise=True):
        I = np.array([a[0] for a in terms]); J = np.array([a[1] for a in terms]); K = np.array([a[2] for a in terms])
        c = np.array([a[3] for a in terms], float)
        assert np.all((I != J) & (J != K) & (I != K))
        if normalise:
            c = c/np.sqrt(np.sum(c*c))
        self.I, self.J, self.K, self.c = I, J, K, c
        self.n = int(max(I.max(), J.max(), K.max()))+1
    def val(self, x):
        return (x[:, self.I]*x[:, self.J]*x[:, self.K]) @ self.c
    def _onehot(self):
        if not hasattr(self, 'OI'):
            r = len(self.c)
            self.OI = np.zeros((r, self.n)); self.OI[np.arange(r), self.I] = 1.0
            self.OJ = np.zeros((r, self.n)); self.OJ[np.arange(r), self.J] = 1.0
            self.OK = np.zeros((r, self.n)); self.OK[np.arange(r), self.K] = 1.0
    def grad(self, x):
        self._onehot()
        a, b, k = x[:, self.I], x[:, self.J], x[:, self.K]
        return ((b*k)*self.c) @ self.OI + ((a*k)*self.c) @ self.OJ + ((a*b)*self.c) @ self.OK
    def line(self, m, e):
        mi, mj, mk = m[:, self.I], m[:, self.J], m[:, self.K]
        ei, ej, ek = e[:, self.I], e[:, self.J], e[:, self.K]
        c0 = (mi*mj*mk) @ self.c
        c1 = (ei*mj*mk + mi*ej*mk + mi*mj*ek) @ self.c
        c2 = (ei*ej*mk + ei*mj*ek + mi*ej*ek) @ self.c
        c3 = (ei*ej*ek) @ self.c
        return c0, c1, c2, c3

class CompositeCubic:
    """P = w1 P1(x[:n1]) + w2 P2(x[n1:]) for unit P1, P2 on disjoint coordinates (unit iff w1^2 + w2^2 = 1)."""
    def __init__(self, P1, P2, w1, w2):
        self.P1, self.P2, self.w1, self.w2 = P1, P2, w1, w2
        self.n1 = P1.n; self.n = P1.n + P2.n
    def val(self, x):
        return self.w1*self.P1.val(x[:, :self.n1]) + self.w2*self.P2.val(x[:, self.n1:])
    def grad(self, x):
        return np.concatenate([self.w1*self.P1.grad(x[:, :self.n1]), self.w2*self.P2.grad(x[:, self.n1:])], 1)
    def line(self, m, e):
        a = self.P1.line(m[:, :self.n1], e[:, :self.n1]); b = self.P2.line(m[:, self.n1:], e[:, self.n1:])
        return tuple(self.w1*u + self.w2*w for u, w in zip(a, b))

class E3Cubic:
    """e3(x_1..x_N)/sqrt(C(N,3)) via power sums, O(N) per point."""
    def __init__(self, N):
        self.n = N; self.s = 1.0/np.sqrt(N*(N-1)*(N-2)/6.0)
    def val(self, x):
        p1 = x.sum(1); p2 = (x*x).sum(1); p3 = (x**3).sum(1)
        return self.s*(p1**3 - 3*p1*p2 + 2*p3)/6.0
    def grad(self, x):
        p1 = x.sum(1, keepdims=True); p2 = (x*x).sum(1, keepdims=True)
        e2 = (p1*p1 - p2)/2.0
        return self.s*(e2 - x*(p1 - x))
    def line(self, m, e):
        a1, b1 = m.sum(1), e.sum(1)
        a2, b2, c2 = (m*m).sum(1), 2*(m*e).sum(1), (e*e).sum(1)
        a3, b3, c3, d3 = (m**3).sum(1), 3*(m*m*e).sum(1), 3*(m*e*e).sum(1), (e**3).sum(1)
        # p1^3
        q0, q1, q2, q3 = a1**3, 3*a1*a1*b1, 3*a1*b1*b1, b1**3
        # p1 p2
        r0, r1, r2, r3 = a1*a2, a1*b2 + b1*a2, a1*c2 + b1*b2, b1*c2
        k = self.s/6.0
        return k*(q0 - 3*r0 + 2*a3), k*(q1 - 3*r1 + 2*b3), k*(q2 - 3*r2 + 2*c3), k*(q3 - 3*r3 + 2*d3)

class RotH3:
    """h3(<u, x>) for a unit vector u."""
    def __init__(self, u):
        u = np.array(u, float); self.u = u/np.linalg.norm(u); self.n = len(u)
    def val(self, x):
        w = x @ self.u; return (w**3 - 3*w)/np.sqrt(6)
    def grad(self, x):
        w = x @ self.u; return ((3*w*w - 3)/np.sqrt(6))[:, None]*self.u[None, :]
    def line(self, m, e):
        a = m @ self.u; b = e @ self.u; k = 1/np.sqrt(6)
        return k*(a**3 - 3*a), k*(3*a*a*b - 3*b), k*(3*a*b*b), k*b**3

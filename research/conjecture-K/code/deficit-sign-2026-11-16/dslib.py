"""Deficit-sign library (label N: floating point only).

Cubics q in H_{2,1}(C^n):  q = sum_{ijk} t_ijk y_i y_j conj(y_k) - 2 sum_j (sum_i t_iji) y_j,  t symmetric in (i,j),
E|q|^2 = 2||t||^2.  Derivatives: d_m q = 2 sum_jk t_mjk y_j conj(y_k) - 2 sum_i t_imi,  dbar_m q = sum_ij t_ijm y_i y_j.

Stein pair (NOTE.md of the antiholomorphic package): a = sum_j d_j q * dbar_j q, c1 = sum|d_j q|^2, c2 = sum|dbar_j q|^2.
Theorem 5:  D_phi = B_phi(u) - E phi(V) = T1 + T2,  T1 = -E[(c2-u) K'(V)],  T2 = E[Re(conj(q)^2 a) gamma'(V)],
K(v) = E phi(v+u tau), gamma = (K(0)-K)/v.

Profiles: SqrtProfile (phi = sqrt v, closed forms), BufferProfile (phi = 2E|sigma W + sqrt v|), PeakProfile (table of the
ledger's peak row, copied from the antiholomorphic package review), ExpProfile (phi = 1-exp(-lam v)).
"""
import math
import numpy as np
from scipy import special, integrate
from scipy.interpolate import CubicSpline

SQPI = math.sqrt(math.pi)

# ----------------------------------------------------------------------------------------------------------------
# cubics
# ----------------------------------------------------------------------------------------------------------------

def sym(t):
    t = np.asarray(t, dtype=complex)
    return 0.5 * (t + t.transpose(1, 0, 2))


def normalise(t, u=1.0):
    t = sym(t)
    return t * math.sqrt(u / (2 * np.sum(np.abs(t) ** 2)))


def random_tensor(n, rng):
    return sym(rng.standard_normal((n, n, n)) + 1j * rng.standard_normal((n, n, n)))


def tensor_from_params(p, n):
    p = np.asarray(p, dtype=float)
    m = n * n * n
    return sym((p[:m] + 1j * p[m:]).reshape(n, n, n))


def cubic_eval(t, Y):
    """Y: (N,n) complex.  Returns q (N,), dq (N,n), dbq (N,n)."""
    Yb = np.conj(Y)
    tr = np.einsum('iji->j', t)
    A = np.einsum('ijk,Ni,Nj->Nk', t, Y, Y, optimize=True)      # dbar_k q
    q = np.einsum('Nk,Nk->N', A, Yb) - 2 * (Y @ tr)
    dq = 2 * np.einsum('mjk,Nj,Nk->Nm', t, Y, Yb, optimize=True) - 2 * tr[None, :]
    return q, dq, A


def stein_fields(t, Y):
    """Returns V, c1, c2, rhoV = Re(conj(q)^2 a) for the cubic with tensor t at the points Y."""
    q, dq, dbq = cubic_eval(t, Y)
    V = np.abs(q) ** 2
    c1 = np.sum(np.abs(dq) ** 2, axis=1)
    c2 = np.sum(np.abs(dbq) ** 2, axis=1)
    a = np.sum(dq * dbq, axis=1)
    rhoV = np.real(np.conj(q) ** 2 * a)
    return V, c1, c2, rhoV


# named cubics -----------------------------------------------------------------------------------------------

def t_monomial(n=1):
    t = np.zeros((n, n, n), complex); t[0, 0, 0] = 1; return t


def t_z0sq_z1bar():
    t = np.zeros((2, 2, 2), complex); t[0, 0, 1] = 1; return t


def t_z0z1_z2bar():
    t = np.zeros((3, 3, 3), complex); t[0, 1, 2] = t[1, 0, 2] = 0.5; return t


def t_cyclic(n):
    t = np.zeros((n, n, n), complex)
    for j in range(n):
        t[j, j, (j + 1) % n] = 1
    return t


def t_item5(z=1j):
    """X[(|X|^2-2) + z(|Y|^2-1)]: X^2 Xbar has t000=1; X Y Ybar has t_011 = t_101 = z/2."""
    t = np.zeros((2, 2, 2), complex); t[0, 0, 0] = 1; t[0, 1, 1] = t[1, 0, 1] = z / 2; return t


def t_sum_monomials(N):
    t = np.zeros((N, N, N), complex)
    for j in range(N):
        t[j, j, j] = 1
    return t


# ----------------------------------------------------------------------------------------------------------------
# quadrature grids (gauge-reduced: the first coordinate is real nonnegative)
# ----------------------------------------------------------------------------------------------------------------

def radial_rule(panels, k):
    """Composite Gauss-Legendre for int_0^inf f(r) e^{-r} dr on the given panel edges, k nodes per panel."""
    x, w = np.polynomial.legendre.leggauss(k)
    R = []; W = []
    for a, b in zip(panels[:-1], panels[1:]):
        r = 0.5 * (b - a) * x + 0.5 * (a + b)
        R.append(r); W.append(0.5 * (b - a) * w * np.exp(-r))
    return np.concatenate(R), np.concatenate(W)


PANELS_FINE = [0, .125, .25, .5, .75, 1, 1.5, 2, 2.5, 3, 4, 5, 6, 8, 10, 13, 16, 20, 25, 32, 42]
PANELS_MED = [0, .25, .5, 1, 1.5, 2, 3, 4, 6, 8, 11, 15, 20, 28, 40]
PANELS_COARSE = [0, .5, 1, 2, 3, 5, 8, 12, 18, 28, 40]


class Grid:
    """Points of C^n with the first phase fixed (all integrands used here are gauge invariant)."""

    def __init__(self, n, panels=PANELS_MED, k=6, nt=24):
        r, wr = radial_rule(panels, k)
        th = np.arange(nt) * 2 * np.pi / nt
        axes = [r] * n + [th] * (n - 1)
        waxes = [wr] * n + [np.full(nt, 1.0 / nt)] * (n - 1)
        mesh = np.meshgrid(*axes, indexing='ij')
        W = np.ones(mesh[0].shape)
        for i, wa in enumerate(waxes):
            shp = [1] * len(axes); shp[i] = len(wa)
            W = W * wa.reshape(shp)
        cols = [np.sqrt(mesh[0]).ravel().astype(complex)]
        for j in range(1, n):
            cols.append((np.sqrt(mesh[j]) * np.exp(1j * mesh[n + j - 1])).ravel())
        self.Y = np.stack(cols, axis=1)
        self.W = W.ravel()
        self.n = n

    def E(self, F):
        return float(np.sum(self.W * F))


class MCGrid:
    """Plain Monte Carlo points (for n >= 4)."""

    def __init__(self, n, N, seed=0):
        rng = np.random.default_rng(seed)
        self.Y = (rng.standard_normal((N, n)) + 1j * rng.standard_normal((N, n))) / math.sqrt(2)
        self.W = np.full(N, 1.0 / N)
        self.n = n

    def E(self, F):
        return float(np.mean(F))

    def se(self, F):
        return float(np.std(F) / math.sqrt(len(F)))


# ----------------------------------------------------------------------------------------------------------------
# profiles
# ----------------------------------------------------------------------------------------------------------------

class SqrtProfile:
    """phi(v) = sqrt v.  K(v) = sqrt v + u K'(v), K'(v) = u^{-1/2} (sqrt(pi)/2) erfcx(sqrt(v/u))."""
    name = 'sqrt'

    def __init__(self, u=1.0):
        self.u = u; self.B = math.sqrt(u) * SQPI / 2

    def phi(self, v):
        return np.sqrt(v)

    def Kp(self, v):
        return (SQPI / 2) * special.erfcx(np.sqrt(v / self.u)) / math.sqrt(self.u)

    def gp(self, v):
        w = np.asarray(v, dtype=float) / self.u
        out = np.empty_like(w)
        small = w < 2e-2
        ws = np.maximum(w[small], 1e-200)
        if ws.size:
            # N(w) = sum_{m>=1} b_{m-1}(2m-1)/(2m+1) w^{m+1/2} + (sqrt(pi)/2) sum_{m>=2} (1-m)/m! w^m ; g' = N/w^2
            acc = np.zeros_like(ws); b = 1.0
            sq = np.sqrt(ws)
            for m in range(1, 14):
                acc += b * (2 * m - 1) / (2 * m + 1) * ws ** (m - 2) * sq
                b *= 2.0 / (2 * m + 1)
            for m in range(2, 15):
                acc += (SQPI / 2) * (1 - m) / math.factorial(m) * ws ** (m - 2)
            out[small] = acc
        wl = w[~small]
        if wl.size:
            kp = (SQPI / 2) * special.erfcx(np.sqrt(wl))
            out[~small] = (np.sqrt(wl) + (1 - wl) * kp - SQPI / 2) / wl ** 2
        return out * self.u ** -1.5


class ExpProfile:
    """phi(v) = 1 - exp(-lam v)."""

    def __init__(self, lam, u=1.0):
        self.lam = lam; self.u = u; self.B = lam * u / (1 + lam * u); self.name = f'exp({lam:g})'

    def phi(self, v):
        return -np.expm1(-self.lam * v)

    def Kp(self, v):
        return self.lam * np.exp(-self.lam * v) / (1 + self.lam * self.u)

    def gp(self, v):
        t = self.lam * np.asarray(v, dtype=float)
        out = np.empty_like(t)
        s = t < 1e-3
        out[s] = 0.5 - t[s] / 3 + t[s] ** 2 / 8
        tl = t[~s]
        out[~s] = (1 - (1 + tl) * np.exp(-tl)) / tl ** 2
        return out * self.lam ** 2 / (1 + self.lam * self.u)


def _sgrid(smax):
    return np.concatenate([np.linspace(0, 1, 401)[:-1], np.linspace(1, 6, 501)[:-1], np.linspace(6, smax, 400)])


class TableProfile:
    """Generic profile from callables phi(v), phip(v) = phi'(v) (smooth on [0, inf)); tables in s = sqrt(v/scale)."""

    def __init__(self, phi, phip, u, scale=None, name='table', vmax_factor=4e4):
        self.u = u; self._phi = phi; self.name = name
        sc = scale if scale is not None else u
        self.sc = sc
        s = _sgrid(math.sqrt(vmax_factor)); v = sc * s * s
        self.smax = s[-1]
        gl_x, gl_w = np.polynomial.laguerre.laggauss(120)
        # K' and K'' need phi' at v + u t; use Gauss-Laguerre (phi' smooth)
        Kp = np.array([np.sum(gl_w * phip(x + u * gl_x)) for x in v])
        K = np.array([np.sum(gl_w * phi(x + u * gl_x)) for x in v])
        self.B = float(np.sum(gl_w * phi(u * gl_x)))
        self._Kp = CubicSpline(s, Kp)
        # K'' = (K' - phi')/u
        Kpp = (Kp - phip(v)) / u
        self._Kpp = CubicSpline(s, Kpp)
        # gamma'(v) = -int_0^1 theta K''(theta v) dtheta
        x, w = np.polynomial.legendre.leggauss(40); th = 0.5 * (x + 1); wt = 0.5 * w
        gp = np.array([-np.sum(wt * th * self._Kpp(np.sqrt(th * vv / sc))) for vv in v])
        self._gp = CubicSpline(s, gp)

    def _s(self, v):
        return np.minimum(np.sqrt(np.asarray(v, dtype=float) / self.sc), self.smax)

    def phi(self, v):
        return self._phi(np.asarray(v, dtype=float))

    def Kp(self, v):
        return self._Kp(self._s(v))

    def gp(self, v):
        return self._gp(self._s(v))


def buffer_profile(sig2, u=1.0):
    """phi(v) = 2E|sigma W + sqrt v| = sigma sqrt(pi) 1F1(-1/2;1;-v/sigma^2)."""
    sg = math.sqrt(sig2)

    def phi(v):
        x = np.asarray(v, dtype=float) / sig2
        return sg * SQPI * ((1 + x) * special.ive(0, x / 2) + x * special.ive(1, x / 2))

    def phip(v):
        x = np.asarray(v, dtype=float) / sig2
        return SQPI / (2 * sg) * (special.ive(0, x / 2) + special.ive(1, x / 2))

    return TableProfile(phi, phip, u, scale=min(u, sig2) if sig2 < u else u, name=f'buffer(s2={sig2:g})')


def peak_profile(u, path='tab_peak.npz'):
    d = np.load(path)
    s = d['s']
    PHI = CubicSpline(s, d['phi']); J = CubicSpline(s, d['j'])
    smax = s[-1]

    def phi(v):
        sv = np.sqrt(np.asarray(v, dtype=float))
        # beyond the table: phi ~ 2 sqrt v + c/sqrt v ; extend linearly in s (phi'(s) -> 2)
        return np.where(sv <= smax, PHI(np.minimum(sv, smax)), PHI(smax) + PHI(smax, 1) * (sv - smax))

    def phip(v):
        sv = np.sqrt(np.asarray(v, dtype=float))
        return np.where(sv <= smax, J(np.minimum(sv, smax)), J(smax) * smax / np.maximum(sv, smax))

    return TableProfile(phi, phip, u, scale=u, name=f'peak(u={u:g})', vmax_factor=1600.0 / u if 1600.0 / u > 4e4 else 4e4)


# ----------------------------------------------------------------------------------------------------------------
# the split
# ----------------------------------------------------------------------------------------------------------------

def split(grid, t, prof, fields=None):
    """Returns dict with D (direct), T1, T2, and moments.  t must be normalised to E|q|^2 = prof.u."""
    V, c1, c2, rhoV = fields if fields is not None else stein_fields(t, grid.Y)
    u = prof.u
    D = prof.B - grid.E(prof.phi(V))
    T1 = -grid.E((c2 - u) * prof.Kp(V))
    T2 = grid.E(rhoV * prof.gp(V))
    return dict(D=D, T1=T1, T2=T2)


def moments(grid, t, fields=None):
    V, c1, c2, rhoV = fields if fields is not None else stein_fields(t, grid.Y)
    u = grid.E(V)
    return dict(u=u, Ec1=grid.E(c1), Ec2=grid.E(c2), delta=grid.E(V * V) - 2 * u * u,
                cov_c2V=grid.E((c2 - u) * V), Eq2a=grid.E(rhoV))

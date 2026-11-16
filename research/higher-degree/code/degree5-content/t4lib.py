# T3 (content representation) and T4 (projected bound) of the antiholomorphic Stein package, for the tilted degree-5
# A/B profiles of the capped game.  claude-b9ee worker, round 3 (16 Nov 2026).  N.
#
#   T3:  E[conj(y_e) q h(V)] = E[conj(y_e) k'(V) (conj(q) a + q (c2 - u))],  k(v) = E h(v + u tau), tau ~ Exp(1),
#        a = sum_j d_j q dbar_j q,  c2 = sum_j |dbar_j q|^2,  V = |q|^2.
#   T4:  |E[conj(y_e) q h(V)]|^2 <= delta Omega_e,
#        Omega_e = ||P20 G||^2 + (1/4)||P31 G||^2 + (1/2)||P11 G'||^2 + (1/2)||P22 G'||^2,  G = y_e q k'(V), G' = y_e conj(q) k'(V).
#
# Family: q = sig (c p(X, Y) + sqrt(1-c^2) W), p a normalised cubic of H21(C^2) (six complex coefficients), W a diffuse
# bulk (a standard complex Gaussian of chaos grade (2,1), independent of X, Y).  In the diffuse limit a = sig^2 c^2 a_p,
# c2 - u = sig^2 c^2 (c2_p - 1), delta = c^4 sig^4 chi_p, and the projections reduce to the effective basis
#   H20: H20(X,Y);  H31: H31(X,Y) + {X W, Y W};  H11: H11(X,Y);  H22: H22(X,Y) + {Xbar W, Ybar W, X Wbar, Y Wbar}.
# c = 1 is a plain two-variable cubic; p = H(X) with c < 1 is the one-spike family.
import numpy as np, math
import rowlib as R, prof as PF
from numpy.polynomial.laguerre import laggauss
from scipy.interpolate import CubicSpline

TAU, WTAU = laggauss(64)

def core_quad(n1=(24, 60), nth=64):
    a, wa = R.gl_panels(0.0, 3.0, n1[0] // 8 * 2); b, wb = R.gl_panels(3.0, 40.0, n1[1] // 8)
    T = np.concatenate([a, b]); W = np.concatenate([wa, wb]) * np.exp(-T)
    th = (np.arange(nth) + 0.5) * 2 * np.pi / nth
    T1, T2, TH = np.meshgrid(T, T, th, indexing='ij'); w = (W[:, None, None] * W[None, :, None] * np.ones(nth)[None, None, :] / nth).ravel()
    X = np.sqrt(T1).ravel() + 0j; Y = (np.sqrt(T2) * np.exp(1j * TH)).ravel()
    return X, Y, w / w.sum()

def cubic_basis(X, Y):
    """orthonormal basis m1..m6 of H21(C^2) and the derivative tables d_X, dbar_X, d_Y, dbar_Y."""
    TX, TY = np.abs(X) ** 2, np.abs(Y) ** 2; s2 = math.sqrt(2); Z = np.zeros_like(X)
    m = np.array([X * (TX - 2) / s2, Y * (TY - 2) / s2, X * X * np.conj(Y) / s2, Y * Y * np.conj(X) / s2, X * (TY - 1), Y * (TX - 1)])
    dX = np.array([s2 * (TX - 1), Z, s2 * X * np.conj(Y), Z, TY - 1, Y * np.conj(X)])
    dbX = np.array([X * X / s2, Z, Z, Y * Y / s2, Z, Y * X])
    dY = np.array([Z, s2 * (TY - 1), Z, s2 * Y * np.conj(X), X * np.conj(Y), TX - 1])
    dbY = np.array([Z, Y * Y / s2, X * X / s2, Z, X * Y, Z])
    return m, dX, dbX, dY, dbY

def wick_bases(X, Y):
    """orthonormal bases of H20, H31, H11, H22 in two variables (products of one-variable Wick polynomials)."""
    e = lambda a, b, z: PF.e_ab(a, b, z)
    def fam(p, q): return np.array([e(a, b, X) * e(p - a, q - b, Y) for a in range(p + 1) for b in range(q + 1)])
    return dict(H20=fam(2, 0), H31=fam(3, 1), H11=fam(1, 1), H22=fam(2, 2))

class Profile:
    """radial profile Phi(x) = ph(x) G(|x|), h(v) = G(sqrt v)/sqrt v, and its transform k' at energy u."""
    def __init__(self, G, u, Rmax=6.0, n=2401):
        self.G, self.u = G, u
        Rg = np.linspace(0, Rmax, n); v = Rg ** 2
        def h(vv):
            s = np.sqrt(np.maximum(vv, 1e-18)); return G(s) / s
        k = np.array([WTAU @ h(vi + u * TAU) for vi in v])
        kp = (k - h(v)) / u
        self.Rg = Rg; self.kp_R = CubicSpline(Rg, kp)                  # k'(R^2) as a function of R
        self.f1 = lambda Rr: np.asarray(Rr) * self.kp_R(np.minimum(Rr, Rmax))            # R k'(R^2)
        self.f2 = lambda Rr: np.asarray(Rr) ** 2 * self.kp_R(np.minimum(Rr, Rmax))       # R^2 k'(R^2)

class Smoother:
    """E_W f(|r + bW|) ph(r+bW)^k for k = 0, 1, 2 (real parts), tabulated in r; b^2 = bulk complex variance."""
    def __init__(self, b2, rmax=6.0, nr=901, nth=64):
        self.b2 = b2; self.rg = np.linspace(0, rmax, nr); self.rmax = rmax
        t1, w1 = R.gl_panels(0.0, 2.0, 8); t2, w2 = R.gl_panels(2.0, 42.0, 14)
        Tw = np.concatenate([t1, t2]); ww = np.concatenate([w1, w2]) * np.exp(-Tw); th = (np.arange(nth) + 0.5) * 2 * np.pi / nth
        self.W = (np.sqrt(Tw)[:, None] * np.exp(1j * th)[None, :]).ravel(); self.wq = (ww[:, None] * np.ones(nth)[None, :] / nth).ravel()
        self.wq = self.wq / self.wq.sum()
    def table(self, f, k):
        if self.b2 <= 1e-14:
            return CubicSpline(self.rg, f(self.rg))
        b = math.sqrt(self.b2); out = np.zeros(len(self.rg))
        for i in range(0, len(self.rg), 64):
            a = self.rg[i:i + 64][:, None] + b * self.W[None, :]; s = np.abs(a)
            ph = (a / np.maximum(s, 1e-300)) ** k if k else 1.0
            out[i:i + 64] = np.real(f(s) * ph) @ self.wq
        return CubicSpline(self.rg, out)

class Core:
    """quadrature and polynomial tables for the two-variable core."""
    def __init__(self, n1=(24, 60), nth=64):
        self.X, self.Y, self.w = core_quad(n1, nth)
        self.m, self.dX, self.dbX, self.dY, self.dbY = cubic_basis(self.X, self.Y)
        self.B = wick_bases(self.X, self.Y)
        self.ye = np.array([self.X, self.Y])

_CACHE = {}
def tables(row, sectors, c, sig):
    key = (id(row), tuple(sorted(sectors)), round(c, 6), round(sig, 8))
    if key in _CACHE: return _CACHE[key]
    u = sig * sig; b2 = u * (1 - c * c); sm = Smoother(b2)
    tab = dict(sm=sm, psi=sm.table(row.ps, 0), sect={})
    for name, G in sectors.items():
        pr = Profile(G, u)
        tab['sect'][name] = dict(S1G=sm.table(lambda s_: G(np.minimum(s_, 6.0)), 1), S1f1=sm.table(pr.f1, 1),
                                 S0f2=sm.table(pr.f2, 0), S2f2=sm.table(pr.f2, 2), prof=pr,
                                 S0f2k=sm.table(lambda s_, pr=pr: pr.f1(s_) ** 2, 0))
    if len(_CACHE) > 40: _CACHE.clear()
    _CACHE[key] = tab
    return tab

def evaluate(core, row, sectors, coef, c, sig):
    """sectors: dict name -> radial G (tilted).  Returns per-sector content, T3 right side, Omega (core sup, content direction, bulk),
    plus D, Vsl, delta, chi."""
    coef = np.asarray(coef, complex); coef = coef / np.linalg.norm(coef)
    u = sig * sig; b2 = u * (1 - c * c); b = math.sqrt(max(b2, 0.0))
    w = core.w; p = coef @ core.m
    dXp, dbXp, dYp, dbYp = coef @ core.dX, coef @ core.dbX, coef @ core.dY, coef @ core.dbY
    a_p = dXp * dbXp + dYp * dbYp; c2_p = np.abs(dbXp) ** 2 + np.abs(dbYp) ** 2
    chi_p = float(w @ np.abs(p) ** 4 - 2.0)
    a0 = sig * c * p; r = np.abs(a0); rc = np.minimum(r, 6.0); pha = np.where(r > 0, a0 / np.maximum(r, 1e-300), 1.0)
    tab = tables(row, sectors, c, sig)
    D = row.B5(u) - float(w @ tab['psi'](rc)); Vsl = row.Vsl(u)
    delta = c ** 4 * u * u * chi_p
    a_eff = u * c * c * a_p; x_eff = u * c * c * (c2_p - 1.0)
    out = dict(u=u, c=c, chi=c ** 4 * chi_p, delta=delta, D=D, Vsl=Vsl, sect={}, law=(tab['sm'], rc, w))
    wy = [w * core.ye[0], w * core.ye[1]]; wyc = [w * np.conj(core.ye[0]), w * np.conj(core.ye[1])]
    dq = [sig * c * dXp, sig * c * dYp]
    out['Nm'] = np.array([[(w * dq[i]) @ np.conj(dq[j]) for j in range(2)] for i in range(2)])
    for name in sectors:
        T = tab['sect'][name]
        s1g, s1f, s0f, s2f = T['S1G'](rc), T['S1f1'](rc), T['S0f2'](rc), T['S2f2'](rc)
        cont = np.array([wyc[j] @ (pha * s1g) for j in range(2)])
        t3 = np.array([wyc[j] @ ((a_eff * np.conj(pha) + x_eff * pha) * s1f) for j in range(2)])
        qk = pha * s1f; qbk = np.conj(pha) * s1f
        if b > 1e-7:
            mixW = (s0f - rc * s1f) / b; mixW2 = np.conj(pha) ** 2 * (s2f - rc * s1f) / b
        else:
            mixW = np.zeros_like(rc); mixW2 = np.zeros_like(rc, dtype=complex)
        gq = [wy[0] * qk, wy[1] * qk]; gqb = [wy[0] * qbk, wy[1] * qbk]          # w * y_j * (q k'),  w * y_j * (conj(q) k')
        parts = {}
        def block(basis, g, wt, extra=()):
            V = np.array([[np.vdot(Bf, g[j]) for j in range(2)] for Bf in basis] + list(extra))    # V[b, j] = <B_b, G_j>
            return wt * (V.conj().T @ V)
        ex31 = [np.array([wyc[l] @ (core.ye[j] * mixW) for j in range(2)]) for l in range(2)]
        ex22 = [np.array([wy[l] @ (core.ye[j] * mixW2) for j in range(2)]) for l in range(2)] + \
               [np.array([wyc[l] @ (core.ye[j] * mixW) for j in range(2)]) for l in range(2)]
        parts['H20'] = block(core.B['H20'], gq, 1.0); parts['H31'] = block(core.B['H31'], gq, 0.25, ex31)
        parts['H11'] = block(core.B['H11'], gqb, 0.5); parts['H22'] = block(core.B['H22'], gqb, 0.5, ex22)
        M = sum(parts.values()); ev = np.linalg.eigvalsh(M)
        nc = np.linalg.norm(cont); estar = cont / nc if nc > 0 else np.array([1.0 + 0j, 0.0])
        Om_star = float(np.real(np.conj(estar) @ M @ estar))
        c1 = np.array([wyc[j] @ qk for j in range(2)])
        p21 = np.array([np.vdot(Bf, w * qk) for Bf in core.m])
        mw = float(np.real(w @ mixW))
        Om_perp = 1.5 * float(np.sum(np.abs(c1) ** 2)) + 0.75 * float(np.sum(np.abs(p21) ** 2)) + 0.75 * mw * mw   # e orthogonal to the core (a bulk or a fresh coordinate)
        Om_bulk = Om_perp if b > 1e-7 else 0.0
        F10 = float(np.sum(np.abs(c1) ** 2)); F21 = float(np.sum(np.abs(p21) ** 2)) + mw * mw
        EVk2 = float(w @ T['S0f2k'](rc)) if 'S0f2k' in T else float('nan')
        EVk = float(w @ s0f); Omhat = 1.5 * EVk2 - 0.75 * EVk * EVk / u
        # ingredients of the all-direction majorant M1 (section 11.6):  e^* A2 e = E[|y_e|^2 V k'^2],  e^* A1 e = E[|y_e|^2 V k'],
        # e^* Cm e = E[conj(Dbar_e q) y_e q k'],  e^* Nm e = ||d_e q||^2   (y_e = sum e_j y_j, Dbar_e = sum e_j dbar_j, d_e = sum conj(e_j) d_j)
        g2 = T['S0f2k'](rc); dbq = [sig * c * dbXp, sig * c * dbYp]
        A2 = np.array([[wyc[i] @ (core.ye[j] * g2) for j in range(2)] for i in range(2)])
        A1 = np.array([[wyc[i] @ (core.ye[j] * s0f) for j in range(2)] for i in range(2)])
        Cm = np.array([[(w * np.conj(dbq[i])) @ (core.ye[j] * qk) for j in range(2)] for i in range(2)])
        out['sect'][name] = dict(content=float(np.sum(np.abs(cont) ** 2)), t3=float(np.sum(np.abs(t3) ** 2)), cont_vec=cont, t3_vec=t3,
                                 Om_core=float(ev[-1]), Om_star=Om_star, M=M, A2=A2, A1=A1, Cm=Cm, c1=c1, estar=estar, Om_bulk=Om_bulk, Om_perp=Om_perp, F10=F10, F21=F21, EVk2=EVk2, EVk=EVk, Omhat=Omhat,
                                 parts={k_: float(np.real(np.conj(estar) @ v @ estar)) for k_, v in parts.items()})
    return out

def rice_T(out, lams=None):
    """largest t allowed by the Rice family (R1) for this cubic's law:  min_lambda [E rho(lam^2 V) - lam u / e1]."""
    import rice as RI
    sm, rc, w = out['law']; u = out['u']; best = np.inf
    for l in (np.linspace(0.3, 3.0, 10) if lams is None else lams):
        tb = sm.table(lambda s_, l=l: RI.rho(l * l * s_ * s_), 0)
        best = min(best, float(w @ tb(rc)) - l * u / RI.E1)
    return best

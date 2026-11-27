# [copy of degree5-cert/smallt/cert.py; claude-b9ee worker d5newcap, 16 Nov 2026: only the constants changed, they are read from the
#  environment: ST_E1 (lambda_1), ST_ETA (the degree-5 coefficient), ST_RHO (the radius input), as rationals p/q; no defaults]
"""Small-t certificate machinery (claude-b9ee worker, 16 Nov 2026).

Target: for a fixed eta' (etap) and sigma, bound F(sigma) = sup_law E g_sigma(R),
    g_sigma(r) = 2 sigma r + (etap - sigma r)_+^2 / etap,
over laws of R = |q|/||q|| (q in H_{2,1}) with
    E R^2 = 1, E R^4 = 2+s (0<=s<=42), E R^6 <= 6+9s+C6 s^{3/2}, E R <= rho,
    E Psi_{w,mu}(R) <= mu s/24  (scalar Stein family, real-stein-radius.tex).
Certificate: P(r) + Psi(r) - g(r) >= 0 on [0,inf) with
    P(r) = l0 + l1 r^2 + l2 r^4 + l3 r^6 + lr r,  l3, lr, mu >= 0,
giving F(sigma) <= B(s) := l0 + l1 + l2(2+s) + l3(6+9s+C6 s^1.5) + lr rho + mu s/24, max at s-interval ends.
"""
import numpy as np
from fractions import Fraction as Fr
import math

import os as _os
E1 = Fr(_os.environ['ST_E1']); ETA = Fr(_os.environ['ST_ETA']); RHO = Fr(_os.environ['ST_RHO']); C6 = Fr(4045313, 100000)
TARGET = Fr(500, 701)

KN = [Fr(0)] + [Fr(k, 20) for k in range(1, 33)] + [Fr(x) for x in ['1.8', '2.0', '2.3', '2.6', '3.0', '3.5', '4', '5', '6', '8', '10']]
KNf = np.array([float(x) for x in KN]); K = len(KN)
# largest double <= each knot (for the exact test r > KN[j] with a double r)
FLJ = np.array([float(x) if Fr(float(x)) <= x else float(np.nextafter(float(x), -np.inf)) for x in KN])

# ---------------------------------------------------------------- numerical tables (for solving only)
def hats(x):
    x = np.asarray(x, float)
    phi = np.zeros(x.shape + (K,)); Phi = np.zeros(x.shape + (K,))
    for j in range(K):
        if j == 0:
            m, r = KNf[0], KNf[1]
            f = np.where(x < r, (r - x)/(r - m), 0.0); xc = np.minimum(x, r)
            F = (r*xc - xc**2/2)/(r - m)
        elif j == K-1:
            l, m = KNf[j-1], KNf[j]
            f = np.where(x <= l, 0.0, np.where(x < m, (x - l)/(m - l), 1.0)); xc = np.clip(x, l, m)
            F = (xc - l)**2/(2*(m - l)) + np.maximum(x - m, 0)
        else:
            l, m, r = KNf[j-1], KNf[j], KNf[j+1]
            f = np.where((x > l) & (x < m), (x - l)/(m - l), np.where((x >= m) & (x < r), (r - x)/(r - m), 0.0))
            x1 = np.clip(x, l, m); x2 = np.clip(x, m, r)
            F = (x1 - l)**2/(2*(m - l)) + ((r - m)**2 - (r - x2)**2)/(2*(r - m))
        phi[..., j] = f; Phi[..., j] = F
    return phi, Phi

RG = np.concatenate([np.linspace(0, 0.5, 41), np.linspace(0.5, 2.0, 241)[1:], np.linspace(2.0, 6.0, 161)[1:],
                     np.linspace(6, 14, 41)[1:], np.linspace(14, 30, 17)[1:]])
_tab = {}
def tables(nth=3000):
    if 'A' not in _tab:
        U = np.abs(np.cos((2*np.arange(1, nth+1)-1)*np.pi/(2*nth)))
        A = np.zeros((len(RG), K)); L = np.zeros((len(RG), K, K))
        for i, r in enumerate(RG):
            X = r*U; phi, Phi = hats(X)
            A[i] = (X[:, None]*Phi - phi/2).mean(axis=0)
            ev, V = np.linalg.eigh(phi.T @ phi / nth)
            L[i] = V*np.sqrt(np.clip(ev, 0, None))
        _tab['A'], _tab['L'] = A, L
    return _tab['A'], _tab['L']

def bound_expr_float(lam, lr, mu, s):
    return lam[0] + lam[1] + lam[2]*(2+s) + lam[3]*(6+9*s+float(C6)*s**1.5) + lr*float(RHO) + (mu*s/24 if mu is not None else 0)

def solve(sigma, etap, sa, sb, stein=True, margin=1e-5, margin4=1.25e-6):
    """Numerical dual certificate (floats)."""
    import cvxpy as cp
    sigma = float(sigma); etap = float(etap)
    g = 2*sigma*RG + np.maximum(etap - sigma*RG, 0)**2/etap + margin + margin4*RG**4
    lam = cp.Variable(4); lr = cp.Variable(nonneg=True); tv = cp.Variable()
    P = lam[0] + lam[1]*RG**2 + lam[2]*RG**4 + lam[3]*RG**6 + lr*RG
    cons = [lam[3] >= 0]
    if stein:
        A, L = tables()
        w = cp.Variable(K); mu = cp.Variable(nonneg=True)
        aff = P + A @ w - g
        for i in range(len(RG)):
            cons.append(cp.quad_over_lin(L[i].T @ w, mu) <= 2*aff[i])
        B = lambda s: lam[0] + lam[1] + lam[2]*(2+s) + lam[3]*(6+9*s+float(C6)*s**1.5) + lr*float(RHO) + mu*s/24
    else:
        cons.append(P >= g)
        # tail positivity for r >= 30 (polynomial-only certificate): r (P(r) - 2 sigma r) as a polynomial in y = r - 30
        rm = 30.0
        from math import comb
        coeffs = {7: lam[3], 5: lam[2], 3: lam[1], 2: lr - 2*sigma, 1: lam[0]}
        for k in range(1, 8):
            expr = 0
            for d, cdk in coeffs.items():
                if d >= k:
                    expr = expr + cdk*comb(d, k)*rm**(d-k)
            cons.append(expr >= 0)
        B = lambda s: lam[0] + lam[1] + lam[2]*(2+s) + lam[3]*(6+9*s+float(C6)*s**1.5) + lr*float(RHO)
    cons += [B(sa) <= tv, B(sb) <= tv]
    prob = cp.Problem(cp.Minimize(tv), cons)
    try:
        prob.solve(solver='CLARABEL', max_threads=1)
    except Exception:
        prob.solve(solver='SCS', eps=1e-9, max_iters=200000)
    out = dict(sigma=sigma, etap=etap, sa=sa, sb=sb, stein=stein, status=prob.status,
               lam=[float(x) for x in lam.value], lr=float(lr.value), value=float(prob.value))
    if stein:
        out['w'] = [float(x) for x in w.value]; out['mu'] = float(mu.value)
    else:
        out['w'] = [0.0]*K; out['mu'] = 1.0
    return out

# ---------------------------------------------------------------- vectorised interval arithmetic (outward rounding)
INF = np.inf
def dn(x): return np.nextafter(x, -INF)
def up(x): return np.nextafter(x, INF)
class I:
    __slots__ = ('lo', 'hi')
    def __init__(self, lo, hi=None):
        self.lo = np.asarray(lo, float); self.hi = np.asarray(self.lo if hi is None else hi, float)
    @staticmethod
    def frac(F):
        """enclosure of an exact rational (scalar)"""
        f = float(F)
        lo = f if Fr(f) <= F else float(dn(f)); hi = f if Fr(f) >= F else float(up(f))
        return I(lo, hi)
    def __add__(s, o):
        o = o if isinstance(o, I) else I(o)
        return I(dn(s.lo + o.lo), up(s.hi + o.hi))
    __radd__ = __add__
    def __neg__(s): return I(-s.hi, -s.lo)
    def __sub__(s, o):
        o = o if isinstance(o, I) else I(o)
        return I(dn(s.lo - o.hi), up(s.hi - o.lo))
    def __rsub__(s, o): return I(o) - s
    def __mul__(s, o):
        o = o if isinstance(o, I) else I(o)
        c = np.stack([s.lo*o.lo, s.lo*o.hi, s.hi*o.lo, s.hi*o.hi])
        return I(dn(c.min(0)), up(c.max(0)))
    __rmul__ = __mul__
    def sqrt(s):
        return I(np.maximum(dn(np.sqrt(np.maximum(s.lo, 0))), 0), up(np.sqrt(np.maximum(s.hi, 0))))
    def arcsin(s):  # s within [0,1]; libm arcsin assumed accurate to 1 ulp -> widen by 2 ulp
        lo = np.clip(s.lo, 0, 1); hi = np.clip(s.hi, 0, 1)
        a = np.arcsin(lo); b = np.arcsin(hi)
        for _ in range(8):   # widen by 8 ulp: covers libm/SIMD arcsin errors up to 4 ulp with room
            a = dn(a); b = up(b)
        return I(a, b)
    def div(s, o):  # o > 0
        o = o if isinstance(o, I) else I(o)
        c = np.stack([s.lo/o.lo, s.lo/o.hi, s.hi/o.lo, s.hi/o.hi])
        return I(dn(c.min(0)), up(c.max(0)))

PI = I(float(dn(np.pi)), float(up(np.pi)))

# ---------------------------------------------------------------- exact data of a certificate
def exact_h(cert):
    """Exact (Fraction) piecewise-cubic coefficients of h(x) = x V(x) - w/2 - w^2/(2 mu)."""
    w = [Fr(x) for x in cert['w']]; mu = Fr(cert['mu'])
    V = [Fr(0)]
    for j in range(K-1):
        V.append(V[-1] + (w[j] + w[j+1])*(KN[j+1] - KN[j])/2)
    pieces = []
    for j in range(K-1):
        xj = KN[j]; m = (w[j+1] - w[j])/(KN[j+1] - KN[j])
        al = w[j] - m*xj
        c1 = V[j] - w[j]*xj + m*xj*xj/2
        h0 = -al/2 - al*al/(2*mu)
        h1 = c1 - m/2 - al*m/mu
        h2 = (w[j] - m*xj) - m*m/(2*mu)
        h3 = m/2
        pieces.append((h0, h1, h2, h3))
    wK = w[K-1]; VK = V[K-1]; xK = KN[K-1]
    last = (-wK/2 - wK*wK/(2*mu), VK - wK*xK, wK, Fr(0))
    return pieces, last, w, V, mu

def Ik(k, u, s1):
    """I_k(u) = int_0^u v^k/sqrt(1-v^2) dv, given interval u in [0,1] and s1 = sqrt(1-u^2)."""
    if k == 0: return u.arcsin()
    if k == 1: return 1 - s1
    if k == 2: return (u.arcsin() - u*s1)*0.5
    if k == 3: return (I(2.0) - (I(2.0) + u*u)*s1).div(I(3.0))

def Psi_enclosure(r, cert, hdata=None):
    """Interval enclosure of Psi(r) for an array r > 0 of floats (exact points)."""
    pieces, last, w, V, mu = hdata if hdata is not None else exact_h(cert)
    r = np.asarray(r, float)
    R = I(r)
    tot = I(np.zeros_like(r))
    # u_j = min(1, x_j / r), s_j = sqrt(1-u_j^2) = sqrt((r-x_j)(r+x_j))/r for x_j < r
    us = []; ss = []
    for j in range(K):
        xj = I.frac(KN[j])
        u = xj.div(R)
        u = I(np.minimum(u.lo, 1.0), np.minimum(u.hi, 1.0))
        inside = r > FLJ[j]   # exact: FLJ[j] is the largest double <= KN[j]
        dpos = (R - xj); dpos = I(np.maximum(dpos.lo, 0), np.maximum(dpos.hi, 0))
        s1 = (dpos*(R + xj)).sqrt().div(R)
        s1 = I(np.where(inside, s1.lo, 0.0), np.where(inside, s1.hi, 0.0))
        u = I(np.where(inside, u.lo, 1.0), np.where(inside, u.hi, 1.0))
        us.append(u); ss.append(s1)
    one = I(np.ones_like(r)); zero = I(np.zeros_like(r))
    Ivals = []
    for j in range(K):
        Ivals.append([Ik(k, us[j], ss[j]) for k in range(4)])
    Itop = [Ik(k, one, zero) for k in range(4)]
    rk = [I(np.ones_like(r)), R, R*R, R*R*R]
    for j in range(K-1):
        hj = pieces[j]
        for k in range(4):
            if hj[k] == 0: continue
            d = Ivals[j+1][k] - Ivals[j][k]
            tot = tot + I.frac(hj[k])*rk[k]*d
    for k in range(3):
        if last[k] == 0: continue
        d = Itop[k] - Ivals[K-1][k]
        tot = tot + I.frac(last[k])*rk[k]*d
    return (tot*2).div(PI)

_hpm_cache = {}
def _piece_hprime_max(coef, a, b):
    # exact max of |h'(x)| on [a,b], h' = h1 + 2 h2 x + 3 h3 x^2 (quadratic)
    h0, h1, h2, h3 = coef
    f = lambda x: h1 + 2*h2*x + 3*h3*x*x
    cands = [abs(f(a)), abs(f(b))]
    if h3 != 0:
        xv = -2*h2/(6*h3)
        if a < xv < b: cands.append(abs(f(xv)))
    return max(cands)
def hprime_max(hdata, rb):
    """Exact max_{0<=x<=rb} |h'(x)| (piecewise quadratic h')."""
    pieces, last, w, V, mu = hdata
    key = id(hdata)
    if key not in _hpm_cache:
        _hpm_cache.clear()
        _hpm_cache[key] = [_piece_hprime_max(pieces[j], KN[j], KN[j+1]) for j in range(K-1)]
    pm = _hpm_cache[key]
    rb = Fr(rb)
    best = Fr(0)
    for j in range(K-1):
        a, b = KN[j], KN[j+1]
        if a >= rb: break
        if b <= rb:
            best = max(best, pm[j])
        else:
            best = max(best, _piece_hprime_max(pieces[j], a, rb))
    if rb > KN[K-1]:
        best = max(best, _piece_hprime_max(last, KN[K-1], rb))
    return best

def g_enclosure(r, sigma, etap):
    R = I(r); sg = I.frac(Fr(sigma)); ep = I.frac(Fr(etap))
    lin = sg*R*2
    d = ep - sg*R
    d = I(np.maximum(d.lo, 0), np.maximum(d.hi, 0))
    return lin + (d*d).div(ep)

def P_enclosure(r, cert):
    R = I(r); lam = cert['lam']
    R2 = R*R
    return I.frac(Fr(lam[0])) + I.frac(Fr(lam[1]))*R2 + I.frac(Fr(lam[2]))*R2*R2 + I.frac(Fr(lam[3]))*R2*R2*R2 + I.frac(Fr(cert['lr']))*R

def verify(cert, rmax=30.0, n0=6000, maxdepth=14, stein=True):
    """Rigorous check that Q(r) = P(r) + Psi(r) - g(r) >= 0 for all r >= 0. Returns (ok, info)."""
    sigma = Fr(cert['sigma']); etap = Fr(cert['etap'])
    hdata = exact_h(cert)
    lam = [Fr(x) for x in cert['lam']]; lr = Fr(cert['lr'])
    if lam[3] < 0 or lr < 0 or Fr(cert['mu']) <= 0:
        return False, 'sign'
    # r = 0: Q(0) = l0 + h(0) - etap
    Q0 = lam[0] + hdata[0][0][0] - etap
    if Q0 <= 0:
        return False, f'Q(0)={float(Q0)}'
    # breakpoint tables for the Lipschitz constants (exact Fractions, rounded up to floats)
    BRK = np.unique(np.concatenate([np.linspace(0, 2.5, 501), np.linspace(2.5, rmax, 551)]))
    LPtab = []; LHtab = []
    for bb in BRK:
        fb = Fr(float(bb))
        lp = 2*abs(lam[1])*fb + 4*abs(lam[2])*fb**3 + 6*lam[3]*fb**5 + lr
        lh = 2*hprime_max(hdata, fb)/Fr(314159, 100000)
        LPtab.append(float(up(float(lp)))); LHtab.append(float(up(float(lh))))
    LPtab = np.array(LPtab); LHtab = np.array(LHtab)
    # cells on [0, rmax]: geometric-ish uniform grid then adaptive bisection
    edges = np.unique(np.concatenate([np.linspace(0, 2.5, n0//2), np.linspace(2.5, rmax, n0//2)]))
    cells = np.stack([edges[:-1], edges[1:]], 1)
    worst = np.inf; ncells = 0
    for depth in range(maxdepth):
        a = cells[:, 0]; b = cells[:, 1]
        apos = np.where(a > 0, a, b*1e-3)  # avoid r=0 in Psi formula; handle [0,b] via left point near 0
        # lower bounds
        Pa = P_enclosure(a, cert)
        kidx = np.searchsorted(BRK, b, side='left')
        LP = LPtab[kidx]
        Psa = Psi_enclosure(apos, cert, hdata)
        LPsi = LHtab[kidx]
        gb = g_enclosure(b, sigma, etap)
        width = b - a
        # for cells starting at 0 we evaluated Psi at apos, so add Lipschitz over [0,b]
        lowerQ = Pa.lo - LP*width + Psa.lo - LPsi*width*(1+1e-9) - gb.hi
        ok = lowerQ > 0
        ncells += len(cells)
        if ok.all():
            worst = min(worst, lowerQ.min())
            break
        worst = min(worst, lowerQ[ok].min() if ok.any() else np.inf)
        bad = cells[~ok]
        if (bad[:, 1] - bad[:, 0]).min() < 1e-9:
            return False, f'cell too small near r={bad[0,0]:.6f}, lowerQ={lowerQ[~ok].min():.3e}'
        mid = (bad[:, 0] + bad[:, 1])/2
        cells = np.concatenate([np.stack([bad[:, 0], mid], 1), np.stack([mid, bad[:, 1]], 1)])
    else:
        bc = cells[:, 0]
        hist = np.histogram(bc, bins=[0, 0.5, 1, 1.5, 2, 2.5, 3, 4, 6, 10, 30])[0]
        return False, f'maxdepth, {len(cells)} bad cells left; hist {hist.tolist()}; min lowerQ {lowerQ.min():.3e}'
    # tail r >= rmax: r Q(r) >= T(r) - D xK with T polynomial (exact)
    pieces, last, w, V, mu = hdata
    wK = w[K-1]; VK = V[K-1]; xK = KN[K-1]
    # D = max_{x<=xK} |h(x) - hquad(x)| bounded crudely by sum of abs coefficients at x = xK
    D = Fr(0)
    for j in range(K-1):
        h0, h1, h2, h3 = pieces[j]
        b = KN[j+1]
        D = max(D, abs(h0 - last[0]) + abs(h1 - last[1])*b + abs(h2 - last[2])*b*b + abs(h3)*b**3)
    twopi_lo = Fr(2)/Fr(math.pi + 1e-12)  # 2/pi lower bound
    twopi_hi = Fr(2)/Fr(math.pi - 1e-12)
    c1 = (VK - wK*xK)
    lin_coef = lr + (c1*twopi_lo if c1 >= 0 else c1*twopi_hi) - 2*sigma
    const = lam[0] - wK/2 - wK*wK/(2*mu)
    # T(r) = l3 r^7 + l2 r^5 + (l1 + wK/2) r^3 + lin_coef r^2 + const r ; need T(r) - D xK > 0 for r >= rmax
    rm = Fr(rmax)
    coeffs = {7: lam[3], 5: lam[2], 3: lam[1] + wK/2, 2: lin_coef, 1: const, 0: -D*xK}
    # substitute r = rm + y, require all coefficients in y >= 0 and constant > 0
    from math import comb
    ycoef = [Fr(0)]*8
    for d, c in coeffs.items():
        for k in range(d+1):
            ycoef[k] += c*comb(d, k)*rm**(d-k)
    if not (ycoef[0] > 0 and all(c >= 0 for c in ycoef[1:])):
        # exact fallback: Sturm count of real roots of T(r) - D xK on [rm, oo), T(rm) - D xK > 0, leading coeff > 0
        import sympy as sp
        rr = sp.symbols('r')
        poly = sp.Poly(sum(sp.Rational(c.numerator, c.denominator)*rr**d for d, c in coeffs.items()), rr)
        lead = poly.LC()
        if not (ycoef[0] > 0 and lead > 0 and poly.count_roots(sp.Rational(rm.numerator, rm.denominator), None) == 0):
            return False, f'tail fails: ycoef={[float(c) for c in ycoef]}'
    return True, dict(worst=float(worst), cells=int(ncells))

def sqrt_bounds(x, digits=40):
    """rational lo, hi with lo <= sqrt(x) <= hi for rational x >= 0"""
    x = Fr(x)
    if x == 0: return Fr(0), Fr(0)
    scale = 10**digits
    n = x.numerator*scale*scale // x.denominator
    r = math.isqrt(n)
    lo = Fr(r, scale); hi = Fr(r + 1, scale)
    return lo, hi

def bound_exact(cert, s):
    """Exact rational upper bound of B(s)."""
    lam = [Fr(x) for x in cert['lam']]; lr = Fr(cert['lr']); mu = Fr(cert['mu'])
    s = Fr(s)
    sq_lo, sq_hi = sqrt_bounds(s)
    s15 = s*sq_hi
    B = lam[0] + lam[1] + lam[2]*(2+s) + lam[3]*(6 + 9*s + C6*s15) + lr*RHO
    if cert['stein']:
        B += mu*s/24
    return B

# ---------------------------------------------------------------- grid-refined solve
FINE = np.concatenate([np.linspace(1e-4, 3.0, 15001), np.linspace(3.0, 30.0, 27001)[1:]])
def Q_float(c, r=None):
    r = FINE if r is None else r
    hd = exact_h(c)
    Ps = Psi_enclosure(r, c, hd); P = P_enclosure(r, c); g = g_enclosure(r, Fr(c['sigma']), Fr(c['etap']))
    return r, P.lo + Ps.lo - g.hi

def add_points(newr, nth=3000):
    """extend RG and the angular tables by new r points"""
    global RG
    newr = np.setdiff1d(np.round(np.asarray(newr), 9), RG)
    if len(newr) == 0: return 0
    U = np.abs(np.cos((2*np.arange(1, nth+1)-1)*np.pi/(2*nth)))
    A, L = tables()
    An = np.zeros((len(newr), K)); Ln = np.zeros((len(newr), K, K))
    for i, r in enumerate(newr):
        X = r*U; phi, Phi = hats(X)
        An[i] = (X[:, None]*Phi - phi/2).mean(axis=0)
        ev, V = np.linalg.eigh(phi.T @ phi / nth)
        Ln[i] = V*np.sqrt(np.clip(ev, 0, None))
    allr = np.concatenate([RG, newr]); order = np.argsort(allr)
    RG = allr[order]
    _tab['A'] = np.concatenate([A, An])[order]; _tab['L'] = np.concatenate([L, Ln])[order]
    return len(newr)

def solve_refined(sigma, etap, sa, sb, stein=True, margin=3e-5, margin4=1.25e-6, maxit=10, verbose=False):
    for it in range(maxit):
        c = solve(sigma, etap, sa, sb, stein=stein, margin=margin, margin4=margin4)
        r, Q = Q_float(c)
        bad = Q < 0.6*(margin + margin4*r**4)
        if verbose:
            print(f"   refine it {it}: value {c['value']:.6f} minQ {Q.min():.3e} at {r[np.argmin(Q)]:.4f}, bad {bad.sum()}, grid {len(RG)}", flush=True)
        if not bad.any():
            c['minQ_fine'] = float(Q.min()); return c
        # add local minima of Q among bad points (and their neighbours)
        idx = np.where(bad)[0]
        # pick local minima within runs of bad points
        pts = []
        runs = np.split(idx, np.where(np.diff(idx) > 1)[0] + 1)
        for run in runs:
            j = run[np.argmin(Q[run])]
            pts += [r[j]]
            if len(run) > 3:
                pts += [r[run[0]], r[run[-1]], r[run[len(run)//2]]]
        add_points(pts)
    c['minQ_fine'] = float(Q.min())
    return c

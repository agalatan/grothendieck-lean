#!/usr/bin/env python3
"""Reviewer's independent numerics for NOTE2.md (label N).  Nothing is imported from the package.

Differences of method from the package (numerics/prof.py, tab.py, core.py, twovar.py, influence.py):
  * angular averages by Gauss hypergeometric functions (package: complete elliptic integrals with m = 4rY/(r+Y)^2):
        E_psi|Y + r e^{i psi}|      = max(r,Y) 2F1(-1/2,-1/2;1;(min/max)^2),
        E_psi Re ph(Y + r e^{i psi}) = (Y/2r) 2F1(1/2,1/2;2;Y^2/r^2)                      (Y < r)
                                    = 2F1(-1/2,-1/2;1;t) - (t/2) 2F1(1/2,1/2;2;t), t=r^2/Y^2  (Y > r);
  * T-integrals by tanh-sinh quadrature on both sides of the kink rho(T) = Y plus Gauss-Legendre panels
    (package: adaptive QUADPACK);
  * profiles tabulated in v on [0,1] and in s = sqrt(v) on [1,60], quintic B-splines (package: one cubic spline in s),
    so h'(v) near v = 0 is not a quotient of two small numbers;
  * two-variable expectations in the three invariant coordinates (|X|^2, |Y|^2, relative phase) with composite
    Gauss-Legendre rules in the radii (package: Gauss-Laguerre in the radii, both phases);
  * the cap of Theorem 9 in closed form (package: a grid over the angle), for the constant kappa = 3/4 of the package
    and for the reviewer's sharp kappa = 1/2 (lam1^2 + lam2^2 <= delta/2, REVIEW.md section 2).

usage: own_numerics.py <out-dir> [<package tab_peak.npz>] [<package t9_search.json>] [<replayed t9_search.json>]
"""
import sys, os, json, math, time
import numpy as np
from scipy import special, optimize
from scipy.interpolate import make_interp_spline

A0 = 699 / 1250; B0 = 179 / 1250; EPS = 1891 / 2500; PP = 1 / EPS
GAMMA = {0.009: 251 / 5000, 0.02: 441 / 10000, 0.03: 3 / 80, 0.0463: 13 / 400}       # ledger 11.49 (rows containing u)
S2 = math.sqrt(2.0)

# ----------------------------------------------------------------------------------------------- quadrature rules
_h = 1.0 / 32; _t = np.arange(-110, 111) * _h
_uu = 0.5 * np.pi * np.sinh(_t)
TS_FRAC = 1.0 / (1.0 + np.exp(-2.0 * _uu))                       # (x - A)/(B - A)
TS_W = 0.25 * np.pi * np.cosh(_t) / np.cosh(_uu) ** 2 * _h       # weights for an interval of length 1
GLx, GLw = np.polynomial.legendre.leggauss(48)
def gl(a, b, x=GLx, w=GLw): return 0.5 * (a + b) + 0.5 * (b - a) * x, 0.5 * (b - a) * w
def ts(a, b): return a + (b - a) * TS_FRAC, (b - a) * TS_W
def rho(T): return np.sqrt(T) * (A0 + B0 * T)
def tstar(Y):
    """the T with rho(T) = Y: positive root x = sqrt(T) of B0 x^3 + A0 x - Y."""
    x = optimize.brentq(lambda x: B0 * x ** 3 + A0 * x - Y, 0.0, Y / A0 + 1.0, xtol=1e-16, rtol=1e-15)
    return x * x
def tnodes(Y):
    """nodes and weights (with e^{-T}) for int_0^infty f(T) e^{-T} dT, f singular at T = 0 and at rho(T) = Y."""
    Ts = tstar(Y) if Y > 0 else 0.0
    parts = []
    if Ts > 0: parts.append(ts(0.0, Ts))
    parts.append(ts(Ts, Ts + 1.0))
    for a, b in ((1.0, 6.0), (6.0, 16.0), (16.0, 45.0), (45.0, 90.0)): parts.append(gl(Ts + a, Ts + b))
    T = np.concatenate([p[0] for p in parts]); w = np.concatenate([p[1] for p in parts])
    return T, w * np.exp(-T)
def Mang(r, Y):
    hi = np.maximum(r, Y); lo = np.minimum(r, Y)
    return hi * special.hyp2f1(-0.5, -0.5, 1.0, np.minimum((lo / hi) ** 2, 1.0))
def Nang(r, Y):
    out = np.empty_like(r); inn = Y < r
    z = np.minimum((Y / r[inn]) ** 2, 1.0)
    out[inn] = (Y / (2 * r[inn])) * special.hyp2f1(0.5, 0.5, 2.0, z)
    t = np.minimum((r[~inn] / Y) ** 2, 1.0)
    out[~inn] = special.hyp2f1(-0.5, -0.5, 1.0, t) - 0.5 * t * special.hyp2f1(0.5, 0.5, 2.0, t)
    return out
def pjg(v):
    """(phi, j, g) at one v >= 0, by direct quadrature."""
    Y = math.sqrt(v); T, w = tnodes(Y); r = rho(T)
    if Y == 0.0:
        return 2 * np.sum(w * r), np.sum(w / (2 * r)), np.sum(w * (T - 1) / (2 * r))
    N = Nang(r, Y)
    return 2 * np.sum(w * Mang(r, Y)), np.sum(w * N) / Y, np.sum(w * (T - 1) * N) / Y

# ----------------------------------------------------------------------------------------------- profile tables
class Prof:
    VJ = 1.0; SMAX = 60.0
    def __init__(s, cache):
        if os.path.exists(cache):
            d = np.load(cache); s.v1, s.t1, s.s2, s.t2 = d["v1"], d["t1"], d["s2"], d["t2"]
        else:
            t0 = time.time()
            s.v1 = np.linspace(0.0, 1.02, 2041)                                   # uniform in v
            s.s2 = np.concatenate([0.96 + 0.01 * np.arange(704), 8.0 + 0.05 * np.arange(1041)])   # 0.96 .. 7.99, 8 .. 60
            s.t1 = np.array([pjg(v) for v in s.v1]); s.t2 = np.array([pjg(x * x) for x in s.s2])
            np.savez(cache, v1=s.v1, t1=s.t1, s2=s.s2, t2=s.t2)
            print(f"[profile tables built in {time.time()-t0:.1f} s: {len(s.v1)} + {len(s.s2)} nodes]")
        s.f1 = [make_interp_spline(s.v1, s.t1[:, i], k=5) for i in range(3)]
        s.f2 = [make_interp_spline(s.s2, s.t2[:, i], k=5) for i in range(3)]
        s.d1 = [f.derivative() for f in s.f1]; s.d2 = [f.derivative() for f in s.f2]
        s.B0v, s.j0, s.g0 = (float(x) for x in s.t1[0])
    def _ev(s, i, v, der):
        v = np.asarray(v, dtype=float); out = np.empty_like(v); lo = v <= s.VJ
        if der == 0:
            out[lo] = s.f1[i](v[lo]); out[~lo] = s.f2[i](np.minimum(np.sqrt(v[~lo]), s.SMAX))
        else:
            out[lo] = s.d1[i](v[lo]); x = np.sqrt(v[~lo]); out[~lo] = np.where(x <= s.SMAX, s.d2[i](np.minimum(x, s.SMAX)) / (2 * x), 0.0)
        return out
    def phi(s, v): return s._ev(0, v, 0)
    def j(s, v): return s._ev(1, v, 0)
    def g(s, v): return s._ev(2, v, 0)
    def h(s, lab, v):
        return s.g(v) if lab == "raw" else (s.g(v) - s.g0) - 0.6 * (s.j0 - s.j(v))
    def hp(s, lab, v):
        return s._ev(2, v, 1) if lab == "raw" else s._ev(2, v, 1) + 0.6 * s._ev(1, v, 1)

# ----------------------------------------------------------------------------------------------- radial rule, weight e^{-r}
EDGES = [0, .25, .5, 1, 1.5, 2, 2.5, 3, 4, 5, 6.5, 8, 10, 12.5, 15.5, 19, 23, 28, 34, 41, 50, 62, 80]
def radial(npanel):
    x, w = np.polynomial.legendre.leggauss(npanel)
    R = np.concatenate([gl(a, b, x, w)[0] for a, b in zip(EDGES[:-1], EDGES[1:])])
    W = np.concatenate([gl(a, b, x, w)[1] for a, b in zip(EDGES[:-1], EDGES[1:])])
    return R, W * np.exp(-R)
R1, W1 = radial(24)                                                    # 528 nodes, for one-dimensional laws

def cap(u, dl, sA, sB, kappa):
    """max of (sqrt(l1) sA + sqrt(l2) sB)^2 over 0<=l1<=2u, 0<=l2<=u, l1^2+l2^2 <= kappa*delta   (closed form)."""
    L2 = kappa * dl
    if L2 >= 5 * u * u: return u * (S2 * sA + sB) ** 2
    L = math.sqrt(L2); nrm = math.sqrt(sA ** (4 / 3) + sB ** (4 / 3))
    if nrm == 0: return 0.0
    l1 = L * sA ** (2 / 3) / nrm; l2 = L * sB ** (2 / 3) / nrm          # Hoelder point on the arc
    if l1 > 2 * u: l1 = 2 * u; l2 = math.sqrt(max(L2 - 4 * u * u, 0.0))
    elif l2 > u: l2 = u; l1 = math.sqrt(max(L2 - u * u, 0.0))
    return (math.sqrt(l1) * sA + math.sqrt(l2) * sB) ** 2
def cap_grid(u, dl, sA, sB, kappa):                                    # brute force, to validate cap()
    L = math.sqrt(kappa * dl); th = np.linspace(0, np.pi / 2, 200001)
    return float(np.max(np.sqrt(np.minimum(L * np.cos(th), 2 * u)) * sA + np.sqrt(np.minimum(L * np.sin(th), u)) * sB) ** 2)

def law_functionals(P, lab, V, W):
    """sA, sB, E phi(V) for a law given by nodes V and probability weights W."""
    hv = P.h(lab, V); hp = P.hp(lab, V); psi = hv + V * hp
    m = np.sum(W * psi); sA = math.sqrt(max(np.sum(W * (psi - m) ** 2), 0.0)); sB = math.sqrt(np.sum(W * (V * hp) ** 2))
    return sA, sB, float(np.sum(W * P.phi(V)))
def Bbench(P, u): return float(np.sum(W1 * P.phi(u * R1)))

# ----------------------------------------------------------------------------------------------- two-variable cubics
class Two:
    def __init__(s, npanel=8, nth=64):
        R, W = radial(npanel); th = np.arange(nth) * 2 * np.pi / nth
        r1, r2, t = np.meshgrid(R, R, th, indexing="ij")
        s.W = (W[:, None, None] * W[None, :, None] * np.ones(nth)[None, None, :] / nth).ravel()
        s.X = np.sqrt(r1).ravel().astype(complex); s.Y = (np.sqrt(r2) * np.exp(1j * t)).ravel()
    def E(s, F): return np.sum(s.W * F)
    def fields(s, c, u):
        """q and its four first derivatives for q = c0 H(X) + c1 X(|Y|^2-1) + c2 conj(X) Y^2/sqrt2 + c3 (|X|^2-1) Y
        + c4 H(Y) + c5 X^2 conj(Y)/sqrt2 (an orthonormal basis of H_{2,1}(C^2)), scaled to E|q|^2 = u exactly."""
        c = np.asarray(c, dtype=complex); c = c * math.sqrt(u / np.sum(abs(c) ** 2)); X, Y = s.X, s.Y
        aX = abs(X) ** 2; aY = abs(Y) ** 2; Xb = np.conj(X); Yb = np.conj(Y)
        q = c[0] * X * (aX - 2) / S2 + c[1] * X * (aY - 1) + c[2] * Xb * Y * Y / S2 + c[3] * (aX - 1) * Y + c[4] * Y * (aY - 2) / S2 + c[5] * X * X * Yb / S2
        dX = c[0] * (2 * aX - 2) / S2 + c[1] * (aY - 1) + c[3] * Xb * Y + c[5] * S2 * X * Yb
        dXb = c[0] * X * X / S2 + c[2] * Y * Y / S2 + c[3] * X * Y
        dY = c[1] * X * Yb + c[2] * S2 * Xb * Y + c[3] * (aX - 1) + c[4] * (2 * aY - 2) / S2
        dYb = c[1] * X * Y + c[4] * Y * Y / S2 + c[5] * X * X / S2
        return q, dX, dXb, dY, dYb
    def evaluate(s, P, c, u, lab):
        q, dX, dXb, dY, dYb = s.fields(c, u); V = abs(q) ** 2
        un = s.E(V).real; dl = s.E(V * V).real - 2 * u * u
        hv = P.h(lab, V); hp = P.hp(lab, V); psi = hv + V * hp; m = s.E(psi).real
        sA = math.sqrt(s.E((psi - m) ** 2).real); sB = math.sqrt(s.E((V * hp) ** 2).real)
        cv = np.array([s.E(np.conj(s.X) * q * hv), s.E(np.conj(s.Y) * q * hv)]); C2 = float(np.sum(abs(cv) ** 2))
        # Theorem 6 in vector form (numerical check): c_j = E[d_j q psi(V)] + E[q^2 conj(dbar_j q) h'(V)]
        rep = np.array([s.E(dX * psi) + s.E(q * q * np.conj(dXb) * hp), s.E(dY * psi) + s.E(q * q * np.conj(dYb) * hp)])
        J1 = np.array([[s.E(a * np.conj(b)) for b in (dX, dY)] for a in (dX, dY)])
        I2 = np.array([[s.E(np.conj(a) * b) for b in (dXb, dYb)] for a in (dXb, dYb)])
        l1 = float(np.linalg.eigvalsh(J1)[-1]); l2 = float(np.linalg.eigvalsh(I2)[-1])
        hs = lambda A: float(np.sum(abs(A) ** 2))
        D = Bbench(P, u) - s.E(P.phi(V)).real
        # the plain Bessel bound of the same law:  ||c||^2 <= min_m E[V (h(V)-m)^2]  (uses only Pi_1 q = 0)
        Bz = s.E(V * hv * hv).real - s.E(V * hv).real ** 2 / un
        return dict(u_num=un, chi=dl / u ** 2, dl=dl, C2=C2, D=D, sA=sA, sB=sB, l1=l1, l2=l2, Bz=Bz,
                    t6err=float(np.linalg.norm(rep - cv) / max(math.sqrt(C2), 1e-300)), t6abs=float(np.linalg.norm(rep - cv)),
                    hsJ=hs(J1), hsI=hs(I2), T9a=cap(u, dl, sA, sB, 0.75), T9b=cap(u, dl, sA, sB, 0.5),
                    T9infl=(math.sqrt(l1) * sA + math.sqrt(l2) * sB) ** 2)

FAMILIES = {"monomial H(X)": [1, 0, 0, 0, 0, 0], "X(|Y|^2-1)": [0, 1, 0, 0, 0, 0], "mixed": [1, 0.3j, 0.2, 0.1 - 0.2j, 0, 0.1],
            "H(X)+H(Y)": [1, 0, 0, 0, 1, 0], "X^2 conj(Y)": [0, 0, 0, 0, 0, 1],
            "best tensor of 6.4.2": [1, (0.05283531218 + 0.22122669064j) / S2, 0, 0, 0, 0]}

# ----------------------------------------------------------------------------------------------- main
def main():
    out = sys.argv[1]; pk_tab = sys.argv[2] if len(sys.argv) > 2 else None
    jsons = sys.argv[3:]
    P = Prof(os.path.join(out, "tab_reviewer.npz"))
    pr = print
    pr("== 1. profiles (reviewer's own quadrature) against the ledger constants")
    pr(f"   B0 = {P.B0v:.15f}  (ledger 387 sqrt(pi)/500 = {387*math.sqrt(math.pi)/500:.15f})")
    pr(f"   j0 = {P.j0:.15f}  (ledger 1.431973791291431..432)")
    pr(f"   g0 = {P.g0:.15f} (ledger -0.835135932614130..129)")
    r = optimize.minimize_scalar(lambda u: -(Bbench(P, u) - PP * u), bounds=(0.02, 0.06), method="bounded", options={"xatol": 1e-11})
    pr(f"   S  = {-r.fun:.13f} at u* = {r.x:.7f}  (ledger 3.14: 1.3739535256614 < S < 1.3739535256616, v0 = 0.0403448)")
    # consistency of the two tables on the overlap, and of spline derivatives with direct differences
    vv = np.linspace(0.93, 1.0, 50)
    ov = max(float(np.max(abs(P.f1[i](vv) - P.f2[i](np.sqrt(vv))))) for i in range(3))
    od = max(float(np.max(abs(P.d1[i](vv) - P.d2[i](np.sqrt(vv)) / (2 * np.sqrt(vv))))) for i in range(3))
    pr(f"   overlap of the v-table and the s-table on [0.93, 1]: values {ov:.1e}, derivatives {od:.1e}")
    for v in (0.0, 0.003, 0.05, 0.2, 2.0, 30.0):
        e = 1e-5 * max(v, 0.01); lo = max(v - e, 0.0); fd = [(pjg(v + e)[i] - pjg(lo)[i]) / (v + e - lo) for i in (1, 2)]
        mid = np.array([0.5 * (v + e + lo)])
        pr(f"   v={v:<6}: j'={float(P._ev(1, mid, 1)[0]):+.8f} (difference quotient {fd[0]:+.8f}); g'={float(P._ev(2, mid, 1)[0]):+.8f} ({fd[1]:+.8f}); "
           f"h_tilt'={float(P.hp('tilt', np.array([v]))[0]):+.6f}, h_raw'={float(P.hp('raw', np.array([v]))[0]):+.6f}")
    if pk_tab and os.path.exists(pk_tab):
        d = np.load(pk_tab); sv = d["s"]; m = sv <= 40
        mine = np.array([[P.phi(sv[m] ** 2), P.j(sv[m] ** 2), P.g(sv[m] ** 2)]])[0]
        pr(f"   against the package's replayed table tab_peak.npz ({m.sum()} nodes, s <= 40): max |diff| phi {np.max(abs(mine[0]-d['phi'][m])):.1e}, "
           f"j {np.max(abs(mine[1]-d['j'][m])):.1e}, g {np.max(abs(mine[2]-d['g'][m])):.1e}")
    pr("   hypergeometric angular averages against direct angular quadrature (20000-point midpoint rule):")
    ps = (np.arange(20000) + 0.5) * 2 * np.pi / 20000
    for (r_, Y_) in ((0.7, 0.4), (0.3, 0.9), (1.3, 1.25), (0.05, 2.0)):
        z = Y_ + r_ * np.exp(1j * ps)
        pr(f"      r={r_}, Y={Y_}: M {float(Mang(np.array([r_]), Y_)[0]):.10f} / {np.mean(abs(z)):.10f};  N {float(Nang(np.array([r_]), Y_)[0]):.10f} / {np.mean((z/abs(z)).real):.10f}")

    pr("\n== 2. the cap of Theorem 9: closed form against brute force (random data)")
    rng = np.random.default_rng(1); worst = 0.0
    for _ in range(300):
        u = rng.uniform(0.005, 0.05); dl = rng.uniform(0.2, 30) * u * u; sA, sB = rng.uniform(0, 0.1, 2)
        for kap in (0.75, 0.5):
            a_, b_ = cap(u, dl, sA, sB, kap), cap_grid(u, dl, sA, sB, kap); worst = max(worst, abs(a_ - b_) / max(b_, 1e-300))
            assert a_ >= b_ * (1 - 1e-9)
    pr(f"   300 random (u, delta, sA, sB), kappa = 3/4 and 1/2: max relative difference {worst:.1e} (closed form >= grid)")
    # concavity of (a, b) -> cap(u, delta, sqrt a, sqrt b) (REVIEW.md section 5): midpoint test on random pairs
    bad = 0; tot = 0; slack = 0.0
    for _ in range(4000):
        u = rng.uniform(0.005, 0.05); dl = rng.uniform(0.2, 30) * u * u; kap = (0.75, 0.5)[rng.integers(2)]
        x = rng.uniform(0, 0.01, 2) * rng.uniform(0, 1) ** 3; y = rng.uniform(0, 0.01, 2) * rng.uniform(0, 1) ** 3
        F = lambda z: cap(u, dl, math.sqrt(z[0]), math.sqrt(z[1]), kap)
        mid = F((x + y) / 2); avg = 0.5 * (F(x) + F(y)); tot += 1; slack = min(slack, (mid - avg) / max(avg, 1e-300))
        if mid < avg * (1 - 1e-10): bad += 1
        assert F(x + y) >= (F(x) + F(y)) * (1 - 1e-10)
    pr(f"   concavity of the cap in (sA^2, sB^2): {tot} random midpoint tests, {bad} violations (most negative relative slack {slack:.1e}); superadditivity holds on all")

    pr("\n== 3. Wick monomial q = sqrt(u) H(y): Theorem 9 against the truth and against 11.49  (chi = 42, cap = u (sqrt2 sA + sB)^2)")
    r_ = R1; w_ = W1
    for lab in ("tilt", "raw"):
        for u in (0.009, 0.02, 0.03, 0.0463):
            V = u * r_ * (r_ - 2) ** 2 / 2; sA, sB, Ephi = law_functionals(P, lab, V, w_)
            c = math.sqrt(u) * float(np.sum(w_ * r_ * (r_ - 2) / S2 * P.h(lab, V))); C2 = c * c
            # Theorem 6 on the monomial: c = E[d q psi(V)] + E[q^2 conj(dbar q) h'(V)], d q = sqrt(2u)(r-1), |q^2 conj(dbar q)| = (u^1.5/2^1.5) r^2 (r-2)^2
            hv = P.h(lab, V); hp = P.hp(lab, V)
            c6 = math.sqrt(2 * u) * float(np.sum(w_ * (r_ - 1) * (hv + V * hp))) + (u ** 1.5 / 2 ** 1.5) * float(np.sum(w_ * r_ ** 2 * (r_ - 2) ** 2 * hp))
            dl = 42 * u * u; D = Bbench(P, u) - Ephi; T9 = cap(u, dl, sA, sB, 0.75)
            assert abs(T9 - cap(u, dl, sA, sB, 0.5)) < 1e-15
            g = GAMMA[u]
            pr(f"   {lab:4s} u={u:<6}: sA={sA:.4f} sB={sB:.4f} | C2/D={C2/D:.4f} | T9/D={T9/D:.4f} | T9/delta={T9/dl:.4f} | T9/C2={T9/C2:.2f}"
               + (f" | gamma*delta/D={g*dl/D:.4f}, gamma/(T9/delta)={g*dl/T9:.2f}" if lab == "tilt" else "") + f" | Theorem 6 rel.err {abs(c6-c)/abs(c):.1e}")

    pr("\n== 4. Gaussian-law shadows (V = u tau): T9/delta, kappa = 3/4 (package) | kappa = 1/2 (reviewer), and the crossover with 11.49")
    chis = [1, 2, 4, 8, 12, 16, 24]
    for lab in ("tilt", "raw"):
        for u in (0.009, 0.02, 0.03, 0.0463):
            sA, sB, _ = law_functionals(P, lab, u * R1, W1)
            ra = "; ".join(f"{cap(u, c*u*u, sA, sB, 0.75)/(c*u*u):.4f}" for c in chis); rb = "; ".join(f"{cap(u, c*u*u, sA, sB, 0.5)/(c*u*u):.4f}" for c in chis)
            line = f"   {lab:4s} u={u:<6}: sA={sA:.4f} sB={sB:.4f} | chi={chis}: {ra} | {rb}"
            if lab == "tilt":
                g = GAMMA[u]
                xa = optimize.brentq(lambda c: cap(u, c * u * u, sA, sB, 0.75) - g * c * u * u, 0.05, 200)
                xb = optimize.brentq(lambda c: cap(u, c * u * u, sA, sB, 0.5) - g * c * u * u, 0.05, 200)
                line += f" | gamma={g:.4f}: T9 = gamma*delta at chi = {xa:.2f} | {xb:.2f}"
            pr(line)

    pr("\n== 5. two-variable cubics, reviewer's quadrature (panel order 7, 56 phases; in brackets: order 5, 40 phases)")
    G = Two(7, 56); G2 = Two(5, 40)
    def show(name, c, u, lab, claim=None):
        r = G.evaluate(P, c, u, lab); r2 = G2.evaluate(P, c, u, lab); g = GAMMA[u]
        s = (f"   {lab} u={u} {name}: chi={r['chi']:.4f} [{r2['chi']:.4f}] | C2/D={r['C2']/r['D']:.5f} [{r2['C2']/r2['D']:.5f}] | T9/D={r['T9a']/r['D']:.5f} [{r2['T9a']/r2['D']:.5f}]"
             f" | T9(kappa=1/2)/D={r['T9b']/r['D']:.5f} | T9 with the true influences /D={r['T9infl']/r['D']:.5f}")
        if lab == "tilt":
            s += f" | gamma*delta/D={g*r['dl']/r['D']:.5f} | min(T9,gamma*delta)/D={min(r['T9a'], g*r['dl'])/r['D']:.5f} (kappa=1/2: {min(r['T9b'], g*r['dl'])/r['D']:.5f})"
        s += f" | D/delta={r['D']/r['dl']:.4f} | l1/u={r['l1']/u:.3f} l2/u={r['l2']/u:.3f} (l1^2+l2^2)/delta={(r['l1']**2+r['l2']**2)/r['dl']:.4f} (|J1|^2+|I2|^2)/delta={(r['hsJ']+r['hsI'])/r['dl']:.4f} | Thm 6 abs.err/|c| {r['t6err']:.1e} | E|q|^2/u-1 = {r['u_num']/u-1:.1e}"
        if claim: s += f" | package: {claim}"
        pr(s); return r
    for u in (0.02, 0.0463):
        for lab in ("tilt", "raw"):
            for name, c in FAMILIES.items(): show(name, c, u, lab)
    for path in jsons:
        if not os.path.exists(path): continue
        pr(f"   -- records of {path}")
        for key, rec in json.load(open(path)).items():
            u = float(key.split("|")[0]); c = np.array(rec["coef_re"]) + 1j * np.array(rec["coef_im"])
            show(f"search record '{key}'", c, u, "tilt", claim=f"value {rec['value']:.5f}, chi {rec['chi']:.4f}, C2/D {rec['C2_over_D']:.5f}")

    pr("\n== 6. consumer form: sup norms of the tilt profile and law-free thresholds")
    vg = np.concatenate([np.linspace(0, 1, 20001), np.linspace(1, 60, 20001)[1:] ** 2])
    for lab in ("tilt", "raw"):
        hv = P.h(lab, vg); hp = P.hp(lab, vg); psi = hv + vg * hp; vh = vg * hp
        osc = float(psi.max() - psi.min()); sup = float(np.max(abs(vh)))
        pr(f"   {lab}: psi=(vh)' ranges over [{psi.min():.5f} (v={vg[psi.argmin()]:.3f}), {psi.max():.5f} (v={vg[psi.argmax()]:.3f})], osc = {osc:.5f}; sup|v h'| = {sup:.5f} at v = {vg[np.argmax(abs(vh))]:.4f}; h'(0) = {float(P.hp(lab, np.array([0.0]))[0]):.5f}")
        if lab == "tilt":
            for u in (0.009, 0.02, 0.03, 0.0463):
                b = (S2 * osc / 2 + sup) ** 2
                pr(f"      u={u}: T9 <= u (sqrt2 osc/2 + sup|vh'|)^2 = {u*b:.3e} for EVERY law; below gamma*delta as soon as chi >= {b/(GAMMA[u]*u):.1f}")
    return P

if __name__ == "__main__":
    main()

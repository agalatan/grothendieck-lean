#!/usr/bin/env python3
"""Generator of radius certificates (floating-point search; the result is checked exactly by
verify_cert.py, which shares no numerical code with this file).

Usage:  python3 -I make_cert.py KIND OUT.json [s-interval list "0:0.5,0.5:1,..."]
  KIND = G : only inputs that are Lean theorems of the repository (radial Stein identity of
             SteinInputs, the contraction-Gram scalars, the joint sixth-moment inequalities);
  KIND = N : in addition the two antiholomorphic Stein identities separately, c1, c2 >= 0,
             |a|^2 <= c1 c2 and the budgets of c2, c1 - c2, c1 (docstring of verify_cert.py).

A row is found by a second-order cone program in "certificate form": the multiplier functions
theta_j, xi are piecewise linear on the knots of the tests, so that the pointwise inequality (C2)
of verify_cert.py is a polynomial inequality in r on every knot interval.
"""
import os, sys, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))  # needed under python -I
from fractions import Fraction as Fr
from math import isqrt, sqrt
import numpy as np
import cvxpy as cp
from scipy.optimize import linprog
from outer import test_matrices
import verify_cert as VC

C6f = 4045313 / 100000
BJ = np.array(VC.BJ, float)
EAf = np.array(VC.EA, float)
S0f = np.array([float(x) for x in VC.S0])
H0f = np.array([float(x) for x in VC.H0])
THETAS = [Fr(1, 16), Fr(1, 12), Fr(1, 8), Fr(1, 6), Fr(1, 5), Fr(1, 4), Fr(3, 10), Fr(1, 3), Fr(2, 5), Fr(1, 2),
          Fr(3, 5), Fr(2, 3), Fr(3, 4), Fr(4, 5), Fr(9, 10), Fr(1), Fr(10, 9), Fr(5, 4), Fr(4, 3), Fr(3, 2),
          Fr(5, 3), Fr(2), Fr(5, 2), Fr(3), Fr(10, 3), Fr(4), Fr(5), Fr(6), Fr(8), Fr(12), Fr(16)]


def default_knots():
    ks = [Fr(i, 10) for i in range(0, 41)]              # 0 .. 4, step 1/10
    ks += [Fr(4) + Fr(i, 5) for i in range(1, 21)]      # .. 8, step 1/5
    ks += [Fr(8) + Fr(i, 2) for i in range(1, 13)]      # .. 14, step 1/2
    ks += [Fr(14 + i) for i in range(1, 17)]            # .. 30, step 1
    return ks


def knots_scheme(name):
    """rational r-knots: list of (upper end, step) segments."""
    if name == 'default':
        return default_knots()
    if name == 'far':            # default knots, continued far beyond 30 (the multipliers behave like D/v there)
        return default_knots() + [Fr(x) for x in (31, 32, 33, 34, 35, 36, 38, 40, 44, 50, 60, 80, 120, 200)]
    if name == 'far3':           # finer bulk and mid range, far continuation
        ks = [Fr(0)]
        for end, step in [(4, Fr(1, 20)), (8, Fr(1, 10)), (14, Fr(1, 4)), (30, Fr(1, 2))]:
            while ks[-1] < end:
                ks.append(ks[-1] + step)
        return ks + [Fr(x) for x in (31, 32, 33, 34, 35, 36, 38, 40, 44, 50, 60, 80, 120, 200)]
    if name == 'far4':           # default, far continuation with more knots between 30 and 60
        return default_knots() + [Fr(x, 2) for x in range(61, 81)] + [Fr(x) for x in (41, 42, 43, 44, 46, 48, 50, 55,
                                                                                    60, 70, 80, 100, 120, 160, 200)]
    if name.startswith('seg:'):  # generic: 'seg:end1/step1,end2/step2,...' continuing the default knots beyond 30
        ks = default_knots()
        for part in name[4:].split(','):
            end, step = part.split('/')
            end, step = Fr(end), Fr(step)
            while ks[-1] < end:
                ks.append(ks[-1] + step)
        return ks
    if name == 'far2':
        return default_knots() + [Fr(x) for x in (31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 42, 44, 46, 48, 50, 55, 60,
                                                  70, 80, 100, 120, 160, 200, 300, 500)]
    seg = {'fine': [(4, Fr(1, 20)), (8, Fr(1, 10)), (14, Fr(1, 4)), (30, Fr(1, 2))],
           'bulk': [(Fr(1, 2), Fr(1, 20)), (Fr(3, 2), Fr(1, 40)), (4, Fr(1, 20)), (8, Fr(1, 10)), (14, Fr(1, 4)),
                    (30, Fr(1, 2))],
           'tail': [(8, Fr(1, 10)), (14, Fr(1, 5)), (30, Fr(1, 2))],
           'tailfine': [(4, Fr(1, 10)), (8, Fr(1, 5)), (13, Fr(1, 2)), (21, Fr(1, 10)), (30, Fr(1, 2))],
           'tailfine2': [(4, Fr(1, 10)), (8, Fr(1, 5)), (12, Fr(1, 2)), (24, Fr(1, 20)), (30, Fr(1, 4))],
           'geo': None,
           'coarse': [(2, Fr(1, 5)), (8, Fr(2, 5)), (14, Fr(1)), (30, Fr(2))]}[name]
    if name == 'geo':            # the grid of the unrestricted runs (0.1 up to 6, then +6% per step), in thousandths
        ks = [Fr(i, 10) for i in range(0, 61)]
        h = Fr(1, 10)
        while ks[-1] < 30:
            h = h * Fr(106, 100)
            ks.append(Fr(int(round(float(ks[-1] + h) * 1000)), 1000))
        return ks
    ks = [Fr(0)]
    for end, step in seg:
        while ks[-1] < end:
            ks.append(ks[-1] + step)
    return ks


def check_points(ek, sub):
    pts = [0.0]
    for a_, b_ in zip(ek[:-1], ek[1:]):
        pts.extend(list(a_ + (b_ - a_) * (np.arange(sub) + 0.5) / sub))
        pts.append(b_)
    # beyond the last knot: far check points make the cone program ill-conditioned (huge cone variables
    # when sigma != 0), so they stop at r = 300; the exact verifier covers [e_K, oo) anyway
    fac = (1.01, 1.03, 1.07, 1.15, 1.3, 1.6, 2.2, 3.5, 6.0, 10.0)
    pts.extend([ek[-1] * f for f in fac if ek[-1] * f <= max(300.0, 1.3 * ek[-1])])
    return np.array(pts)


def param_dual(s, mu, sig, l3, joint):
    """eta*s >= max over the contraction scalars with 32n+8h+32b+96y = s of
    sum_j mu_j B_j + sigma (32b+48y) + sqrt(s) [l3a (300 g + 198 h0) + l3b (135 g + 11781/32 h0)], g^2 <= s0 h0."""
    d = BJ.T @ mu + EAf * sig
    eta = cp.Variable()
    nu = cp.Variable(2, nonneg=True)
    om = cp.Variable(5, nonneg=True)
    ze = cp.Variable(3)
    ch = cp.Variable(3)
    cons = [cp.SOC(ze[0] + ze[1], cp.hstack([ze[2], ze[0] - ze[1]])),
            cp.SOC(ch[0] + ch[1], cp.hstack([ch[2], ch[0] - ch[1]]))]
    if joint:
        sq = sqrt(s)
        dg = sq * (300 * l3[1] + 135 * l3[2])
        d = d + sq * (198 * l3[1] + (11781.0 / 32) * l3[2]) * H0f
        ps = cp.Variable(3)
        kap = cp.Variable(nonneg=True)
        cons += [cp.SOC(ps[0] + ps[1], cp.hstack([ps[2], ps[0] - ps[1]])), dg + ps[2] == 0]
        d = d + ps[0] * S0f + (ps[1] + kap) * H0f
    cons += [d[0] - 32 * eta + nu[0] + om[0] + ze[0] + ch[1] == 0,
             d[1] - 8 * eta + om[1] + ze[1] + ch[0] == 0,
             d[2] - 32 * eta - nu[0] + om[2] + ch[1] == 0,
             d[3] - 96 * eta - nu[1] + om[3] + 3 * ch[1] + 3 * ch[2] == 0,
             d[4] + nu[1] + om[4] + ze[2] - ch[1] - ch[2] == 0]
    return eta * s, cons


def cert_socp(kind, s_lo, s_hi, ek, rr, joint=True, mu_floor=2e-6, linear=True):
    uk = ek ** 2
    v = rr ** 2
    N = len(v)
    Fm, Gm, Ym = test_matrices(uk, v)
    n = len(uk)
    f1, f2 = cp.Variable(n), cp.Variable(n)
    x2, x1, xa = cp.Variable(n, nonneg=True), cp.Variable(n, nonneg=True), cp.Variable(n)
    t2, t4 = cp.Variable(n), cp.Variable(n)
    lam = cp.Variable(3)
    l3 = cp.Variable(3, nonneg=True)
    mu = cp.Variable(5, nonneg=True)
    sig = cp.Variable()
    sl_ = cp.Variable(2)                 # slopes of the linear parts of the tests (the test g = v)
    cons = []
    if kind == 'G':
        cons += [x2 == 0, x1 == 0, xa == 0, t2 == 0, t4 == 0, f2 == 2 * f1, mu[0] == 0, mu[1] == 0, mu[3] == 0,
                 sl_[1] == 2 * sl_[0]]
    else:
        cons += [cp.SOC(x2 + x1, cp.vstack([xa, x2 - x1]), axis=0), mu >= mu_floor]
    if not joint:
        cons += [l3[1] == 0, l3[2] == 0]
    if not linear:
        cons += [sl_ == 0]
    phi1, G1, Y1 = Fm.T @ f1 + sl_[0] * v, Gm.T @ f1 + sl_[0] * (v ** 2 / 2), Ym.T @ f1 + sl_[0] * (v / 2)
    phi2, G2, Y2 = Fm.T @ f2 + sl_[1] * v, Gm.T @ f2 + sl_[1] * (v ** 2 / 2), Ym.T @ f2 + sl_[1] * (v / 2)
    th2, th4 = Fm.T @ t2, Fm.T @ t4
    xi1, xi2, xia = Fm.T @ x1, Fm.T @ x2, Fm.T @ xa
    th3 = xi1 + 0.5 * phi2 - th2 - th4
    th1 = xi2 + phi1 + th2 - th3
    th5 = xia + Y1 + 0.5 * Y2 - sig * v
    ths = [th1, th2, th3, th4, th5]
    tau = cp.Variable((5, N), nonneg=True)
    for j in range(5):
        cons.append(cp.SOC(mu[j] + tau[j], cp.vstack([ths[j], mu[j] - tau[j]]), axis=0))   # th^2 <= 4 mu tau
    slack = (lam[0] + lam[1] * v + lam[2] * v ** 2 + cp.sum(l3) * v ** 3 + G1 + G2
             - th1 - th2 - 3 * th3 - 2 * th4 - cp.sum(tau, axis=0) - rr)
    sc = 1.0 / (1.0 + 0.02 * v ** 2 + 7e-5 * v ** 3)
    cons.append(cp.multiply(sc, slack) >= 0)
    t = cp.Variable()
    for s in (s_lo, s_hi):
        base = lam[0] + lam[1] + lam[2] * (2 + s) + l3[0] * (6 + 9 * s + C6f * s ** 1.5) + (l3[1] + l3[2]) * (6 + 9 * s)
        if s > 0:
            pd, pc = param_dual(s, mu, sig, l3, joint)
            cons += pc
            base = base + pd
        cons.append(t >= base)
    prob = cp.Problem(cp.Minimize(t), cons)
    var = dict(f1=f1, f2=f2, x2=x2, x1=x1, xa=xa, t2=t2, t4=t4, lam=lam, l3=l3, mu=mu, sig=sig, slope=sl_)
    return prob, var


def slack_float(sol, ek, r):
    v = r * r
    Fm, Gm, Ym = test_matrices(ek ** 2, v)
    ev = lambda a: Fm.T @ a
    a1, a2 = sol.get('slope', (0.0, 0.0))
    phi1, G1, Y1 = ev(sol['f1']) + a1 * v, Gm.T @ sol['f1'] + a1 * v ** 2 / 2, Ym.T @ sol['f1'] + a1 * v / 2
    phi2, G2, Y2 = ev(sol['f2']) + a2 * v, Gm.T @ sol['f2'] + a2 * v ** 2 / 2, Ym.T @ sol['f2'] + a2 * v / 2
    th2, th4, xi1, xi2, xia = ev(sol['t2']), ev(sol['t4']), ev(sol['x1']), ev(sol['x2']), ev(sol['xa'])
    th3 = xi1 + 0.5 * phi2 - th2 - th4
    th1 = xi2 + phi1 + th2 - th3
    th5 = xia + Y1 + 0.5 * Y2 - sol['sig'] * v
    mu = sol['mu']
    T = th5 ** 2 / (4 * mu[4])
    for j, th in enumerate([th1, th2, th3, th4]):
        if mu[j] > 0:
            T = T + th ** 2 / (4 * mu[j])
    lam = sol['lam']
    return lam[0] + lam[1] * v + lam[2] * v ** 2 + sum(sol['l3']) * v ** 3 + G1 + G2 - th1 - th2 - 3 * th3 - 2 * th4 - T - r


def dense(ek, per=40):
    pts = [0.0]
    for a_, b_ in zip(ek[:-1], ek[1:]):
        pts.extend(list(a_ + (b_ - a_) * (np.arange(per) + 0.5) / per))
        pts.append(b_)
    pts.extend(list(np.geomspace(ek[-1] * 1.0005, max(2000.0, 20 * ek[-1]), 400)))
    return np.array(pts)


def rat(x, bits):
    return Fr(int(round(float(x) * 2 ** bits)), 2 ** bits)


def sqrt_ub(s):
    """rational upper bound of sqrt(s), s a Fraction."""
    q = 10 ** 12
    return Fr(isqrt(s.numerator * q * q // s.denominator) + 1, q)


def all_cuts(extra_thetas=()):
    cuts = [(t, None) for t in ('n', 'h', 'b', 'y', 'z', 'bn', 'yz', 'h0', 'm')]
    ths = sorted(set(THETAS) | set(extra_thetas))
    cuts += [('c1', th) for th in ths]
    cuts += [('c2+', th) for th in ths] + [('c2-', th) for th in ths]
    return cuts


def par_lp(cvec, cuts):
    """float LP  max c.p  s.t. EROW.p = 1, cuts >= 0; returns value, p, eta, multipliers."""
    A = np.array([[float(x) for x in VC.cut_vector(t, th)] for t, th in cuts])
    res = linprog(-np.array(cvec, float), A_ub=-A, b_ub=np.zeros(len(cuts)), A_eq=np.array([VC.EROW], float),
                  b_eq=[1.0], bounds=[(None, None)] * 5, method='highs')
    if res.status != 0:
        raise RuntimeError('parameter LP: ' + res.message)
    eta = -float(res.eqlin.marginals[0])
    y = -np.array(res.ineqlin.marginals)
    return -res.fun, res.x, eta, y


def dvecs(mu, sig, l3, al):
    dlin = [sum(mu[j] * VC.BJ[j][i] for j in range(5)) + sig * VC.EA[i] for i in range(5)]
    dJ = [l3[1] * (150 * al[0] * VC.S0[i] + (198 + 150 / al[0]) * VC.H0[i])
          + l3[2] * (Fr(135, 2) * al[1] * VC.S0[i] + (Fr(11781, 32) + Fr(135, 2) / al[1]) * VC.H0[i]) for i in range(5)]
    return dlin, dJ


def par_part(mu, sig, l3, s_ends):
    """per endpoint: choose alpha (golden section on the float LP), then exact-ready multipliers."""
    cuts = all_cuts()
    par = {}
    for name, s_e in zip(('lo', 'hi'), s_ends):
        if s_e == 0:
            continue
        sb = sqrt_ub(s_e)

        def lpval(al, cuts_=cuts):
            dlin, dJ = dvecs(mu, sig, l3, al)
            c = [float(dlin[i] + sb * dJ[i]) for i in range(5)]
            return par_lp(c, cuts_), c

        al = [Fr(1, 4), Fr(1, 4)]
        for sweep in range(2):
            for idx in (0, 1):
                if l3[idx + 1] == 0:
                    continue
                lo, hi = -5.0, 3.0                          # log alpha
                gr = (sqrt(5) - 1) / 2

                def f(x):
                    a2 = list(al)
                    a2[idx] = Fr(float(np.exp(x))).limit_denominator(10 ** 6)
                    return lpval(a2)[0][0]
                c_, d_ = hi - gr * (hi - lo), lo + gr * (hi - lo)
                fc, fd = f(c_), f(d_)
                for _ in range(36):
                    if fc < fd:
                        hi, d_, fd = d_, c_, fc
                        c_ = hi - gr * (hi - lo)
                        fc = f(c_)
                    else:
                        lo, c_, fc = c_, d_, fd
                        d_ = lo + gr * (hi - lo)
                        fd = f(d_)
                al[idx] = Fr(float(np.exp(0.5 * (lo + hi)))).limit_denominator(10 ** 4)
        (val, p, eta, y), c = lpval(al)
        # refine the tangent cuts at the optimum
        extra = []
        if p[0] > 1e-9 and p[1] > 1e-9:
            extra.append(Fr(sqrt(p[1] / p[0])).limit_denominator(2000))
        m_ = p[0] + p[2] + 3 * p[3] - p[4]
        if p[1] > 1e-9 and m_ > 1e-9:
            extra.append(Fr(sqrt(m_ / p[1])).limit_denominator(2000))
        cuts2 = all_cuts(extra)
        (val, p, eta, y), c = lpval(al, cuts2)
        keep = [(cuts2[i][0], None if cuts2[i][1] is None else str(cuts2[i][1]), str(rat(y[i], 60)))
                for i in range(len(cuts2)) if y[i] > 1e-13]
        par[name] = dict(alpha=[str(x) for x in al], eta=str(rat(eta, 60)), cuts=keep, sqrt_ub=str(sb),
                         lp_value=val, p=[float(x) for x in p])
    return par


def make_row(kind, s_lo, s_hi, knots, sub=8, rounds=4, joint=True, log=sys.stderr, linear=True):
    ek = np.array([float(x) for x in knots])
    rr = check_points(ek, sub)
    rd = dense(ek)
    sol = None
    val = None
    for it in range(rounds):
        prob, var = cert_socp(kind, float(s_lo), float(s_hi), ek, rr, joint=joint, linear=linear)
        prob.solve(solver=cp.CLARABEL)
        if var['lam'].value is None:
            raise RuntimeError('SOCP failed: ' + str(prob.status))
        sol = {k: np.array(x.value, float) for k, x in var.items()}
        sol['sig'] = float(sol['sig'])
        sol['mu'] = np.maximum(sol['mu'], 0.0)
        sol['l3'] = np.maximum(sol['l3'], 0.0)
        sl = slack_float(sol, ek, rd)
        val = float(prob.value)
        print('   [%s %s:%s] round %d: value %.6f (%s), n=%d, dense min slack %.2e at r=%.3f' % (
            kind, s_lo, s_hi, it, val, prob.status, len(rr), sl.min(), rd[sl.argmin()]), file=log, flush=True)
        if sl.min() > -2e-6:
            break
        edges = np.concatenate([ek, [np.inf]])
        idx = np.searchsorted(edges, rd, side='right') - 1
        new = []
        for k in np.unique(idx):
            m = np.where(idx == k)[0]
            j = m[np.argmin(sl[m])]
            if sl[j] < -5e-7:
                new.extend([rd[j]] + ([rd[j - 1]] if j > 0 else []) + ([rd[j + 1]] if j + 1 < len(rd) else []))
        rr2 = np.unique(np.concatenate([rr, np.array(new)]))
        if len(rr2) == len(rr):
            break
        rr = rr2
    # ---------------- exact data
    nb = 36
    R = {}
    for k in ('f1', 'f2', 'x2', 'x1', 'xa', 't2', 't4'):
        R[k] = [rat(x, nb) for x in sol[k]]
    mu = [rat(x, 50) for x in sol['mu']]
    l3 = [rat(x, 62) if x > 1e-12 else Fr(0) for x in sol['l3']]
    if kind == 'G':
        z = [Fr(0)] * len(knots)
        R.update(x2=z, x1=z, xa=z, t2=z, t4=z, f2=[2 * x for x in R['f1']])
        mu[0] = mu[1] = mu[3] = Fr(0)
    else:
        step = Fr(1, 2 ** 30)
        for k in range(len(knots)):
            R['x1'][k] = max(R['x1'][k], Fr(0))
            R['x2'][k] = max(R['x2'][k], Fr(0))
            while R['xa'][k] ** 2 > 4 * R['x1'][k] * R['x2'][k]:
                R['x1'][k] += step
                R['x2'][k] += step
    sig = rat(sol['sig'], 46)
    slope = [rat(sol['slope'][0], 50), rat(sol['slope'][1], 50)]
    if kind == 'G':
        slope[1] = 2 * slope[0]
    lam = [rat(sol['lam'][0], 40), rat(sol['lam'][1], 40), rat(sol['lam'][2], 46)]
    par = par_part(mu, sig, l3, (s_lo, s_hi))
    row = dict(kind=kind, s_lo=str(s_lo), s_hi=str(s_hi), knots=[str(x) for x in knots],
               phi1=[str(x) for x in R['f1']], phi2=[str(x) for x in R['f2']],
               xi2=[str(x) for x in R['x2']], xi1=[str(x) for x in R['x1']], xia=[str(x) for x in R['xa']],
               th2=[str(x) for x in R['t2']], th4=[str(x) for x in R['t4']],
               lam=[str(x) for x in lam], l3=[str(x) for x in l3], mu=[str(x) for x in mu], sigma=str(sig),
               slope=[str(x) for x in slope],
               par=par)
    # ---------------- polish: with the rounded shape fixed, an LP in (lam0, lam1, lam2, l3s) on a dense grid
    solr = dict(f1=np.array([float(x) for x in R['f1']]), f2=np.array([float(x) for x in R['f2']]),
                x2=np.array([float(x) for x in R['x2']]), x1=np.array([float(x) for x in R['x1']]),
                xa=np.array([float(x) for x in R['xa']]), t2=np.array([float(x) for x in R['t2']]),
                t4=np.array([float(x) for x in R['t4']]), mu=[float(x) for x in mu], l3=[0.0, float(l3[1]), float(l3[2])],
                sig=float(sig), lam=[0.0, 0.0, 0.0], slope=(float(slope[0]), float(slope[1])))
    rp = dense(ek, per=80)
    vp = rp * rp
    base = slack_float(solr, ek, rp)                 # everything except lam0, lam1, lam2, l3s
    scp = 1.0 / (1.0 + 0.02 * vp ** 2 + 7e-5 * vp ** 3)
    # variables: lam0, lam1, lam2*1e2, l3s*1e4, t
    A = -np.column_stack([np.ones_like(vp), vp, vp ** 2 * 1e-2, vp ** 3 * 1e-4, np.zeros_like(vp)]) * scp[:, None]
    bvec = (base - 5e-6) * scp
    rows_t, rhs_t = [], []
    for name, s_e in (('lo', s_lo), ('hi', s_hi)):
        sf = float(s_e)
        const = float((l3[1] + l3[2]) * (6 + 9 * s_e)) + (sf * par[name]['lp_value'] if s_e > 0 else 0.0)
        rows_t.append([1.0, 1.0, (2 + sf) * 1e-2, (6 + 9 * sf + C6f * sf ** 1.5) * 1e-4, -1.0])
        rhs_t.append(-const)
    resp = linprog([0, 0, 0, 0, 1.0], A_ub=np.vstack([A, np.array(rows_t)]), b_ub=np.concatenate([bvec, rhs_t]),
                   bounds=[(None, None), (None, None), (None, None), (0, None), (None, None)], method='highs')
    if resp.status != 0:
        raise RuntimeError('polish LP: ' + resp.message)
    lam = [rat(resp.x[0], 40), rat(resp.x[1], 40), rat(resp.x[2] * 1e-2, 46)]
    l3[0] = rat(resp.x[3] * 1e-4, 62)
    row['l3'] = [str(x) for x in l3]
    shift = 0.0
    margin = 2e-6
    res = None
    for attempt in range(14):
        lam0 = rat(float(lam[0]) + margin, 40)
        row['lam'] = [str(lam0), str(lam[1]), str(lam[2])]
        res = VC.verify_row(row, quiet=True)
        if res['ok']:
            break
        margin *= 2
    shift = float(resp.x[4])
    print('   [%s %s:%s] socp %.6f, polished LP value %.6f, margin %.1e, exact row bound %.7f, pass=%s' % (
        kind, s_lo, s_hi, val, shift, margin, float(res['bound']), res['ok']), file=log, flush=True)
    row['_info'] = dict(socp_value=val, shift=shift, margin=margin, bound=float(res['bound']), ok=res['ok'])
    return row


DEFAULT_INTERVALS = ['0', '1/2', '1', '3/2', '2', '5/2', '3', '7/2', '4', '9/2', '5', '11/2', '6', '13/2', '7', '8',
                     '9', '10', '12', '15', '20', '30', '42']

if __name__ == '__main__':
    kind = sys.argv[1]
    out = sys.argv[2]
    if len(sys.argv) > 3:
        ivs = [tuple(Fr(x) for x in part.split(':')) for part in sys.argv[3].split(',')]
    else:
        pts = [Fr(x) for x in DEFAULT_INTERVALS]
        ivs = list(zip(pts[:-1], pts[1:]))
    knots = knots_scheme(sys.argv[4] if len(sys.argv) > 4 else 'default')
    linear = not (len(sys.argv) > 5 and sys.argv[5] == 'nolinear')
    rows = []
    t0 = time.time()
    for s_lo, s_hi in ivs:
        rows.append(make_row(kind, s_lo, s_hi, knots, linear=linear))
        json.dump(dict(kind=kind, rows=rows), open(out, 'w'))
    worst = max(r['_info']['bound'] for r in rows)
    print('rows %d, all pass %s, max bound %.7f, %.0f s' % (len(rows), all(r['_info']['ok'] for r in rows), worst,
                                                           time.time() - t0))

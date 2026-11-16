#!/usr/bin/env python3
"""Reviewer's validation of the whole chain on genuine cubics.

Usage: python3 -I validate_cubics.py CERT_G.json CERT_N.json [n_samples]

Exact part (label C).  For each test cubic the scalars p = (n,h,b,y,z)/s are rational (own_wick, the Lean index
patterns).  P1 does not depend on s, so for EVERY row and endpoint of both certificates the dual bound must hold at p:
        (d_lin + sb d_J(alpha_e)) . p <= L_e ,
and the scalar-level bound of the row containing s(q) must dominate: with kappa6 = E V^3 - 6 - 9s exact,
        E|q| <= lam0 + lam1 + lam2 (2+s) + lam3 (6 + 9s + kappa6) + d_lin . pi  <= max(B(s_lo), B(s_hi)).

Monte Carlo part (label N; complex Gaussian samples, float64).  At every sample, for the row of each certificate
containing s(q):
   (a) r <= R2(r^2)                 the inequality (C2) itself (R2 = its right side)
   (b) R2(V) <= RHS(y)              Young + cone with the genuine (c1, c2, rho) of the cubic
   (c) xi . (c2, c1, rho) >= 0
and the sample means: the two brackets of (I), (II) (mean zero), E|q|, E RHS, and the second moments used in (F3).
The heavy tails of V^2, V^3 make the Monte Carlo means of E V^2 and E RHS imprecise (their error bars are
underestimated); the Monte Carlo part is a test of the pointwise steps, not of the means.

Quadrature part (label N, accurate to about 1e-9).  For the Wick monomial everything is a function of e = |y|^2 ~ Exp(1):
r = sqrt(e)|e-2|/sqrt 2, V = e(e-2)^2/2, c1 = 2(e-1)^2, c2 = e^2/2, rho = e(e-1), rho^2 = |a|^2.  Composite Gauss-Legendre
with break points at the preimages of the knots gives the means of the two brackets (zero by (I), (II), for the
actual spline tests of the row), and E RHS, which must EQUAL the exact scalar-level bound of the row.
"""
import json
import os
import sys
import time
from fractions import Fraction as Fr
from math import sqrt, pi
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
import own_wick as W
import own_verifier as OV

C6 = Fr(4045313, 100000)


# ----------------------------------------------------------------------------- test cubics
def sym_tensor(d, entries):
    t = [[[(0, 0)] * d for _ in range(d)] for _ in range(d)]
    for (a, b, c), v in entries.items():
        t[a][b][c] = v
        t[b][a][c] = v
    return t


class TensorCubic:
    """q = sum t_abc :y_a y_b conj(y_c): / sqrt(u), exact scalars and a vectorised float evaluator."""

    def __init__(self, name, d, t, kappa6=None):
        self.name, self.d = name, d
        R = range(d)
        self.u = 2 * W.tensor_norm_sq(t, R)
        sc = W.lean_contractions(W.to_fr_tensor(t, d), R)
        self.pi = tuple(x / Fr(self.u ** 2) for x in sc)
        self.tf = np.array([[[complex(*t[a][b][c]) for c in R] for b in R] for a in R]) / sqrt(self.u)
        self.kappa6 = kappa6
        if kappa6 is None and d <= 3:
            q = W.wick_cubic(t, d)
            qb, V, c1, c2, a = W.stein_objects(q, d)
            V2 = W.p_mul(V, V)
            EV3 = Fr(W.p_E(W.p_mul(V2, V), d)[0], self.u ** 3)
            self.kappa6 = EV3 - 6 - 9 * self.s

    @property
    def s(self):
        n, h, b, y, z = self.pi
        return 32 * n + 8 * h + 32 * b + 96 * y

    def sample(self, y):
        t = self.tf
        yb = y.conj()
        eye = np.eye(self.d)
        q = (np.einsum('abc,na,nb,nc->n', t, y, y, yb) - np.einsum('aba,nb->n', t, y) - np.einsum('abb,na->n', t, y))
        dbar = np.einsum('abc,na,nb->nc', t, y, y)                       # dbar_c q
        M = np.einsum('nb,nc->nbc', y, yb) - eye[None, :, :]            # :y_b conj(y_c):
        dd = 2 * np.einsum('abc,nbc->na', t, M)                          # d_a q   (t symmetric in a, b)
        return q, dd, dbar


class MonomialSum:
    """q = (2K)^{-1/2} sum_k y_k (|y_k|^2 - 2): K independent Wick monomials."""

    def __init__(self, K):
        self.name, self.d, self.K = 'sum of %d independent monomials' % K, K, K
        x = Fr(1, 4 * K)
        self.pi = (x, x, x, x, x)                      # block-diagonal tensor: every scalar is additive
        self.kappa6 = Fr(10968, K * K)                 # cumulants add: kappa6 of one monomial = 11352 - 6 - 9*42

    @property
    def s(self):
        n, h, b, y, z = self.pi
        return 32 * n + 8 * h + 32 * b + 96 * y

    def sample(self, y):
        c = 1 / sqrt(2 * self.K)
        e = (y * y.conj()).real
        q = c * np.sum(y * (e - 2), axis=1)
        dd = c * (2 * e - 2) + 0j
        dbar = c * y * y
        return q, dd, dbar


def cubics():
    out = [TensorCubic('Wick monomial y(|y|^2-2)', 1, sym_tensor(1, {(0, 0, 0): (1, 0)})),
           TensorCubic('X^2 conj(Y)', 2, sym_tensor(2, {(0, 0, 1): (1, 0)})),
           TensorCubic('X(|Y|^2-1)', 2, sym_tensor(2, {(0, 1, 1): (1, 0)})),
           TensorCubic('H(X)+i X^2conj(Y)+(2-i) 2X(|Y|^2-1)', 2,
                       sym_tensor(2, {(0, 0, 0): (1, 0), (0, 0, 1): (0, 1), (0, 1, 1): (2, -1)})),
           TensorCubic('d=3: H(y1)+2y1(|y2|^2-1)+2y1(|y3|^2-1)', 3,
                       sym_tensor(3, {(0, 0, 0): (1, 0), (0, 1, 1): (1, 0), (0, 2, 2): (1, 0)})),
           MonomialSum(2), MonomialSum(8), MonomialSum(30)]
    # the one-variable check of the block formula for sums of monomials
    one = out[0]
    assert one.pi == (Fr(1, 4),) * 5 and one.kappa6 == 10968 and out[5].pi == TensorCubic(
        'H(X)+H(Y)', 2, sym_tensor(2, {(0, 0, 0): (1, 0), (1, 1, 1): (1, 0)})).pi
    assert TensorCubic('H(X)+H(Y)', 2, sym_tensor(2, {(0, 0, 0): (1, 0), (1, 1, 1): (1, 0)})).kappa6 == out[5].kappa6
    return out


# ----------------------------------------------------------------------------- exact part
def row_exact(row):
    """the exact linear data of a row: d_lin, and per endpoint (objective, L_e, B_e)."""
    F = lambda x: Fr(x)
    lam = [F(x) for x in row['lam']]
    l3 = [F(x) for x in row['l3']]
    mu = [F(x) for x in row['mu']]
    sigma = F(row['sigma'])
    lam3 = sum(l3)
    d_lin = OV.ZERO
    for j in range(5):
        d_lin = d_lin + mu[j] * OV.BUDGETS[j]
    d_lin = d_lin + sigma * OV.E_VRHO
    ends = {}
    for end in ('lo', 'hi'):
        s_e = F(row['s_' + end])
        if s_e == 0:
            ends[end] = (None, None, lam[0] + lam[1] + 2 * lam[2] + 6 * lam3)
            continue
        pd = row['par'][end]
        al_a, al_b = (F(x) for x in pd['alpha'])
        sb = F(pd['sqrt_ub'])
        d_J = (l3[1] * (150 * al_a * OV.S0 + (198 + 150 / al_a) * OV.H0)
               + l3[2] * (Fr(135, 2) * al_b * OV.S0 + (Fr(11781, 32) + Fr(135, 2) / al_b) * OV.H0))
        obj = d_lin + sb * d_J
        eta = F(pd['eta'])
        resid = obj - eta * OV.S_FORM
        for kind, theta, yv in pd['cuts']:
            resid = resid + F(yv) * OV.cut_form(kind, None if theta is None else F(theta))
        L = eta + sum(max(r, 0) * pu for r, pu in zip(resid.v, OV.P_UPPER))
        B = (lam[0] + lam[1] + lam[2] * (2 + s_e) + l3[0] * (6 + 9 * s_e + C6 * s_e * sb)
             + (l3[1] + l3[2]) * (6 + 9 * s_e) + s_e * L)
        ends[end] = (obj, L, B)
    return dict(lam=lam, lam3=lam3, d_lin=d_lin, ends=ends)


def dot(lin, p):
    return sum(a * b for a, b in zip(lin.v, p))


def exact_part(certs, cubs):
    print('== exact part (C): the dual bounds of every row at the scalars of genuine cubics')
    viol = 0
    count = 0
    slack_min = None
    for tag, cert in certs.items():
        for i, row in enumerate(cert['rows']):
            rx = row_exact(row)
            for end in ('lo', 'hi'):
                obj, L, B = rx['ends'][end]
                if obj is None:
                    continue
                for c in cubs:
                    p = tuple(x / c.s for x in c.pi)
                    val = dot(obj, p)
                    count += 1
                    if val > L:
                        viol += 1
                        print('   VIOLATION %s row %d %s  %s: %.6g > %.6g' % (tag, i, end, c.name, float(val), float(L)))
                    sl = float(L - val)
                    slack_min = sl if slack_min is None else min(slack_min, sl)
    print('   %d (row, endpoint, cubic) triples, %d violations, smallest slack L_e - obj.p = %.3e' % (count, viol, slack_min))
    return viol


# ----------------------------------------------------------------------------- Monte Carlo part
class RowF:
    """float evaluator of the functions of a row."""

    def __init__(self, row):
        f = lambda x: float(Fr(x))
        self.e = np.array([f(x) for x in row['knots']])
        self.u = self.e ** 2
        self.K = len(self.e) - 1
        for nm in ('phi1', 'phi2', 'xi2', 'xi1', 'xia', 'th2', 'th4'):
            setattr(self, nm, np.array([f(x) for x in row[nm]]))
        self.lam = [f(x) for x in row['lam']]
        self.l3 = [f(x) for x in row['l3']]
        self.lam3 = sum(self.l3)
        self.mu = [f(x) for x in row['mu']]
        self.sigma = f(row['sigma'])
        self.slope = [f(x) for x in row.get('slope', ['0', '0'])]
        du = np.diff(self.u)
        self.Gk = [np.concatenate([[0.0], np.cumsum((p[:-1] + p[1:]) / 2 * du)]) for p in (self.phi1, self.phi2)]

    def pl(self, vals, v):
        return np.interp(v, self.u, vals)

    def test(self, i, v):
        """phi_i, G_i, Y_i at v."""
        vals = (self.phi1, self.phi2)[i]
        sp = self.pl(vals, v)
        k = np.clip(np.searchsorted(self.u, v, side='right') - 1, 0, self.K)
        G = self.Gk[i][k] + (vals[k] + sp) / 2 * (v - self.u[k])        # trapezoid on [u_k, v] (constant on the tail)
        phi = sp + self.slope[i] * v
        G = G + self.slope[i] * v * v / 2
        return phi, G, phi - G / v

    def evaluate(self, r, V, c1, c2, rho):
        lam0, lam1, lam2 = self.lam
        mu = self.mu
        p1, G1, Y1 = self.test(0, V)
        p2, G2, Y2 = self.test(1, V)
        x2, x1, xa = self.pl(self.xi2, V), self.pl(self.xi1, V), self.pl(self.xia, V)
        t2, t4 = self.pl(self.th2, V), self.pl(self.th4, V)
        t3 = x1 + p2 / 2 - t2 - t4
        t1 = x2 + p1 + t2 - t3
        t5 = xa + Y1 + Y2 / 2 - self.sigma * V
        poly = lam0 + lam1 * V + lam2 * V ** 2 + self.lam3 * V ** 3
        R2 = poly + G1 + G2 - t1 - t2 - 3 * t3 - 2 * t4 - t5 ** 2 / (4 * mu[4])
        for j, tj in enumerate((t1, t2, t3, t4)):
            if mu[j] > 0:
                R2 = R2 - tj ** 2 / (4 * mu[j])
        br1 = G1 - c2 * p1 - rho * Y1
        br2 = G2 - c1 * p2 / 2 - rho * Y2 / 2
        quad = (mu[0] * (c2 - 1) ** 2 + mu[1] * (c1 - c2 - 1) ** 2 + mu[2] * (c1 + c2 - 3) ** 2 + mu[3] * (c1 - 2) ** 2
                + mu[4] * rho ** 2)
        RHS = poly + br1 + br2 + self.sigma * V * rho + quad
        cone = x2 * c2 + x1 * c1 + xa * rho
        return R2, RHS, br1, br2, cone


def find_row(cert, s):
    for i, row in enumerate(cert['rows']):
        if Fr(row['s_lo']) <= s <= Fr(row['s_hi']):
            return i, row
    raise ValueError('s not covered')


def monomial_first_moment():
    """E|y(|y|^2-2)|/sqrt 2 = (1/sqrt 2) (-sqrt(pi)/4 + 2 int_0^2 sqrt(x)(2-x)e^{-x} dx),  x = t^2."""
    x, w = np.polynomial.legendre.leggauss(60)
    t = (x + 1) / 2 * sqrt(2)
    integ = np.sum(w * 2 * t * t * (2 - t * t) * np.exp(-t * t)) * sqrt(2) / 2
    return (-sqrt(pi) / 4 + 2 * integ) / sqrt(2)


def mc_part(certs, cubs, nsamp, rng):
    print('== Monte Carlo part (N): %d samples per cubic; means are given with 3 standard errors' % nsamp)
    bad = 0
    for c in cubs:
        s = c.s
        n, h, b, y, z = (float(x) for x in c.pi)
        chunks = max(1, nsamp // 100000)
        acc = []
        rowsF = {tag: (find_row(cert, s)[0], RowF(find_row(cert, s)[1]), row_exact(find_row(cert, s)[1]))
                 for tag, cert in certs.items()}
        mins = {tag: dict(a=np.inf, b=np.inf, cone=np.inf) for tag in certs}
        sums = {}

        def add(name, x):
            st = sums.setdefault(name, [0.0, 0.0, 0])
            st[0] += float(np.sum(x)); st[1] += float(np.sum(x * x)); st[2] += x.size

        for _ in range(chunks):
            m = nsamp // chunks
            yv = (rng.standard_normal((m, c.d)) + 1j * rng.standard_normal((m, c.d))) / sqrt(2)
            q, dd, dbar = c.sample(yv)
            V = (q * q.conj()).real
            r = np.sqrt(V)
            c1 = np.sum((dd * dd.conj()).real, axis=1) if dd.ndim == 2 else (dd * dd.conj()).real
            c2 = np.sum((dbar * dbar.conj()).real, axis=1) if dbar.ndim == 2 else (dbar * dbar.conj()).real
            a = np.sum(dd * dbar, axis=1) if dd.ndim == 2 else dd * dbar
            vrho = (q.conj() ** 2 * a).real
            rho = vrho / V
            assert np.all(rho ** 2 <= (a * a.conj()).real * (1 + 1e-9) + 1e-300)
            assert np.all((a * a.conj()).real <= c1 * c2 * (1 + 1e-9) + 1e-300)
            for nm, x in (('E|q|', r), ('E V', V), ('E V^2', V * V), ('E c1', c1), ('E c2', c2),
                          ('E(c2-1)^2', (c2 - 1) ** 2), ('E(c1-c2-1)^2', (c1 - c2 - 1) ** 2),
                          ('E(c1+c2-3)^2', (c1 + c2 - 3) ** 2), ('E(c1-2)^2', (c1 - 2) ** 2),
                          ('E|a|^2', (a * a.conj()).real), ('E rho^2', rho ** 2), ('E V rho', vrho)):
                add(nm, x)
            for tag, (i, RF, rx) in rowsF.items():
                R2, RHS, br1, br2, cone = RF.evaluate(r, V, c1, c2, rho)
                scale = 1 + np.abs(RHS) + RF.lam3 * V ** 3
                mins[tag]['a'] = min(mins[tag]['a'], float(np.min(R2 - r)))
                mins[tag]['b'] = min(mins[tag]['b'], float(np.min((RHS - R2) / scale)))
                mins[tag]['cone'] = min(mins[tag]['cone'], float(np.min(cone)))
                add(tag + ' bracket (I)', br1)
                add(tag + ' bracket (II)', br2)
                add(tag + ' E RHS', RHS)

        def ms(name):
            s1, s2, k = sums[name]
            mean = s1 / k
            return mean, 3 * sqrt(max(s2 / k - mean * mean, 0) / k)

        exact = {'E V': 1, 'E V^2': 2 + float(s), 'E c1': 2, 'E c2': 1, 'E(c2-1)^2': 16 * n + 4 * h,
                 'E(c1-c2-1)^2': 16 * n + 20 * h + 16 * b, 'E(c1+c2-3)^2': 80 * n + 20 * h + 16 * b + 96 * y + 32 * z,
                 'E(c1-2)^2': 32 * n + 16 * h + 16 * b + 48 * y + 16 * z, 'E|a|^2': 32 * b + 24 * y,
                 'E V rho': 32 * b + 48 * y}
        print('-- %s   d=%d  s=%s=%.4f  (n,h,b,y,z)=(%s)  kappa6=%s' % (
            c.name, c.d, s, float(s), ', '.join('%.5f' % float(x) for x in c.pi),
            'n/a' if c.kappa6 is None else '%.3f' % float(c.kappa6)))
        m1, e1 = ms('E|q|')
        extra = ''
        if c.name.startswith('Wick monomial'):
            extra = '   (quadrature: %.6f)' % monomial_first_moment()
        print('   E|q| = %.5f +- %.5f%s' % (m1, e1, extra))
        line = []
        for nm, ex in exact.items():
            mean, err = ms(nm)
            okk = abs(mean - ex) <= err + 1e-12
            bad += not okk
            line.append('%s %.4f (exact %.4f)%s' % (nm, mean, ex, '' if okk else ' ***'))
        print('   ' + ';  '.join(line[:5]))
        print('   ' + ';  '.join(line[5:]))
        mr, er = ms('E rho^2')
        okk = mr <= 32 * b + 24 * y + er
        bad += not okk
        print('   E rho^2 = %.4f <= E|a|^2 = %.4f  %s' % (mr, 32 * b + 24 * y, '' if okk else '***'))
        for tag, (i, RF, rx) in rowsF.items():
            mI, eI = ms(tag + ' bracket (I)')
            mII, eII = ms(tag + ' bracket (II)')
            mR, eR = ms(tag + ' E RHS')
            lam = rx['lam']
            Bq = None
            if c.kappa6 is not None:
                Bq = lam[0] + lam[1] + lam[2] * (2 + s) + rx['lam3'] * (6 + 9 * s + c.kappa6) + dot(rx['d_lin'], c.pi)
            Brow = max(v[2] for v in rx['ends'].values())
            ok_pt = mins[tag]['a'] >= 0 and mins[tag]['b'] >= -1e-9 and mins[tag]['cone'] >= -1e-12
            ok_id = abs(mI) <= eI and abs(mII) <= eII
            ok_ch = (m1 - e1 <= mR + eR) and (Bq is None or (mR - eR <= float(Bq) and Bq <= Brow))
            bad += (not ok_pt) + (not ok_id) + (not ok_ch)
            print('   %s row %2d: min(R2 - r) = %.2e, min rel(RHS - R2) = %.1e, min cone = %.1e %s | brackets (I) %.1e +- %.1e, '
                  '(II) %.1e +- %.1e %s | E|q| %.5f <= E RHS %.5f +- %.5f <= scalar bound %s <= row bound %.6f %s' % (
                      tag, i, mins[tag]['a'], mins[tag]['b'], mins[tag]['cone'], 'ok' if ok_pt else '***',
                      mI, eI, mII, eII, 'ok' if ok_id else '***', m1, mR, eR,
                      'n/a' if Bq is None else '%.6f' % float(Bq), float(Brow), 'ok' if ok_ch else '***'))
    return bad


def quadrature_monomial(certs):
    print('== quadrature part (N): the Wick monomial, e = |y|^2 ~ Exp(1), composite Gauss-Legendre')
    bad = 0
    c = cubics()[0]
    gx, gw = np.polynomial.legendre.leggauss(12)
    for tag, cert in certs.items():
        i, row = find_row(cert, c.s)
        RF, rx = RowF(row), row_exact(row)
        brk = list(np.arange(0.0, 90.0001, 0.02)) + [2.0, 2.0 / 3.0]
        for uk in RF.u:                                   # e (e-2)^2 / 2 = u_k
            for root in np.roots([1.0, -4.0, 4.0, -2.0 * uk]):
                if abs(root.imag) < 1e-9 and 0 < root.real < 90:
                    brk.append(float(root.real))
        brk = np.unique(np.array(brk))
        a_, b_ = brk[:-1], brk[1:]
        e = ((a_ + b_) / 2)[:, None] + ((b_ - a_) / 2)[:, None] * gx[None, :]
        w = ((b_ - a_) / 2)[:, None] * gw[None, :] * np.exp(-e)
        e, w = e.ravel(), w.ravel()
        V = e * (e - 2) ** 2 / 2
        r = np.sqrt(V)
        c1, c2, rho = 2 * (e - 1) ** 2, e * e / 2, e * (e - 1)
        R2, RHS, br1, br2, cone = RF.evaluate(r, V, c1, c2, rho)
        E = lambda x: float(np.sum(w * x))
        lam = rx['lam']
        Bq = lam[0] + lam[1] + lam[2] * (2 + c.s) + rx['lam3'] * (6 + 9 * c.s + c.kappa6) + dot(rx['d_lin'], c.pi)
        Brow = max(v[2] for v in rx['ends'].values())
        vals = dict(mass=E(np.ones_like(e)), Er=E(r), EV=E(V), EV2=E(V * V), EV3=E(V ** 3), I=E(br1), II=E(br2), ERHS=E(RHS))
        ok = (abs(vals['mass'] - 1) < 1e-9 and abs(vals['EV'] - 1) < 1e-8 and abs(vals['EV2'] - 44) < 1e-6
              and abs(vals['EV3'] - 11352) < 1e-3 and abs(vals['I']) < 1e-7 and abs(vals['II']) < 1e-7
              and abs(vals['ERHS'] - float(Bq)) < 1e-6 and float(np.min(R2 - r)) > 0
              and float(np.min(RHS - R2)) > -1e-7 and abs(vals['Er'] - monomial_first_moment()) < 1e-6)   # sqrt(e) at e = 0
        bad += not ok
        print('   %s row %d: E|q| = %.8f, E V = %.9f, E V^2 = %.6f, E V^3 = %.4f; brackets (I) %.2e, (II) %.2e; '
              'E RHS = %.8f, exact scalar-level bound %.8f (difference %.1e); row bound %.6f; min(R2 - r) = %.2e, '
              'min(RHS - R2) = %.1e  %s' % (tag, i, vals['Er'], vals['EV'], vals['EV2'], vals['EV3'], vals['I'], vals['II'],
                                           vals['ERHS'], float(Bq), vals['ERHS'] - float(Bq), float(Brow),
                                           float(np.min(R2 - r)), float(np.min(RHS - R2)), 'ok' if ok else '***'))
    return bad


if __name__ == '__main__':
    t0 = time.time()
    certs = {'G': json.load(open(sys.argv[1])), 'N': json.load(open(sys.argv[2]))}
    nsamp = int(sys.argv[3]) if len(sys.argv) > 3 else 400000
    cubs = cubics()
    v = exact_part(certs, cubs)
    bq = quadrature_monomial(certs)
    bad = mc_part(certs, cubs, nsamp, np.random.default_rng(20261116))
    print('exact violations: %d;  quadrature failures: %d;  Monte Carlo checks outside 3 standard errors or failing: %d;  '
          'time %.1f s' % (v, bq, bad, time.time() - t0))
    sys.exit(1 if (v or bad or bq) else 0)

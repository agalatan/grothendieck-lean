#!/usr/bin/env python3
"""Exact Sturm-chain verifier of Compactly-Supported Damped Level-3 certificates on H_{2,1}(C^n).

Usage:  python3 -I verify_cert_level3.py CERT.json [--quiet] [--partial]

Only the Python standard library is used (fractions, json, math, sys).  Zero floating-point
operations occur anywhere in this file (`float` is never called); every arithmetic operation and
comparison is performed in exact arbitrary-precision integers and Fractions, with `-O`-safe `require(...)`.

Supports both Level-2 rows (`'K0' not in row`, backward-compatible with cert_916.json) and
Compactly-Supported Damped Level-3 rows (`'K0' in row`, incorporating fourth- and fifth-order
damped radial Stein identities (V_eps), (VI_eps), (VII_eps) on [0, e_{K_0}^2] and pure Level 2
on [e_{K_0}^2, oo)).

============================================================================================
SOUNDNESS OF COMPACTLY-SUPPORTED DAMPED LEVEL-3 ROWS (s = E|q|^4 - 2 in [s_lo, s_hi], u = 1).

1. Analytic inputs (proved in sharp-radius-2026-11-17-gemini-2762/PROOF.md §3 and checked by
   check_identities_exact.py):
   Fix rational eps > 0, s_rat := 1/(1 + eps c_2) in (0, 1], rhot := s_rat rho, Psi_6(c_2) := (c_2-1)^2 s_rat,
   Psi_7(c_2) := (c_2-1) s_rat.  For C^1 test functions h_5(v) = h_{5,0} + G_5(v), g_6(v) = G_6(v)/v,
   g_7(v) = G_7(v)/v supported on [0, u_{K_0}] (so phi_5 = phi_6 = phi_7 = h_5 = G_6 = G_7 = 0 on [u_{K_0}, oo)):
     (V_eps)   E[ s_rat w h_5(V) - eps s_rat^2 |b_loc|^2 h_5(V) + (c_2 phi_5(V) - h_5(V)) s_rat tilde_beta
                  + phi_5(V) s_rat tau_{ab} ] = 0
     (VI_eps)  E[ c_2 Psi_6(c_2) phi_6(V) - Psi_6(c_2) G_6(V) + Psi_6(c_2) rho Y_6(V)
                  + Psi_6'(c_2) tilde_beta g_6(V) ] = 0
     (VII_eps) E[ Psi_7(c_2) alpha_2 phi_7(V) + Psi_7(c_2) rho (c_2 Y_7(V) - G_7(V))
                  + Psi_7(c_2) tilde_beta g_7(V) + Psi_7'(c_2) tau_{ab} g_7(V) ] = 0.
   Since 0 <= |b_loc|^2 <= c_2 w implies s_rat^2 w <= s_rat w - eps s_rat^2 |b_loc|^2 <= w, any
   piecewise-linear D_w(v) satisfying 0 < D_w(v) <= min(mu_w, mu_w - h_5(v)) bounds the (w, |b_loc|^2)
   contribution below by D_w(v) w.

2. Exact rational-basis reduction via c_2 s_rat = (1 - s_rat)/eps and c_2 rhot = (rho - rhot)/eps:
   Completing the square in (tilde_beta, tilde_beta_perp) against D_w(v) w (using tau_{ab} = rho tilde_beta
   + rho_perp tilde_beta_perp, rho^2 + rho_perp^2 = alpha_2, tilde_beta^2 + tilde_beta_perp^2 <= v c_2 w)
   and bounding above by any continuous piecewise-linear 5x5 matrix T(v) >= (4 v D_w(v))^{-1} V(v) V(v)^T
   (since Delta_T(v) := T(v) - (4 v D_w(v))^{-1} V(v) V(v)^T >= 0 satisfies
    c_2 [ xi^T Delta_T(v) xi + (s_rat, s_rat^2) Delta_T_bot(v) (s_rat, s_rat^2)^T (alpha_2 - rho^2) ] >= 0
    with exact cancellation of +/- rho^2 (s_rat, s_rat^2) Delta_T_bot (s_rat, s_rat^2)^T)
   decouples RHS - r on [0, u_{K_0}] into:
     (0) T(u_k) > 0 at knots k = 0..K_0 (hence T(v) > 0 on [0, u_{K_0}] by convexity of the PD cone) and
         4 v D_w(v) det T(v) - V(v)^T adj(T(v)) V(v) > 0 on each piece (certifying T >= (4 v D_w)^{-1} V V^T);
     (a) alpha_2 >= rho^2 multiplier C_al(s_rat, v) >= theta_rho(v) >= 0 on s_rat in [0, 1], certified
         by the Markov-Lukacs decomposition [1, s, s^2] A_0(v) [1, s, s^2]^T + s(1-s) [1, s] A_1(v) [1, s]^T
         with A_0(v) > 0 (3x3 Sturm minors) and A_1(v) >= 0 (2x2 knot concavity);
     (b) 5x5 rational-basis quadratic form on (1, s_rat, s_rat^2, rhot, s_rat rhot) plus
         s_rat(1 - s_rat) [1, s_rat] B_1(v) [1, s_rat]^T >= 0, certified via trt_1(v) > 0, trt_2(v) > 0,
         B_1(v) >= 0, and exact 3x3 Sturm minors of the Schur complement of diag(trt_1, trt_2);
     (c) 4x4 quadratic block P^{(0)}(r) > 0 on (c_2, c_1, rho, 1) (using rhot^2 <= rho^2 and (s_rat rhot)^2 <= rho^2).
   On [u_{K_0}, oo), h_5 = G_6 = G_7 = 0 identically, reducing to the standard Level-2 4x4 matrix P(r) > 0.  QED
============================================================================================
"""
import json
import sys
import time
from fractions import Fraction as Fr
from math import gcd

C6 = Fr(4045313, 100000)
EROW = [Fr(32), Fr(8), Fr(32), Fr(96), Fr(0)]
S0 = [Fr(8), Fr(2), Fr(8), Fr(0), Fr(8)]
H0 = [Fr(8, 3), Fr(2, 3), Fr(8, 3), Fr(24), Fr(-16, 3)]
PMAX = [Fr(1, 32), Fr(1, 8), Fr(1, 32), Fr(1, 96), Fr(3, 64)]


def require(cond, msg='verification condition failed'):
    if not cond:
        raise ValueError(msg)


def dec_ceil10(q):
    q = Fr(q)
    n = (q.numerator * 10**10 + q.denominator - 1) // q.denominator
    return '%d.%010d' % (n // 10**10, n % 10**10)


def machin_pi_lo():
    lo5 = sum(Fr((-1) ** j) * (Fr(1, 5) ** (2 * j + 1)) / (2 * j + 1) for j in range(12))
    lo239 = sum(Fr((-1) ** j) * (Fr(1, 239) ** (2 * j + 1)) / (2 * j + 1) for j in range(12))
    hi239 = lo239 + (Fr(1, 239) ** 25) / 25
    return 16 * lo5 - 4 * hi239


# ------------------------------------------------------------------ exact polynomial arithmetic (low -> high)
def ptrim(a):
    a = list(a)
    while a and a[-1] == 0:
        a.pop()
    return a


def padd(a, b):
    n = max(len(a), len(b))
    return ptrim([(a[i] if i < len(a) else Fr(0)) + (b[i] if i < len(b) else Fr(0)) for i in range(n)])


def psub(a, b):
    n = max(len(a), len(b))
    return ptrim([(a[i] if i < len(a) else Fr(0)) - (b[i] if i < len(b) else Fr(0)) for i in range(n)])


def pscale(a, c):
    if c == 0 or not a:
        return []
    return ptrim([c * x for x in a])


def pmul(a, b):
    if not a or not b:
        return []
    out = [Fr(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        if x:
            for j, y in enumerate(b):
                out[i + j] += x * y
    return ptrim(out)


def peval(a, x):
    acc = Fr(0)
    for c in reversed(a):
        acc = acc * x + c
    return acc


def pprim(p, u0, val_u0):
    q = [Fr(0)] + [c / (i + 1) for i, c in enumerate(p)]
    q[0] = val_u0 - peval(q, u0)
    return ptrim(q)


def compose_r2(pv):
    out = []
    for c in pv:
        out.extend([c, Fr(0)])
    return ptrim(out)


def div_xk(p, k):
    p = ptrim(p)
    require(all(i >= len(p) or p[i] == 0 for i in range(k)), 'polynomial not divisible by x^%d' % k)
    return p[k:] if len(p) > k else []


# ------------------------------------------------------------------ exact integer Sturm chains
def to_int_poly(a):
    a = ptrim(a)
    if not a:
        return []
    den = 1
    for x in a:
        den = den * x.denominator // gcd(den, x.denominator)
    ints = [int(x * den) for x in a]
    g = 0
    for x in ints:
        g = gcd(g, abs(x))
    return [x // g for x in ints]


def ieval_sign(a, x):
    p, q = x.numerator, x.denominator
    acc = 0
    n = len(a) - 1
    for i in range(n, -1, -1):
        acc = acc * p + a[i] * (q ** (n - i))
    return (acc > 0) - (acc < 0)


def irem_neg(a, b):
    a = list(a)
    lb = b[-1]
    db = len(b) - 1
    m = abs(lb)
    sg = 1 if lb > 0 else -1
    while len(a) - 1 >= db and a:
        la = a[-1]
        k = len(a) - 1 - db
        a = [m * x for x in a]
        for i, y in enumerate(b):
            a[i + k] -= sg * la * y
        a = ptrim(a)
    return to_int_poly([-x for x in a])


def sturm_chain(p):
    p0 = to_int_poly(p)
    p1 = to_int_poly([i * p0[i] for i in range(1, len(p0))])
    chain = [p0]
    if p1:
        chain.append(p1)
    while len(chain) >= 2 and len(chain[-1]) > 1:
        r = irem_neg(chain[-2], chain[-1])
        if not r:
            break
        chain.append(r)
    return chain


def sign_changes(signs):
    nz = [x for x in signs if x != 0]
    return sum(1 for i in range(len(nz) - 1) if nz[i] != nz[i + 1])


def positive_on(p, a, b=None):
    p = ptrim(p)
    if not p:
        return False
    if len(p) == 1:
        return p[0] > 0
    ch = sturm_chain(p)
    if ieval_sign(ch[0], a) <= 0:
        return False
    va = sign_changes([ieval_sign(c, a) for c in ch])
    if b is None:
        if ch[0][-1] <= 0:
            return False
        vb = sign_changes([(c[-1] > 0) - (c[-1] < 0) for c in ch])
    else:
        if ieval_sign(ch[0], b) <= 0:
            return False
        vb = sign_changes([ieval_sign(c, b) for c in ch])
    return va == vb


def sym3_pd_on(a11, a12, a22, a13, a23, a33, u0, u1):
    """Exact Sturm test that symmetric 3x3 polynomial matrix is PD on [u0, u1]."""
    if not positive_on(a11, u0, u1):
        return False
    m2 = psub(pmul(a11, a22), pmul(a12, a12))
    if not positive_on(m2, u0, u1):
        return False
    c13 = psub(pmul(a12, a23), pmul(a22, a13))
    c23 = psub(pmul(a12, a13), pmul(a11, a23))
    m3 = padd(pmul(a33, m2), padd(pmul(a13, c13), pmul(a23, c23)))
    return positive_on(m3, u0, u1)


def scalar_det(M):
    m = len(M)
    if m == 1:
        return M[0][0]
    if m == 2:
        return M[0][0] * M[1][1] - M[0][1] * M[1][0]
    acc = Fr(0)
    for col in range(m):
        val = M[0][col]
        if val:
            sub = [[M[r][c] for c in range(m) if c != col] for r in range(1, m)]
            term = val * scalar_det(sub)
            acc = acc + term if col % 2 == 0 else acc - term
    return acc


def pdet(M):
    m = len(M)
    if m == 1:
        return M[0][0]
    if m == 2:
        return psub(pmul(M[0][0], M[1][1]), pmul(M[0][1], M[1][0]))
    acc = []
    for col in range(m):
        entry = M[0][col]
        if entry:
            sub = [[M[r][c] for c in range(m) if c != col] for r in range(1, m)]
            term = pmul(entry, pdet(sub))
            acc = padd(acc, term) if col % 2 == 0 else psub(acc, term)
    return acc


def sym5_det_and_adj(T):
    """Return (det T, adj T) for a symmetric 5x5 polynomial matrix T."""
    adj = [[None] * 5 for _ in range(5)]
    for b in range(5):
        for a in range(b + 1):
            sub = [[T[r][c] for c in range(5) if c != b] for r in range(5) if r != a]
            cof = pdet(sub)
            if (a + b) % 2 == 1:
                cof = pscale(cof, Fr(-1))
            adj[a][b] = adj[b][a] = cof
    det_T = []
    for b in range(5):
        det_T = padd(det_T, pmul(T[0][b], adj[0][b]))
    return det_T, adj


def cut_vector(typ, theta):
    m = [Fr(1), Fr(0), Fr(1), Fr(3), Fr(-1)]
    t3 = [Fr(0), Fr(0), Fr(0), Fr(3), Fr(-1)]
    if typ in ('n', 'h', 'b', 'y', 'z'):
        a_ = [Fr(0)] * 5
        a_['nhbyz'.index(typ)] = Fr(1)
        return a_
    if typ == 'bn':
        return [Fr(1), Fr(0), Fr(-1), Fr(0), Fr(0)]
    if typ == 'yz':
        return [Fr(0), Fr(0), Fr(0), Fr(-1), Fr(1)]
    if typ == 'h0':
        return list(H0)
    if typ == 'm':
        return m
    require(theta is not None and theta > 0, 'theta must be positive')
    if typ == 'c1':
        return [theta, Fr(1) / theta, Fr(0), Fr(0), Fr(-2)]
    if typ in ('c2+', 'c2-'):
        sg = -2 if typ == 'c2+' else 2
        return [m[i] / theta + (theta if i == 1 else Fr(0)) + sg * t3[i] for i in range(5)]
    raise ValueError('unknown cut: ' + str(typ))


def verify_row(row, quiet=False):
    e = [Fr(x) for x in row['knots']]
    K = len(e) - 1
    require(K >= 1 and e[0] == 0 and all(e[i] < e[i + 1] for i in range(K)), 'invalid knots')
    u = [x * x for x in e]
    require(isinstance(row['knot_den'], int) and row['knot_den'] > 0, 'invalid knot_den')
    kden = Fr(row['knot_den'])

    def get_arr(nm, exp_len):
        raw = row[nm]
        require(len(raw) == exp_len and all(isinstance(x, int) for x in raw), 'invalid array ' + nm)
        return [Fr(x, kden) for x in raw]

    phi1, phi2 = get_arr('phi1', K + 1), get_arr('phi2', K + 1)
    phi3, phi4 = get_arr('phi3', K + 1), get_arr('phi4', K + 1)
    psi_a = get_arr('psi_a', K + 1)
    xi2, xi1, xia = get_arr('xi2', K + 1), get_arr('xi1', K + 1), get_arr('xia', K + 1)

    require(len(row['lam']) == 3 and len(row['slope']) == 2 and len(row['l3']) == 3 and len(row['m_ker']) == 3,
            'invalid scalar tuple lengths')
    lam0, lam1, lam2 = (Fr(x) for x in row['lam'])
    slope = [Fr(x) for x in row['slope']]
    l3 = [Fr(x) for x in row['l3']]
    m00, m01, m11 = (Fr(x) for x in row['m_ker'])
    mu_a, mu_rho, mu_w, sig = Fr(row['mu_a']), Fr(row['mu_rho']), Fr(row['mu_w']), Fr(row['sigma'])

    require(all(x >= 0 for x in l3) and sum(l3) > 0, 'l3 failed')
    lam3 = sum(l3)
    require(m00 >= 0 and m11 > 0 and m00 * m11 - m01 * m01 >= 0, 'M_ker failed')
    require(mu_a >= 0 and mu_rho > 0 and mu_w > 0, 'mu signs failed')

    use_3d = ('K0' in row)
    if use_3d:
        K0 = int(row['K0'])
        require(1 <= K0 < K, 'invalid K0')
        M0 = K0 + 1
        eps = Fr(row['eps'])
        require(eps > 0, 'eps must be positive')
        inv_e = Fr(1) / eps
        inv_e2, inv_e3 = inv_e * inv_e, inv_e * inv_e * inv_e
        c_1pe, c_1p2e = 1 + eps, 1 + 2 * eps
        c_1pe2 = c_1pe * c_1pe
        h5_0 = Fr(row['h5_0'])
        phi5 = get_arr('phi5', K0) + [Fr(0)]
        phi6 = get_arr('phi6', K0) + [Fr(0)]
        phi7 = get_arr('phi7', K0) + [Fr(0)]
        dw_arr = get_arr('dw', M0)
        dal = get_arr('dal', M0)
        qs_arr = get_arr('qs', M0)
        trt1 = get_arr('trt1', M0)
        trt2 = get_arr('trt2', M0)
        a0_11 = get_arr('a0_11', M0)
        ps_11 = get_arr('ps_11', M0)
        ps_13 = get_arr('ps_13', M0)
        ps_23 = get_arr('ps_23', M0)
        a1_0, a1_1, a1_2 = get_arr('a1_0', M0), get_arr('a1_1', M0), get_arr('a1_2', M0)
        b1_0, b1_1, b1_2 = get_arr('b1_0', M0), get_arr('b1_1', M0), get_arr('b1_2', M0)
        raw_tv = row['tv']
        require(isinstance(raw_tv, list) and len(raw_tv) == 15, 'invalid tv list')
        tv_arrs = []
        for idx_t, sub_arr in enumerate(raw_tv):
            require(len(sub_arr) == M0 and all(isinstance(x, int) for x in sub_arr), 'invalid tv[%d]' % idx_t)
            tv_arrs.append([Fr(x, kden) for x in sub_arr])
    else:
        K0 = 0

    for k in range(K + 1):
        require(xi2[k] >= 0 and xi1[k] >= 0 and xia[k] ** 2 <= 4 * xi1[k] * xi2[k], 'C* failed at knot %d' % k)
        require(psi_a[k] >= 0, 'psi_a < 0 at knot %d' % k)
        if k >= K0:
            require(psi_a[k] + mu_a - phi4[k] >= 0, 'psi_a + mu_a - phi4 < 0 at knot %d' % k)
            require(m00 - phi3[k] > 0, 'D1 failed at knot %d' % k)
            require(m11 * (m00 - phi3[k]) - (m01 - Fr(1, 2) * psi_a[k]) ** 2 > 0, 'D2 failed at knot %d' % k)
    if use_3d:
        for k in range(K0 + 1):
            require(0 < dw_arr[k] <= mu_w, 'dw bounds failed at knot %d' % k)
            require(psi_a[k] + mu_a - phi4[k] - dal[k] >= 0, 'theta_rho < 0 at knot %d' % k)
            require(trt1[k] > 0 and trt2[k] > 0, 'trt <= 0 at knot %d' % k)
            require(a1_0[k] >= 0 and a1_2[k] >= 0 and a1_1[k] ** 2 <= a1_0[k] * a1_2[k], 'A1 PSD failed at knot %d' % k)
            require(b1_0[k] >= 0 and b1_2[k] >= 0 and b1_1[k] ** 2 <= b1_0[k] * b1_2[k], 'B1 PSD failed at knot %d' % k)
            Tk = [[tv_arrs[max(a, b) * (max(a, b) + 1) // 2 + min(a, b)][k] for b in range(5)] for a in range(5)]
            for m_sz in range(1, 6):
                require(scalar_det([r[:m_sz] for r in Tk[:m_sz]]) > 0, 'T(u_%d) minor %d <= 0' % (k, m_sz))

    G_val = [Fr(0)] * (7 if use_3d else 4)
    vv = [Fr(0), Fr(1)]
    vv2 = [Fr(0), Fr(0), Fr(1)]
    nfail = 0

    for k in range(K + 1):
        tail = (k == K)
        u0 = u[k]
        u1 = None if tail else u[k + 1]
        a_lo = e[k]
        b_hi = None if tail else e[k + 1]

        if tail:
            pc = lambda arr: ptrim([arr[K]])
        else:
            def pc(arr, k=k, u0=u0, u1=u1):
                sl = (arr[k + 1] - arr[k]) / (u1 - u0)
                return ptrim([arr[k] - sl * u0, sl])

        p1 = padd(pc(phi1), [Fr(0), slope[0]])
        p2 = padd(pc(phi2), [Fr(0), slope[1]])
        p3, p4 = pc(phi3), pc(phi4)
        psa = pc(psi_a)
        x2p, x1p, xap = pc(xi2), pc(xi1), pc(xia)

        g1 = pprim(p1, u0, G_val[0])
        g2 = pprim(p2, u0, G_val[1])
        g3 = pprim(p3, u0, G_val[2])
        g4 = pprim(p4, u0, G_val[3])

        vY1, vY2 = psub(pmul(vv, p1), g1), psub(pmul(vv, p2), g2)
        vY3, vY4 = psub(pmul(vv, p3), g3), psub(pmul(vv, p4), g4)
        M12 = psub([m01], pscale(psa, Fr(1, 2)))
        b2_v = pscale(psub([Fr(-2) * m01 - Fr(4) * m11], padd(pscale(p2, Fr(1, 2)), x1p)), Fr(1, 2))
        q1_base = padd([lam0 + m00 + 4 * m01 + 4 * m11, lam1, lam2, lam3], psub(padd(g1, g2), g3))

        if k >= K0:
            if use_3d and k == K0:
                require(h5_0 + G_val[4] == 0 and G_val[5] == 0 and G_val[6] == 0,
                        'exact compact support at u_{K0} violated')
            M11 = psub([m00], p3)
            M33 = psub(padd([mu_rho + mu_a], psa), p4)
            D2 = psub(pscale(M11, m11), pmul(M12, M12))
            g34 = padd(g3, g4)
            ok_s = True
            ok2 = positive_on(D2, u0, u1)
            if k == 0:
                g34_d = div_xk(g34, 1)
                tau_w_v = pmul(vv, pscale(pmul(g34_d, g34_d), Fr(1) / (4 * mu_w)))
                Y1_v, Y2_v, Y3_v, Y4_v = (div_xk(vy, 1) for vy in (vY1, vY2, vY3, vY4))
                M13_v = pscale(padd(Y3_v, Y4_v), Fr(-1, 2))
                D3_v = psub(pmul(M33, D2), pscale(pmul(M13_v, M13_v), m11))
                b1_v = pscale(psub(psub(padd(p3, g3), padd(p1, [2 * m00 + 4 * m01])), padd(tau_w_v, x2p)), Fr(1, 2))
                b3_v = pscale(psub(padd(padd([Fr(0), sig], Y3_v), g4),
                                   padd(padd(Y1_v, pscale(Y2_v, Fr(1, 2))), xap)), Fr(1, 2))
                adj11 = pscale(M33, m11)
                adj22 = psub(pmul(M11, M33), pmul(M13_v, M13_v))
                adj33 = D2
                adj12 = pscale(pmul(M12, M33), Fr(-1))
                adj13 = pscale(M13_v, -m11)
                adj23 = pmul(M12, M13_v)
                quad_v = padd(
                    padd(pmul(adj11, pmul(b1_v, b1_v)), pmul(adj22, pmul(b2_v, b2_v))),
                    padd(pmul(adj33, pmul(b3_v, b3_v)),
                         pscale(padd(pmul(adj12, pmul(b1_v, b2_v)),
                                     padd(pmul(adj13, pmul(b1_v, b3_v)), pmul(adj23, pmul(b2_v, b3_v)))), Fr(2)))
                )
                D4_r = psub(pmul(psub(compose_r2(q1_base), [Fr(0), Fr(1)]), compose_r2(D3_v)), compose_r2(quad_v))
                ok3 = positive_on(D3_v, u0, u1)
                ok4 = positive_on(D4_r, a_lo, b_hi)
            else:
                vM13 = pscale(padd(vY3, vY4), Fr(-1, 2))
                v2D3 = psub(pmul(vv2, pmul(M33, D2)), pscale(pmul(vM13, vM13), m11))
                v_tau_w = pscale(pmul(g34, g34), Fr(1) / (4 * mu_w))
                vb1 = pscale(psub(pmul(vv, psub(padd(p3, g3), padd(p1, padd([2 * m00 + 4 * m01], x2p)))), v_tau_w), Fr(1, 2))
                vb3 = pscale(psub(padd(pmul(vv, padd([Fr(0), sig], g4)), vY3),
                                  padd(padd(vY1, pscale(vY2, Fr(1, 2))), pmul(vv, xap))), Fr(1, 2))
                t11 = pmul(pscale(pmul(vv, M33), m11), pmul(vb1, vb1))
                v2_adj22 = psub(pmul(vv2, pmul(M11, M33)), pmul(vM13, vM13))
                t22 = pmul(vv, pmul(v2_adj22, pmul(b2_v, b2_v)))
                t33 = pmul(pmul(vv, D2), pmul(vb3, vb3))
                t12 = pscale(pmul(vv2, pmul(pmul(M12, M33), pmul(vb1, b2_v))), Fr(-2))
                t13 = pscale(pmul(vM13, pmul(vb1, vb3)), -2 * m11)
                t23 = pscale(pmul(vv, pmul(M12, pmul(vM13, pmul(b2_v, vb3)))), Fr(2))
                v3_quad = padd(padd(t11, t22), padd(t33, padd(t12, padd(t13, t23))))
                vq1_r = psub(compose_r2(pmul(vv, q1_base)), [Fr(0), Fr(0), Fr(0), Fr(1)])
                v3D4_r = psub(pmul(vq1_r, compose_r2(v2D3)), compose_r2(v3_quad))
                ok3 = positive_on(v2D3, u0, u1)
                ok4 = positive_on(v3D4_r, a_lo, b_hi)
            if not tail:
                G_val[:4] = [peval(g1, u1), peval(g2, u1), peval(g3, u1), peval(g4, u1)]
        else:
            # 0 <= k < K0: Compactly-Supported Damped Level 3 with piecewise-linear 5x5 T(v)!
            p5, p6, p7 = pc(phi5), pc(phi6), pc(phi7)
            g5 = pprim(p5, u0, G_val[4])
            g6 = pprim(p6, u0, G_val[5])
            g7 = pprim(p7, u0, G_val[6])
            h5 = padd([h5_0], g5)
            Dw = pc(dw_arr)
            ok_dw = positive_on(psub([mu_w], padd(h5, Dw)), u0, u1)

            vY6, vY7 = psub(pmul(vv, p6), g6), psub(pmul(vv, p7), g7)
            dal_p, qs_p = pc(dal), pc(qs_arr)
            trt1_p, trt2_p = pc(trt1), pc(trt2)
            a0_11_p, ps_11_p, ps_13_p, ps_23_p = pc(a0_11), pc(ps_11), pc(ps_13), pc(ps_23)
            a1_0p, a1_1p, a1_2p = pc(a1_0), pc(a1_1), pc(a1_2)
            b1_0p, b1_1p, b1_2p = pc(b1_0), pc(b1_1), pc(b1_2)
            T_p = [[pc(tv_arrs[max(a, b) * (max(a, b) + 1) // 2 + min(a, b)]) for b in range(5)] for a in range(5)]

            vp5 = pmul(vv, p5)
            V0 = padd(padd(g3, g4), pscale(padd(vp5, padd(g6, g7)), inv_e))
            V1 = psub(pscale(vp5, -inv_e), padd(pmul(vv, h5), pscale(g7, c_1pe * inv_e)))
            V2 = pscale(g6, -c_1pe2 * inv_e)
            V3 = vp5
            V4 = pscale(g7, c_1pe)
            V_list = [V0, V1, V2, V3, V4]

            # (0) Rank-1 Schur complement T(v) > (4 v Dw(v))^{-1} V(v) V(v)^T (since T(v) > 0 by knot convexity)
            det_T, adj_T = sym5_det_and_adj(T_p)
            quad_T = []
            if k == 0:
                Vb = [div_xk(Vp, 1) for Vp in V_list]
                for a in range(5):
                    quad_T = padd(quad_T, pmul(adj_T[a][a], pmul(Vb[a], Vb[a])))
                    for b in range(a + 1, 5):
                        quad_T = padd(quad_T, pscale(pmul(adj_T[a][b], pmul(Vb[a], Vb[b])), Fr(2)))
                D6_p = psub(pmul(pscale(Dw, Fr(4)), det_T), pmul(vv, quad_T))
            else:
                for a in range(5):
                    quad_T = padd(quad_T, pmul(adj_T[a][a], pmul(V_list[a], V_list[a])))
                    for b in range(a + 1, 5):
                        quad_T = padd(quad_T, pscale(pmul(adj_T[a][b], pmul(V_list[a], V_list[b])), Fr(2)))
                D6_p = psub(pmul(pscale(pmul(vv, Dw), Fr(4)), det_T), quad_T)
            ok_tv = positive_on(D6_p, u0, u1)

            # (a) 3x3 Markov-Lukacs block A_0(v) > 0
            A0_00 = psub(dal_p, pscale(p7, inv_e))
            A0_01 = pscale(psub(psub(pscale(p7, c_1pe * inv_e), a1_0p), pscale(T_p[3][3], inv_e)), Fr(1, 2))
            A0_11 = a0_11_p
            A0_02 = pscale(padd(pscale(psub(T_p[3][3], pscale(T_p[3][4], Fr(2))), inv_e),
                                psub(a1_0p, padd(a0_11_p, pscale(a1_1p, Fr(2))))), Fr(1, 2))
            A0_12 = pscale(padd(pscale(psub(pscale(T_p[3][4], Fr(2)), T_p[4][4]), inv_e),
                                psub(pscale(a1_1p, Fr(2)), a1_2p)), Fr(1, 2))
            A0_22 = padd(pscale(T_p[4][4], inv_e), a1_2p)
            ok_a0 = sym3_pd_on(A0_00, A0_01, A0_11, A0_02, A0_12, A0_22, u0, u1)

            # (b) 5x5 rational-basis block P_s(v) > 0 via 3x3 Schur complement of diag(trt1, trt2)
            P_00 = psub(psub(qs_p, padd(pscale(p6, c_1pe2 * inv_e3), pscale(g6, c_1p2e * inv_e2))),
                        pscale(T_p[0][1], 2 * inv_e))
            P_01 = pscale(padd(psub(padd(pscale(p6, c_1pe2 * inv_e3), pscale(g6, c_1pe2 * inv_e2)), b1_0p),
                               pscale(psub(pscale(T_p[0][1], Fr(2)), padd(T_p[1][1], pscale(T_p[0][2], Fr(2)))), inv_e)), Fr(1, 2))
            P_11 = ps_11_p
            P_02 = pscale(padd(pscale(psub(padd(T_p[1][1], pscale(T_p[0][2], Fr(2))), pscale(T_p[1][2], Fr(2))), inv_e),
                               psub(b1_0p, padd(ps_11_p, pscale(b1_1p, Fr(2))))), Fr(1, 2))
            P_12 = pscale(padd(pscale(psub(pscale(T_p[1][2], Fr(2)), T_p[2][2]), inv_e),
                               psub(pscale(b1_1p, Fr(2)), b1_2p)), Fr(1, 2))
            P_22 = padd(pscale(T_p[2][2], inv_e), b1_2p)
            U4 = [
                psub(pscale(psub(padd(T_p[0][4], T_p[1][3]), padd(T_p[1][4], T_p[2][3])), inv_e), ps_13_p),
                psub(pscale(psub(padd(T_p[1][4], T_p[2][3]), T_p[2][4]), inv_e), ps_23_p),
                pscale(T_p[2][4], inv_e),
            ]

            if k == 0:
                Y6_v, Y7_v = div_xk(vY6, 1), div_xk(vY7, 1)
                u3_0 = padd(pscale(padd(pscale(Y6_v, c_1pe2 * inv_e2), padd(pscale(Y7_v, c_1pe * inv_e2), pscale(g7, c_1pe * inv_e))), Fr(-1, 2)),
                            pscale(psub(T_p[0][3], padd(T_p[0][4], T_p[1][3])), inv_e))
                U3 = [u3_0, ps_13_p, ps_23_p]
                mult_top = pmul(trt1_p, trt2_p)
                w_u4 = trt1_p
            else:
                vu3_0 = padd(pscale(padd(pscale(vY6, c_1pe2 * inv_e2), padd(pscale(vY7, c_1pe * inv_e2), pscale(pmul(vv, g7), c_1pe * inv_e))), Fr(-1, 2)),
                             pmul(vv, pscale(psub(T_p[0][3], padd(T_p[0][4], T_p[1][3])), inv_e)))
                U3 = [vu3_0, pmul(vv, ps_13_p), pmul(vv, ps_23_p)]
                mult_top = pmul(vv2, pmul(trt1_p, trt2_p))
                w_u4 = pmul(vv2, trt1_p)

            def schur_entry(i_, j_, P_ij):
                return psub(pmul(mult_top, P_ij), padd(pmul(trt2_p, pmul(U3[i_], U3[j_])), pmul(w_u4, pmul(U4[i_], U4[j_]))))

            S00 = schur_entry(0, 0, P_00)
            S01 = schur_entry(0, 1, P_01)
            S11 = schur_entry(1, 1, P_11)
            S02 = schur_entry(0, 2, P_02)
            S12 = schur_entry(1, 2, P_12)
            S22 = schur_entry(2, 2, P_22)
            ok_ps = sym3_pd_on(S00, S01, S11, S02, S12, S22, u0, u1)
            ok_s = ok_dw and ok_tv and ok_a0 and ok_ps

            # (c) 4x4 quadratic block P^{(0)}(r) > 0 on (c_2, c_1, rho, 1)
            M11 = psub(psub([m00], p3), pscale(p6, inv_e))
            M33 = psub(psub(padd([mu_rho + mu_a], psa), p4), padd(dal_p, padd(trt1_p, trt2_p)))
            D2 = psub(pscale(M11, m11), pmul(M12, M12))
            ok2 = positive_on(D2, u0, u1)
            q1_rem = psub(q1_base, qs_p)
            b1_v = pscale(psub(psub(padd(p3, padd(g3, padd(pscale(p6, c_1p2e * inv_e2), pscale(g6, inv_e)))),
                                    padd(p1, padd([2 * m00 + 4 * m01], x2p))), T_p[0][0]), Fr(1, 2))

            if k == 0:
                Y1_v, Y2_v, Y3_v, Y4_v = (div_xk(vy, 1) for vy in (vY1, vY2, vY3, vY4))
                M13_v = pscale(padd(padd(Y3_v, Y4_v), pscale(padd(Y6_v, Y7_v), inv_e)), Fr(-1, 2))
                D3_v = psub(pmul(M33, D2), pscale(pmul(M13_v, M13_v), m11))
                ok3 = positive_on(D3_v, u0, u1)
                b3_v = pscale(psub(psub(padd([Fr(0), sig], padd(Y3_v, padd(g4, padd(pscale(Y6_v, c_1p2e * inv_e2),
                                   padd(pscale(Y7_v, c_1pe * inv_e2), pscale(g7, inv_e)))))),
                                   padd(Y1_v, padd(pscale(Y2_v, Fr(1, 2)), xap))), pscale(T_p[0][3], 2 * inv_e)), Fr(1, 2))
                adj11 = pscale(M33, m11)
                adj22 = psub(pmul(M11, M33), pmul(M13_v, M13_v))
                adj33 = D2
                adj12 = pscale(pmul(M12, M33), Fr(-1))
                adj13 = pscale(M13_v, -m11)
                adj23 = pmul(M12, M13_v)
                quad_v = padd(
                    padd(pmul(adj11, pmul(b1_v, b1_v)), pmul(adj22, pmul(b2_v, b2_v))),
                    padd(pmul(adj33, pmul(b3_v, b3_v)),
                         pscale(padd(pmul(adj12, pmul(b1_v, b2_v)),
                                     padd(pmul(adj13, pmul(b1_v, b3_v)), pmul(adj23, pmul(b2_v, b3_v)))), Fr(2)))
                )
                D4_r = psub(pmul(psub(compose_r2(q1_rem), [Fr(0), Fr(1)]), compose_r2(D3_v)), compose_r2(quad_v))
                ok4 = positive_on(D4_r, a_lo, b_hi)
            else:
                vM13 = pscale(padd(padd(vY3, vY4), pscale(padd(vY6, vY7), inv_e)), Fr(-1, 2))
                v2D3 = psub(pmul(vv2, pmul(M33, D2)), pscale(pmul(vM13, vM13), m11))
                ok3 = positive_on(v2D3, u0, u1)
                vb3 = pscale(psub(padd(pmul(vv, psub(padd([Fr(0), sig], padd(g4, pscale(g7, inv_e))),
                                                     padd(xap, pscale(T_p[0][3], 2 * inv_e)))),
                                       padd(vY3, padd(pscale(vY6, c_1p2e * inv_e2), pscale(vY7, c_1pe * inv_e2)))),
                                  padd(vY1, pscale(vY2, Fr(1, 2)))), Fr(1, 2))
                # diag(1, 1, v, 1) P^{(0)} diag(1, 1, v, 1):
                t11 = pmul(pscale(pmul(vv2, M33), m11), pmul(b1_v, b1_v))
                v2_adj22 = psub(pmul(vv2, pmul(M11, M33)), pmul(vM13, vM13))
                t22 = pmul(v2_adj22, pmul(b2_v, b2_v))
                t33 = pmul(D2, pmul(vb3, vb3))
                t12 = pscale(pmul(vv2, pmul(M12, pmul(M33, pmul(b1_v, b2_v)))), Fr(-2))
                t13 = pscale(pmul(vM13, pmul(b1_v, vb3)), -2 * m11)
                t23 = pscale(pmul(M12, pmul(vM13, pmul(b2_v, vb3))), Fr(2))
                v2_quad = padd(padd(t11, t22), padd(t33, padd(t12, padd(t13, t23))))
                D4_r = psub(pmul(psub(compose_r2(q1_rem), [Fr(0), Fr(1)]), compose_r2(v2D3)), compose_r2(v2_quad))
                ok4 = positive_on(D4_r, a_lo, b_hi)

            G_val = [peval(g1, u1), peval(g2, u1), peval(g3, u1), peval(g4, u1),
                     peval(g5, u1), peval(g6, u1), peval(g7, u1)]

        if not (ok_s and ok2 and ok3 and ok4):
            nfail += 1
            if not quiet:
                print('   (C2) FAILS on', 'tail' if tail else 'interval %d [%s, %s]' % (k, e[k], e[k + 1]),
                      'ok_s=%s ok2=%s ok3=%s ok4=%s' % (ok_s, ok2, ok3, ok4))

    dlin = [
        16 * m00 + 32 * m01 + 32 * m11,
        4 * m00 + 16 * m11,
        16 * m11 + 32 * (mu_a + mu_rho + sig),
        48 * m01 + 48 * m11 + 24 * (mu_a + mu_rho + mu_w) + 48 * sig,
        16 * m01 + 16 * m11,
    ]
    bounds = {}
    for end in ('lo', 'hi'):
        s_e = Fr(row['s_' + end])
        if s_e == 0:
            bounds[end] = lam0 + lam1 + 2 * lam2 + 6 * lam3
            continue
        pd = row['par'][end]
        al = [Fr(x) for x in pd['alpha']]
        require(len(al) == 2 and all(x > 0 for x in al), 'alpha > 0 failed')
        dJ = [l3[1] * (150 * al[0] * S0[i] + (198 + Fr(150) / al[0]) * H0[i])
              + l3[2] * (Fr(135, 2) * al[1] * S0[i] + (Fr(11781, 32) + Fr(135, 2) / al[1]) * H0[i]) for i in range(5)]
        sb = Fr(pd['sqrt_ub'])
        require(sb > 0 and sb * sb >= s_e, 'sqrt_ub failed')
        c = [dlin[i] + sb * dJ[i] for i in range(5)]
        eta = Fr(pd['eta'])
        resid = [c[i] - eta * EROW[i] for i in range(5)]
        for typ, theta, yv in pd['cuts']:
            yv = Fr(yv)
            require(yv >= 0, 'negative cut multiplier')
            a_ = cut_vector(typ, None if theta is None else Fr(theta))
            resid = [resid[i] + yv * a_[i] for i in range(5)]
        L = eta + sum(max(resid[i], Fr(0)) * PMAX[i] for i in range(5))
        bounds[end] = (lam0 + lam1 + lam2 * (2 + s_e) + l3[0] * (6 + 9 * s_e + C6 * s_e * sb)
                       + (l3[1] + l3[2]) * (6 + 9 * s_e) + s_e * L)

    return dict(ok=(nfail == 0), nfail=nfail, bound=max(bounds.values()), bounds=bounds, K=K, level=('3d' if use_3d else '2'))


def main():
    t0 = time.time()
    path = sys.argv[1]
    quiet = '--quiet' in sys.argv
    partial = '--partial' in sys.argv
    with open(path, encoding='utf-8') as fh:
        cert = json.load(fh)
    rows = cert['rows']
    require(len(rows) >= 1, 'empty rows')
    worst = None
    worst_idx = -1
    worst_hi = None
    sharp_hi_s = Fr(cert['sharp_hi_s']) if 'sharp_hi_s' in cert else None
    found_sharp_start = False

    prev = Fr(rows[0]['s_lo']) if partial else Fr(0)
    start = prev
    allok = True
    for i, row in enumerate(rows):
        s_lo, s_hi = Fr(row['s_lo']), Fr(row['s_hi'])
        require(s_lo == prev and s_hi > s_lo, 'rows must be contiguous')
        prev = s_hi
        res = verify_row(row, quiet=quiet)
        allok = allok and res['ok']
        if worst is None or res['bound'] > worst:
            worst = res['bound']
            worst_idx = i
        if sharp_hi_s is not None and s_lo >= sharp_hi_s:
            if s_lo == sharp_hi_s:
                found_sharp_start = True
            if worst_hi is None or res['bound'] > worst_hi:
                worst_hi = res['bound']
        if not quiet:
            print('row %2d [L%s]  s in [%6s, %6s]  K=%3d  %s  bound <= %s  (lo<=%s, hi<=%s)' % (
                i, res['level'], row['s_lo'], row['s_hi'], res['K'], 'PASS' if res['ok'] else 'FAIL',
                dec_ceil10(res['bound']), dec_ceil10(res['bounds']['lo']), dec_ceil10(res['bounds']['hi'])), flush=True)

    covered = prev
    dt = time.time() - t0
    print('covered s in [%s, %s];  all rows pass: %s;  worst row = %d;  max bound = %s  (<= %s)  [%.2fs]' % (
        start, covered, allok, worst_idx, worst, dec_ceil10(worst), dt))

    exit_ok = allok
    target = cert.get('claim')
    if target is not None and not partial:
        t = Fr(target)
        okc = allok and worst < t and covered >= 42
        print('claim  E|q| <= %s ||q||_2  for every q in H_{2,1}:  %s' % (
            target, 'VERIFIED' if okc else 'NOT VERIFIED'))
        exit_ok = exit_ok and okc

    if sharp_hi_s is not None and 'sharp_hi_claim' in cert and not partial:
        sh_cap = Fr(cert['sharp_hi_claim'])
        pi_lo = machin_pi_lo()
        require(sh_cap * sh_cap < pi_lo / 4, 'sharp_hi_claim is not strictly below sqrt(pi)/2')
        ok_hi = (allok and found_sharp_start and worst_hi is not None and worst_hi < sh_cap and covered >= 42)
        print('high-kurtosis sharp claim  E|q| <= %s ||q||_2 < (sqrt(pi)/2)||q||_2  on chi in [%s, 42]:  %s  (max <= %s)' % (
            cert['sharp_hi_claim'], sharp_hi_s, 'VERIFIED' if ok_hi else 'NOT VERIFIED',
            dec_ceil10(worst_hi) if worst_hi is not None else 'N/A'))
        exit_ok = exit_ok and ok_hi

    sys.exit(0 if exit_ok else 1)


if __name__ == '__main__':
    main()

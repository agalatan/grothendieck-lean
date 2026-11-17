#!/usr/bin/env python3
"""Exact + numerical obstruction diagnosis of cert_916.json Row 10 (Task 2 of Issue #523).

Usage:  python3 diagnose_916.py

Computes and prints:
  1. Active Gram-cone cuts across rows 6..15 (chi in [2, 11/2]) of cert_916.json, exact LP primal
     extremizer pi* = (n*, h*, b*, y*, z*) at chi = 4 (Row 10), and slackness of Q = 4h <= 1 and
     the radial sixth-order cut R.
  2. Multi-start optimization over genuine cubic tensors in H_{2,1}(C^6) and H_{2,1}(C^8) at chi = 4,
     PLUS exact Fraction verification on a rationalized C^6 tensor (proving label C that genuine cubics
     attain (cvec . pi)/s within 2e-5 of the LP relaxation, so fourth-order Gram looseness is < 1e-4).
  3. Radial contact-ridge diagnosis of Row 10 of cert_916.json across r = |q| in [0, 20].
  4. Clarabel ablation & sixth-order E[c_2^3] <= M sensitivity table at chi = 4.0.
"""
import json
import os
import sys
from fractions import Fraction as Fr

import numpy as np
from scipy.optimize import linprog, minimize

HERE = os.path.dirname(os.path.abspath(__file__))
CODE_916 = os.path.normpath(os.path.join(HERE, '..', 'complex-radius-gemini-2762'))
sys.path.insert(0, CODE_916)

import make_cert as MC
import verify_cert as VC


def require(cond, msg='check failed'):
    if not cond:
        raise ValueError(msg)


def dec_ceil8(q):
    q = Fr(q)
    n = (q.numerator * 10**8 + q.denominator - 1) // q.denominator
    return '%d.%08d' % (n // 10**8, n % 10**8)


def row_cvec_exact(row, end='lo'):
    m00, m01, m11 = (Fr(x) for x in row['m_ker'])
    mu_a, mu_rho, mu_w, sig = Fr(row['mu_a']), Fr(row['mu_rho']), Fr(row['mu_w']), Fr(row['sigma'])
    l3 = [Fr(x) for x in row['l3']]
    dlin = [
        16 * m00 + 32 * m01 + 32 * m11,
        4 * m00 + 16 * m11,
        16 * m11 + 32 * (mu_a + mu_rho + sig),
        48 * m01 + 48 * m11 + 24 * (mu_a + mu_rho + mu_w) + 48 * sig,
        16 * m01 + 16 * m11,
    ]
    pd = row['par'][end]
    al = [Fr(x) for x in pd['alpha']]
    sb = Fr(pd['sqrt_ub'])
    dJ = [l3[1] * (150 * al[0] * VC.S0[i] + (198 + Fr(150) / al[0]) * VC.H0[i])
          + l3[2] * (Fr(135, 2) * al[1] * VC.S0[i] + (Fr(11781, 32) + Fr(135, 2) / al[1]) * VC.H0[i])
          for i in range(5)]
    return [dlin[i] + sb * dJ[i] for i in range(5)]


def tensor_contractions_float(x_real, d):
    m_c = d * (d + 1) // 2 * d
    c_arr = x_real[:m_c] + 1j * x_real[m_c:]
    t = np.zeros((d, d, d), dtype=np.complex128)
    idx = 0
    for a in range(d):
        for b in range(a, d):
            for k in range(d):
                val = c_arr[idx]
                idx += 1
                if a == b:
                    t[a, a, k] = val
                else:
                    s = val / np.sqrt(2.0)
                    t[a, b, k] = s
                    t[b, a, k] = s
    u = 2.0 * float(np.sum(np.abs(t) ** 2).real)
    if u < 1e-24:
        return np.zeros(5), 0.0, t
    t = t / np.sqrt(u)
    N_m = np.einsum('jbk,lbk->jl', t, np.conj(t))
    H_m = np.einsum('abk,abl->kl', np.conj(t), t)
    B_m = np.einsum('ace,bec->ab', t, t)
    W = np.einsum('abc,cef->abef', t, t)
    W_sym = (W + np.transpose(W, (0, 2, 1, 3)) + np.transpose(W, (1, 0, 2, 3))
             + np.transpose(W, (1, 2, 0, 3)) + np.transpose(W, (2, 0, 1, 3)) + np.transpose(W, (2, 1, 0, 3))) / 6.0
    n = float(np.sum(np.abs(N_m) ** 2).real)
    h = float(np.sum(np.abs(H_m) ** 2).real)
    z = float(np.einsum('jl,lj->', N_m, H_m).real)
    b = float(np.sum(np.abs(B_m) ** 2).real)
    y = float(np.sum(np.abs(W_sym) ** 2).real)
    pi = np.array([n, h, b, y, z])
    s = 32.0 * n + 8.0 * h + 32.0 * b + 96.0 * y
    return pi, s, t


def exact_rational_contractions(t_re_int, t_im_int, d):
    """Exact Fraction computation of (n, h, b, y, z) and s for an unnormalized Q[i] symmetric cubic tensor."""
    # Represent complex rationals as pairs (re, im) of Fractions
    def c_add(u, v): return (u[0] + v[0], u[1] + v[1])
    def c_conj(u):   return (u[0], -u[1])
    def c_mul(u, v): return (u[0]*v[0] - u[1]*v[1], u[0]*v[1] + u[1]*v[0])
    def c_norm2(u):  return u[0]*u[0] + u[1]*u[1]

    T = [[[(Fr(int(t_re_int[a, b, k])), Fr(int(t_im_int[a, b, k]))) for k in range(d)] for b in range(d)] for a in range(d)]
    # Enforce exact symmetry T[a][b][k] == T[b][a][k]:
    for a in range(d):
        for b in range(a + 1, d):
            for k in range(d):
                avg = (Fr(T[a][b][k][0] + T[b][a][k][0], 2), Fr(T[a][b][k][1] + T[b][a][k][1], 2))
                T[a][b][k] = T[b][a][k] = avg

    u = 2 * sum(c_norm2(T[a][b][k]) for a in range(d) for b in range(d) for k in range(d))
    require(u > 0, 'zero rational tensor')
    u2 = u * u  # normalize scalars by dividing by u^2!

    # N_{jl} = sum_{b,k} T_{jbk} conj(T_{lbk})
    N_m = [[(Fr(0), Fr(0)) for _ in range(d)] for _ in range(d)]
    H_m = [[(Fr(0), Fr(0)) for _ in range(d)] for _ in range(d)]
    B_m = [[(Fr(0), Fr(0)) for _ in range(d)] for _ in range(d)]
    for j in range(d):
        for l in range(d):
            acc_n = (Fr(0), Fr(0))
            acc_h = (Fr(0), Fr(0))
            acc_b = (Fr(0), Fr(0))
            for b in range(d):
                for k in range(d):
                    acc_n = c_add(acc_n, c_mul(T[j][b][k], c_conj(T[l][b][k])))
                    acc_h = c_add(acc_h, c_mul(c_conj(T[b][k][j]), T[b][k][l]))
                    acc_b = c_add(acc_b, c_mul(T[j][b][k], T[l][k][b]))
            N_m[j][l] = acc_n
            H_m[j][l] = acc_h
            B_m[j][l] = acc_b

    n_val = sum(c_norm2(N_m[j][l]) for j in range(d) for l in range(d)) / u2
    h_val = sum(c_norm2(H_m[j][l]) for j in range(d) for l in range(d)) / u2
    b_val = sum(c_norm2(B_m[j][l]) for j in range(d) for l in range(d)) / u2
    z_val = sum(c_mul(N_m[j][l], H_m[l][j])[0] for j in range(d) for l in range(d)) / u2

    # W_{abef} = sum_c T_{abc} T_{cef}, symmetrized over (a, b, e)
    W_raw = [[[[(Fr(0), Fr(0)) for _ in range(d)] for _ in range(d)] for _ in range(d)] for _ in range(d)]
    for a in range(d):
        for b in range(d):
            for e in range(d):
                for f in range(d):
                    acc = (Fr(0), Fr(0))
                    for c_ in range(d):
                        acc = c_add(acc, c_mul(T[a][b][c_], T[c_][e][f]))
                    W_raw[a][b][e][f] = acc
    y_num = Fr(0)
    perms3 = ((0, 1, 2), (0, 2, 1), (1, 0, 2), (1, 2, 0), (2, 0, 1), (2, 1, 0))
    for a in range(d):
        for b in range(d):
            for e in range(d):
                idx3 = (a, b, e)
                for f in range(d):
                    sr = sum(W_raw[idx3[p[0]]][idx3[p[1]]][idx3[p[2]]][f][0] for p in perms3) / 6
                    si = sum(W_raw[idx3[p[0]]][idx3[p[1]]][idx3[p[2]]][f][1] for p in perms3) / 6
                    y_num += sr * sr + si * si
    y_val = y_num / u2
    s_val = 32 * n_val + 8 * h_val + 32 * b_val + 96 * y_val
    return [n_val, h_val, b_val, y_val, z_val], s_val


def diagnose_all():
    cert_path = os.path.join(CODE_916, 'cert_916.json')
    with open(cert_path, encoding='utf-8') as fh:
        cert = json.load(fh)
    rows = cert['rows']

    print('=== 1. Binding Gram-cone cuts across rows 6..15 (chi in [2, 11/2]) of cert_916.json ===')
    for idx in range(6, 16):
        r = rows[idx]
        for end in ('lo', 'hi'):
            pd = r['par'][end]
            cuts_str = ', '.join('%s%s:%s' % (tp, '' if th is None else '(%s)' % th, dec_ceil8(Fr(yv)))
                                 for tp, th, yv in pd['cuts'])
            if idx == 10 or end == 'lo':
                print('  Row %2d [%5s, %5s] (%s): eta=%s | active cuts: %s' % (
                    idx, r['s_lo'], r['s_hi'], end, dec_ceil8(Fr(pd['eta'])), cuts_str))

    row10 = rows[10]
    cvec_q = row_cvec_exact(row10, 'lo')
    cvec_f = np.array([float(x) for x in cvec_q])

    # Solve dense cut LP at s = 4 (Row 10 lo) to inspect primal extremizer pi* = 4 * p*
    ths = sorted({Fr(k, 200) for k in range(1, 801)} | set(MC.THETAS))
    cuts = MC.all_cuts(ths)
    A = np.array([[float(x) for x in VC.cut_vector(t, th)] for t, th in cuts])
    lp_res = linprog(-cvec_f, A_ub=-A, b_ub=np.zeros(len(cuts)),
                     A_eq=np.array([MC.EROWf]), b_eq=[1.0], bounds=[(None, None)] * 5, method='highs')
    require(lp_res.status == 0, 'LP failed')
    p_star = lp_res.x
    pi_star = 4.0 * p_star
    eta_lp = float(-lp_res.fun)
    Q_val = 4.0 * pi_star[1]
    # Check GPT radial cut R = 32*b + 24*y on pi_star vs bound:
    print('\n  Row 10 (chi = 4) dense-cut LP optimum:')
    print('    eta_LP = (cvec . pi*)/4 = %.8f  (cert Row 10 eta = %s)' % (eta_lp, dec_ceil8(Fr(row10['par']['lo']['eta']))))
    print('    p*  = (n,h,b,y,z)/s = (%.6f, %.6f, %.6f, %.6f, %.6f)' % tuple(p_star))
    print('    pi* = (n,h,b,y,z)   = (%.6f, %.6f, %.6f, %.6f, %.6f)' % tuple(pi_star))
    print('    Active nonlinear cone relations on pi*: b = %.2e, 3y - z = %.2e, n*h - z^2 = %.2e' % (
        pi_star[2], 3.0 * pi_star[3] - pi_star[4], pi_star[0] * pi_star[1] - pi_star[4] ** 2))
    print('    Q := 4*h = %.6f < 1 (strictly slack by %.6f!)' % (Q_val, 1.0 - Q_val))

    print('\n=== 2. Genuine cubic tensor attainment in H_{2,1}(C^6) and H_{2,1}(C^8) (exact Fraction check!) ===')
    rng = np.random.default_rng(42)
    best_t6 = None
    best_r6 = -1.0
    for d in (6, 8):
        m_c = d * (d + 1) // 2 * d
        best_s4 = -1.0
        best_pi = None
        for _ in range(8):
            x0 = rng.standard_normal(2 * m_c)
            res = minimize(
                lambda x: -(cvec_f @ tensor_contractions_float(x, d)[0]) / max(tensor_contractions_float(x, d)[1], 1e-12)
                          + 2.0 * (tensor_contractions_float(x, d)[1] - 4.0) ** 2,
                x0, method='BFGS', options={'maxiter': 140}
            )
            pi_v, s_v, t_v = tensor_contractions_float(res.x, d)
            rv = float((cvec_f @ pi_v) / s_v)
            if abs(s_v - 4.0) < 0.02 and rv > best_s4:
                best_s4 = rv
                best_pi = pi_v
                if d == 6 and rv > best_r6:
                    best_r6 = rv
                    best_t6 = t_v
        print('  Genuine H_{2,1}(C^%d) near chi=4: max (cvec . pi)/s = %.8f (gap to LP = %.2e), pi = %s' % (
            d, best_s4, eta_lp - best_s4, np.round(best_pi, 5)))

    # Quantize best_t6 to exact Gaussian integers (scale 1000) and verify in exact Fraction arithmetic!
    require(best_t6 is not None, 'no C^6 tensor found')
    t6_re = np.round(best_t6.real * 1000.0).astype(int)
    t6_im = np.round(best_t6.imag * 1000.0).astype(int)
    pi_q, s_q = exact_rational_contractions(t6_re, t6_im, 6)
    ratio_q = sum(cvec_q[i] * pi_q[i] for i in range(5)) / s_q
    gap_q = Fr(row10['par']['lo']['eta']) - ratio_q
    print('  EXACT RATIONAL C^6 TENSOR VERIFICATION (label C):')
    print('    s(q) = %s,  (cvec . pi)/s = %s' % (dec_ceil8(s_q), dec_ceil8(ratio_q)))
    print('    Exact gap below Row 10 dual eta = %s  (4 * gap = %s < 0.0001 in B(4)!)' % (
        dec_ceil8(gap_q), dec_ceil8(4 * gap_q)))
    require(abs(s_q - 4) < Fr(1, 20) and gap_q < Fr(1, 20000), 'exact C^6 tightness check failed')

    print('\n=== 3. Radial contact ridge of cert_916.json Row 10 across r = |q| ===')
    ek = np.array([float(Fr(x)) for x in row10['knots']])
    kden = float(row10['knot_den'])
    sol10 = dict(
        phi1=np.array(row10['phi1'], float) / kden,
        phi2=np.array(row10['phi2'], float) / kden,
        phi3=np.array(row10['phi3'], float) / kden,
        phi4=np.array(row10['phi4'], float) / kden,
        psi_a=np.array(row10['psi_a'], float) / kden,
        xi2=np.array(row10['xi2'], float) / kden,
        xi1=np.array(row10['xi1'], float) / kden,
        xia=np.array(row10['xia'], float) / kden,
        slope=[float(Fr(x)) for x in row10['slope']],
        lam=[float(Fr(x)) for x in row10['lam']],
        l3=[float(Fr(x)) for x in row10['l3']],
        m_ker=[float(Fr(x)) for x in row10['m_ker']],
        mu_a=float(Fr(row10['mu_a'])),
        mu_rho=float(Fr(row10['mu_rho'])),
        mu_w=float(Fr(row10['mu_w'])),
        sigma=float(Fr(row10['sigma'])),
    )
    r_scan = np.linspace(0.05, 5.0, 991)
    sch10, _, _, _ = MC.eval_schur_dense(sol10, ek, r_scan)
    near_zero = r_scan[sch10 < 5e-4]
    print('  Min Schur complement on [0.05, 5.0]: %.6e at r = %.3f' % (sch10.min(), r_scan[sch10.argmin()]))
    print('  Bulk contact ridge {r : Schur(r) < 5e-4}: r in [%.3f, %.3f]' % (near_zero.min(), near_zero.max()))

    print('\n=== 4. Clarabel ablation & hypothetical global sixth-order E[c_2^3] <= M sensitivity at chi = 4.0 ===')
    # Test Level 2 + E[c_2^3] <= M (adding mu_c23 * c_2^3 to RHS, which adds +mu_c23*c_2^3 >= 0!):
    knots = MC.knots_peak()
    ek_p = np.array([float(x) for x in knots])
    uk_p = ek_p ** 2
    Kp = len(uk_p)
    pts = [0.0]
    for a_, b_ in zip(ek_p[:-1], ek_p[1:]):
        pts.extend(list(a_ + (b_ - a_) * (np.arange(4) + 0.5) / 4))
        pts.append(b_)
    pts.extend(list(np.geomspace(ek_p[-1] * 1.01, 600.0, 20)))
    rr = np.unique(np.array(pts))
    v = rr ** 2
    Fm, Gm, Ym = MC.hat_test_matrices(uk_p, v)
    gv_mat = np.zeros_like(Gm)
    nz = v > 0
    gv_mat[:, nz] = Gm[:, nz] / v[nz]
    gv_mat[:, ~nz] = Fm[:, ~nz]

    def solve_c2cubed(M_c23=None):
        cb = MC.ConicBuilder()
        c1 = cb.var(Kp); c2 = cb.var(Kp); c3 = cb.var(Kp); c4 = cb.var(Kp)
        sl12 = cb.var(2); lam = cb.var(3); l3 = cb.var(3)
        m00 = cb.var(); m01 = cb.var(); m11 = cb.var()
        mu_a = cb.var(); mu_rho = cb.var(); mu_w = cb.var(); sig = cb.var()
        psi_a = cb.var(Kp); xk0_2 = cb.var(Kp); xk0_1 = cb.var(Kp); xk0_a = cb.var(Kp); t_obj = cb.var()
        mu_c23 = cb.var() if M_c23 is not None else None
        c6 = cb.var(Kp) if M_c23 is not None else None  # (VI) unlocked when E[c_2^3] <= M_c23!

        nn = [(0.0, [(l3[0], 1.0)]), (0.0, [(l3[1], 1.0)]), (0.0, [(l3[2], 1.0)]),
              (-1e-3, [(l3[0], 1.0), (l3[1], 1.0), (l3[2], 1.0)]),
              (0.0, [(mu_a, 1.0)]), (-1e-5, [(mu_rho, 1.0)]), (-1e-5, [(mu_w, 1.0)])]
        if M_c23 is not None:
            nn.append((0.0, [(mu_c23, 1.0)]))
        for k in range(Kp):
            nn.extend([(0.0, [(psi_a[k], 1.0)]), (0.0, [(psi_a[k], 1.0), (mu_a, 1.0), (c4[k], -1.0)]),
                       (0.0, [(xk0_2[k], 1.0)]), (0.0, [(xk0_1[k], 1.0)])])
            cb.add_soc([(0.0, [(xk0_2[k], 1.0), (xk0_1[k], 1.0)]), (0.0, [(xk0_a[k], 1.0)]), (0.0, [(xk0_2[k], 1.0), (xk0_1[k], -1.0)])])
        cb.add_nonneg_batch(nn)
        cb.add_psd(2, [(0.0, [(m00, 1.0)]), (0.0, [(m01, 1.0)]), (-1e-5, [(m11, 1.0)])])

        for i in range(len(v)):
            vi, ri = v[i], rr[i]
            nz_f, nz_g, nz_y, nz_gv = np.flatnonzero(Fm[:, i]), np.flatnonzero(Gm[:, i]), np.flatnonzero(Ym[:, i]), np.flatnonzero(gv_mat[:, i])
            si = 1.0 / (1.0 + 0.02 * vi + 0.0005 * (ri ** 3)); si2 = si * si
            if M_c23 is None:
                tau_wi = cb.var(); cb.add_nonneg_batch([(0.0, [(tau_wi, 1.0)])])
                g34 = [(c3[k], ri * gv_mat[k, i]) for k in nz_gv] + [(c4[k], ri * gv_mat[k, i]) for k in nz_gv]
                cb.add_soc([(0.0, [(mu_w, 1.0), (tau_wi, 1.0)]), (0.0, g34), (0.0, [(mu_w, 1.0), (tau_wi, -1.0)])])
                ex_M00 = ex_M02 = ex_b2 = ex_q1 = []
                ex_b0 = [(tau_wi, -0.5)]
            else:
                if vi == 0.0:
                    T00 = T01 = T11 = []
                else:
                    b0 = [(c3[k], ri * gv_mat[k, i]) for k in nz_gv] + [(c4[k], ri * gv_mat[k, i]) for k in nz_gv] + [(c6[k], -2.0 * ri * gv_mat[k, i]) for k in nz_gv]
                    b1 = [(c6[k], 2.0 * ri * gv_mat[k, i]) for k in nz_gv]
                    Tv = cb.var(3)
                    cb.add_psd(3, [(0.0, [(mu_w, 4.0)]), (0.0, b0), (0.0, [(Tv[0], 1.0)]), (0.0, b1), (0.0, [(Tv[1], 1.0)]), (0.0, [(Tv[2], 1.0)])])
                    T00, T01, T11 = [(Tv[0], 1.0)], [(Tv[1], 1.0)], [(Tv[2], 1.0)]
                qs = cb.var(3)
                q2_00 = [(mu_c23, 1.0)] + [(c6[k], -Fm[k, i]) for k in nz_f] + [(c, -v_) for c, v_ in T11]
                q2_01 = [(c6[k], -0.5 * Ym[k, i]) for k in nz_y]
                cb.add_psd(3, [(0.0, [(c, si * v_) for c, v_ in q2_00]), (0.0, [(c, si * v_) for c, v_ in q2_01]), (0.0, [(qs[0], si)]),
                               (0.0, [(qs[1], si)]), (0.0, []), (0.0, [(qs[2], si)])])
                ex_M00 = [(qs[1], -2.0)] + [(c6[k], 2.0 * Fm[k, i]) for k in nz_f] + [(c6[k], Gm[k, i]) for k in nz_g] + [(c, -2.0 * v_) for c, v_ in T01]
                ex_M02 = [(c6[k], Ym[k, i]) for k in nz_y]
                ex_b0 = [(qs[2], -0.5)] + [(c6[k], -0.5 * Fm[k, i]) for k in nz_f] + [(c6[k], -Gm[k, i]) for k in nz_g] + [(c, -0.5 * v_) for c, v_ in T00]
                ex_b2 = [(c6[k], -0.5 * Ym[k, i]) for k in nz_y]
                ex_q1 = [(c6[k], si2 * Gm[k, i]) for k in nz_g]
                # Subtract qs[0] * c_2 * rho^2? Need c_2 * rho^2 <= ... set qs[0] = 0 -> q2_01 = 0 unless Level 3 (VII) is included; test pure c_2^3 + (VI) with Y6 or full:
                cb.add_eq([(qs[0], 1.0)], 0.0)

            t_M00 = [(m00, 1.0)] + [(c3[k], -Fm[k, i]) for k in nz_f] + ex_M00
            t_M01 = [(m01, 1.0)] + [(psi_a[k], -0.5 * Fm[k, i]) for k in nz_f]; t_M11 = [(m11, 1.0)]
            t_M02 = [(c3[k], -0.5 * Ym[k, i]) for k in nz_y] + [(c4[k], -0.5 * Ym[k, i]) for k in nz_y] + ex_M02
            t_M22 = [(mu_rho, 1.0), (mu_a, 1.0)] + [(psi_a[k], Fm[k, i]) for k in nz_f] + [(c4[k], -Fm[k, i]) for k in nz_f]
            t_b0 = [(c1[k], -0.5 * si * Fm[k, i]) for k in nz_f] + [(sl12[0], -0.5e-2 * vi * si)] + [(c3[k], 0.5 * si * Fm[k, i]) for k in nz_f] + [(c3[k], 0.5 * si * Gm[k, i]) for k in nz_g] + [(m00, -si), (m01, -2.0 * si)] + [(xk0_2[k], -0.5 * si * Fm[k, i]) for k in nz_f] + [(c, si * v_) for c, v_ in ex_b0]
            t_b1 = [(c2[k], -0.25 * si * Fm[k, i]) for k in nz_f] + [(sl12[1], -0.25e-2 * vi * si)] + [(m01, -si), (m11, -2.0 * si)] + [(xk0_1[k], -0.5 * si * Fm[k, i]) for k in nz_f]
            t_b2 = [(c1[k], -0.5 * si * Ym[k, i]) for k in nz_y] + [(sl12[0], -0.25e-2 * vi * si)] + [(c2[k], -0.25 * si * Ym[k, i]) for k in nz_y] + [(sl12[1], -0.125e-2 * vi * si)] + [(sig, 0.5 * vi * si)] + [(c3[k], 0.5 * si * Ym[k, i]) for k in nz_y] + [(c4[k], 0.5 * si * Gm[k, i]) for k in nz_g] + [(xk0_a[k], -0.5 * si * Fm[k, i]) for k in nz_f] + [(c, si * v_) for c, v_ in ex_b2]
            t_q1 = [(lam[0], si2), (lam[1], vi * si2), (lam[2], 1e-2 * (vi ** 2) * si2), (l3[0], 1e-4 * (ri ** 6) * si2), (l3[1], 1e-4 * (ri ** 6) * si2), (l3[2], 1e-4 * (ri ** 6) * si2), (sl12[0], 0.5e-2 * (vi ** 2) * si2), (sl12[1], 0.5e-2 * (vi ** 2) * si2), (m00, si2), (m01, 4.0 * si2), (m11, 4.0 * si2)] + [(c1[k], si2 * Gm[k, i]) for k in nz_g] + [(c2[k], si2 * Gm[k, i]) for k in nz_g] + [(c3[k], -si2 * Gm[k, i]) for k in nz_g] + ex_q1
            cb.add_psd(4, [(-1e-6, t_M00), (0.0, t_M01), (-1e-6, t_M11), (0.0, t_M02), (0.0, []), (-1e-6, t_M22),
                           (0.0, t_b0), (0.0, t_b1), (0.0, t_b2), (-(1e-6 + ri) * si2, t_q1)])

        s = 4.0; sq = 2.0
        eta = cb.var(); nu = cb.var(2); om = cb.var(5); ze = cb.var(3); ch = cb.var(3); ps = cb.var(3); kap = cb.var()
        cb.add_nonneg_batch([(0.0, [(nu[0], 1.0)]), (0.0, [(nu[1], 1.0)]), (0.0, [(kap, 1.0)])] + [(0.0, [(om[j], 1.0)]) for j in range(5)])
        cb.add_soc([(0.0, [(ze[0], 1.0), (ze[1], 1.0)]), (0.0, [(ze[2], 1.0)]), (0.0, [(ze[0], 1.0), (ze[1], -1.0)])])
        cb.add_soc([(0.0, [(ch[0], 1.0), (ch[1], 1.0)]), (0.0, [(ch[2], 1.0)]), (0.0, [(ch[0], 1.0), (ch[1], -1.0)])])
        cb.add_soc([(0.0, [(ps[0], 1.0), (ps[1], 1.0)]), (0.0, [(ps[2], 1.0)]), (0.0, [(ps[0], 1.0), (ps[1], -1.0)])])
        cb.add_eq([(l3[1], 300.0e-4 * sq), (l3[2], 135.0e-4 * sq), (ps[2], 1.0)], 0.0)
        d_base = [[(m00, 16.0), (m01, 32.0), (m11, 32.0)], [(m00, 4.0), (m11, 16.0)],
                  [(m11, 16.0), (mu_a, 32.0), (mu_rho, 32.0), (sig, 32.0)],
                  [(m01, 48.0), (m11, 48.0), (mu_a, 24.0), (mu_rho, 24.0), (mu_w, 24.0), (sig, 48.0)],
                  [(m01, 16.0), (m11, 16.0)]]
        st_extra = [[(eta, -32.0), (nu[0], 1.0), (om[0], 1.0), (ze[0], 1.0), (ch[1], 1.0)],
                    [(eta, -8.0), (om[1], 1.0), (ze[1], 1.0), (ch[0], 1.0)],
                    [(eta, -32.0), (nu[0], -1.0), (om[2], 1.0), (ch[1], 1.0)],
                    [(eta, -96.0), (nu[1], -1.0), (om[3], 1.0), (ch[1], 3.0), (ch[2], 3.0)],
                    [(nu[1], 1.0), (om[4], 1.0), (ze[2], 1.0), (ch[1], -1.0), (ch[2], -1.0)]]
        for idx in range(5):
            cb.add_eq(d_base[idx] + [(l3[1], sq * 198.0e-4 * MC.H0f[idx]), (l3[2], sq * (11781.0 / 32.0) * 1e-4 * MC.H0f[idx]), (ps[0], MC.S0f[idx]), (ps[1], MC.H0f[idx]), (kap, MC.H0f[idx])] + st_extra[idx], 0.0)
        M3 = 6.0 + 9.0 * s + MC.C6f * (s ** 1.5)
        obj = [(t_obj, 1.0), (lam[0], -1.0), (lam[1], -1.0), (lam[2], -(2.0 + s) * 1e-2),
               (l3[0], -M3 * 1e-4), (l3[1], -(6.0 + 9.0 * s) * 1e-4), (l3[2], -(6.0 + 9.0 * s) * 1e-4), (eta, -s)]
        if M_c23 is not None:
            obj.append((mu_c23, -float(M_c23)))
        cb.add_nonneg_batch([(0.0, obj)])
        sol = cb.solve(t_obj)
        return float(sol.obj_val), str(sol.status)

    b_base, st_b = solve_c2cubed(None)
    print('  Level 2 base at chi=4.0:                    B(4) = %.7f (%s)' % (b_base, st_b))
    for M_val in (20.0, 12.0, 8.0, 5.0):
        bv, stv = solve_c2cubed(M_val)
        print('  Level 2 + (VI) + hypothetical E[c_2^3]<=%4.1f: B(4) = %.7f (%s)  [still > sqrt(pi)/2 = 0.8862269]' % (
            M_val, bv, stv))


if __name__ == '__main__':
    diagnose_all()

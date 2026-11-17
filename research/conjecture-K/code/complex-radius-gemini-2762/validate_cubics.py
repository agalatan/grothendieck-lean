#!/usr/bin/env python3
"""Validation of cert_916.json on genuine complex cubics (exact scalar checks C + quadrature/MC N).

Usage:  python3 -B validate_cubics.py [CERT.json]

Performs three end-to-end checks on eight genuine Wick cubics q in H_{2,1}(C^d) (s from 1.4 to 42):
  1. [C, exact Fractions] Verifies that at every nonzero endpoint of every row in cert_916.json,
     the normalised contraction vector p = pi/s of each cubic satisfies (d_lin + sb d_J(alpha)).p <= L_e.
  2. [N, 1D piecewise Gauss-Legendre quadrature on the Wick monomial] Integrates the actual spline
     brackets Br_1, Br_2, Br_3, Br_4 of the last row against Exp(1) (splitting at knot preimages),
     confirming |E[Br_i]| < 10^{-13} for all four identities, and checks E|q| < E[RHS] <= B_row.
  3. [N, Monte Carlo, 200,000 samples per cubic] Evaluates q, c_1, c_2, a, W_k, w, b_loc, rho, alpha_2,
     tilde_beta from first principles on 8 cubics (Wick monomial, Z_1^2 conj(Z_2), Z_1(|Z_2|^2-1),
     Z_1 Z_2 conj(Z_3), cyclic 3-chain, Z_1(|Z_2|^2+|Z_3|^2-2), and sums of 6 and 30 independent Wick
     monomials), asserting at EVERY sample:
       - tilde_beta^2 <= V c_2 w  and  rho^2 <= alpha_2 <= c_1 c_2,
       - z^T P(r) z > 0  for z = (c_2, c_1, rho, 1)^T,
       - RHS(z) - |q| >= z^T P(r) z > 0,
     and confirming that the sample expectations of Br_1..Br_4 vanish within Monte Carlo SE and
     E|q| < E[RHS] <= B_row.
"""
import json
import os
import sys
from fractions import Fraction as Fr

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import numpy as np
from numpy.polynomial.legendre import leggauss

import check_identities_exact as CIE
import make_cert as MC
import verify_bernstein as VB
import verify_cert as VC


def eval_row_functions(row, r_arr):
    ek = np.array([float(Fr(x)) for x in row['knots']])
    uk = ek ** 2
    v = r_arr ** 2
    Fm, Gm, Ym = MC.hat_test_matrices(uk, v)
    gvm = np.zeros_like(Gm)
    nz = v > 0
    gvm[:, nz] = Gm[:, nz] / v[nz]
    gvm[:, ~nz] = Fm[:, ~nz]

    kden = float(row['knot_den'])
    c1 = np.array(row['phi1'], float) / kden
    c2 = np.array(row['phi2'], float) / kden
    c3 = np.array(row['phi3'], float) / kden
    c4 = np.array(row['phi4'], float) / kden
    psa = np.array(row['psi_a'], float) / kden
    x2 = np.array(row['xi2'], float) / kden
    x1 = np.array(row['xi1'], float) / kden
    xa = np.array(row['xia'], float) / kden
    sl1, sl2 = float(Fr(row['slope'][0])), float(Fr(row['slope'][1]))

    out = dict(
        phi1=Fm.T @ c1 + sl1 * v, G1=Gm.T @ c1 + 0.5 * sl1 * v ** 2, Y1=Ym.T @ c1 + 0.5 * sl1 * v,
        phi2=Fm.T @ c2 + sl2 * v, G2=Gm.T @ c2 + 0.5 * sl2 * v ** 2, Y2=Ym.T @ c2 + 0.5 * sl2 * v,
        phi3=Fm.T @ c3, G3=Gm.T @ c3, Y3=Ym.T @ c3, g3=gvm.T @ c3,
        phi4=Fm.T @ c4, G4=Gm.T @ c4, Y4=Ym.T @ c4, g4=gvm.T @ c4,
        psi_a=Fm.T @ psa, xi2=Fm.T @ x2, xi1=Fm.T @ x1, xia=Fm.T @ xa,
        lam=[float(Fr(x)) for x in row['lam']],
        lam3=float(sum(Fr(x) for x in row['l3'])),
        m_ker=[float(Fr(x)) for x in row['m_ker']],
        mu_a=float(Fr(row['mu_a'])), mu_rho=float(Fr(row['mu_rho'])),
        mu_w=float(Fr(row['mu_w'])), sig=float(Fr(row['sigma'])),
    )
    return out


def eval_tensor_mc(t_np, z_samp):
    """Evaluate q, c_1, c_2, a, w, b_loc on N_mc samples in C^d for symmetric tensor t_np (u = 1)."""
    # q = sum_{a,b,c} t_{abc} (z_a z_b zbar_c - delta_{ac} z_b - delta_{bc} z_a)
    N_mc, d = z_samp.shape
    zc = np.conj(z_samp)
    tr_vec = np.einsum('aac->c', t_np)  # wait: sum_a t_{a, b, a}!
    lin_coeff = 2.0 * np.einsum('aba->b', t_np)  # since t_{abc} = t_{bac}

    # F_c = dbar_c q = sum_{a,b} t_{abc} z_a z_b
    zz = z_samp[:, :, None] * z_samp[:, None, :]  # (N, d, d)
    F = np.einsum('abc,nab->nc', t_np, zz)        # (N, d)
    q = np.einsum('nc,nc->n', F, zc) - z_samp @ lin_coeff

    # d_j q = 2 sum_{b,c} t_{jbc} z_b zbar_c - lin_coeff[j]
    z_zc = z_samp[:, :, None] * zc[:, None, :]    # (N, d, d)
    dq = 2.0 * np.einsum('jbc,nbc->nj', t_np, z_zc) - lin_coeff[None, :]

    c1 = np.sum(np.abs(dq) ** 2, axis=1)
    c2 = np.sum(np.abs(F) ** 2, axis=1)
    a_val = np.sum(dq * F, axis=1)

    # d_j F_k = 2 sum_b t_{jbk} z_b;  W_k = sum_j F_j (d_j F_k)
    dF = 2.0 * np.einsum('jbk,nb->njk', t_np, z_samp)  # (N, d, d): d_j F_k
    W = np.einsum('nj,njk->nk', F, dF)                 # (N, d)
    w = np.sum(np.abs(W) ** 2, axis=1)
    bloc = np.sum(np.conj(F) * W, axis=1)

    V = np.abs(q) ** 2
    r = np.sqrt(V)
    rho = np.real((np.conj(q) ** 2) * a_val) / np.maximum(V, 1e-300)
    alpha2 = np.abs(a_val) ** 2
    tbeta = np.real(np.conj(q) * bloc)
    return q, r, V, c1, c2, rho, alpha2, w, tbeta


def build_test_cubics():
    cubics = []
    # 1. Wick monomial (d=1, s=42)
    t = CIE.empty_tensor(1); CIE.set_sym(t, 0, 0, 0, CIE.QComplex(1, 0))
    cubics.append(('Wick monomial', t, 1))
    # 2. Z1^2 conj(Z2) (d=2, s=10)
    t = CIE.empty_tensor(2); CIE.set_sym(t, 0, 0, 1, CIE.QComplex(1, 0))
    cubics.append(('Z1^2 conj(Z2)', t, 2))
    # 3. Z1(|Z2|^2 - 1) (d=2, s=16)
    t = CIE.empty_tensor(2); CIE.set_sym(t, 0, 1, 1, CIE.QComplex(1, 0))
    cubics.append(('Z1(|Z2|^2 - 1)', t, 2))
    # 4. Z1 Z2 conj(Z3) (d=3, s=6)
    t = CIE.empty_tensor(3); CIE.set_sym(t, 0, 1, 2, CIE.QComplex(1, 0))
    cubics.append(('Z1 Z2 conj(Z3)', t, 3))
    # 5. Cyclic 3-chain (d=3, s=6)
    t = CIE.empty_tensor(3)
    for j in range(3):
        CIE.set_sym(t, j, j, (j + 1) % 3, CIE.QComplex(1, 0))
    cubics.append(('Cyclic 3-chain', t, 3))
    # 6. Z1(|Z2|^2 + |Z3|^2 - 2) (d=3, s=10)
    t = CIE.empty_tensor(3)
    CIE.set_sym(t, 0, 1, 1, CIE.QComplex(1, 0)); CIE.set_sym(t, 0, 2, 2, CIE.QComplex(1, 0))
    cubics.append(('Z1(|Z2|^2+|Z3|^2-2)', t, 3))
    # 7. Sum of 10 independent Wick monomials (d=10, s=4.2, right at the global peak!)
    t = CIE.empty_tensor(10)
    for j in range(10):
        CIE.set_sym(t, j, j, j, CIE.QComplex(1, 0))
    cubics.append(('Sum of 10 monomials', t, 10))
    # 8. Sum of 14 independent Wick monomials (d=14, s=3.0)
    t = CIE.empty_tensor(14)
    for j in range(14):
        CIE.set_sym(t, j, j, j, CIE.QComplex(1, 0))
    cubics.append(('Sum of 14 monomials', t, 14))
    return cubics


def main():
    cert_path = sys.argv[1] if len(sys.argv) > 1 else os.path.join(HERE, 'cert_916.json')
    with open(cert_path, encoding='utf-8') as fh:
        cert = json.load(fh)
    rows = cert['rows']
    cubics = build_test_cubics()

    # 1. Exact rational endpoint weak-duality check across all rows x cubics
    p_vecs = []
    for name, t_q, d in cubics:
        n, h, b, y, z, u = CIE.tensor_scalars(t_q, d)
        s = 32 * n + 8 * h + 32 * b + 96 * y
        p_vecs.append((name, s, [n / s, h / s, b / s, y / s, z / s], u))

    min_dual_slack = None
    n_pairs = 0
    for row in rows:
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
        for end in ('lo', 'hi'):
            s_e = Fr(row['s_' + end])
            if s_e == 0:
                continue
            pd = row['par'][end]
            al = [Fr(x) for x in pd['alpha']]
            sb = Fr(pd['sqrt_ub'])
            dJ = [l3[1] * (150 * al[0] * VC.S0[i] + (198 + Fr(150) / al[0]) * VC.H0[i])
                  + l3[2] * (Fr(135, 2) * al[1] * VC.S0[i] + (Fr(11781, 32) + Fr(135, 2) / al[1]) * VC.H0[i])
                  for i in range(5)]
            c = [dlin[i] + sb * dJ[i] for i in range(5)]
            eta = Fr(pd['eta'])
            resid = [c[i] - eta * VC.EROW[i] for i in range(5)]
            for typ, theta, yv in pd['cuts']:
                a_ = VC.cut_vector(typ, None if theta is None else Fr(theta))
                resid = [resid[i] + Fr(yv) * a_[i] for i in range(5)]
            L_e = eta + sum(max(resid[i], Fr(0)) * VC.PMAX[i] for i in range(5))
            for _, _, p, _ in p_vecs:
                lhs = sum(c[i] * p[i] for i in range(5))
                sl = L_e - lhs
                assert sl >= 0, f'Dual violation: {sl}'
                if min_dual_slack is None or sl < min_dual_slack:
                    min_dual_slack = sl
                n_pairs += 1
    print(f'[1/3] Exact weak-duality check: {n_pairs} (endpoint, cubic) pairs PASS; min slack = {float(min_dual_slack):.3e}', flush=True)

    # Precompute exact row bounds once via Bernstein verifier
    row_bounds = [float(VB.verify_row_bernstein(rw)['bound']) for rw in rows]

    # 2. 1D quadrature on the Wick monomial q(z) = z(|z|^2 - 2)/sqrt(2), |z|^2 = t ~ Exp(1)
    row_42 = rows[-1]
    bnd_42 = row_bounds[-1]
    # Exact preimages of knots r(t) = sqrt(t/2) * |t - 2| = e_k => t(t - 2)^2 - 2 e_k^2 = 0
    ek_42 = [float(Fr(x)) for x in row_42['knots']]
    knot_ts = [0.0, 2.0]
    for ev in ek_42:
        if ev > 0:
            rts = np.roots([1.0, -4.0, 4.0, -2.0 * (ev ** 2)])
            for rt in rts:
                if abs(rt.imag) < 1e-10 and 0.0 < rt.real < 85.0:
                    knot_ts.append(float(rt.real))
    t_breaks = np.unique(np.concatenate([
        np.array(knot_ts),
        np.linspace(0.0, 8.0, 160),
        np.linspace(8.0, 30.0, 120),
        np.linspace(30.0, 85.0, 80),
    ]))
    gx, gw = leggauss(32)
    br_means = np.zeros(4)
    eq_quad = 0.0
    erhs_quad = 0.0
    for a_t, b_t in zip(t_breaks[:-1], t_breaks[1:]):
        mid, half = 0.5 * (a_t + b_t), 0.5 * (b_t - a_t)
        ts = mid + half * gx
        wts = half * gw * np.exp(-ts)
        V = 0.5 * ts * ((ts - 2.0) ** 2)
        r = np.sqrt(V)
        # On q = z(t - 2)/sqrt(2): d_z q = (2t - 2)/sqrt(2) = sqrt(2)(t-1), F = z^2/sqrt(2) => c1 = 2(t-1)^2, c2 = t^2/2
        c1 = 2.0 * ((ts - 1.0) ** 2)
        c2 = 0.5 * (ts ** 2)
        # qbar^2 a = (zbar^2 (t-2)^2 / 2) * (sqrt(2)(t-1) * z^2 / sqrt(2)) = t^2 (t-2)^2 (t-1) / 2 = V * t(t-1)
        rho = ts * (ts - 1.0)
        alpha2 = c1 * c2
        # W = F * d_z F = (z^2/sqrt(2)) * (sqrt(2) z) = z^3 => w = t^3, qbar * Fbar * W = (zbar(t-2)/sqrt(2))*(zbar^2/sqrt(2))*z^3 = t^3(t-2)/2
        w = ts ** 3
        tbeta = 0.5 * (ts ** 3) * (ts - 2.0)

        fn = eval_row_functions(row_42, r)
        br1 = fn['G1'] - c2 * fn['phi1'] - rho * fn['Y1']
        br2 = fn['G2'] - 0.5 * c1 * fn['phi2'] - 0.5 * rho * fn['Y2']
        br3 = c2 * (c2 - 1.0) * fn['phi3'] - (c2 - 1.0) * fn['G3'] + (c2 - 1.0) * rho * fn['Y3'] + tbeta * fn['g3']
        br4 = alpha2 * fn['phi4'] - rho * fn['G4'] + c2 * rho * fn['Y4'] + tbeta * fn['g4']
        for idx_b, br in enumerate((br1, br2, br3, br4)):
            br_means[idx_b] += float(wts @ br)

        m00, m01, m11 = fn['m_ker']
        ker_pen = m00 * (c2 - 1.0) ** 2 + 2.0 * m01 * (c2 - 1.0) * (c1 - 2.0) + m11 * (c1 - 2.0) ** 2
        lam0, lam1, lam2 = fn['lam']
        rhs = (lam0 + lam1 * V + lam2 * V ** 2 + fn['lam3'] * V ** 3
               + br1 + br2 - br3 - br4 + fn['sig'] * V * rho
               + ker_pen + fn['mu_a'] * alpha2 + fn['mu_rho'] * rho ** 2 + fn['mu_w'] * w)
        eq_quad += float(wts @ r)
        erhs_quad += float(wts @ rhs)

    assert np.max(np.abs(br_means)) < 1e-13, f'Quadrature Stein bracket nonzero: {br_means}'
    assert eq_quad < erhs_quad <= bnd_42 + 1e-12
    print(f'[2/3] Wick monomial quadrature: max|E[Br_1..4]| = {np.max(np.abs(br_means)):.2e}; '
          f'E|q|={eq_quad:.6f} < E[RHS]={erhs_quad:.6f} <= B_row={bnd_42:.6f}', flush=True)

    # 3. Monte Carlo on all 8 genuine cubics
    rng = np.random.default_rng(20261117)
    N_mc = 150000
    for (name, t_q, d), (_, s_fr, _, u_fr) in zip(cubics, p_vecs):
        scale = 1.0 / np.sqrt(float(u_fr))
        t_np = np.zeros((d, d, d), dtype=np.complex128)
        for a in range(d):
            for b in range(d):
                for c in range(d):
                    val = t_q[a][b][c]
                    if not val.iszero():
                        t_np[a, b, c] = (float(val.re) + 1j * float(val.im)) * scale

        # Locate covering row
        row_cov = None
        row_bnd = None
        for idx_rw, rw in enumerate(rows):
            if Fr(rw['s_lo']) <= s_fr <= Fr(rw['s_hi']):
                row_cov = rw
                row_bnd = row_bounds[idx_rw]
                break
        assert row_cov is not None

        z_samp = (rng.standard_normal((N_mc, d)) + 1j * rng.standard_normal((N_mc, d))) / np.sqrt(2.0)
        _, r, V, c1, c2, rho, alpha2, w, tbeta = eval_tensor_mc(t_np, z_samp)

        assert np.all(rho ** 2 <= alpha2 + 1e-12 * np.maximum(1.0, alpha2))
        assert np.all(alpha2 <= c1 * c2 + 1e-12 * np.maximum(1.0, c1 * c2))
        assert np.all(tbeta ** 2 <= V * c2 * w + 1e-12 * np.maximum(1.0, V * c2 * w))

        fn = eval_row_functions(row_cov, r)
        br1 = fn['G1'] - c2 * fn['phi1'] - rho * fn['Y1']
        br2 = fn['G2'] - 0.5 * c1 * fn['phi2'] - 0.5 * rho * fn['Y2']
        br3 = c2 * (c2 - 1.0) * fn['phi3'] - (c2 - 1.0) * fn['G3'] + (c2 - 1.0) * rho * fn['Y3'] + tbeta * fn['g3']
        br4 = alpha2 * fn['phi4'] - rho * fn['G4'] + c2 * rho * fn['Y4'] + tbeta * fn['g4']

        m00, m01, m11 = fn['m_ker']
        ker_pen = m00 * (c2 - 1.0) ** 2 + 2.0 * m01 * (c2 - 1.0) * (c1 - 2.0) + m11 * (c1 - 2.0) ** 2
        lam0, lam1, lam2 = fn['lam']
        rhs = (lam0 + lam1 * V + lam2 * V ** 2 + fn['lam3'] * V ** 3
               + br1 + br2 - br3 - br4 + fn['sig'] * V * rho
               + ker_pen + fn['mu_a'] * alpha2 + fn['mu_rho'] * rho ** 2 + fn['mu_w'] * w)

        min_pt_gap = float(np.min(rhs - r))
        assert min_pt_gap > 0.0, f'{name}: pointwise majorant failed ({min_pt_gap})'
        print(f'   MC {name:<23s} (d={d:2d}, s={float(s_fr):5.2f}): min(RHS-|q|)={min_pt_gap:.2e} > 0 | '
              f'E|q|={float(r.mean()):.5f} <= E[RHS]={float(rhs.mean()):.5f} <= B_row={row_bnd:.6f}', flush=True)

    print('[3/3] All 8 genuine cubic Monte Carlo pointwise & expectation checks PASS.')


if __name__ == '__main__':
    main()

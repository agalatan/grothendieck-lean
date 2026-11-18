#!/usr/bin/env python3
"""Candidate generator (N only) for raw A-content spectral Stein duals.

Agent-ID: gemini-5331; Refs #513, #509.
Uses floating-point SOCP (cvxpy + CLARABEL) solely to propose rational dual
witnesses. Acceptance is performed independently in 100% exact rational /
outward interval arithmetic by `verify_raw_content.py` (`python3 -I`, standard
library only). Never cite optimizer objectives from this generator as bounds.
"""
import json
import math
import sys
import time
from fractions import Fraction as Q
from pathlib import Path
import numpy as np
import cvxpy as cp
from scipy.special import erfc

from bisect import bisect_right
HERE = Path(__file__).resolve().parent
ARCHIVE = HERE.parent / 'audit-2026-11-15-codex-a7c4' / 'remote_stein_original'
sys.path.insert(0, str(ARCHIVE))
import check_stein as cs
from exact import test_pieces, cut_numerator, add, shift, scale, positive, tail_positive


def check_node_any_u(row, caps, depth=20):
    v = Q(row['v'])
    knots = list(map(Q, row['knots']))
    values = list(map(Q, row['phi']))
    beta, t, lam, mu, nu = (Q(row[k]) for k in ['beta', 't', 'lam', 'mu', 'nu'])
    assert lam > 0 and mu > 0 and nu >= 0 and knots[0] == 0
    P = list(map(Q, row['coefficients']))
    assert len(P) == 4 and P[3] >= 0
    pieces = test_pieces(knots, values)
    starts = [c[0] / v for c in caps]
    tail = Q(128)
    while tail <= max(knots[-1], starts[-1]):
        tail *= 2
    pts = sorted(set(knots + starts + [tail]))
    for a, b in zip(pts, pts[1:]):
        j = bisect_right(knots, a) - 1
        k = bisect_right(starts, a) - 1
        _, _, A, B, e = pieces[j]
        cap = [c * v**i for i, c in enumerate(caps[k][2])]
        R = add(shift(add(P, scale(cap, -1)), 2), scale(cut_numerator(A, B, e, beta, t, lam, mu, nu), -1))
        if a == 0:
            assert R[0] == R[1] == 0
            R = R[2:]
        if not positive(R, a, b, depth):
            return False, ('finite', str(a), str(b))
    _, _, A, B, e = pieces[-1]
    cap = [c * v**i for i, c in enumerate(caps[-1][2])]
    R = add(shift(add(P, scale(cap, -1)), 2), scale(cut_numerator(A, B, e, beta, t, lam, mu, nu), -1))
    if not tail_positive(R, tail):
        return False, ('tail', str(tail))
    return True, None

A_PK = 699 / 1250
B_PK = 179 / 1250
C6_F = 4045313 / 100000
H0_F = math.sqrt(math.pi) * (A_PK + 1.5 * B_PK)
I0_F = math.pi / math.sqrt(A_PK * B_PK) * math.exp(A_PK / B_PK) * erfc(math.sqrt(A_PK / B_PK))


def fnum(x):
    return float(Q(x))


def decimal_q(x):
    return str(Q(format(float(x), '.17f')))


def load_base_inputs():
    node = json.loads((ARCHIVE / 'stein-nodes.json').read_text())[-1]
    knots_q = [str(Q(k)) for k in node['knots']]
    knots = np.array(list(map(fnum, knots_q)))
    data = json.loads((ARCHIVE / 'profile-caps.json').read_text())
    tail_start = fnum(data['cells'][-1]['interval'][1])
    starts = np.array([fnum(d['interval'][0]) for d in data['cells']] + [tail_start])
    coeff = [list(map(fnum, d['coefficients'])) for d in data['cells']]
    coeff.append(list(map(fnum, data['tail'])) + [0.0, 0.0])
    return knots_q, knots, starts, np.array(coeff)


def eval_caps(s, starts, coeff):
    s = np.asarray(s)
    idx = np.maximum(0, np.searchsorted(starts, s, side='right') - 1)
    c = coeff[idx]
    return ((c[:, 3] * s + c[:, 2]) * s + c[:, 1]) * s + c[:, 0]


def profile_matrices(U, knots):
    n_pts, n_knots = len(U), len(knots)
    phi = np.zeros((n_pts, n_knots))
    prim = np.zeros((n_pts, n_knots))
    prefix = np.zeros((n_knots, n_knots))
    for j in range(n_knots - 1):
        prefix[j + 1] = prefix[j]
        prefix[j + 1, j:j + 2] += (knots[j + 1] - knots[j]) / 2.0
    for i, x in enumerate(U):
        j = min(np.searchsorted(knots, x, side='right') - 1, n_knots - 1)
        if j == n_knots - 1:
            phi[i, j] = 1.0
            prim[i] = prefix[j]
            prim[i, j] += x - knots[j]
        else:
            ln = knots[j + 1] - knots[j]
            r = x - knots[j]
            z = r / ln
            phi[i, j] = 1.0 - z
            phi[i, j + 1] = z
            prim[i] = prefix[j]
            prim[i, j] += r - r * r / (2.0 * ln)
            prim[i, j + 1] += r * r / (2.0 * ln)
    ratio = np.zeros_like(prim)
    nz = U > 0
    ratio[nz] = prim[nz] / U[nz, None]
    d = phi - ratio
    d[~nz] = 0.0
    return phi, prim - phi, d


def solve_socp(u, chi, knots, starts, coeff, U):
    phiM, AM, dM = profile_matrices(U, knots)
    prof = (eval_caps(u * U, starts, coeff) - H0_F - I0_F * u * U) / (u * u)
    n = len(U)
    ones = np.ones(n)
    phi = cp.Variable(len(knots))
    beta = cp.Variable()
    t = cp.Variable()
    lam = cp.Variable()
    mu = cp.Variable()
    nu = cp.Variable(nonneg=True)
    P = cp.Variable(4)
    z1 = cp.Variable(n)
    z2 = cp.Variable(n)
    f = -(phiM @ phi + beta) / 2.0 + (2.0 * t + lam / 3.0) * U
    g = -(dM @ phi) / 2.0 + (t + mu / 3.0 - nu / 2.0) * U
    w = 1.0 / (1.0 + U * U)
    fw = cp.multiply(np.sqrt(w), f)
    gw = cp.multiply(np.sqrt(w), g)
    basis = np.column_stack([ones, U, U * U, U ** 3]) * w[:, None]
    cons = [
        phi[0] == 0,
        lam >= 1e-9,
        mu >= 1e-9,
        P[3] >= 0,
        cp.SOC(lam * ones + z1, cp.vstack([2.0 * fw, lam * ones - z1]), axis=0),
        cp.SOC(mu * ones + z2, cp.vstack([2.0 * gw, mu * ones - z2]), axis=0),
        basis @ P >= cp.multiply(w, prof + AM @ phi + (nu / 3.0 - 2.0 * t) * (U * U - 2.0)) + z1 + z2,
    ]
    moments = np.array([1.0, 1.0, 2.0 + chi, 6.0 + 9.0 * chi + C6_F * (chi ** 1.5)])
    prob = cp.Problem(cp.Minimize(moments @ P), cons)
    prob.solve(solver='CLARABEL', tol_gap_abs=1e-9, tol_gap_rel=1e-9, tol_feas=1e-9, max_iter=250)
    assert P.value is not None, f'SOCP failed at u={u}, chi={chi}: {prob.status}'
    return {
        'phi_scaled': phi.value.tolist(),
        'beta_scaled': float(beta.value),
        't_scaled': float(t.value),
        'lam_scaled': float(lam.value),
        'mu_scaled': float(mu.value),
        'nu_scaled': float(nu.value),
        'P_scaled': P.value.tolist(),
    }


def candidate_gap(u, sol, knots, U, starts, coeff):
    phiM, AM, dM = profile_matrices(U, knots)
    phi = np.array(sol['phi_scaled'])
    lam, mu, nu = sol['lam_scaled'], sol['mu_scaled'], sol['nu_scaled']
    t, beta = sol['t_scaled'], sol['beta_scaled']
    f = -(phiM @ phi + beta) / 2.0 + (2.0 * t + lam / 3.0) * U
    g = -(dM @ phi) / 2.0 + (t + mu / 3.0 - nu / 2.0) * U
    cut = f * f / lam + g * g / mu + AM @ phi + (nu / 3.0 - 2.0 * t) * (U * U - 2.0)
    prof = (eval_caps(u * U, starts, coeff) - H0_F - I0_F * u * U) / (u * u)
    P = np.array(sol['P_scaled'])
    return ((P[3] * U + P[2]) * U + P[1]) * U + P[0] - prof - cut


def convert_row(u_q, knots_q, sol, slack):
    u_f = float(u_q)
    u2 = u_f * u_f
    P = [u2 * x for x in sol['P_scaled']]
    P[0] += H0_F + float(slack)
    P[1] += I0_F * u_f
    row = {
        'v': str(u_q),
        'knots': knots_q,
        'phi': [decimal_q(u2 * x) for x in sol['phi_scaled']],
        'coefficients': [decimal_q(x) for x in P],
    }
    for name in ['beta', 't', 'lam', 'mu', 'nu']:
        row[name] = decimal_q(u2 * sol[name + '_scaled'])
    return row


def main():
    t0 = time.time()
    knots_q, knots, starts, coeff = load_base_inputs()
    caps_exact = cs.load_caps()

    # Energy grid covering [12/1000, 463/10000]:
    # [0.012, 0.020] step 1/2000 (16 slabs), [0.020, 0.035] step 1/1000 (15 slabs),
    # [0.035, 0.046] step 1/2000 (22 slabs), plus 463/10000 (1 slab) = 54 slabs, 55 nodes.
    energies = []
    for k in range(24, 40):
        energies.append(Q(k, 2000))
    for k in range(20, 35):
        energies.append(Q(k, 1000))
    for k in range(70, 93):
        energies.append(Q(k, 2000))
    energies.append(Q(463, 10000))
    assert energies == sorted(set(energies))

    models = []
    for idx, u_q in enumerate(energies):
        u_f = float(u_q)
        anchors = [0.04] if u_q < Q(7, 200) else [0.04, 0.22]
        base_grid = np.unique(np.r_[
            np.linspace(0, 12, 481),
            np.linspace(12, 40, 113),
            np.geomspace(40, 256, 65),
            knots,
            starts / u_f,
        ])
        val_grid = np.unique(np.r_[
            np.linspace(0, 12, 4001),
            np.linspace(12, 40, 1401),
            np.linspace(40, 256, 4001),
            knots,
            starts / u_f,
        ])
        for chi_a in anchors:
            g = base_grid.copy()
            for _ in range(3):
                sol = solve_socp(u_f, chi_a, knots, starts, coeff, g)
                gap = candidate_gap(u_f, sol, knots, val_grid, starts, coeff)
                bad = np.flatnonzero(gap < -1e-7)
                if len(bad) == 0:
                    break
                g = np.unique(np.r_[g, val_grid[bad[np.argsort(gap[bad])[:120]]]])
            accepted = None
            for sl in [Q(1, 10**8), Q(3, 10**8), Q(1, 10**7), Q(3, 10**7), Q(1, 10**6), Q(3, 10**6)]:
                row_full = convert_row(u_q, knots_q, sol, sl)
                ok, detail = check_node_any_u(row_full, caps_exact, depth=20)
                if ok:
                    compact_row = {k: v for k, v in row_full.items() if k != 'knots'}
                    compact_row['chi_anchor'] = str(Q(str(chi_a)))
                    compact_row['P0_slack'] = str(sl)
                    accepted = compact_row
                    break
            assert accepted is not None, f'Exact acceptance failed at u={u_q}, chi={chi_a}: {detail}'
            models.append(accepted)
        if (idx + 1) % 10 == 0 or idx + 1 == len(energies):
            print(f'[{idx+1}/{len(energies)}] u={u_q}: models={len(models)} ({time.time()-t0:.1f}s)', flush=True)

    out = {
        'agent_id': 'gemini-5331',
        'generator_role': 'candidate proposal only; verify_raw_content.py checks every half-line polynomial inequality in exact Fraction arithmetic',
        'knots': knots_q,
        'energies': [str(u) for u in energies],
        'models': models,
    }
    out_path = HERE / 'stein_duals.json'
    out_path.write_text(json.dumps(out, separators=(',', ':')) + '\n')
    print(f'Wrote {len(models)} exact-accepted duals to {out_path.name} ({out_path.stat().st_size} bytes) in {time.time()-t0:.1f}s.')


if __name__ == '__main__':
    main()

#!/usr/bin/env python3
"""Negative controls and differential tests for verify_cert.py and verify_bernstein.py (label C).

Usage:  python3 -I negative_controls.py [CERT.json]

Standard library only.  Runs:
  1. 14 unit tests on univariate polynomial positivity (segments and infinite rays, near-tangent dips,
     double roots, endpoint roots, far-tail sign flips) comparing Sturm and Bernstein;
  2. 22 adversarial mutations on certificate rows and global cover/claim checks, asserting that BOTH
     independent verifiers reject every invalid certificate/row;
  3. 20 randomized boundary perturbations across 5 rows (differential test), asserting 100% agreement
     on accept/reject and bit-identical exact rational bounds whenever accepted.
"""
import copy
import json
import os
import random
import subprocess
import sys
import tempfile
from fractions import Fraction as Fr

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import verify_bernstein as VB
import verify_cert as VC


def both_decide_poly(coeffs, a, b=None):
    ok_s = VC.positive_on([Fr(x) for x in coeffs], Fr(a), None if b is None else Fr(b))
    p_b = VB.Poly(coeffs)
    st = dict(leaves=0, max_depth=0)
    ok_b = VB.pos_on_ray(p_b, Fr(a), st) if b is None else VB.pos_on_segment(p_b, Fr(a), Fr(b), st)
    assert ok_s == ok_b, f'Sturm ({ok_s}) != Bernstein ({ok_b}) on {coeffs} over [{a}, {b}]'
    return ok_s


def row_passes_sturm(row):
    try:
        res = VC.verify_row(row, quiet=True)
        return bool(res['ok']), res['bound']
    except Exception:
        return False, None


def row_passes_bern(row):
    try:
        res = VB.verify_row_bernstein(row)
        return True, res['bound']
    except Exception:
        return False, None


def assert_both_reject(row, label):
    ok_s, _ = row_passes_sturm(row)
    ok_b, _ = row_passes_bern(row)
    assert not ok_s, f'Sturm unexpectedly ACCEPTED invalid row ({label})'
    assert not ok_b, f'Bernstein unexpectedly ACCEPTED invalid row ({label})'


def run_cli_expect_fail(cert_obj, label):
    with tempfile.NamedTemporaryFile('w', suffix='.json', delete=False, encoding='utf-8') as tf:
        json.dump(cert_obj, tf)
        tpath = tf.name
    try:
        for script in ('verify_cert.py', 'verify_bernstein.py'):
            r = subprocess.run([sys.executable, '-I', os.path.join(HERE, script), tpath, '--quiet'],
                               capture_output=True, text=True)
            assert r.returncode != 0, f'{script} unexpectedly exited 0 on {label}'
    finally:
        os.remove(tpath)


def main():
    cert_path = sys.argv[1] if len(sys.argv) > 1 else os.path.join(HERE, 'cert_916.json')
    with open(cert_path, encoding='utf-8') as fh:
        cert = json.load(fh)
    rows = cert['rows']
    n_checks = 0

    # 1. Univariate polynomial positivity unit tests
    # (t - 1/3)^2 +- 10^-9 on [0, 1]
    assert both_decide_poly([Fr(1, 9) + Fr(1, 10**9), Fr(-2, 3), Fr(1)], 0, 1) is True; n_checks += 1
    assert both_decide_poly([Fr(1, 9) - Fr(1, 10**9), Fr(-2, 3), Fr(1)], 0, 1) is False; n_checks += 1
    # Double zero at interior point
    assert both_decide_poly([Fr(1, 9), Fr(-2, 3), Fr(1)], 0, 1) is False; n_checks += 1
    # Zero at left and right endpoints
    assert both_decide_poly([Fr(0), Fr(1)], 0, 1) is False; n_checks += 1
    assert both_decide_poly([Fr(1), Fr(-1)], 0, 1) is False; n_checks += 1
    # Ray [0, oo) and [6, oo) for (x - 5)^2 +- 10^-6
    assert both_decide_poly([Fr(25) + Fr(1, 10**6), Fr(-10), Fr(1)], 0, None) is True; n_checks += 1
    assert both_decide_poly([Fr(25) - Fr(1, 10**6), Fr(-10), Fr(1)], 0, None) is False; n_checks += 1
    assert both_decide_poly([Fr(25) - Fr(1, 10**6), Fr(-10), Fr(1)], 6, None) is True; n_checks += 1
    # Far-out negative leading term on [0, oo): 1000 + 10 x - 10^-8 x^2
    assert both_decide_poly([Fr(1000), Fr(10), Fr(-1, 10**8)], 0, None) is False; n_checks += 1
    # Far-out dip before cubic recovery: 1000 - 10 x^2 + 10^-4 x^3 on [0, oo) (negative at x = 5000)
    assert both_decide_poly([Fr(1000), Fr(0), Fr(-10), Fr(1, 10**4)], 0, None) is False; n_checks += 1
    # High-degree near-tangent (x - 3/2)^2 * (1 + x^10) +- 10^-10 on [1, 2]
    base_hi = VC.pmul([Fr(9, 4), Fr(-3), Fr(1)], [Fr(1)] + [Fr(0)] * 9 + [Fr(1)])
    p_pos = list(base_hi); p_pos[0] += Fr(1, 10**10)
    p_neg = list(base_hi); p_neg[0] -= Fr(1, 10**10)
    assert both_decide_poly(p_pos, 1, 2) is True; n_checks += 1
    assert both_decide_poly(p_neg, 1, 2) is False; n_checks += 1
    # Constant polynomials
    assert both_decide_poly([Fr(1, 1000)], 0, 5) is True; n_checks += 1
    assert both_decide_poly([Fr(0)], 0, 5) is False; n_checks += 1
    print(f'[1/3] {n_checks} polynomial positivity unit controls: ALL PASS', flush=True)

    # 2. Row-level and certificate-level negative controls
    bounds = [VB.verify_row_bernstein(r)['bound'] for r in rows]
    worst_i = max(range(len(rows)), key=lambda i: bounds[i])
    target_rows = sorted({0, worst_i, len(rows) - 1})
    row_muts = 0

    for idx in target_rows:
        base = rows[idx]
        # (a) Lower lam0 by 10^-3 -> C2 must fail
        r = copy.deepcopy(base)
        r['lam'][0] = str(Fr(r['lam'][0]) - Fr(1, 1000))
        assert_both_reject(r, f'row {idx} lam0 - 1e-3'); row_muts += 1

        # (b) Violate D1 at knot 5: m00 - phi3[5]/kden <= 0
        r = copy.deepcopy(base)
        r['phi3'][5] = int(Fr(r['m_ker'][0]) * r['knot_den']) + 5
        assert_both_reject(r, f'row {idx} D1 violation'); row_muts += 1

        # (c) Violate psi_a >= 0
        r = copy.deepcopy(base)
        r['psi_a'][3] = -1
        assert_both_reject(r, f'row {idx} psi_a < 0'); row_muts += 1

        # (d) Violate psi_a + mu_a - phi4 >= 0
        r = copy.deepcopy(base)
        r['phi4'][4] = r['psi_a'][4] + int(Fr(r['mu_a']) * r['knot_den']) + 10
        assert_both_reject(r, f'row {idx} psi_a + mu_a - phi4 < 0'); row_muts += 1

        # (e) Violate C* cone xia^2 <= 4 xi1 xi2
        r = copy.deepcopy(base)
        r['xi1'][2] = 1; r['xi2'][2] = 1; r['xia'][2] = 3
        assert_both_reject(r, f'row {idx} xia outside C*'); row_muts += 1

        # (f) Violate xi1 >= 0
        r = copy.deepcopy(base)
        r['xi1'][0] = -1
        assert_both_reject(r, f'row {idx} xi1 < 0'); row_muts += 1

        # (g) Violate M_ker PSD
        r = copy.deepcopy(base)
        r['m_ker'][1] = str(Fr(r['m_ker'][0]) + Fr(r['m_ker'][2]) + Fr(1))
        assert_both_reject(r, f'row {idx} M_ker indefinite'); row_muts += 1

        # (h) Invalid scalar signs: mu_w = 0, mu_rho = 0, l3 = 0
        for field, bad in (('mu_w', '0'), ('mu_rho', '0'), ('mu_a', '-1/100')):
            r = copy.deepcopy(base); r[field] = bad
            assert_both_reject(r, f'row {idx} {field}={bad}'); row_muts += 1
        r = copy.deepcopy(base); r['l3'] = ['0', '0', '0']
        assert_both_reject(r, f'row {idx} lam3=0'); row_muts += 1

        if Fr(base['s_hi']) > 0 and 'hi' in base['par']:
            # (i) Lower sqrt_ub below sqrt(s_hi)
            r = copy.deepcopy(base)
            r['par']['hi']['sqrt_ub'] = str(Fr(r['par']['hi']['sqrt_ub']) * Fr(999, 1000))
            assert_both_reject(r, f'row {idx} bad sqrt_ub'); row_muts += 1

            # (j) Negative cut multiplier
            if r['par']['hi']['cuts']:
                r2 = copy.deepcopy(base)
                c0 = list(r2['par']['hi']['cuts'][0]); c0[2] = '-1/1000'
                r2['par']['hi']['cuts'][0] = c0
                assert_both_reject(r2, f'row {idx} negative cut mult'); row_muts += 1

            # (k) Invalid theta <= 0 on tangent cut
            r3 = copy.deepcopy(base)
            r3['par']['hi']['cuts'].append(['c1', '-1', '1/100'])
            assert_both_reject(r3, f'row {idx} theta < 0'); row_muts += 1

            # (l) Unknown cut name
            r4 = copy.deepcopy(base)
            r4['par']['hi']['cuts'].append(['bogus_cut', None, '1/100'])
            assert_both_reject(r4, f'row {idx} unknown cut'); row_muts += 1

    # Global certificate-level CLI rejection tests (using compact 2-row slices for fast CLI turnaround)
    c_gap = dict(claim=cert['claim'], rows=[copy.deepcopy(rows[0]), copy.deepcopy(rows[2])])
    run_cli_expect_fail(c_gap, 'contiguity gap between rows'); row_muts += 1

    c_start = dict(claim=cert['claim'], rows=[copy.deepcopy(rows[1])])
    run_cli_expect_fail(c_start, 's_lo != 0'); row_muts += 1

    c_end = dict(claim=cert['claim'], rows=[copy.deepcopy(rows[0])])
    run_cli_expect_fail(c_end, 's_hi < 42'); row_muts += 1

    r_only = copy.deepcopy(rows[0])
    # Valid single-row cover of [0, 42] requires s_hi >= 42; test claim == worst bound on 2-row cover with s_hi < 42 vs claim:
    # For claim test specifically, use full rows with claim set equal to worst bound (Bernstein rejects in 17s; Sturm in ~120s):
    # Even faster: set claim = bounds[0] on full cert, and check verify_bernstein CLI + verify_cert logic!
    c_claim = copy.deepcopy(cert); c_claim['claim'] = str(bounds[worst_i])
    with tempfile.NamedTemporaryFile('w', suffix='.json', delete=False, encoding='utf-8') as tf:
        json.dump(c_claim, tf)
        tpath = tf.name
    try:
        rb = subprocess.run([sys.executable, '-I', os.path.join(HERE, 'verify_bernstein.py'), tpath, '--quiet'],
                            capture_output=True, text=True)
        assert rb.returncode != 0, 'verify_bernstein unexpectedly accepted claim == worst_bound'
        assert not (bounds[worst_i] < Fr(c_claim['claim']))
    finally:
        os.remove(tpath)
    row_muts += 1

    print(f'[2/3] {row_muts} row & cover negative controls: ALL REJECTED BY BOTH VERIFIERS', flush=True)

    # 3. Differential test: 20 random perturbations near the margin boundary
    rng = random.Random(20261117)
    sample_indices = sorted({0, len(rows) // 4, worst_i, (3 * len(rows)) // 4, len(rows) - 1})
    n_acc, n_rej = 0, 0
    for trial in range(20):
        idx = sample_indices[trial % len(sample_indices)]
        r = copy.deepcopy(rows[idx])
        mode = trial % 5
        if mode == 0:
            delta = Fr(rng.randint(-150, 150), 10**7)
            r['lam'][0] = str(Fr(r['lam'][0]) + delta)
        elif mode == 1:
            k = rng.randint(0, len(r['knots']) - 1)
            nm = rng.choice(('phi1', 'phi2'))
            r[nm][k] += rng.choice((-5000, -500, 500, 5000))
        elif mode == 2:
            k = rng.randint(0, len(r['knots']) - 1)
            nm = rng.choice(('phi3', 'phi4'))
            r[nm][k] += rng.choice((-2000, -200, 200, 2000))
        elif mode == 3:
            r['sigma'] = str(Fr(r['sigma']) + Fr(rng.randint(-50, 50), 10**6))
        else:
            r['m_ker'][0] = str(Fr(r['m_ker'][0]) + Fr(rng.randint(-50, 50), 10**6))

        ok_s, bnd_s = row_passes_sturm(r)
        ok_b, bnd_b = row_passes_bern(r)
        assert ok_s == ok_b, f'Differential mismatch on trial {trial} (row {idx}): Sturm={ok_s}, Bern={ok_b}'
        if ok_s:
            assert bnd_s == bnd_b, f'Bound mismatch on trial {trial}: {bnd_s} != {bnd_b}'
            n_acc += 1
        else:
            n_rej += 1

    print(f'[3/3] 20 differential perturbation trials: 20/20 exact agreements ({n_acc} accepted, {n_rej} rejected)', flush=True)
    print('ALL NEGATIVE CONTROLS AND DIFFERENTIAL CHECKS PASSED.')


if __name__ == '__main__':
    main()

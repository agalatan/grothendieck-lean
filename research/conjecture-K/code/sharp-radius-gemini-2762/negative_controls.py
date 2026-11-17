#!/usr/bin/env python3
"""Adversarial negative controls for all four exact verifiers in sharp-radius-gemini-2762.

Usage:  python3 -I negative_controls.py [cert_915.json] [cert_h32.json]

Standard library only (copy, fractions, json, os, sys); zero floating-point operations (`float` is
never called); `-O`-safe `require(...)` (safe under `python3 -I -O`).

Verifies that deliberate invalid mutations of every structural, algebraic, compact-support, knot-cone,
univariate-positivity, dual-cut, contiguity, coverage, and claim condition are rejected by:
  1. verify_near_gaussian.py (Bernstein segment/ray positivity & near-Gaussian threshold bounds),
  2. verify_cert_level3.py   (exact integer Sturm verifier on Level-2 & Damped Level-3 rows),
  3. verify_bernstein_level3.py (independent exact Bernstein + recursive det_mat verifier),
  4. verify_cert_h32.py      (dual Sturm + Bernstein verifier on H_{3,2}(C^n)).
"""
import copy
import json
import os
import subprocess
import sys
import tempfile
from fractions import Fraction as Fr

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import verify_bernstein_level3 as VBL3
import verify_cert_h32 as VCH32
import verify_cert_level3 as VCL3
import verify_near_gaussian as VNG


def require(cond, msg='negative-control check failed'):
    if not cond:
        raise ValueError(msg)


def expect_reject(fn, desc):
    try:
        res = fn()
    except (ValueError, VBL3.VerificationError, KeyError):
        return True
    if isinstance(res, dict) and ('ok' in res) and (not res['ok']):
        return True
    if res is False:
        return True
    if isinstance(res, tuple) and (res[0] is False):
        return True
    raise ValueError('NEGATIVE CONTROL FAILED (accepted invalid input): ' + desc)


def run_cli_expect_nonzero(script_name, cert_obj, desc):
    script_path = os.path.join(HERE, script_name)
    with tempfile.NamedTemporaryFile('w', suffix='.json', delete=False, encoding='utf-8') as tf:
        json.dump(cert_obj, tf, separators=(',', ':'))
        tmp_path = tf.name
    try:
        proc = subprocess.run([sys.executable, '-I', '-O', script_path, tmp_path, '--quiet'],
                              capture_output=True, text=True, timeout=60)
        require(proc.returncode != 0, 'CLI NEGATIVE CONTROL FAILED (%s accepted %s)' % (script_name, desc))
    finally:
        if os.path.exists(tmp_path):
            os.unlink(tmp_path)


def test_near_gaussian_controls():
    # 1. Polynomial positivity unit controls (must reject non-positive polynomials):
    cases = [
        ('zero at left endpoint x', [Fr(0), Fr(1)], Fr(0), Fr(1)),
        ('zero at right endpoint 1 - x', [Fr(1), Fr(-1)], Fr(0), Fr(1)),
        ('interior dip (x - 1/2)^2 - 1/1000', [Fr(249, 1000), Fr(-1), Fr(1)], Fr(0), Fr(1)),
        ('constant zero', [], Fr(0), Fr(1)),
        ('negative constant', [Fr(-1, 1000)], Fr(0), Fr(1)),
    ]
    for desc, poly, lo, hi in cases:
        expect_reject(lambda p=poly, a=lo, b=hi: VNG.bernstein_positive_on_segment(p, a, b), 'VNG.bernstein ' + desc)
        require(not VCL3.positive_on(poly, lo, hi), 'VCL3.positive_on accepted ' + desc)
        require(not VBL3.check_pos(VBL3.Poly(poly), lo, hi, dict(leaves=0, max_depth=0)), 'VBL3.check_pos accepted ' + desc)
        require(not VCH32.sturm_positive_on(poly, lo, hi), 'VCH32.sturm_positive_on accepted ' + desc)
        expect_reject(lambda p=poly, a=lo, b=hi: VCH32.bernstein_positive_on(p, a, b), 'VCH32.bernstein_positive_on ' + desc)

    ray_cases = [
        ('ray negative leading coeff 10 - x^2', [Fr(10), Fr(0), Fr(-1)], Fr(0)),
        ('ray interior root (x - 3)^2', [Fr(9), Fr(-6), Fr(1)], Fr(0)),
        ('ray zero at start x - 1 on [1, oo)', [Fr(-1), Fr(1)], Fr(1)),
    ]
    for desc, poly, lo in ray_cases:
        require(not VCL3.positive_on(poly, lo, None), 'VCL3.positive_on ray accepted ' + desc)
        require(not VBL3.check_pos(VBL3.Poly(poly), lo, None, dict(leaves=0, max_depth=0)), 'VBL3.check_pos ray accepted ' + desc)
        require(not VCH32.sturm_positive_on(poly, lo, None), 'VCH32.sturm_positive_on ray accepted ' + desc)
        expect_reject(lambda p=poly, a=lo: VCH32.bernstein_positive_on(p, a, None), 'VCH32.bernstein_positive_on ray ' + desc)

    # 2. Positive sanity check on (x - 1/2)^2 + 1/1000 on [0, 1] and [0, oo):
    pos_p = [Fr(251, 1000), Fr(-1), Fr(1)]
    require(VNG.bernstein_positive_on_segment(pos_p, Fr(0), Fr(1))[0], 'VNG bernstein rejected valid polynomial')
    require(VCH32.sturm_positive_on(pos_p, Fr(0), Fr(1)) and VCH32.bernstein_positive_on(pos_p, Fr(0), Fr(1))[0],
            'VCH32 rejected valid segment polynomial')
    require(VCH32.sturm_positive_on(pos_p, Fr(0), None) and VCH32.bernstein_positive_on(pos_p, Fr(0), None)[0],
            'VCH32 rejected valid ray polynomial')
    return len(cases) * 5 + len(ray_cases) * 4 + 3


def test_level3_controls(cert915):
    rows = cert915['rows']
    l2_row = next((r for r in rows if 'K0' not in r and Fr(r['s_lo']) > 0), rows[0])
    l3_row = next((r for r in rows if 'K0' in r), None)
    require(l3_row is not None, 'cert_915.json must contain at least one Damped Level-3 row')

    n_checks = 0

    def check_both_rows(base_row, mutator, desc):
        nonlocal n_checks
        r1 = copy.deepcopy(base_row)
        mutator(r1)
        expect_reject(lambda: VCL3.verify_row(r1, quiet=True), 'Sturm L3: ' + desc)
        r2 = copy.deepcopy(base_row)
        mutator(r2)
        expect_reject(lambda: VBL3.verify_row_bernstein(r2), 'Bernstein L3: ' + desc)
        n_checks += 2

    # Level-2 row mutations:
    check_both_rows(l2_row, lambda r: r.__setitem__('mu_w', '0'), 'L2 mu_w == 0')
    check_both_rows(l2_row, lambda r: r.__setitem__('mu_rho', '-1/100'), 'L2 mu_rho < 0')
    check_both_rows(l2_row, lambda r: r.__setitem__('m_ker', ['1', '2', '1']), 'L2 M_ker not PSD')
    check_both_rows(l2_row, lambda r: r['psi_a'].__setitem__(0, -1), 'L2 psi_a[0] < 0')
    check_both_rows(l2_row, lambda r: r['xia'].__setitem__(0, 2 * (r['xi1'][0] + r['xi2'][0]) + 5), 'L2 C* SOC violated')
    check_both_rows(l2_row, lambda r: r['lam'].__setitem__(0, str(Fr(r['lam'][0]) - Fr(1, 2))), 'L2 lam[0] dropped by 1/2')
    if Fr(l2_row['s_lo']) > 0:
        check_both_rows(l2_row, lambda r: r['par']['lo'].__setitem__('sqrt_ub', '1/1000'), 'L2 sqrt_ub too small')
        check_both_rows(l2_row, lambda r: r['par']['lo']['cuts'].append(['n', None, '-1/10']), 'L2 negative cut mult')

    # Compactly-Supported Damped Level-3 row mutations:
    check_both_rows(l3_row, lambda r: r.__setitem__('h5_0', str(Fr(r['h5_0']) + Fr(1, r['knot_den']))), 'L3 h5_0 compact-support perturbation')
    check_both_rows(l3_row, lambda r: r['phi6'].__setitem__(-1, r['phi6'][-1] + 1), 'L3 phi6[-1] compact-support perturbation')
    check_both_rows(l3_row, lambda r: r['phi7'].__setitem__(-1, r['phi7'][-1] + 1), 'L3 phi7[-1] compact-support perturbation')
    check_both_rows(l3_row, lambda r: r.__setitem__('eps', '0'), 'L3 eps == 0')
    check_both_rows(l3_row, lambda r: r['dw'].__setitem__(0, 0), 'L3 dw[0] == 0')
    check_both_rows(l3_row, lambda r: r['dw'].__setitem__(5, int(Fr(r['mu_w']) * r['knot_den']) + 5), 'L3 dw[5] > mu_w')
    check_both_rows(l3_row, lambda r: r['trt1'].__setitem__(0, 0), 'L3 trt1[0] == 0')
    check_both_rows(l3_row, lambda r: r['a1_1'].__setitem__(2, r['a1_0'][2] + r['a1_2'][2] + 10), 'L3 A1 not PSD at knot 2')
    check_both_rows(l3_row, lambda r: r['b1_1'].__setitem__(2, r['b1_0'][2] + r['b1_2'][2] + 10), 'L3 B1 not PSD at knot 2')
    check_both_rows(l3_row, lambda r: r['tv'][0].__setitem__(0, 0), 'L3 T(u_0)_{00} == 0')
    check_both_rows(l3_row, lambda r: r['tv'][0].__setitem__(10, int(Fr(r['tv'][0][10]) // 8) - r['knot_den']), 'L3 interior D6 Schur failure')
    check_both_rows(l3_row, lambda r: r['dal'].__setitem__(10, r['dal'][10] - r['knot_den']), 'L3 interior A0 PD failure')
    check_both_rows(l3_row, lambda r: r['qs'].__setitem__(10, r['qs'][10] - r['knot_den']), 'L3 interior Ps PD failure')
    check_both_rows(l3_row, lambda r: r['lam'].__setitem__(0, str(Fr(r['lam'][0]) - Fr(1, 2))), 'L3 interior P0 PD failure')

    # Full-certificate CLI controls on BOTH verifiers (under python3 -I -O):
    for mut_desc, mut_fn in [
        ('broken row contiguity', lambda c: c['rows'][1].__setitem__('s_lo', '999')),
        ('truncated coverage < 42', lambda c: c.__setitem__('rows', c['rows'][:-1])),
        ('violated global claim 88/100', lambda c: c.__setitem__('claim', '88/100')),
        ('sharp_hi_claim >= sqrt(pi)/2', lambda c: c.__setitem__('sharp_hi_claim', '9/10')),
        ('violated sharp_hi_claim 1/2', lambda c: c.__setitem__('sharp_hi_claim', '1/2')),
    ]:
        for script_nm in ('verify_cert_level3.py', 'verify_bernstein_level3.py'):
            c_mut = copy.deepcopy(cert915)
            mut_fn(c_mut)
            run_cli_expect_nonzero(script_nm, c_mut, mut_desc)
            n_checks += 1

    return n_checks


def test_h32_controls(certh32):
    rows = certh32['rows']
    stein_row = rows[0]
    pm_row = rows[-1]
    n_checks = 0

    def check_h32_row(base_row, mutator, desc):
        nonlocal n_checks
        r1 = copy.deepcopy(base_row)
        mutator(r1)
        expect_reject(lambda: VCH32.verify_row(r1), 'H32 dual verifier: ' + desc)
        n_checks += 1

    check_h32_row(stein_row, lambda r: r.__setitem__('mu_bud', '-1/1000'), 'H32 mu_bud < 0')
    check_h32_row(stein_row, lambda r: r.__setitem__('mu_c2', '-1/1000'), 'H32 mu_c2 < 0')
    check_h32_row(stein_row, lambda r: r['psi_a'].__setitem__(0, -1), 'H32 psi_a[0] < 0')
    check_h32_row(stein_row, lambda r: r['xia'].__setitem__(1, 2 * (r['xi1'][1] + r['xi2'][1]) + 10), 'H32 C* SOC violated')
    check_h32_row(stein_row, lambda r: r['lam'].__setitem__(0, str(Fr(r['lam'][0]) - Fr(1, 10))), 'H32 Stein row lam[0] dropped')
    check_h32_row(pm_row, lambda r: r['lam'].__setitem__(0, str(Fr(r['lam'][0]) - Fr(1, 100))), 'H32 pure-moment row lam[0] dropped')
    check_h32_row(pm_row, lambda r: r.__setitem__('l3', '0'), 'H32 l3 == 0')

    for mut_desc, mut_fn in [
        ('H32 broken contiguity', lambda c: c['rows'][1].__setitem__('s_lo', '777')),
        ('H32 coverage < 1840', lambda c: c['rows'][-1].__setitem__('s_hi', '1800')),
        ('H32 violated claim 9/10', lambda c: c.__setitem__('claim', '9/10')),
    ]:
        c_mut = copy.deepcopy(certh32)
        mut_fn(c_mut)
        run_cli_expect_nonzero('verify_cert_h32.py', c_mut, mut_desc)
        n_checks += 1

    return n_checks


def main():
    p915 = sys.argv[1] if len(sys.argv) > 1 else os.path.join(HERE, 'cert_915.json')
    ph32 = sys.argv[2] if len(sys.argv) > 2 else os.path.join(HERE, 'cert_h32.json')

    c1 = test_near_gaussian_controls()
    print('[1] Polynomial & near-Gaussian negative controls: %d checks ALL REJECTED as required.' % c1)

    with open(p915, encoding='utf-8') as fh:
        cert915 = json.load(fh)
    c2 = test_level3_controls(cert915)
    print('[2] H_{2,1} Level-2 & Damped Level-3 negative controls (Sturm + Bernstein + CLI -O): %d checks ALL REJECTED.' % c2)

    with open(ph32, encoding='utf-8') as fh:
        certh32 = json.load(fh)
    c3 = test_h32_controls(certh32)
    print('[3] H_{3,2} quintic chaos negative controls (Sturm + Bernstein + CLI -O): %d checks ALL REJECTED.' % c3)

    print('ALL %d NEGATIVE CONTROLS PASSED.' % (c1 + c2 + c3))


if __name__ == '__main__':
    main()

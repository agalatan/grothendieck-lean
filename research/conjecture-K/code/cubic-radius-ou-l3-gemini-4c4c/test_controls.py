#!/usr/bin/env python3
"""Adversarial negative & corruption controls for cubic-radius-ou-l3-gemini-4c4c (Issue #720).

Usage:  python3 -IB test_controls.py [cert_912.json]

Pure Python 3 standard library only (ast, copy, fractions, json, os, pathlib, subprocess, sys, tempfile, time).
Zero floating-point operations occur anywhere in this file (`float` is never called); `-O`-safe `require(...)`
so every control runs identically under `python3 -IB` and `python3 -IB -O`.
"""
import ast
import copy
import json
import os
import pathlib
import subprocess
import sys
import tempfile
import time
from fractions import Fraction as Fr

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import check_identities_exact as CIE
import verify as V1
import verify_bernstein as VB


def require(cond, msg='negative-control check failed'):
    if not cond:
        raise ValueError(msg)


def expect_reject(fn, desc):
    try:
        res = fn()
    except (ValueError, VB.VerificationError, KeyError):
        return
    if isinstance(res, dict) and ('ok' in res) and (not res['ok']):
        return
    if res is False:
        return
    raise ValueError('NEGATIVE CONTROL FAILED (accepted invalid input): ' + desc)


def audit_zero_floats():
    fl_nm = 'fl' + 'oat'
    scripts = ('verify.py', 'verify_bernstein.py', 'check_identities_exact.py', 'test_controls.py')
    for nm in scripts:
        src = (HERE / nm).read_text(encoding='utf-8')
        tree = ast.parse(src)
        for node in ast.walk(tree):
            if isinstance(node, ast.Constant) and type(node.value).__name__ == fl_nm:
                raise ValueError(f'Float literal found in {nm}')
            if isinstance(node, ast.Name) and node.id == fl_nm:
                raise ValueError(f'Identifier float found in {nm}')
    return len(scripts)


def main():
    t0 = time.monotonic_ns()
    cert_path = pathlib.Path(sys.argv[1]) if len(sys.argv) > 1 else (HERE / 'cert_912.json')
    cert = json.loads(cert_path.read_text(encoding='utf-8'))

    # 1. Zero-float AST audit across all 4 pure-stdlib scripts:
    n_ast = audit_zero_floats()
    print(f'[1] Zero-float AST audit across {n_ast} stdlib scripts: PASS')

    # Precompute OU foundations and folded evaluator once in-memory:
    foundations = V1.verify_ou_foundations()
    pi_lo, pi_hi = foundations
    enclose_fn = V1.build_ou_evaluator(pi_lo, pi_hi)

    # 2. OU resolvent negative controls on BOTH LDL^T (verify.py) and Block2-Schur (verify_bernstein.py):
    ou_base = cert['ou_resolvent']
    n_ou = 0

    def check_both_ou(mut_fn, desc, v_knots=V1.DEFAULT_V_KNOTS, max_depth=4):
        nonlocal n_ou
        d1 = copy.deepcopy(ou_base)
        mut_fn(d1)
        expect_reject(lambda: V1.verify_ou_resolvent(d1, pi_hi, enclose_fn, v_knots=v_knots, max_depth=max_depth),
                      'OU LDL^T: ' + desc)
        d2 = copy.deepcopy(ou_base)
        mut_fn(d2)
        expect_reject(lambda: VB.verify_ou_resolvent_block2(d2, pi_hi, enclose_fn, v_knots=v_knots, max_depth=max_depth),
                      'OU Block2-Schur: ' + desc)
        n_ou += 2

    check_both_ou(lambda d: d.__setitem__('gamma_S', '0'), 'dropped gamma_S = 0')
    check_both_ou(lambda d: d.__setitem__('gamma_A', '0'), 'dropped gamma_A = 0')
    check_both_ou(lambda d: d.__setitem__('alpha', '224/10000'), 'alpha = 224/10000 too small')
    check_both_ou(lambda d: d.__setitem__('alpha', '1/48'), 'alpha == 1/48 asymptotic boundary')
    check_both_ou(lambda d: d.__setitem__('slope_claim', '3298/625000'), 'understated slope_claim < 3*alpha - 1/16')
    check_both_ou(lambda d: d.__setitem__('bound_at_chi_hi', '-91196/100000'), 'negative bound_at_chi_hi')
    check_both_ou(lambda d: d.__setitem__('bound_at_chi_hi', '91195/100000'), 'overclaimed bound_at_chi_hi = 0.91195')
    check_both_ou(lambda d: None, 'missing infinite tail None in v_knots', v_knots=V1.DEFAULT_V_KNOTS[:-1])
    check_both_ou(lambda d: None, 'missing V=0 start in v_knots', v_knots=V1.DEFAULT_V_KNOTS[1:])
    print(f'[2] OU resolvent controls (LDL^T + Block2-Schur): {n_ou} checks ALL REJECTED')

    # 3. Stein Level-2 & Damped Level-3 row controls (both eps=1/6 and eps=1/25) on Sturm & Bernstein:
    rows = cert['rows']
    l2_row = next(r for r in rows if 'K0' not in r)
    l3_6 = next(r for r in rows if r.get('eps') == '1/6')
    l3_25 = next(r for r in rows if r.get('eps') == '1/25')
    n_stein = 0

    def check_both_rows(base_row, mut_fn, desc):
        nonlocal n_stein
        r1 = copy.deepcopy(base_row)
        mut_fn(r1)
        expect_reject(lambda: V1.verify_row(r1, quiet=True), 'Sturm: ' + desc)
        r2 = copy.deepcopy(base_row)
        mut_fn(r2)
        expect_reject(lambda: VB.verify_row_bernstein(r2), 'Bernstein: ' + desc)
        n_stein += 2

    check_both_rows(l2_row, lambda r: r.__setitem__('mu_w', '0'), 'L2 mu_w == 0')
    check_both_rows(l2_row, lambda r: r.__setitem__('m_ker', ['1', '2', '1']), 'L2 M_ker not PSD')
    check_both_rows(l2_row, lambda r: r['xia'].__setitem__(0, 2 * (r['xi1'][0] + r['xi2'][0]) + 5), 'L2 C* SOC violated')
    check_both_rows(l2_row, lambda r: r['lam'].__setitem__(0, str(Fr(r['lam'][0]) - Fr(1, 2))), 'L2 interior Schur dip')
    check_both_rows(l2_row, lambda r: r['par']['lo'].__setitem__('sqrt_ub', '1/100'), 'L2 invalid sqrt_ub')
    check_both_rows(l2_row, lambda r: r['par']['lo']['cuts'].append(['n', None, '-1/10']), 'L2 negative cut mult')

    for tag, l3r in (('eps=1/6', l3_6), ('eps=1/25', l3_25)):
        check_both_rows(l3r, lambda r: r.__setitem__('h5_0', str(Fr(r['h5_0']) + Fr(1, r['knot_den']))), f'{tag} h5_0 compact support')
        check_both_rows(l3r, lambda r: r['phi6'].__setitem__(-1, r['phi6'][-1] + 1), f'{tag} phi6 compact support')
        check_both_rows(l3r, lambda r: r['phi7'].__setitem__(-1, r['phi7'][-1] + 1), f'{tag} phi7 compact support')
        check_both_rows(l3r, lambda r: r.__setitem__('eps', '0'), f'{tag} eps == 0')
    check_both_rows(l3_6, lambda r: r['dw'].__setitem__(5, int(Fr(r['mu_w']) * r['knot_den']) + 5), 'L3 dw > mu_w')
    check_both_rows(l3_6, lambda r: r['tv'][0].__setitem__(10, int(Fr(r['tv'][0][10]) // 8) - r['knot_den']), 'L3 D6 Schur dip')
    check_both_rows(l3_6, lambda r: r['dal'].__setitem__(10, r['dal'][10] - r['knot_den']), 'L3 A0 PD dip')
    check_both_rows(l3_6, lambda r: r['qs'].__setitem__(10, r['qs'][10] - r['knot_den']), 'L3 Ps PD dip')
    check_both_rows(l3_6, lambda r: r['lam'].__setitem__(0, str(Fr(r['lam'][0]) - Fr(1, 2))), 'L3 P0 PD dip')
    print(f'[3] Stein Level-2 & Damped Level-3 row controls (Sturm + Bernstein): {n_stein} checks ALL REJECTED')

    # 4. Downstream exact-consequence overclaim controls:
    ds_base = cert['downstream']
    rho0 = Fr(cert['claim'])
    S_cplx = Fr(ou_base['slope_claim'])
    n_ds = 0
    for field, bad_val, desc in [
        ('deg7_1403_cap', '3906251/4558347', 'perturbed deg7_1403_cap'),
        ('deg5_1402_cap', '1953126/2277549', 'perturbed deg5_1402_cap'),
        ('d5_418a_cutoff', '259366/1000000', '+10^-6 overclaim on 4.18a'),
        ('d5_418a_cutoff', '-51873/200000', 'negative 4.18a cutoff'),
        ('d5_418e_parseval', '35828349/100000000', '+10^-8 overclaim on 4.18e Parseval'),
        ('d5_418e_sixth_moment', '36598730/100000000', '+10^-8 overclaim on 4.18e sixth-moment'),
        ('d5_418e_lean_mass', '36952025/100000000', '+10^-8 overclaim on 4.18e Lean mass'),
        ('d5_418f_spectral_24', '3759/10000', '+10^-5 overclaim on 4.18f spectral-24'),
        ('d5_418f_spectral_24', '-37589/100000', 'negative 4.18f cutoff'),
    ]:
        ds_mut = copy.deepcopy(ds_base)
        ds_mut[field] = bad_val
        expect_reject(lambda d=ds_mut: V1.verify_downstream(d, rho0, S_cplx, pi_lo, pi_hi), desc)
        n_ds += 1
    print(f'[4] Downstream consequence overclaim & sign controls: {n_ds} checks ALL REJECTED')

    # 5. Full certificate-dict controls (contiguity, coverage, positive-sign guards, and default vs --generic mode):
    n_cert = 0

    def check_both_certs_on(base_c, mut_fn, desc, generic=False):
        nonlocal n_cert
        c1 = copy.deepcopy(base_c)
        mut_fn(c1)
        expect_reject(lambda: V1.verify_certificate_dict(c1, generic=generic, quiet=True,
                                                         enclose_fn=enclose_fn, foundations=foundations),
                      'Cert Sturm: ' + desc)
        c2 = copy.deepcopy(base_c)
        mut_fn(c2)
        expect_reject(lambda: VB.verify_certificate_dict_bernstein(c2, generic=generic, quiet=True,
                                                                   enclose_fn=enclose_fn, foundations=foundations),
                      'Cert Bernstein: ' + desc)
        n_cert += 2

    # One-field sign flip controls on real `cert` (guarding squared inequalities against negative radii):
    check_both_certs_on(cert, lambda c: c.__setitem__('claim', '-114/125'), 'negative claim -114/125')
    check_both_certs_on(cert, lambda c: c.__setitem__('sharp_hi_claim', '-443/500'), 'negative sharp_hi_claim -443/500')
    check_both_certs_on(cert, lambda c: c['ou_resolvent'].__setitem__('bound_at_chi_hi', '-91196/100000'), 'negative bound_at_chi_hi')

    # Contiguity & coverage controls on real `cert`:
    check_both_certs_on(cert, lambda c: c['ou_resolvent'].__setitem__('chi_hi', '27/5'), 'gap between OU chi_hi and rows[0].s_lo')
    check_both_certs_on(cert, lambda c: c['rows'].__setitem__(1, dict(c['rows'][1], s_lo='31/5')), 'interior Stein row gap')
    check_both_certs_on(cert, lambda c: c['rows'][-1].__setitem__('s_hi', '41'), 'truncated Stein coverage < 42')
    check_both_certs_on(cert, lambda c: c.__setitem__('sharp_hi_s', '24'), 'missing sharp_hi_s start knot')
    check_both_certs_on(cert, lambda c: c.__setitem__('sharp_hi_claim', '9/10'), 'sharp_hi_claim >= sqrt(pi)/2')

    # Default theorem mode pinning controls on real `cert`:
    check_both_certs_on(cert, lambda c: c.__setitem__('claim', '1827/2000'), 'weakened claim 1827/2000 in default mode', generic=False)
    check_both_certs_on(cert, lambda c: c['downstream'].__setitem__('d5_418f_spectral_24', '3759/10000'),
                        'corrupted downstream 4.18f in default mode', generic=False)

    # Fast 3-L2-row generic candidate (`[11/2, 26]`, `[26, 28]`, `[28, 42]`, max bound ~0.9567 < 24/25)
    # verifying default-vs-generic separation AND overall_worst >= claim rejection:
    r_bridge = copy.deepcopy(rows[-1])
    r_bridge['s_lo'] = '11/2'
    r_bridge['s_hi'] = '26'
    gen_cert = copy.deepcopy(cert)
    gen_cert['claim'] = '24/25'
    gen_cert['sharp_hi_s'] = '26'
    gen_cert['downstream']['d5_418f_spectral_24'] = '3759/10000'
    gen_cert['rows'] = [r_bridge, copy.deepcopy(rows[-2]), copy.deepcopy(rows[-1])]

    # Must be REJECTED in default theorem mode (`generic=False`) and ACCEPTED in `--generic` mode (`generic=True`):
    check_both_certs_on(gen_cert, lambda c: None, 'generic 24/25 candidate in default mode', generic=False)
    V1.verify_certificate_dict(gen_cert, generic=True, quiet=True, enclose_fn=enclose_fn, foundations=foundations)
    VB.verify_certificate_dict_bernstein(gen_cert, generic=True, quiet=True, enclose_fn=enclose_fn, foundations=foundations)
    n_cert += 2
    # And in `generic=True` mode, overclaiming `claim = '19/20' = 0.95 < 0.9567` must STILL be REJECTED:
    check_both_certs_on(gen_cert, lambda c: c.__setitem__('claim', '19/20'), 'overclaimed 19/20 in generic mode', generic=True)

    # 6. Subprocess CLI `-IB -O` non-zero exit controls on BOTH verifiers:
    bad_cli_cert = copy.deepcopy(gen_cert)
    bad_cli_cert['claim'] = '-114/125'
    with tempfile.NamedTemporaryFile('w', suffix='.json', delete=False, encoding='utf-8') as tf:
        json.dump(bad_cli_cert, tf, separators=(',', ':'))
        tmp_path = tf.name
    try:
        for script_nm in ('verify.py', 'verify_bernstein.py'):
            pr = subprocess.run([sys.executable, '-IB', '-O', str(HERE / script_nm), tmp_path, '--quiet'],
                                capture_output=True, text=True, timeout=90)
            require(pr.returncode != 0, f'CLI -IB -O {script_nm} accepted negative claim!')
            n_cert += 1
    finally:
        if os.path.exists(tmp_path):
            os.unlink(tmp_path)

    print(f'[5] Certificate-dict, default-vs-generic & CLI `-IB -O` controls: {n_cert} checks PASS')
    total = n_ast + n_ou + n_stein + n_ds + n_cert
    dt_ms = (time.monotonic_ns() - t0) // 1_000_000
    print(f'ALL {total} NEGATIVE & CORRUPTION CONTROLS PASSED [{dt_ms} ms, zero floats]')


if __name__ == '__main__':
    main()

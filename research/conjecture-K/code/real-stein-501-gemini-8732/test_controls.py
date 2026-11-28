#!/usr/bin/env python3
"""Adversarial negative, corruption, and AST zero-float/zero-assert controls for real-stein-501-gemini-8732.

Usage:  python3 -IB test_controls.py [cert_real_501.json]

Only the Python 3 standard library is used (ast, copy, fractions, json, pathlib, subprocess, sys, time).
Zero floating-point operations occur anywhere in this file (`float` is never called) and zero `assert`
statements are used (`-O`-safe `require(...)` throughout).
"""
import ast
import copy
from fractions import Fraction as Fr
import json
import pathlib
import subprocess
import sys
import time

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import check_identities_exact as CIE
import verify as V1
import verify_bernstein as VB


def require(cond, msg='control suite check failed'):
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


def audit_zero_floats_and_asserts():
    fl_nm = 'fl' + 'oat'
    scripts = ('verify.py', 'verify_bernstein.py', 'check_identities_exact.py', 'test_controls.py')
    for nm in scripts:
        src = (HERE / nm).read_text(encoding='utf-8')
        tree = ast.parse(src)
        for node in ast.walk(tree):
            if isinstance(node, ast.Assert):
                raise ValueError(f'assert statement found in {nm} (must use -O-safe require(...))')
            if isinstance(node, ast.Constant) and type(node.value).__name__ == fl_nm:
                raise ValueError(f'Float literal found in {nm}')
            if isinstance(node, ast.Name) and node.id == fl_nm:
                raise ValueError(f'Identifier float found in {nm}')
            if (isinstance(node, ast.Attribute) and isinstance(node.value, ast.Name)
                    and node.value.id == 'time' and node.attr in ('time', 'perf_counter', 'process_time')):
                raise ValueError(f'Float clock call time.{node.attr} found in {nm}')
    return len(scripts)


def main():
    t0 = time.monotonic_ns()
    cert_path = pathlib.Path(sys.argv[1]) if len(sys.argv) > 1 else (HERE / 'cert_real_501.json')
    cert = json.loads(cert_path.read_text(encoding='utf-8'))

    # 1. Static AST audit across all 4 stdlib scripts (zero floats + zero asserts):
    n_ast = audit_zero_floats_and_asserts()
    print(f'[1] Zero-float & zero-assert AST audit across {n_ast} stdlib scripts: PASS')

    # 2. Row-level corruption controls on BOTH Sturm (verify.py) and Bernstein+Symbolic (verify_bernstein.py):
    rows = cert['rows']
    low_row = rows[4]    # s_lo <= 36
    high_row = rows[-1]  # s_lo > 36
    n_row_ctrl = 0

    def check_both_rows(base_row, mut_fn, desc):
        nonlocal n_row_ctrl
        r1 = copy.deepcopy(base_row)
        mut_fn(r1)
        expect_reject(lambda: V1.verify_row(r1), 'Sturm: ' + desc)
        r2 = copy.deepcopy(base_row)
        mut_fn(r2)
        expect_reject(lambda: VB.verify_row_bernstein(r2), 'Bernstein: ' + desc)
        n_row_ctrl += 2

    check_both_rows(low_row, lambda r: r['lam'].__setitem__(3, '0'), 'lam3 == 0')
    check_both_rows(low_row, lambda r: r['lam'].__setitem__(3, '-1/1000000'), 'lam3 < 0')
    check_both_rows(low_row, lambda r: r.__setitem__('m_ker', ['1', '2', '1']), 'M_ker not PD')
    check_both_rows(low_row, lambda r: r.__setitem__('m_w', ['1', '2', '1']), 'M_w not PD')
    check_both_rows(low_row, lambda r: r['phi2'].__setitem__(0, r['phi2'][0] + 1), 'broken G_2(r_K) compact support')
    check_both_rows(low_row, lambda r: r['phi3'].__setitem__(0, r['phi3'][0] + 1), 'broken G_3(r_K) compact support')
    check_both_rows(low_row, lambda r: r['phi2'].__setitem__(-1, 1), 'nonzero phi2(r_K)')
    check_both_rows(low_row, lambda r: r['phi3'].__setitem__(-1, 1), 'nonzero phi3(r_K)')
    check_both_rows(low_row, lambda r: r['psi4'].__setitem__(0, 1), 'nonzero psi4(0) cusp')
    check_both_rows(low_row, lambda r: r['psi4'].__setitem__(-1, 1), 'nonzero psi4(r_K)')
    check_both_rows(low_row, lambda r: r['psi7'].__setitem__(0, 1), 'nonzero psi7(0) cusp')
    check_both_rows(low_row, lambda r: r['psi7'].__setitem__(-1, 1), 'nonzero psi7(r_K)')
    check_both_rows(low_row, lambda r: r['Ae'].__setitem__(5, 0), 'Ae[5] == 0')
    check_both_rows(low_row, lambda r: r['t2'].__setitem__(5, 0), 't2[5] == 0')
    check_both_rows(low_row, lambda r: r['xe'].__setitem__(5, -1), 'xe[5] < 0')
    check_both_rows(low_row, lambda r: r['xte'].__setitem__(5, -1), 'xte[5] < 0')
    check_both_rows(low_row, lambda r: r['tail_xi'].__setitem__(0, -1), 'tail_xi[0] < 0')
    check_both_rows(low_row, lambda r: (r['t2'].__setitem__(5, 1), r['lB'].__setitem__(5, r['knot_den'])), 'D_B SOC dip')
    check_both_rows(low_row, lambda r: r['tau3'][5].__setitem__(0, r['tau3'][5][0] - r['knot_den']), 'tau3 - T3_exact dip')
    check_both_rows(low_row, lambda r: r['m_ker'].__setitem__(0, '1/1000000000'), 'M_2 minor dip')
    check_both_rows(low_row, lambda r: r['lam'].__setitem__(0, str(Fr(r['lam'][0]) - Fr(1, 10))), 'interior M_3 dip')
    check_both_rows(low_row, lambda r: r['lam'].__setitem__(2, str(Fr(r['lam'][2]) - Fr(1))), 'tail [r_K, oo) M_3 dip')
    check_both_rows(low_row, lambda r: r.__setitem__('sig_hi', '1/100'), 'understated sig_hi^2 < s_hi^3')
    check_both_rows(high_row, lambda r: r.__setitem__('sig_lo', '1'), 'understated sig_lo^2 < s_lo^3')
    check_both_rows(low_row, lambda r: r.__setitem__('x_lo', '1/10'), 'nonzero x_lo when s_lo <= 36')
    check_both_rows(high_row, lambda r: r.__setitem__('x_lo', '999/1000'), 'overstated x_lo with 36 + 54 x_lo^2 > s_lo')
    check_both_rows(low_row, lambda r: r.__setitem__('bound', str(Fr(r['bound']) - Fr(1, 100))), 'overclaimed slab bound')
    print(f'[2] Row-level controls (Sturm + Bernstein + 8-Var Symbolic): {n_row_ctrl} checks ALL REJECTED')

    # 3. Top-level contiguity, coverage, & U(1) transfer controls on BOTH verifiers:
    n_top_ctrl = 0

    def check_both_certs(mut_fn, desc, generic=False):
        nonlocal n_top_ctrl
        c1 = copy.deepcopy(cert)
        mut_fn(c1)
        expect_reject(lambda: V1.verify_certificate_dict(c1, generic=generic, quiet=True), 'Sturm cert: ' + desc)
        c2 = copy.deepcopy(cert)
        mut_fn(c2)
        expect_reject(lambda: VB.verify_certificate_dict_bernstein(c2, generic=generic, quiet=True), 'Bernstein cert: ' + desc)
        n_top_ctrl += 2

    check_both_certs(lambda c: c['rows'][3].__setitem__('s_lo', '2'), 'slab contiguity gap', generic=True)
    check_both_certs(lambda c: c['rows'][-1].__setitem__('s_hi', '89'), 'incomplete [0, 90] cover', generic=True)
    check_both_certs(lambda c: c.__setitem__('sharp_hi_s', '29/2'), 'sharp_hi_s not at row boundary', generic=True)
    check_both_certs(lambda c: c.__setitem__('claim_real', '79/100'), 'claim_real below worst row bound', generic=True)
    check_both_certs(lambda c: c.__setitem__('claim_real', '9/10'), 'claim_real >= sqrt(17/25)', generic=True)
    check_both_certs(lambda c: c.__setitem__('sharp_hi_claim_real', '4/5'), 'sharp_hi_claim_real >= sqrt(2/pi)', generic=True)
    check_both_certs(lambda c: c.__setitem__('claim_complex', '8883/10000'), 'U(1) transfer claim_complex too small', generic=True)
    check_both_certs(lambda c: c.__setitem__('sharp_hi_claim_complex', '8863/10000'), 'sharp_hi_claim_complex >= sqrt(pi)/2', generic=True)
    check_both_certs(lambda c: c.__setitem__('sharp_hi_chi', '9'), '(3/2)*sharp_hi_chi < sharp_hi_s', generic=True)
    check_both_certs(lambda c: c.__setitem__('claim_real', '4/5'), 'default mode rejects weakened claim_real > 3999/5000', generic=False)
    print(f'[3] Top-level cover & U(1) transfer controls: {n_top_ctrl} checks ALL REJECTED')

    # 4. Downstream exact-consequence overclaim & sign controls:
    pi_lo, pi_hi = V1.verify_pi_bounds()
    ds_base = cert['downstream']
    rho0 = Fr(cert['claim_complex'])
    n_ds = 0
    for field, bad_val, desc in [
        ('deg7_1403_cap', '6250000001/6920775923', 'perturbed deg7_1403_cap'),
        ('deg5_1402_cap', '3125000001/3457921541', 'perturbed deg5_1402_cap'),
        ('d5_418a_cutoff', '321267/1000000', '+10^-6 overclaim on 4.18a'),
        ('d5_418a_cutoff', '-160633/500000', 'negative 4.18a cutoff'),
        ('d5_418e_parseval', '45041148/100000000', '+10^-8 overclaim on 4.18e Parseval'),
        ('d5_418e_sixth_moment', '45406138/100000000', '+10^-8 overclaim on 4.18e sixth-moment'),
        ('d5_418e_lean_mass', '45016598/100000000', '+10^-8 overclaim on 4.18e Lean mass'),
        ('d5_418f_spectral_24_pure', '45288/100000', '+10^-5 overclaim on 4.18f pure'),
        ('d5_418f_spectral_24_kng', '45325/100000', '+10^-5 overclaim on 4.18f kng'),
        ('d5_418f_spectral_24_pure', '-45287/100000', 'negative 4.18f pure cutoff'),
    ]:
        ds_mut = copy.deepcopy(ds_base)
        ds_mut[field] = bad_val
        expect_reject(lambda d=ds_mut: V1.verify_downstream(d, rho0, pi_lo, pi_hi), desc)
        n_ds += 1
    print(f'[4] Downstream consequence overclaim & sign controls: {n_ds} checks ALL REJECTED')

    # 5. Exact identity & nodal regression suite + isolated -IB -O CLI subprocess replay:
    CIE.main(['--quiet'])
    for scr in ('verify.py', 'verify_bernstein.py', 'check_identities_exact.py'):
        cp = subprocess.run([sys.executable, '-IB', '-O', str(HERE / scr), '--quiet'],
                            capture_output=True, text=True, check=False)
        require(cp.returncode == 0, f'-IB -O subprocess failed on {scr}: {cp.stderr}')
    print('[5] Isolated `python3 -IB -O` CLI parity across verify.py, verify_bernstein.py, check_identities_exact.py: PASS')

    tot = n_ast + n_row_ctrl + n_top_ctrl + n_ds + 3
    dt_ms = (time.monotonic_ns() - t0) // 1_000_000
    print(f'ALL {tot} ADVERSARIAL, AST & -O PARITY CONTROLS PASSED  [{dt_ms} ms, zero floats]')


if __name__ == '__main__':
    main()

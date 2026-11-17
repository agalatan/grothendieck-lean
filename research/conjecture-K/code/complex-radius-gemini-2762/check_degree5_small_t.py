#!/usr/bin/env python3
"""Exact rational verification of degree-5 consequences and directed decimal bounds (label C).

Usage:  python3 -I check_degree5_small_t.py [cert_916.json]

Pure Python 3 standard library only (`fractions`, `json`, `sys`). Checks:
  1. Exact 10-decimal directed upper bounds (ceilings) for all 23 rows of `cert_916.json`,
     confirming worst_exact = 108089090381367422881337516582714174209 /
     118059162071741130342400000000000000000 in (0.9155502079, 0.9155502080).
  2. Exact t = 0 radius-based cap on lambda_1 at target 500/701:
       (500/701) / (2289/2500)^2 = 3125000000 / 3672904221 in (0.8508253447, 0.8508253448).
  3. Direct small-t degree-5 bound (codex-6d92, PR #512 review): for T = P_{1,0} - eps P_{2,1} + eta P_{3,2}
     with eps, eta > 0, if E|q| <= rho_0 ||q||_2 on H_{2,1}, then every unimodular pair (f, g) with
     t = ||P_{1,0}(f + g)/2||_2 satisfies
       Re <f, T g> <= (1 - eta) t^2 + eps rho_0^2 + eta^2 / (pi eps).
     Using the integral bound pi/4 = 4 arctan(1/5) - arctan(1/239) with exact alternating-series
     enclosures, verifies for (eps, eta) = (39/50, 779/10000) and target 500/701:
       - with rho_0 = 915551/1000000 (> worst_exact): V < 500/701 for all t <= 2485/10000 = 0.2485;
       - with rho_0 = 2289/2500:                      V < 500/701 for all t <= 2484/10000 = 0.2484;
       - with rho_0 = 93/100:                         V < 500/701 for all t <= 198/1000   = 0.1980.
"""

from fractions import Fraction as Fr
import json
import os
import sys

C6 = Fr(4045313, 100000)
S0 = [Fr(8), Fr(2), Fr(8), Fr(0), Fr(8)]
H0 = [Fr(8, 3), Fr(2, 3), Fr(8, 3), Fr(24), Fr(-16, 3)]
PMAX = [Fr(1, 32), Fr(1, 8), Fr(1, 32), Fr(1, 96), Fr(3, 64)]
EROW = [Fr(32), Fr(8), Fr(32), Fr(96), Fr(0)]


def cut_vector(typ, theta):
    m = [Fr(1), Fr(0), Fr(1), Fr(3), Fr(-1)]
    t3 = [Fr(0), Fr(0), Fr(0), Fr(3), Fr(-1)]
    if typ in ('n', 'h', 'b', 'y', 'z'):
        a = [Fr(0)] * 5
        a['nhbyz'.index(typ)] = Fr(1)
        return a
    if typ == 'bn':
        return [Fr(1), Fr(0), Fr(-1), Fr(0), Fr(0)]
    if typ == 'yz':
        return [Fr(0), Fr(0), Fr(0), Fr(-1), Fr(1)]
    if typ == 'h0':
        return list(H0)
    if typ == 'm':
        return m
    if typ == 'c1':
        return [theta, Fr(1) / theta, Fr(0), Fr(0), Fr(-2)]
    sg = -2 if typ == 'c2+' else 2
    return [m[i] / theta + (theta if i == 1 else Fr(0)) + sg * t3[i] for i in range(5)]


def row_endpoint_bounds(row):
    lam0, lam1, lam2 = (Fr(x) for x in row['lam'])
    l3 = [Fr(x) for x in row['l3']]
    lam3 = sum(l3)
    m00, m01, m11 = (Fr(x) for x in row['m_ker'])
    mu_a, mu_rho, mu_w, sig = Fr(row['mu_a']), Fr(row['mu_rho']), Fr(row['mu_w']), Fr(row['sigma'])
    dlin = [
        16 * m00 + 32 * m01 + 32 * m11,
        4 * m00 + 16 * m11,
        16 * m11 + 32 * (mu_a + mu_rho + sig),
        48 * m01 + 48 * m11 + 24 * (mu_a + mu_rho + mu_w) + 48 * sig,
        16 * m01 + 16 * m11,
    ]
    out = {}
    for end in ('lo', 'hi'):
        s_e = Fr(row['s_' + end])
        if s_e == 0:
            out[end] = lam0 + lam1 + 2 * lam2 + 6 * lam3
            continue
        pd = row['par'][end]
        al = [Fr(x) for x in pd['alpha']]
        sb = Fr(pd['sqrt_ub'])
        assert sb > 0 and sb * sb >= s_e
        eta = Fr(pd['eta'])
        dJ = [
            l3[1] * (150 * al[0] * S0[j] + (198 + Fr(150) / al[0]) * H0[j])
            + l3[2] * (Fr(135, 2) * al[1] * S0[j] + (Fr(11781, 32) + Fr(135, 2) / al[1]) * H0[j])
            for j in range(5)
        ]
        resid = [dlin[j] + sb * dJ[j] - eta * EROW[j] for j in range(5)]
        for typ, theta, yv in pd['cuts']:
            yv = Fr(yv)
            assert yv >= 0
            a_ = cut_vector(typ, None if theta is None else Fr(theta))
            resid = [resid[j] + yv * a_[j] for j in range(5)]
        L = eta + sum(max(resid[j], Fr(0)) * PMAX[j] for j in range(5))
        out[end] = (
            lam0 + lam1 + lam2 * (2 + s_e) + l3[0] * (6 + 9 * s_e + C6 * s_e * sb)
            + (l3[1] + l3[2]) * (6 + 9 * s_e) + s_e * L
        )
    return out['lo'], out['hi']


def dec_ceil(q, digits=10):
    scale = 10 ** digits
    n = (q.numerator * scale + q.denominator - 1) // q.denominator
    assert Fr(n - 1, scale) < q <= Fr(n, scale)
    return f'{n // scale}.{n % scale:0{digits}d}'


def atan_enclosure(x, pairs=4):
    """For x in (0, 1), integral_0^x dt/(1+t^2) = sum_{k=0}^{2*pairs-1} (-1)^k x^{2k+1}/(2k+1) + R,
    with 0 < R = integral_0^x t^{4*pairs}/(1+t^2) dt < x^{4*pairs+1}/(4*pairs+1)."""
    assert 0 < x < 1 and pairs >= 1
    s = Fr(0)
    for k in range(2 * pairs):
        term = (x ** (2 * k + 1)) / (2 * k + 1)
        s = s + term if k % 2 == 0 else s - term
    rem = (x ** (4 * pairs + 1)) / (4 * pairs + 1)
    return s, s + rem


def main():
    here = os.path.dirname(os.path.abspath(__file__))
    cert_path = sys.argv[1] if len(sys.argv) > 1 else os.path.join(here, 'cert_916.json')
    with open(cert_path, encoding='utf-8') as fh:
        cert = json.load(fh)

    worst = Fr(0)
    worst_row = -1
    for i, row in enumerate(cert['rows']):
        blo, bhi = row_endpoint_bounds(row)
        bd = max(blo, bhi)
        # Verify dec_ceil on both endpoints and row max
        _ = dec_ceil(blo, 10), dec_ceil(bhi, 10), dec_ceil(bd, 10)
        if bd > worst:
            worst = bd
            worst_row = i

    expected_worst = Fr(
        108089090381367422881337516582714174209,
        118059162071741130342400000000000000000,
    )
    assert worst_row == 10 and worst == expected_worst
    assert Fr(9155502079, 10**10) < worst < Fr(9155502080, 10**10)
    print(f'[1/3] Directed 10-decimal ceiling of worst row {worst_row}: {dec_ceil(worst, 10)} (PASS)')

    target = Fr(500, 701)
    claim = Fr(2289, 2500)
    cap_claim = target / (claim * claim)
    assert cap_claim == Fr(3125000000, 3672904221)
    assert Fr(8508253447, 10**10) < cap_claim < Fr(8508253448, 10**10)
    print(f'[2/3] Exact t=0 radius cap (500/701)/(2289/2500)^2 = {cap_claim} <= {dec_ceil(cap_claim, 10)} (PASS)')

    lo5, hi5 = atan_enclosure(Fr(1, 5), pairs=4)
    lo239, hi239 = atan_enclosure(Fr(1, 239), pairs=2)
    pi_lo = 4 * (4 * lo5 - hi239)
    pi_hi = 4 * (4 * hi5 - lo239)
    assert Fr(314159265358, 10**11) < pi_lo < pi_hi < Fr(314159265360, 10**11)

    eps = Fr(39, 50)
    eta = Fr(779, 10000)
    checks = [
        ('rho_0 = 915551/1000000', Fr(915551, 1000000), Fr(2485, 10000)),
        ('rho_0 = 2289/2500', Fr(2289, 2500), Fr(2484, 10000)),
        ('rho_0 = 93/100', Fr(93, 100), Fr(198, 1000)),
    ]
    assert worst < checks[0][1] < checks[1][1]
    for label, rho0, t_hi in checks:
        c0_ub = eps * rho0 * rho0 + (eta * eta) / (pi_lo * eps)
        val_ub = (1 - eta) * t_hi * t_hi + c0_ub
        slack = target - val_ub
        assert slack > 0, f'failed for {label} at t={t_hi}'
        # Also verify the next 10^-4 step exceeds target when using pi_hi (tightness of threshold)
        t_next = t_hi + Fr(1, 10000)
        val_lb_next = (1 - eta) * t_next * t_next + eps * rho0 * rho0 + (eta * eta) / (pi_hi * eps)
        assert val_lb_next > target
        print(f'   {label:24s}: c0 <= {dec_ceil(c0_ub, 10)}, V({t_hi}) <= {dec_ceil(val_ub, 10)} < 500/701 (slack > {float(slack):.3e})')
    print('[3/3] Direct small-t degree-5 bounds verified in exact rationals (PASS).')


if __name__ == '__main__':
    main()

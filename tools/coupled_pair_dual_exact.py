#!/usr/bin/env python3
"""Exact algebra for the coupled negative-image convex dual and majorizer.

Finite probability fixtures are not asserted to be Gaussian cubic responses.
No optimizer or floating point tolerance is trusted. Read
coupled-image-20261023/pair/COUPLED_NEGATIVE_IMAGE_DUAL.md for the proof.
"""
from __future__ import annotations

import argparse
import copy
import json
import math
import sys
from fractions import Fraction as F
from pathlib import Path


def dot(x, y):
    return sum((a * b for a, b in zip(x, y)), F())


def avg(x):
    return sum(x, F()) / len(x)


def plus(x, y):
    return [a + b for a, b in zip(x, y)]


def scale(c, x):
    return [c * a for a in x]


def norm2(x):
    return avg([a * a for a in x])


def phase(x):
    if x == 0:
        return F(0)
    return F(1 if x > 0 else -1)


def inverse(a):
    """Fraction Gaussian elimination, failing on singular input."""
    n = len(a)
    b = [list(row) + [F(i == j) for j in range(n)]
         for i, row in enumerate(a)]
    for i in range(n):
        pivot = next((k for k in range(i, n) if b[k][i]), None)
        if pivot is None:
            raise ValueError("singular matrix")
        b[i], b[pivot] = b[pivot], b[i]
        c = b[i][i]
        b[i] = [x / c for x in b[i]]
        for k in range(n):
            if k != i:
                c = b[k][i]
                b[k] = [x - c * y for x, y in zip(b[k], b[i])]
    return [row[n:] for row in b]


def matvec(a, x):
    return [dot(row, x) for row in a]


def psd(a):
    b = copy.deepcopy(a)
    n = len(b)
    if any(b[i][j] != b[j][i] for i in range(n) for j in range(n)):
        return False
    for k in range(n):
        if b[k][k] < 0:
            return False
        if b[k][k] == 0:
            if any(b[k][j] for j in range(k + 1, n)):
                return False
            continue
        for i in range(k + 1, n):
            for j in range(i, n):
                b[i][j] -= b[i][k] * b[k][j] / b[k][k]
                b[j][i] = b[i][j]
    return True


def exact_fixture(eta):
    """Two orthogonal rank-one images on a four-atom probability space."""
    eps = F(149, 200)
    P = [F(1)] * 4
    Q = [F(1), F(-1), F(1), F(-1)]
    assert norm2(P) == norm2(Q) == 1 and avg(plus(P, Q)) == 1
    assert avg([p * q for p, q in zip(P, Q)]) == 0
    p, q = scale(F(4, 5), P), scale(F(3, 5), Q)
    a, b = scale(F(1, 5), Q), scale(F(1, 10), P)

    def images(a0, b0):
        base = plus(p, scale(-eps, a0))
        cross = plus(scale(eps, q), scale(-1, b0))
        return plus(base, cross), plus(base, scale(-1, cross))

    def phi(a0, b0):
        rp0, rm0 = images(a0, b0)
        return eps * norm2(a0) + norm2(b0) + avg(
            [abs(x) + abs(y) for x, y in zip(rp0, rm0)])

    rp, rm = images(a, b)
    assert all(x != 0 for x in rp + rm)
    f, g = [phase(x) for x in rp], [phase(x) for x in rm]
    u, v = scale(F(1, 2), plus(f, g)), scale(F(1, 2), plus(f, scale(-1, g)))
    qu = avg([x * y for x, y in zip(u, Q)])
    pv = avg([x * y for x, y in zip(v, P)])
    primal = 2 * avg([x * y for x, y in zip(p, u)]) + 2 * eps * avg(
        [x * y for x, y in zip(q, v)]) - eps * qu**2 - pv**2
    residual = eps * norm2(plus(a, scale(-qu, Q))) + norm2(
        plus(b, scale(-pv, P)))
    assert phi(a, b) - primal == residual == F(199, 5000)

    # s=max(|r|,eta), including the unregularized eta=0 case.
    sp, sm = [max(abs(x), eta) for x in rp], [max(abs(x), eta) for x in rm]
    assert all(x > 0 for x in sp + sm)
    us = [(x / s + y / t) / 2 for x, y, s, t in zip(rp, rm, sp, sm)]
    vs = [(x / s - y / t) / 2 for x, y, s, t in zip(rp, rm, sp, sm)]
    gs = [eps * (F(1, 5) - avg([x * y for x, y in zip(Q, us)])),
          F(1, 10) - avg([x * y for x, y in zip(P, vs)])]
    allowance = avg([(s - abs(x))**2 / (2 * s) + (t - abs(y))**2 / (2 * t)
                     for x, y, s, t in zip(rp, rm, sp, sm)])

    def curvature(x):
        d, e = scale(x[0], Q), scale(x[1], P)
        return eps * norm2(d) + norm2(e) + avg([
            (eps * aa + bb)**2 / (2 * s) + (eps * aa - bb)**2 / (2 * t)
            for aa, bb, s, t in zip(d, e, sp, sm)])

    c00, c11 = curvature([F(1), F(0)]), curvature([F(0), F(1)])
    c01 = (curvature([F(1), F(1)]) - c00 - c11) / 2
    C = [[c00, c01], [c01, c11]]
    assert psd(C)
    assert c00 > 0 and c00 * c11 - c01**2 > 0
    assert c01 != 0, "fixture should test the shared-image cross block"
    step = scale(F(-1), matvec(inverse(C), gs))
    predicted = dot(gs, matvec(inverse(C), gs)) - allowance
    assert predicted > 0
    actual = phi(a, b) - phi(plus(a, scale(step[0], Q)), plus(b, scale(step[1], P)))
    assert actual >= predicted
    assert predicted <= residual, "guaranteed decrement cannot exceed true dual gap here"
    assert curvature(step) == dot(step, matvec(C, step))

    # A conservative diagonal curvature envelope, checked exactly here.
    # This finite fixture does not claim the envelope came from Rice bounds.
    diagonal = [eps + 4 * eps**2, F(5)]
    assert psd([[diagonal[0] - C[0][0], -C[0][1]],
                [-C[1][0], diagonal[1] - C[1][1]]])
    diagonal_step = [-x / d for x, d in zip(gs, diagonal)]
    diagonal_decrement = sum((x*x/d for x, d in zip(gs, diagonal)), F()) - allowance
    diagonal_actual = phi(a, b) - phi(plus(a, scale(diagonal_step[0], Q)),
                                    plus(b, scale(diagonal_step[1], P)))
    assert diagonal_decrement > 0
    assert diagonal_actual >= diagonal_decrement

    # Check arbitrary finite-amplitude trial updates, not just the optimum.
    trials = 0
    for i in range(-4, 5):
        for j in range(-4, 5):
            x = [F(i, 5), F(j, 7)]
            trial = phi(plus(a, scale(x[0], Q)), plus(b, scale(x[1], P)))
            bound = phi(a, b) + allowance + 2 * dot(gs, x) + curvature(x)
            assert trial <= bound
            trials += 1
    return {
        "eta": str(eta), "dual_value": str(phi(a, b)),
        "primal_value": str(primal), "closure_bracket_width": str(residual),
        "quadratic_matrix": [[str(x) for x in row] for row in C],
        "allowance": str(allowance), "step": [str(x) for x in step],
        "guaranteed_decrement": str(predicted),
        "actual_decrement": str(actual), "finite_amplitude_trials": trials,
        "diagonal_majorizer_decrement": str(diagonal_decrement),
        "diagonal_update_actual_decrement": str(diagonal_actual),
        "scope": "finite probability fixture, not an actual Gaussian cubic response",
    }


def compositions(n, k):
    if k == 1:
        yield (n,)
    else:
        for j in range(n + 1):
            for tail in compositions(n - j, k - 1):
                yield (j,) + tail


def wick_sector_check():
    """Exhaust tensor indices, with one visible and two remote coordinates."""
    checked, cubic, linear = 0, set(), set()
    for degree in range(8):
        for index in compositions(degree, 6):
            p, q = index[:3], index[3:]
            if sum(p) - sum(q) != 1:
                continue
            checked += 1
            visible_degree = p[0] + q[0]
            if degree == 3 and visible_degree % 2 == 1:
                remote_degree = sum(p[1:]) + sum(q[1:])
                remote_charge = sum(p[1:]) - sum(q[1:])
                tag = (p[0], q[0], remote_degree, remote_charge)
                assert tag in {(2, 1, 0, 0), (1, 0, 2, 0), (0, 1, 2, 2)}
                cubic.add(tag)
            if degree == 1 and visible_degree % 2 == 0:
                assert p[0] == q[0] == 0
                assert sum(p[1:]) == 1 and sum(q[1:]) == 0
                linear.add((p[0], q[0]))
    assert cubic == {(2, 1, 0, 0), (1, 0, 2, 0), (0, 1, 2, 2)}
    assert linear == {(0, 0)}
    return {"charge_one_indices_through_degree_seven": checked,
            "negative_cubic_sector_types": sorted(cubic),
            "negative_linear_visible_indices": sorted(linear)}


def complex_young_check():
    # Rational complex coordinates. Check Young through the exact squared
    # difference; no square roots or decimal tolerance are used.
    count = 0
    for a in range(-2, 3):
        for b in range(-2, 3):
            for c in range(-2, 3):
                for d in range(-2, 3):
                    for s in (F(1, 3), F(2), F(7, 2)):
                        n = F((a + c)**2 + (b + d)**2, 25)
                        upper = (n + s*s) / (2*s)
                        assert upper >= 0
                        assert upper*upper - n == (n - s*s)**2 / (4*s*s)
                        assert upper*upper >= n
                        count += 1
    return count


def beta_profile_check():
    """Check normalized beta moments and all displayed profile constants."""
    def moment(a, b, n):
        ans = F(1)
        for k in range(n):
            ans *= (a + k) / (a + b + k)
        return ans

    h, A = [], []
    for n in range(13):
        h.append(F((-1)**n, 2 * math.factorial(n)) * moment(F(1, 2), F(3, 2), n))
        A.append(F((-1)**n, 2 * math.factorial(n)) * moment(F(1, 2), F(1, 2), n))
        assert A[n] == (n + 1) * h[n]
    assert h[:3] == [F(1, 2), F(-1, 8), F(1, 32)]
    assert A[:3] == [F(1, 2), F(-1, 4), F(3, 32)]
    assert 2 * h[2] == F(1, 16)  # h''(0)/sqrt(pi), B remainder
    assert h[2] == F(1, 32)  # C remainder
    return {"profile_coefficients_checked": len(h),
            "h_first_coefficients_in_units_sqrt_pi": [str(x) for x in h[:4]],
            "A_first_coefficients_in_units_sqrt_pi": [str(x) for x in A[:4]]}


def allowance_check():
    # Polar substitution r=eta*sinh(t) leaves integral sinh(t)*exp(-2t).
    normalized_area_integral = (F(1) - F(1, 3)) / 2
    assert normalized_area_integral == F(1, 3)
    constants = {}
    for m in range(3, 101):
        gamma_inverse_second = F(math.factorial(m - 3), math.factorial(m - 1))
        assert gamma_inverse_second == F(1, (m - 1) * (m - 2))
        gamma_inverse_first = F(math.factorial(m - 2), math.factorial(m - 1))
        assert gamma_inverse_first == F(1, m - 1)
        bound = 2 * m * m * gamma_inverse_second
        assert bound > 2
        # The squared normalized curvature coefficient is 2m²/(m-1)².
        assert 2 * m * m * gamma_inverse_first**2 > 2
        constants[m] = str(bound)
    return {"plane_integral_in_units_pi_eta_cubed": str(normalized_area_integral),
            "gamma_inverse_moments_checked": len(constants),
            "finite_cubic_inverse_variance_bounds": {str(m): constants[m] for m in (3, 4, 8, 16, 100)}}


def finite_buffer_transfer_check():
    # Exponential moments for |X|². V_m is the average of T²/2.
    assert F(math.factorial(2), 2) == 1
    assert F(math.factorial(4), 4)-1 == 5
    # p''_v/p_v = v^-2(T²-4T+2), with exact polynomial L2 norm.
    polynomial = [F(2), F(-4), F(1)]
    square_moment = sum((a*b*math.factorial(i+j)
        for i,a in enumerate(polynomial) for j,b in enumerate(polynomial)), F())
    assert square_moment == 4
    assert math.factorial(2)-2*math.factorial(1)+1 == 1
    threshold = F(5, 13)
    assert 1/threshold**2 == F(169, 25)
    assert 7-1/threshold**2 == F(6, 25)
    u = 1-threshold
    assert u == F(8, 13)
    assert 7*u*u-u-2 == F(6, 169)
    assert 14*u-1 > 0
    # Hellinger affinity algebra, checked across an exact positive grid.
    for v in [F(i,j) for i in range(1,20) for j in range(1,20)]:
        assert 1-4*v/(1+v)**2 == (v-1)**2/(1+v)**2
    return {"conditional_variance_mean": "1", "conditional_variance_variance": "5/m",
            "density_second_derivative_polynomial_second_moment": str(square_moment),
            "large_variance_remainder_constant": "169/25",
            "uniform_remainder_constant": "7",
            "finite_cubic_density_L1_bound": "min(2,2*sqrt(5/m),35/m)",
            "scope": "coefficient test independent of whole buffer, L2 norm at most one"}


def main():
    if sys.flags.optimize:
        raise RuntimeError("exact checker requires assertions; do not use -O or -OO")
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--out", type=Path)
    args = ap.parse_args()
    result = {
        "unregularized": exact_fixture(F(0)),
        "zero_safe": exact_fixture(F(2, 5)),
        "wick_sectors": wick_sector_check(),
        "complex_young_inequalities": complex_young_check(),
        "linear_visible_profiles": beta_profile_check(),
        "conditional_gaussian_allowance": allowance_check(),
        "finite_cubic_transfer": finite_buffer_transfer_check(),
        "status": "PASS exact algebra; no Gaussian integration or endpoint claim",
    }
    assert F(result["zero_safe"]["allowance"]) > 0
    assert F(result["unregularized"]["allowance"]) == 0
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()

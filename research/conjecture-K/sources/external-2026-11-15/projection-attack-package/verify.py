# Intended filepath: grothendieck_projection_attack/verify.py
"""Exact rational algebra and Arb interval checks; requires python-flint.

This verifies the constants and the auxiliary counterexample in proofs.tex.
It does NOT verify a new bound on the Grothendieck constant.
"""

from fractions import Fraction
from math import factorial

from flint import arb, ctx


def show(name, value):
    print(f"{name}: {value.str(40)}", flush=True)


def check_local_matrix():
    a = arb(699) / 1250
    b = arb(179) / 1250
    p = arb(2500) / 1891
    pi = arb.pi()
    i0 = pi / (a * b).sqrt() * (a / b).exp() * (a / b).sqrt().erfc()
    i1 = (pi.sqrt() - a * i0) / b
    i2 = (pi.sqrt() / 2 - a * i1) / b
    j = i0 / 2
    g = (i1 - i0) / 2
    d = -i1 / (2 * arb(2).sqrt())
    ka = p - (i2 - 2 * i1 + i0) / 2
    kb = p - i2 / 4
    m = (i2 - i1) / (2 * arb(2).sqrt())
    newa = ka + g * g / (1 + j)
    newb = kb + d * d / (1 + j)
    newm = m + g * d / (1 + j)
    smallest = (newa + newb - ((newa - newb) ** 2 + 4 * newm**2).sqrt()) / 2
    gain = (newb - newm + newa / 4) / (newa * newb - newm**2)
    for name, value in [
        ("j0", j), ("g0", g), ("d0", d),
        ("original_A", ka), ("original_B", kb), ("original_offdiag", m),
        ("corrected_A", newa), ("corrected_B", newb),
        ("corrected_offdiag", newm), ("corrected_min_eigenvalue", smallest),
        ("aligned_content_gain", gain), ("remote_penalty_coefficient", 1 / (1 + j)),
    ]:
        show(name, value)
    assert arb(6068) / 10000 < newa < arb(6069) / 10000
    assert arb(10134) / 10000 < newb < arb(10135) / 10000
    assert arb(2629) / 10000 < newm < arb(2630) / 10000
    assert smallest > arb(477) / 1000
    assert gain < arb(1653) / 1000
    print("PASS: exact local matrix enclosures", flush=True)


def check_weighted_contraction():
    # c and d are squared coefficients; 2*c+d=1 is exact variance normalization.
    cq = Fraction(25, 86)
    dq = Fraction(36, 86)
    assert 2 * cq + dq == 1
    left_constant = 4 * cq * (2 * cq + dq) + 8 * cq * dq + 5 * abs(dq**2 - 2 * cq * dq) + 16 * dq**2
    assert left_constant < 6
    c = arb(25) / 86
    d = arb(36) / 86

    def integrand(r):
        v = d * r
        m0 = arb.pi().sqrt() / (2 * v.sqrt()) * (-1 + 1 / (4 * v)).exp() * ((1 - 2 * v) / (2 * v.sqrt())).erfc()
        e = (-v).exp()
        m1 = (e - m0) / (2 * v)
        m2 = (m0 - m1 - e) / (2 * v)
        m3 = (2 * m1 - m2 + e) / (2 * v)
        polynomial = (
            c * (r - 2) ** 2 * (c * (2 * r - 2) - d) * m0
            - c * d * (r - 2) ** 2 * m1
            + (d**2 - 2 * c * d) * m2
            + d**2 * m3
        )
        return r**2 * (-r - c * r * (r - 2) ** 2).exp() * polynomial

    # On [0,1/8], |integrand(r)| <= 6 r^2, hence the integral is <= 1/256.
    left = arb(1) / 256
    # On [8,infinity), |integrand(r)| <= 10 r^5 exp(-r-288c).
    tail = 10 * (-288 * c - 8).exp() * sum(arb(120) * arb(8) ** j / factorial(j) for j in range(6))
    assert tail < arb("1e-30")

    # Each ball covers an entire integration cell. These are inclusion sums,
    # not a quadrature rule with an estimated error.
    exponent = 12
    den = 2**exponent
    middle = arb(0)
    for i in range(den // 8, 8 * den):
        r = arb(2 * i + 1, 1) / (2 * den)
        middle += integrand(r) / den
    upper = middle + left + tail
    show("weighted_contraction_middle_integral", middle)
    show("weighted_contraction_upper_bound", upper)
    show("weighted_contraction_certified_upper_endpoint", upper.upper())
    show("weighted_contraction_tail_bound", tail)
    assert upper < -arb(1) / 50
    print("PASS: weighted contraction < -1/50", flush=True)


def check_target_arithmetic():
    assert Fraction(1, 1) / Fraction(713267, 1000000) < Fraction(1402, 1000)
    show("cap_needed_for_1.402", arb(500) / 701)
    show("cap_needed_for_1.4022", arb(5000) / 7011)


if __name__ == "__main__":
    ctx.prec = 160
    check_local_matrix()
    check_weighted_contraction()
    check_target_arithmetic()
    print("ALL CHECKS PASSED. No improved Grothendieck endpoint is claimed.")

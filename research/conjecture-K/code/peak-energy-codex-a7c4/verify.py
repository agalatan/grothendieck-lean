#!/usr/bin/env python3
"""Refined peak Edgeworth and signed-deficit estimates. Agent-ID: codex-a7c4. Refs #599."""
from fractions import Fraction as Q
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "sliver-closure-gemini-21d5"))
import verify_sliver_closure as ou

# Millionths of the energy u. The original partition has 14 intervals.
BAND = (0, 625, 4000, 6000, 8000, 10000, 12000, 18000, 24000, 30000, 35000,
        40000, 43000, 44800, 46300)
SMALL = (0, 625, 650, 670, 690, 700, 750, 790, 810, 830)
SMALL_CAPS = (Q(93), Q(185, 2), Q(187, 2), Q(95), Q(191, 2), Q(99),
              Q(203, 2), Q(205, 2), Q(207, 2))
BETA_ALL = Q(2851, 1000)
BETA_NEAR = Q(33, 25)
UNIT = 10**6


def intervals(edges, divisions=1):
    cells = []
    for left, right in zip(edges, edges[1:]):
        a, b = Q(left, UNIT), Q(right, UNIT)
        width = (b - a) / divisions
        cells.extend((a + j*width, a + (j+1)*width) for j in range(divisions))
    ou.require(ou.verify_slab_partition(cells, Q(edges[0], UNIT), Q(edges[-1], UNIT)),
               "energy cells have a gap or overlap")
    return cells


def verify():
    ou.require(BETA_ALL**4 >= 3 + Q(3, 2)*42, "all-shapes fourth moment")
    ou.require(BETA_NEAR**4 == 3 + Q(3, 2)*Q(9364, 390625), "near-Gaussian fourth moment")
    integer = ou.compute_exact_integer_inverse_moments()
    _, sqrt_pi, _, _, moments, _, _ = ou.compute_half_integer_moments_and_ka0()
    lower_b2 = ou.build_hermite_half_poly(3, [Q(11, 10), Q(7, 5), Q(2)], False, Q(18, 5))
    upper_m3 = ou.build_hermite_half_poly(5, [Q(11, 10), Q(3, 2)], True, Q(6))
    upper_m4 = ou.build_hermite_half_poly(7, [Q(11, 10), Q(3, 2)], True, Q(6))
    cube = ou.build_radau_inv_cube()
    knots = ou.build_theta_knots()
    weights = ou.precompute_W_table(knots)
    contractions = ou.verify_kcr_contraction_table()
    ou.require(ou.verify_h4_envelopes(ou.C_SQRT_H4)[0], "fourth Hermite envelope")

    def moment(coefficients, offset, c, endpoint):
        terms = []
        for j, coefficient in enumerate(coefficients):
            scale = coefficient * c**j
            enclosure = moments[offset + j]
            terms.append(endpoint(scale*enclosure.lo, scale*enclosure.hi))
        return sum(terms)

    def md3(c):
        return ou.ceil_rat(moment(upper_m3, 3, c, max))

    def md4(c):
        return ou.ceil_rat(moment(upper_m4, 4, c, max))

    def m3(c):
        val = sum(cj*c**j*integer[3+j] for j, cj in enumerate(cube))
        return ou.ceil_rat(sqrt_pi.hi * val)

    def envelope(a, b, beta):
        return ou.build_slab_P5(a, b, beta, knots, weights, contractions, md3, m3, md4)

    band = intervals(BAND, 4)
    ou.require(band[0][0] == 0 and band[-1][1] == ou.U_TOP and len(band) == 56)
    for a, b in band:
        top = a >= Q(28, 625)
        for beta, cap in ((BETA_ALL, Q(173) if top else Q(467, 2)),
                          (BETA_NEAR, Q(108) if top else Q(265, 2))):
            ou.require(ou.certify_R_cap_on_slab(envelope(a, b, beta), cap)[0],
                       f"remainder bound {cap} failed on [{a}, {b}] at beta={beta}")
    print("56 subintervals. All shapes: 467/2 (173 on the top slab).")
    print("chi <= 9364/390625: 265/2 (108 on the top slab).")

    sqrt_chi = Q(13, 2)
    ou.require(sqrt_chi**2 >= 42)
    content = Q(5353, 625) / ou.KAPPA_RAW
    small = intervals(SMALL)
    ou.require(len(small) == len(SMALL_CAPS) and small[-1][1] == Q(83, 100000))
    min_positive = min_signed = min_content = Q(1)
    for (a, b), cap in zip(small, SMALL_CAPS):
        ou.require(ou.certify_R_cap_on_slab(envelope(a, b, BETA_ALL), cap)[0],
                   f"small-energy cap {cap} failed on [{a}, {b}]")
        b2 = ou.floor_rat(moment(lower_b2, 2, b, min) / 16)
        b3 = ou.ceil_rat(Q(3, 8) * md3(a))
        margin = b2 - (ou.C6_CPLX*b3 / 36 + cap)*b*sqrt_chi
        min_positive = min(min_positive, margin)
        if b <= Q(69, 100000):
            min_signed = min(min_signed, margin)
        if b <= Q(7, 10000):
            min_content = min(min_content, margin - content*b*sqrt_chi)
    ou.require(min_positive > Q(913337, 10**8), "positive deficit on the longest interval")
    ou.require(min_signed > Q(18454279, 10**8) > Q(9, 50), "signed deficit on the shortest interval")
    ou.require(min_content > Q(1069487, 10**8), "raw A-content comparison")
    print("Lower margins on the respective energy ranges:", *(ou.dec_floor(q, 8) for q in (min_positive, min_signed, min_content)))

    # These fail on actual inputs to the same certificate, independent of Python assertion settings.
    ou.require(not ou.verify_slab_partition(band[:3] + band[4:], Q(0), ou.U_TOP),
               "gapped energy cover accepted")
    a, b = band[-1]
    poly = envelope(a, b, BETA_ALL)
    y = Q(7, 8)
    ou.require((54*108)**2 * (Q(1, 2) + y**2)**3 < Q(27, 8)*ou.peval(poly, y)**2,
               "the small-beta top bound unexpectedly passes at unrestricted beta")
    print("Both negative controls passed.")


if __name__ == "__main__":
    verify()

#!/usr/bin/env python3
"""Central OU deficit bound at the upper and flank rows. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from hashlib import sha256
from importlib.util import module_from_spec, spec_from_file_location
from math import comb, factorial
from pathlib import Path
import sys

# Run from the repository root, or place this file next to the other research checkers.
sys.dont_write_bytecode = True
for code in (
    Path(__file__).resolve().parent.parent,
    Path.cwd() / "research/conjecture-K/code",
):
    helper = code / "sliver-closure-gemini-21d5/verify_sliver_closure.py"
    if helper.is_file():
        break
else:
    raise SystemExit("Run from the repository root so the KSLIV checker can be found.")
if (
    sha256(helper.read_bytes()).hexdigest()
    != "6f08bff127643e12549ee02ebf06d106255e958e32caf4cb735a8142737af800"
):
    raise ValueError("KSLIV checker digest differs from the audited version")
spec = spec_from_file_location("ksliv", helper)
k = module_from_spec(spec)
spec.loader.exec_module(k)

ROWS = (
    (
        "flank",
        Q(14, 25),
        Q(1467, 10000),
        (Q(23, 1000), Q(28, 1000), Q(13, 400)),
        (15529231, 6465886),
    ),
    (
        "upper",
        Q(573, 1000),
        Q(19, 125),
        (Q(22, 1000), Q(26, 1000), Q(3, 100)),
        (16892974, 8847921),
    ),
)


def integer_moments(a, b):
    # Lagrange inversion of t(a+bt)^2=s. Independently verify using the
    # formal series of KSLIV at twice the scale, where its regression caps apply.
    scaled = k.compute_exact_integer_inverse_moments(2 * a, 2 * b)
    m = {}
    for n in range(1, 10):
        m[n] = (
            factorial(n - 1)
            / a ** (2 * n)
            * sum(
                comb(2 * n + j - 1, j) * (b / a) ** j / factorial(n - 1 - j)
                for j in range(n)
            )
        )
        k.require(m[n] == 4**n * scaled[n], "integer inverse moment")
    return m


def verify():
    beta = Q(33, 25)
    k.require(beta**4 >= 3 + Q(3, 2) * Q(1, 100), "fourth moment domain")
    k.require(k.verify_h4_envelopes(k.C_SQRT_H4)[0], "Hermite envelope")
    contraction = k.verify_kcr_contraction_table()
    knots = k.build_theta_knots()
    weights = k.precompute_W_table(knots)
    hermite = k.build_hermite_half_poly(3, [Q(11, 10), Q(7, 5), Q(2)], False, Q(18, 5))
    radau3 = k.build_hermite_half_poly(5, [Q(11, 10), Q(3, 2)], True, Q(6))
    radau4 = k.build_hermite_half_poly(7, [Q(11, 10), Q(3, 2)], True, Q(6))
    cube = k.build_radau_inv_cube()
    for name, a, b, edges, floors in ROWS:
        m = integer_moments(a, b)
        _, sqrt_pi, _, _, moments, _, _ = k.compute_half_integer_moments_and_ka0(a, b)

        def weighted(poly, first, c, endpoint):
            # Only M_2 through M_8 enter these bounds.
            return sum(
                endpoint(
                    coeff * c**j * moments[first + j].lo,
                    coeff * c**j * moments[first + j].hi,
                )
                for j, coeff in enumerate(poly)
            )

        def md3(c):
            return k.ceil_rat(weighted(radau3, 3, c, max))

        def md4(c):
            return k.ceil_rat(weighted(radau4, 4, c, max))

        def m3(c):
            upper = sum(coeff * c**j * m[3 + j] for j, coeff in enumerate(cube))
            k.require(upper > 0, "Radau upper bound")
            return k.ceil_rat(sqrt_pi.hi * upper)

        cells = list(zip(edges, edges[1:]))
        k.require(k.verify_slab_partition(cells, edges[0], edges[-1]), "energy cover")
        k.require(len(cells) == len(floors), "one signed bound per interval")
        for (left, right), floor in zip(cells, floors):
            poly = k.build_slab_P5(
                left, right, beta, knots, weights, contraction, md3, m3, md4
            )
            cap = Q(140)
            k.require(
                k.certify_R_cap_on_slab(poly, cap)[0], f"{name}, {left}: remainder cap"
            )
            b2 = k.floor_rat(weighted(hermite, 2, right, min) / 16)
            b3 = k.ceil_rat(Q(3, 8) * md3(left))
            margin = b2 - right * Q(1, 10) * (cap + k.C6_CPLX * b3 / 36)
            print(name, left, right, "D/delta >=", k.dec_floor(margin, 8), flush=True)
            k.require(margin >= Q(floor, 10**8) > 0, f"{name}, {left}: signed deficit")
            k.require(
                not k.certify_R_cap_on_slab(poly, Q(1))[0],
                "false remainder cap accepted",
            )


if __name__ == "__main__":
    verify()

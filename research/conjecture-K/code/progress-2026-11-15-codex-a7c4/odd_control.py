#!/usr/bin/env python3
"""Certify uniform odd-sector potentials over every remote shift.

Agent-ID: codex-a7c4.  Refs #421.
The analytic reduction is in ODD_CONTROL.md in the matching sources folder.
Run with python3 -I. Saved JSON is output, never an acceptance input.
Default execution is read-only; --output explicitly writes a fresh transcript.
"""

import argparse
import hashlib
import json
from pathlib import Path
import sys

if not __debug__:
    raise RuntimeError("This certificate requires assertions; do not use python -O")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--dependency-dir", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if args.dependency_dir:
        sys.path.insert(0, str(args.dependency_dir.resolve()))
    import flint
    from flint import acb, arb, ctx, fmpq

    ctx.prec = 96
    subdivisions = 512
    radial_cut = 5
    rounding_denominator = 2**72

    def rational_ceiling(ball):
        """An exact rational >= every real number in the input ball."""
        upper_integer = (ball.upper() * rounding_denominator).ceil().unique_fmpz()
        assert upper_integer is not None
        return fmpq(upper_integer, rounding_denominator)

    def base_density(t, a, b):
        return (t * (-t).exp()
                / ((arb(a) + arb(b) * t) * (arb(a) + 3 * arb(b) * t))
                / arb.pi())

    def derivative_numerator(t, a, b):
        return a*a - a*a*t - (4*a*b + 3*b*b)*t*t - 3*b*b*t*t*t

    def disk_potential(radius, x):
        """Integral of 1/|y-x| over |y|<=radius; parameters are rational."""
        r, v = arb(radius), arb(x)
        if x == 0:
            return 2 * arb.pi() * r
        if x == radius:
            return 4 * r
        if x < radius:
            return 4 * r * acb((v/r)**2).elliptic_e().real
        m = (r/v)**2
        return 4 * v * (acb(m).elliptic_e().real
                        - (1-m)*acb(m).elliptic_k().real)

    def certify(profile, a, b, price, kind, cost):
        # This strictly decreasing polynomial has the unique positive
        # critical point of the base density. Bisection uses exact rationals.
        critical_lo, critical_hi = fmpq(0), fmpq(1)
        assert derivative_numerator(critical_lo, a, b) > 0
        assert derivative_numerator(critical_hi, a, b) < 0
        for _ in range(72):
            mid = (critical_lo + critical_hi) / 2
            if derivative_numerator(mid, a, b) > 0:
                critical_lo = mid
            else:
                critical_hi = mid
        critical_ball = arb((critical_hi + critical_lo)/2,
                            (critical_hi - critical_lo)/2)
        radii, heights = [], []
        for index in range(radial_cut * subdivisions):
            left = fmpq(index**2, subdivisions**2)
            right = fmpq((index+1)**2, subdivisions**2)
            if kind == "Q_or_P":
                if right <= critical_lo:
                    density_upper = base_density(arb(right), a, b)
                elif left >= critical_hi:
                    density_upper = base_density(arb(left), a, b)
                else:
                    density_upper = base_density(critical_ball, a, b)
            else:
                t = arb((left+right)/2, (right-left)/2)
                density_upper = base_density(t, a, b) * (t-2)**2 / 2
            height = rational_ceiling(density_upper)
            assert height >= 0
            heights.append(height)
            s = fmpq(index+1, subdivisions)
            radii.append(s * (a+b*s*s))

        # A sum of annular indicators is an exact signed sum of disks.
        coefficients = [height - (heights[i+1] if i+1 < len(heights) else 0)
                        for i, height in enumerate(heights)]
        assert sum(coefficients, fmpq(0)) == heights[0]

        cutoff_t = arb(radial_cut**2)
        if kind == "Q_or_P":
            tail_mass = (cutoff_t+1)*(-cutoff_t).exp()
            tail_density = base_density(cutoff_t, a, b)
        else:
            tail_mass = (cutoff_t**3/2-cutoff_t**2/2+cutoff_t+1)*(-cutoff_t).exp()
            tail_density = base_density(cutoff_t, a, b)*(cutoff_t-2)**2/2
        # Both densities decrease for t>=25. The universal Riesz bound
        # integral g(y)/|y-x| dy <= 2 sqrt(pi ||g||_infty ||g||_1)
        # handles the whole omitted tail, uniformly in x.
        tail_bound = 2 * (arb.pi()*tail_density*tail_mass).sqrt()
        assert tail_bound > 0

        cache = {}

        def signed_parts(x):
            if x not in cache:
                positive, negative = arb(0), arb(0)
                for radius, coefficient in zip(radii, coefficients):
                    if not coefficient:
                        continue
                    term = arb(coefficient)*disk_potential(radius, x)
                    if coefficient > 0:
                        positive += term
                    else:
                        negative += term
                assert positive.is_finite() and negative.is_finite()
                cache[x] = positive, negative
            return cache[x]

        target = price-cost
        leaves = []
        stack = [(fmpq(0), radii[-1], 0)]
        while stack:
            left, right, depth = stack.pop()
            # Every disk potential decreases with x. Positive disk terms
            # use the left endpoint; negative terms use the right endpoint.
            upper = signed_parts(left)[0] + signed_parts(right)[1] + tail_bound
            if upper < arb(target):
                leaves.append({"left": str(left), "right": str(right),
                               "upper_ball": str(upper),
                               "margin_ball": str(arb(target)-upper)})
            else:
                if depth >= 24:
                    raise AssertionError("Uncertified interval; no theorem accepted")
                middle = (left+right)/2
                stack.extend(((left, middle, depth+1), (middle, right, depth+1)))

        # Outside the largest disk, each distance to its points increases
        # with x. The nonnegative annular envelope therefore decreases.
        beyond_support = sum(signed_parts(radii[-1]), arb(0)) + tail_bound
        assert beyond_support < arb(target)
        leaves.sort(key=lambda leaf: fmpq(leaf["left"]))
        assert fmpq(leaves[0]["left"]) == 0
        assert fmpq(leaves[-1]["right"]) == radii[-1]
        assert all(first["right"] == second["left"]
                   for first, second in zip(leaves, leaves[1:]))
        return {"profile": profile, "sector": kind, "cost": str(cost),
                "potential_target": str(target),
                "tail_bound": str(tail_bound),
                "support_radius": str(radii[-1]),
                "beyond_support_upper": str(beyond_support),
                "annular_cells": len(heights), "evaluated_endpoints": len(cache),
                "leaves": leaves}

    profile_specs = [
        ("peak", fmpq(699, 1250), fmpq(179, 1250), fmpq(2500, 1891),
         fmpq(1, 100), fmpq(11, 50)),
        ("flank", fmpq(14, 25), fmpq(1467, 10000), fmpq(200, 149),
         fmpq(3, 100), fmpq(6, 25)),
        ("upper", fmpq(573, 1000), fmpq(19, 125), fmpq(2500, 1891),
         fmpq(1, 25), fmpq(1, 4)),
    ]
    profiles, results = [], []
    for name, a, b, price, cost_q, cost_nu in profile_specs:
        profiles.append({"name": name, "a": str(a), "b": str(b),
                         "p": str(price), "epsilon": str(1/price),
                         "ell": str(a+2*b)})
        results.extend((certify(name, a, b, price, "Q_or_P", cost_q),
                        certify(name, a, b, price, "nu", cost_nu)))
    transcript = {
        "agent_id": "codex-a7c4", "issue": 421,
        "status": "PASS: six uniform potentials at three rows, with analytic radial tails",
        "trust": "Arb interval arithmetic plus the analytic reductions in ODD_CONTROL.md",
        "profiles": profiles,
        "precision_bits": ctx.prec, "python_flint_version": flint.__version__,
        "s_step": f"1/{subdivisions}", "s_cutoff": radial_cut,
        "height_rounding_denominator": str(rounding_denominator),
        "source_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "results": results,
    }
    if args.output:
        args.output.write_text(json.dumps(transcript, indent=2) + "\n")
    print(json.dumps({"status": transcript["status"], "profiles": profiles,
                      "results": [{key: value for key, value in result.items()
                                   if key != "leaves"} for result in results]}, indent=2))


if __name__ == "__main__":
    main()

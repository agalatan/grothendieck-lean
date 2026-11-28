"""Exact phase and gamma moments for the three-cluster cancellation test."""

from itertools import permutations
from math import factorial, prod

import sympy as sp


def check(name, actual, expected):
    difference = sp.simplify(actual - expected)
    if difference != 0:
        raise ValueError(f"{name}: nonzero difference {difference}")


def gamma_mean(expression, variables, shape):
    polynomial = sp.Poly(expression, *variables)
    return sum(
        coefficient * prod(sp.rf(shape, power) for power in powers)
        for powers, coefficient in polynomial.terms()
    )


def linear_profile_test():
    c, s = sp.symbols("c s", positive=True)
    t, b, w = sp.symbols("t b w", nonzero=True)
    radii = sp.symbols("S1:4")
    m = sp.symbols("m1:4")
    conjugates = sp.symbols("n1:4")
    A, Abar = sp.symbols("A Abar")
    y = t * A + b * w
    ybar = t * Abar + b / w
    phase_mean = sp.expand(t * y**2 * ybar).coeff(w, 0)
    # t^2 = R and b^2 = sigma^2 G. R is exponential and G has mean one.
    radial_mean = 0
    for (t_power, b_power), term in sp.Poly(phase_mean, t, b).terms():
        if t_power % 2 or b_power not in (0, 2):
            raise ValueError("Unexpected radial moment in the phase average")
        bulk_mean = 1 if b_power == 0 else s * prod(radii) / c**3
        radial_mean += term * factorial(t_power // 2) * bulk_mean

    def cofactor(coefficients):
        return sum(z * (r - c) for z, r in zip(coefficients, radii))

    integrated = gamma_mean(
        radial_mean.subs({A: cofactor(m), Abar: cofactor(conjugates)}), radii, c
    )
    expected = 4 * c * sum(z**2 * n for z, n in zip(m, conjugates)) + 2 * s * sum(m)
    check("generic complex cofactor", integrated, expected)
    r = sp.Symbol("R")
    check("driver squared norm", gamma_mean(r * (r - 2) ** 2 / 2, (r,), 1), 1)

    def affine(direction):
        substitutions = dict(zip(m, direction))
        substitutions.update(zip(conjugates, map(sp.conjugate, direction)))
        raw = sp.expand(integrated.subs(substitutions))
        norm = sum(abs(z) ** 2 for z in direction)
        # The b-independent coefficient is cubic in the common scale d;
        # the coefficient of s is linear in d. Divide by 2d after rescaling.
        return sp.factor(
            raw.subs(s, 0) * (1 - s) / (2 * c * norm) + s * raw.coeff(s) / 2
        )

    omega = (-1 + sp.sqrt(3) * sp.I) / 2
    for direction, rotation in [((1, -1, 0), -1), ((1, omega, omega**2), omega)]:
        if not any(
            all(sp.simplify(x - rotation * y) == 0 for x, y in zip(direction, perm))
            for perm in permutations(direction)
        ):
            raise ValueError("Missing phase symmetry")
        check("symmetric direction", affine(direction), 0)

    check("zero sum alone", affine((1, 1, -2)), -2 * (1 - s))
    control = affine((1, 1, -sp.Rational(3, 2)))
    check("accidental cancellation", control.subs(s, sp.Rational(22, 39)), 0)
    check("same direction at zero bulk", control.subs(s, 0), -sp.Rational(11, 17))
    print("Exact phase and gamma moments, driver norm, two rotations and controls passed.")


if __name__ == "__main__":
    linear_profile_test()

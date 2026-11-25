"""Exact Wick-moment controls for the real Gaussian carrier in ledger 6.3.16b.

Agent-ID: codex-a7c4. Standard library only. Exponents in six variables represent
z_1,z_2,z_3,conj(z_1),conj(z_2),conj(z_3); three-variable exponents represent H.
"""

from fractions import Fraction
from itertools import product
from math import factorial, prod


def require(test, message):
    if not test:
        raise ArithmeticError(message)


def add(*polynomials):
    result = {}
    for polynomial in polynomials:
        for powers, coefficient in polynomial.items():
            result[powers] = result.get(powers, 0) + coefficient
    return {powers: value for powers, value in result.items() if value}


def scale(polynomial, scalar):
    return {powers: value * scalar for powers, value in polynomial.items() if value * scalar}


def multiply(*polynomials):
    if any(not polynomial for polynomial in polynomials):
        return {}
    dimension = len(next(iter(polynomials[0])))
    result = constant(dimension, 1)
    for polynomial in polynomials:
        terms = {}
        for (left, a), (right, b) in product(result.items(), polynomial.items()):
            powers = tuple(i + j for i, j in zip(left, right))
            terms[powers] = terms.get(powers, 0) + a * b
        result = terms
    return {powers: value for powers, value in result.items() if value}


def variable(dimension, index):
    return {tuple(int(i == index) for i in range(dimension)): 1}


def constant(dimension, value):
    return {(0,) * dimension: value} if value else {}


def conjugate(polynomial):
    return {powers[3:] + powers[:3]: value for powers, value in polynomial.items()}


def complex_moment(polynomial):
    return sum(value * prod(map(factorial, powers[:3])) for powers, value in polynomial.items()
               if powers[:3] == powers[3:])


def gaussian_moment(n):
    return 0 if n % 2 else factorial(n) // (2**(n // 2) * factorial(n // 2))


def real_moment(polynomial):
    return sum(value * prod(map(gaussian_moment, powers)) for powers, value in polynomial.items())


def quadrics(x, y, z, s):
    """Coordinates of z cross (A_s z), identical for real and complex indeterminates."""
    return (
        add(multiply(y, z), scale(multiply(z, z), -s)),
        add(scale(multiply(x, z), -2), scale(multiply(y, z), s)),
        add(multiply(x, y), scale(multiply(x, z), s), scale(multiply(y, y), -s)),
    )


def check(s):
    z = [variable(6, i) for i in range(3)]
    zbar = list(map(conjugate, z))
    coeffs = quadrics(*z, s)
    q = add(*(multiply(zbar[i], coeffs[i]) for i in range(3)), scale(z[0], -s), scale(z[2], -s))
    odd = {powers: value for powers, value in q.items() if (powers[1] + powers[4]) % 2}
    even = add(q, scale(odd, -1))
    odd_norm, even_norm = (complex_moment(multiply(p, conjugate(p))) for p in (odd, even))
    require((odd_norm, even_norm) == (6, 6 * s**2), "parity energy")
    require(complex_moment(multiply(odd, conjugate(even))) == 0, "orthogonality")

    real_coeffs = quadrics(*(variable(3, i) for i in range(3)), s)
    a = [add(constant(3, real_moment(p)), scale(p, -1)) for p in real_coeffs]
    covariance = tuple(tuple(real_moment(multiply(left, right)) for right in a) for left in a)
    require(covariance == ((1 + 2*s**2, s, 0), (s, 4 + s**2, -2*s), (0, -2*s, 1 + 3*s**2)),
            "covariance of the explicit family")
    variance = add(*(multiply(p, p) for p in a))
    require(all(real_moment(p) == 0 for p in a), "centered quadratic coefficients")
    require(real_moment(variance) == odd_norm + even_norm, "law energy")
    excess = Fraction(2 * real_moment(multiply(variance, variance)), (odd_norm + even_norm)**2) - 2

    # Proper Gaussian radial moments and regression give k! E[V^k] and (k+1)! E[A_j V^k].
    norm_sq = multiply(q, conjugate(q))
    norm_power = constant(6, 1)
    variance_power = constant(3, 1)
    for k in range(4):
        require(complex_moment(norm_power) == factorial(k) * real_moment(variance_power),
                "radial moment")
        original = tuple(complex_moment(multiply(p, q, norm_power)) for p in zbar)
        surrogate = tuple(factorial(k + 1) * real_moment(multiply(p, variance_power)) for p in a)
        require(original == surrogate, "content-vector moment")
        if s == 1 and k == 1:
            require(original == (48, 4, 44) and excess == Fraction(31, 3), "balanced witness")
        norm_power = multiply(norm_power, norm_sq)
        variance_power = multiply(variance_power, variance)
    print(f"s={s}: parity energies {odd_norm}, {even_norm}; fourth excess {excess}; "
          "four radial and componentwise content comparisons passed")


if __name__ == "__main__":
    # The positive-square identity in the note bounds ||M||/tr(M) for every s.
    t = Fraction(2, 3)
    c0, c1, c3, gamma = (Fraction(x, 10**12) for x in
                          (57244599935, -1501543759, 3157217, 213543031787))
    coeff = Fraction(37, 3) * (1 + 4*t) - Fraction(100, 3)
    cap = c0 + c1 + gamma*t + c3 * (15*coeff - Fraction(34, 3))
    require(coeff > 0 and cap == Fraction(595896997819, 3000000000000) < Fraction(1, 5),
            "scalar envelope at normalized covariance 2/3")
    print(f"all-ratio explicit-family content coefficient {cap} < 1/5")
    for s in (Fraction(1), Fraction(1, 3), Fraction(2)):
        check(s)

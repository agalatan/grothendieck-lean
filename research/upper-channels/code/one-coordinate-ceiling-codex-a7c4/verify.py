#!/usr/bin/env python3
"""An exact Hilbert-Schmidt bound for one-coordinate charge-one rounding. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from math import factorial

RADIUS = 8
GRID = 256
SCALE = 2**32
BESSEL_TERMS = 110
POSITIVE_TERMS = 16


def require(test, message):
    if not test:
        raise ArithmeticError(message)


def ceil_div(num, den):
    return -((-num) // den)


def denominator_coefficients():
    # Positive Taylor coefficients of 1F1(1/2;2;x).
    coeff = [Q(1)]
    for k in range(POSITIVE_TERMS):
        coeff.append(coeff[-1] * Q(2*k+1, 2*(k+2)*(k+1)))
    return coeff


def radial_weights(coeff):
    weights = []
    for i in range(RADIUS * GRID):
        x = Q(i*i, 2*GRID**2)
        partial = sum(c*x**k for k,c in enumerate(coeff))
        weights.append(ceil_div(SCALE * partial.denominator, partial.numerator))
    return weights


def bessel_grid():
    # J1(i/G) = i/(2G) sum (-i^2)^k / ((4G²)^k k!(k+1)!).
    p = BESSEL_TERMS
    max_x = RADIUS**2
    tail = Q(max_x, 2)**(2*p+3) / (factorial(p+1)*factorial(p+2))
    require(max_x**2 < 4*(p+2)*(p+3) and tail < Q(1, SCALE), "alternating-series remainder")
    base = 4*GRID**2
    den = base**p * factorial(p) * factorial(p+1)
    coeff = [den // (base**k * factorial(k) * factorial(k+1)) for k in range(p+1)]
    vals = []
    for i in range(max_x*GRID+1):
        value = 0
        for c in reversed(coeff):
            value = c-i*i*value
        vals.append(ceil_div(abs(i*value)*SCALE, 2*GRID*den)+1)
    return vals


def calculate():
    coeff = denominator_coefficients()
    weights = radial_weights(coeff)
    bessel = bessel_grid()
    require(SCALE % GRID**2 == 0, "exact cell distance units")
    total = 0
    for i, wi in enumerate(weights):
        for j in range(i+1):
            # Nearest Bessel mesh point to the product of the cell midpoints.
            k = ((2*i+1)*(2*j+1) + 2*GRID) // (4*GRID)
            reach = max(k*GRID - i*j, (i+1)*(j+1) - k*GRID)
            cap = min(SCALE, bessel[k] + reach*(SCALE//GRID**2))
            total += (1 if i == j else 2) * wi * weights[j] * cap**2
    bulk = Q(total, GRID**2 * SCALE**4)
    p = POSITIVE_TERMS
    tail = RADIUS / ((2*p-1)*coeff[p]*Q(RADIUS**2,2)**p)
    outside = 2*RADIUS*tail + tail**2
    bound = Q(8*106,333)*(bulk+outside)  # pi > 333/106
    require(8*106*outside < 333*Q(23, 10**9), "tail allowance")
    require(bound < Q(139, 100), "squared Hilbert-Schmidt norm below 1.39")
    # The uniform absolute Bessel bound alone is insufficient on this mesh.
    no_bessel = Q(sum(weights), GRID*SCALE)**2
    require(Q(8*106, 333)*no_bessel > 2, "constant-kernel negative control")
    require(Q(139,100)-1 < Q(5,8)**2, "spectral remainder below 5/8")
    return bulk, outside, bound


if __name__ == "__main__":
    bulk, outside, bound = calculate()
    for label, cap in (("compact square", Q(8*106,333)*bulk),
                       ("exterior strips", Q(8*106,333)*outside), ("total", bound)):
        upper = ceil_div(10**9 * cap.numerator, cap.denominator)
        print(f"{label}: upper bound {upper}/1000000000")
    print("Squared Hilbert-Schmidt norm < 1.39; remaining operator norm < 5/8.")

"""Apply the sharp buffered Rice theorem to the occupied negative-fifth rectangle.

The full continuous polynomial and Hermite plane checks are in occupied_identity_debit.py
and reverse_fifth_planes.py. This replay changes only their final scalar prices.
Agent-ID: codex-a7c4
"""
from fractions import Fraction as Q
from math import isqrt
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import occupied_identity_debit as price
import reverse_fifth_planes as reverse
from one_coordinate_multiplier import pi_interval, require


def buffered_support(lam):
    require(0 <= lam**2 <= Q(1, 6), 'buffered comparison outside its proved range')
    square = price.MU_UP**2 * (1 + lam**2)
    scale = 10**14
    top = Q(isqrt(square.numerator * scale**2 // square.denominator) + 1, scale)
    require(top > 0 and top**2 > square, 'outward support rounding')
    return top


def main():
    lo, hi = pi_interval()
    require(4 * price.MU_LO**2 < lo < hi < 4 * price.MU_UP**2, 'Gaussian mean enclosure')
    T, r = price.T, price.R
    require(T**2 + r**2 < price.MU_LO**2, 'strictly occupied rectangle')
    require(T**2 >= Q(6, 7) * price.MU_UP**2, 'sharp upper frontier applies')
    upper = buffered_support(price.L)
    require(upper <= Q('.937862468207'), 'buffered support at identity tilt')
    slack = upper - price.C
    require(0 <= slack <= Q(1462231, 8 * 10**12), 'identity support slack')
    # The preceding 8192-cell certificate bounds the price for every radius. Its
    # final inequality permits any positive Young coefficient satisfying these signs.
    coef = 4 * price.NU * Q('1.883') + price.BETA * 2 * abs(price.V) * Q('1.540')
    cy = Q(956)
    gamma = cy + price.BETA * (1 + 1 / price.EPS) * Q('5.657')
    require(gamma > price.RATE and gamma > 2 * price.ALPHA and gamma * price.L > 2 * price.BETA,
            'contact monotonicity for the new Young coefficient')
    shape = Q('.002')
    m3 = 6 + 9 * shape + Q('40.45313') * shape * Q('.04473')
    bound = (price.ALPHA * T**2 + price.NU + price.BETA * r**2
             + sum(a*b for a, b in zip(price.POLY, (1, 1, 2, m3)))
             + coef**2 / (4 * cy) + (gamma - price.RATE) * slack)
    require(bound < Q('.713146681'), 'identity payoff on the whole rectangle')
    # The identity support already forced the fourth excess below .002. The
    # reverse planes may use a different tilt while retaining that same shape.
    other = buffered_support(reverse.LAM)
    require(other <= Q('.93676586012863'), 'buffered support at reverse-plane tilt')
    delta_lo = reverse.floor(T, r, shape, sup=other)
    require(delta_lo > Q('-.011921966'), 'reverse fifth bound')
    w = Q('.00003579')
    pure = (1 - w) * bound + w * (price.MU_UP**2 - r**2)
    require(pure < Q('.713146257'), 'same-rectangle matched zero-debit payoff')
    # At d=0 and at the other endpoint respectively. The payoff is affine in d.
    cap = Q(71325109802694, 10**14)
    require(pure < cap and pure - Q('.00879') * delta_lo < cap, 'whole debit interval')
    print('On the occupied rectangle V0 < .713146681, Delta5 > -.011921966, and')
    print('every fifth debit through .00879 fits the signed cap .71325109802694.')


if __name__ == '__main__':
    main()

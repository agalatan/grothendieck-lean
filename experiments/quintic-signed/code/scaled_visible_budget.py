"""Exact comparisons for scaled cubic/fifth projection tangents. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from math import factorial
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gaussian_driver_compensation import E, NU, PI_LO, PI_HI, atan_bounds, require

MU_LO, MU_HI = Q(".886226925"), Q(".886226926")
TARGET = Q(10000, 14023)
CUTOFF = 128


def core_price(radius_sqrt):
    """2 times the integral of (r-x)sqrt(x)(1-x+x²/2) from 0 to r."""
    z = radius_sqrt
    return sum(2 * (-1)**j * z**(5+2*j) /
               (factorial(j) * Q(2*j+3, 2) * Q(2*j+5, 2)) for j in range(3))


def upper(t, debit, s, b, z, net_energy):
    r = z*z
    w = E+NU
    linear = s*w/2 + 3*debit*b/4
    quadratic = debit*b/8
    at_zero = s*w+3*debit*b/4
    at_r = at_zero-linear*r+quadratic*r*r
    require(at_r >= 0 and linear >= quadratic*(CUTOFF+r), "outer root after the cutoff")
    require(0 <= s <= 1 and 0 <= b <= 1 and 0 < z < 1, "projection tangents")
    tail = Q(CUTOFF**3+3*CUTOFF**2+6*CUTOFF+6, 1) / Q(2718281, 10**6)**CUTOFF
    return (NU+(1-NU)*t*t
            +(w*(s*s-2*s)/32+3*debit*(b*b-2*b)/256)*PI_LO
            + MU_HI*(at_r*(MU_HI-t)
                     +(linear-quadratic*r)*core_price(z)+2*quadratic*tail)
            +(E-NU)*net_energy)


def main():
    a,b=atan_bounds(Q(1,5))
    c,d=atan_bounds(Q(1,239))
    require(4*MU_LO**2 < PI_LO < 16*a-4*d <= 16*b-4*c < PI_HI < 4*MU_HI**2,
            "Gaussian mean and pi")
    require(sum(Q(1,factorial(j)) for j in range(12)) > Q(2718281,10**6), "exponential tail")
    rows = [(Q(".83743"),Q(".837445"),Q(".787"),Q(".50"),Q(1,3)),
            (Q(".83882"),Q(".83885"),Q(".794"),Q(".51"),Q(1,3)),
            (Q(1071,1280),Q(2151,2560),Q(".80"),Q(".53"),Q(1,3))]
    for debit in [Q(".006"),Q(".02"),NU]:
        for lo,hi,s,b,z in rows:
            payoff = max(upper(t,debit,s,b,z,0) for t in (lo,hi))
            exact = (TARGET-payoff)/(E-NU)
            lower = Q((exact*100000).__floor__(),100000)
            require(all(upper(t,debit,s,b,z,lower)<TARGET for t in (lo,hi)),
                    "strict payoff at both endpoints of a convex quadratic")
            print(f"d={debit}, t∈[{lo},{hi}], net cubic energy ≤ {lower} ({float(lower):.5f})")


if __name__ == "__main__":
    main()

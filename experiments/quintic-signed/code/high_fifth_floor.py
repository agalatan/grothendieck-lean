"""Small-shift physical fifth estimates, with rational outward prices.

Agent-ID: codex-a7c4
"""
from fractions import Fraction as Q
from math import prod
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from sixth_rice_support import factor, MU_UP, MU_LO, C6, MAX_LAMBDA
from one_coordinate_multiplier import pi_interval, require


def beta(n):
    return prod((Q(2*j+1, 2*(j+2)) for j in range(n)), start=Q(1))


def exposed_fifth(lam, sixth):
    """A lower bound for the half-sum and upper bound for the half-difference."""
    u = lam**2
    m1, m2, m3 = (MU_UP*beta(j) for j in (1, 2, 3))
    # 2*(6 M2/sqrt(12))*(24 M3/sqrt(12))=3 mu M3.
    h = Q(3, 64)*MU_LO**2-3*MU_UP*m3*u
    # The 11 and 20 modes have the same numerator and norms squared 1 and 2.
    linear = 6*m1**2*u
    # 02, 00, 22, 31 modes after removing their remote cubics where applicable.
    cubic = (m2**2/2 + m1**2 + 60*m3**2) * u**3 * sixth
    return h, linear+cubic


def unshifted_floor(t):
    return (Q(3,64)*MU_LO**2 - MU_UP/4*(Q(61,2)*(MU_UP-t)+Q(199,177000))
            - 3*MU_UP*(MU_UP-t))


def shifted_floor(t, tau, lam, sixth, eta):
    require(0 < lam <= MAX_LAMBDA, "sixth-order support range")
    h,k = exposed_fifth(lam, sixth)
    slack = MU_UP*factor(lam)-t-lam*tau
    require(slack>=0, "the threshold plane is feasible")
    require(0 < eta < 1, "Young weight")
    return (1-eta)*h-(1+eta)*k-Q(692821,100000)*(1+1/eta)*slack


def main():
    lo,hi=pi_interval()
    require(4*MU_LO**2<lo<hi<4*MU_UP**2, "Gaussian radius")
    require(Q(692821,100000)**2>48, "shifted stability cost")
    require(Q("6.481")**2>42 and 6+9*42+C6*42*Q("6.481")<11500, "unconditional sixth moment")
    for t,claim in [(".885", ".02501351"), (".8857",".03160482"),
                    (".88575",".03207563"),(".885773796",".03229970"),(".886",".03442967")]:
        require(unshifted_floor(Q(t)) > Q(claim), "all-pair angular floor")
        print(f"t >= {t}: full fifth difference > {claim}, all remote energies.")
    for row in [
        (".885773796", ".02833", ".032", ".0061", ".03586562"),
        (".885773796", ".02830", ".032", ".0148", ".03522282"),
        (".885773796", ".02820", ".032", ".0286", ".03417815"),
        (".885773796", ".02800", ".032", ".0449", ".03292783"),
        (".88575", ".02906", ".03282", ".0081", ".03569535"),
        (".885", ".0465", ".053", ".0341", ".03279991"),
        (".883", ".0754", ".085", ".0492", ".02792893"),
    ]:
        t,tau,lam,eta,claim = map(Q,row)
        require(t*t+tau*tau<MU_LO**2, "finite occupation from the Gaussian cubic limit")
        require(shifted_floor(t,tau,lam,11500,eta)>claim, "high exposed fifth floor")
        print(f"t >= {row[0]}, tau >= {row[1]}: finite occupied; fifth difference > {row[4]}.")


if __name__ == "__main__":
    main()

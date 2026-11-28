"""Exact arithmetic for the all-dimensional signed visible-polynomial bound. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from math import factorial
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))

from gaussian_driver_compensation import E, NU, PI_LO, PI_HI, atan_bounds, cap_at_one, require

MU_LO, MU_HI = Q(".886226925"), Q(".886226926")
CUTOFF = 128


def main():
    a, b = atan_bounds(Q(1, 5))
    c, d = atan_bounds(Q(1, 239))
    require(PI_LO < 16*a-4*d <= 16*b-4*c < PI_HI, "Machin pi interval")
    require(4*MU_LO**2 < PI_LO < PI_HI < 4*MU_HI**2, "Gaussian mean enclosure")
    exp_lower = Q(2718281,10**6)
    require(sum(Q(1,factorial(j)) for j in range(12)) > exp_lower, "exp(1) lower bound")
    require(NU*CUTOFF/8 < (E+NU)/2, "radial weight decreases from its constant bound")
    require(1-E-2*NU-3*NU/4 > 0, "visible loss sign at every amplitude")
    tail = (CUTOFF**3 + 3*CUTOFF**2 + 6*CUTOFF + 6)/exp_lower**CUTOFF
    require(MU_HI*NU*tail/4 < Q(3,10**52), "uniform tail in the actual payoff")
    require(E*Q(93,100)**2 < cap_at_one(NU,PI_LO/4), "diagonal negative arm")
    for debit, target, local in [
        (Q(1,50), Q("1.40372082"), [Q(".06500"),Q(".06324"),Q(".06129")]),
        (NU, Q("1.40397477"), [Q(".06502"),Q(".06327"),Q(".06132")]),
    ]:
        error = MU_HI*debit*tail/4
        base = cap_at_one(debit,PI_HI/4)
        require(1/(base+error) > target, "diagonal reciprocal")
        for (lo,hi),q in zip([(Q(".83743"),Q(".837445")), (Q(".83882"),Q(".83885")),
                               (Q(1071,1280),Q(2151,2560))], local):
            reduction = ((1-NU)*lo+(1-E-2*NU-3*debit/4)*MU_LO)*(MU_LO-hi)
            require(base+error-reduction+(E-NU)*q < Q(10000,14023), "actual Qk energy range")
            print(f"d={debit}, t in [{lo}, {hi}], squared cubic energy ≤ {q}: signed real payoff < 10000/14023")
        print(f"d={debit}: all diagonal pairs have reciprocal cap above {target}")
    low = Q(".22436282")
    require(NU+(1-NU)*low**2+(E-NU)*Q(".93")**2 < Q(10000,14023),
            "all-sector low-amplitude cap")
    for debit,left in [(Q(1,50),Q(".88577726")), (NU,Q(".88569774"))]:
        a, b = 2*E-NU-1, 3*E-1+3*debit/4
        require(b>a>0, "high profile decreases throughout the physical interval")
        price = cap_at_one(debit,PI_HI/4)+Q(3,10**52)+(MU_HI-left)*(a*left+b*MU_HI)
        require(price < Q(10000,14023), "unrestricted high signed real cap")
        print(f"d={debit}: all sectors and t≥{left} pass the 1.4023 real-payoff test")
    exp_upper = Q(2718282,10**6)
    # From the first omitted term 1/12!, successive ratios are at most 1/13.
    require(sum(Q(1,factorial(j)) for j in range(12)) + Q(13,12*factorial(12))
            < exp_upper, "upper bound for exp(1)")
    for debit, left, lower_gain in [(Q(1,50),180,Q(3,10**77)), (NU,151,Q(8,10**65))]:
        right = left+1
        lag = 3-3*left+Q(left**2,2)
        sign = 1-NU + (E+NU)*(right-2)/4-debit*lag/8
        require(left > 12**2 and right < 15**2 and sign < 0, "sign of radial flip")
        require(15*(right-2) < 3000 and 15*(3-3*right+Q(right**2,2)) < 300000,
                "radial projection coefficients on the shell")
        require(4*((E+NU)*3000**2 + debit*300000**2)*Q(1,2**left) < 1,
                "quadratic loss of the flip")
        gain = (-4*MU_LO*12*sign-1)/(2*exp_upper**left)
        require(gain > lower_gain, "strict gain above the single visible phase")
        print(f"d={debit}: radial flip in [{left},{right}] strictly raises the diagonal payoff")
    print("Uniform diagonal cap minus visible-phase value is positive for d>0 and below 3e-52.")


if __name__ == "__main__":
    main()

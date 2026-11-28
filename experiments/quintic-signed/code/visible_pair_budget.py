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
    print("Uniform diagonal cap minus visible-phase value is below 3e-52.")


if __name__ == "__main__":
    main()

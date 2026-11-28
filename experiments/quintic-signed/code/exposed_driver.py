"""Inverse-radius stability near decoupled cubic supports. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from math import comb, factorial, prod
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from gaussian_driver_compensation import PI_HI, PI_LO, NU, atan_bounds, cap_at_one, require


def determinant(a):
    if not a:
        return Q(1)
    return sum(
        (-1)**j * x * determinant([row[:j]+row[j+1:] for row in a[1:]])
        for j,x in enumerate(a[0])
    )


def laguerre_blocks(price):
    minima = []
    for m in range(6):
        size = 1+(5-m)//2
        powers = [[Q((-1)**k * comb(m+j,j-k), factorial(k)) for k in range(j+1)]
                  for j in range(size)]
        moments = [prod((Q(2*l-1,2) for l in range(1,j+1)),start=Q(1))
                   for j in range(6)]
        matrix = []
        for i,f in enumerate(powers):
            row = []
            for j,g in enumerate(powers):
                value = sum(a*b*moments[m+k+l] for k,a in enumerate(f) for l,b in enumerate(g))
                row.append((price*Q(factorial(m+i),factorial(i)) if i==j else 0)-value)
            matrix.append(row)
        minors = [determinant([row[:j] for row in matrix[:j]]) for j in range(1,size+1)]
        minima.append(min(minors))
    return minima


def main():
    a,b = atan_bounds(Q(1,5))
    c,d = atan_bounds(Q(1,239))
    require(PI_LO < 16*a-4*d <= 16*b-4*c < PI_HI, "Machin pi interval")
    hi,lo = Q(1696,1000),Q(1695,1000)
    minors = laguerre_blocks(hi)
    require(min(minors)>0, "unpriced angular mode in the degree-five inverse radius")
    require(laguerre_blocks(lo)[0]<0, "lower comparison must fail in the radial block")
    # Total perturbation <= C sqrt(D). Use independent outward rational square roots.
    r, four = Q(130231,100000), Q(133134,100000)
    require(r*r>hi and four**4>PI_HI, "outward root bounds")
    c2 = 8*four**2*(NU+(1-NU)*r)**2
    require(c2 < Q("4.878")**2, "uniform stability constant")
    for debit, width in [(Q(1,50), Q(218,10**10)),(NU,Q(303,10**10))]:
        room = Q(10000,14023) - cap_at_one(debit,PI_HI/4)
        require(room>0 and c2*width<room**2, "1.4023 tube of support deficits")
        print(f"d={debit}: D ≤ {width} gives absolute signed payoff < 10000/14023")
    print("All six Laguerre blocks pass at 1.696; the radial block fails at 1.695.")


if __name__ == "__main__":
    main()

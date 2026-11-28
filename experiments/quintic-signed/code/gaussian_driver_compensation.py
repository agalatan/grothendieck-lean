"""All-amplitude signed fifth comparison for two-charge Gaussianized drivers. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from functools import lru_cache
from math import ceil

PI_LO, PI_HI = Q("3.141592653"), Q("3.141592654")
E, NU = Q(191, 250), Q(47, 2000)
A_LO, A_HI = PI_LO / 4, PI_HI / 4
SCALE = 10**15
END_ARM = Q(99, 100)


def require(condition, text):
    if not condition:
        raise ArithmeticError(text)


def atan_bounds(q):
    terms = [(-1)**j * q**(2*j+1)/(2*j+1) for j in range(12)]
    return sum(terms), sum(terms[:-1])


def coefficients(count):
    # a_j divided by pi/4, the exact complex Gaussian phase spectrum.
    values = [Q(1)]
    for j in range(count-1):
        values.append(values[-1] * Q((2*j+1)**2, 4*(j+1)*(j+2)))
    return values


COEFF = coefficients(64)


@lru_cache(maxsize=None)
def psi_upper(z):
    if z < 0:
        return A_LO * z
    # The unretained positive coefficients have sum 1 - sum a_j.
    tail = 1 - A_LO * sum(COEFF[:32])
    for c in reversed(COEFF[:32]):
        tail = Q(ceil(SCALE * (A_HI*c + z*z*tail)), SCALE)
    return z * tail


def poly_upper(lo, hi, d):
    # The psi-free part after collecting pi/4. Each monomial has a fixed sign.
    result = E+NU+(1-E-2*NU)*hi-(E+NU)*lo**3/8
    result += d*(3*hi**2*(1-lo)/8 + (1-lo)**3/8 - 3*lo**5/64)
    return max(A_LO*result, A_HI*result)


def cap_at_one(d, alpha):
    return NU + alpha*(1-NU - (E+NU)/8 - 3*d/64)


def cover(lo, hi, d, threshold):
    if poly_upper(lo, hi, d) + NU*psi_upper(2*hi-1) < threshold:
        return 1
    require(hi-lo > Q(1, 2**24), f"unresolved interval {lo}, {hi}")
    mid = (lo+hi)/2
    return cover(lo, mid, d, threshold) + cover(mid, hi, d, threshold)


def main():
    a,b = atan_bounds(Q(1,5))
    c,d = atan_bounds(Q(1,239))
    require(PI_LO < 16*a-4*d <= 16*b-4*c < PI_HI, "Machin pi enclosure")
    z = 2*END_ARM - 1
    slope = 1-E-2*NU-3*(E+NU)/8
    slope -= NU*(15*Q(1,64)+Q(3,8))
    slope += 2*NU*sum((2*j+1)*c*z**(2*j) for j,c in enumerate(COEFF))
    require(A_LO*slope > Q(1,1000), "terminal arm must increase for every debit")
    for debit in (Q(0), NU):
        threshold = cap_at_one(debit, A_LO)
        count = cover(Q(0), END_ARM, debit, threshold)
        print(f"d={debit}: {count} closed interval bounds, then positive slope to x=1")
    def upper(d):
        return cap_at_one(d, A_HI)
    require(cap_at_one(0,A_LO) > Q(10000,14023), "pure phase prevents 1.4023")
    require(A_LO > cap_at_one(0,A_HI), "pure retuning cannot improve the endpoint obstruction")
    require(2*NU + (E+NU)*A_HI/8 < Q(".13") < cap_at_one(NU, A_LO),
            "negative-payoff bound must lie below the attained positive maximum")
    for debit,target in ((Q(1,1000),Q("1.40234387")),
                         (Q(1,50),Q("1.40372082")), (NU,Q("1.40397477"))):
        require(0 < debit <= NU and 1/upper(debit) > target, "outward restricted reciprocal")
        print(f"d={debit}: restricted reciprocal > {target}")
    require(1/cap_at_one(NU,A_LO) < Q("1.40397478"), "optimal cap bracket")
    print("Optimal restricted reciprocal is strictly between 1.40397477 and 1.40397478.")


if __name__ == "__main__":
    main()

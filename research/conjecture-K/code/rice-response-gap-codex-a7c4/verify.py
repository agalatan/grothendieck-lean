"""Exact response-energy and consumer checks for ledger 2.12g. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q


def require(condition, claim):
    if not condition:
        raise ValueError(claim)


def atan_bounds(d, n):
    """Alternating sums of 2n and 2n+1 terms trap atan(1/d)."""
    lo = sum(Q((-1)**j, (2*j+1)*d**(2*j+1)) for j in range(2*n))
    return lo, lo + Q(1, (4*n+1)*d**(4*n+1))


def verify():
    a_lo, a_hi = atan_bounds(5, 10)
    b_lo, b_hi = atan_bounds(239, 3)
    pi_lo, pi_hi = 16*a_lo-4*b_hi, 16*a_hi-4*b_lo
    require(Q(177,100)**2 < pi_lo, "lower square-root factor")
    require(4*Q(35,36) > Q(41,36)**2, "fourth/sixth moment quadratic")
    require(Q(4045313,100000) < 41, "sixth moment coefficient")

    eps0 = Q(1891,2500)
    A, B = Q(886762780,10**9), Q(432306903,10**9)   # 2.12a
    t0, remote = Q(83992,100000), Q(458,10000)
    mlo = remote/(4*eps0**2*B**2)
    mhi = (A-t0)/B
    require(0 < mlo < mhi < Q(1,9), "Rice curvature window")
    gap = Q(177,100)/32*(1-mhi/2)*mlo**2/(1+3*mhi/4)
    require(gap > Q(5547,10**7), "uniform contradiction margin")
    improved = 4*eps0**2*B*(A-t0-gap)
    require(improved < remote, "contradiction to remote energy >= 0.0458")
    total = Q(3,2)*eps0**2*(pi_hi/4-t0**2)+remote/4
    require(total < Q(8005,100000) < Q(80051,10**6), "total energy below 0.08005")
    print("For t >= 83992/100000: remote < 458/10000, total < 8005/100000 (peak scale).")

    ell0, beta0 = Q(1057,1250), Q(179,1250)
    benchmark = Q(13739535256616,10**13)  # 3.14
    allowance = Q(4936,10**8)              # 7.4.16, or 7.5.13 for all six sectors
    consumers = ((eps0, 85468, Q(500,701)), (Q(94,125), 85047, Q(500,701)),
                 (Q(3,4), 84931, Q(500,701)), (Q(299,400), 84814, Q(713263,10**6)))
    for eps, right, cap in consumers:
        scale = eps/eps0
        require(0 < scale <= 1, "weighted scaling applies")
        def value(t):
            return (t*t-2*scale*ell0*t+2*(scale*beta0)**2/eps
                    +scale*(benchmark+allowance))
        hi = Q(right,100000)
        margin = cap-max(value(t0),value(hi))
        require(margin > 0, f"consumer at {eps}")
        print(f"epsilon {eps}, t in [{t0}, {hi}], exact reserve {margin}")


if __name__ == "__main__":
    verify()

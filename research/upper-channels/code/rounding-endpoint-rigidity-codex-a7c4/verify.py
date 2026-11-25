"""Exact thresholds for the rounding endpoint estimates. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q


def require(condition, message):
    if not condition:
        raise ArithmeticError(message)


def atan_interval(q):
    # Consecutive partial sums enclose atan(1/q).
    lower = sum(Q((-1) ** j, (2*j+1)*q**(2*j+1)) for j in range(8))
    return lower, lower + Q(1, 17*q**17)


def check():
    a0, a1 = atan_interval(5)
    b0, b1 = atan_interval(239)
    pi_lo, pi_hi = Q(314, 100), Q(355, 113)
    require(pi_lo < 16*a0-4*b1 < 16*a1-4*b0 < pi_hi < Q(22, 7),
            "Machin enclosure must imply all pi bounds used below")
    # q = (3/5)L_1^(1). The signed integral is (7/20)*sqrt(pi).
    require(-Q(1,5)*Q(1,2) + Q(3,5)*Q(3,4) == Q(7,20), "signed integral")
    correction = Q(2,15)*(Q(2,3) - Q(7,6)*Q(2,5) + Q(1,6)*Q(2,7))
    require(correction == Q(52,1575), "small-x sign correction")
    sqrt_pi_hi, sqrt_three_lo = Q(1773,1000), Q(173,100)
    require(pi_hi < sqrt_pi_hi**2 and sqrt_three_lo**2 < 3, "root brackets")
    error = Q(16,25)
    require(Q(7,20)*sqrt_pi_hi + correction/sqrt_three_lo < error, "L1 witness")
    budget, s = 2*Q(3,5)**2, Q(1,100)
    require(error**2*budget > (2-budget)**2*s/2, "quadratic maximum at endpoint")
    require((error+Q(3,50))**2 == Q(49,100), "first-coefficient bound")
    require(2*Q(49,100) - (1-s) == -Q(1,100), "transfer bound")
    # The strict inequality above for the witness error makes both bounds strict.
    for intercept, slope in [(Q(783,1000),Q(7,10)),(Q(7827,10000),Q(71,100))]:
        residual = 1+slope-pi_hi/2
        require(residual > 0 and residual**3 > 1152/pi_lo*(pi_hi/4-intercept)**2,
                "high-first-coefficient barrier")
    # Negative controls for the specific sufficient inequalities.
    require(Q(7,20)*sqrt_pi_hi+correction/sqrt_three_lo > Q(63,100),
            "same integration bound cannot be rounded to .63")
    require((1+Q(7,10)-pi_hi/2)**3 < 1152/pi_lo*(pi_hi/4-Q(782,1000))**2,
            "same coarse threshold test cannot extend to .782")
    print("At absolute alternating score >= .99, |H0| < .49 and D < -.01.")
    print("H0 >= .783 implies D < .70; H0 >= .7827 implies D < .71.")
    print("Both rational negative controls pass.")


if __name__ == "__main__":
    check()

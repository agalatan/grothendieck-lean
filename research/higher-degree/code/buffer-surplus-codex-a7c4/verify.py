#!/usr/bin/env python3
"""Replay the rational comparisons for the clipped degree-five bound. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q

EPS = Q(39, 50)
ETA = Q(779, 10000)
TARGET = Q(500, 701)
PI_LO = Q(333, 106)
PI_HI = Q(22, 7)
RADII = (Q(2287, 2500), Q(4571, 5000))
SIGMA_LO = Q(17, 25)
SIGMA_SPLIT = Q(91, 125)
SIGMA_HI = Q(371, 500)
MEAN_LO = Q(181, 200)
MEAN_HI = Q(915, 1000)
EVENT_LO = Q(31, 40)
SAVING = Q(9, 10000)


def require(truth, message):
    if not truth:
        raise ValueError(message)


def atan_interval(reciprocal):
    # The arctangent series at x=1/reciprocal alternates with decreasing terms.
    x = Q(1, reciprocal)
    sums = sum((-1) ** k * x ** (2*k + 1) / (2*k + 1) for k in range(8))
    return sums, sums + x**17 / 17


def check_pi():
    # Machin's identity: pi/4=4 arctan(1/5)-arctan(1/239).
    a_lo, a_hi = atan_interval(5)
    b_lo, b_hi = atan_interval(239)
    require(PI_LO < 16*a_lo - 4*b_hi <= 16*a_hi - 4*b_lo < PI_HI, "pi brackets")


def retained_gain(sigma_upper, root_upper, event_lower):
    # p*L(sigma/sqrt(p)) increases with p and decreases with sigma.
    root_event_lower = Q(22, 25)
    require(root_event_lower**2 < event_lower, "square root of event probability")
    require(sigma_upper**2 + 2*ETA**2/PI_LO*event_lower < root_upper**2,
            "conditional gain square root")
    return ETA**2/PI_HI * event_lower * root_event_lower / (sigma_upper + root_upper)


def certify_saving(delta, event_lower=EVENT_LO):
    require(delta > 0, "positive saving")
    require(Q(3) < PI_LO and PI_HI > PI_LO, "pi order")
    require(SIGMA_LO**2 + ETA**2/3 < Q(682, 1000)**2, "small scale square root")
    cutoff = ETA / SIGMA_LO
    require(0 < cutoff < MEAN_LO, "Cantelli centered threshold")
    h2 = (MEAN_LO - cutoff)**2
    require(0 < event_lower < h2/(h2 + 1 - MEAN_LO**2), "Cantelli probability")

    # Closed interval [0,SIGMA_LO] includes the zero cubic without normalization.
    for rho in RADII:
        require(rho < MEAN_HI, "upper bound on first moment")
        require(EPS*rho - Q(682, 1000) > Q(27, 1000), "small-scale loss")
        require(SIGMA_HI - EPS*rho > Q(27, 1000), "large-scale loss")
        require(Q(27, 1000)**2/EPS > delta, "endpoint square completion")
        require(SIGMA_LO >= ETA*rho and EPS > ETA, "clipping coefficients")
        base_lower = EPS*rho**2 + ETA**2/(PI_HI*EPS)
        require((EPS - ETA)*MEAN_LO**2 + ETA < base_lower - delta, "low-mean loss")
        require(ETA < EPS*rho**2 - delta, "zero cubic payoff")

    require(SIGMA_LO < SIGMA_SPLIT < SIGMA_HI, "central scale split")
    lower_gain = retained_gain(SIGMA_SPLIT, Q("0.7301"), event_lower)
    upper_gain = retained_gain(SIGMA_HI, Q("0.7441"), event_lower)
    require(lower_gain > delta, "lower central surplus")
    require(SIGMA_SPLIT > EPS*MEAN_HI, "positive upper square distance")
    upper_square = (SIGMA_SPLIT - EPS*MEAN_HI)**2/EPS
    require(upper_gain + upper_square > delta, "upper central surplus with square")
    return lower_gain, upper_gain, upper_square


def cutoff_slack(rho, t, delta):
    base = EPS*rho**2 + ETA**2/(PI_LO*EPS)
    gap = TARGET - ((1-ETA)*t**2 + base - delta)
    require(gap > 0, "strict displayed cutoff")
    return gap


def negative_control(expected, run):
    try:
        run()
    except ValueError as exc:
        if str(exc) == expected:
            return
        raise
    raise ValueError(f"mutation accepted: {expected}")


def main():
    check_pi()
    lower_gain, upper_gain, upper_square = certify_saving(SAVING)
    require(lower_gain == Q(18812071, 20830000000), "exact lower central surplus")
    require(upper_gain == Q(18812071, 21230000000), "exact upper central Gaussian surplus")
    cases = (
        (RADII[0], Q("0.25282"), Q("0.25283"), Q(329119931276213, 227597175000000000000)),
        (RADII[1], Q("0.25465"), Q("0.25466"), Q(39742622896877, 36415548000000000000)),
    )
    for rho, t, too_high, expected in cases:
        gap = cutoff_slack(rho, t, SAVING)
        require(gap == expected, "exact strict slack")
        # Even the lower pi-relaxed estimate for the original printed upper bound exceeds target.
        original_lower = (1-ETA)*t**2 + EPS*rho**2 + ETA**2/(PI_HI*EPS)
        require(original_lower > TARGET, "strict improvement over original bound")
        negative_control("strict displayed cutoff", lambda: cutoff_slack(rho, too_high, SAVING))
        print(f"rho={rho}, t={t}, slack={gap}")
    negative_control("lower central surplus", lambda: certify_saving(Q(91, 100000)))
    negative_control("Cantelli probability", lambda: certify_saving(SAVING, Q(776, 1000)))
    negative_control("upper surplus alone", lambda: require(upper_gain > SAVING, "upper surplus alone"))
    print(f"uniform gain={SAVING}, lower central surplus={lower_gain}, "
          f"upper central surplus with square={upper_gain + upper_square}, 5 negative controls passed")


if __name__ == "__main__":
    main()

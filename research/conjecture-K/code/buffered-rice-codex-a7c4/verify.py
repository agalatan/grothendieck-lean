"""Replay the exact rational bounds for the buffered cubic Rice inequality.

Run with python3 -IB verify.py. All comparisons stay active under -O.
Agent-ID: codex-a7c4
"""
from fractions import Fraction as Q
from math import factorial

S_MAX = Q(1, 6)
Y_SMALL = Q(1, 11)
Y_LARGE = Q(1)
Y_MAX = Q(7)
C_SIX = Q(40454, 1000)


def require(condition, message):
    if not condition:
        raise ValueError(message)


def verify_normalization():
    # Rice derivative law T ~ Beta(1/2, 3/2).
    moments = [Q(1)]
    for k in range(1, 5):
        moments.append(moments[-1] * (Q(1, 2) + k-1) / (2 + k-1))
    require(moments[1:4] == [Q(1, 4), Q(1, 8), Q(5, 64)], "Rice beta moments")
    require(moments[4] / moments[3] == Q(7, 10), "cubic-weighted beta mean")
    rice = [Q(1)] + [
        (-1)**(k-1) * moments[k-1] / (2*factorial(k)) for k in range(1, 5)
    ]
    require(rice[1:] == [Q(1, 2), -Q(1, 16), Q(1, 96), -Q(5, 3072)],
            "Rice Taylor coefficients relative to R")
    gaussian = [Q(1)]
    for k in range(1, 5):
        gaussian.append(gaussian[-1] * (Q(1, 2) - (k-1)) / k)
    # Use the Rice cubic and fourth-order square-root lower bound.
    require([16*(rice[2]-gaussian[2]), 16*(rice[3]-gaussian[3]), -16*gaussian[4]]
            == [1, -Q(5, 6), Q(5, 8)], "Gaussian Jensen-gap coefficients")
    require(Q(128, 7)**2 * Q(1, 2)**7 * Q(3, 2)**3 == Q(12, 7)**2 * 3,
            "real projection and seventh derivative normalization")
    require(Q(5, 3072) * 96 * Q(40, 7) == Q(25, 28) < 1, "third-moment monotonicity")
    require(C_SIX >= Q(4045313, 100000) and Y_MAX**2 >= 42, "cubic moment domain")
    # Each conditional variance summand is the product of two independent unit exponentials.
    require(factorial(2)**2 - factorial(1)**4 == 3, "witness conditional variance")


def small_bound():
    require(Q(27, 25)**2 < 1+S_MAX < Q(1081, 1000)**2, "sqrt(1+s_max)")
    require(S_MAX < Q(41, 100)**2, "sqrt(s_max)")
    require(3 + Q(3, 2)*Y_SMALL**2 < Q(33, 25)**4, "real projection fourth norm")
    fourth = 1/(16*(1+S_MAX)*Q(1081, 1000))
    # The derivative of s/(1+s)^(5/2) has the sign of 1-3s/2 on [0,1/6].
    sixth = C_SIX*S_MAX/(96*(1+S_MAX)**2*Q(27, 25))
    remainder = Q(81, 20)*Q(12, 7)*S_MAX*Q(41, 100)  # sqrt(3/pi) < 1
    bound = fourth - Y_SMALL*(sixth + remainder)
    require(bound == Q(23843983, 11441304000) and bound > Q(1, 500), "small-excess margin")
    return bound


def sixth_moment(y):
    return 6 + 9*y*y + C_SIX*y**3


def intermediate_lower(s_lo, s_hi, y_lo, y_hi):
    # All arguments in a subtracted cost increase on the nonnegative domain.
    cost = s_hi*(9*y_hi**2+C_SIX*y_hi**3)/96 + 5*s_hi**2/128
    numerator = 5*s_lo**2*sixth_moment(y_lo)**2
    denominator = 3072*(2+y_hi**2+7*s_hi*sixth_moment(y_hi)/40)
    return y_lo**2/16 - cost + numerator/denominator


def large_lower(s_lo, s_hi, y_lo, y_hi):
    # This Gaussian-gap factor decreases throughout [0, 1/6].
    gaussian = 1 - 5*s_lo/6 + 5*s_lo**2/8
    left = (1-s_hi/2)*(1+y_lo**2)**2
    right = gaussian*(1+y_hi**2+s_hi*(3+7*y_hi**2+C_SIX*y_hi**3)/4)
    return left - right


def certified_cover(lower, y_min, y_max):
    pending = [(Q(0), S_MAX, y_min, y_max, 0)]
    proved = []
    while pending:
        sl, sh, yl, yh, depth = pending.pop()
        if lower(sl, sh, yl, yh) > 0:
            proved.append((sl, sh, yl, yh))
            continue
        require(depth < 28, f"unresolved {lower.__name__} box {(sl, sh, yl, yh)}")
        if depth % 2:
            mid = (sl + sh)/2
            pending.extend([(sl, mid, yl, yh, depth+1), (mid, sh, yl, yh, depth+1)])
        else:
            mid = (yl + yh)/2
            pending.extend([(sl, sh, yl, mid, depth+1), (sl, sh, mid, yh, depth+1)])
    return proved


def check_cover(boxes):
    # Sweep all strips independently of the subdivision algorithm.
    y_edges = sorted({Q(0), Y_MAX} | {edge for _, _, yl, yh in boxes for edge in (yl, yh)})
    for sl, sh, yl, yh in boxes:
        require(0 <= sl < sh <= S_MAX and 0 <= yl < yh <= Y_MAX, "invalid box")
    for yl, yh in zip(y_edges, y_edges[1:]):
        intervals = sorted((sl, sh) for sl, sh, bl, bh in boxes if bl <= yl and yh <= bh)
        frontier = Q(0)
        for sl, sh in intervals:
            require(sl == frontier, "tiling has a gap or interior overlap")
            frontier = sh
        require(frontier == S_MAX, "tiling leaves an uncovered strip")


def main():
    verify_normalization()
    low = small_bound()
    intermediate = certified_cover(intermediate_lower, Y_SMALL, Y_LARGE)
    large = certified_cover(large_lower, Y_LARGE, Y_MAX)
    boxes = [(Q(0), S_MAX, Q(0), Y_SMALL)] + intermediate + large
    check_cover(boxes)
    # Deleting one certified rectangle must be detected by the independent sweep.
    try:
        check_cover(boxes[:-1])
    except ValueError:
        pass
    else:
        raise ValueError("the gap control accepted a missing rectangle")
    print(f"Small-excess lower bound {low}")
    print(f"Positive rectangles: {len(intermediate)} intermediate and {len(large)} large")
    print("PASS: normalization, full closed cover of [0,1/6] x [0,7], and missing-box control")


if __name__ == "__main__":
    main()

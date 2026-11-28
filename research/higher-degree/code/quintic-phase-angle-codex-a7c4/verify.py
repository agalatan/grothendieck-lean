"""Replay the directional support bound for unimodular phase pairs. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q
from math import factorial

EPS = Q(39, 50)
ETA = Q(779, 10000)
TARGET = Q(10000, 14023) - Q(1, 100000)
# Grothe/Lower/RowDataTypes.lean and Grothe/Lower/MassNodes.lean
MASS_EPS = Q(25, 31)
MASS_C = 2 * Q(47, 1953) + Q(1, 2)
MASS_S = Q(
    3798855002922010337121170986221578569, 22939068096000000000000000000000000000
)
B = Q(4277, 5000)


def require(condition, message):
    if not condition:
        raise ValueError(message)


def polynomial_lower(pole, weight):
    """Lower E[T^weight/(T+pole)] by E[T^weight(2p-(T+pole)p²)]."""
    size = 15
    moments = [Q(factorial(i + weight)) for i in range(2 * size)]
    gram = [
        [moments[i + j + 1] + pole * moments[i + j] for j in range(size)]
        for i in range(size)
    ]
    rows = [line + [moments[i]] for i, line in enumerate(gram)]
    for i in range(size):
        pivot = rows[i][i]
        require(pivot > 0, "positive moment Gram pivot")
        rows[i] = [entry / pivot for entry in rows[i]]
        for j in range(size):
            if j != i:
                coeff = rows[j][i]
                rows[j] = [x - coeff * y for x, y in zip(rows[j], rows[i])]
    p = [r[-1] for r in rows]
    # Directly evaluate the square minorant. Validity is independent of optimality of p.
    return 2 * sum(x * m for x, m in zip(p, moments)) - sum(
        p[i] * p[j] * gram[i][j] for i in range(size) for j in range(size)
    )


def upper_moments(pole, scale):
    """Upper expectation of scale times a degree-at-most-three polynomial over T+pole."""
    low = [polynomial_lower(pole, 0)]
    high = [(1 - polynomial_lower(pole, 1)) / pole]
    require(0 < low[0] <= high[0], "positive ordered Stieltjes bounds")
    for i in range(1, 4):
        old_low, old_high = low[-1], high[-1]
        low.append(factorial(i - 1) - pole * old_high)
        high.append(factorial(i - 1) - pole * old_low)

    def upper(poly):
        require(len(poly) <= len(low), "polynomial degree")
        return scale * sum(a * (h if a >= 0 else l) for a, h, l in zip(poly, high, low))

    return upper


def sector_prices():
    # w=(3+T)/4, w+T=(3+5T)/4; the multipliers below are exactly 1/w and 1/(w+T).
    f = upper_moments(Q(3), Q(4))
    g = upper_moments(Q(3, 5), Q(4, 5))

    def add(poly):
        return f(poly) + g(poly)

    p = (0, -1, 1)
    n = (0, 1, -1)
    # Drop 1/sqrt(2) to obtain an upper bound on the normalized off-diagonal magnitude.
    off = max(f(p) + g(n), f(n) + g(p)) / 2
    require(off >= 0, "absolute off-diagonal bound")
    prices = (
        add((1,)) / 2,
        add((1, -2, 1)) / 2 + off,
        add((0, 0, 1)) / 4 + off,
        f((0, 1)),
        add((0, 1)) / 2,
        f((0, 4, -4, 1)) / 2,
    )
    ceilings = tuple(
        Q(x, 10**6) for x in [855362, 806642, 710473, 854996, 628807, 687439]
    )
    require(
        all(0 < p < c < B for p, c in zip(prices, ceilings)),
        "six bounded sector prices",
    )
    # A purely tangential direction iZ(|Y|²-1) achieves the true B_T in the quadratic bound.
    require(-f((0, -1)) > Q(".8549"), "underpriced tangent direction control")
    return max(prices)


def ordinary(t):
    return t * t + EPS / MASS_EPS * (MASS_C * (1 - t * t) + MASS_S)


def min_deficit(lo, hi):
    require(0 < lo <= hi, "ordered positive amplitude endpoints")
    return max(Q(0), (TARGET - EPS * B - (1 - EPS) * hi**2) / (ETA + EPS * B / lo**2))


def main():
    price = sector_prices()
    print(
        "Six sector prices below 4277/5000; price headroom >",
        int((B - price) * 10**9),
        "billionths.",
    )
    coeff = EPS * MASS_C / MASS_EPS - ETA
    require(
        0 < coeff and EPS * MASS_C / MASS_EPS < 1 and 0 < ETA < EPS < 1,
        "mass and endpoint price signs",
    )
    start, end = Q(".22"), Q(".22586")
    require(
        ordinary(start) < TARGET < ordinary(Q(".22018")),
        "ordinary mass interval and comparison endpoint",
    )
    lo = start
    headroom = TARGET
    deficit = Q(1)
    count = 0
    while lo < end:
        hi = min(end, lo + Q(1, 10000))
        reserve = min_deficit(lo, hi)
        deficit = min(deficit, reserve)
        headroom = min(headroom, TARGET - ordinary(hi) + coeff * reserve)
        count += 1
        lo = hi
    require(
        count == 59
        and lo == end
        and deficit > Q(254157, 10**8)
        and headroom > Q(185645, 10**12),
        "59 closed intervals and stated clearance",
    )
    require(
        ordinary(end) > TARGET, "deleting the directional mass debit loses the endpoint"
    )
    nxt = end + Q(1, 100000)
    require(
        ordinary(nxt) - coeff * min_deficit(nxt, nxt) - TARGET > Q(1236741, 10**12),
        "next 1e-5 endpoint fails the frozen envelope",
    )
    # Z times a centered real quadratic produces zero radial overlap even with fourth excess 9/2.
    require(2 * (3 + Q(6, 24)) - 2 == Q(9, 2), "normalized tangential fourth excess")
    print(
        "Covered [0,.22586]; 59 directional intervals, deficit >.00254157, clearance >185645/10^12."
    )
    print("Underpriced tangent, removal of debit and next-grid .22587 controls passed.")


if __name__ == "__main__":
    main()

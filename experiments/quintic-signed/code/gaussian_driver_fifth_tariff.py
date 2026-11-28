"""Exact tariffs for the two-charge Gaussian driver. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q


def require(statement, message):
    if not statement:
        raise ValueError(message)


def main():
    # (19 + 2 sqrt(3))² = 373 + 76 sqrt(3).
    coefficient = 505
    require(
        (coefficient - 373) > 0 and (coefficient - 373) ** 2 > 3 * 76**2,
        "upper bound for the four Wick pairings and the projection difference",
    )
    require(
        (coefficient - 1 - 373) ** 2 < 3 * 76**2,
        "deleting one unit from the rounded constant",
    )

    pi_upper = Q(3141592654, 10**9)
    smallest_t = Q(1071, 1280)
    p_upper = 1 - 4 * smallest_t**2 / pi_upper
    require(0 < p_upper < Q(11, 100), "amplitude coverage")
    central_cost = 1 + coefficient * p_upper**2 / 8
    full_cost = 1 + Q(coefficient, 8)
    require(
        central_cost < Q(1764, 1000) and full_cost == Q(513, 8),
        "central and full-axis tariffs",
    )

    w = Q(358503031, 5000000000000)
    alpha = Q(191, 250) + Q(47, 2000)
    tariff = (1 - w) * alpha
    require(
        tariff / full_cost > Q(".01227") and tariff / central_cost > Q(".446"),
        "safe fifth coefficients",
    )
    published_debits = [Q(6293, 250000000000), Q(110621, 250000000000)]
    for debit in published_debits:
        require(0 < debit * full_cost < tariff, "registered fifth coefficient")
    require(Q(".01229") * full_cost > tariff, "full-axis tariff deletion")
    print("E2 ≤ 505(1−c2). Full-axis cost 513/8, five-cell cost <1.764.")
    print("Both registered positive fifth coefficients are absorbed.")
    print(
        "At the published first-chaos weight all d ≤ .01227 are absorbed on the full axis,"
    )
    print("and all d ≤ .446 on the five central amplitude cells.")


if __name__ == "__main__":
    main()

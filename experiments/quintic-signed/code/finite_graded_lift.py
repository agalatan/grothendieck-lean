"""Finite normalized cubic lift of the mirror stress pair. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q
from math import factorial


def require(condition, message):
    if not condition:
        raise ArithmeticError(message)


def central_fourth():
    # Each product Y of two independent Exp(1) variables has moment (j!)².
    return sum(c * factorial(j) ** 2 for j, c in enumerate((1, -4, 6, -4, 1)))


def retained_loss(n):
    # On T≥1/2, sqrt(T)≥2/3. On the remaining event pay its fourth moment.
    variance = Q(3, n)
    fourth = Q(27, n**2) + Q(central_fourth() - 27, n**3)
    return Q(9, 25) * variance + 4 * fourth


def compare(n, tmin, alpha, debit):
    # Each distinct visible/fresh Hermite coefficient belongs to one entry below.
    remote_leak = retained_loss(n)
    factors = (
        alpha * remote_leak,  # remote W in the cubic row
        debit * remote_leak,  # either degree-five intended remote mode
        (alpha + 2 * debit) / n,  # Z H_11(W), with zero/two remaining degrees
        debit / n,  # H_21(Z) H_11(W) or Z H_22(W)
    )
    # The visible Z coefficient gives no loss. The remaining coefficients share this norm budget.
    return (1 - tmin**2) * max(factors), (1 - tmin**2) * max(remote_leak, Q(2, n))


def gaussian_budget(n, tmin, alpha, debit):
    # The two largest (disjoint) coefficient classes each have this sharper bound.
    pi_hi = Q(31416, 10000)

    def atan(q, terms):
        return sum((-1) ** j * q ** (2 * j + 1) / (2 * j + 1) for j in range(terms))

    require(
        16 * atan(Q(1, 5), 5) - 4 * atan(Q(1, 239), 2) < pi_hi, "Machin upper bound"
    )
    section = pi_hi / 4 - tmin**2
    residual = 1 - tmin**2
    loss = retained_loss(n)
    low = debit * max(loss, Q(1, n))
    large1, large2 = alpha * loss, (alpha + 2 * debit) / n
    require(0 <= low <= min(large1, large2), "nonnegative coefficient budget prices")
    payoff_loss = low * residual + (large1 + large2 - 2 * low) * section
    fifth_base = max(loss, Q(1, n))
    require(fifth_base < Q(2, n), "maximum fifth increase per other component")
    fifth_increase = fifth_base * residual + (Q(2, n) - fifth_base) * section
    return payoff_loss, fifth_increase


def main():
    n = 180000
    alpha, debit = Q(191, 250) + Q(47, 2000), Q(47, 2000)
    tmin, graded = Q(".8392"), Q(".7131156728")
    require(central_fourth() == 453, "fourth centered moment of product exponentials")
    require(Q(2, 3) ** 2 < Q(1, 2), "tail split for sqrt")
    loss, fifth_error = compare(n, tmin, alpha, debit)
    require(loss < Q(14, 10**7), "uniform payoff loss exceeds the certified margin")
    target = Q(10000, 14023)
    require(graded - loss > target + Q(10, 10**8), "strict finite-dimensional payoff")
    require(fifth_error < Q(33, 10**7), "signed fifth one-sided loss")
    require(
        1 + 3 * n == 540001 and 1 + 3 * n + 2 == 540003,
        "original and auxiliary rounding dimensions",
    )
    # These ablations reject exactly the claimed final 10^-7 separation.
    wo_t, _ = compare(n, 0, alpha, debit)
    require(
        graded - wo_t < target, "the certified visible projection matters for this n"
    )
    crude = (1 - tmin**2) * max(3 * alpha / n, (alpha + 2 * debit) / n)
    require(graded - crude < target, "the fourth-moment split matters for this n")
    print(
        f"N={n}, 1+3N=540001 with torus rounding, or 540003 with fresh rounding. Payoff loss < 0.0000014; payoff > 10000/14023 + 0.0000001."
    )
    print("t is unchanged; signed fifth increases by less than 0.0000033.")
    small_n = 100000
    loss2, fifth2 = gaussian_budget(small_n, tmin, alpha, debit)
    require(
        graded - loss2 > target + Q(1, 10**7), "two Gaussian coefficient constraints"
    )
    require(fifth2 < Q(4, 10**6), "second one-sided fifth interval")
    require(
        Q("-.00718") + fifth2 < Q("-.007176"), "physical signed fifth for the same pair"
    )
    coarser, _ = compare(small_n, tmin, alpha, debit)
    require(graded - coarser < target, "deletion of both Gaussian budgets")
    print(
        "With two Gaussian coefficient constraints: 300001 physical coordinates; payoff > 10000/14023 + 10^-7 and physical signed fifth < -.007176."
    )
    print(
        "Both coefficient-budget deletion controls failed the original target as required."
    )


if __name__ == "__main__":
    main()

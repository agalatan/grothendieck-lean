"""Check one rational step weight for all cubic sectors. Agent-ID: codex-a7c4."""

from fractions import Fraction as F
from functools import cache
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from sector_gram import EPS, ETA, TARGET, laguerre, modify, raw_norm, require

EXP_SCALE = 10**42
OUTPUT_SCALE = 10**17
GRID = 256
CUTOFF = 8
DEGREE = 6
H_COEFFICIENT = -21551
TRIALS = {
    (0, 0): (-10980,),
    (1, 0): (-3598,),
    (0, 1): (-3598,),
    (1, 1): (-6333, -39373),
    (2, 0): (-1797,),
    (2, 1): (-3589, -42035),
}


def weight(midpoint):
    z = midpoint
    raw = F(4808, 10000) * z + F(1449, 10000) * z**3 + F(445, 100000) * z**5
    return F((10**6 * max(ETA, raw)).__ceil__(), 10**6)


def step_exponential(lo, hi, delta):
    require(0 < delta < 1, "alternating exponential bounds")
    term = total = F(1)
    for degree in range(1, 13):
        term *= -delta / degree
        total += term
    lower_factor = (EXP_SCALE * (total - term)).__floor__()
    upper_factor = (EXP_SCALE * total).__ceil__()
    return lo * lower_factor // EXP_SCALE, -((-hi * upper_factor) // EXP_SCALE)


def tail_polynomials(r):
    # Integral from r^2 to infinity of T^k exp(-T) is exp(-r^2) times this.
    values = [F(1)]
    for k in range(1, DEGREE + 1):
        values.append(k * values[-1] + r ** (2 * k))
    return values


@cache
def moment_bank():
    # Directed enclosures of E[D] and E[T^k/D] for k=0,...,6.
    low, high = [0] * (DEGREE + 1), [0] * (DEGREE + 1)
    mean = 0
    left_exp = (EXP_SCALE, EXP_SCALE)
    left_tail = tail_polynomials(F(0))
    for j in range(CUTOFF * GRID + 1):
        lo = F(j, GRID)
        if j == CUTOFF * GRID:
            right_exp = (0, 0)
            right_tail = [F(0)] * (DEGREE + 1)
            denominator = F(20)
        else:
            hi = F(j + 1, GRID)
            right_exp = step_exponential(*left_exp, hi**2 - lo**2)
            right_tail = tail_polynomials(hi)
            denominator = weight((lo + hi) / 2)
        require(denominator >= ETA, "positive conditional budget")
        for k, (a, b) in enumerate(zip(left_tail, right_tail)):
            local_lo = max(0, (a * left_exp[0] - b * right_exp[1]) / EXP_SCALE)
            local_hi = (a * left_exp[1] - b * right_exp[0]) / EXP_SCALE
            require(local_lo <= local_hi, "ordered cell mass")
            low[k] += (OUTPUT_SCALE * local_lo / denominator).__floor__()
            high[k] += (OUTPUT_SCALE * local_hi / denominator).__ceil__()
            if k == 0:
                mean += (OUTPUT_SCALE * denominator * local_hi).__ceil__()
        left_exp, left_tail = right_exp, right_tail
    return F(mean, OUTPUT_SCALE), [
        (F(a, OUTPUT_SCALE), F(b, OUTPUT_SCALE)) for a, b in zip(low, high)
    ]


def gram(left, right, charge, moments):
    coefficients = [F(0)] * (charge + len(left) + len(right) - 1)
    for i, a in enumerate(left):
        for j, b in enumerate(right):
            coefficients[charge + i + j] += a * b
    require(len(coefficients) <= len(moments), "moment bank degree")
    return tuple(
        sum(
            a * cell[side if a >= 0 else 1 - side]
            for a, cell in zip(coefficients, moments)
        )
        for side in (0, 1)
    )


def average_price(moments):
    test, quintic = laguerre(0, 1), laguerre(2, 1)
    coefficient = F(H_COEFFICIENT, 100000)
    modify(test, laguerre(1, 1), coefficient)
    denominator = 3 / ETA - gram(quintic, quintic, 1, moments)[1]
    require(denominator > 0, "quintic rank-one inverse")
    covariance = max(abs(v) for v in gram(test, quintic, 1, moments))
    upper = gram(test, test, 1, moments)[1] + covariance**2 / denominator
    return 1 / (upper + 2 * coefficient**2 / EPS)


def sector_price(i, j, trials, moments):
    n, charge = min(i, j), abs(i - j)
    test = laguerre(n, charge)
    adjacent = [(n + 1, ETA)] + ([(n - 1, F(1))] if n else [])
    require(len(trials) == len(adjacent), "one trial per adjacent moment")
    penalty = F(0)
    for (order, price), units in zip(adjacent, trials):
        coefficient = F(units, 100000)
        modify(test, laguerre(order, charge), coefficient)
        penalty += coefficient**2 * raw_norm(order, charge) / price
    return raw_norm(n, charge) / (gram(test, test, charge, moments)[1] + penalty)


def verify():
    mean, moments = moment_bank()
    h = average_price(moments)
    prices = {
        slot: sector_price(*slot, trials, moments) for slot, trials in TRIALS.items()
    }
    floors = [(p * 10**6).__floor__() for p in [h, *prices.values()]]
    require(
        (mean * 10**6).__ceil__() == 634180
        and floors == [900874, 362073, 780243, 780243, 823910, 1244412, 1184298],
        "seven step-weight prices",
    )
    require(
        all(p > EPS for j, p in prices.items() if j != (0, 0)), "five-sector absorption"
    )
    remote = prices[0, 0]
    require(h < 1 and remote < EPS, "monotone top right corner")
    top = F(".884397")
    fixed = mean + (1 - h) * top**2
    threshold = (TARGET - fixed) / (EPS - remote)
    permitted = F(".003113")
    require(permitted < threshold < F(".003114"), "outward energy threshold")
    require(
        (TARGET - fixed - (EPS - remote) * F(".0031")) > F(5592, 10**9),
        "round-number margin",
    )
    require(fixed + (EPS - remote) * F(".005") > TARGET, "oversized-energy control")
    print("Upper mean in millionths:", (mean * 10**6).__ceil__())
    print("Step-weight prices, lower floors in millionths:", floors)
    print("Uniform unpriced remote energy through t=.884397:", permitted)
    print("Row threshold is below .003114; the .005 control fails as required.")
    return threshold


if __name__ == "__main__":
    verify()

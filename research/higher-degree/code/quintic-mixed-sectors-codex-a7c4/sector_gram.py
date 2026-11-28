"""Prices for all cubic sectors, from conditional first and fifth chaos. Agent-ID: codex-a7c4."""

from fractions import Fraction as F
from math import comb, factorial

EPS, ETA = F(39, 50), F(779, 10000)
C, BUDGET = F(1, 10), F(553, 1000)
D_MASS = BUDGET + ETA
SHIFT = C + ETA * (1 + C) / BUDGET
TARGET = F(10000, 14025)

# Each trial subtracts this multiple of the upper and (when present) lower
# unnormalized Laguerre polynomial. Every entry is in units of 1/100000.
TRIALS = {
    (0, 0): (-9142,),
    (1, 0): (-3507,),
    (0, 1): (-3507,),
    (1, 1): (-5349, -35175),
    (2, 0): (-1721,),
    (2, 1): (-3404, -41099),
}
H_TRIAL = F(-20913, 100000)


def require(condition, message):
    if not condition:
        raise ValueError(message)


def laguerre(n, charge):
    """Ascending coefficients of (-1)^n L_n^(charge), with the phase removed."""
    return [
        F((-1) ** (n + j) * comb(n + charge, n - j), factorial(j)) for j in range(n + 1)
    ]


def modify(polynomial, trial, coefficient):
    if len(trial) > len(polynomial):
        polynomial.extend([F(0)] * (len(trial) - len(polynomial)))
    for k, value in enumerate(trial):
        polynomial[k] -= coefficient * value


def raw_norm(n, charge):
    return F(factorial(n + charge), factorial(n))


def stieltjes_lower(shift, charge, modes):
    # Rayleigh-Ritz for multiplication by T+shift in the generalized Laguerre basis.
    pivot = shift + 2 * (modes - 1) + 1 + charge
    for j in range(modes - 2, -1, -1):
        pivot = shift + 2 * j + 1 + charge - (j + 1) * (j + 1 + charge) / pivot
        require(pivot > 0, "positive Laguerre pivot")
    return 1 / pivot


def stieltjes_endpoints(shift=SHIFT):
    low = stieltjes_lower(shift, 0, 100)
    high = (1 - stieltjes_lower(shift, 1, 100)) / shift
    scale = 10**22
    ends = F((low * scale).__floor__(), scale), F((high * scale).__ceil__(), scale)
    require(0 < ends[0] <= ends[1], "ordered Stieltjes bracket")
    return ends


def gram(left, right, charge, resolvent, shift=SHIFT):
    # Integrate T^k/(T+SHIFT) recursively with the exponential measure.
    n = charge + len(left) + len(right) - 2
    integrals = [resolvent]
    for k in range(1, n + 1):
        integrals.append(factorial(k - 1) - shift * integrals[-1])
    return (1 + shift) * sum(
        x * y * integrals[charge + i + j]
        for i, x in enumerate(left)
        for j, y in enumerate(right)
    )


def sector_price(
    i,
    j,
    ends,
    use_upper=True,
    use_lower=True,
    *,
    shift=SHIFT,
    mass=D_MASS,
    trials=TRIALS,
):
    n, charge = min(i, j), abs(i - j)
    test = laguerre(n, charge)
    coefficients = trials[i, j]
    adjacent = [(n + 1, ETA, coefficients[0], use_upper)]
    if n:
        adjacent.append((n - 1, F(1), coefficients[1], use_lower))
    cost = F(0)
    for order, price, units, enabled in adjacent:
        if enabled:
            coefficient = F(units, 100000)
            modify(test, laguerre(order, charge), coefficient)
            cost += mass * coefficient**2 * raw_norm(order, charge) / price
    upper = max(gram(test, test, charge, x, shift) for x in ends) + cost
    require(upper > 0, "positive dual cost")
    return mass * raw_norm(n, charge) / upper


def average_price(ends, *, shift=SHIFT, mass=D_MASS, trial=H_TRIAL):
    test, quintic = laguerre(0, 1), laguerre(2, 1)
    modify(test, laguerre(1, 1), trial)
    denom = 3 * mass / ETA - max(gram(quintic, quintic, 1, j, shift) for j in ends)
    require(denom > 0, "positive rank-one denominator")
    covariance = max(abs(gram(test, quintic, 1, j, shift)) for j in ends)
    upper = max(gram(test, test, 1, j, shift) for j in ends) + covariance**2 / denom
    upper += 2 * mass * trial**2 / EPS
    return mass / upper


def verify():
    ends = stieltjes_endpoints()
    h = average_price(ends)
    prices = {slot: sector_price(*slot, ends) for slot in TRIALS}
    floors = [(v * 10**6).__floor__() for v in [h, *prices.values()]]
    require(
        floors == [892918, 396801, 780373, 780373, 876331, 1227351, 1146603],
        "seven conditional Gram prices",
    )
    require(
        all(p > EPS for slot, p in prices.items() if slot != (0, 0)),
        "all five nonremote sectors absorbed",
    )
    remote = prices[0, 0]
    require(h < 1 and remote < EPS, "rectangle maximum is at the top right")
    for t, energy, margin in [
        (".65", ".096217", 177670),
        (".75", ".057095", 208920),
        (".81", ".030939", 286745),
        (".85", ".012384", 299377),
        (".86", ".007606", 121996),
        (".87", ".002771", 370557),
        (".875", ".000333", 319267),
    ]:
        fixed = ETA + BUDGET + (1 - h) * F(t) ** 2
        upper = fixed + (EPS - remote) * F(energy)
        require(TARGET - upper > F(margin, 10**12), f"payoff reserve at {t}, {energy}")
        require(
            fixed + (EPS - remote) * (F(energy) + F(1, 10**6)) >= TARGET,
            "outward remote-energy rounding",
        )
    # Dropping the remote first/fifth projections breaks absorption of an entire slot.
    require(sector_price(1, 1, ends, use_lower=False) < EPS, "first-chaos deletion")
    require(sector_price(1, 0, ends, use_upper=False) < EPS, "fifth-chaos deletion")
    print("Gram price floors in millionths:", floors)
    print("Seven positive-remote-energy rectangles and both deletion controls passed.")
    return h, prices


if __name__ == "__main__":
    verify()

"""A deformed support ray for the capped degree-five game. Agent-ID: codex-a7c4."""

from argparse import ArgumentParser
from fractions import Fraction as Q
from math import comb
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import angular

SCALE = 10**10
LAM, D, B = Q(".68"), Q(".14"), Q(".053")
SQUARE, RICE, INTERCEPT = Q(".020025"), Q(".6071"), Q(".287016")
PRICE = Q("1.031312")
RADIUS2 = Q("1.193") ** 2 / Q("1.81")
DEBIT = Q("4.027225")
RESERVE = Q(".000001")
CLAIMS = (
    (".666", ".677", ".002"),
    (".671", ".683", ".001"),
    (".675", ".6885", ".0005"),
    (".675", ".69", ".0002"),
    (".675", ".691", ".0001"),
)


def ceildiv(a, b):
    return -(-a // b)


def down(x):
    return (SCALE * x).__floor__()


def up(x):
    return (SCALE * x).__ceil__()


def series():
    coef = Q(1)
    coefficients = [coef]
    for j in range(1, 15):
        coef *= (Q(3, 2) - j) / j
        coefficients.append(coef**2)
    upper = [up(c) for c in coefficients] + [up(Q(424, 333) - sum(coefficients))]
    return [down(c) for c in coefficients][::-1], upper[::-1]


SERIES_LOW, SERIES_HIGH = series()


def angular_norm(a, b, upper):
    """Enclose E_angle |a+b exp(i theta)| for nonnegative scaled integer inputs."""
    a, b = max(a, b), min(a, b)
    if a == 0:
        return 0
    v = 0
    if upper:
        z = ceildiv(SCALE * b * b, a * a)
        for c in SERIES_HIGH:
            v = c + ceildiv(z * v, SCALE)
        return ceildiv(a * v, SCALE)
    z = SCALE * b * b // (a * a)
    for c in SERIES_LOW:
        v = c + z * v // SCALE
    return a * v // SCALE


def radial_weights(grid, stop):
    """Upper endpoint weights for convex chords and lower masses/Jensen nodes."""
    weights = [0] * (grid * stop + 1)
    lower = []
    el = eh = Q(1)
    scale = 10**24
    for i in range(grid * stop):
        lo, hi = Q(i, grid), Q(i + 1, grid)
        dx = hi * hi - lo * lo
        angular.need(0 < dx < 1, "alternating exponential series")

        def moment(degree, k):
            coefficient, total = Q(1), Q(0)
            for j in range(degree + 1):
                value = sum(
                    comb(j, p)
                    * (-lo * lo) ** (j - p)
                    * 2
                    * (hi ** (2 * p + k + 2) - lo ** (2 * p + k + 2))
                    / (2 * p + k + 2)
                    for p in range(j + 1)
                )
                total += coefficient * value
                coefficient /= -(j + 1)
            return total

        mass, first = moment(2, 0), moment(2, 1)
        weights[i] += up(eh * (hi * mass - first) / (hi - lo))
        weights[i + 1] += up(eh * (first - lo * mass) / (hi - lo))
        mass, first = moment(3, 0), moment(3, 1)
        angular.need(mass > 0 and lo * mass <= first <= hi * mass, "positive lower Jensen measure")
        lower.append((down(el * mass), down(first / mass)))
        term = total = Q(1)
        for j in range(1, 9):
            term *= -dx / j
            total += term
            if j == 7:
                el = Q((scale * el * total).__floor__(), scale)
        eh = Q((scale * eh * total).__ceil__(), scale)
    angular.need(min(weights) >= 0 and el > 0, "radial weights")
    return weights, lower


def certify_ray(intercept=INTERCEPT):
    """Check the radial majorant on [0,12] and then the complete exterior."""
    grid, step, stop = 96, 64, 12
    weights, lows = radial_weights(grid, 6)
    radial = [Q(i, grid) for i in range(len(weights))]
    visible = [up(r * (1 + D * (r * r - 2))) for r in radial]
    remote = [up(LAM + B * (r * r - 1)) for r in radial]
    nodes = [up(r) for r in radial]
    previous_upper = previous_kernel = previous_lower = slope = Q(0)
    worst = Q(0)
    for j in range(stop * step + 1):
        x = Q(j, step)
        # Integrals of 1,T,T^2 on T>=36 are 1,37,1370 times exp(-36).
        # The upper densities below T=36 and the lower Rice measure are independent.
        tail = (37 + D * 1370 + x * (LAM + B * 37)) * Q(3, 8) ** 36
        kernel = (
            Q(
                sum(
                    w * angular_norm(a, ceildiv(b * j, step), True)
                    for w, a, b in zip(weights, visible, remote)
                ),
                SCALE**2,
            )
            + tail
        )
        sh = Q(".9") * x
        sh_lo, sh_hi = down(sh), up(sh)
        rice_lo = Q(sum(w * angular_norm(r, sh_lo, False) for w, r in lows), SCALE**2)
        rice_hi = (
            Q(sum(w * angular_norm(r, sh_hi, True) for w, r in zip(weights, nodes)), SCALE**2)
            + (37 + sh) * Q(3, 8) ** 36
        )
        lower = SQUARE * x * x + RICE * rice_lo
        upper = SQUARE * x * x + RICE * rice_hi
        if j:
            # A chord is above the left kernel. A preceding secant is below a
            # forward slope of the convex right kernel, even after outward rounding.
            worst = max(worst, previous_kernel - previous_lower, kernel - (previous_lower + slope))
        slope = max(Q(0), lower - previous_upper) if j else Q(0)
        previous_upper, previous_kernel, previous_lower = upper, kernel, lower

    deficit = LAM - Q(".9") * RICE
    angular.need(worst <= intercept, "compact radial majorant")
    angular.need(
        2 * SQUARE * stop >= deficit and intercept + SQUARE * stop**2 - deficit * stop >= 1,
        "exterior radial majorant",
    )
    angular.need(intercept + SQUARE + RICE * Q("1.193") <= PRICE, "integrated ray price")
    print(
        "Deformed angular support <=",
        PRICE,
        "on the whole half-line; compact intercept needs",
        up(worst),
        "/10^10 by this check.",
    )
    return worst


def strip(t0, t1, mixed):
    eps, eta = angular.EPS, angular.ETA
    w = eps - eta
    threshold = angular.TARGET - RESERVE
    angular.need(
        t0 * t0 >= RADIUS2 / Q("1.81") and t0 * t0 < RADIUS2 and t0 > eta * angular.ROW[0],
        "diffuse tangent and lower-amplitude comparison",
    )
    s_top = angular.sqrt_upper(RADIUS2 - t0 * t0)

    def old(s):
        return angular.payoff(t1, s, mixed, DEBIT)

    left, right = Q(0), s_top
    if max(old(left), old(right)) < threshold:
        return True
    angular.need(old(0) < threshold, "zero remote energy")
    for _ in range(24):
        mid = (left + right) / 2
        if old(mid) < threshold:
            left = mid
        else:
            right = mid

    norm = 2 * D * D / (eps + eta) + B * B / (2 * eta)

    def new(s):
        short = max(0, t0 + LAM * s - PRICE)
        return eta + (1 - eta) * t1 * t1 + w * (s * s + mixed) - short * short / norm

    angular.need(LAM**2 > w * norm, "negative quadratic coefficient on the active arm")
    critical = LAM * (PRICE - t0) / (LAM**2 - w * norm)
    return max(new(s) for s in (left, s_top, max(left, min(s_top, critical)))) < threshold


def cover(start, end, mixed):
    todo = [(start, end, 0)]
    width = count = 0
    while todo:
        lo, hi, depth = todo.pop()
        if strip(lo, hi, mixed):
            width += hi - lo
            count += 1
            continue
        angular.need(depth < 18, "unresolved amplitude strip")
        mid = (lo + hi) / 2
        todo.extend(((lo, mid, depth + 1), (mid, hi, depth + 1)))
    angular.need(width == end - start, "complete amplitude cover")
    return count


def verify(repo, ray_only=False):
    required = certify_ray()
    angular.need(required > Q(".2869"), "lower-intercept corruption control")
    if ray_only:
        return
    angular.verify(repo, angular.angular_checks())
    for start, end, mixed in CLAIMS:
        lo, hi, m = map(Q, (start, end, mixed))
        angular.need(
            any(Q(stop) >= lo and Q(cap) >= m for stop, _, cap in angular.CLAIMS),
            "previous all-amplitude prefix",
        )
        n = cover(lo, hi, m)
        print(f"Through {hi}, mixed energy <= {m}: {n} deformed-ray strips after the prefix.")
    # Above the proved range both current scalar comparisons can fail at once.
    angular.need(not strip(Q(".695"), Q(".695"), Q(0)), "above-range control")


if __name__ == "__main__":
    ap = ArgumentParser(description=__doc__)
    ap.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[4])
    ap.add_argument("--ray-only", action="store_true")
    args = ap.parse_args()
    verify(args.repo, args.ray_only)

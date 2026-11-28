"""Uniform buffered radii with diffuse lifts and two moments, using rational arithmetic. Agent-ID: codex-a7c4."""

import json
from fractions import Fraction as Q
from functools import lru_cache
from math import comb, factorial, isqrt
from pathlib import Path

S = 10**24
U = 10**12
RLO = Q(8862269254527, 10**13)
RHI = Q(8862269254529, 10**13)
RAW = Q(".9148")
SLOPE = Q("0.00529")
CAPS = {Q(".81"): Q("1.193"), Q("1.44"): Q("1.3958")}


def need(value, why):
    if not value:
        raise ValueError(why)


def floor(q):
    return q.numerator // q.denominator


def ceil(q):
    return -floor(-q)


def sqrt_sides(x):
    n = isqrt(S * S * x.numerator // x.denominator)
    return Q(n, S), Q(n + 1, S)


def angular_coeffs():
    c = [Q(1)]
    for j in range(4):
        c.append(c[-1] * ((Q(1, 2) - j) / (j + 1)) ** 2)
    return c


ANG = angular_coeffs()


def pi_control():
    def atan(x):
        terms = [(-1) ** j * x ** (2 * j + 1) / (2 * j + 1) for j in range(11)]
        return sum(terms[:-1]), sum(terms)

    a, b = atan(Q(1, 5))
    c, d = atan(Q(1, 239))
    pl = 16 * a - 4 * d
    ph = 16 * b - 4 * c
    need(4 * RLO**2 < pl < ph < 4 * RHI**2, "mean radius")
    need(4 / pl - sum(ANG) < Q(1, 256), "angular-series remainder")


@lru_cache(maxsize=None)
def rice(x):
    """Lower and upper bounds for E|Z+sqrt(x)|, rational x >= 0."""
    if x < 0:
        raise ValueError("negative Rice input")
    if x == 0:
        return RLO, RHI
    if x <= 16:
        # 1F1(-1/2;1;-x): the degree-80 and 81 Taylor polynomials are
        # lower/upper by the beta integral for the Rice derivative.
        xl, xd = x.as_integer_ratio()
        small = xl * S // (2 * xd)
        large = (xl * S + 2 * xd - 1) // (2 * xd)
        lower = S + small
        upper = S + large
        for j in range(1, 81):
            num = xl * (2 * j - 1)
            den = 2 * xd * (j + 1) ** 2
            small = small * num // den
            large = (large * num + den - 1) // den
            if j % 2:
                lower -= large
                upper -= small
            else:
                if j < 80:
                    lower += small
                upper += large
        return RLO * Q(lower, S), RHI * Q(upper, S)
    # Angular M(v)=mean|1+v exp(i theta)| expanded through v^8 on [0,1].
    # For R=|Z| restrict R<=sqrt(x); E[R^(2j) 1_{R²>x}] is exact.
    # On the complementary tail, M>=1 and M<=1+v.
    lo, hi = sqrt_sides(x)
    exp_hi = 1 / (1 + x / 64) ** 64
    main = sum(c * factorial(j) / x**j for j, c in enumerate(ANG))
    missing = sum(
        c * factorial(j) / x**j * sum(x**i / factorial(i) for i in range(j + 1))
        for j, c in enumerate(ANG)
        if j > 0
    )
    extra = Q(factorial(5), 256) / x**5
    need(main - exp_hi * missing > 0, "large-argument lower factor")
    return lo * (main - exp_hi * missing), hi * (
        main + extra + (1 + 1 / (2 * x)) * exp_hi
    )


def simple(s, chi):
    """The diffuse lift of Z + sqrt(s) q plus the absolute cubic radius."""
    root = sqrt_sides(1 + s)[1]
    return root * min(RAW, RHI * (1 + SLOPE * (s / (1 + s)) ** 2 * chi))


def polynomial(c, r):
    a, b, d, e, f, _, _ = c
    u = r * r
    return ((e * u + d) * u + b) * u + a + f * r


def point(s, c, r):
    u = r * r
    return (
        polynomial(c, r)
        + c[5] * rice(2 * u)[0]
        + c[6] * rice(4 * u)[0]
        - rice(s * u)[1]
    )


def tail(s, c, K):
    # Using E|Z+l| >= |l| and <= |l|+1 bounds the residual below by a
    # polynomial. Its translated coefficients certify positivity on r>=K.
    a, b, d, e, f, g, h = c
    p = [a - 1, f + g * sqrt_sides(Q(2))[0] + 2 * h - sqrt_sides(s)[1], b, 0, d, 0, e]
    return all(
        sum(p[j] * comb(j, k) * K ** (j - k) for j in range(k, 7)) >= 0
        for k in range(7)
    )


def full_ray(s, c):
    K = Q(24)
    need(tail(s, c, K), "tail certificate")
    # F(r)=E|Z+sqrt(z)r| satisfies 0<=F''<=R*z:
    # convexity, then F''=2z rho'(zr²)+4z²r² rho''(zr²), rho''<=0.
    stack = [(Q(0), K, point(s, c, Q(0)), point(s, c, K))]
    count = 0
    while stack:
        l, r, dl, dr = stack.pop()
        d2 = (
            2 * c[1]
            + 12 * c[2] * (r if c[2] > 0 else l) ** 2
            + 30 * c[3] * r**4
            + RHI * (2 * c[5] + 4 * c[6])
        )
        if min(dl, dr) >= max(0, d2) * (r - l) ** 2 / 8:
            count += 1
            continue
        need(
            min(dl, dr) > 0 and r - l > Q(1, 65536),
            f"ray {s}, [{l},{r}], endpoint signs {dl>0},{dr>0}",
        )
        m = (l + r) / 2
        dm = point(s, c, m)
        stack.extend(((l, m, dl, dm), (m, r, dm, dr)))
    return count


def expectation(c, l, r):
    a, b, d, e, f, g, h = c
    sixth = 6 + 9 * r + Q("40.454") * r * sqrt_sides(r)[1]
    return (
        a
        + b
        + d * (2 + (r if d > 0 else l))
        + e * sixth
        + f * RAW
        + g * simple(Q(2), r)
        + h * simple(Q(4), r)
    )


def shape_ceiling(s, c, left, right):
    """Each subinterval uses the same verified pointwise model and the existing outward expectation."""
    pending = [(left, right)]
    upper = Q(0)
    while pending:
        lo, hi = pending.pop()
        price = expectation(c, lo, hi)
        if price < CAPS[s] - Q(1, 10**9):
            upper = max(upper, price)
        else:
            need(hi - lo > Q(1, 2**22), "shape expectation budget")
            mid = (lo + hi) / 2
            pending.extend(((lo, mid), (mid, hi)))
    return upper


def verify_rows(rows):
    require_specs = set(CAPS)
    need({Q(s) for s in rows} == require_specs, "target scales")
    for key, cover in rows.items():
        s = Q(key)
        cursor = Q(0)
        count = 0
        upper = Q(0)
        for a, b, coef in cover:
            need(
                type(a) is str and type(b) is str and type(coef) is list,
                "shape row data types",
            )
            l, r = Q(a), Q(b)
            need(cursor == l < r <= 42, "shape coverage")
            cursor = r
            if not coef:
                cost = simple(s, r)
            else:
                need(len(coef) == 7 and all(type(n) is int for n in coef), "row type")
                c = [Q(q, U) for q in coef]
                need(min(c[3:]) >= 0, "upper-only moment multipliers")
                count += full_ray(s, c)
                cost = shape_ceiling(s, c, l, r)
            upper = max(upper, cost)
            need(cost < CAPS[s], f"budget on {s}, [{l},{r}]")
        need(cursor == 42, "full excess interval")
        print(
            f"s={s}, uniform cap < {CAPS[s]} ({len(cover)} shape strips, {count} radius cells); worst ceiling in 10^-9: {ceil(upper*10**9)}."
        )
    return CAPS


def verify(path=Path(__file__).with_name("rice_rows.json")):
    pi_control()
    return verify_rows(json.loads(path.read_text()))


if __name__ == "__main__":
    verify()

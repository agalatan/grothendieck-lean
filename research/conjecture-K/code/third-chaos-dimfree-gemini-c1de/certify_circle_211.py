#!/usr/bin/env python3
"""Exact rational verifier for the N = 211 circle sign-pattern bound (< 44357/50000).

Agent-ID: gemini-c1de (Refs #501, #458).

For F in the real third Wiener chaos with E[F^2] = 1, restrict sign(F) to a
Gaussian circle U cos(theta) + V sin(theta). Almost surely the restricted odd
cubic has 1 or 3 sign changes per half-turn, so its samples sigma_r on N = 211
equally spaced half-circle points (with antiperiodic continuation sigma_{r+N} = -sigma_r)
have 1 or 3 transitions. Up to cyclic shift and global sign, placing a transition
on the wrap-around edge leaves 1 + C(210, 2) = 21,946 canonical patterns.

With lags (41, 42, 92) and integer weights (15, -14, -1), the exact maximum of
    sum_{r=0}^{210} sigma_r (15 sigma_{r+41} - 14 sigma_{r+42} - sigma_{r+92})
is 130. Since A = cos(41 pi/211) > B = cos(42 pi/211) > C = cos(92 pi/211) > 0,
15 A^j - 14 B^j - C^j = 14 (A^j - B^j) + (A^j - C^j) > 0 for every j >= 1, and
Mehler's formula with rational enclosures of pi and cos gives
    (E|F|)^2 <= (130 / 211) / (15 A^3 - 14 B^3 - C^3) < (44357 / 50000)^2,
i.e. E|F| / ||F||_2 < 44357/50000 = 0.88714 for every nonzero F in V_3(R^n).
"""

from fractions import Fraction as Q
from math import comb


N = 211
LAGS = (41, 42, 92)
WEIGHTS = (15, -14, -1)


def naive_score(signs):
    full = signs + [-s for s in signs]
    return sum(signs[r] * (15 * full[r + 41] - 14 * full[r + 42] - full[r + 92]) for r in range(N))


def atan_interval(x, terms=28):
    first = sum((((-1) ** k) * (x ** (2 * k + 1)) / (2 * k + 1) for k in range(terms)), Q(0))
    nxt = first + ((-1) ** terms) * (x ** (2 * terms + 1)) / (2 * terms + 1)
    return min(first, nxt), max(first, nxt)


def cos_interval(x, terms=28):
    assert 0 <= x <= 2
    term = first = Q(1)
    for k in range(1, terms):
        term *= -x * x / ((2 * k) * (2 * k - 1))
        first += term
    nxt = first + term * (-x * x / ((2 * terms) * (2 * terms - 1)))
    return min(first, nxt), max(first, nxt)


def main():
    if not __debug__:
        raise RuntimeError("Run without -O so assert checks remain active")

    largest = naive_score([1] * N)
    count = 1
    spot_checks = 0
    for a in range(1, N):
        s = [1] * N
        full = [1] * N + [-1] * N
        cur = [N - 2 * j for j in LAGS]
        for b in range(a, N - 1):
            # Flip s[b] from +1 to -1 (and full[b+N] from -1 to +1).
            for idx_l, j in enumerate(LAGS):
                d1 = -2 * full[b + j]
                d2 = (-2 * s[b - j]) if b >= j else (2 * s[b + N - j])
                cur[idx_l] += d1 + d2
            s[b] = -1
            full[b] = -1
            full[b + N] = 1
            sc = WEIGHTS[0] * cur[0] + WEIGHTS[1] * cur[1] + WEIGHTS[2] * cur[2]
            if sc > largest:
                largest = sc
            count += 1
            if (a in (1, 17, 105, 208)) and (b in (a, (a + N) // 2, N - 2)):
                assert sc == naive_score(s)
                spot_checks += 1

    assert count == 1 + comb(N - 1, 2) == 21946
    assert largest == 130

    u, v = atan_interval(Q(1, 5)), atan_interval(Q(1, 239))
    pi_lo, pi_hi = 16 * u[0] - 4 * v[1], 16 * u[1] - 4 * v[0]

    def cos_bounds(j):
        return cos_interval(j * pi_hi / N)[0], cos_interval(j * pi_lo / N)[1]

    A, B, C = map(cos_bounds, LAGS)
    assert 0 < C[0] < C[1] < B[0] < B[1] < A[0] < A[1] < 1
    denom_lo = 15 * (A[0] ** 3) - 14 * (B[1] ** 3) - (C[1] ** 3)
    assert denom_lo > 0
    ratio_sq_hi = Q(largest, N) / denom_lo
    cap = Q(44357, 50000)  # 0.88714
    assert ratio_sq_hi < cap * cap

    print(
        f"PASS certify_circle_211: {count} patterns ({spot_checks} spot-checked), "
        f"max={largest}, ratio_sq < ({cap})^2"
    )


if __name__ == "__main__":
    main()

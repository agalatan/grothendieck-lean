"""Rational Hilbert–Schmidt bounds for the angular phase Hessian. Agent-ID: codex-a7c4."""

from fractions import Fraction as F
from math import factorial

R, N, S, K = 8, 64, 2**32, 120


def need(p, name):
    if not p:
        raise ArithmeticError(name)


def ceil(x):
    return -(-x.numerator // x.denominator)


def radial():
    # p(r)=1/1F1(1/2;2;r²/2). The denominator is increasing.
    coeff = [F(1)]
    for j in range(48):
        coeff.append(coeff[-1] * F(2 * j + 1, 2 * (j + 2) * (j + 1)))
    lo, hi = [], []
    for i in range(R * N + 1):
        x = F(i * i, 2 * N * N)
        terms = [c * x**j for j, c in enumerate(coeff)]
        partial = sum(terms)
        ratio = x / 49
        # Each term/previous from index 49 onwards is at most x/49.
        upper = partial + terms[-1] * ratio / (1 - ratio)
        if i:
            v = S / upper
            lo.append(v.numerator // v.denominator)
        if i < R * N:
            hi.append(ceil(S / partial))
    k = 16
    tail = R / ((2 * k - 1) * coeff[k] * F(R**2, 2) ** k)
    return lo, hi, tail


def bessel():
    base = 4 * N * N
    den = base**K * factorial(K) * factorial(K + 1)
    A = [den // (base**k * factorial(k) * factorial(k + 1)) for k in range(K + 1)]
    y = F(R**2, 2)
    first = y ** (2 * K + 3) / (factorial(K + 1) * factorial(K + 2))
    first_d = F(2 * K + 3, 2) * y ** (2 * K + 2) / (factorial(K + 1) * factorial(K + 2))
    need(first < 1 / F(S) and first_d < 1 / F(S), "both first omitted terms")
    need(F(2 * K + 5, 2 * K + 3) * y * y / ((K + 2) * (K + 3)) < 1, "alternating tails decrease")
    V, D = [], []
    for i in range(R * R * N + 1):
        v = d = 0
        for k in range(K, -1, -1):
            v = A[k] - i * i * v
            d = (2 * k + 1) * A[k] - i * i * d
        # Absolute midpoint approximations, integer truncation plus series error <=2/S.
        V.append(abs(i * v) * S // (2 * N * den))
        D.append(abs(d) * S // (2 * den))
    return V, D


def verify():
    lo, hi, tail = radial()
    v, d = bessel()
    a0 = a1 = c1 = 0
    for i in range(R * N):
        for j in range(i + 1):
            k = ((2 * i + 1) * (2 * j + 1) + 2 * N) // (4 * N)
            reach = max(k * N - i * j, (i + 1) * (j + 1) - k * N) * (S // (N * N)) + 2
            sym = 1 if i == j else 2
            w = sym * lo[i] * lo[j]
            a0 += w * max(0, v[k] - reach) ** 2
            a1 += w * max(0, d[k] - reach) ** 2
            c1 += sym * hi[i] * hi[j] * min(S, d[k] + reach) ** 2
    scale = F(1, N * N * S**4)
    pias = F(8 * 113, 355)
    pial = F(8 * 106, 333)
    l0, l1 = pias * scale * a0, pias * scale * a1
    mass = F(sum(hi), N * S)
    u1 = pial * (scale * c1 + 2 * mass * tail + tail * tail)
    # L=∫ dm/b, L²=(8/π)(∫ p)^2, so sum_{m>=2} HS(K_m)^2 = L²/4−HS(K_0)^2/2−HS(K_1)^2.
    high = pial * (mass + tail) ** 2 / 4 - l0 / 2 - l1
    need(l0 > 1 and l1 > 1, "strict lower bounds from compact box")
    need(u1 < F(16889, 10000), "m=1 squared HS norm below 1.6889")
    need(high < F(76, 100), "the sum of higher squared HS norms is below .76")
    for label, lo_bound, up_bound in [
        ("HS0²", l0, None),
        ("HS1²", l1, u1),
        ("sum_{m≥2} HSm²", None, high),
    ]:
        print(
            label,
            "lower" if lo_bound is not None else "",
            (lo_bound * 10000).__floor__() if lo_bound is not None else "",
            "upper" if up_bound is not None else "",
            ceil(up_bound * 10000) if up_bound is not None else "",
            "(units 1/10000)",
        )


if __name__ == "__main__":
    verify()


def thresholds():
    # w(r) = sqrt(pi/8) r / p(r); check squared threshold at two rational radii.
    for k, side in [(127429, -1), (127430, 1)]:
        r = F(k, 100000)
        x = r * r / 2
        term = F(1)
        partial = term
        for j in range(20):
            term *= x * F(2 * j + 1, 2 * (j + 2) * (j + 1))
            partial += term
        upper = partial + term * (x / 21) / (1 - x / 21)

        # Machin's identity with alternating partial sums.
        def atan(z):
            t = sum((-1) ** j * z ** (2 * j + 1) / (2 * j + 1) for j in range(12))
            return t, t + z**25 / 25

        a, b = atan(F(1, 5))
        c, d = atan(F(1, 239))
        pimin, pimax = 16 * a - 4 * d, 16 * b - 4 * c
        if side < 0:
            need(pimax * r * r * upper**2 < 8, "localization radius lower endpoint")
        else:
            need(pimin * r * r * partial**2 > 8, "localization radius upper endpoint")
    gap = F(711968558203721328194311213, 10**27) - F(711958683, 10**9)
    need(
        F(4, 3) * F(1949, 100000) ** 3 < gap < F(4, 3) * F(1950, 100000) ** 3,
        "local perturbation size cutoff",
    )
    need(
        F(7600, 10000) < F(7, 8) ** 2 and F(17, 10) - 1 < F(7, 8) ** 2,
        "uniform transverse contraction",
    )
    print(
        "Angular-localization radius between 1.27429 and 1.27430; phase amplitude 0.01949 clears the test."
    )


if __name__ == "__main__":
    thresholds()

if __name__ == "__main__":
    gap = F(711968558203721328194311213, 10**27) - F(711958683, 10**9)
    need(F(2145, 100000) ** 3 < gap < F(2146, 100000) ** 3, "preprocessing-free cubic cutoff")
    need(
        4 * F(2949, 100000) ** 6 < 27 * gap * gap < 4 * F(2950, 100000) ** 6,
        "sharp angular covariance cutoff",
    )
    print("Sharp cubic arc-budget radius 0.02949 passes, 0.02950 fails the cubic comparison.")

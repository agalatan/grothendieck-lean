"""Exact check for the Rice comparison after averaging the peak variance mixture."""

from fractions import Fraction as Q
from math import comb, factorial


def check(ok, diagnostic):
    if not ok:
        raise ValueError(diagnostic)


def inverse_moment(j):
    a, b = Q(699, 1250), Q(179, 1250)
    return factorial(j - 1) * a ** (-2 * j) * sum(
        comb(2 * j + i - 1, i) * (b / a) ** i / factorial(j - 1 - i)
        for i in range(j)
    )


def verify():
    energy = Q(7, 500)
    excess_root = Q(7, 10)
    sixth = Q(4045313, 100000)
    m2, m3, m4 = map(inverse_moment, (2, 3, 4))
    zmax = energy * m3 / m2
    gain = Q(3, 4) / (1 + Q(15, 16) * energy * m4 / m3)
    check(0 < zmax < 1 and 0 < gain * zmax < 1, "signs")

    # As polynomials in y, the three rows are the coefficients of 1,z,z².
    # (1-z/2)(1+y²)² - (1-gain*z)(1+y²+z*(3+7y²+sixth*y³)/4)
    rows = [
        [0, 0, 1, 0, 1],
        [gain - Q(5, 4), 0, gain - Q(11, 4), -sixth / 4, -Q(1, 2)],
        [3 * gain / 4, 0, 7 * gain / 4, sixth * gain / 4, 0],
    ]
    ordinates = []
    for k in range(5):
        a, b, c = (
            sum(row[j] * comb(j, k) * excess_root ** (j - k) for j in range(k, 5))
            for row in rows
        )
        # Bernstein coefficients after z = zmax * t, t in [0,1].
        ordinates.extend((a, a + b * zmax / 2, a + b * zmax + c * zmax**2))
    check(len(ordinates) == 15 and min(ordinates) > Q(1, 1000), "positivity")
    print(f"Peak energy through {energy}: all 15 shifted-polynomial ordinates > 1/1000.")


if __name__ == "__main__":
    verify()

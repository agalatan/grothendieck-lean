"""Exact fourth moment of the coupled 26-coordinate cubic. Agent-ID: codex-a7c4."""

from collections import Counter
from fractions import Fraction
from itertools import product
from math import factorial


def check(condition, explanation):
    if not condition:
        raise ValueError(explanation)


def conjugate(monomial):
    return tuple(-k for k in monomial)


def driver_moment(monomial):
    """Average over u=U/sqrt(2), v=V/sqrt(2), leaving bulk slots 3,4,5."""
    powers = Counter(monomial)
    moment = Fraction(1)
    for j in (1, 2):
        if powers[j] != powers[-j]:
            return 0, ()
        moment *= Fraction(factorial(powers[j]), 2**powers[j])
    return moment, tuple(sorted(k for k in monomial if abs(k) >= 3))


def wick_coefficients(order, correction, base_value, bulk_moments):
    """Expand |r+p*u+w*v+t*T|^(2*order); keep each power of real t."""
    # The three bulk slots are r=3, p=4, w=5. T=8*v²*conj(u)
    # equals 2*sqrt(2)*V²*conj(U) for proper unit-variance U,V.
    terms = [(0, 1, (3,)), (0, 1, (4, 1)), (0, 1, (5, 2)),
             (1, 8, correction)]
    reflected = [(d, c, conjugate(m)) for d, c, m in terms]
    coefficients = Counter({0: base_value})
    for chosen in product(*([terms] * order + [reflected] * order)):
        power = sum(d for d, _, _ in chosen)
        if power == 0:
            # The diagonal change preserves the real law at t=0. Its moments
            # are checked below from the independent thirteen-coordinate copies.
            continue
        factor = 1
        monomial = ()
        for _, c, m in chosen:
            factor *= c
            monomial += m
        gaussian_moment, bulk = driver_moment(monomial)
        if gaussian_moment:
            check(bulk in bulk_moments, f"missing bulk moment {bulk}")
            coefficients[power] += factor * gaussian_moment * bulk_moments[bulk]
    return tuple(coefficients.get(j, 0) for j in range(2 * order + 1))


def evaluate(coefficients, t):
    return sum(c * t**j for j, c in enumerate(coefficients))


def main():
    # A=T_X+omega*T_Y+omega²*T_Z, with three independent Gamma(4,1).
    # Centering is exact. The variance and third cumulant of each centered
    # radius are 4 and 8; 1³+omega³+(omega²)³=3.
    mean_t, second_t, third_t = (4, 4 * 5, 4 * 5 * 6)
    a2 = 3 * (second_t - mean_t**2)
    a3 = 3 * (third_t - 3 * mean_t * second_t + 2 * mean_t**3)
    check((a2, a3) == (12, 24), "cluster contrast moments")

    # The archived single copy is S=sqrt(3)*R4+D*A, with E|S|²=60
    # and E|S|⁴=10800 by its two moment polynomials at a²=1/3.
    a_squared = Fraction(1, 3)
    single_u = 3 * (16 + 12 * a_squared)
    single_m4 = 9 * (800 + 960 * a_squared + 720 * a_squared**2)
    # Weighting by the product of all three radii raises Gamma(4,1) to
    # Gamma(5,1); the mean contrasts cancel and each new variance is five.
    mixed_r4_a = 16 * 3 * 5
    fourth_a = 2 * a2**2 + 3 * (6 * 4)
    check(single_m4 == 9 * 800 + 12 * mixed_r4_a + 2 * fourth_a,
          "independent conditional fourth moment")
    base_u = 2 * single_u
    base_m4 = 2 * single_m4 + 4 * single_u**2
    check((base_u, base_m4) == (120, 36000), "base moments")

    # r=sqrt(3)*(R4_1+R4_2), p=A1+A2, w=conj(A1)-conj(A2).
    # Independence, centering and identical laws give E[w²*conj(p)]=2*a3,
    # and E[p²*conj(w)]=0. The latter controls a swapped correction.
    bulk = {
        (): 1,
        (-3, 3): 3 * (16 + 16),
        (-4, 4): 2 * a2,
        (-5, 5): 2 * a2,
        (-4, 5, 5): 2 * a3,
        (-5, -5, 4): 2 * a3,
        (-5, 4, 4): 0,
        (-4, -4, 5): 0,
    }
    correction = (2, 2, -1)
    u = wick_coefficients(1, correction, base_u, bulk)
    m4 = wick_coefficients(2, correction, base_m4, bulk)
    check(u == (120, 0, 16), "variance polynomial")
    check(m4 == (36000, 384, 9984, 0, 3072), "fourth-moment polynomial")
    # A distinct correction U²*conj(V) has a zero linear term.
    swapped = wick_coefficients(2, (1, 1, -2), base_m4, bulk)
    check(swapped[1] == 0 and m4[1] > 0, "signed tangent control")

    def dimension_cost(t):
        return 26 * (evaluate(m4, t) / evaluate(u, t)**2 - 2)

    t = Fraction(-6, 23)
    cost = dimension_cost(t)
    check(cost == Fraction(91813293, 7123561), "rational dimension cost")
    check(cost < 13 < dimension_cost(-t), "opposite-sign control")
    print("u(t) =", u)
    print("E|q(t)|^4 =", m4)
    print(f"t={t}, 26 chi={cost} < 13")


if __name__ == "__main__":
    main()

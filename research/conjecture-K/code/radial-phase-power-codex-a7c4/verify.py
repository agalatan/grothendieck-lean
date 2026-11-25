"""Exact arithmetic for the two radial odd-increment estimates in task #618."""

from fractions import Fraction as F
from math import isqrt


def require(condition, statement):
    if not condition:
        raise ArithmeticError(statement)


def radial_mean_upper(a, b):
    """Bound the mean of sqrt(t/(a+bt)) using increasing right-endpoint steps."""
    h = F(1, 256)
    height_scale = 10**9
    survival_scale = 10**12
    decay = 1 / (1 + h + h**2 / 2)

    def height_upper(square):
        return isqrt(square.numerator * height_scale**2 // square.denominator) + 1

    previous = 0
    survival = survival_scale
    total = 0
    for i in range(1, 4097):
        t = i * h
        height = height_upper(t / (a + b*t))
        require(height >= previous, "monotone height increments")
        total += (height - previous) * survival
        previous = height
        survival = (survival * decay.numerator + decay.denominator - 1) // decay.denominator
    tail = height_upper(1 / b)
    require(tail >= previous, "tail height")
    total += (tail - previous) * survival
    return F(total, height_scale * survival_scale)


def main():
    a, b, p = F(699, 1250), F(179, 1250), F(2500, 1891)
    moment = radial_mean_upper(a, b)
    require(moment < F(513, 500), "mean radial coefficient")
    coeff = F(1, 2)
    integral = F(4)
    for j in range(1, 9):
        integral -= 4 * coeff / (4*j + 1)
        coeff *= F(2*j - 1, 2*j + 2)
    pi_lower = F(157, 50)
    # Machin's identity and the alternating arctangent bounds at 1/5 and 1/239.
    require(16 * (F(1, 5) - F(1, 3*5**3)) - F(4, 239) > pi_lower, "pi lower bound")
    linear, power = F(9, 20), F(109, 40)
    require(4*a*b*(p+linear)**2 > 1, "linear coefficient")
    require(32*(integral*F(513, 500)/pi_lower)**4 < power**4, "three-quarter coefficient")
    w = F(1, 2_100_000)
    allowance = F(1241, 25_000_000) - linear*w
    require(allowance > 0 and power**4*w**3 < allowance**4, "odd charge at strip endpoint")
    require(w / F(1, 3_000_000) == F(10, 7), "strip improvement")

    require(a > F(1, 2) and b > F(1, 8) and a+b < 1, "phase sublevel constants")
    alpha = F(5, 6)
    integral_bound = 1/(1+alpha) + 1/(2*(1-alpha))
    require(integral_bound == F(39, 11), "layer-cake integral")
    ratio = F(3, 8)
    series = (8 - 5*ratio + 4*ratio**2 - ratio**3) / (1-ratio)**4
    require(series == F(27176, 625), "geometric third moment")
    require(2*integral_bound*120*series < 37000, "eleven-twelfths coefficient")
    require(4-a/b == F(17, 179), "conditional zero circle")
    print("E[g(T)] <", F(513, 500), "(rational upper sum", moment, ")")
    print("Odd strip W <=", w, "with gain", F(10, 7))
    print("E[Psi] <= 37000 W^(11/12)")


if __name__ == "__main__":
    main()

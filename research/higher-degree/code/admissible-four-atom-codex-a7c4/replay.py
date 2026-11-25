"""Exact examples for the four-scale reduction. Run with Python 3 from any directory."""
from fractions import Fraction as F
from itertools import product
from math import prod


def require(condition, message):
    if not condition:
        raise ValueError(message)


def gamma_moment(shape, exponent):
    return prod(range(shape, shape + exponent))


def moment(shapes, shifts, powers, offsets):
    """E prod_i Y_i^offsets_i (Y_i-shifts_i)^powers_i for independent unit-scale gammas."""
    from math import comb
    return prod(sum(comb(k, j) * (-shift) ** (k - j) * gamma_moment(shape, offset + j)
                    for j in range(k + 1))
                for shape, shift, k, offset in zip(shapes, shifts, powers, offsets))


def dot_abs_moment(c, real, imag, degree, offsets):
    # |A|^(2d) = (Re(A)^2 + Im(A)^2)^d, with linear forms in four centered variables.
    total = F(0)
    for axes in product((real, imag), repeat=degree):
        factors = [axis for axis in axes for _ in range(2)]
        for indices in product(range(4), repeat=len(factors)):
            coeff = prod(axis[i] for axis, i in zip(factors, indices))
            if coeff:
                powers = [indices.count(i) for i in range(4)]
                total += coeff * moment([1, c, c, c], [2, c, c, c], powers, offsets)
    return total


def check_deficit(c, real, imag, h_second):
    # The real driver coefficient of R-2 is a/sqrt(2).
    sqnorm = sum(x*x + y*y for x, y in zip(real[1:], imag[1:]))
    squared_sum = sum(real[1:])**2 + sum(imag[1:])**2
    s = 1 - 2 * real[0]**2 - c * sqnorm
    require(imag[0] == 0 and 0 < s < 1, "invalid driver or bulk share")
    kappa = F(2*c, c+1) * h_second
    core = dot_abs_moment(c, real, imag, 2, [2, 0, 0, 0])
    mixed = dot_abs_moment(c, real, imag, 1, [1, 1, 1, 1])
    bulk = gamma_moment(c, 2)**3
    raw = core + 4*s*mixed/c**3 + kappa*s**2*bulk/c**6 - 2
    core_deficit = core - 2*(1-s)**2
    split = core_deficit + 4*s*(sqnorm + squared_sum) + s**2*((1 + F(1,c))**3*kappa - 2)
    require(raw == split and raw >= 0, "relaxed fourth-moment decomposition")


def check_gate():
    scales = [0, F(1,2), F(3,2), 2]
    uniform = [F(1,4)]*4
    displaced = [F(1,4), F(1,8), F(5,8), F(0)]

    def gate(weights, amplitude):
        z = amplitude - 1
        return z*z + (weights[1]-F(1,4))*z + weights[0]-F(1,4)

    for w in [uniform, displaced]:
        require(sum(w) == sum(h*p for h, p in zip(scales,w)) == 1, "mass or mean")
        require(gate(w, 1) == 0, "contact height")
    require(uniform[1] == F(1,4) and displaced[1]-F(1,4) == -F(1,8), "contact slope")
    require(gate(displaced, F(17,16)) == -F(1,256), "moving-minimum negative control")
    # After the value and slope fix the first two masses, the two remaining
    # columns of (total mass, mean) have determinant h4-h3.
    require(scales[3]-scales[2] == F(1,2), "four-point rank")


if __name__ == "__main__":
    real = [F(1,5), F(1,9), -F(1,8), F(1,10)]
    imag = [F(0), -F(1,11), F(1,12), F(1,7)]
    for c in (2, 3, 5):
        # H=1 and H uniform on {0,2} have mean one and these second moments.
        for second_moment in (1, 2):
            check_deficit(c, real, imag, second_moment)
    check_gate()
    print("Six exact mixed-driver deficit checks and the moving-minimum control passed.")

"""Exact replay of the cubic shear and its peak-row energy condition. Agent-ID: codex-a7c4."""
from fractions import Fraction
from itertools import product
from math import factorial, prod

from sympy import Matrix, Poly, symbols


def equal(actual, expected, description):
    if actual != expected:
        raise ValueError(f"{description}: got {actual}, expected {expected}")


def gaussian_mean(polynomial, z, bars):
    """Independent proper complex coordinates of variance one."""
    return sum(coeff * prod(factorial(i) for i in powers[:len(z)])
               for powers, coeff in Poly(polynomial, *z, *bars).terms()
               if powers[:len(z)] == powers[len(z):])


def check_cubic():
    z = symbols("x y u v w")
    bars = symbols("xb yb ub vb wb")
    x, y, u, v, _ = z
    _, _, ub, vb, wb = bars
    prime = symbols("xp yp up vp wp")
    xp, yp = prime[:2]
    q = x**2 * ub + x*y*vb + (x*v-y*u)*wb
    field = Matrix([q.diff(t) for t in bars])
    jac = field.jacobian(z)
    mixed = (jac * field.xreplace(dict(zip(z, prime)))).applyfunc(lambda p: p.expand())
    equal(mixed, Matrix([0, 0, 0, 0, (xp*(x*yp-y*xp)).expand()]), "two-point derivative")
    equal(jac*field, Matrix.zeros(5, 1), "diagonal contraction")
    equal(sum(field[i].diff(z[i]) for i in range(5)), 0, "Wick divergence")
    detuned = q - y*u*wb
    changed = Matrix([detuned.diff(b) for b in bars])
    equal(changed.jacobian(z)*changed, Matrix([0, 0, 0, 0, -x**2*y]), "detuned control")

    swap = dict(zip(z + bars, bars + z))
    mod2 = q * q.xreplace(swap)
    c2 = sum(f * f.xreplace(swap) for f in field)
    exps = symbols("s t h")
    s, t, h = exps
    variance = (s+t)*(s+h)
    for k, j in product(range(3), range(2)):
        expected = factorial(k) * gaussian_mean(c2**(k+j), z, bars)
        equal(gaussian_mean(mod2**k * c2**j, z, bars), expected, f"mixed moment {(k,j)}")
        radial = sum(coeff*prod(factorial(i) for i in powers)
                     for powers, coeff in Poly(variance**(k+j), *exps).terms())
        equal(factorial(k)*radial, expected, f"independent exponential mixture {(k,j)}")
    values = [gaussian_mean(mod2**k, z, bars) for k in (1, 2)]
    equal(values, [5, 152], "raw Gaussian moments")
    pairs = {(i,j,k) for i,j,k in product(range(3), repeat=3) if i <= j and i+j-k == -1}
    equal(pairs, {(0,0,1), (0,1,2)}, "complete weight -1 projection")
    print(f"two-point obstruction at (e2,e1) = {mixed[4].subs({x:0,y:1,xp:1,yp:0})}")
    energy, fourth = map(int, values)
    excess = Fraction(fourth, energy**2) - 2
    print(f"energy and fourth moment = {values}, normalized fourth excess = {excess}")


def check_peak_row():
    a, b = Fraction(699,1250), Fraction(179,1250)
    mean = a*a + 4*a*b + 6*b*b
    max_energy = Fraction(463,10000)
    if not (a > Fraction(1,2) and mean + max_energy < 1):
        raise ValueError("peak bounds")
    exp2_lo = sum(Fraction(2**j, factorial(j)) for j in range(6))
    if not 1 - 5 / exp2_lo > Fraction(3,10):
        raise ValueError("lower bound on Gamma(3,1) event")
    gap = Fraction(3,10) * (1 - Fraction(4,12))**2 / 8
    equal(gap, Fraction(1,60), "square-root tangent budget")
    perturbation = gap / (10*36+6)
    equal(perturbation, Fraction(1,21960), "perturbation energy")
    print(f"mean visible variance = {mean}, deficit > energy^2/{gap.denominator}")
    print(f"residual energy / core energy^2 <= {perturbation} implies C^2 <= D/10")


if __name__ == "__main__":
    check_cubic()
    check_peak_row()

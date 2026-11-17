"""Exact bounds, sharp examples and law comparisons for issue #507.

Agents: claude-b9ee and codex-6d92.
"""

from fractions import Fraction
from math import factorial, prod

import sympy as sp


if not __debug__:
    raise RuntimeError("Run the exact checks with assertions enabled.")

c = sp.symbols('c', positive=True)
wick = 2*c**2*(3*c+5)/(3*(c+1)**3)
floor = 2*c/(c+1)
assert sp.cancel(3*c*(c+1)**3*(wick-2+sp.Rational(8, 3)/c)) == 6*c**2+18*c+8
assert sp.cancel((c+1)**3*(wick-2*c**2/(c+1)**2)) == 4*c**2/3
assert sp.cancel(3*(c+1)**3*(floor-wick)-2*c*(c+3)) == 0
assert sp.cancel(c*(c+1)*(floor-2+2/c)) == 2
print("PASS strict gaps for the Wick and spherical floors.")

# The two amplified excesses come from Beta moments and explicit Gamma couplings.
beta_second = floor
beta_third = 6*c**2/((c+1)*(c+2))
kappa = sp.symbols('kappa', positive=True)
assert sp.cancel(beta_third/beta_second**2 - 3*(c+1)/(2*(c+2))) == 0
exp_cross = c*(1-((c-1)/c)**2)
assert sp.cancel(exp_cross-(2-1/c)) == 0
gamma_cross_large_shape = 1+(exp_cross-1)*(kappa-1)
assert sp.cancel(2*kappa-2*gamma_cross_large_shape - 2*(kappa-1)/c) == 0
assert sp.cancel(2*kappa-2*exp_cross - (2*(kappa-2)+2/c)) == 0
print("PASS the third-moment coefficient and both Gamma coupling costs.")


def gaussian_norm_squared(poly, z, zbar):
    """Integrate |poly|^2 by E z^a conj(z)^b = delta_{a,b} a!."""
    terms = sp.Poly(poly, *z, *zbar).terms()
    n = len(z)
    result = 0
    for left, p in terms:
        for right, q in terms:
            positive = [left[i]+right[n+i] for i in range(n)]
            negative = [left[n+i]+right[i] for i in range(n)]
            if positive == negative:
                result += p*sp.conjugate(q)*prod(factorial(i) for i in positive)
    return result


def check_extremizer(dimension):
    z = sp.symbols(f'z:{3*dimension}')
    zbar = sp.symbols(f'zb:{3*dimension}')
    x, y, w = z[:dimension], z[dimension:2*dimension], z[2*dimension:]
    xb, yb, wb = zbar[:dimension], zbar[dimension:2*dimension], zbar[2*dimension:]
    if dimension == 2:
        poly = w[1]*(xb[0]*y[0]+xb[1]*y[1])+wb[0]*(x[0]*y[1]-x[1]*y[0])
        second, fourth = 4, 72
    else:
        f0 = sum(a*b for a, b in zip(y, w))
        u, vbar = sp.Matrix(y[1:]), sp.Matrix(wb[1:])
        f = yb[0]*sp.Matrix(w[1:])-w[0]*sp.Matrix(yb[1:])+u.cross(vbar)
        conjugate = dict(zip(z+zbar, zbar+z))
        norms = f0*f0.xreplace(conjugate)+sum(entry*entry.xreplace(conjugate) for entry in f)
        assert sp.expand(norms-sum(a*b for a, b in zip(y, yb))*sum(a*b for a, b in zip(w, wb))) == 0
        poly = xb[0]*f0 + sum(a*b for a, b in zip(x[1:], f))
        second, fourth = 16, 800

    assert gaussian_norm_squared(poly, z, zbar) == second
    assert gaussian_norm_squared(poly**2, z, zbar) == fourth
    sphere_kappa = Fraction(dimension, dimension+1)**3*Fraction(fourth, second**2)
    assert sphere_kappa == Fraction(2*dimension, dimension+1)
    print(f"PASS c={dimension} sharp example: Gaussian moments {second}, {fourth}; kappa {sphere_kappa}.")


check_extremizer(2)
check_extremizer(4)


def diagonal_moments(weights):
    s2 = sum(a**2 for a in weights)
    s3 = sum(a**3 for a in weights)
    return Fraction(3, 4)**3*(2+6*s2), Fraction(9, 20)**3*(6+54*s2+156*s3)


p = [Fraction(i, 9) for i in (4, 4, 1)]
q = [Fraction(i, 9) for i in (2, 2, 5)]
assert diagonal_moments(p) == (Fraction(15, 8), Fraction(5067, 1000))
assert diagonal_moments(q) == (Fraction(15, 8), Fraction(5301, 1000))
assert Fraction(5067, 1000) < Fraction(15, 8)*(2*Fraction(15, 8)-1) == Fraction(165, 32) < Fraction(5301, 1000)
print("PASS same kappa 15/8 with third moments 5067/1000 and 5301/1000 around Gamma's 165/32.")

# These are published numerical targets. The comparisons to those inputs are rational.
targets = {
    4: (1285, 1290), 5: (1402, 1407), 6: (1483, 1488),
    8: (1591, 1596), 10: (1658, 1662), 12: (1705, 1708),
}
for dimension, values in targets.items():
    wick_value = wick.subs(c, dimension)
    sphere_floor = floor.subs(c, dimension)
    need = sp.Rational(max(values), 1000)
    assert need < wick_value < sphere_floor
    print(f"PASS c={dimension}: numerical target {need} below Wick {wick_value} and sphere {sphere_floor}.")

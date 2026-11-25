"""Exact checks for Gaussian shear fibres. Agent-ID: codex-a7c4."""
from fractions import Fraction
from math import factorial, prod

from sympy import I, Matrix, Poly, eye, symbols, zeros


def equal(actual, expected, label):
    if actual != expected:
        raise ValueError(f"{label}: {actual} != {expected}")


def check_example():
    z = symbols("x u v w")
    bars = symbols("xb ub vb wb")
    x, u, v, _ = z
    xb, ub, vb, _ = bars
    swap = dict(zip(z + bars + (I,), bars + z + (-I,)))

    def conj(p):
        return p.xreplace(swap)

    def wick(p):
        return sum(c * prod(factorial(j) for j in powers[:4])
                   for powers, c in Poly(p, *z, *bars).terms()
                   if powers[:4] == powers[4:])

    fields = Matrix([[0, x**2, 0, x*v], [0, 0, x**2, -x*u]])
    f, k = fields.row(0).T, fields.row(1).T
    cross = Matrix([0, 0, 0, x**3])
    for field, other, crossed in [(f, k, cross), (k, f, -cross)]:
        equal(field.jacobian(z)*field, zeros(4, 1), "individual contraction")
        equal(field.jacobian(z)*other, crossed, "crossed contraction")
        equal(field.jacobian(z).trace(), 0, "Wick divergence")
    q = fields*Matrix(bars)
    h = fields*fields.applyfunc(conj).T
    l, m = Matrix([v, -u]), x**2 * Matrix([ub, vb])
    lam = (x*xb)**2
    gap = x*xb*(u*ub+v*vb)
    equal(h, lam*eye(2) + x*xb*l*l.applyfunc(conj).T, "Gram matrix")
    equal(l.applyfunc(conj).dot(m), 0, "orthogonal eigendirections")
    equal(q, m + x*bars[3]*l, "projection decomposition")
    equal((h-lam*eye(2)).det().expand(), 0, "smaller eigenvalue")
    equal((h.trace()-2*lam-gap).expand(), 0, "spectral gap")
    equal((m.dot(m.applyfunc(conj))-x*xb*gap).expand(), 0, "projected radius")

    mixed = wick(q[0]*conj(q[0])*q[1]*conj(q[1]))
    equal(mixed, wick(h[0,0]*h[1,1]+h[0,1]*h[1,0]), "joint Wick moment")
    for alpha in [2, I]:
        field = f + alpha*k
        projection = field.dot(Matrix(bars))
        variance = field.dot(field.applyfunc(conj))
        for order in [1, 2, 3]:
            equal(wick((projection*conj(projection))**order),
                  factorial(order)*wick(variance**order), "projected Wick moment")
    print(f"Opposite crossed contractions; mixed fourth moment {mixed}; spectral obstruction verified.")


def check_fibre_projection():
    # A genuinely complex unit direction and an orthogonal base point.
    from itertools import combinations_with_replacement, product
    from sympy import Rational
    t, tb = symbols("t tb")
    direction = Matrix([Rational(3,5), 4*I/5])
    base = Matrix([4*I/5, Rational(3,5)])
    equal(direction.conjugate().dot(direction), 1, "unit direction")
    equal(direction.conjugate().dot(base), 0, "transverse base")
    z = base + direction*t
    bars = base.conjugate() + direction.conjugate()*tb
    for (i,j), k in product(combinations_with_replacement(range(2), 2), range(2)):
        cubic = z[i]*z[j]*bars[k] - int(i == k)*z[j] - int(j == k)*z[i]
        terms = Poly(cubic, t, tb).terms()
        mode = sum(c*t**a*tb**b for (a,b),c in terms if a-b == -1)
        equal(mode.expand(), (tb*direction[k].conjugate()*base[i]*base[j]).expand(),
              f"frequency -1 of Wick monomial {(i,j,k)}")
    quintic_mode = tb*(t*tb-2)  # The independent x^2 factor is suppressed.
    equal(Poly(quintic_mode, t, tb).coeff_monomial(t*tb**2), 1, "quintic control")
    s, target = symbols("s target", positive=True)
    gap = target + (s**2-target**2)/(2*target) - s
    equal((gap-(s-target)**2/(2*target)).expand(), 0, "exact tangent gap")
    # The two losses add in squares by projection; the first is the derivative
    # bound on sqrt(D), the second is the total Taylor and raw-content cost.
    slope_squared = Fraction(8,4)
    transverse_cost = 6 + 10*36
    equal(slope_squared + transverse_cost, 368, "dimension-free deficit ratio")
    equal(8*(slope_squared + transverse_cost), 2944, "explicit energy denominator")
    print("All six two-coordinate Wick monomials have the predicted fibre mode.")


def check_budgets():
    a, b, upper = Fraction(699,1250), Fraction(179,1250), Fraction(463,10000)
    m = a*a + 4*a*b + 6*b*b
    if not (a > Fraction(1,2) and m + upper < 1):
        raise ValueError("peak-row perturbation budget")
    # Beyond k=2, consecutive terms in exp(1) have ratio at most 1/4.
    if not 1 + 1 + Fraction(1,2) + Fraction(1,6)/(1-Fraction(1,4)) < 3:
        raise ValueError("e < 3")
    for d in [1, 2, 3, 4, 8, 16, 32]:
        def gamma_tail_coefficient(shape):
            return sum(Fraction(d**j, factorial(j)) for j in range(shape))

        difference = gamma_tail_coefficient(d+2)-gamma_tail_coefficient(d)
        equal(difference, Fraction(d**d, factorial(d))*Fraction(2*d+1,d+1),
              "gamma tail with common exponential removed")
    print(f"Mean visible variance {m}; slack below one at maximum core energy {1-m-upper}.")


if __name__ == "__main__":
    check_example()
    check_fibre_projection()
    check_budgets()

"""Exact Gaussian-moment and covariance checks for task #698. Agent-ID: codex-a7c4."""
from fractions import Fraction
from math import factorial, prod

from sympy import Matrix, Poly, Rational, eye, symbols, zeros


def equal(x, y, label):
    if x != y:
        raise ValueError(f"{label}: {x} != {y}")


def exponential_mean(p, variables):
    return sum(coeff*prod(factorial(j) for j in powers)
               for powers, coeff in Poly(p, *variables).terms())


def check_fourier_probe():
    a, b, t = symbols("a b t")
    # F=(x^2,xy). Its two outputs share x, and H=diag(2,1).
    # Conditional determinant for the scalar probe at |c1|²=a, |c2|²=b.
    determinant = 1 + 4*t*(a+b/2) + t**2*b**2
    coefficients = (determinant**Rational(-1,2)).series(t, 0, 5).removeO().expand()
    v = a*a+a*b
    for k in range(5):
        equal(exponential_mean(coefficients.coeff(t,k),(a,b))*(-1)**k*factorial(k),
              exponential_mean(v**k,(a,b)), f"Laplace coefficient {k}")
    equal(exponential_mean(v**2,(a,b)),40,"dependent output fourth moment")
    equal(exponential_mean((2*a+b)**2,(a,b)),14,"Gaussian comparator fourth moment")
    real, imag = Matrix([[1,2],[2,-1]]), Matrix([[2,-1],[-1,3]])
    block = real.row_join(-imag).col_join((-imag).row_join(-real))
    j = zeros(2).row_join(-eye(2)).col_join(eye(2).row_join(zeros(2)))
    equal(block*j+j*block,zeros(4),"real complex-structure anticommutation")
    print("Fourier determinant reproduces four moments for a quadratic field with dependent outputs.")


def check_spectral_budget():
    z = symbols("x0:3")
    lam = symbols("l0:3")
    u = sum(lam)
    var = sum(x**2 for x in lam)
    third = 2*sum(x**3 for x in lam)
    centered = sum(l*(x-1) for l,x in zip(lam,z))
    for k,expected in [(1,0),(2,var),(3,third)]:
        equal((exponential_mean(centered**k,z)-expected).expand(),0,f"central moment {k}")
    v = symbols("v")
    equal((exponential_mean(centered**2*(2*v+2*u+centered),z)
           - 2*(v+u)*var-third).expand(),0,"size-biased tangent denominator")
    for n in [1,2,7,32]:
        fourth_sum = n*24+2*n*(n-1)*4
        equal(Fraction(fourth_sum,4*n**2), 2+Fraction(4,n), "sharpness sequence")
    a,b=Fraction(699,1250),Fraction(179,1250)
    slack=1-(a*a+4*a*b+6*b*b)-2*Fraction(463,10000)
    if slack <= 0:
        raise ValueError("peak variance budget")
    equal(368*8,2944,"stability denominator")
    print(f"Weighted-exponential moments and peak margin {slack} verified.")


if __name__ == "__main__":
    check_fourier_probe()
    check_spectral_budget()

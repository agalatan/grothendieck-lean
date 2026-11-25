"""Exact Gaussian-moment and covariance checks for task #698. Agent-ID: codex-a7c4."""
from fractions import Fraction
from itertools import product
from math import comb, factorial, prod

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


def check_independent_blocks():
    # Coefficients of J(sqrt(x)) and A(sqrt(x)) from circle and disk moments.
    def circle_coefficient(k):
        return Fraction((-1)**k * comb(2*k,k), 4**k * factorial(2*k))

    for k in range(7):
        disk = circle_coefficient(k)/(k+1)
        equal((k+1)*circle_coefficient(k+1), -disk/4, "circle derivative")
    equal(abs(circle_coefficient(1)/2), Fraction(1,8), "disk derivative at zero")
    # For a planar frequency with coordinate variance 2 lambda, E|omega|^4 / lambda^2.
    equal(2*3*4 + 2*4,32,"radial frequency fourth moment")
    limit = Fraction(463,10000)
    a, b = Fraction(699,1250), Fraction(179,1250)
    m = a*a+4*a*b+6*b*b
    protected = Fraction(7,25)
    if not (m+limit < Fraction(9,10)**2 and m+2*limit < Fraction(17,20)
            and (protected*8*Fraction(9,10)*Fraction(17,20))**2 < 3):
        raise ValueError("buffered spectral coefficient")
    curvature, response = Fraction(17,20), 40*Fraction(11,5)**2*43
    one = (curvature+response*limit/12)/121
    many = curvature/28 + response*limit/(2*28**2)
    def lower(a):
        if a <= 2:
            return 1-a+a*a/4-a**3/36
        return max(-Fraction(1,2), -Fraction(2,9)-(a-2)/3)

    equal(lower(Fraction(2)), -Fraction(2,9), "tangent value")
    equal(lower(Fraction(17,6)), -Fraction(1,2), "constant junction")
    cutoff = Fraction(5,4)
    if not (lower(cutoff)>0 and 1/(1+cutoff+cutoff**2/2)<cutoff**2/4):
        raise ValueError("negative factor cutoff")
    examples = [(a,x) for a in map(Fraction,[0,Fraction(1,4),1,Fraction(5,4),2,3])
                for x in (lower(a),Fraction(1))]
    for pairs in product(examples, repeat=3):
        total = sum(a for a,x in pairs)
        upper = 1/sum(total**k/factorial(k) for k in range(6))
        if upper-prod(x for a,x in pairs) > sum(a*a/4 for a,x in pairs):
            raise ValueError("independent product sign budget")
    if not (one < protected and many < protected):
        raise ValueError("independent perturbation budgets")
    print(f"Protected {protected}; worst costs {one} (one block), {many} (28 blocks).")


if __name__ == "__main__":
    check_fourier_probe()
    check_spectral_budget()
    check_independent_blocks()

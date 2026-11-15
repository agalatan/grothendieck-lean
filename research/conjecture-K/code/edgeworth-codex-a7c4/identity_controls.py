#!/usr/bin/env python3
"""Agent-ID: codex-a7c4. Exact Wick controls of the two-step identity.

These independent polynomial examples test the signs, shifts and factors of
the paper derivation. They do not prove the identity for arbitrary cubics.
"""
from fractions import Fraction as F
from itertools import product
from math import factorial, prod

if not __debug__:
    raise RuntimeError('Assertions must be enabled')


def add(*polys):
    out = {}
    for poly in polys:
        for powers,c in poly.items():
            out[powers] = out.get(powers,F(0))+c
    return {p:c for p,c in out.items() if c}


def scale(poly,c):
    return {p:c*v for p,v in poly.items() if c*v}


def mul(a,b):
    out = {}
    for p,x in a.items():
        for q,y in b.items():
            r = tuple(i+j for i,j in zip(p,q))
            out[r] = out.get(r,F(0))+x*y
    return {p:c for p,c in out.items() if c}


def moment(poly):
    def normal(n):
        return 0 if n%2 else factorial(n)//(2**(n//2)*factorial(n//2))
    return sum(c*prod(normal(n) for n in p) for p,c in poly.items())


def hermite(n):
    return {n-2*j:F((-1)**j*factorial(n),2**j*factorial(j)*factorial(n-2*j))
            for j in range(n//2+1)}


def project(poly,order):
    """Convert monomials to Hermites, select total order, expand back."""
    out = {}
    for powers,c in poly.items():
        for js in product(*(range(n//2+1) for n in powers)):
            degrees = tuple(n-2*j for n,j in zip(powers,js))
            if sum(degrees) != order:
                continue
            weight = c*prod(F(factorial(n),2**j*factorial(j)*factorial(n-2*j))
                            for n,j in zip(powers,js))
            for terms in product(*(hermite(n).items() for n in degrees)):
                p = tuple(n for n,_ in terms)
                out[p] = out.get(p,F(0))+weight*prod(v for _,v in terms)
    return {p:c for p,c in out.items() if c}


def check(name,f_squared,u,expected):
    dimension = len(next(iter(f_squared)))
    one = {(0,)*dimension:F(1)}
    assert moment(f_squared) == 1 and moment(u) == 0
    u2,u4 = project(u,2),project(u,4)
    assert add(u2,u4) == u and moment(mul(u2,u4)) == 0
    f4,f6 = mul(f_squared,f_squared),mul(mul(f_squared,f_squared),f_squared)
    h6 = add(f6,scale(f4,-15),scale(f_squared,45),scale(one,-15))
    h8 = add(mul(f4,f4),scale(f6,-28),scale(f4,210),scale(f_squared,-420),scale(one,105))
    psi = scale(h6,-7)  # high Hermite part of phi'_h for h(x)=x^8
    h2 = add(f_squared,scale(one,-1))
    rhs = F(0)
    for k,uk in ((2,u2),(4,u4)):
        w = mul(u,uk)
        parts = [project(w,l) for l in (0,2,4,6,8)]
        assert add(*parts) == w
        for l,wl in zip((0,2,4,6,8),parts):
            # psi''''=-2520 H2; both resolvents act diagonally on H2.
            coefficient = -F(2520,9)/((4-F(l,3))*(6-F(k,3)))
            rhs += coefficient*moment(mul(mul(h2,u),wl))
    assert moment(mul(psi,u)) == rhs
    assert -rhs/3 == moment(h8) == expected
    print('PASS exact two-step identity:',name,'residual',expected)


def main():
    check('N1*N2*N3',{(2,2,2):F(1)},
          {(2,2,0):F(1),(2,0,2):F(1),(0,2,2):F(1),(0,0,0):F(-3)},1068480)
    f_squared = {(6,):F(1,6),(4,):F(-1),(2,):F(3,2)}
    u = {(4,):F(3,2),(2,):F(-3),(0,):F(-3,2)}
    # Compute the second model's residual independently from its raw moments.
    f4=mul(f_squared,f_squared)
    expected=moment(mul(f4,f4))-28*moment(mul(f4,f_squared))+210*moment(f4)-315
    # Independently expanding (N^3-3N)^(2n)/6^n gives raw moments
    # 1, 93, 53745, 84097545; the residual is their H8 combination.
    assert expected == 82611900
    assert moment(mul(u,u)) == 126 and moment(f4)-3 == 90
    check('H3(N)/sqrt(6)',f_squared,u,expected)


if __name__ == '__main__':
    main()

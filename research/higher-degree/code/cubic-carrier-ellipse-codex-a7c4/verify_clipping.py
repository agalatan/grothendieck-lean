#!/usr/bin/env python3
"""Project first, then clip a scaled cubic. Certified without the mass row. Agent-ID: codex-a7c4."""
from fractions import Fraction as F
from math import comb, isqrt

E, ETA, TARGET = F(39,50), F(779,10000), F(500,701)
C6, SHIFT = F(4045313,100000), F(21,200)


def require(test, message):
    if not test:
        raise ArithmeticError(message)


def sqrt_up(x):
    scale = 10**12
    require(x >= 0, 'square-root argument')
    return F(isqrt(int(x*scale**2))+1,scale)


def atan_bounds(n):
    x = F(1,n)
    lo = sum((-1)**j*x**(2*j+1)/(2*j+1) for j in range(16))
    return lo,lo+x**33/33


def prove_positive(b,depth=0):
    if min(b)>0:
        return 1
    require(depth<20,'quartic positivity certificate exceeds depth')
    levels = [b]
    while len(levels[-1])>1:
        c = levels[-1]
        levels.append([(x+y)/2 for x,y in zip(c,c[1:])])
    return (prove_positive([c[0] for c in levels],depth+1)
            +prove_positive([c[-1] for c in reversed(levels)],depth+1))


def check_row(rho,nu,end,tangent):
    # nu is a proved lower coefficient in the pair ellipse.
    t = F(end)
    x = rho**2-nu*t**2
    z = (1+SHIFT)**2*x
    upper = ETA+(1-ETA)*t**2+(E-ETA)*x
    require(upper>TARGET and 0<x<1 and 2*z>1,'plain ellipse fails here')
    need = (upper-TARGET)/ETA + SHIFT**2*x
    r = sqrt_up(need)
    # AM-GM gives sqrt(2+s) <= (2+tangent^2+s)/(2*tangent).
    d0 = 2*z-1-r*(2+tangent**2)/(2*tangent)
    d1 = z-r/(2*tangent)
    require(min(d0,d1)>0,'nonnegative unsquared side')
    co = [d0**2-6*r*r*z, F(0), 2*d0*d1-9*r*r*z, -C6*r*r*z, d1**2]
    # Check the positive half-line in v=sqrt(s). The tail has positive Taylor coefficients at 4.
    require(all(sum(co[k]*comb(k,j)*4**(k-j) for k in range(j,5))>0 for j in range(5)),
            'tail coefficients positive')
    bern = [sum(co[k]*4**k*F(comb(j,k),comb(4,k)) for k in range(j+1)) for j in range(5)]
    leaves = prove_positive(bern)
    require(1-ETA>(E-ETA+ETA*SHIFT**2)*nu, 'envelope increases with t squared')
    return leaves


def fails_sixth_moment_majorant(rho,nu,t,s):
    # A specific excess (not a claim about existence of a cubic with that law) makes the scalar test fail.
    x=rho**2-nu*t**2
    z=(1+SHIFT)**2*x
    M=6+9*s+C6*s*sqrt_up(s)
    # Use lower endpoints of each square root in the analytic denominator for an upper bound on the saving.
    gran=F(1,10**12)
    mlo=6+9*s+C6*s*(sqrt_up(s)-gran)
    den=(sqrt_up(z*mlo)-gran)+(sqrt_up(2+s)-gran)
    require(den>0 and M>=mlo,'positive lower denominator')
    correction=(z*(2+s)-1)**2/den**2-SHIFT**2*x
    return ETA+(1-ETA)*t*t+(E-ETA)*x-ETA*correction>TARGET


def main():
    v,V=atan_bounds(5)
    w,W=atan_bounds(239)
    nu=F(63661977236758,10**14)
    require(nu<2/(16*V-4*w) and F(1,2)<nu<1,'rational lower bound on 2/pi')
    require(E-ETA-ETA*(1+2*SHIFT)>0,'upper payoff increases with hypothetical cubic energy')
    rows=[(F(2287,2500),nu,'0.32552663','1.795','1.222'),
          (F(4571,5000),nu,'0.32795281','1.7925','1.213'),
          (F(2287,2500),F(431,500)**2,'0.35386150','1.76333','1.10933'),
          (F(4571,5000),F(431,500)**2,'0.35649797','1.76009','1.09791')]
    for rho,coeff,end,tangent,excess in rows:
        n=check_row(rho,coeff,end,F(tangent))
        require(fails_sixth_moment_majorant(rho,coeff,F(end)+F(1,10**8),F(excess)),
                'next grid point must fail this fixed-shift moment majorant')
        print(f'Radius {rho}, t up to {end}: {n} Bernstein intervals plus analytic tail.')
    print('PASS')


if __name__=='__main__':
    main()

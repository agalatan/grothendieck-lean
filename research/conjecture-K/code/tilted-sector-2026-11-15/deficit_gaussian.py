#!/usr/bin/env python3
"""Arb enclosures of the same-variance Gaussian benchmark B(u).
Agent-ID: codex-6e2b. Direct Rice formula; no cached integrals are trusted.
"""
from fractions import Fraction as Q
from functools import lru_cache
from flint import arb,acb,ctx
ctx.prec=128

def ball(q):
    q=Q(q)
    return arb(q.numerator)/q.denominator

@lru_cache(None)
def benchmark(q):
    q=Q(q);assert q>0
    u=ball(q);a=arb(699)/1250;b=arb(179)/1250
    factor=(arb.pi()*u).sqrt()
    def integrand(t,analytic):
        z=t*(a+b*t)**2/(2*u)
        return factor*(-t).exp()*((1+2*z)*z.bessel_i(0,scaled=True)
                                  +2*z*z.bessel_i(1,scaled=True))
    value=acb(0)
    for j in range(256):
        value+=acb.integral(integrand,arb(j)/4,arb(j+1)/4,
                           rel_tol=arb('1e-20'),abs_tol=arb('1e-20'),eval_limit=100000)
    tail=arb(-64).exp()*(2*a*65+2*b*(64**2+128+2)+factor)
    assert value.is_finite() and abs(value.imag)<arb('1e-15')
    # The omitted tail is nonnegative and bounded by the norm triangle inequality.
    return value.real+arb(tail/2,tail/2)

if __name__=='__main__':
    for u in [Q(1,1000),Q(1,100),Q(1,25),Q(463,10000)]:
        print(str(u),benchmark(u),flush=True)

#!/usr/bin/env python3
"""Directed Arb scalar bounds for shared L² phase replacement.

Does not prove small-ball, Poisson summation, Gaussian integration, or Lean.
"""

if not __debug__:
    raise SystemExit("optimized Python is unsupported: checks must remain enabled")
from flint import arb,ctx
ctx.prec=160
h=arb(3)/10; eta=arb(1)/10**14; pi=arb.pi()
upper_cutoff=arb(235); lower_cutoff=arb(220)
q=(-pi*pi/h).exp()
alias=2*arb(2).sqrt()*q/(1-q)
low=2*h/pi.sqrt()*(-(lower_cutoff+1)*h/2).exp()/(1-(-h/2).exp())
top=eta**2*(upper_cutoff*h).exp()
high=(-top).exp()/(top*pi).sqrt()
soft=(arb(56)/3*(1+arb(10**14).log())).sqrt()*eta
scale=arb(15)/10**15
assert alias<scale and top>50
assert soft<arb(250)/10**15
assert low<arb(98)/10**16
assert high<arb(2)/10**50
cap=soft+alias+scale+low+high
assert cap<arb(29)/10**14
root_bad=(-arb(75)/2).exp()
root_a=arb(3)*(arb(12)/5).exp()
root_good=(-root_a).exp()/(pi*root_a).sqrt()
assert root_a>33 and root_bad+root_good<arb(4782)/10**19
assert arb(4000001)/10**17-cap-root_bad-root_good>arb(397)/10**13
print('soft:',soft,'\nalias:',alias,'\nlow:',low,'\nupper:',high,'\ntop:',top,'\ncombined:',cap)
print('additional root-neighborhood omission L²:',root_bad+root_good)
print('PASS numerical inequalities; no band residual or Lean theorem is checked.')

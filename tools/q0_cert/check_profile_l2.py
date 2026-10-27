#!/usr/bin/env python3
"""Exact Laguerre/profile bounds for ||z+κ(|z|²)w||₂<2; not Lean."""

if not __debug__:
    raise SystemExit("optimized Python is unsupported: checks must remain enabled")
from fractions import Fraction as Q
from math import comb,factorial
from pathlib import Path
import json
root=Path(__file__).resolve().parents[2]
data=json.loads((root/'data/upper-preprocess/certificate.json').read_text())
x=list(map(Q,data['profileQ'])); a=Q(data['aQ']);assert len(x)==12 and abs(a)<1

def choose(top,k):
 v=Q(1)
 for n in range(k):v*= (top-n)/Q(n+1)
 return v
for j in range(12):
 v=[(-1)**k*choose(Q(2*j-1,2),j-k)/factorial(k) for k in range(j+1)]
 norm2=sum((v[k]*v[l]*factorial(k+l) for k in range(j+1) for l in range(j+1)),Q())
 assert norm2<Q(4,3)
 assert Q(comb(2*j,j),4**j)>=Q(1,2*j+1)
cap=Q(6,5)*abs(x[0])+6*sum(map(abs,x[1:]),Q())
assert cap<Q('0.584') and 1+2*cap**2<4
print('PASS exact coefficient bounds supporting ||Z||₂<2; Gaussian/profile identity is analytic, not Lean checked.')

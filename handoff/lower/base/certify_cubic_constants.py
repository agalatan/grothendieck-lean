#!/usr/bin/env python3
"""Exact rational certificates for two sharpened constants in arXiv2609.25462 §8.3.
Uses only the Python standard library. No numerical optimization is part of proof.
Analytic input: the paper's Wick identity and contraction estimates preceding (8.13).
"""

if not __debug__:
    raise RuntimeError('Assertions are proof gates; do not use Python -O or -OO.')

from fractions import Fraction as Q
from math import comb
import json
from pathlib import Path

C6=Q('49.42289')
RHO=Q('0.979598')

def add(*ps):
 out=[Q(0)]*max(map(len,ps))
 for p in ps:
  for i,v in enumerate(p):out[i]+=v
 return out

def scale(p,a):return [a*v for v in p]

def mul(p,q):
 out=[Q(0)]*(len(p)+len(q)-1)
 for i,a in enumerate(p):
  for j,b in enumerate(q):out[i+j]+=a*b
 return out

def power(p,n):
 out=[Q(1)]
 for _ in range(n):out=mul(out,p)
 return out

def transform(p,lo,hi):
 out=[Q(0)]*len(p)
 for j,a in enumerate(p):
  for k in range(j+1):out[k]+=a*comb(j,k)*lo**(j-k)*(hi-lo)**k
 return out

def bernstein(p,lo,hi):
 p=transform(p,lo,hi);n=len(p)-1
 return [sum((p[j]*Q(comb(k,j),comb(n,j)) for j in range(k+1)),Q(0)) for k in range(n+1)]

def positive(p,lo,hi):
 todo=[(lo,hi,0)];leaves=[]
 while todo:
  l,h,d=todo.pop();cs=bernstein(p,l,h)
  if min(cs)>0:leaves.append((l,h,min(cs)))
  else:
   assert d<40,('unable',l,h)
   mid=(l+h)/2;todo.extend([(l,mid,d+1),(mid,h,d+1)])
 leaves.sort()
 assert leaves[0][0]==lo and leaves[-1][1]==hi
 assert all(a[1]==b[0] for a,b in zip(leaves,leaves[1:]))
 return leaves

def main():
 # Kappa6/kappa4^(3/2) <= N/(1+3y²/2)^(3/2), and
 # n6 - 9m + 12 = (3sqrt(6)/10)*(kappa6/kappa4^(3/2))*(m-2)^(3/2).
 N=list(map(Q,['47.5','82.5','45','67.5']))
 gap=add(scale(power([Q(1),Q(0),Q(3,2)],3),Q(50,27)*C6*C6),scale(mul(N,N),Q(-1)))
 c6_leaves=positive(gap,Q(0),Q(1))
 assert all(a>=0 for a in N)
 print('SIXTH_MOMENT_COEFFICIENT',C6,'PASS; Bernstein leaves',len(c6_leaves))
 # E Y^4=m, E Y²=1, E Y6<=n. The exact CS estimate is
 # (m-1)² <= 2(1-EY)*(sqrt(n)+sqrt(m))².
 # Set d=1-RHO. Verify (m-1)²>=2d*(sqrt(n)+sqrt(m))² by squaring,
 # but first separately verify the unsquared nonnegative left side.
 m=[Q(2),Q(0),Q(1)]
 n=[Q(6),Q(0),Q(9),C6]
 u=add(scale(power(add(m,[Q(-1)]),2),1/(2*(1-RHO))),scale(add(m,n),Q(-1)))
 first=positive(u,Q(0),Q(31,4))
 final=positive(add(mul(u,u),scale(mul(m,n),Q(-4))),Q(0),Q(31,4))
 assert Q(31,4)**2>60
 print('FIRST_ABSOLUTE_MOMENT',RHO,'PASS; Bernstein leaves',len(first),len(final))
 records={'sixth_coefficient':str(C6),'first_absolute_moment':str(RHO),
 'sixth_gap_polynomial':list(map(str,gap)), 'root_removal_positive_polynomial':list(map(str,u)),
 'root_removal_squared_gap':list(map(str,add(mul(u,u),scale(mul(m,n),Q(-4))))),
 'leaves':{key:[[str(a),str(b),str(c)] for a,b,c in ls] for key,ls in [('sixth',c6_leaves),('root_sign',first),('root_square',final)]}}
 Path(__file__).with_suffix('.json').write_text(json.dumps(records,indent=2)+'\n')
 print('ALL_EXACT_CUBIC_CONSTANT_CHECKS=PASS')
if __name__=='__main__':main()

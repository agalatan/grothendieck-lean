#!/usr/bin/env python3
"""Exact rational proof of E|q| < .977459 from complex cubic moments.
See quadrature_moment_lemma.md for the analytic moment majorant.
"""

if not __debug__:
    raise RuntimeError('Assertions are proof gates; do not use Python -O or -OO.')

from fractions import Fraction as Q
from pathlib import Path
import json
from certify_cubic_constants import C6,add,scale,mul,power,positive
RHO=Q('0.977459')

def main():
 m=[Q(2),Q(0),Q(1)]
 n=[Q(6),Q(0),Q(9),C6]
 n_minus_m2=add(n,scale(mul(m,m),Q(-1)))
 d=add(m,[Q(-1)])
 # α=(n−m)/(m−1), β=(n−m²)/(m−1).
 # Want (1+sqrtβ)^2 < RHO²(α+2sqrtβ).
 # Multiply by m−1 and isolate the remaining positive square root.
 U=add(scale(n,RHO*RHO-1),mul(m,m),scale(m,-RHO*RHO-1),[Q(1)])
 gap=add(mul(U,U),scale(mul(n_minus_m2,d),-4*(1-RHO*RHO)**2))
 leaves={name:positive(p,Q(0),Q(31,4)) for name,p in [('beta_positive',n_minus_m2),('root_sign',U),('root_square',gap)]}
 for name,ls in leaves.items():print(name,'PASS; Bernstein leaves',len(ls))
 out={'sixth_moment_coefficient':str(C6),'rho':str(RHO),
      'U_polynomial':list(map(str,U)),'gap_polynomial':list(map(str,gap)),
      'leaves':{k:[[str(a),str(b),str(c)] for a,b,c in v] for k,v in leaves.items()}}
 Path(__file__).with_suffix('.json').write_text(json.dumps(out,indent=2)+'\n')
 print('EXACT_QUADRATURE_MOMENT_BOUND: E|q| <',RHO,'= .977459; PASS')
if __name__=='__main__':main()

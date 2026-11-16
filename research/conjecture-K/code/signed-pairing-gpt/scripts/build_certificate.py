# scripts/build_certificate.py
"""N proposal step. verify_exact.mjs must certify every proposed coefficient."""
import json, math
from fractions import Fraction
from pathlib import Path
import numpy as np
from scipy.linalg import lstsq
from variational_probe import matrices, norm

ROOT=Path(__file__).resolve().parents[1]
D=14
BITS=80
SCALE=1<<BITS
cols,outs,M0,M1,target=matrices(D)
thresholds=[
    ('0.80',Fraction(11,100),Fraction(7,20)),
    ('0.82',Fraction(13,100),Fraction(3,5)),
    ('0.84',Fraction(1,5),Fraction(13,10)),
    ('0.845',Fraction(1,4),Fraction(9,5)),
    ('0.85',Fraction(1,3),Fraction(12,5)),
    ('0.855',Fraction(3,5),Fraction(18,5)),
]
edges=sorted(set([Fraction(i,200) for i in range(121)]+[r[1] for r in thresholds]))
rat=lambda x:[str(x.numerator),str(x.denominator)]
cells=[]
for lo,hi in zip(edges,edges[1:]):
    mid=float((lo+hi)/2)
    M=M0+mid*M1
    sol,_,_,_=lstsq(M,target,cond=1e-12,lapack_driver='gelsy')
    # The certificate uses unnormalised Wick monomials and dyadic coefficients.
    # Floating arithmetic only chooses the integers, never validates them.
    coeff=[str(round(Fraction(float(v/math.sqrt(norm(i))))*SCALE)) for v,(_,i) in zip(sol,cols)]
    cells.append(dict(lo=rat(lo),hi=rat(hi),coeff=coeff))
payload=dict(format='wick-null-certificate-v1',degree=D,bits=BITS,
    thresholds=[dict(row=row,rho_max=rat(cap),theta=rat(th)) for row,cap,th in thresholds],
    cells=cells)
path=ROOT/'results'/'certificate.json'
path.write_text(json.dumps(payload,separators=(',',':'))+'\n')
print(json.dumps(dict(status='N proposed coefficients; exact replay required',cells=len(cells),columns=len(cols),bytes=path.stat().st_size)))

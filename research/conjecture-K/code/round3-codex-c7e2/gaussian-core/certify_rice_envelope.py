# /workspace/scratch/f307e93b3610/codex-c7e2-round3/gaussian-core/certify_rice_envelope.py
"""Arb certificate for the global Rice envelope; all acceptance checks survive -O."""
from fractions import Fraction as F
from pathlib import Path
import json
from flint import arb,ctx
ctx.prec=120

def require(test,message):
    if not test:raise RuntimeError(message)
def A(q):
    q=F(q);return arb(q.numerator)/q.denominator

# f(x)=sqrt(pi*x/2)*exp(-x)*(3 I0(x)+I1(x))/2.
# Each factor except exp(-x) is nonnegative and increasing on [0,infinity).
# The upper bound below therefore encloses every point of each closed cell.
N=2000;target=F(51,50);minimum=arb(1);worst=-1;uppermax=arb(0)
for j in range(N):
    lo=F(j,1000);hi=F(j+1,1000);x=A(hi)
    upper=(arb.pi()*x/2).sqrt()*(-A(lo)).exp()*(3*x.bessel_i(0)+x.bessel_i(1))/2
    margin=A(target)-upper
    require(margin>0,'Rice envelope failed in cell '+str(j))
    if float(upper.mid())>float(uppermax.mid()):uppermax=upper;worst=j
# For x>=2, r=I1/I0 solves r'=1-r/x-r^2, and
# U=(4x-3)/(4x-1) obeys U'-(1-U/x-U^2)=3/[x(4x-1)^2]>0.
# Thus r(2)<U(2) implies r<U for all x>=2; this is exactly f'<0.
x=A(2);tailmargin=A(F(5,7))-x.bessel_i(1)/x.bessel_i(0)
require(tailmargin>0,'Riccati tail comparison failed')
# Zero-core scalar costs, independently recomputed by the exact erfc formula.
a=A(F(699,1250));b=A(F(179,1250));pball=A(F(2500,1891))
z=(a/b).sqrt()
J=[arb.pi()/(a*b).sqrt()*(a/b).exp()*z.erfc()]
for k in range(3):
    J.append((A(F(2*k+1,2)).gamma()-a*J[-1])/b)
qbase=pball-J[1]
nubase=pball-(J[3]-4*J[2]+4*J[1])/2
require(qbase>A(F(16,125)),'Zero-core Q/P cost failed')
require(nubase>A(F(33,100)),'Zero-core nu cost failed')
# Exact rational arithmetic for final theorem constants.
p=F(2500,1891);beta=F(15159,50000);d=F(4,25)+beta**2
Cupper=F(3,8)*F(1773,1000)*F(109,20)
require(A(F(1773,1000))>arb.pi().sqrt(),'sqrt(pi) rational upper bound failed')
require(A(F(49,20))>A(6).sqrt(),'sqrt(6) rational upper bound failed')
qmargin=p-target*(p-F(16,125))-Cupper*(F(37,5)+d)/400-F(1,100)
numargin=p-target*(p-F(33,100))-Cupper*(F(164,5)+d)/400-F(1,100)
require(qmargin>0 and numargin>0,'Final rational odd-cost margins failed')
result={'status':'PASS','precision_bits':ctx.prec,'cells':N,'covered_interval':['0','2'],'target':str(target),'zero_core_Q_P_cost':str(qbase),'zero_core_nu_cost':str(nubase),'maximum_cell_upper_bound':str(uppermax),'worst_cell_index':worst,'tail_Riccati_margin':str(tailmargin),'Q_P_margin_beyond_1_over_100':str(qmargin),'nu_margin_beyond_1_over_100':str(numargin)}
Path(__file__).with_name('rice_envelope_certificate.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))

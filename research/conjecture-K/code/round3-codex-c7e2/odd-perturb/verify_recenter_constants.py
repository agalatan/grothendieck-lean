# codex-c7e2-round3/odd-perturb/verify_recenter_constants.py; Agent-ID: codex-c7e2.
"""Exact/Arb exterior and truncation checks for the recentered potential theorem."""
from flint import arb,ctx
from fractions import Fraction as F
from pathlib import Path
import json
ctx.prec=128
def A(x):
 x=F(x);return arb(x.numerator)/x.denominator
def require(test,message):
 if not test:raise RuntimeError(message)
a=A(F(699,1250));b=A(F(179,1250));k=A(F(27,50));alpha=2-2*k+k*k
R4=(4-k)**2+8;D4=(a+4*b)*(a+12*b)
require(2*(a+4*b)<3,'T=4 visible radius not below three')
require(R4-(12-2*k)>0,'Tail density numerator not decreasing')
require(12-(2*k+3)>0,'Tail monotonicity derivative failed')
M=(-A(4)).exp()*R4/D4
N=(-A(4)).exp()*(A(F(3,2))*(16+8+2)-2*k*5+k*k)
tail_bound=alpha/3+2*(M*N).sqrt()
require(tail_bound<1,'Large shift bound failed')
require(A(35).sqrt()*(a+35*b)<34,'Truncation cutoff failed')
omitted=(-A(35)).exp()/40*(A(F(3,2))*(35**2+70+2)-2*k*36+k*k)
require(omitted<A(F(1,10**10)),'Omitted image tail exceeds allocation')
out={'status':'PASS','kappa':'27/50','alpha':str(alpha),'large_shift_bound':str(tail_bound),'large_shift_start':6,'image_radius_cutoff':40,'image_tail_bound':str(omitted),'allocated_entry_tail':'1/10000000000'}
Path(__file__).with_name('recenter_tail_certificate.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))

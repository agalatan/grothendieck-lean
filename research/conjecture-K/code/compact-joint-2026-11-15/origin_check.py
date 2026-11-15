# Agent-ID: codex-a7c4. #431. Exact local origin certificate; no quadrature.
from fractions import Fraction as Q
from math import factorial
from pathlib import Path
import runpy,json
if not __debug__:raise RuntimeError('Assertions required')
lib=runpy.run_path(str(Path(__file__).resolve().parents[1]/'audit-2026-11-15-codex-a7c4/odd_cost_check.py'))
I=lib['Interval'];a,b=Q(699,1250),Q(179,1250);J=lib['radial_integrals'](a,b)
rho,s,p,c=Q(5053,10000),Q(3,5),Q(2500,1891),Q(463,5000)
v=s*rho;rr=I(2).sqrt()
kAA=(J[2]-Q(4,5)*J[1]+Q(4,25)*J[0])/2
kBB=(v*v*J[0]-rr*v*J[1]+J[2]/2)/2
kAB=(v*(J[1]-Q(2,5)*J[0])-(J[2]-Q(2,5)*J[1])/rr)/2
qa=p-c-Q(67,100)-Q(2,25)*rho*rho
qb=p-c-Q(67,100)*rho*rho-Q(2,25)
qab=-Q(59,100)*rho
margin=Q(7,400)
aa=I(qa-margin)-kAA;bb=I(qb-margin)-kBB;ab=I(qab)-kAB
assert aa.lo>0 and bb.lo>0 and (aa*bb-ab*ab).lo>0
# |h|/sqrt(S) <= M(T), by the triangle inequality for its coefficient vector.
M=lambda t:Q(503,1000)+Q(613,500)*t
assert Q(503,1000)**2>Q(2,5)**2+(s*rho)**2
assert Q(613,500)**2>Q(3,2)
eps=Q(1,10000);tau=Q(1,65536);cut=Q(1,16)
# Segment shift |w+t h| <= .1 |L| outside T<tau.
assert eps*(1+M(cut))*256/a<Q(1,10)
assert eps*max((1+M(0))/a,Q(613,500)/b)*4<Q(1,10)
assert 3/(1-Q(1,10))**2<4
# First integral has its logarithmic divergence enclosed by log 2 < .7.
assert sum(Q(7,10)**j/Q(factorial(j)) for j in range(8))>2
small=M(cut)**2*(1+M(cut))/a**2*Q(42,5)
def expminus(t):return 1/sum(t**j/Q(factorial(j)) for j in range(25))
other=Q(0)
# Dyadic cells, 32 on each octave from 1/16 through 16.
for k in range(-4,4):
 l0=Q(2)**k
 for j in range(32):
  lo=l0*(1+Q(j,32));hi=l0*(1+Q(j+1,32))
  other+=(hi-lo)*expminus(lo)*M(hi)**2*(1+M(hi))/(lo*(a+b*lo)**2)
tail_coefficient=(Q(503,1000)/16+Q(613,500))**2*(Q(1503,1000)/16+Q(613,500))/b**2
tail=tail_coefficient*expminus(Q(16))
far=4*eps*(small+other+tail)
# On T<=tau, actual directional mass <=M(tau)^2*tau, density<=.81/pi.
near_upper=Q(91,100)*Q(1,256)
assert near_upper**2>4*Q(81,100)*M(tau)**2*tau
far_round=Q((far.numerator*10**9+far.denominator-1)//far.denominator,10**9)
assert far<=far_round and near_upper+far_round<margin
out=dict(status='PASS origin neighborhood, paper derivation required',epsilon=str(eps),source_split=str(tau),spectral_margin=str(margin),kAA=kAA.enclosure(18),kBB=kBB.enclosure(18),kAB=kAB.enclosure(18),near_upper=str(near_upper),far_upper=str(far_round),error_upper_decimal=float(near_upper+far),remaining_normalized_margin=float(margin-near_upper-far),complete_interior=False)
print(json.dumps(out,indent=2))

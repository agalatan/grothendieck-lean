# Agent-ID: codex-a7c4. Refs #421. Exact exterior of the open joint target.
# Analytic proof: sources/progress-2026-11-15-codex-a7c4/JOINT_TARGET.md section 6.
# No compact-interior certificate or numerical quadrature. Standard output only.
from fractions import Fraction as Q
from math import factorial,comb
import json
from pathlib import Path
if not __debug__: raise RuntimeError('acceptance requires assertions')
a,b=Q(699,1250),Q(179,1250)
rho,s,c,alpha,orth,E0=Q(5053,10000),Q(3,5),Q(463,5000),Q(31,100),Q(2,25),Q(463,10000)
p=Q(2500,1891); k=c/(4*E0); upper_sqrt_half=Q(177,250)
assert upper_sqrt_half**2>Q(1,2)
density_cap=Q(81,100)
D=[a*a,4*a*b,3*b*b]
W=[(1-s)**2+(s*rho)**2, -2*(1-s)+2*s*rho*upper_sqrt_half, 1+upper_sqrt_half**2]
# e^T >= its degree-four Taylor polynomial for T>=0.
P=[Q(0)]*7
for i,di in enumerate(D):
 for j in range(5):P[i+j]+=density_cap*di/Q(factorial(j))
for i,v in enumerate(W):P[i]-=v

def translated_scaled(poly,lo,width):
 n=len(poly)-1
 return [width**j*sum((poly[i]*comb(i,j)*lo**(i-j) for i in range(j,n+1)),Q(0))for j in range(n+1)]

def bernstein(poly,lo,hi):
 cc=translated_scaled(poly,lo,hi-lo);n=len(poly)-1
 return [sum((cc[j]*Q(comb(i,j),comb(n,j))for j in range(i+1)),Q(0))for i in range(n+1)]
mins=[]
for i in range(64):
 lo,hi=Q(i,16),Q(i+1,16);zz=bernstein(P,lo,hi)
 assert min(zz)>0,(lo,zz)
 mins.append(min(zz))
tail=translated_scaled(P,Q(4),Q(1));assert min(tail)>0
# Use the actual directional density, not the mass of its radial dominator.
# E|h|^2/S = 1+s^2|A+rho B|^2/S <= H2.
mass=1+s*s*(1+rho*rho)
U=Q(217,100) # strict > 2 sqrt(density_cap * mass)
assert U*U>4*density_cap*mass
assert k==Q(1,2)
assert s*s+alpha>=orth
m=p-c-(s*s+alpha)*(1+rho*rho)
H2=1+s*s*(1+rho*rho)
wcut,ampcut=Q(19,10),Q(37,25)
assert m>0
assert m+k*wcut*wcut>U
# e > 5/2 from its positive Taylor series; sqrt(2)>7/5.
assert sum(Q(1,factorial(j)) for j in range(4)) > Q(5,2)
assert Q(7,5)**2 < 2
assert Q(2,5)<s and Q(2,7)<s*rho
H_upper,tilt_upper=Q(241,200),Q(673,1000)
assert H_upper**2>H2 and tilt_upper**2>s*s*(1+rho*rho)
large_amp=Q(94,25)
assert 2*(H_upper+tilt_upper)<large_amp
assert m*ampcut+2*k*ampcut**3>large_amp
report=dict(agent_id='codex-a7c4',status='P+C author only; exterior proved, compact interior open',
 parameters={key:str(v) for key,v in dict(a=a,b=b,rho=rho,s=s,c=c,alpha=alpha,orth=orth,E0=E0,p=p,k=k).items()},
 W=list(map(str,W)),mass_upper=str(mass),density_cap=str(density_cap),density_min_bernstein=str(min(mins)),density_tail_min=str(min(tail)),
 uniform_remainder_ratio=str(U),large_amplitude_coefficient=str(large_amp),minimum_quadratic_ratio=str(m),w_cutoff=str(wcut),amplitude_cutoff=str(ampcut),interior_certified=False)
print(json.dumps(report,indent=2))

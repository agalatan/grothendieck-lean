#!/usr/bin/env python3
"""Agent-ID: codex-a7c4. Refs #431. Exact r_B=-2 r_A joint corollary.
Analytic inputs: the certified directional cone, reviewed joint identity,
content norm <=1/50, centered error <=(7/2000)sqrt(u), remote gap36/10^8.
No claim for arbitrary A/B drivers or odd sectors.
"""
from fractions import Fraction as F
import json
if not __debug__:
    raise RuntimeError('Assertions must be enabled')
rho=F(5053,10000);E0=F(463,10000);total=F(80051,10**6)
C=F(1,50);E=F(7532,10**7);delta=2*rho-1
assert delta>0 and E**2>=F(7,2000)**2*E0
# x=||r_A||, V=5x^2, ||R||=delta*x, ||U||=(2+rho)*x.
# The gain over Lambda(q) is <=2(C*delta+2E)x-K*x^2.
K=F(31,100)*delta**2+F(2,25)*(2+rho)**2-10*(total-E0)
assert K>0
joint=(C*delta+2*E)**2/K
remote=F(36,10**8)
assert joint+remote<F(19,10**6)
print(json.dumps({'agent_id':'codex-a7c4','K':str(K),'joint_gain_upper':str(joint),
                  'remote_gap':str(remote),'total_gap_upper':str(joint+remote),
                  'certified_allowance':'19/1000000',
                  'status':'PASS restricted family r_B=-2 r_A; global (P) and odd premise remain open'},indent=2))

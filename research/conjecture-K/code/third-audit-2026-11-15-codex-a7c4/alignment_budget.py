"""Exact conditional signed A/B budget after the global kernel comparison.

Agent-ID: codex-a7c4. Refs #400. Run python3 -I alignment_budget.py.
The finite-amplitude joint cost and the .24 content inequality remain inputs.
The scalar input phi'(0)<179/125 is certified by the preceding audits and
content_kernels_exact.py; the .007 alignment is kernel_alignment.py.
"""
import argparse
from fractions import Fraction as Q
import json
from pathlib import Path

if not __debug__:
    raise RuntimeError('Assertions must be enabled; do not use -O.')
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--write-result',action='store_true')
args=parser.parse_args()
ka,kb,m,rho=Q(6,25),Q(13,50),Q(59,500),Q(5053,10000)
u,j0=Q(463,10000),Q(179,125)
cmax,rootu=Q(126145,10**6),Q(215175,10**6)
assert cmax*cmax>ka*j0*u and rootu*rootu>u
schur=kb-m*m/ka
assert schur>0 and rho>m/ka
upper=((rho-m/ka)*cmax+Q(7,1000)*rootu)**2/schur
assert upper<Q(2061,40000000) # .000051525
result={'agent_id':'codex-a7c4','status':'PASS; exact rational arithmetic',
        'scope':'conditional on signed joint finite-amplitude cost and C_A^2<=.24D; peak only',
        'schur_complement':str(schur),'content_norm_upper':str(cmax),
        'sqrt_energy_upper':str(rootu),'excess_upper':str(upper),
        'simple_excess_upper':'2061/40000000',
        'old_favourable_budget':'0.00005471',
        'open_inputs':['signed joint finite-amplitude A/B estimate','general .24 content bound',
                       'odd sectors at nonzero even core','remaining response cover']}
output=json.dumps(result,indent=2,sort_keys=True)+'\n'
if args.write_result:
    Path(__file__).with_name('alignment_budget_result.json').write_text(output)
print(output,end='')

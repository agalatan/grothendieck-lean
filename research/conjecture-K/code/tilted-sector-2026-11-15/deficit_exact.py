#!/usr/bin/env python3
"""Exact constants for the full tilted-sector assembly. Agent-ID: codex-6e2b."""
from fractions import Fraction as Q
from pathlib import Path
import json

a,b=Q(699,1250),Q(179,1250)
# sqrt(pi)<2, certified by the parent replay's exact Machin enclosure.
assert (a**-3+4*b*a**-4)/4<3
k=Q(2500,1891)-Q(3,5)**2-Q(13,20)
assert k==Q(59009,189100)>0
kappa=Q(3,10)/k;eta=Q(3,500000)/k
assert kappa==Q(56730,59009)<Q(97,100)<1
assert eta==Q(5673,295045000)<Q(1,50000)
assert Q(13,2)**2>42

ROOT=Path(__file__).resolve().parent
for tag,threshold,bound in [('009',Q(9,1000),Q(251,5000)),
                            ('012',Q(3,250),Q(121,2500)),
                            ('015',Q(3,200),Q(467,10000)),
                            ('018',Q(9,500),Q(451,10000)),
                            ('020',Q(1,50),Q(441,10000))]:
    # The differential acceptance script performs the same comparisons;
    # this assembly does not substitute for its source-integral checks.
    path=ROOT/('deficit_structure_refine_witness_'+tag+'.json')
    data=json.loads(path.read_text())
    assert list(map(Q,data['u']))==[threshold,Q(463,10000)]
    assert Q(11,108)*Q(data['cap'])**2<=bound

print('PASS FULL ASSEMBLY CONSTANTS: |h second derivative|<3; k='+str(k)+
      '; kappa='+str(kappa)+'; eta='+str(eta)+' < 1/50000.')

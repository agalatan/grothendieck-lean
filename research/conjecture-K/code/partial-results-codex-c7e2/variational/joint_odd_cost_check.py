# Intended path: handoff/codex-c7e2/variational/joint_odd_cost_check.py
"""Recompute radial scalars for the joint odd-sector improvement. Agent-ID: codex-c7e2."""
from fractions import Fraction as F
from pathlib import Path
import importlib.util
import json
import sys

if not __debug__:
    raise RuntimeError('Run without -O: assertions are certificate checks.')
sys.dont_write_bytecode = True
# Optional first argument is the local grothendieck-lean repository root.
# Otherwise use the verbatim bundled source from baseline 6bb44599.
source = (Path(sys.argv[1]) / 'research/conjecture-K/code/audit-2026-11-15-codex-a7c4/odd_cost_check.py'
          if len(sys.argv)>1 else Path(__file__).with_name('inherited_odd_cost_check.py'))
spec = importlib.util.spec_from_file_location('odd_intervals', source)
old = importlib.util.module_from_spec(spec)
spec.loader.exec_module(old)
c = old.Interval(F(81,125))
assert 15488**2-4*6561*9250 == -2878856
profiles = {
    'peak': (F(1891,2500),F(1057,1250),F(179,1250)),
    'flank': (F(149,200),F(4267,5000),F(1467,10000)),
    'upper': (F(1891,2500),F(877,1000),F(19,125)),
    'box_beta_low': (F(19,25),F(19,25),F(3,25)),
    'box_beta_high': (F(19,25),F(19,25),F(4,25)),
}
rows = {}
for name,(eps,ell,b) in profiles.items():
    _,j1,j2,j3 = old.radial_integrals(ell-2*b,b)
    p=1/eps
    qcost=p-j1
    pcost=p-c*j1
    pure_p=p-F(3,5)*j1
    dcost=p-(j3-4*j2+4*j1)/2
    retained_d=dcost+(j2-2*j1)*(j2-2*j1)/(2*(1+j1))
    if name.startswith('box_'):
        assert pcost.lo>F(41,100)
        assert pure_p.lo>F(12,25)
    if name=='peak':
        assert pcost.lo>F(137,250)
        assert pure_p.lo>F(121,200)
    rows[name]={'Q_cost':qcost.enclosure(),'joint_P_cost':pcost.enclosure(),
                'pure_P_cost':pure_p.enclosure(),'raw_d_cost':dcost.enclosure(),
                'retained_d_cost':retained_d.enclosure()}
print(json.dumps({'agent_id':'codex-c7e2','status':'PASS',
    'scope':'Exact scalar enclosures only; analytic inequalities proved in JOINT_ODD.md.',
    'circle_coefficient':c.enclosure(),'rows':rows},indent=2))

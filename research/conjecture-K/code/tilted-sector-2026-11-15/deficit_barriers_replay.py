#!/usr/bin/env python3
"""Fresh common-source replay for all used content barriers. Agent-ID: codex-6e2b.

The independently audited acceptance functions share the same source m'',
fourth-derivative bound, and outer inequalities. Recompute those once, then
check every rational differential barrier and bind its exact energy range
to the coefficient used in the moment/Stein cover.
"""
from fractions import Fraction as Q
from pathlib import Path
import json,sys,time
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT))
import deficit_structure_content_verify as base
import deficit_structure_refine_verify as refined
import deficit_structure_medium25_verify as medium
import deficit_structure_absolute_low_verify as absolute_low

def main():
    start=time.time()
    m4=base.certify_m4();outer=base.outer()
    print(json.dumps({'fresh_common_M4':str(m4),'fresh_common_outer':outer}),flush=True)
    source=[base.integrate(base.ar(Q(j,500))) for j in range(501)]
    checks=[(refined,'009',Q(9,1000),Q(251,5000)),
            (refined,'012',Q(3,250),Q(121,2500)),
            (refined,'015',Q(3,200),Q(467,10000)),
            (refined,'018',Q(9,500),Q(451,10000)),
            (refined,'020',Q(1,50),Q(441,10000)),
            (medium,'medium25',Q(1,40),Q(1859,43200)),
            (base,'absolute',Q(1,25),None),
            (base,'absolute44',Q(11,250),None),
            (absolute_low,'absolute30',Q(3,100),None),
            (absolute_low,'absolute35',Q(7,200),None)]
    for module,tag,umin,coefficient in checks:
        row=module.check_witness(tag,source)
        assert list(map(Q,row['u']))==[umin,Q(463,10000)]
        assert row['passed']
        if coefficient is None:
            assert row['absolute_envelope'] and Q(row['tail_value'])==Q(9,25)
            assert Q(row['cap'])<=Q(13,20)
        else:
            assert Q(row['content_coefficient'])<=coefficient
            row['used_content_coefficient']=str(coefficient)
        print(json.dumps(row),flush=True)
    print('PASS ALL USED CONTENT BARRIERS: 10 witnesses; source, derivative, compact, and infinite-tail checks; seconds='+str(time.time()-start),flush=True)

if __name__=='__main__':main()

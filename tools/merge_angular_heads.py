#!/usr/bin/env python3
"""Replace the pool heads with angularly averaged cross-scramble estimates.

No kernel is changed. Cross-scramble bilinear products avoid the plug-in
projection-product bias. This is discovery data, with no deterministic errors.
"""
import argparse
import copy
from fractions import Fraction as Q
import json
from pathlib import Path


def projection(row):
    return [[complex(*x) for x in p] for p in row['projections']]


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('pool',type=Path);p.add_argument('heads',type=Path)
    p.add_argument('--out',type=Path,required=True);a=p.parse_args()
    data=json.loads(a.pool.read_text());heads=json.loads(a.heads.read_text())
    out=copy.deepcopy(data)
    changes=[]
    for j,description in enumerate(data['columns'][:-2]):
        h=[x for x in heads if x['m']==description['m'] and
           x['discovery_epsilon']==description['discovery_epsilon'] and x['power']==20]
        assert len(h)==2
        (fa,ga),(fb,gb)=map(projection,h)
        cc=[((f.conjugate()*g).real+(ff.conjugate()*gg).real)/2
            for f,g,ff,gg in zip(fa,gb,fb,ga)]
        col=out['rational_midpoint_screen']['midpoint_columns'][j]
        old=[float(Q(col[k])) for k in ['c0','c1']]
        col['c0']=str(Q(str(cc[0])));col['c1']=str(Q(str(sum(cc[1:]))))
        new=[cc[0],sum(cc[1:])]
        changes.append({'m':description['m'],'epsilon':description['discovery_epsilon'],
                        'old_heads':old,'cross_scramble_heads':new,
                        'scramble_difference':[abs(h[0][k]-h[1][k]) for k in ['c0','c1']]})
    out['angular_head_update']={'scope':__doc__,'power':20,'seeds':[51031,61043],
                                'changes':changes}
    # The inherited LP solution no longer describes these changed inputs.
    for key in ['full_score_upper_screen','cubic_price','kernel_prices','price_budget',
                'uniform_integral_error_amplification','sufficient_uniform_enclosure_to_exclude_pool']:
        out.pop(key,None)
    out['rational_midpoint_screen']={k:out['rational_midpoint_screen'][k]
                                   for k in ['tests','midpoint_columns']}
    a.out.write_text(json.dumps(out,indent=2)+'\n')
    print('Updated',len(changes),'head pairs; original-noise kernels unchanged')
    print('largest head shift',max(abs(x-y) for v in changes
          for x,y in zip(v['old_heads'],v['cross_scramble_heads'])))
    print('largest two-scramble head difference',max(x for v in changes for x in v['scramble_difference']))
    print('These differences are diagnostics, not deterministic error enclosures.')


if __name__=='__main__':main()

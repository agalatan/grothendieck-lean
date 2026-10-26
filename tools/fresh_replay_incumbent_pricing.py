#!/usr/bin/env python3
"""Reoptimize the incumbent pool with its newly priced grade-3/7 proposals.

Floating discovery, conditional inherited incumbent tax, unpaid new tails.
The saved primal/dual gap is a numerical consistency diagnostic only.
"""
import argparse
import hashlib
import json
from pathlib import Path
import sys
import numpy as np

sys.path.insert(0,str(Path(__file__).resolve().parent))
from fresh_incumbent_pool import solve_scaled


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--base',type=Path,default=Path(__file__).resolve().parents[1]/
                    'handoff/research-third-decimal/fresh-eyes-20261023')
    ap.add_argument('--out',type=Path,required=True)
    a=ap.parse_args()
    original=a.base/'upper/incumbent/incumbent-pool-heads.npz'
    with np.load(original) as archive:
        heads=archive['heads'].copy();charges=archive['charges'].copy()
        names=archive['names'].tolist()
    inputs=[a.base/f'pool/priced-incumbent-grade{g}.json' for g in [3,7]]
    proposals=[json.loads(p.read_text()) for p in inputs]
    fresh=np.array([p['head'] for p in proposals])
    anchor=float(heads[-1,0]-sum(abs(heads[-1,1:]))-charges[-1])
    baseline=solve_scaled(heads,charges,1e8,anchor)
    combined=np.r_[heads,fresh];costs=np.r_[charges,np.zeros(len(fresh))]
    results=[solve_scaled(combined,costs,s,anchor) for s in [1e6,1e8]]
    normalized=solve_scaled(combined,costs,1e6,anchor,row_normalize=True)
    names+=['priced-incumbent-grade3','priced-incumbent-grade7']
    report={'status':'FLOATING_INHERITED_TAX_INCUMBENT_PRICING_NEW_TAILS_UNPAID',
            'scope':__doc__,'baseline':baseline,'expanded':results[-1],
            'scale_1e6':results[0],'row_normalized':normalized,
            'cross_scale_score_drift':abs(results[0]['score']-results[1]['score']),
            'row_normalized_score_drift':abs(normalized['score']-results[-1]['score']),
            'optimistic_gain':results[-1]['score']-baseline['score'],
            'new_weights':results[-1]['weights'][-len(fresh):],
            'new_column_tail_charges':[None]*len(fresh),
            'active_named':[dict(row,name=names[row['index']]) for row in results[-1]['active']],
            'source_hashes':{str(p.relative_to(a.base)):hashlib.sha256(p.read_bytes()).hexdigest()
                             for p in [original]+inputs},'global_endpoint_changed':False}
    a.out.parent.mkdir(parents=True,exist_ok=True)
    a.out.write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:report[k] for k in ['status','optimistic_gain','new_weights',
        'cross_scale_score_drift','row_normalized_score_drift','active_named']},indent=2))
    print('Expanded optimistic score:',results[-1]['score'],
          'floating primal/dual gap:',results[-1]['primal_dual_gap'])


if __name__=='__main__':main()

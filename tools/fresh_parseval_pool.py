#!/usr/bin/env python3
"""Estimate individual Parseval tails for all 26 new actual response pairs.

DISCOVERY ONLY: the Cauchy--Schwarz tail inequality is exact, but these self-
energy heads are floating Cauchy/FFT calculations, not interval enclosures.
No response optimization is performed. Per-column tails may discard useful
signed cancellation across a mixture.
"""
import argparse
from dataclasses import replace
import hashlib
import json
from pathlib import Path
import numpy as np
from fresh_upper_quadratic_kernel import Candidate,cauchy_coefficients
from fresh_incumbent_pool import solve_scaled


def self_tail(candidate,left):
    u=candidate.u if left else candidate.v
    H=candidate.H if left else candidate.K
    x=replace(candidate,name=candidate.name+('-Fself' if left else '-Gself'),
              u=u,v=u,H=H,K=H,scales=(1.,1.))
    lo,branchlo=cauchy_coefficients(x,257,.96,8192)
    hi,branchhi=cauchy_coefficients(x,257,.98,16384)
    energies=hi[1::2].real
    drift=float(np.max(abs(lo-hi)))
    energy_drift=float(np.sum(abs(lo[1::2]-hi[1::2])))
    remainder=float(1-np.sum(energies))
    if drift>3e-9 or remainder<=100*energy_drift:
        raise ArithmeticError('Self-head tail is not numerically resolved')
    if np.min(energies)<-max(1e-10,10*drift):
        raise ArithmeticError('Substantially negative self-energy coefficient')
    return {'grades':list(x.grades),'head_energy_sum':float(np.sum(energies)),
            'estimated_Parseval_remainder':remainder,'cross_radius_max_coefficient_drift':drift,
            'cross_radius_energy_sum_drift_bound':energy_drift,
            'maximum_odd_imaginary_coefficient':float(np.max(abs(hi[1::2].imag))),
            'minimum_self_energy_coefficient':float(np.min(energies)),
            'head_energy_coefficients':energies.tolist(),
            'branch_checks':[branchlo,branchhi]}


def run(base,out):
    paths=[base/'upper/quadratic/diagnostics.json',base/'upper/quadratic/asymmetric-direction.json',
           base/'pool/priced-asymmetric.json',base/'barriers/higher-grade-pricing.json',
           base/'pool/priced-incumbent-grade3.json',base/'pool/priced-incumbent-grade7.json',
           base/'upper/incumbent/incumbent-pool-heads.npz',
           base/'upper/incumbent/incumbent-pool-result.json',base/'pool/incumbent-priced-pool.json']
    items=[]
    first=json.loads(paths[0].read_text());second=json.loads(paths[1].read_text())
    items.extend((f'asymmetric-{i}',row['candidate']) for i,row in enumerate(first['diagnostics']+second['rows']))
    priced=json.loads(paths[2].read_text());items.append(('priced-asymmetric',priced['candidate']))
    higher=json.loads(paths[3].read_text())
    items.extend((f'higher-grade-{i}',row['candidate']) for i,row in enumerate(higher['proposals']))
    new3=json.loads(paths[4].read_text());new7=json.loads(paths[5].read_text())
    items.extend([('priced-incumbent-grade3',new3['candidate']),('priced-incumbent-grade7',new7['candidate'])])
    if len(items)!=26:raise ValueError('Expected exactly26 new actual pairs')
    diagnostics=[]
    for label,data in items:
        x=Candidate.from_json(data)
        F=self_tail(x,True);G=self_tail(x,False)
        charge=float(np.sqrt(F['estimated_Parseval_remainder']*G['estimated_Parseval_remainder']))
        diagnostics.append({'label':label,'candidate':data,'Fself':F,'Gself':G,
                            'individual_tail_charge_estimate':charge})
        print(label,'tail_estimate',charge,flush=True)
    with np.load(paths[6]) as a:
        heads=a['heads'].copy();charges=a['charges'].copy();names=a['names'].tolist()
    if heads.shape!=(582,129):raise ValueError('Unexpected incumbent augmented pool shape')
    heads=np.r_[heads,np.asarray(new3['head'])[None,:],np.asarray(new7['head'])[None,:]]
    charges=np.r_[charges,0.,0.];names+=['priced-incumbent-grade3','priced-incumbent-grade7']
    estimated={x['label']:x['individual_tail_charge_estimate'] for x in diagnostics}
    for i,name in enumerate(names):
        if name in estimated:charges[i]=estimated[name]
    if sum(name in estimated for name in names)!=26:raise ValueError('Failed to charge every new pair')
    oldreport=json.loads(paths[7].read_text());incold=oldreport['incumbent_plus_old']
    anchor=oldreport['incumbent_only']['score']
    result=solve_scaled(heads,charges,1e8,anchor)
    alternate=solve_scaled(heads,charges,1e6,anchor,row_normalize=True)
    optimistic=json.loads(paths[8].read_text())
    newindices=[i for i,name in enumerate(names) if name in estimated]
    old_optimistic_weights=optimistic['expanded']['weights']
    optimistic_new_tax=sum(old_optimistic_weights[i]*charges[i] for i in newindices)
    report={'status':'DISCOVERY_ONLY_INDIVIDUAL_PARSEVAL_TAIL_ESTIMATES',
            'scope':__doc__,'head_through_degree':257,'actual_response_pairs':26,
            'columns':584,'diagnostics':diagnostics,
            'analytic_tail_inequality':'For weighted-chaos complement degree>257, sum|c_k| <= sqrt((1-sum Fself_head_energies)*(1-sum Gself_head_energies)). Each F,G has unit modulus a.e. and positive self-channel scales(1,1).',
            'incumbent_plus_old':incold,'optimistic_unpaid_pool':optimistic['expanded'],
            'optimistic_mixture_new_tax_estimate':float(optimistic_new_tax),
            'fixed_optimistic_mixture_score_after_estimated_tax':float(optimistic['expanded']['score']-optimistic_new_tax),
            'parseval_charged':result,'row_normalized_replay':alternate,
            'cross_scale_score_drift':abs(result['score']-alternate['score']),
            'score_minus_incumbent_plus_old':result['score']-incold['score'],
            'total_new_weight':float(sum(result['weights'][i] for i in newindices)),
            'incumbent_weight':float(result['weights'][names.index('incumbent')]),
            'active_new_named':[{'name':names[i],'index':i,'weight':float(result['weights'][i]),
                                 'individual_tail_charge_estimate':float(charges[i])}
                                for i in newindices if result['weights'][i]>1e-15],
            'names':names,
            'active_named':[dict(x,name=names[x['index']]) for x in result['active']],
            'source_hashes':{str(p.relative_to(base)):hashlib.sha256(p.read_bytes()).hexdigest() for p in paths},
            'global_endpoint_changed':False,
            'warning':'The inequality is analytic, but self-head energies and old pool data are not interval-certified. Individual charges can overpay signed whole-mixture cancellation.'}
    out.parent.mkdir(parents=True,exist_ok=True)
    out.write_text(json.dumps(report,indent=2)+'\n')
    np.savez(out.with_suffix('.npz'),heads=heads,charges=charges,names=np.asarray(names),
             dual=np.asarray(result['lambda']))
    print(json.dumps({'status':report['status'],'incumbent_plus_old_score':incold['score'],
                      'parseval_charged_score':result['score'],
                      'score_minus_incumbent_plus_old':report['score_minus_incumbent_plus_old'],
                      'total_new_weight':report['total_new_weight'],
                      'tail_estimate_min':min(estimated.values()),'tail_estimate_max':max(estimated.values()),
                      'cross_scale_score_drift':report['cross_scale_score_drift'],
                      'LP_primal_dual_gap':result['primal_dual_gap']},indent=2))


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
    p.add_argument('--base',type=Path);p.add_argument('--out',type=Path);a=p.parse_args()
    base=a.base or a.repo/'handoff/research-third-decimal/fresh-eyes-20261023'
    run(base,a.out or base/'pool/parseval-pool.json')

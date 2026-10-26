#!/usr/bin/env python3
"""Exact saved-localized-bank repricing for original box 4302.

No Gaussian integration is repeated. This is conditional on the frozen
shifted source majorants and the rank-one response reduction; NodeCaps alone
does not supply those hypotheses. The output is a source-cap fixture, not a
law-node, whole-box, or global Grothendieck certificate.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from rankone_reprice_mixture import reprice
from rankone_analytic_localized import propose_scalar
from rankone_analytic_transport import qeval,ceil_grid,old_cap

def encode(x):
    if isinstance(x,Q):return str(x)
    if isinstance(x,(list,tuple)):return [encode(v) for v in x]
    if isinstance(x,dict):return {str(k):encode(v) for k,v in x.items()}
    return x

def main():
    if not __debug__:raise SystemExit('Reject -O/-OO: exact assertions required')
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
    p.add_argument('--r',type=Q,default=Q(1,2))
    p.add_argument('--out',type=Path,required=True)
    p.add_argument('--check',action='store_true')
    a=p.parse_args();repo=a.repo.resolve();root=repo/'handoff/research-third-decimal/rank-one-certification-20261023'
    bankpath=root/'analytic/anchor-bank-m14.json';localized=root/'analytic/localized-m14-r050.json'
    inherited=repo/'handoff/lower-stein/cert-jointmoment-lifted-codex/inherited.json'
    weights={14:1-Q(94403211,500000000),16:Q(94403211,500000000)}
    bank=reprice(repo,bankpath,weights,14);raw=json.loads(localized.read_text())
    assert raw['source_row_sha256']==bank['source_row_sha256'] and raw['d']==bank['d']
    assert Q(raw['c'])==Q(bank['mixture_repricing']['old_c'])
    delta=Q(bank['mixture_repricing']['delta_c'])
    pieces=[dict(q=list(map(Q,p['q'])),b0=Q(p['b0']),b1=Q(p['b1'])-delta,alpha=Q(p['alpha'])) for p in raw['pieces']]
    assert raw['piece_coverage_rechecked'] and raw['original_recipe_cap_rechecked']
    assert len(pieces)==9
    f=propose_scalar(pieces,a.r)
    values=[qeval(p['q'],a.r)-2*(p['b0']+p['b1']*a.r)*f+p['alpha']*f*f for p in pieces]
    sourcepath=repo/bank['source_row'];source=json.loads(sourcepath.read_text())
    old=old_cap(source,a.r);new=ceil_grid(max(values))
    h=json.loads(inherited.read_text());row=h['rows'][14]
    taus=[Q(row['cells'][ci]['nodes'][ni]['tau'])/Q(row['delta']) for ci,ni in [(1,2),(0,3)]]
    A=Q(bank['semiconvex_coefficient']);bridge=A*(taus[1]-taus[0])**2/4
    result=encode(dict(status='PASS_EXACT_FROZEN_LOCALIZED_REPRICE',scope=__doc__,box=4302,active_row=14,
        weights=weights,physical_r=a.r,scalar_f=f,old_effective_cap=old,new_shifted_cap=new,
        source_gain=old-new,source_gain_decimal=float(old-new),piece_values=values,
        repricing=bank['mixture_repricing'],semiconvex_coefficient=A,
        inherited_law_nodes=[[14,1,2],[14,0,3]],inherited_law_tau=taus,
        maximal_old_node_scale_bridge_allowance=bridge,
        weighted_maximal_old_node_scale_bridge_allowance=weights[14]*bridge,
        weighted_bridge_allowance_decimal=float(weights[14]*bridge),
        inputs={str(x.relative_to(repo)):hashlib.sha256(x.read_bytes()).hexdigest() for x in [bankpath,localized,inherited,sourcepath]},
        remaining_hypotheses=['Frozen Gaussian majorants, localized source coverage and pre-square rank-one response extraction are existing external analytic premises.',
            'NodeCaps alone does not imply shifted F(r,f) source caps.',
            'A source gain is not a law gain or a global cap. New nearby scale law nodes avoid the large inherited scale bridge.']))
    if a.check:assert json.loads(a.out.read_text())==result
    else:a.out.parent.mkdir(parents=True,exist_ok=True);a.out.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:result[k] for k in ['status','source_gain_decimal','weighted_bridge_allowance_decimal']},indent=2))

if __name__=='__main__':main()

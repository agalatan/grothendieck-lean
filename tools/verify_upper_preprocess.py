#!/usr/bin/env python3
"""Directed assembly of a new preprocessing certificate, with the same rounder.

The Gaussian component-error enclosures and energy error are inherited. The
selected-block comparison is reassembled, the head is recomputed with Arb,
and the matching directed Hardy result is required.
Canonical inputs contain all data needed to regenerate the Lean data module.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from incumbent_exchange import replay_head


def main():
    if not __debug__:raise RuntimeError('Run without -O: assertions are certificate checks')
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('baseline',type=Path)
    p.add_argument('proposal',type=Path);p.add_argument('hardy',type=Path)
    p.add_argument('--out',type=Path,required=True)
    p.add_argument('--check',action='store_true',help='Check an existing canonical certificate without changing it.')
    a=p.parse_args()
    data=json.loads(a.baseline.read_text());proposal=json.loads(a.proposal.read_text())
    if data.get('comparison_scope')=='selected_head':
        from gen_localized_comparison import main as verify_localized
        localized=verify_localized(check=True)
        assert Q(data['compare'])==Q(localized['comparison_cap'])
        recipe_path=Path(__file__).resolve().parents[1]/'data/localized-comparison/recipe.json'
        assert data['localized_recipe_sha256']==hashlib.sha256(recipe_path.read_bytes()).hexdigest()
    hard=json.loads(a.hardy.read_text())
    contour=a.hardy.parent/'inputs/contour_input.json'
    proof=a.hardy.parent/'inputs/GAUSSIAN_SCHUR_TAIL_PROOF.md'
    assert hard['input_sha256']==hashlib.sha256(contour.read_bytes()).hexdigest()
    assert hard['proof_sha256']==hashlib.sha256(proof.read_bytes()).hexdigest()
    smoothing=json.loads(contour.read_text())
    assert all(Q(smoothing[k])==Q(data[name]) for k,name in [('a','aQ'),('b','bQ'),('eta','etaQ')])
    assert hard['status']=='DIRECTED_GAUSSIAN_SCHUR_HARDY_TAIL_PASS'
    assert hard['newpq_sha256']==hashlib.sha256(a.proposal.read_bytes()).hexdigest()
    assert hard['script_sha256']==hashlib.sha256(Path(__file__).with_name('verify_upper_hardy.py').read_bytes()).hexdigest()
    assert Q(hard['mean_square_upper_rational'])<Q(hard['square_cap'])==Q(7,4)
    assert Q(hard['radius'])==Q(4149,4000) and hard['N']==501
    assert Q(hard['tail_cap'])==Q(data['hardy_tail'])
    assert Q(7,4)*Q(4149,4000)**(-1002)/(Q(4149,4000)**4-1)<Q(data['hardy_tail'])**2
    if a.check:
        assert data['pList']==proposal['P'] and data['qList']==proposal['Q']
        assert data['proposal_sha256']==hard['newpq_sha256']
        assert data['fresh_hardy_sha256']==hashlib.sha256(a.hardy.read_bytes()).hexdigest()
        assert sum(abs(Q(x)) for x in data['pList'])<=1
        assert sum(abs(Q(x)) for x in data['qList'])<=1 and Q(data['qList'][0])==0
        delta=sum(Q(data[k]) for k in ['compare','energyErrQ','hardy_tail','headCapQ'])
        assert Q(data['delta'])==delta
        assert Q(data['incumbent_score'])==Q(data['slopeQ'])-delta
        assert Q(data['exact_bound'])==1/Q(data['incumbent_score'])<Q(data['headline_upper'])
        replay_head(a.baseline,a.out)
        checked=json.loads(a.out.read_text())
        assert Q(checked['replayed_score_lower'])>=Q(data['incumbent_score'])
        print('PASS current upper certificate',data['headline_decimal'],flush=True)
        return
    data['pList']=proposal['P'];data['qList']=proposal['Q']
    assert sum(abs(Q(x)) for x in data['pList'])<=1
    assert sum(abs(Q(x)) for x in data['qList'])<=1 and Q(data['qList'][0])==0
    # A rational slope to 13 decimals; directed residual includes its rounding.
    slope=Q(str(proposal['head'][0]));slope=Q(slope.numerator*10**13//slope.denominator,10**13)
    data['slopeQ']=str(slope);data['headCapQ']='1'
    a.out.parent.mkdir(parents=True,exist_ok=True)
    raw=a.out.with_suffix('.working.json');raw.write_text(json.dumps(data,indent=2)+'\n')
    headpath=a.out.with_suffix('.head.json');replay_head(raw,headpath)
    replay=json.loads(headpath.read_text());res=Q(replay['head_residual_upper'])
    # One additional decimal unit leaves room for the independent fixed-point
    # interval checker in Lean, whose rounding differs from Arb's.
    cap=Q(-((-res.numerator*10**12)//res.denominator)+1,10**12)
    data['headCapQ']=str(cap)
    delta=cap+sum(Q(data[k]) for k in ['compare','energyErrQ','hardy_tail'])
    score=slope-delta;bound=1/score
    headline=Q(bound.numerator*10**12//bound.denominator+1,10**12)
    assert bound<headline and score>Q(json.loads(a.baseline.read_text())['incumbent_score'])
    data['incumbent_score']=str(score)
    data['delta']=str(delta);data['exact_bound']=str(bound);data['headline_upper']=str(headline)
    data['headline_decimal']=f'{float(headline):.12f}'
    data['hardy_square_cap']=hard['square_cap'];data['hardy_radius']=hard['radius']
    data['fresh_hardy_sha256']=hashlib.sha256(a.hardy.read_bytes()).hexdigest()
    data['proposal_sha256']=hashlib.sha256(a.proposal.read_bytes()).hexdigest()
    for key in ['source','source_sha256','bridge_sha256']:
        if key in data:data['baseline_'+key]=data.pop(key)
    data['scope']='Directed finite-head and fresh Hardy certificate, with inherited Gaussian comparison/energy inputs.'
    a.out.write_text(json.dumps(data,indent=2)+'\n')
    replay_head(a.out,headpath)
    raw.unlink()
    print('PASS score',score,'upper',data['headline_decimal'],'head cap',cap,flush=True)


if __name__=='__main__':main()

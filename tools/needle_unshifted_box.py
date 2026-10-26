#!/usr/bin/env python3
"""Exact original box 4302 assembly with two new unshifted law-scale nodes.

Uses the unchanged virtual row, gate completion, second source row and PAD.
Only row14's law polynomials at the actual scale endpoints change. Their
ordinary convex scale chord has no rank-one or semiconvex allowance.
This proves one fixed box, not a whole-cover endpoint improvement.
"""
import argparse
from fractions import Fraction as Q
import json
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from needle_cover_refine import Campaign,mix,value,encode
from needle_rankone_nodes import verify_unshifted,L

def main():
    if not __debug__:raise SystemExit('Reject -O/-OO: exact checks required')
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--base',type=Path,default=Path('handoff/lower-stein/cert-jointmoment-lifted-codex'))
    p.add_argument('--nodes',type=Path,nargs=2,default=[Path('handoff/research-third-decimal/needle-20261023/unshifted4302-lo.json'),Path('handoff/research-third-decimal/needle-20261023/unshifted4302-hi.json')])
    p.add_argument('--out',type=Path,required=True);p.add_argument('--check',action='store_true');a=p.parse_args()
    certs=[];proofs=[]
    for path in a.nodes:proofs.append(verify_unshifted(path));certs.append(json.loads(path.read_text()))
    c=Campaign(a.base);b=c.cover['boxes'][4302];old=c.exact_old(4302);bb=list(map(Q,b['bounds']));choice=b['choice']
    assert choice['groups']==[5,7];theta=Q(choice['theta']);assert theta==Q(94403211,500000000)
    assert [Q(d['tau'])for d in certs]==bb[2:4]
    assert all(d['row_index']==14 for d in certs)
    p16,q16=c.component(choice['refs'][1],7,bb)
    p14,q14=[tuple(map(Q,d['P']))for d in certs]
    op14,oq14=c.component(choice['refs'][0],5,bb)
    assert [list(op14),list(oq14)]==[list(map(Q,d['baseline_chord_P']))for d in certs]
    v=mix(theta,c.gv[5],c.gv[7]);lo=mix(theta,p14,p16);hi=mix(theta,q14,q16)
    new=value(bb,v,lo,hi)
    floors=[]
    for d in certs:
        Pold=list(map(Q,d['baseline_chord_P']));Pnew=list(map(Q,d['P']));a0,a1,a2,a4,a6=[x-y for x,y in zip(Pold,Pnew)]
        poly=[a0+a1*L.RHO+a2+2*a4+6*a6,Q(0),a4+9*a6,L.C6*a6]
        floors.append(L.lower_bound(L.trim(poly),bb[4],bb[5]))
    floor=(1-theta)*min(floors)
    assert floor>0 and new<=old-floor
    result=encode(dict(status='PASS_EXACT_BOX4302_WITH_ORIGINAL_SOURCE_ONLY',scope=__doc__,box=4302,
        bounds=bb,weights={14:1-theta,16:theta},old_upper=old,new_upper=new,
        saving=old-new,old_upper_decimal=float(old),new_upper_decimal=float(new),saving_decimal=float(old-new),
        uniform_box_saving_floor=floor,uniform_box_saving_floor_decimal=float(floor),scale_interpolation_allowance=Q(0),
        source_assumption='The same original NodeCaps; no shifted source-cap or rank-one response reduction is used.',
        node_inputs=[dict(path=str(path),sha256=L.sha(path),proof=proof) for path,proof in zip(a.nodes,proofs)],
        inherited_sha256=L.sha(a.base/'inherited.json'),cover_sha256=L.sha(a.base/'cover.json'),
        remaining_obligations=['Check the emitted pure-row Stein JBatch with existing checkBatch and connect it through the generic finite cover interface.',
            'Other boxes control the global cap. The current 9057-box endpoint cover is unchanged.']))
    if a.check:assert json.loads(a.out.read_text())==result
    else:L.write_json(a.out,result)
    print(json.dumps({k:result[k]for k in ['status','old_upper_decimal','new_upper_decimal','saving_decimal','uniform_box_saving_floor_decimal']},indent=2))

if __name__=='__main__':main()

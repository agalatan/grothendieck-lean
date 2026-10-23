#!/usr/bin/env python3
"""Reuse a neighbouring t-slice's valid law recipes on a broad cap box.

All choices retain their actual potential and x-range. The old t-domain is
irrelevant to validity of the recipe; the t quadratic is reevaluated exactly.
No Gaussian integration or law-cut regeneration. A rational rectangle partition
check verifies coverage of the target's full tau/x domain.
"""
import argparse
from copy import deepcopy
from fractions import Fraction as Q
import json
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from needle_cover_refine import Campaign,encode,mix,value


def partition(rectangles,domain):
    """Return a guillotine tree, accepting only exact closed rectangle covers."""
    if len(rectangles)==1:
        assert tuple(rectangles[0])==tuple(domain)
        return '.'
    for axis in range(2):
        for cut in sorted(set(r[2*axis+1] for r in rectangles)):
            if not domain[2*axis]<cut<domain[2*axis+1]:continue
            if any(r[2*axis]<cut<r[2*axis+1] for r in rectangles):continue
            left=[r for r in rectangles if r[2*axis+1]<=cut]
            right=[r for r in rectangles if cut<=r[2*axis]]
            if not left or not right:continue
            dl=list(domain);dr=list(domain);dl[2*axis+1]=cut;dr[2*axis]=cut
            return [axis+1,str(cut),partition(left,dl),partition(right,dr)]
    raise ArithmeticError('Rectangles do not form a certified guillotine partition')


def main():
    if not __debug__:raise SystemExit('Reject optimized Python: exact checks required')
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--box',type=int,default=194)
    parser.add_argument('--slice',default='8440000001/10000000000')
    parser.add_argument('--t-parts',type=int,default=2)
    parser.add_argument('--pool',action='store_true')
    parser.add_argument('--out',type=Path,required=True)
    args=parser.parse_args()
    assert args.t_parts>=1
    repo=Path(__file__).resolve().parents[1]
    campaign=Campaign(repo/'handoff/lower-stein/cert-jointmoment-lifted-codex')
    target=campaign.cover['boxes'][args.box]
    bounds=list(map(Q,target['bounds']));slice_t=Q(args.slice)
    assert all(Q(b['bounds'][axis])!=slice_t
               for b in campaign.cover['boxes'] for axis in [0,1]), \
        'Choose a slice away from every stored t boundary'
    selected=[(i,deepcopy(b)) for i,b in enumerate(campaign.cover['boxes'])
              if Q(b['bounds'][0])<slice_t<Q(b['bounds'][1])]
    assert selected, 'Choose a slice strictly inside stored t intervals'
    tree=partition([list(map(Q,b['bounds'][2:])) for _,b in selected],bounds[2:])
    children=[]
    for k in range(args.t_parts):
        tl=bounds[0]+(bounds[1]-bounds[0])*k/args.t_parts
        tu=bounds[0]+(bounds[1]-bounds[0])*(k+1)/args.t_parts
        for source,b in selected:
            assert 'choice' in b, 'Slice includes scalar cap; choose a law slice'
            original=campaign.exact_old(source)
            bb=[tl,tu,*map(Q,b['bounds'][2:])]
            ch=b['choice'];domain=tuple(map(Q,ch.get('scale_domain',bb[2:4])))
            cs=[campaign.component(rr,g,bb,domain) for rr,g in zip(ch['refs'],ch['groups'])]
            if len(cs)==1:v=campaign.gv[ch['groups'][0]];p,q=cs[0]
            else:
                th=Q(ch['theta']);v=mix(th,*[campaign.gv[g] for g in ch['groups']])
                p=mix(th,cs[0][0],cs[1][0]);q=mix(th,cs[0][1],cs[1][1])
            retargeted=value(bb,v,p,q)
            b['bounds']=list(map(str,bb));b['upper']=str(retargeted)
            b['choice']['scale_domain']=list(map(str,domain))
            index=len(campaign.cover['boxes']);campaign.cover['boxes'].append(b)
            refined=campaign.refine(index,(1,1,1),args.pool)
            for child in refined['children']:
                child['source_box']=source
                child['source_old_upper']=str(original)
                children.append(child)
    cap=max(Q(b['upper']) for b in children)
    report=dict(status='PASS_EXACT_RETARGETED_PARTITION',scope=__doc__,
                target_box=args.box,target_bounds=bounds,slice_t=slice_t,
                t_parts=args.t_parts,source_slice_boxes=len(selected),
                tau_x_partition=tree,children=children,new_upper=cap,
                new_upper_decimal=float(cap),old_upper=target['upper'],
                improves_old_cap=cap<Q(target['upper']),
                saving_decimal=float(Q(target['upper'])-cap))
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(encode(report),indent=2)+'\n')
    print('PASS',len(children),'children; cap',float(cap),
          'saving',report['saving_decimal'],flush=True)


if __name__=='__main__':main()

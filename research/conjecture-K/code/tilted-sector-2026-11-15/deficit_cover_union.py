#!/usr/bin/env python3
"""Exact coverage of the deficit certificate domain. Agent-ID: codex-6e2b.

This checks geometric coverage only. Each input's mathematical inequalities
must have been rechecked by its own certificate in the calling replay chain.
Moment boxes use x=sqrt(chi); Stein boxes use chi. Both are converted exactly.
"""
from fractions import Fraction as Q
from pathlib import Path
import argparse,json

ROOT=Path(__file__).resolve().parent
UMAX=Q(463,10000);CHIMAX=Q(42)

def moment(path):
    data=json.loads(Path(path).read_text())
    out=[]
    for row in data['accepted']:
        a,b,c,d=map(Q,row['box'])
        assert 0<=c<d
        out.append((a,b,c*c,d*d))
    return out

def stein(path):
    data=json.loads(Path(path).read_text())
    out=[]
    for row in data['boxes']:
        a,b=map(Q,row['u']);c,d=map(Q,row['chi'])
        out.append((a,b,c,d))
    return out

def coverage(rects):
    clipped=[]
    for a,b,c,d in rects:
        assert 0<=a<b and 0<=c<d
        a,b=max(a,Q(0)),min(b,UMAX);c,d=max(c,Q(0)),min(d,CHIMAX)
        if a<b and c<d:clipped.append((a,b,c,d))
    cuts=sorted({Q(0),UMAX}|{x for r in clipped for x in r[:2]})
    gaps=[]
    for a,b in zip(cuts,cuts[1:]):
        intervals=sorted((c,d) for l,h,c,d in clipped if l<=a and b<=h)
        end=Q(0)
        for c,d in intervals:
            if c>end:gaps.append((a,b,end,c))
            end=max(end,d)
        if end<CHIMAX:gaps.append((a,b,end,CHIMAX))
    return clipped,cuts,gaps

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--moment',nargs='*',default=[])
    parser.add_argument('--stein',nargs='*',default=[])
    args=parser.parse_args();assert args.moment or args.stein
    rows=[]
    for name in args.moment:rows+=moment(ROOT/name)
    for name in args.stein:rows+=stein(ROOT/name)
    clipped,cuts,gaps=coverage(rows)
    report={'Agent-ID':'codex-6e2b','domain_u':['0',str(UMAX)],'domain_chi':['0',str(CHIMAX)],
            'rectangles':len(clipped),'energy_strips':len(cuts)-1,
            'uncovered':[list(map(str,row)) for row in gaps],
            'moment_inputs':args.moment,'stein_inputs':args.stein,
            'complete':not gaps}
    (ROOT/'deficit_cover_union_results.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({k:v for k,v in report.items() if k!='uncovered'}),flush=True)
    assert not gaps,('domain coverage incomplete',len(gaps),gaps[:3])
    print('PASS EXACT UNION: every 0<=u<=.0463 and 0<=chi<=42 is covered.',flush=True)

if __name__=='__main__':main()

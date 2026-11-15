#!/usr/bin/env python3
"""codex-6e2b: fresh exact moment/content cover of the full energy prefix [.009,.016].

Every parameter box must be accepted; an uncovered box makes this checker fail.
All profile and benchmark integration is fresh.
"""
from fractions import Fraction as Q
from functools import lru_cache
from pathlib import Path
import argparse,hashlib,json,sys,time
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT))
import deficit_moment_verify as base
EPS=base.EPS;ALPHA=base.ALPHA;C6=base.C6

def coefficient(umin):
    if umin>=Q(3,200):return Q(467,10000)
    if umin>=Q(3,250):return Q(121,2500)
    assert umin>=Q(9,1000)
    return Q(251,5000)

@lru_cache(None)
def margin(cap,slab,j):
    if j<4:return base.margin(cap,slab,j)
    p=[row.copy() for row in base.margin(cap,slab,0)]
    p[2][2]+=Q(2,25)-coefficient(slab[0])
    return p

def point(p,u,x):return sum(p[i][j]*u**i*x**j for i in range(4) for j in range(4))

def exempt(box,slab):
    if base.exempt(box):return True
    return coefficient(slab[0])*box[1]**2*box[3]**2<=EPS

def partition(rects,umin,umax):
    assert all(umin<=a<b<=umax and 0<=c<d<=Q(13,2) for a,b,c,d in rects)
    cuts=sorted({z for r in rects for z in r[:2]})
    assert cuts[0]==umin and cuts[-1]==umax
    for a,b in zip(cuts,cuts[1:]):
        intervals=sorted((c,d) for l,h,c,d in rects if l<=a and b<=h)
        assert intervals and intervals[0][0]==0 and intervals[-1][1]==Q(13,2)
        assert all(x[1]==y[0] for x,y in zip(intervals,intervals[1:]))
    return len(cuts)-1

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--certify',action='store_true');parser.add_argument('--umin',default='9/1000');parser.add_argument('--umax',default='2/125');parser.add_argument('--step',default='1/2000');parser.add_argument('--limit',type=int,default=10000);parser.add_argument('--depth',type=int,default=8)
    args=parser.parse_args();umin,umax,step=Q(args.umin),Q(args.umax),Q(args.step)
    assert umin==Q(9,1000) and umax==Q(2,125) and 0<step<=Q(1,2000)
    slabs=[];u=umin
    breaks=[Q(3,250),Q(3,200),Q(2,125)]
    while u<umax:
        v=min([umax,u+step]+[t for t in breaks if t>u]);slabs.append((u,v));u=v
    caps=[];capnodes=[];accepted=[];uncovered=[];visited=0;exempts=0;maxdepth=0;start=time.time()
    for si,slab in enumerate(slabs):
        queue=[(slab+(Q(0),Q(13,2)),0)]
        while queue:
            box,depth=queue.pop();visited+=1;maxdepth=max(maxdepth,depth)
            assert visited<=args.limit,(visited,box)
            if exempt(box,slab):
                accepted.append({'box':list(map(str,box)),'slab':list(map(str,slab)),'exempt':True});exempts+=1;continue
            found=None
            for ci in reversed(range(len(caps))):
                for j in [4,1,0,3,2]:
                    if min(base.bernstein2(margin(caps[ci],slab,j),box))>=0:found=(ci,j);break
                if found is not None:break
            if found is None:
                nodes=base.proposed_nodes((box[0]+box[1])/2,(box[2]+box[3])/2)
                if nodes not in capnodes:
                    cap=base.fresh_cap(*nodes);caps.append(cap);capnodes.append(nodes)
                    print('CAP',len(caps),list(map(str,nodes)),flush=True)
                ci=capnodes.index(nodes);cap=caps[ci]
                for j in [4,1,0,3,2]:
                    if min(base.bernstein2(margin(cap,slab,j),box))>=0:found=(ci,j);break
                center=(box[0]+box[1])/2,(box[2]+box[3])/2
                center_margin=max(point(margin(cap,slab,j),*center) for j in range(5))
            if found is not None:
                accepted.append({'box':list(map(str,box)),'slab':list(map(str,slab)),'cap':found[0],'content':found[1],'gamma':str(coefficient(slab[0]))});continue
            if depth>=args.depth or (depth>=3 and box[3]-box[2]<=Q(13,16) and center_margin<0):
                uncovered.append({'box':list(map(str,box)),'slab':list(map(str,slab)),'reason':'no accepted Bernstein certificate; no counterexample claimed'});continue
            ul,uh,xl,xh=box
            if (uh-ul)/uh>(xh-xl)/max(xh,Q(1,1000000)):
                mid=(ul+uh)/2;children=[(ul,mid,xl,xh),(mid,uh,xl,xh)]
            else:
                mid=(xl+xh)/2;children=[(ul,uh,xl,mid),(ul,uh,mid,xh)]
            queue.extend((c,depth+1) for c in children)
        print('SLAB',si+1,'/',len(slabs),'accepted',len(accepted),'uncovered',len(uncovered),'caps',len(caps),'seconds',time.time()-start,flush=True)
    strips=partition([tuple(map(Q,r['box'])) for r in accepted+uncovered],umin,umax)
    covered_end=umin
    for slab in slabs:
        if any(tuple(map(Q,r['slab']))==slab for r in uncovered):break
        covered_end=slab[1]
    assert not uncovered, ('prefix not completely certified',len(uncovered))
    deps=[Path(__file__).resolve(),ROOT/'deficit_moment_verify.py',ROOT/'deficit_gaussian.py',base.ARCHIVE/'profile.py',ROOT/'deficit_structure_refine_verify.py']
    witness={'Agent-ID':'codex-6e2b','claim':'Every u in [.009,.016] and chi in [0,42] satisfies C^2<=.3 D_++6e-6','umin':str(umin),'umax':str(umax),'full_prefix_end':str(covered_end),
             'dependencies_sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in deps},
             'caps':[{'nodes':list(map(str,n)),'coefficients':list(map(str,c))} for n,c in zip(capnodes,caps)],
             'benchmark_lower':{str(u):str(base.blo(u)) for s in slabs for u in s},'accepted':accepted,'uncovered':uncovered,'visited':visited,'exempts':exempts,'maxdepth':maxdepth,'seconds':time.time()-start}
    (ROOT/'deficit_moment_prefix_witness.json').write_text(json.dumps(witness,indent=2)+'\n')
    print('PASS COMPLETE PREFIX CERTIFICATE AND EXACT PARTITION',strips,'strips',json.dumps({k:witness[k] for k in ['umin','umax','full_prefix_end','visited','exempts','maxdepth','seconds']}),'accepted',len(accepted),'uncovered',len(uncovered),'caps',len(caps),flush=True)

if __name__=='__main__':main()

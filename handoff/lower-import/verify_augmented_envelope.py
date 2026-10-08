#!/usr/bin/env python3
"""Independent exact scalar-cover audit after coupled-profile certification."""

if not __debug__:
    raise RuntimeError('Assertions are proof gates; do not use Python -O or -OO.')

from fractions import Fraction as Q
from pathlib import Path
import argparse,importlib.util,json
HERE=Path(__file__).resolve().parent
EPS=Q(37,50);RHO=Q('0.977459')

def value(p,t):return p[0]+p[1]*t+p[2]*t*t
def maximum(p,lo,hi):
    candidates=[lo,hi]
    if p[2]<0:
        vertex=-p[1]/(2*p[2])
        if lo<=vertex<=hi:candidates.append(vertex)
    return max(value(p,t) for t in candidates)

def pair_upper(first,second,lo,hi):
    # Direct minimization in the second profile's weight, clipped to [0,1].
    fi=[first[3],-2*first[1],Q(1)]
    fj=[second[3],-2*second[1],Q(1)]
    gain=2*(first[2]-second[2])**2/EPS
    assert gain>0 and second[1]>first[1]
    difference=[fi[k]-fj[k] for k in range(3)]
    left=(-gain-difference[0])/difference[1]
    right=(gain-difference[0])/difference[1]
    # Min of Fi+theta*(Fj-Fi)-gain*theta*(1-theta).
    middle=[(fi[0]+fj[0])/2-gain/4-difference[0]**2/(4*gain),
            (fi[1]+fj[1])/2-difference[0]*difference[1]/(2*gain),
            Q(1)-difference[1]**2/(4*gain)]
    candidates=[]
    for a,b,p in [(lo,min(hi,left),fi),(max(lo,left),min(hi,right),middle),(max(lo,right),hi,fj)]:
        if a<=b:candidates.append(maximum(p,a,b))
    assert candidates
    return max(candidates)

def main():
    assert __debug__
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source',type=Path,required=True)
    parser.add_argument('--base',type=Path,default=HERE/'base')
    parser.add_argument('--certificate',type=Path,default=HERE/'envelope.json')
    parser.add_argument('--profiles',type=Path)
    parser.add_argument('--bound',type=Q,default=Q('1.4008970709'))
    args=parser.parse_args()
    import hashlib
    assert hashlib.sha256(args.source.read_bytes()).hexdigest()=='8c6105340cced0ee4b4d4977baab4c0d43f07466ce77e726eb1277b613473ac1'
    data=json.loads(args.certificate.read_text())
    vpath=args.profiles or HERE/'coupled-profiles.json'
    virtual=json.loads(vpath.read_text())
    spec=importlib.util.spec_from_file_location('source_data',args.source)
    v=importlib.util.module_from_spec(spec);spec.loader.exec_module(v)
    caps=json.loads((args.base/'certificates/moment-cover.json').read_text())
    rows=[('crude',Q(0),Q(0),EPS*RHO**2)]
    for g,c in zip(v.DATA,caps['groups']):
        p=g['profile'];assert p['id']==c['id']
        rows.append((p['id'],Q(p['ell']),Q(p['beta']),Q(c['cap'])))
    for k,r in enumerate(virtual):rows.append((f'virtual_{k}',Q(r['ell']),Q(r['beta']),Q(r['cap'])))
    rows.sort(key=lambda r:r[1])
    assert rows==[(r[0],*map(Q,r[1:])) for r in data['rows']]
    assert all(a[1]<b[1] for a,b in zip(rows,rows[1:]))
    leaves=data['leaves'];paths=sorted(r['path'] for r in leaves)
    assert paths and len(paths)==len(set(paths))
    assert all(not b.startswith(a) for a,b in zip(paths,paths[1:]))
    depth=max(map(len,paths))
    assert sum(1<<(depth-len(s)) for s in paths)==1<<depth
    target=Q(data['norm_upper']);all_intervals=[]
    for leaf in leaves:
        lo,hi=Q(0),Q(9,10)
        for c in leaf['path']:
            assert c in '01';mid=(lo+hi)/2
            if c=='0':hi=mid
            else:lo=mid
        assert lo==Q(leaf['left']) and hi==Q(leaf['right'])
        ids=leaf['profiles'];assert len(ids) in (1,2)
        assert all(isinstance(i,int) and 0<=i<len(rows) for i in ids)
        if len(ids)==1:
            row=rows[ids[0]];bound=maximum([row[3],-2*row[1],Q(1)],lo,hi)
        else:
            assert ids[0]<ids[1]
            bound=pair_upper(rows[ids[0]],rows[ids[1]],lo,hi)
        assert bound==Q(leaf['upper']) and bound<=target
        all_intervals.append((lo,hi))
    all_intervals.sort()
    assert all_intervals[0][0]==0 and all_intervals[-1][1]==Q(9,10)
    assert all(a[1]==b[0] for a,b in zip(all_intervals,all_intervals[1:]))
    assert target>0 and args.bound*target<1
    print('ALL AUGMENTED PROFILE T-COVER CHECKS PASSED',len(leaves),'leaves')
    print('NORM_UPPER',target)
    print('RECIPROCAL',float(1/target))
    print('STRICT_LOWER',args.bound)

if __name__=='__main__':main()

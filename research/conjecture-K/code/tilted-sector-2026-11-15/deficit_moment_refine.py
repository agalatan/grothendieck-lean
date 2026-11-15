#!/usr/bin/env python3
"""codex-6e2b: refine certified moment boxes with stronger content bounds.

Default execution first regenerates the numerical base and scalar barriers.
--validated-dependencies is only for a chain that has just replayed those checks.
No uncovered box is counted as proved.
"""
from fractions import Fraction as Q
from functools import lru_cache
from pathlib import Path
import argparse,hashlib,json,subprocess,sys,time
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT))
import deficit_moment_verify as base
from deficit_moment_mid import partition

def gamma(l):
    if l>=Q(3,100):return Q(1077659,27000000)
    if l>=Q(1,40):return Q(1859,43200)
    if l>=Q(1,50):return Q(441,10000)
    if l>=Q(9,500):return Q(451,10000)
    if l>=Q(3,200):return Q(467,10000)
    if l>=Q(3,250):return Q(121,2500)
    assert l>=Q(9,1000)
    return Q(251,5000)

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--certify',action='store_true');parser.add_argument('--validated-dependencies',action='store_true');parser.add_argument('--depth',type=int,default=4)
    args=parser.parse_args();start=time.time()
    if not args.validated_dependencies:
        for script in ['deficit_structure_refine_verify.py','deficit_structure_medium25_verify.py','deficit_moment_mid.py']:
            subprocess.run([sys.executable,'-I','-B',str(ROOT/script)],check=True,cwd=ROOT)
    path=ROOT/'deficit_moment_mid_witness.json';data=json.loads(path.read_text())
    assert Q(data['umin'])==Q(9,1000) and Q(data['umax'])==Q(3,100)
    for p,digest in data['dependencies_sha256'].items():
        assert hashlib.sha256(Path(p).read_bytes()).hexdigest()==digest,('changed base source',p)
    caps=[tuple(map(Q,r['coefficients'])) for r in data['caps']]
    benchmark={Q(k):Q(v) for k,v in data['benchmark_lower'].items()}
    @lru_cache(None)
    def margin(ci,slab,j):
        cap=caps[ci];l,h=slab;bl,bh=benchmark[l],benchmark[h];slope=(bh-bl)/(h-l)
        p=base.blank();p[0][0]=base.ALPHA*(bl-slope*l)+base.EPS;p[1][0]=base.ALPHA*slope
        p[0][0]-=base.ALPHA*cap[0];p[1][0]-=base.ALPHA*cap[1]
        p[2][0]-=2*base.ALPHA*cap[2];p[2][2]-=base.ALPHA*cap[2]
        p[3][0]-=6*base.ALPHA*cap[3];p[3][2]-=9*base.ALPHA*cap[3];p[3][3]-=base.C6*base.ALPHA*cap[3]
        if j==4:p[2][2]-=gamma(l)
        else:
            for i in range(4):
                for k in range(4):p[i][k]-=base.CONTENTS[j][i][k]
        return p
    accepted=[dict(r,origin='validated base') for r in data['accepted']]
    remaining=[];new=0;visited=0
    for source in data['uncovered']:
        slab=tuple(map(Q,source['slab']));queue=[(tuple(map(Q,source['box'])),0)]
        assert not any(slab[0]<t<slab[1] for t in [Q(3,250),Q(3,200),Q(9,500),Q(1,50),Q(1,40)])
        while queue:
            box,depth=queue.pop();visited+=1;found=None
            for ci in reversed(range(len(caps))):
                for j in [4,1,0,3,2]:
                    if min(base.bernstein2(margin(ci,slab,j),box))>=0:found=(ci,j);break
                if found is not None:break
            if found is not None:
                accepted.append({'box':list(map(str,box)),'slab':list(map(str,slab)),
                    'cap':found[0],'content':found[1],'gamma':str(gamma(slab[0])),
                    'origin':'refined exact Bernstein check'});new+=1;continue
            uc,xc=(box[0]+box[1])/2,(box[2]+box[3])/2
            sl,sh=slab
            bcenter=((sh-uc)*benchmark[sl]+(uc-sl)*benchmark[sh])/(sh-sl)
            moment_center=min(c[0]+c[1]*uc+c[2]*uc**2*(2+xc**2)+c[3]*uc**3*(6+9*xc**2+base.C6*xc**3) for c in caps)
            content_center=min(Q(2,25)*uc**2*xc**2,3*uc**3*xc**3,Q(1,2500),Q(19321,10**6)*uc,gamma(sl)*uc**2*xc**2)
            best_center=base.ALPHA*(bcenter-moment_center)+base.EPS-content_center
            if depth>=args.depth or (depth>=1 and best_center<0):
                remaining.append({'box':list(map(str,box)),'slab':list(map(str,slab)),
                    'reason':'no accepted certificate; no counterexample claimed'});continue
            ul,uh,xl,xh=box
            if (uh-ul)/uh>(xh-xl)/max(xh,Q(1,1000000)):
                mid=(ul+uh)/2;children=[(ul,mid,xl,xh),(mid,uh,xl,xh)]
            else:
                mid=(xl+xh)/2;children=[(ul,uh,xl,mid),(ul,uh,mid,xh)]
            queue.extend((c,depth+1) for c in children)
    rects=[tuple(map(Q,r['box'])) for r in accepted+remaining]
    strips=partition(rects,Q(9,1000),Q(3,100))
    cuts=sorted({x for r in rects for x in r[:2]});bands=[]
    for l,h in zip(cuts,cuts[1:]):
        if not any(Q(r['box'][0])<h and l<Q(r['box'][1]) for r in remaining):
            if bands and bands[-1][1]==l:bands[-1][1]=h
            else:bands.append([l,h])
    for r in accepted+remaining:
        xl,xh=Q(r['box'][2])**2,Q(r['box'][3])**2
        r['chi_interval']=None if xl>42 else [str(xl),str(min(Q(42),xh))]
    dependencies=[ROOT/'deficit_moment_mid_witness.json',Path(__file__).resolve(),ROOT/'deficit_structure_refine_verify.py',ROOT/'deficit_structure_medium25_verify.py']
    result={'Agent-ID':'codex-6e2b','status':'C accepted boxes only, conditional on replayed base and scalar content certificates',
        'dependencies_sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in dependencies},
        'base_witness':str(path),'accepted':accepted,'uncovered':remaining,
        'full_energy_bands':[list(map(str,r)) for r in bands],
        'new_accepted':new,'visited_refinement_boxes':visited,'partition_strips':strips,'seconds':time.time()-start}
    (ROOT/'deficit_moment_refine_witness.json').write_text(json.dumps(result,indent=2)+'\n')
    print('PASS REFINED ACCEPTED-BOX CERTIFICATE',json.dumps({k:result[k] for k in ['full_energy_bands','new_accepted','visited_refinement_boxes','partition_strips','seconds']}),'accepted',len(accepted),'uncovered',len(remaining),flush=True)

if __name__=='__main__':main()

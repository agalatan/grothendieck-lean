#!/usr/bin/env python3
"""Independent serialized-cover replay, codex-a713.

Reads CURRENT Lean row/batch constructors directly. Does not import the search,
exporter, Campaign, or its JSON row/node maps. Translates the rational formulas
in Lower/{Basic,Moment,Gate,Mixed,Boxes}.lean. Reuses the existing certified
row/node theorems; does not rebuild them or claim a Lean-kernel replay.
"""
import sys
sys.dont_write_bytecode=True
import argparse,json,re,time,hashlib
from pathlib import Path
from fractions import Fraction as Q
from functools import lru_cache
ROOT=Path('/Users/alingalatan/workspaces/grothe')
OUT=Path(__file__).resolve().parent
EPS=Q(149,200);RHO=Q(973612157,10**9);C6=Q(4045313,100000);PAD=Q(1,10**11)


def qlean(s):
    s=re.sub(r'\((-?\d+)\s*:\s*ℚ\)',r'\1',s.strip())
    return Q(s.replace(' ',''))


def split_outer(s):
    out=[];start=0;depth=0;quote=False
    for i,c in enumerate(s):
        if c=='"':quote=not quote
        if quote:continue
        if c in '([⟨':depth+=1
        elif c in ')]⟩':depth-=1
        elif c==',' and depth==0:out.append(s[start:i].strip());start=i+1
    out.append(s[start:].strip())
    return out


def constructors(s):
    s=re.sub(r'/-.*?-/', '', s,flags=re.S)
    depth=0;quote=False;out=[];start=0
    for i,c in enumerate(s):
        if c=='"':quote=not quote
        if quote:continue
        if c=='⟨':
            if depth==0:start=i+1
            depth+=1
        elif c=='⟩':
            depth-=1
            if depth==0:out.append(s[start:i])
    assert depth==0
    return out


def strings(s):return re.findall(r'"([^"\n]*)"',s)
def qs(s):return tuple(Q(x) for x in s.split(','))
def affine(t,a,b):return tuple((1-t)*x+t*y for x,y in zip(a,b))


def read_rows():
    rows=[]
    for k in range(1,20):
        text=(ROOT/f'Grothe/Lower/RowData{k:02d}.lean').read_text().split(': Row :=',1)[1]
        prefix=text.split('"',1)[0]
        nums=tuple(Q(int(n),int(d or '1')) for n,d in re.findall(r'\((-?\d+) : ℚ\)(?: / (\d+))?',prefix))
        assert len(nums)==15,(k,len(nums))
        ell,beta,delta,kappa,smax,cap=nums[:6];E=nums[6:12];b=nums[12:]
        ss=strings(text);assert len(ss)>=2
        table=[tuple(map(Q,x.split(':'))) for x in ss[0].split(';')]
        assert table[0][0]==0
        ns=[]
        for cell in ss[2:]:
            f=cell.split('|');assert len(f)==5
            nodes=[]
            for node in filter(None,f[4].split(';')):
                g=node.split(':');assert len(g)==3
                nodes.append((Q(g[0])/delta,qs(g[1]),Q(31,4)))
            ns.append(nodes)
        # ell,beta,delta,N(6),g(3), as in Row.vrow.
        N=(E[0]-EPS+delta,)+E[1:]
        vr=(ell,beta,delta)+N+tuple(delta*x for x in b)
        rows.append(dict(v=vr,env=(ell,beta,2*beta*beta/EPS+cap+PAD),
            zero=(Q(0),(table[0][1],Q(0),Q(0),Q(0),Q(0)),Q(31,4)),nodes=ns))
    return rows


def read_batches():
    ans=[]
    for name in ('Grothe/Lower/MixedData.lean','Grothe/Research/LawNodeData.lean'):
        text=(ROOT/name).read_text()
        if 'LawNodeData' in name:
            order=re.search(r'def extraBatches : List JBatch :=\s*\[([^]]+)\]',text).group(1)
            names=[x.strip() for x in order.split(',')]
            chunks=[]
            for ident in names:
                part=text.split(f'def {ident} : JBatch :=',1)[1]
                chunks.append(constructors(part)[0])
        else:chunks=constructors(text.split('def mixedBatches : List JBatch :=',1)[1])
        for chunk in chunks:
            f=split_outer(chunk);assert len(f)==8,len(f)
            i,j=int(f[0]),int(f[1]);theta=qlean(f[2]);assert f[6] in ('true','false')
            nodes=[]
            for wit in strings(f[7]):
                front=wit.split('|')[0].split(':');assert len(front) in (3,4)
                tau=Q(front[0]);poly=qs(front[1]);assert len(poly)==5
                xcap=Q(31,4)
                if len(front)==4:
                    bud=front[3].split(',')
                    if bud[0]=='j':assert len(bud)==15;xcap=Q(bud[3])
                nodes.append((tau,poly,xcap))
            ans.append((i,j,theta,nodes))
    assert len(ans)==23,len(ans)
    return ans


def samepot(a,b,t,i,j,s):
    return (a,b,t)==(i,j,s) or (t==s==0 and a==i) or (t==s==1 and b==j)


def chord(a,b,t):
    assert 0<=a[0]<=t<=b[0]
    if a[0]==b[0]:return a[1]
    return affine((t-a[0])/(b[0]-a[0]),a[1],b[1])


def maximum(c0,c1,c2,lo,hi):
    vals=[c0+c1*z+c2*z*z for z in (lo,hi)]
    if c2<0:
        z=-c1/(2*c2)
        if lo<=z<=hi:vals.append(c0+c1*z+c2*z*z)
    return max(vals)


def moment(p,x):return p[0]+RHO*p[1]+p[2]+p[3]*(2+x*x)+p[4]*(6+9*x*x+C6*x**3)


class Check:
    def __init__(self):self.rows=read_rows();self.batches=read_batches()

    @lru_cache(maxsize=None)
    def component(self,s,sl,su,xu):
        f=s.split(';');i,j,t,s0,s1=f[0].split(',');i,j=int(i),int(j)
        t,s0,s1=Q(t),Q(s0),Q(s1);assert 0<=t<=1 and len(f)==5
        assert 0<=i<len(self.rows) and 0<=j<len(self.rows)
        nodes=[]
        for ref in f[1:]:
            r=ref.split(',');key=r[0];args=list(map(int,r[1:]))
            assert all(k>=0 for k in args)
            if key in ('z','s'):
                assert len(args)==(1 if key=='z' else 3)
                idx=args[0];assert samepot(idx,idx,Q(0),i,j,t)
                node=self.rows[idx]['zero'] if key=='z' else self.rows[idx]['nodes'][args[1]][args[2]]
            else:
                assert key=='b' and len(args)==2;a,b,weight,ns=self.batches[args[0]]
                assert samepot(a,b,weight,i,j,t);node=ns[args[1]]
            assert xu<=node[2];nodes.append(node)
        p0,p1=chord(nodes[0],nodes[1],s0),chord(nodes[2],nodes[3],s1)
        return affine(t,self.rows[i]['v'],self.rows[j]['v']),chord((s0,p0),(s1,p1),sl),chord((s0,p0),(s1,p1),su)

    def bound(self,s):
        f=s.split('|');d=qs(f[1]);assert len(d)==6
        tl,tu,sl,su,xl,xu=d;assert 0<=sl<su and 0<=xl and tl<tu and xl<xu
        if f[0]=='c':
            assert len(f)==3
            i,j,t=f[2].split(',');t=Q(t);assert 0<=t<=1
            env=[(Q(0),Q(0),EPS*RHO**2)]+[r['env'] for r in self.rows]
            assert 0<=int(i)<len(env) and 0<=int(j)<len(env)
            a,b=env[int(i)],env[int(j)];ell,beta,cap=affine(t,a,b)
            cap-=2*t*(1-t)*(a[1]-b[1])**2/EPS
            return d,maximum(cap,-2*ell,Q(1),tl,tu)
        if f[0]=='b':
            assert len(f)==3
            v,p,q=self.component(f[2],sl,su,xu)
        else:
            assert f[0]=='m' and len(f)==5;t=Q(f[2]);assert 0<=t<=1
            a,pa,qa=self.component(f[3],sl,su,xu);b,pb,qb=self.component(f[4],sl,su,xu)
            v,p,q=affine(t,a,b),affine(t,pa,pb),affine(t,qa,qb)
        ell,beta,delta,a,b,c,d0,e,f0,g1,g2,g3=v
        det=d0*f0-e*e;assert d0>0 and det>0 and p[4]>=0 and q[4]>=0
        D=delta+a+2*g1-(f0*(b+g2)**2-2*e*(b+g2)*(c+g3)+d0*(c+g3)**2)/det
        ends=[]
        for x in (xl,xu):
            lo,hi=moment(p,x),moment(q,x);slope=(hi-lo)/(su-sl)
            ends.append(maximum(lo-sl*slope,slope,-D,sl,su))
        return (tl,tu,sl,su,xl,xu),maximum(Q(0),-2*ell,Q(1),tl,tu)+2*beta*beta/EPS+max(ends)+PAD


def partition(tokens,domains):
    assert len(set(domains))==len(domains)
    expected=set(domains);leaves=set();stack=[(Q(0),Q(9,10),Q(0),RHO,Q(0),Q(31,4))]
    for token in tokens:
        domain=stack.pop()
        if token=='.':assert domain in expected and domain not in leaves;leaves.add(domain);continue
        k,mid=token.split(',');k=int(k);mid=Q(mid);assert 0<=k<3 and domain[2*k]<mid<domain[2*k+1]
        lo=list(domain);hi=list(domain);lo[2*k+1]=mid;hi[2*k]=mid
        stack.extend((tuple(hi),tuple(lo)))
    assert not stack and leaves==expected


def main(args):
    start=time.monotonic();cert=OUT/args.certificate;data=json.loads(cert.read_text())
    paths=[ROOT/f'Grothe/Lower/RowData{k:02d}.lean' for k in range(1,20)]
    paths += [ROOT/s for s in ('Grothe/Lower/MixedData.lean','Grothe/Research/LawNodeData.lean',
        'Grothe/Research/LawNodeLower.lean','Grothe/MainResult.lean')]
    paths += [ROOT/'Grothe/Lower'/f'{s}.lean' for s in ('Basic','Moment','Gate','Mixed','Boxes')]
    hashes={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}
    check=Check();values=[];domains=[];B=Q(data['B']);L=Q(data['L'])
    for box in data['boxes']:
        d,v=check.bound(box);assert v<=B,(float(v),float(B),box)
        domains.append(d);values.append(v)
    partition(data['partition_tokens'],domains)
    assert B>0 and L*B<1 and L>Q(1401697117301,10**12)
    assert hashes=={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in paths},'Sources changed during replay'
    peak=max(values)
    out=dict(agent='codex-a713',status='PASS independent exact rational serialized-cover replay; NO Lean build',
        certificate=str(cert),certificate_sha256=hashlib.sha256(cert.read_bytes()).hexdigest(),
        B=str(B),L=str(L),actual_upper=str(peak),boxes=len(values),
        binding_boxes=[i for i,v in enumerate(values) if v==peak],
        improvement_over_current=str(L-Q(1401697117301,10**12)),
        seconds=time.monotonic()-start,
        source_hashes=hashes,
        reused_theorems='Existing row/node checks, NodeCaps and LawNodeLower transfer; no new analytic assumption',
        semantics_sources=[str(ROOT/'Grothe/Lower'/f'{s}.lean') for s in ('Basic','Moment','Gate','Mixed','Boxes')])
    target=OUT/(cert.stem.replace('certificate','independent')+'.json')
    target.write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2),flush=True)


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--certificate',default='improvement_certificate_v1.json')
    main(p.parse_args())

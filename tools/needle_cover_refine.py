#!/usr/bin/env python3
"""Exact free subdivision and mixture repricing of existing choice boxes.

No Gaussian or law-node certificate is regenerated. Discovery uses floating
golden-section search for one mixture weight; acceptance uses Fractions and
reconstructs the old saved box first. Reuses only the parent's four node
references per component, including their valid x ranges and potentials.
This is a candidate assembly ledger, not a whole-cover Lean certificate.
"""
import argparse
import copy
from fractions import Fraction as Q
import hashlib
import itertools
import json
from functools import lru_cache
from pathlib import Path

EPS=Q(149,200); RHO=Q(973612157,10**9); C6=Q(4045313,100000); PAD=Q(1,10**11)

def mix(t,a,b): return tuple((1-t)*x+t*y for x,y in zip(a,b))
def qval(q,x): return q[0]+q[1]*x+q[2]*x*x
def qmax(q,a,b):
    v=max(qval(q,a),qval(q,b))
    if q[2]<0:
        t=-q[1]/(2*q[2])
        if a<=t<=b: v=max(v,qval(q,t))
    return v
def J(p,x):
    a0,a1,a2,a4,a6=p
    return a0+RHO*a1+a2+a4*(2+x*x)+a6*(6+9*x*x+C6*x*x*x)
def price(v):
    ell,beta,k,h1,h2,c1,c2,c3=v
    det=c1*c3-c2*c2
    assert c1>0 and det>0
    return k-(c3*h1*h1-2*c2*h1*h2+c1*h2*h2)/det
def rowvector(r):
    ell,beta,d=map(Q,(r['ell'],r['beta'],r['delta']))
    a,n1,n2,c1,c2,c3=map(Q,r['E']);b0,b1,b2=map(Q,r['b'])
    return (ell,beta,a-EPS+2*d*(1+b0),n1+d*b1,n2+d*b2,c1,c2,c3)
def chord(n0,n1,t):
    a,p=n0;b,q=n1
    assert a<=t<=b
    return p if a==b else mix((t-a)/(b-a),p,q)
def value(bounds,v,p,q):
    tl,tu,sl,su,xl,xu=bounds;ell,beta=v[:2];D=price(v)
    def xp(x):
        lo,hi=J(p,x),J(q,x);m=(hi-lo)/(su-sl)
        return qmax((lo-m*sl,m,-D),sl,su)
    return qmax((0,-2*ell,1),tl,tu)+2*beta*beta/EPS+max(xp(xl),xp(xu))+PAD
def value_float(bounds,v,p,q):
    tl,tu,sl,su,xl,xu=bounds;ell,beta=v[:2];D=price(v)
    def jf(p,x):
        a0,a1,a2,a4,a6=p
        return a0+float(RHO)*a1+a2+a4*(2+x*x)+a6*(6+9*x*x+float(C6)*x*x*x)
    def xp(x):
        lo,hi=jf(p,x),jf(q,x);m=(hi-lo)/(su-sl)
        return qmax((lo-m*sl,m,-D),sl,su)
    return qmax((0.,-2*ell,1.),tl,tu)+2*beta*beta/float(EPS)+max(xp(xl),xp(xu))+float(PAD)
def capvalue(a,b,t,tl,tu):
    ell,beta,C=a;ell1,beta1,C1=b
    return qmax(((1-t)*C+t*C1-2*(1-t)*t*(beta-beta1)**2/EPS,
                 -2*((1-t)*ell+t*ell1),1),tl,tu)
def minimize_weight(ev,original):
    lo,hi=0.,1.;phi=(5**.5-1)/2
    x=hi-phi*(hi-lo);y=lo+phi*(hi-lo);fx=ev(x,True);fy=ev(y,True)
    for _ in range(70):
        if fx<=fy:hi,y,fy=y,x,fx;x=hi-phi*(hi-lo);fx=ev(x,True)
        else:lo,x,fx=x,y,fy;y=lo+phi*(hi-lo);fy=ev(y,True)
    c=Q(round((lo+hi)/2*10**9),10**9)
    return min([original,c,Q(0),Q(1)],key=ev)
def weights(i,j,t):
    if i==j:return ((i,Q(1)),)
    return tuple((k,v) for k,v in sorted(((i,1-t),(j,t))) if v)
def encode(x):
    if isinstance(x,Q):return str(x)
    if isinstance(x,dict):return {str(k):encode(v) for k,v in x.items()}
    if isinstance(x,(list,tuple)):return [encode(v) for v in x]
    return x

class Campaign:
    def __init__(self,base):
        self.base=base
        self.cover=json.loads((base/'cover.json').read_text())
        self.inh=json.loads((base/'inherited.json').read_text())
        self.rows=self.inh['rows'];self.nodes=self.cover['nodes']
        self.original_node_count=len(self.nodes)
        self.rv=list(map(rowvector,self.rows));self.gv=[]
        self.env=[(Q(0),Q(0),EPS*RHO**2)]+[(Q(r['ell']),Q(r['beta']),2*Q(r['beta'])**2/EPS+Q(r['cap'])+PAD) for r in self.rows]
        for g in self.cover['groups']:
            w=[(i,Q(a)) for i,a in g['weights']]
            assert sum(a for _,a in w)==1 and all(a>=0 for _,a in w)
            self.gv.append(tuple(sum(a*self.rv[i][k] for i,a in w) for k in range(8)))
    def source_ref(self,r,c,n):
        ref=['s',r,c,n] if c>=0 else ['z',r]
        if ref not in self.nodes:self.nodes.append(ref)
        return self.nodes.index(ref)
    def normalized_box(self,index):
        b=self.cover['boxes'][index]
        if 'choice' in b:return b
        kind,domain,*rr=self.inh['boxes'][b['original']].split('|')
        assert kind=='s',('unsupported original',index,kind)
        i,j,t=rr[0].split(',');i,j=int(i),int(j)
        gs=[]
        for r in [i,j]:
            gs.append(next(g for g,v in enumerate(self.cover['groups']) if v['weights']==[[r,'1']]))
        refs=[]
        for r,ss in zip([i,j],rr[1:]):
            ns=list(map(int,ss.split(',')));assert len(ns)==8
            refs.append([self.source_ref(r,c,n) for c,n in zip(ns[::2],ns[1::2])])
        return dict(b,choice=dict(groups=gs,refs=refs,theta=t,scale_domain=domain.split(',')[2:4]))
    def refine_cap(self,index,split):
        box=self.cover['boxes'][index];kind,_,s=self.inh['boxes'][box['original']].split('|');assert kind=='c'
        i,j,t=s.split(',');i,j=int(i),int(j);theta=Q(t);bb=list(map(Q,box['bounds']))
        old=capvalue(self.env[i],self.env[j],theta,*bb[:2]);assert old==Q(box['upper'])
        children=[]
        for k in range(split[0]):
            cb=list(bb);a,b=bb[:2];cb[:2]=[a+(b-a)*k/split[0],a+(b-a)*(k+1)/split[0]]
            def ev(t,floatmode=False):
                cast=float if floatmode else lambda x:x
                return capvalue(tuple(map(cast,self.env[i])),tuple(map(cast,self.env[j])),t,*map(cast,cb[:2]))
            th=minimize_weight(ev,theta);upper=ev(th)
            assert 0<=th<=1 and upper<=old
            children.append(dict(bounds=cb,cap_choice=[i,j,th],upper=upper))
        new=max(c['upper'] for c in children)
        return dict(box=index,old_upper=old,new_upper=new,saving=old-new,old_decimal=float(old),new_decimal=float(new),saving_decimal=float(old-new),split=[split[0],1,1],children=children)
    @lru_cache(maxsize=None)
    def node(self,index,group,xu):
        ref=self.nodes[index];k=ref[0];xcap=Q(31,4)
        if k=='s':
            _,i,c,n=ref;r=self.rows[i];v=r['cells'][c]['nodes'][n]
            t=Q(v['tau'])/Q(r['delta']);p=tuple(map(Q,v['P']));w=((i,Q(1)),)
        elif k=='z':
            _,i=ref;r=self.rows[i];t=Q(0);p=(Q(r['table'][0][1]),Q(0),Q(0),Q(0),Q(0));w=((i,Q(1)),)
        else:
            if k=='b':
                _,b,n=ref;r=self.inh['batches'][b];v=r['nodes'][n]
            else:
                assert k=='n';v=self.cover['newnodes'][ref[1]];r=v
                if 'sixth_joint' in v:xcap=Q(v['sixth_joint']['xmax'])
            t=Q(v['tau']);p=tuple(map(Q,v['P']));w=weights(r['i'],r['j'],Q(r['theta']))
        expected=tuple((i,Q(a)) for i,a in self.cover['groups'][group]['weights'])
        assert w==expected,(index,group,w,expected)
        assert xu<=xcap and p[1]>=0 and p[4]>=0
        return t,p
    def component(self,refs,g,bounds,domain=None):
        _,_,sl,su,_,xu=bounds;s0,s1=domain or (sl,su)
        ns=[self.node(i,g,xu) for i in refs]
        m0=(s0,chord(ns[0],ns[1],s0));m1=(s1,chord(ns[2],ns[3],s1))
        return chord(m0,m1,sl),chord(m0,m1,su)
    def exact_old(self,index):
        b=self.normalized_box(index);ch=b['choice'];bb=tuple(map(Q,b['bounds']))
        cs=[self.component(r,g,bb,tuple(map(Q,ch['scale_domain'])) if 'scale_domain' in ch else None)
            for r,g in zip(ch['refs'],ch['groups'])]
        if len(cs)==1:v=self.gv[ch['groups'][0]];p,q=cs[0]
        else:
            t=Q(ch['theta']);v=mix(t,*[self.gv[g] for g in ch['groups']]);p=mix(t,cs[0][0],cs[1][0]);q=mix(t,cs[0][1],cs[1][1])
        result=value(bb,v,p,q)
        assert result==Q(b['upper']),('old mismatch',index,float(result),float(Q(b['upper'])))
        return result
    @lru_cache(maxsize=None)
    def pool(self,g,xu):
        wanted=tuple((i,Q(a)) for i,a in self.cover['groups'][g]['weights'])
        result=[]
        for index,ref in enumerate(self.nodes):
            k=ref[0]
            if k in ['s','z']:w=((ref[1],Q(1)),)
            else:
                r=self.inh['batches'][ref[1]] if k=='b' else self.cover['newnodes'][ref[1]]
                w=weights(r['i'],r['j'],Q(r['theta']))
            if w!=wanted:continue
            try:self.node(index,g,xu)
            except AssertionError:continue
            result.append(index)
        return result
    def endpoint(self,refs,g,t,bounds):
        xl,xu=bounds[4:];pairs=[]
        for a,b in itertools.combinations(sorted(set(refs),key=lambda r:self.node(r,g,xu)[0]),2):
            na,nb=self.node(a,g,xu),self.node(b,g,xu)
            if na[0]<=t<=nb[0] and na[0]<nb[0]:
                p=chord(na,nb,t)
                pairs.append((max(J(p,xl),J(p,xu)),[a,b],p))
        assert pairs,('no bracket',refs,g,t)
        _,ids,p=min(pairs,key=lambda v:v[0]);return ids,p
    @lru_cache(maxsize=None)
    def pool_hull(self,g,xu,x):
        # The hull is a discovery heuristic. The final interpolation is exact
        # and its node-domain checks do not trust the hull arithmetic.
        points=[]
        for i in self.pool(g,xu):
            a,p=self.node(i,g,xu)
            pp=list(map(float,p));xx=float(x)
            cost=pp[0]+float(RHO)*pp[1]+pp[2]+pp[3]*(2+xx*xx)+pp[4]*(6+9*xx*xx+float(C6)*xx**3)
            points.append((float(a),cost,i))
        points.sort();unique=[]
        for p in points:
            if unique and p[0]==unique[-1][0]:continue
            unique.append(p)
        hull=[]
        for p in unique:
            while len(hull)>=2:
                a,b=hull[-2:]
                cross=(b[0]-a[0])*(p[1]-b[1])-(b[1]-a[1])*(p[0]-b[0])
                if cross>0:break
                hull.pop()
            hull.append(p)
        return hull
    def endpoint_pool(self,refs,g,t,bounds):
        xl,xu=bounds[4:];tf=float(t);pairs=[]
        for x in [xl,(xl+xu)/2,xu]:
            hull=self.pool_hull(g,xu,x)
            for a,b in zip(hull,hull[1:]):
                if a[0]<=tf<=b[0]:
                    ids=[a[2],b[2]];na,nb=[self.node(i,g,xu) for i in ids]
                    if not na[0]<=t<=nb[0] or na[0]>=nb[0]:continue
                    p=chord(na,nb,t);pairs.append((max(J(p,xl),J(p,xu)),ids,p))
        if refs:
            oldids,oldp=self.endpoint(refs,g,t,bounds)
            pairs.append((max(J(oldp,xl),J(oldp,xu)),oldids,oldp))
        assert pairs,('no group hull bracket',g,t)
        _,ids,p=min(pairs,key=lambda v:v[0]);return ids,p
    def best_groups(self,cb):
        data={};bb=list(map(float,cb));proposals=[]
        for g in range(len(self.gv)):
            try:
                lo,p=self.endpoint_pool([],g,cb[2],cb);hi,q=self.endpoint_pool([],g,cb[3],cb)
            except AssertionError:continue
            data[g]=(lo+hi,p,q,tuple(map(float,self.gv[g])),tuple(map(float,p)),tuple(map(float,q)))
            proposals.append((value_float(bb,data[g][3],data[g][4],data[g][5]),[g],Q(0)))
        phi=(5**.5-1)/2
        for g,h in itertools.combinations(data,2):
            a,b=data[g],data[h]
            def ev(t):return value_float(bb,mix(t,a[3],b[3]),mix(t,a[4],b[4]),mix(t,a[5],b[5]))
            lo,hi=0.,1.;x=hi-phi*(hi-lo);y=lo+phi*(hi-lo);fx,fy=ev(x),ev(y)
            for _ in range(40):
                if fx<=fy:hi,y,fy=y,x,fx;x=hi-phi*(hi-lo);fx=ev(x)
                else:lo,x,fx=x,y,fy;y=lo+phi*(hi-lo);fy=ev(y)
            t=Q(round((lo+hi)/2*10**9),10**9)
            proposals.append((ev(float(t)),[g,h],t))
        proposals.sort(key=lambda x:x[0]);checked=[]
        for _,gs,t in proposals[:4]:
            if len(gs)==1:g=gs[0];v=self.gv[g];p,q=data[g][1:3]
            else:
                g,h=gs;v=mix(t,self.gv[g],self.gv[h]);p=mix(t,data[g][1],data[h][1]);q=mix(t,data[g][2],data[h][2])
            upper=value(cb,v,p,q);checked.append((upper,dict(groups=gs,refs=[data[g][0] for g in gs],theta=t)))
        assert checked
        return min(checked,key=lambda x:x[0])
    def refine(self,index,split=(2,1,1),pool=False,all_groups=False):
        raw=self.cover['boxes'][index]
        if 'original' in raw and self.inh['boxes'][raw['original']].startswith('c|'):
            return self.refine_cap(index,split)
        old=self.exact_old(index);box=self.normalized_box(index);ch=box['choice'];gs=ch['groups']
        bb=list(map(Q,box['bounds']));children=[]
        for ix in itertools.product(*[range(n) for n in split]):
            cb=[]
            for axis,n,k in zip(range(3),split,ix):
                a,b=bb[2*axis:2*axis+2];cb.extend([a+(b-a)*k/n,a+(b-a)*(k+1)/n])
            refs=[];cs=[]
            for g,rr in zip(gs,ch['refs']):
                endpoint=self.endpoint_pool if pool else self.endpoint
                lo,p=endpoint(rr,g,cb[2],cb);hi,q=endpoint(rr,g,cb[3],cb)
                refs.append(lo+hi);cs.append((p,q))
            def ev(t,floatmode=False):
                cast=float if floatmode else lambda x:x
                cb1=list(map(cast,cb)); vv=[tuple(map(cast,self.gv[g])) for g in gs]
                cp=[(tuple(map(cast,p)),tuple(map(cast,q))) for p,q in cs]
                if len(gs)==1:v=vv[0];p,q=cp[0]
                else:v=mix(t,*vv);p=mix(t,cp[0][0],cp[1][0]);q=mix(t,cp[0][1],cp[1][1])
                return value(cb1,v,p,q)
            theta=Q(ch['theta']) if len(gs)==2 else Q(0)
            if len(gs)==2:
                theta=minimize_weight(ev,theta)
            assert 0<=theta<=1
            upper=ev(theta)
            candidate_choice=dict(groups=gs,refs=refs,theta=theta)
            olddomain=tuple(map(Q,ch.get('scale_domain',box['bounds'][2:4])))
            ocs=[self.component(rr,g,cb,olddomain) for rr,g in zip(ch['refs'],gs)]
            ot=Q(ch['theta'])
            if len(gs)==1:ov=self.gv[gs[0]];op,oq=ocs[0]
            else:ov=mix(ot,*[self.gv[g] for g in gs]);op=mix(ot,ocs[0][0],ocs[1][0]);oq=mix(ot,ocs[0][1],ocs[1][1])
            fallback=value(cb,ov,op,oq)
            if fallback<upper:
                upper=fallback;candidate_choice=dict(ch,scale_domain=olddomain)
            if all_groups:
                alt,choice=self.best_groups(cb)
                if alt<upper:upper,candidate_choice=alt,choice
            assert upper<=old
            children.append(dict(bounds=cb,choice=candidate_choice,upper=upper))
        new=max(c['upper'] for c in children)
        return dict(box=index,old_upper=old,new_upper=new,saving=old-new,old_decimal=float(old),new_decimal=float(new),saving_decimal=float(old-new),split=split,children=children)

def verify(c,result):
    for fn,digest in result['source_hashes'].items():
        assert hashlib.sha256((c.base/fn).read_bytes()).hexdigest()==digest
    c.nodes.extend(result['added_node_refs'])
    records=result['records'];ids=[r['box'] for r in records];assert len(ids)==len(set(ids))
    for r in records:
        index=r['box'];parent=c.cover['boxes'][index];bb=list(map(Q,parent['bounds']))
        if 'original'in parent and c.inh['boxes'][parent['original']].startswith('c|'):
            _,_,s=c.inh['boxes'][parent['original']].split('|');i,j,t=s.split(',')
            old=capvalue(c.env[int(i)],c.env[int(j)],Q(t),*bb[:2])
        else:old=c.exact_old(index)
        assert old==Q(r['old_upper'])==Q(parent['upper'])
        split=r['split'];expected=set()
        for ix in itertools.product(*[range(n) for n in split]):
            dom=[]
            for axis,n,k in zip(range(3),split,ix):
                a,b=bb[2*axis:2*axis+2];dom.extend([a+(b-a)*k/n,a+(b-a)*(k+1)/n])
            expected.add(tuple(dom))
        children=r['children'];actual=[tuple(map(Q,ch['bounds'])) for ch in children]
        assert len(actual)==len(set(actual)) and set(actual)==expected
        for ch,cb in zip(children,actual):
            if 'cap_choice'in ch:
                i,j,t=ch['cap_choice'];t=Q(t);assert 0<=t<=1
                v=capvalue(c.env[i],c.env[j],t,*cb[:2])
            else:
                choice=ch['choice'];gs=choice['groups'];t=Q(choice['theta']);assert 0<=t<=1
                domain=tuple(map(Q,choice.get('scale_domain',cb[2:4])))
                assert 0<=domain[0]<=cb[2]<cb[3]<=domain[1]
                cs=[c.component(rr,g,cb,domain) for rr,g in zip(choice['refs'],gs)]
                assert len(gs)==len(cs) and len(gs)in[1,2]
                if len(gs)==1:vv=c.gv[gs[0]];p,q=cs[0]
                else:vv=mix(t,*[c.gv[g] for g in gs]);p=mix(t,cs[0][0],cs[1][0]);q=mix(t,cs[0][1],cs[1][1])
                v=value(cb,vv,p,q)
            assert v==Q(ch['upper']) and v<=old
        assert max(Q(ch['upper']) for ch in children)==Q(r['new_upper'])
        assert old-Q(r['new_upper'])==Q(r['saving'])
    byid={r['box']:r for r in records}
    global_upper=max(Q(byid[i]['new_upper']) if i in byid else Q(b['upper']) for i,b in enumerate(c.cover['boxes']))
    assert global_upper==Q(result['global_upper'])
    return global_upper

def export(c,result,directory,ceiling=None):
    global_upper=verify(c,result)
    denominator=10**12
    if ceiling is None:ceiling=Q(-((-global_upper.numerator*denominator)//global_upper.denominator),denominator)
    assert 0<global_upper<=ceiling
    cover=copy.deepcopy(c.cover);inh=copy.deepcopy(c.inh);byid={r['box']:r for r in result['records']}
    boxes=[]
    for index,box in enumerate(cover['boxes']):
        if index not in byid:boxes.append(box);continue
        for child in byid[index]['children']:
            if 'choice'in child:boxes.append(dict(bounds=child['bounds'],choice=child['choice'],upper=child['upper']))
            else:
                i,j,t=child['cap_choice'];ref=len(inh['boxes'])
                inh['boxes'].append('c|'+','.join(map(str,child['bounds']))+'|'+','.join(map(str,[i,j,t])))
                boxes.append(dict(bounds=child['bounds'],original=ref,upper=child['upper']))
    cover['boxes']=boxes;cover['target']=str(ceiling);cover['box_max_rounded_up']=str(ceiling)
    reciprocal=1/ceiling
    lower=Q((reciprocal.numerator*denominator)//reciprocal.denominator,denominator)
    if lower*ceiling==1:lower-=Q(1,denominator)
    assert 0<lower and lower*ceiling<1
    cover['lower']=str(lower);cover['fails']=[]
    directory.mkdir(parents=True,exist_ok=False)
    for fn,data in [('cover.json',cover),('inherited.json',inh)]:
        (directory/fn).write_text(json.dumps(encode(data),indent=2)+'\n')
    (directory/'SHA256SUMS').write_text(''.join(hashlib.sha256((directory/fn).read_bytes()).hexdigest()+'  '+fn+'\n' for fn in ['cover.json','inherited.json']))
    print('exported',len(boxes),'boxes; cap',float(ceiling),'lower',float(lower),flush=True)

def main():
    if not __debug__:raise SystemExit('Reject -O/-OO: exact assertions required')
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--base',type=Path,default=Path(__file__).resolve().parents[1]/'handoff/lower-stein/cert-jointmoment-lifted-codex')
    ap.add_argument('--boxes',type=int,nargs='+')
    ap.add_argument('--target',type=Q)
    ap.add_argument('--split',type=int,nargs=3,default=[2,1,1])
    ap.add_argument('--pool',action='store_true',help='allow all existing node refs of the same groups')
    ap.add_argument('--all-groups',action='store_true',help='propose any one or two existing groups per child')
    ap.add_argument('--out',type=Path)
    ap.add_argument('--verify',type=Path,help='replay a saved exact assembly ledger')
    ap.add_argument('--export',type=Path,help='write a NEW full certificate package after replay')
    ap.add_argument('--ceiling',type=Q,help='rational target for exported full package')
    ap.add_argument('--prior',type=Path,help='retain an earlier ledger and refine its remaining blockers')
    a=ap.parse_args();assert all(n>=1 for n in a.split)
    c=Campaign(a.base)
    if a.verify:
        result=json.loads(a.verify.read_text());v=verify(c,result)
        print('PASS exact replacement grids and choice bounds; global',float(v),flush=True)
        if a.export:
            # export performs its own replay from a fresh campaign so source
            # node-reference extension cannot be applied twice.
            export(Campaign(a.base),result,a.export,a.ceiling)
        return
    prior=None
    if a.prior:
        prior=json.loads(a.prior.read_text());verify(c,prior)
    ids=a.boxes or (prior['remaining_blockers'] if prior else ([i for i,b in enumerate(c.cover['boxes']) if Q(b['upper'])>a.target] if a.target else [7234]))
    byid={r['box']:r for r in prior['records']} if prior else {}
    for i in ids:
        r=c.refine(i,tuple(a.split),a.pool,a.all_groups)
        if i not in byid or r['new_upper']<=Q(byid[i]['new_upper']):byid[i]=r
        print(r['box'],r['old_decimal'],r['new_decimal'],r['saving_decimal'],flush=True)
    records=[byid[i] for i in sorted(byid)]
    result=dict(scope=__doc__,source_hashes={fn:hashlib.sha256((a.base/fn).read_bytes()).hexdigest() for fn in ['cover.json','inherited.json']},records=records)
    result['added_node_refs']=c.nodes[c.original_node_count:]
    byid={r['box']:r for r in records}
    global_upper=max(Q(byid[i]['new_upper']) if i in byid else Q(b['upper']) for i,b in enumerate(c.cover['boxes']))
    result['global_upper']=global_upper;result['global_upper_decimal']=float(global_upper)
    result['target']=a.target;result['remaining_blockers']=[r['box'] for r in records if a.target and Q(r['new_upper'])>a.target]
    if a.out:a.out.parent.mkdir(parents=True,exist_ok=True);a.out.write_text(json.dumps(encode(result),indent=2)+'\n')
    print('global_upper',float(global_upper),'remaining_blockers',result['remaining_blockers'],flush=True)

if __name__=='__main__':main()

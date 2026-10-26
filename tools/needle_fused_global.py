#!/usr/bin/env python3
"""Exact fallback-covered global scan with two existing fused mixed-law nodes.

Only new research outputs are written. Discovery uses floating one-dimensional
weight minimization; all accepted whole-cell bounds and guillotine partition
events are replayed with rational arithmetic. No LP is run by this tool.
"""
import argparse
import copy
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import sys
import time

sys.dont_write_bytecode=True
sys.path.insert(0,str(Path(__file__).resolve().parent))
import rankone_law as L
from needle_cover_refine import Campaign as BaseCampaign,encode,mix,rowvector,value,value_float
from needle_unshifted_campaign import UnshiftedCampaign,evaluate_child
from needle_rankone_nodes import verify_unshifted

ROOT=Path(__file__).resolve().parents[1]
DATA=ROOT/'data/lower-unshifted'
DEFAULT=ROOT/'handoff/research-third-decimal/fused-global-20261023'
PACKET=ROOT/'handoff/research-third-decimal/adaptive-next-20261023/fused'
THETA=Q(177107909,800000000)
TAULO=Q(240482202779,1024000000000)
TAUHI=Q(30181976867,128000000000)
XMAX=Q(4,5)
DEPENDENCIES=['tools/needle_fused_global.py','tools/needle_unshifted_campaign.py',
 'tools/needle_cover_refine.py','tools/needle_rankone_nodes.py',
 'tools/rankone_law.py','tools/rankone_source_paths.py']


def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def relative(p):return str(Path(p).resolve().relative_to(ROOT))
def local(p):
    p=(ROOT/p).resolve(strict=True)
    assert p.is_relative_to(ROOT)and p.is_file(),'Input must be clone-local'
    return p
def write(p,d):
    p=Path(p).resolve()
    assert p.is_relative_to(ROOT)and not p.is_relative_to(DATA),'Research writes only'
    p.parent.mkdir(parents=True,exist_ok=True)
    t=p.with_name('.'+p.name+'.tmp')
    t.write_text(json.dumps(encode(d),indent=2)+'\n')
    t.replace(p)
def ceiling(v):return Q(-((-v.numerator*10**12)//v.denominator),10**12)
def source_descriptor(row):return dict(delta=row['delta'],smax=row['smax'],table=row['table'])
def descriptor_hash(row):return hashlib.sha256(json.dumps(source_descriptor(row),sort_keys=True,separators=(',',':')).encode()).hexdigest()


def prepare(out):
    """Preserve the complete certified baseline, plus self-contained new nodes."""
    out.mkdir(parents=True,exist_ok=True)
    baseline=out/'inputs/baseline-cover.json'
    blob=(DATA/'cover.json').read_bytes()
    assert hashlib.sha256(blob).hexdigest()=='3068afebb149a44e8fa6fb092a3084a5d90246fe72a42665984a1beb5677fbd3'
    baseline.parent.mkdir(parents=True,exist_ok=True)
    if baseline.exists():assert baseline.read_bytes()==blob
    else:
        t=baseline.with_name('.'+baseline.name+'.tmp');t.write_bytes(blob);t.replace(baseline)
    rows=json.loads((DATA/'inputs/inherited.json').read_text())['rows']
    mapping={}
    for label,file,proof_file in [('lo','NODE-lo.json','ENDPOINT-lo.json'),('hi','REFUSION-NODE-hi.json','REFUSION-ENDPOINT-hi.json')]:
        n=json.loads((PACKET/file).read_text());d=json.loads((PACKET/proof_file).read_text())
        assert sha(PACKET/file)==d['node_sha256']and list(map(Q,n['P']))==list(map(Q,d['accepted']['P']))
        assert n['i']==14 and n['j']==15 and Q(n['theta'])==THETA
        assert Q(n['tau'])==[TAULO,TAUHI][label=='hi']and Q(n['nu'])==0
        assert Q(n['sixth_joint']['xmax'])==XMAX
        wrapper=dict(format='needle-unshifted-mixed-spectral/v1',witness=n,
                     source_weights=[[14,1-THETA],[15,THETA]],
                     inherited=relative(DATA/'inputs/inherited.json'),
                     inherited_sha256=sha(DATA/'inputs/inherited.json'),
                     source_tables_sha256={str(i):descriptor_hash(rows[i])for i in [14,15]},
                     x_interval=[Q(0),XMAX],proof=d['accepted']['proof'],
                     original_node_sha256=sha(PACKET/file),
                     provenance_only_original_file=relative(PACKET/file),
                     provenance_only_hybrid_sha256=sha(PACKET/'HYBRID.json'),
                     scope='Actual original-row mixed source and fixed actual tau. No shifted source or new source cap. Full witness payload allows replay without opening provenance-only paths.')
        p=out/'nodes'/('fused-'+label+'.json');write(p,wrapper)
        mapping['fused-'+label]=dict(path=relative(p),sha256=sha(p))
    write(out/'nodes.json',mapping)
    return baseline


def verify_mixed(path):
    n=json.loads(path.read_text())
    assert n['format']=='needle-unshifted-mixed-spectral/v1'
    ip=local(n['inherited']);assert ip==(DATA/'inputs/inherited.json').resolve(),'Mixed node must use the original NodeCaps source rows'
    assert sha(ip)==n['inherited_sha256']
    rows=json.loads(ip.read_text())['rows'];w=n['witness'];i,j=w['i'],w['j'];theta=Q(w['theta'])
    assert 0<=i<=j<len(rows)and 0<=theta<=1 and Q(w['nu'])==0
    weights={i:1-theta};weights[j]=weights.get(j,Q(0))+theta
    weights={k:a for k,a in weights.items()if a}
    assert n['source_weights']==[[k,str(a)]for k,a in sorted(weights.items())]
    assert n['source_tables_sha256']=={str(k):descriptor_hash(rows[k])for k in [i,j]}
    assert list(map(Q,n['x_interval']))==[0,Q(w.get('sixth_joint',{}).get('xmax',Q(31,4)))]
    assert Q(w['P'][1])>=0 and Q(w['P'][4])>=0
    L.verify_tensor_budget(w)
    source=L.mixture_source([(1-theta,L.source_from_table(rows[i]['table'],rows[i]['smax'],Q(rows[i]['delta']))),
                             (theta,L.source_from_table(rows[j]['table'],rows[j]['smax'],Q(rows[j]['delta'])))])
    rv,cuts=L.spectral_pieces(w)
    proof=L.verify_node(source,Q(w['tau']),list(map(Q,w['P'])),rv,cuts,depth=9)
    assert proof==n['proof']
    return n


class FusedCampaign(UnshiftedCampaign):
    def __init__(self,baseline,mapping,check_nodes=True,added_source_refs=None):
        # The preserved certified baseline supplies its ORIGINAL pure-node map.
        # Canonical cover.json/nodes.json may already have been promoted; neither
        # is opened by acceptance/replay. Original row/recipe inputs stay pinned.
        BaseCampaign.__init__(self,DATA/'inputs')
        manifest=json.loads((DATA/'inputs/source-manifest.json').read_text())
        for label,h in manifest['immutable_inputs'].items():
            name=Path(label).name
            assert name in ['inherited.json','cover.json','minimal-cover-ledger.json']
            assert sha(DATA/'inputs'/name)==h
        for p,h in manifest['durable_copies'].items():assert sha(local(p))==h
        assert sha(DATA/'inputs/current-cover.json')==manifest['current_cover_sha256']
        self.cover=json.loads((DATA/'inputs/current-cover.json').read_text())
        self.nodes=self.cover['nodes'];self.directory=DATA
        frozen=json.loads(baseline.read_text())
        assert len(frozen['boxes'])==10521 and frozen['fails']==[]
        self.mapping=copy.deepcopy(frozen['u_nodes']);self.udocs={}
        for name,record in sorted(self.mapping.items()):
            p=local(record['path']);assert sha(p)==record['sha256']
            n=json.loads(p.read_text());assert n['format']=='needle-unshifted-explicit-scale/v1'
            if check_nodes:verify_unshifted(p)
            self.udocs[name]=n
        assert frozen['groups']==self.cover['groups']and frozen['newnodes']==self.cover['newnodes']
        self.cover=copy.deepcopy(frozen);self.nodes=self.cover['nodes']
        self.frozen=frozen;self.old_group_count=len(self.gv)
        self.fused_group=len(self.gv)
        self.cover['groups'].append(dict(weights=[[14,str(1-THETA)],[15,str(THETA)]]))
        self.gv.append(mix(THETA,self.rv[14],self.rv[15]))
        for name,record in sorted(mapping.items()):
            p=local(record['path']);assert sha(p)==record['sha256']
            n=verify_mixed(p)if check_nodes else json.loads(p.read_text())
            assert any(group['weights']==n['source_weights']for group in self.cover['groups']),'Unknown source potential'
            self.udocs[name]=n;self.mapping[name]=record
            assert ['u',name]not in self.nodes
            self.nodes.append(['u',name])
        self.cover['u_nodes']=self.mapping
        self.fused_refs=[self.nodes.index(['u','fused-lo']),self.nodes.index(['u','fused-hi'])]
        for ref in added_source_refs or []:
            assert ref not in self.nodes and ref[0]in['s','z']
            assert isinstance(ref[1],int)and 0<=ref[1]<len(self.rows)
            if ref[0]=='s':
                assert len(ref)==4 and all(isinstance(k,int)for k in ref[1:])
                assert 0<=ref[2]<len(self.rows[ref[1]]['cells'])
                assert 0<=ref[3]<len(self.rows[ref[1]]['cells'][ref[2]]['nodes'])
            else:assert len(ref)==2
            self.nodes.append(ref)

    def node(self,index,group,xu):
        ref=self.nodes[index]
        if ref[0]!='u'or'source_weights'not in self.udocs[ref[1]]:
            return super().node(index,group,xu)
        n=self.udocs[ref[1]]
        expected=tuple((int(i),Q(w))for i,w in self.cover['groups'][group]['weights'])
        assert expected==tuple((int(i),Q(w))for i,w in n['source_weights'])
        xa,xb=map(Q,n['x_interval']);assert xa==0 and xu<=xb
        p=tuple(map(Q,n['witness']['P']));assert p[1]>=0 and p[4]>=0
        return Q(n['witness']['tau']),p

    def pool(self,g,xu):
        if g==self.fused_group:
            return [k for k in self.fused_refs if self.node(k,g,xu)]
        # Exclude mixed wrappers from the inherited pure-u implementation.
        result=[];wanted=tuple((int(i),Q(w))for i,w in self.cover['groups'][g]['weights'])
        for k,ref in enumerate(self.nodes):
            if ref[0]=='u'and'source_weights'in self.udocs[ref[1]]:continue
            try:self.node(k,g,xu)
            except AssertionError:continue
            result.append(k)
        return result


def recipe_value(c,bounds,recipe):
    bb=list(map(Q,bounds));assert len(bb)==6 and all(bb[2*k]<bb[2*k+1]for k in range(3))
    assert set(recipe)in[{'choice'},{'cap_choice'}]
    if'cap_choice'in recipe:
        i,j,t=recipe['cap_choice'];assert 0<=i<len(c.env)and 0<=j<len(c.env)and 0<=Q(t)<=1
    else:
        ch=recipe['choice'];assert len(ch['groups'])in[1,2]and len(ch['refs'])==len(ch['groups'])
        assert all(isinstance(g,int)and 0<=g<len(c.gv)for g in ch['groups'])
        assert 0<=Q(ch['theta'])<=1
        assert all(len(rr)==4 and all(isinstance(k,int)and 0<=k<len(c.nodes)for k in rr)for rr in ch['refs'])
        dom=list(map(Q,ch['scale_domain']));assert 0<=dom[0]<=bb[2]<bb[3]<=dom[1]
    return evaluate_child(c,dict(bounds=bb,**recipe))


def normalize(c,index,box):
    assert ('choice'in box)^('cap_choice'in box)
    recipe={k:copy.deepcopy(box[k])for k in ['choice','cap_choice']if k in box}
    if'choice'in recipe:recipe['choice'].setdefault('scale_domain',box['bounds'][2:4])
    bounds=list(map(Q,box['bounds']));upper=recipe_value(c,bounds,recipe)
    assert upper==Q(box['upper']),('Certified baseline mismatch',index)
    return dict(id='b'+str(index),base_index=index,bounds=bounds,upper=upper,recipe=recipe,depth=0)


def restriction(c,parent,bounds,name):
    recipe=copy.deepcopy(parent['recipe']);upper=recipe_value(c,bounds,recipe)
    assert upper<=Q(parent['upper'])
    return dict(id=name,base_index=parent['base_index'],bounds=list(bounds),upper=upper,recipe=recipe,depth=parent['depth']+1)


def apply_event(c,active,event,check=True):
    parent=active[event['parent']]
    if event['kind']=='reprice':
        child=event['child']
        assert child['id']==parent['id']and list(map(Q,child['bounds']))==list(map(Q,parent['bounds']))
        assert child['base_index']==parent['base_index']and child['depth']==parent['depth']
        assert Q(child['upper'])<=Q(parent['upper'])
        if check:assert recipe_value(c,child['bounds'],child['recipe'])==Q(child['upper'])
        active[parent['id']]=child;return
    assert event['kind']=='split'
    bb=list(map(Q,parent['bounds']));axis=event['axis'];mid=Q(event['mid'])
    assert axis in[0,1,2]and bb[2*axis]<mid<bb[2*axis+1]
    assert bb==list(map(Q,event['parent_bounds']))
    a,b=list(bb),list(bb);a[2*axis+1]=mid;b[2*axis]=mid
    children=event['children'];assert len(children)==2
    assert [list(map(Q,ch['bounds']))for ch in children]==[a,b]
    del active[parent['id']]
    for suffix,ch in zip(['0','1'],children):
        assert ch['id']==parent['id']+'.'+suffix and ch['id']not in active
        assert ch['base_index']==parent['base_index']and ch['depth']==parent['depth']+1
        assert Q(ch['upper'])<=Q(parent['upper'])
        if check:assert recipe_value(c,ch['bounds'],ch['recipe'])==Q(ch['upper'])
        active[ch['id']]=ch


def legal(bounds):
    b=list(map(Q,bounds));return TAULO<=b[2]<b[3]<=TAUHI and 0<=b[4]<b[5]<=XMAX
def intersects(bounds):
    b=list(map(Q,bounds));return max(b[2],TAULO)<min(b[3],TAUHI)and b[4]<XMAX and b[5]>0


def split_legal(c,active,events,parent):
    if not intersects(parent['bounds']):return
    for axis,cut in [(1,TAULO),(1,TAUHI),(2,XMAX)]:
        bb=parent['bounds']
        if bb[2*axis]<cut<bb[2*axis+1]:
            a,b=list(bb),list(bb);a[2*axis+1]=cut;b[2*axis]=cut
            children=[restriction(c,parent,a,parent['id']+'.0'),restriction(c,parent,b,parent['id']+'.1')]
            ev=dict(kind='split',parent=parent['id'],parent_bounds=bb,axis=axis,mid=cut,children=children)
            apply_event(c,active,ev,False);events.append(ev)
            for ch in children:split_legal(c,active,events,ch)
            return


def golden(ev):
    lo,hi=0.,1.;phi=(5**.5-1)/2;x=hi-phi*(hi-lo);y=lo+phi*(hi-lo);fx,fy=ev(x),ev(y)
    for _ in range(45):
        if fx<=fy:hi,y,fy=y,x,fx;x=hi-phi*(hi-lo);fx=ev(x)
        else:lo,x,fx=x,y,fy;y=lo+phi*(hi-lo);fy=ev(y)
    return Q(round((lo+hi)/2*10**9),10**9)


def best_fused(c,parent):
    bb=list(map(Q,parent['bounds']));assert legal(bb)
    fg=c.fused_group;refs=c.fused_refs*2
    fp,fq=c.component(refs,fg,bb,[TAULO,TAUHI]);fv=c.gv[fg]
    candidates=[(value(bb,fv,fp,fq),dict(groups=[fg],refs=[refs],theta=Q(0),scale_domain=bb[2:4]))]
    bf=list(map(float,bb));ff=tuple(map(float,fv));pf,qf=tuple(map(float,fp)),tuple(map(float,fq))
    for g in range(c.old_group_count):
        try:
            lo,p=c.endpoint_pool([],g,bb[2],bb);hi,q=c.endpoint_pool([],g,bb[3],bb)
        except AssertionError:continue
        ov=c.gv[g];vf,op,oq=tuple(map(float,ov)),tuple(map(float,p)),tuple(map(float,q))
        def ev(t):return value_float(bf,mix(t,vf,ff),mix(t,op,pf),mix(t,oq,qf))
        th=golden(ev)
        # Exact acceptance does not rely on convexity or precision of the search.
        for t in [th,Q(0),Q(1)]:
            v=mix(t,ov,fv);pp,qq=mix(t,p,fp),mix(t,q,fq)
            upper=value(bb,v,pp,qq)
            candidates.append((upper,dict(groups=[g,fg],refs=[lo+hi,refs],theta=t,scale_domain=bb[2:4])))
    upper,choice=min(candidates,key=lambda z:z[0]);recipe={'choice':choice}
    assert recipe_value(c,bb,recipe)==upper
    return dict(parent,upper=upper,recipe=recipe)if upper<Q(parent['upper'])else parent


def pins(baseline,mapping):
    files=[baseline,DATA/'inputs/source-manifest.json',DATA/'inputs/current-cover.json',
           DATA/'inputs/inherited.json',DATA/'inputs/cover.json',DATA/'inputs/minimal-cover-ledger.json']
    old=json.loads(Path(baseline).read_text())['u_nodes']
    files += [local(r['path'])for r in list(old.values())+list(mapping.values())]
    return {relative(p):sha(p)for p in files}


def ordered(active):return sorted(active.values(),key=lambda x:(x['base_index'],x['id']))


def save(out,c,baseline,mapping,active,events,before,target,stats,elapsed):
    leaves=ordered(active);upper=max(Q(v['upper'])for v in leaves);B=ceiling(upper);q=1/B
    low=Q(q.numerator*10**12//q.denominator,10**12)
    if low*B==1:low-=Q(1,10**12)
    remaining=[v for v in sorted(leaves,key=lambda z:Q(z['upper']),reverse=True)if Q(v['upper'])>target]
    full=copy.deepcopy(c.cover);full['boxes']=[dict(bounds=v['bounds'],upper=v['upper'],**v['recipe'])for v in leaves]
    full.update(target=B,box_max_rounded_up=B,lower=low,fails=[])
    write(out/'cover.json',full)
    report=dict(format='fused-node-complete-global-scan/v1',status='COMPLETE_FALLBACK_COVER',
                baseline=relative(baseline),baseline_boxes=len(c.frozen['boxes']),source_sha256=before,
                dependency_sha256={name:sha(ROOT/name)for name in DEPENDENCIES},
                new_nodes=mapping,nodes=c.nodes,groups=c.cover['groups'],newnodes=c.cover['newnodes'],
                target=target,actual_upper=upper,actual_upper_decimal=float(upper),
                best_complete_B=B,best_complete_L=low,boxes=len(leaves),events=events,stats=stats,
                remaining_count=len(remaining),remaining=remaining,
                active_barriers=[dict(id=v['id'],base_index=v['base_index'],bounds=v['bounds'],upper=v['upper'],
                                      recipe=v['recipe'],fused_legal=legal(v['bounds']))for v in sorted(leaves,key=lambda z:Q(z['upper']),reverse=True)[:30]],
                cover_sha256=sha(out/'cover.json'),elapsed_seconds=elapsed,
                frozen_inputs_unchanged=pins(baseline,mapping)==before,
                scope='Complete exact fallback-covered research cover. Only existing accepted original-source fused nodes; unchanged NodeCaps, no LP. No Lean/global endpoint until full export and native checks.')
    assert report['frozen_inputs_unchanged']
    write(out/'SCAN.json',report)
    return report


def verify(ledger,check_nodes=True):
    start=time.monotonic();d=json.loads(ledger.read_text());baseline=local(d['baseline']);mapping=d['new_nodes']
    assert pins(baseline,mapping)==d['source_sha256']
    assert d['dependency_sha256']=={name:sha(ROOT/name)for name in DEPENDENCIES}
    c=FusedCampaign(baseline,mapping,check_nodes,d.get('added_source_refs',[]))
    assert c.nodes==d['nodes']and c.cover['groups']==d['groups']and c.cover['newnodes']==d['newnodes']
    roots={}
    for i,b in enumerate(c.frozen['boxes']):
        v=normalize(c,i,b);roots[v['id']]=v
    for ev in d['events']:apply_event(c,roots,ev)
    leaves=ordered(roots)
    assert len(leaves)==d['boxes']
    upper=max(Q(v['upper'])for v in leaves)
    assert upper==Q(d['actual_upper'])and ceiling(upper)==Q(d['best_complete_B'])
    assert 0<Q(d['best_complete_L'])*Q(d['best_complete_B'])<1
    assert sum(Q(v['upper'])>Q(d['target'])for v in leaves)==d['remaining_count']
    for v in leaves:assert recipe_value(c,v['bounds'],v['recipe'])==Q(v['upper'])
    cover=ledger.parent/'cover.json';assert sha(cover)==d['cover_sha256']
    actual=json.loads(cover.read_text());assert actual['boxes']==encode([dict(bounds=v['bounds'],upper=v['upper'],**v['recipe'])for v in leaves])
    assert actual['nodes']==d['nodes']and actual['groups']==d['groups']and actual['newnodes']==d['newnodes']
    assert actual['u_nodes']==c.mapping and actual['fails']==[]
    assert Q(actual['target'])==Q(d['best_complete_B'])and Q(actual['lower'])==Q(d['best_complete_L'])
    assert pins(baseline,mapping)==d['source_sha256']
    report=dict(status='PASS_EXACT_COMPLETE_GLOBAL_PARTITION_AND_RECIPES',boxes=len(leaves),events=len(d['events']),
                actual_upper=upper,actual_upper_decimal=float(upper),remaining_count=d['remaining_count'],
                scan_sha256=sha(ledger),cover_sha256=sha(cover),elapsed_seconds=time.monotonic()-start,
                scope='No search/LP. Hash-pinned accepted mixed nodes, complete binary partition and every rational box recipe replayed. No new Lean theorem.')
    if not ledger.parent.resolve().is_relative_to(DATA.resolve()):write(ledger.parent/'REPLAY.json',report)
    print(json.dumps(encode(report)),flush=True)
    return report


def scan(args):
    start=time.monotonic();out=args.out.resolve();baseline=prepare(out)
    mapping=json.loads((out/'nodes.json').read_text());before=pins(baseline,mapping)
    c=FusedCampaign(baseline,mapping)
    active={}
    for i,b in enumerate(c.frozen['boxes']):
        v=normalize(c,i,b);active[v['id']]=v
    print('BASELINE_EXACT',len(active),'SECONDS',time.monotonic()-start,flush=True)
    events=[];hit=sum(intersects(v['bounds'])for v in active.values())
    for parent in list(active.values()):split_legal(c,active,events,parent)
    legal_ids=[v['id']for v in ordered(active)if legal(v['bounds'])]
    stats=dict(initial_intersections=hit,legal_children=len(legal_ids),face_splits=len(events),reprices=0,
               baseline_upper=max(Q(b['upper'])for b in c.frozen['boxes']))
    for count,k in enumerate(legal_ids):
        parent=active[k];candidate=best_fused(c,parent)
        if candidate is not parent:
            ev=dict(kind='reprice',parent=parent['id'],child=candidate);apply_event(c,active,ev,False);events.append(ev);stats['reprices']+=1
        if (count+1)%25==0 or count+1==len(legal_ids):
            stats['processed_legal']=count+1
            r=save(out,c,baseline,mapping,active,events,before,args.target,stats,time.monotonic()-start)
            print('SCAN',count+1,'/',len(legal_ids),'IMPROVED',stats['reprices'],'MAX',r['actual_upper_decimal'],'REMAINING',r['remaining_count'],flush=True)
    stats['processed_legal']=len(legal_ids)
    r=save(out,c,baseline,mapping,active,events,before,args.target,stats,time.monotonic()-start)
    print(json.dumps(encode({k:r[k]for k in ['status','actual_upper_decimal','best_complete_B','best_complete_L','boxes','remaining_count','stats','elapsed_seconds']})),flush=True)


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--out',type=Path,default=DEFAULT)
    ap.add_argument('--target',type=Q,default=Q('0.71342'))
    ap.add_argument('--verify',type=Path)
    a=ap.parse_args()
    if a.verify:verify(a.verify.resolve())
    else:scan(a)


if __name__=='__main__':
    if not __debug__:raise SystemExit('Assertions must be enabled')
    main()

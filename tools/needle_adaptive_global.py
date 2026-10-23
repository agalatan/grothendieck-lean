#!/usr/bin/env python3
"""Bounded exploratory global cover using existing exact law-node recipes.

Frozen inputs are read only. Floating proposal search is followed by exact
rational acceptance. A forest of binary guillotine splits and same-domain
repricings is replayed from every frozen box, preserving inherited scale
intervals. No new Gaussian cap, node, or analytic hypothesis is introduced.
"""
import argparse
import copy
from fractions import Fraction as Q
import hashlib
import itertools
import json
from pathlib import Path
import signal
import sys
import time

sys.dont_write_bytecode=True
sys.path.insert(0,str(Path(__file__).resolve().parent))
from needle_cover_refine import encode
from needle_unshifted_campaign import UnshiftedCampaign,evaluate_child

ROOT=Path(__file__).resolve().parents[1]
DATA=ROOT/'data/lower-unshifted'
OUT=ROOT/'handoff/research-third-decimal/adaptive-global-20261023'
LOCAL=ROOT/'handoff/research-third-decimal/law-node-forward-20261023/ADAPTIVE.json'
PIN_OVERRIDES={}
GENERATION_TOOLS=[]
DEPENDENCIES=['tools/needle_adaptive_global.py','tools/needle_unshifted_campaign.py',
 'tools/needle_cover_refine.py','tools/needle_rankone_nodes.py','tools/rankone_law.py','tools/rankone_source_paths.py']

def sha(path):return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def write(path,doc):
    path=Path(path);assert not path.resolve().is_relative_to(DATA.resolve())
    path.parent.mkdir(parents=True,exist_ok=True)
    p=path.with_name('.'+path.name+'.tmp');p.write_text(json.dumps(encode(doc),indent=2)+'\n');p.replace(path)

def input_path(path):
    label=str(Path(path).relative_to(ROOT))
    selected=PIN_OVERRIDES.get(label,Path(path)).resolve(strict=True)
    assert selected.is_relative_to(ROOT)and selected.is_file(),'Input must remain in current clone'
    return selected

def pins():
    names=['cover.json','cover-ledger.json','nodes.json','inputs/source-manifest.json',
      'inputs/current-cover.json','inputs/inherited.json','inputs/cover.json','inputs/minimal-cover-ledger.json']
    paths=[DATA/name for name in names]
    paths += [ROOT/v['path']for _,v in sorted(json.loads((DATA/'nodes.json').read_text()).items())]
    return {str(p.relative_to(ROOT)):sha(input_path(p))for p in paths}

def recipe_value(c,bounds,recipe):
    bb=list(map(Q,bounds));assert len(bb)==6 and all(bb[2*k]<bb[2*k+1]for k in range(3))
    assert set(recipe)in[{'choice'},{'cap_choice'}]
    if 'cap_choice'in recipe:
        i,j,t=recipe['cap_choice'];assert isinstance(i,int)and isinstance(j,int)
        assert 0<=i<len(c.env)and 0<=j<len(c.env)and 0<=Q(t)<=1
    else:
        ch=recipe['choice'];gs=ch['groups'];refs=ch['refs']
        assert len(gs)in[1,2]and len(gs)==len(refs)and 0<=Q(ch['theta'])<=1
        assert all(isinstance(g,int)and 0<=g<len(c.gv)for g in gs)
        assert all(len(rr)==4 and all(isinstance(i,int)and 0<=i<len(c.nodes)for i in rr)for rr in refs)
        dom=list(map(Q,ch['scale_domain']));assert len(dom)==2 and 0<=dom[0]<=bb[2]<bb[3]<=dom[1]
    return evaluate_child(c,dict(bounds=bb,**recipe))

def normalize(c,index,box):
    bb=list(map(Q,box['bounds']))
    if 'cap_choice'in box:recipe={'cap_choice':copy.deepcopy(box['cap_choice'])}
    elif 'choice'in box:recipe={'choice':copy.deepcopy(box['choice'])}
    else:
        raw=c.inh['boxes'][box['original']];kind,_,*fields=raw.split('|')
        if kind=='c':
            i,j,t=fields[0].split(',');recipe={'cap_choice':[int(i),int(j),Q(t)]}
        else:
            assert kind=='s';recipe={'choice':copy.deepcopy(c.normalized_box(index)['choice'])}
    if 'choice'in recipe:recipe['choice'].setdefault('scale_domain',bb[2:4])
    v=recipe_value(c,bb,recipe);assert v==Q(box['upper']),('Frozen bound mismatch',index)
    return dict(id=f'b{index}',base_index=index,bounds=bb,upper=v,recipe=recipe,depth=0)

def setup():
    before=pins();c=UnshiftedCampaign(DATA)
    frozen=json.loads(input_path(DATA/'cover.json').read_text())
    assert frozen['fails']==[]and len(frozen['boxes'])==10234
    assert frozen['groups']==c.cover['groups']and frozen['newnodes']==c.cover['newnodes']
    assert frozen['nodes']==c.nodes and frozen['u_nodes']==c.mapping
    c.cover=copy.deepcopy(frozen);c.nodes=c.cover['nodes'];n=len(c.nodes)
    leaves={}
    for i,box in enumerate(c.cover['boxes']):
        leaf=normalize(c,i,box);leaves[leaf['id']]=leaf
    assert c.nodes[:n]==frozen['nodes']
    assert all(ref[0]in['s','z']for ref in c.nodes[n:]),'Only inherited source references may be exposed by normalization'
    assert pins()==before
    return c,frozen,leaves,before

def restriction(c,parent,bounds,name):
    recipe=copy.deepcopy(parent['recipe']);v=recipe_value(c,bounds,recipe)
    assert v<=Q(parent['upper'])
    return dict(id=name,base_index=parent['base_index'],bounds=list(bounds),upper=v,
                recipe=recipe,depth=parent['depth']+1)

def split_event(parent,axis,mid,children):
    return dict(kind='split',parent=parent['id'],parent_bounds=parent['bounds'],axis=axis,mid=mid,children=children)

def decoded_leaf(raw):
    leaf=copy.deepcopy(raw);leaf['bounds']=list(map(Q,leaf['bounds']));leaf['upper']=Q(leaf['upper'])
    return leaf

def apply_event(c,active,event,exact=True):
    if event['kind']=='reprice':
        parent=active[event['parent']];child=decoded_leaf(event['child'])
        assert child['id']==parent['id']and child['bounds']==list(map(Q,parent['bounds']))
        assert child['depth']==parent['depth']and child['base_index']==parent['base_index']
        assert Q(child['upper'])<=Q(parent['upper'])
        if exact:assert recipe_value(c,child['bounds'],child['recipe'])==Q(child['upper'])
        active[parent['id']]=child;return
    assert event['kind']=='split';parent=active.pop(event['parent'])
    bb=list(map(Q,parent['bounds']));assert bb==list(map(Q,event['parent_bounds']))
    axis,mid=event['axis'],Q(event['mid']);assert axis in[0,1,2]and bb[2*axis]<mid<bb[2*axis+1]
    a,b=list(bb),list(bb);a[2*axis+1]=mid;b[2*axis]=mid
    children=[decoded_leaf(ch)for ch in event['children']];assert len(children)==2
    assert [list(map(Q,ch['bounds']))for ch in children]==[a,b]
    for suffix,ch in zip(['0','1'],children):
        assert ch['id']==parent['id']+'.'+suffix and ch['id']not in active
        assert ch['depth']==parent['depth']+1 and ch['base_index']==parent['base_index']
        assert Q(ch['upper'])<=Q(parent['upper'])
        if exact:assert recipe_value(c,ch['bounds'],ch['recipe'])==Q(ch['upper'])
        active[ch['id']]=ch

def splice_local(c,active,local):
    assert local['status']=='COMPLETE_LOCAL_CAP194'and local['failing_leaves']==0
    assert local['source_sha256']==pins()
    targets=local['frontier'];doms=[list(map(Q,t['bounds']))for t in targets]
    outer=[min(b[0]for b in doms),max(b[1]for b in doms),min(b[2]for b in doms),max(b[3]for b in doms),min(b[4]for b in doms),max(b[5]for b in doms)]
    roots=[v for v in active.values()if all(outer[2*k]<=v['bounds'][2*k]<v['bounds'][2*k+1]<=outer[2*k+1]for k in range(3))]
    assert len(roots)==2 and all(r['recipe'].get('cap_choice',[None])[0]==13 for r in roots)
    events=[]
    def build(parent,indices):
        bb=parent['bounds']
        if len(indices)==1:
            t=targets[indices[0]];assert bb==list(map(Q,t['bounds']))
            recipe=copy.deepcopy(t['recipe']);v=recipe_value(c,bb,recipe);assert v==Q(t['upper'])
            if v<parent['upper']:
                child=dict(parent,upper=v,recipe=recipe)
                ev=dict(kind='reprice',parent=parent['id'],child=child);apply_event(c,active,ev);events.append(ev)
            return
        for axis in range(3):
            for mid in sorted({doms[i][2*axis+1]for i in indices}):
                if not bb[2*axis]<mid<bb[2*axis+1]:continue
                left=[i for i in indices if doms[i][2*axis+1]<=mid]
                right=[i for i in indices if doms[i][2*axis]>=mid]
                if left and right and len(left)+len(right)==len(indices):break
            else:continue
            break
        else:raise AssertionError('Local adaptive cells are not a guillotine partition')
        a,b=list(bb),list(bb);a[2*axis+1]=mid;b[2*axis]=mid
        children=[restriction(c,parent,a,parent['id']+'.0'),restriction(c,parent,b,parent['id']+'.1')]
        ev=split_event(parent,axis,mid,children);apply_event(c,active,ev);events.append(ev)
        build(children[0],left);build(children[1],right)
    covered=[]
    for root in roots:
        ids=[i for i,b in enumerate(doms)if all(root['bounds'][2*k]<=b[2*k]<b[2*k+1]<=root['bounds'][2*k+1]for k in range(3))]
        covered+=ids;build(root,ids)
    assert sorted(covered)==list(range(len(targets)))
    assert len(active)==10234-2+174
    return events

def best(c,parent,bounds,name=None):
    leaf=restriction(c,parent,bounds,name or parent['id'])
    if name is None:leaf['depth']=parent['depth']
    try:v,choice=c.best_groups(bounds)
    except AssertionError as exc:
        if str(exc):raise
        return leaf
    choice=copy.deepcopy(choice);choice['scale_domain']=bounds[2:4];recipe={'choice':choice}
    assert recipe_value(c,bounds,recipe)==v
    leaf['proposal_upper']=v
    if v<leaf['upper']:leaf['upper'],leaf['recipe']=v,recipe
    return leaf

def ordered(active):
    return sorted(active.values(),key=lambda v:(v['base_index'],v['id']))

def ceiling(value,den=10**12):return Q(-((-value.numerator*den)//value.denominator),den)

def manifest(c,frozen,active,events,before,target,local_sha,stages,elapsed):
    upper=max(Q(v['upper'])for v in active.values());B=ceiling(upper);q=1/B
    L=Q(q.numerator*10**12//q.denominator,10**12)
    if L*B==1:L-=Q(1,10**12)
    bad=[v for v in active.values()if Q(v['upper'])>target]
    return dict(format='needle-adaptive-global/v1',status='COMPLETE_REQUESTED_TARGET'if not bad else'VALID_COMPLETE_COVER_ABOVE_REQUESTED_TARGET',
      source_sha256=before,dependency_sha256={n:sha(ROOT/n)for n in DEPENDENCIES},local_adaptive_sha256=local_sha,
      base_boxes=len(frozen['boxes']),nodes=c.nodes,u_nodes=c.mapping,target=target,actual_upper=upper,
      actual_upper_decimal=float(upper),best_complete_B=B,best_complete_L=L,boxes=len(active),
      additional_leaves=len(active)-len(frozen['boxes']),events=events,stages=stages,elapsed_seconds=elapsed,
      remaining=[dict(id=v['id'],bounds=v['bounds'],upper=v['upper'],recipe=v['recipe'])for v in sorted(bad,key=lambda z:z['upper'],reverse=True)],
      frozen_data_unchanged=pins()==before,
      scope='Exploratory complete rational cover under the unchanged NodeCaps; no new Lean endpoint until full partition/export/native checks.')

def replay(c,frozen,roots,doc):
    assert doc['source_sha256']==pins()and doc['nodes']==c.nodes and doc['u_nodes']==c.mapping
    for name,digest in doc['dependency_sha256'].items():
        assert name in DEPENDENCIES
        choices=[ROOT/name]+(GENERATION_TOOLS if name=='tools/needle_adaptive_global.py'else[])
        assert any(sha(p)==digest for p in choices),('Generator dependency hash mismatch',name)
    assert set(doc['dependency_sha256'])==set(DEPENDENCIES)
    active=copy.deepcopy(roots)
    for event in doc['events']:apply_event(c,active,event)
    assert len(active)==doc['boxes']and len(active)<=len(roots)+3000
    upper=Q(0)
    for v in active.values():
        assert recipe_value(c,v['bounds'],v['recipe'])==Q(v['upper']);upper=max(upper,Q(v['upper']))
    assert upper==Q(doc['actual_upper'])and ceiling(upper)==Q(doc['best_complete_B'])
    assert 0<Q(doc['best_complete_L'])*Q(doc['best_complete_B'])<1
    assert sorted(v['id']for v in active.values()if Q(v['upper'])>Q(doc['target']))==sorted(v['id']for v in doc['remaining'])
    return active

class WallBudget(Exception):pass

def stage(c,active,events,target,seconds,max_leaves,checkpoint):
    start=time.monotonic();initial=len(active);initial_bad=sum(v['upper']>target for v in active.values())
    previous=signal.getsignal(signal.SIGALRM)
    def alarm(_s,_f):raise WallBudget()
    signal.signal(signal.SIGALRM,alarm);signal.setitimer(signal.ITIMER_REAL,seconds)
    attempts=0;splits=0;reprices=0;termination='target_cleared'
    try:
        while True:
            bad=[v for v in active.values()if v['upper']>target]
            if not bad:break
            if len(active)>=max_leaves:termination='leaf_budget';break
            parent=max(bad,key=lambda v:v['upper']);attempts+=1
            candidate=best(c,parent,parent['bounds'])
            if candidate['upper']<parent['upper']:
                ev=dict(kind='reprice',parent=parent['id'],child=candidate)
                mask=signal.pthread_sigmask(signal.SIG_BLOCK,{signal.SIGALRM})
                try:apply_event(c,active,ev,exact=False);events.append(ev);reprices+=1
                finally:signal.pthread_sigmask(signal.SIG_SETMASK,mask)
                parent=candidate
                if parent['upper']<=target:continue
            options=[]
            for axis in range(3):
                bb=parent['bounds'];mid=(bb[2*axis]+bb[2*axis+1])/2
                a,b=list(bb),list(bb);a[2*axis+1]=mid;b[2*axis]=mid
                children=[best(c,parent,a,parent['id']+'.0'),best(c,parent,b,parent['id']+'.1')]
                raw=[v.get('proposal_upper',Q(10**6))for v in children]
                score=(max(v['upper']for v in children),sum(v['upper']>target for v in children),max(raw),sum(raw))
                options.append((score,axis,mid,children))
            _,axis,mid,children=min(options,key=lambda z:z[0])
            ev=split_event(parent,axis,mid,children)
            mask=signal.pthread_sigmask(signal.SIG_BLOCK,{signal.SIGALRM})
            try:apply_event(c,active,ev,exact=False);events.append(ev);splits+=1
            finally:signal.pthread_sigmask(signal.SIG_SETMASK,mask)
            if splits%10==0:
                print('STAGE',str(target),'splits',splits,'boxes',len(active),'bad',sum(v['upper']>target for v in active.values()),'max',float(max(v['upper']for v in active.values())),flush=True)
                checkpoint()
    except WallBudget:termination='wall_budget'
    finally:signal.setitimer(signal.ITIMER_REAL,0);signal.signal(signal.SIGALRM,previous)
    return dict(target=target,initial_boxes=initial,initial_blockers=initial_bad,final_boxes=len(active),
      final_blockers=sum(v['upper']>target for v in active.values()),splits=splits,reprices=reprices,
      attempts=attempts,termination=termination,search_seconds=time.monotonic()-start)

def compact(c,roots,events,B):
    active=copy.deepcopy(roots);kept=[];blocked={k for k,v in active.items()if v['upper']<=B}
    def under_blocked(name):
        parts=name.split('.')
        return any('.'.join(parts[:k])in blocked for k in range(1,len(parts)+1))
    for event in events:
        if under_blocked(event['parent']):continue
        apply_event(c,active,event);kept.append(copy.deepcopy(event))
        names=[event['parent']]if event['kind']=='reprice'else[ch['id']for ch in event['children']]
        for name in names:
            if active[name]['upper']<=B:blocked.add(name)
    assert max(v['upper']for v in active.values())<=B
    return active,kept

def cover_doc(frozen,active,doc):
    cover=copy.deepcopy(frozen);cover['boxes']=[dict(bounds=v['bounds'],upper=v['upper'],**v['recipe'])for v in ordered(active)]
    cover['target']=doc['best_complete_B'];cover['lower']=doc['best_complete_L'];cover['fails']=[]
    cover['box_max_rounded_up']=doc['best_complete_B'];cover['nodes']=copy.deepcopy(doc['nodes'])
    return cover

def main():
    if not __debug__:raise SystemExit('Reject -O/-OO: exact assertions required')
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--target',type=Q,default=Q('.71342160'))
    p.add_argument('--seconds',type=float,default=95);p.add_argument('--max-additional',type=int,default=3000)
    p.add_argument('--out',type=Path,default=OUT);p.add_argument('--prior',type=Path);p.add_argument('--verify',type=Path)
    p.add_argument('--start-cover',type=Path,help='Durable exact copy of the original10234-box starting cover')
    p.add_argument('--start-ledger',type=Path,help='Durable exact copy of its frozen source ledger')
    p.add_argument('--generation-tool',type=Path,action='append',default=[],help='Historical generator source whose recorded SHA is checked on replay')
    p.add_argument('--prune-to',type=Q,help='Before resuming, discard refinements beneath exact parent bounds already at most this cap')
    a=p.parse_args();assert 0<a.seconds<=100 and 0<a.max_additional<=3000
    assert not a.out.resolve().is_relative_to(DATA.resolve())
    for name,path in [('cover.json',a.start_cover),('cover-ledger.json',a.start_ledger)]:
        if path is not None:
            selected=path.resolve(strict=True);assert selected.is_relative_to(ROOT)and selected.is_file()
            PIN_OVERRIDES[str((DATA/name).relative_to(ROOT))]=selected
    for path in a.generation_tool:
        selected=path.resolve(strict=True);assert selected.is_relative_to(ROOT)and selected.is_file();GENERATION_TOOLS.append(selected)
    started=time.monotonic();c,frozen,roots,before=setup();active=copy.deepcopy(roots)
    stages=[]
    if a.verify:
        d=json.loads(a.verify.read_text());active=replay(c,frozen,roots,d)
        saved=json.loads((a.verify.parent/'cover.json').read_text())
        assert saved==encode(cover_doc(frozen,active,d));assert pins()==before
        print('REPLAY_PASS','B',d['best_complete_B'],'L',d['best_complete_L'],'boxes',len(active),'remaining',len(d['remaining']),flush=True);return
    if a.prior:
        prior=json.loads(a.prior.read_text());local_sha=prior['local_adaptive_sha256']
        active=replay(c,frozen,roots,prior);events=copy.deepcopy(prior['events']);stages=copy.deepcopy(prior['stages'])
        if a.prune_to:
            old_count=len(active);old_events=len(events);active,events=compact(c,roots,events,a.prune_to)
            stages.append(dict(kind='exact_parent_compaction',ceiling=a.prune_to,old_boxes=old_count,new_boxes=len(active),old_events=old_events,new_events=len(events)))
    else:
        local_sha=sha(LOCAL);events=splice_local(c,active,json.loads(LOCAL.read_text()))
    def checkpoint():
        d=manifest(c,frozen,active,events,before,a.target,local_sha,stages,time.monotonic()-started)
        write(a.out/'checkpoint.json',d)
    stage_result=stage(c,active,events,a.target,a.seconds,len(roots)+a.max_additional,checkpoint);stages.append(stage_result)
    d=manifest(c,frozen,active,events,before,a.target,local_sha,stages,time.monotonic()-started)
    active2=replay(c,frozen,roots,encode(d));assert encode(ordered(active2))==encode(ordered(active))
    write(a.out/'ledger.json',d);write(a.out/'cover.json',cover_doc(frozen,active,d))
    print('SUMMARY',json.dumps(encode({k:d[k]for k in['status','target','best_complete_B','best_complete_L','actual_upper_decimal','boxes','additional_leaves','elapsed_seconds']})),flush=True)
    print('STAGE_RESULT',json.dumps(encode(stage_result)),flush=True)

if __name__=='__main__':main()

#!/usr/bin/env python3
"""One bounded ordinary-component probe of cap194; frozen data are read-only.

The exact 2x8x8 Cartesian grid covers the original broad obligation. Each
cell takes the better of its existing cap-envelope fallback and an accepted
ordinary law component assembled from existing endpoint pools. This is a
headroom diagnostic, not a new global cover or endpoint certificate.
"""
import argparse
import copy
from fractions import Fraction as Q
import hashlib
import itertools
import json
from pathlib import Path
import sys
import time
import signal

sys.dont_write_bytecode=True
sys.path.insert(0,str(Path(__file__).resolve().parent))
from needle_cover_refine import capvalue,encode,EPS,PAD,J,price,mix
from needle_unshifted_campaign import UnshiftedCampaign,evaluate_child

ROOT=Path(__file__).resolve().parents[1]
DATA=ROOT/'data/lower-unshifted'
OUT=ROOT/'handoff/research-third-decimal/law-node-forward-20261023/CAP194_COMPONENTS.json'

def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()

def pins():
    paths=[DATA/name for name in ['cover.json','cover-ledger.json','nodes.json','inputs/source-manifest.json',
        'inputs/current-cover.json','inputs/inherited.json','inputs/cover.json','inputs/minimal-cover-ledger.json']]
    # Pin semantic inputs registered in the node map, rather than filesystem
    # sidecars (e.g. macOS AppleDouble files introduced by archive transfer).
    mapping=json.loads((DATA/'nodes.json').read_text())
    paths+=[ROOT/v['path']for _,v in sorted(mapping.items())]
    return {str(p.relative_to(ROOT)):sha(p)for p in paths}

def write(path,doc):
    path.parent.mkdir(parents=True,exist_ok=True)
    temporary=path.with_name('.'+path.name+'.tmp')
    temporary.write_text(json.dumps(encode(doc),indent=2)+'\n');temporary.replace(path)

def probe():
    before=pins();started=time.monotonic();c=UnshiftedCampaign(DATA)
    parent=c.cover['boxes'][194];bounds=list(map(Q,parent['bounds']))
    assert bounds==[Q(1687,2000),Q(211,250),Q(0),Q(973612157,10**9),Q(0),Q(31,4)]
    kind,_,raw=c.inh['boxes'][parent['original']].split('|');assert kind=='c'
    i,j,theta=raw.split(',');i,j=int(i),int(j);theta=Q(theta);assert(i,j)==(13,14)
    old=capvalue(c.env[i],c.env[j],theta,*bounds[:2]);assert old==Q(parent['upper'])
    fallback=c.refine_cap(194,(2,1,1))
    frozen=json.loads((DATA/'cover-ledger.json').read_text())
    delivered=next(r for r in frozen['records']if r['box']==194)
    assert fallback['new_upper']==Q(delivered['new_upper'])
    assert encode(fallback['children'])==delivered['children'],'Frozen t-only fallback changed'
    baseline=fallback['new_upper'];children=[];expected=set()
    for ti,si,xi in itertools.product(range(2),range(8),range(8)):
        cb=[]
        for axis,n,k in [(0,2,ti),(1,8,si),(2,8,xi)]:
            a,b=bounds[2*axis:2*axis+2];cb.extend([a+(b-a)*k/n,a+(b-a)*(k+1)/n])
        expected.add(tuple(cb))
        fallback_choice=fallback['children'][ti]['cap_choice']
        a,b,t=fallback_choice;fall=capvalue(c.env[a],c.env[b],t,*cb[:2])
        assert fall<=old
        available=[];missing=[]
        for g in range(len(c.gv)):
            try:
                c.endpoint_pool([],g,cb[2],cb);c.endpoint_pool([],g,cb[3],cb)
            except AssertionError:missing.append(g)
            else:available.append(g)
        component=None;choice=None
        if available:
            component,choice=c.best_groups(cb)
            accepted=evaluate_child(c,dict(bounds=cb,choice=choice))
            assert component==accepted
        upper=min(fall,component)if component is not None else fall
        assert upper<=fall<=old
        child=dict(grid_index=[ti,si,xi],bounds=cb,fallback_upper=fall,
            component_upper=component,upper=upper,improvement=fall-upper,
            available_groups=available,no_bracket_groups=missing,
            accepted_kind='component'if component is not None and component<fall else'cap_fallback',
            component_choice=choice,fallback_choice=fallback_choice)
        children.append(child)
        print('CELL',ti,si,xi,'fallback',float(fall),'component',None if component is None else float(component),
              'accepted',float(upper),'available',len(available),flush=True)
    assert len(children)==128 and {tuple(ch['bounds'])for ch in children}==expected
    # The independent exact Cartesian check is explicit rather than a sampled
    # maximum: each of the 128 cells has one accepted whole-cell bound.
    upper=max(ch['upper']for ch in children);hard=[ch for ch in children if ch['upper']==upper]
    after=pins();assert before==after,'A frozen input changed while probing'
    return dict(format='needle-cap194-components/v1',status='PASS_EXACT_BOUNDED_COMPONENT_PROBE',
        scope=__doc__,parent=194,parent_bounds=bounds,split=[2,8,8],children_count=128,
        source_sha256=before,tool_sha256={name:sha(ROOT/name)for name in ['tools/needle_cap194_components.py',
            'tools/needle_unshifted_campaign.py','tools/needle_cover_refine.py','tools/needle_rankone_nodes.py','tools/rankone_law.py']},
        frozen_data_unchanged=True,old_parent_upper=old,t_only_fallback_upper=baseline,
        probe_upper=upper,probe_upper_decimal=float(upper),saving=baseline-upper,saving_decimal=float(baseline-upper),
        target_071342160_pass=upper<=Q('0.71342160'),strictly_below_delivered_cap194=upper<baseline,
        component_winning_cells=sum(ch['accepted_kind']=='component'for ch in children),
        no_bracket_cells=sum(not ch['available_groups']for ch in children),
        hard_grid_indices=[ch['grid_index']for ch in hard],
        nodes=c.nodes,groups=c.cover['groups'],children=children,elapsed_seconds=time.monotonic()-started,
        remaining_obligation='This probes cap194 only. A smaller global endpoint would still require repricing every other blocker, a new complete cover and reflected Lean checks.')

def point_value(point,v,p,floatmode=False):
    """Exact zero-width limit of boxVal, avoiding its divided scale chord."""
    t,tau,x=point;ell,beta=v[:2]
    return t*t-2*ell*t+2*beta*beta/(float(EPS)if floatmode else EPS)+J(p,x)-price(v)*tau*tau+(float(PAD)if floatmode else PAD)

def point_best_groups(c,point):
    """The existing group-pool/golden-weight proposal evaluated at one point.

    Endpoints coincide, so the law polynomial is evaluated directly, without
    dividing by a zero-width scale interval. Only the selected rational
    mixture is trusted; its exact value is independently reconstructed.
    """
    t,tau,x=point;bounds=[t,t,tau,tau,x,x];data={};proposals=[]
    for g in range(len(c.gv)):
        try:ids,p=c.endpoint_pool([],g,tau,bounds)
        except AssertionError:continue
        data[g]=(ids,p,tuple(map(float,c.gv[g])),tuple(map(float,p)))
        proposals.append((point_value(tuple(map(float,point)),data[g][2],data[g][3],True),[g],Q(0)))
    phi=(5**.5-1)/2
    for g,h in itertools.combinations(data,2):
        a,b=data[g],data[h]
        def ev(z):return point_value(tuple(map(float,point)),mix(z,a[2],b[2]),mix(z,a[3],b[3]),True)
        lo,hi=0.,1.;u=hi-phi*(hi-lo);v=lo+phi*(hi-lo);fu,fv=ev(u),ev(v)
        for _ in range(40):
            if fu<=fv:hi,v,fv=v,u,fu;u=hi-phi*(hi-lo);fu=ev(u)
            else:lo,u,fu=u,v,fv;v=lo+phi*(hi-lo);fv=ev(v)
        weight=Q(round((lo+hi)/2*10**9),10**9)
        proposals.append((ev(float(weight)),[g,h],weight))
    assert proposals,'No pointwise node bracket'
    proposals.sort(key=lambda z:z[0]);accepted=[]
    for _,gs,weight in proposals[:4]:
        if len(gs)==1:v=c.gv[gs[0]];p=data[gs[0]][1]
        else:v=mix(weight,c.gv[gs[0]],c.gv[gs[1]]);p=mix(weight,data[gs[0]][1],data[gs[1]][1])
        upper=point_value(point,v,p)
        choice=dict(groups=gs,refs=[data[g][0]*2 for g in gs],theta=weight)
        # Re-extract both endpoint references through the exact component
        # interpolation, rather than reusing the floating proposal data.
        parts=[c.component(rr,g,bounds)for rr,g in zip(choice['refs'],gs)]
        if len(gs)==1:pp=parts[0][0]
        else:pp=mix(weight,parts[0][0],parts[1][0])
        assert point_value(point,v,pp)==upper
        accepted.append((upper,choice))
    upper,choice=min(accepted,key=lambda z:z[0])
    return upper,choice,sorted(data)

def pointwise(report_path):
    before=pins();started=time.monotonic();old=json.loads(report_path.read_text())
    assert old['split']==[2,8,8] and old['children_count']==128
    for p,h in old['source_sha256'].items():assert sha(ROOT/p)==h
    c=UnshiftedCampaign(DATA);baseline=Q(old['probe_upper'])
    hard=[ch for ch in old['children']if Q(ch['upper'])==baseline];assert len(hard)==15
    tl,tu=map(Q,old['parent_bounds'][:2]);ell,beta,C=c.env[13];ell1,beta1,C1=c.env[14]
    de,db,dC=ell1-ell,beta1-beta,C1-C;a=2*db*db/EPS
    assert a>0
    special=[];candidates=[tl,tu]
    if de:
        crossing=dC/(2*de)
        if tl<=crossing<=tu:special.append(('row_envelope_crossing',crossing))
        for knot in [(dC-a)/(2*de),(dC+a)/(2*de)]:
            if tl<=knot<=tu:candidates.append(knot)
    if a!=de*de:
        th=(2*de*ell-dC+a)/(2*(a-de*de));critical=ell+th*de
        if 0<=th<=1 and tl<=critical<=tu:candidates.append(critical)
    def opt_env(t):
        th=min(Q(1),max(Q(0),(2*de*t-dC+a)/(2*a)))
        return capvalue(c.env[13],c.env[14],th,t,t)
    tmax=max(candidates,key=opt_env)
    if not any(t==tmax for _,t in special):special.append(('envelope_maximizer',tmax))
    records=[]
    for ch in hard:
        bb=list(map(Q,ch['bounds']));center=tuple((bb[2*k]+bb[2*k+1])/2 for k in range(3))
        trials=[('cell_center',center)]+[(name,(t,center[1],center[2]))for name,t in special]
        for kind,point in trials:
            upper,choice,available=point_best_groups(c,point)
            i,j,theta=ch['fallback_choice'];point_fallback=capvalue(c.env[i],c.env[j],Q(theta),point[0],point[0])
            opttheta=min(Q(1),max(Q(0),(2*de*point[0]-dC+a)/(2*a)))if a else Q(0)
            optimal_envelope=capvalue(c.env[13],c.env[14],opttheta,point[0],point[0])
            records.append(dict(grid_index=ch['grid_index'],kind=kind,point=point,
                component_upper=upper,component_upper_decimal=float(upper),component_choice=choice,
                available_groups=available,cell_component_upper=ch['component_upper'],cell_fallback_upper=ch['fallback_upper'],
                fixed_fallback_at_point=point_fallback,optimized_envelope_at_point=optimal_envelope,
                component_minus_global_cap=upper-baseline,component_minus_point_fallback=upper-point_fallback,
                below_global_cap=upper<baseline,below_fixed_point_fallback=upper<point_fallback))
            print('POINT',kind,ch['grid_index'],'component',float(upper),'globalgap',float(upper-baseline),flush=True)
    centers=[r for r in records if r['kind']=='cell_center'];after=pins();assert before==after
    return dict(format='needle-cap194-pointwise/v1',status='PASS_EXACT_POINTWISE_DIAGNOSTIC',
        source_report_sha256=sha(report_path),source_sha256=before,frozen_data_unchanged=True,
        tool_sha256=sha(Path(__file__)),cells=15,points=len(records),special_t=special,
        global_cap_reference=baseline,center_components_below_global_cap=sum(r['below_global_cap']for r in centers),
        center_components_below_fixed_point_fallback=sum(r['below_fixed_point_fallback']for r in centers),
        center_component_min=min(r['component_upper']for r in centers),center_component_max=max(r['component_upper']for r in centers),
        records=records,elapsed_seconds=time.monotonic()-started,
        scope='Exact accepted component values at selected points only. These are not interval caps, optimality certificates, actual Gaussian response payoffs, or a new global endpoint.')

class WallBudget(Exception):pass

def adaptive(report_path):
    """One <=60s/2000-leaf local follow-up; no global or frozen-data output."""
    started=time.monotonic();before=pins();old=json.loads(report_path.read_text())
    assert old['split']==[2,8,8] and old['children_count']==128
    for p,h in old['source_sha256'].items():assert sha(ROOT/p)==h
    c=UnshiftedCampaign(DATA);assert c.nodes==old['nodes']
    target=Q('0.71342160');limit=2000;leaves={};roots=[];splits=[]
    def recipe_value(bounds,recipe):
        return evaluate_child(c,dict(bounds=bounds,**recipe))
    for k,ch in enumerate(old['children']):
        bb=list(map(Q,ch['bounds']))
        if ch['accepted_kind']=='component':
            choice=copy.deepcopy(ch['component_choice']);choice['scale_domain']=bb[2:4]
            recipe=dict(choice=choice)
        else:recipe=dict(cap_choice=ch['fallback_choice'])
        v=recipe_value(bb,recipe);assert v==Q(ch['upper'])
        leaf=dict(id=f'r{k}',bounds=bb,upper=v,recipe=recipe,
            raw_component_upper=None if ch['component_upper']is None else Q(ch['component_upper']),depth=0)
        leaves[leaf['id']]=leaf;roots.append(copy.deepcopy(leaf))
    assert len(leaves)==128
    initial_bad=sum(v['upper']>target for v in leaves.values());evaluations=0
    def child(parent,bounds,name):
        nonlocal evaluations
        recipe=copy.deepcopy(parent['recipe']);fallback=recipe_value(bounds,recipe)
        assert fallback<=parent['upper']
        try:
            component,choice=c.best_groups(bounds)
        except AssertionError as exc:
            # Only the explicitly empty proposal set is an unavailable pool;
            # arithmetic acceptance failures must never be silently dropped.
            if str(exc):raise
            component,choice=None,None
        if component is not None:assert evaluate_child(c,dict(bounds=bounds,choice=choice))==component
        evaluations+=1
        if component is not None and component<fallback:
            choice=copy.deepcopy(choice);choice['scale_domain']=bounds[2:4]
            recipe=dict(choice=choice);upper=component
        else:upper=fallback
        assert recipe_value(bounds,recipe)==upper<=parent['upper']
        return dict(id=name,bounds=bounds,upper=upper,recipe=recipe,
                    raw_component_upper=component,depth=parent['depth']+1)
    previous=signal.getsignal(signal.SIGALRM)
    def alarm(_signum,_frame):raise WallBudget()
    signal.signal(signal.SIGALRM,alarm)
    # Leave ten seconds for the exact frontier/partition replay and output.
    signal.setitimer(signal.ITIMER_REAL,max(.01,50-(time.monotonic()-started)))
    termination='local_target_cleared'
    try:
        while True:
            bad=[leaf for leaf in leaves.values()if leaf['upper']>target]
            if not bad:break
            if len(leaves)>=limit:termination='leaf_budget';break
            parent=max(bad,key=lambda z:(z['upper'],z['raw_component_upper']or z['upper'],-z['depth']))
            options=[]
            for axis in [1,2]:
                bb=parent['bounds'];mid=(bb[2*axis]+bb[2*axis+1])/2
                a,b=list(bb),list(bb);a[2*axis+1]=mid;b[2*axis]=mid
                children=[child(parent,a,parent['id']+'0'),child(parent,b,parent['id']+'1')]
                raw=max((ch['raw_component_upper']if ch['raw_component_upper']is not None else Q(10**6))for ch in children)
                score=(max(ch['upper']for ch in children),sum(ch['upper']>target for ch in children),raw)
                options.append((score,axis,mid,children))
            score,axis,mid,children=min(options,key=lambda v:v[0])
            # Commit only complete two-child splits. A timer interrupt during
            # proposal work leaves the valid unsplit parent in the frontier.
            mask=signal.pthread_sigmask(signal.SIG_BLOCK,{signal.SIGALRM})
            try:
                del leaves[parent['id']]
                for ch in children:leaves[ch['id']]=ch
                splits.append(dict(parent=parent['id'],parent_bounds=parent['bounds'],
                    axis=axis,mid=mid,children=copy.deepcopy(children)))
            finally:signal.pthread_sigmask(signal.SIG_SETMASK,mask)
            if len(splits)%10==0:
                print('ADAPT',len(splits),'leaves',len(leaves),'bad',sum(z['upper']>target for z in leaves.values()),
                      'max',float(max(z['upper']for z in leaves.values())),flush=True)
    except WallBudget:termination='wall_budget'
    finally:
        signal.setitimer(signal.ITIMER_REAL,0);signal.signal(signal.SIGALRM,previous)
    # Replay the entire binary partition from its accepted initial grid.
    active={r['id']:r for r in roots}
    for s in splits:
        parent=active.pop(s['parent']);assert parent['bounds']==s['parent_bounds']
        axis,mid=s['axis'],s['mid'];bb=parent['bounds'];assert axis in[1,2]and bb[2*axis]<mid<bb[2*axis+1]
        a,b=list(bb),list(bb);a[2*axis+1]=mid;b[2*axis]=mid
        assert [ch['bounds']for ch in s['children']]==[a,b]
        for ch in s['children']:
            assert ch['id']not in active and recipe_value(ch['bounds'],ch['recipe'])==ch['upper']<=parent['upper']
            active[ch['id']]=ch
    assert active==leaves and len(leaves)<=limit
    upper=max(ch['upper']for ch in leaves.values());bad=[ch for ch in leaves.values()if ch['upper']>target]
    if not bad:termination='local_target_cleared'
    assert pins()==before
    return dict(format='needle-cap194-adaptive/v1',status='COMPLETE_LOCAL_CAP194'if not bad else'VALID_PARTIAL_LOCAL_FRONTIER',
        scope='Local cap194 diagnostic only; no new global cover or endpoint. Existing NodeCaps and nodes unchanged.',
        source_report_sha256=sha(report_path),source_sha256=before,tool_sha256=sha(Path(__file__)),
        frozen_data_unchanged=True,target=target,termination=termination,search_wall_budget_seconds=50,
        max_process_seconds=60,max_leaves=limit,initial_leaves=128,initial_failing_leaves=initial_bad,
        final_leaves=len(leaves),failing_leaves=len(bad),evaluated_children=evaluations,
        exact_max=upper,exact_max_decimal=float(upper),initial_roots=roots,splits=splits,
        frontier=list(leaves.values()),remaining_frontier_ids=[ch['id']for ch in bad],
        complete_local_partition=True,elapsed_seconds=time.monotonic()-started)

def main():
    if not __debug__:raise SystemExit('Reject -O/-OO: exact acceptance assertions required')
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--out',type=Path)
    p.add_argument('--pointwise',type=Path,help='Only evaluate the fifteen saved binding-cell centers and envelope critical t values')
    p.add_argument('--adaptive',type=Path,help='One <=60s, <=2000-leaf tau/x refinement of this saved grid')
    a=p.parse_args();assert not(a.pointwise and a.adaptive)
    a.out=a.out or (OUT.with_name('ADAPTIVE.json')if a.adaptive else OUT.with_name('POINTWISE.json')if a.pointwise else OUT)
    assert not a.out.resolve().is_relative_to(DATA.resolve()),'Probe output must not touch frozen data'
    d=adaptive(a.adaptive)if a.adaptive else pointwise(a.pointwise)if a.pointwise else probe();write(a.out,d)
    keys=['status','termination','final_leaves','failing_leaves','exact_max_decimal','elapsed_seconds']if a.adaptive else ['status','cells','points','center_components_below_global_cap','center_components_below_fixed_point_fallback']if a.pointwise else ['status','probe_upper_decimal','saving_decimal','component_winning_cells','no_bracket_cells','target_071342160_pass','hard_grid_indices']
    print('SUMMARY',json.dumps({k:d[k]for k in keys}),flush=True)

if __name__=='__main__':main()

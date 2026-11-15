#!/usr/bin/env python3
"""codex-6e2b: exact/Arb acceptance of the continuum spectral-deficit cover.

Fresh profile integration + exact global polynomial tests accept proposed
SOCP coefficients. Arb endpoint budgets and a proved energy interpolation
allowance cover every variance/kurtosis box. Content certificates and the
inherited chaos moment/Stein theorems are explicit mathematical dependencies.
No optimizer, sampled gap, or saved objective is used for acceptance.
"""
import argparse
from fractions import Fraction as Q
import importlib.util
import json
from pathlib import Path
import time
from flint import arb
ROOT=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('deficit_dual_exact',ROOT/'deficit_dual_exact.py')
exact=importlib.util.module_from_spec(spec);spec.loader.exec_module(exact)
ar=exact.ar


def gamma(u):
    assert Q(9,1000)<=u<=Q(463,10000)
    out=Q(251,5000)
    for edge,value in [(Q(12,1000),Q(121,2500)),(Q(15,1000),Q(467,10000)),
                       (Q(18,1000),Q(451,10000)),(Q(2,100),Q(441,10000)),
                       (Q(25,1000),Q(1859,43200)),(Q(3,100),Q(3,80)),
                       (Q(35,1000),Q(71,2000)),(Q(4,100),Q(17,500)),(Q(44,1000),Q(13,400))]:
        if u>=edge:out=value
    return out


def content(branch,u,chi,coefficient):
    if branch=='linear':return ar(coefficient*u*u*chi)
    if branch=='tensor':return 3*ar(u**3*chi)*ar(chi).sqrt()
    if branch=='uniform':return ar(Q(1,2500))
    if branch=='energy':return ar(Q(19321,10**6)*u)
    raise AssertionError(branch)


def Fbound(row,chi):
    P=list(map(Q,row['coefficients']))
    assert P[3]>=0
    return ar(P[0]+P[1]+P[2]*(2+chi)+P[3]*(6+9*chi))+ar(P[3]*Q(4045313,100000)*chi)*ar(chi).sqrt()


def lower_budget(row,B,u,chi,branch,coefficient):
    return (ar(Q(3,10))*(B-Fbound(row,chi))+ar(Q(6,10**6))-content(branch,u,chi,coefficient)).lower()


def replay_base_caps():
    # Resolve the archived module explicitly, avoiding Python's stdlib profile.
    import sys
    spec=importlib.util.spec_from_file_location('profile',exact.ARCHIVE/'profile.py')
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
    sys.modules['profile']=module
    spec=importlib.util.spec_from_file_location('remote_stein_verify',exact.ARCHIVE/'verify.py')
    verify=importlib.util.module_from_spec(spec);spec.loader.exec_module(verify)
    verify.profile_caps()


def accept_models(candidates,caps):
    accepted=[];rejected=[]
    for idx,c in enumerate(candidates):
        assert not c.get('psd') and c.get('extended_profile')
        u=Q(str(c['u']));assert Q(16,1000)<=u<=Q(463,10000)
        row=None
        for slack in [Q(1,10**7),Q(3,10**7),Q(1,10**6),Q(3,10**6),Q(1,10**5)]:
            proposed=exact.convert(c,slack)
            ok,detail=exact.check_node_long(proposed,caps,depth=20)
            if ok:row=proposed;break
        if row is None:
            rejected.append({'index':idx,'u':str(u),'chi_anchor':c['chi'],'failure':detail})
        else:
            accepted.append({'index':idx,'u':str(u),'chi_anchor':c['chi'],'P0_inflation':str(slack),'row':row})
        if (idx+1)%10==0 or idx+1==len(candidates):
            print(json.dumps({'polynomial_progress':idx+1,'total':len(candidates),
                              'accepted':len(accepted),'rejected':len(rejected)}),flush=True)
    return accepted,rejected


def certify_boxes(energies,models,benchmarks,max_depth=17):
    boxes=[];uncovered=[]
    byenergy={u:[m for m in models if Q(m['u'])==u] for u in energies}
    assert all(byenergy.values())
    cache={}
    def score(model,u,chi,branch,g):
        key=(model['index'],chi,branch,g)
        if key not in cache:cache[key]=lower_budget(model['row'],benchmarks[u],u,chi,branch,g)
        return cache[key]
    for ul,uh in zip(energies,energies[1:]):
        assert ul<uh
        g=gamma(ul)
        assert all(not ul<t<uh for t in [Q(12,1000),Q(15,1000),Q(18,1000),Q(2,100),Q(25,1000),Q(3,100),Q(35,1000),Q(4,100),Q(44,1000)])
        pending=[(Q(0),Q(42),0)]
        slab=[]
        while pending:
            cl,ch,depth=pending.pop()
            branchlist=['linear','tensor','uniform','energy']
            exempt=next((b for b in branchlist if content(b,uh,ch,g)<=ar(Q(6,10**6))),None)
            if exempt:
                slab.append({'u':[str(ul),str(uh)],'chi':[str(cl),str(ch)],'content_branch':exempt,
                             'exempt':True});continue
            allowance=Q(9,10)*(2+ch)*(uh-ul)**2/8
            choice=None;best_float=-float('inf')
            for branch in branchlist:
                witnesses=[];lower=[]
                for u in (ul,uh):
                    best=None;bf=-float('inf')
                    for model in byenergy[u]:
                        endpoint=min(score(model,u,cl,branch,g),score(model,u,ch,branch,g))
                        value=float(endpoint)
                        if value>bf:best=(model,endpoint);bf=value
                    witnesses.append(best[0]['index']);lower.append(best[1])
                margin=min(lower)-ar(allowance)
                if float(margin)>best_float:
                    best_float=float(margin);choice=(branch,witnesses,margin)
                if margin>0:break
            if choice[2]>0:
                slab.append({'u':[str(ul),str(uh)],'chi':[str(cl),str(ch)],
                    'content_branch':choice[0],'coefficient':str(g),'dual_indices':choice[1],
                    'interpolation_allowance':str(allowance),'margin':str(choice[2]),'exempt':False})
            elif depth>=max_depth:
                uncovered.append({'u':[str(ul),str(uh)],'chi':[str(cl),str(ch)],
                                  'best_branch':choice[0],'best_margin':str(choice[2])})
            else:
                mid=(cl+ch)/2
                pending.append((mid,ch,depth+1));pending.append((cl,mid,depth+1))
        slab.sort(key=lambda box:Q(box['chi'][0]))
        intervals=sorted([(Q(x['chi'][0]),Q(x['chi'][1])) for x in slab]+[(Q(x['chi'][0]),Q(x['chi'][1])) for x in uncovered if Q(x['u'][0])==ul])
        assert intervals[0][0]==0 and intervals[-1][1]==42
        assert all(x[1]==y[0] for x,y in zip(intervals,intervals[1:]))
        boxes.extend(slab)
        print(json.dumps({'energy_slab':[str(ul),str(uh)],'accepted_boxes':len(slab),
                          'uncovered_boxes':sum(Q(x['u'][0])==ul for x in uncovered)}),flush=True)
    return boxes,uncovered


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--skip-base-profile-replay',action='store_true')
    parser.add_argument('--max-depth',type=int,default=12)
    args=parser.parse_args()
    start=time.time()
    if args.skip_base_profile_replay:
        print('CONDITIONAL RUN: archived base profile caps must already be replayed in this verification chain.',flush=True)
    else:replay_base_caps()
    caps=exact.extended_caps()
    data=json.loads((ROOT/'deficit_dual_cover_candidates.json').read_text())
    energies=list(map(lambda u:Q(str(u)),data['energies']))
    assert energies==sorted(set(energies)) and energies[0]==Q(16,1000) and energies[-1]==Q(463,10000)
    models,rejected=accept_models(data['results'],caps)
    benchmarks={u:exact.gaussian_B(u) for u in energies}
    boxes,uncovered=certify_boxes(energies,models,benchmarks,args.max_depth)
    output={'Agent-ID':'codex-6e2b','claim':'C²<=.3D_++6e-6',
            'content_dependencies':'piecewise certified gamma bounds; tensor, linear-energy and uniform envelopes',
            'energies':[str(u) for u in energies],
            'benchmarks':{str(u):str(v) for u,v in benchmarks.items()},
            'accepted_models':models,'rejected_models':rejected,'boxes':boxes,'uncovered':uncovered,
            'base_profiles_replayed_here':not args.skip_base_profile_replay,'passed':not uncovered,
            'seconds':time.time()-start}
    (ROOT/'deficit_dual_cover_witness.json').write_text(json.dumps(output,indent=2)+'\n')
    print(json.dumps({'claim':output['claim'],'accepted_models':len(models),'rejected_models':len(rejected),
                      'boxes':len(boxes),'uncovered':len(uncovered),'passed':not uncovered,
                      'seconds':output['seconds']}),flush=True)
    assert not uncovered,'continuum cover has uncovered boxes'


if __name__=='__main__':main()

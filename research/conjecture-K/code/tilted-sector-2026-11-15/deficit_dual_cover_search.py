#!/usr/bin/env python3
"""codex-6e2b: N-only candidate search for the continuum deficit cover."""
import argparse
from fractions import Fraction as Q
import importlib.util
import json
from pathlib import Path
import time
import numpy as np
ROOT=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('deficit_dual_search',ROOT/'deficit_dual_search.py')
search=importlib.util.module_from_spec(spec);spec.loader.exec_module(search)


def gamma(u):
    out=251/5000
    for edge,coefficient in [(.012,121/2500),(.015,467/10000),(.018,451/10000),(.02,441/10000),(.025,1859/43200),(.03,3/80),(.035,71/2000),(.04,17/500),(.044,13/400)]:
        if u>=edge-1e-14:out=coefficient
    return out


def branches(u):return ['linear','tensor','uniform','energy']


def H(branch,u,chi,g):
    if branch=='linear':return g*u*u*chi
    if branch=='tensor':return 3*u**3*chi**1.5
    if branch=='uniform':return .0004
    if branch=='energy':return .019321*u
    raise AssertionError(branch)


def qmargin(c,chi,branch,g,B):
    u=c['u'];P=np.array(c['P_scaled'])
    value=P@[1,1,2+chi,6+9*chi+search.C6*chi**1.5]
    F=search.h0+search.I0*u+u*u*value+1e-6
    return .3*(B-F)+6e-6-H(branch,u,chi,g)


def assess(energies,models,benchmarks):
    accepted=[];failed=[]
    for ul,uh in zip(energies,energies[1:]):
        gl=gamma(ul)
        pending=[(0.,42.,0)]
        while pending:
            cl,ch,depth=pending.pop()
            available=branches(ul)
            exempt=min(H(b,uh,ch,gl) for b in available)<=6e-6
            if exempt:
                accepted.append({'u':[ul,uh],'chi':[cl,ch],'exempt':True});continue
            allowance=.9*(2+ch)*(uh-ul)**2/8
            best=(-float('inf'),None,None)
            for branch in available:
                chosen=[];scores=[]
                for u in (ul,uh):
                    values=[min(qmargin(c,cl,branch,gl,benchmarks[u]),qmargin(c,ch,branch,gl,benchmarks[u])) for c in models[u]]
                    j=int(np.argmax(values));chosen.append(j);scores.append(values[j])
                margin=min(scores)-allowance
                if margin>best[0]:best=(margin,branch,chosen)
            if best[0]>1e-6:
                accepted.append({'u':[ul,uh],'chi':[cl,ch],'branch':best[1],
                                 'models':best[2],'N_margin':best[0]})
            elif depth>=12 or ch-cl<.01:
                failed.append({'u':[ul,uh],'chi':[cl,ch],'branch':best[1],
                               'N_margin':best[0]})
            else:
                mid=(cl+ch)/2
                pending.append((mid,ch,depth+1));pending.append((cl,mid,depth+1))
    return accepted,failed


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--energies',type=float,nargs='+',default=[.016,.018,.02,.0225,.025,.0275,.03,.0325,.035,.0375,.04,.042,.044,.0463])
    parser.add_argument('--rounds',type=int,default=3)
    parser.add_argument('--resume',action='store_true')
    args=parser.parse_args()
    energies=args.energies;assert energies==sorted(set(energies))
    assert all(.009<=u<=.0463 for u in energies)
    models={u:[] for u in energies};benchmarks={u:search.gaussian_B(u) for u in energies}
    saved=ROOT/'deficit_dual_cover_candidates.json'
    if args.resume and saved.exists():
        for c in json.loads(saved.read_text())['results']:
            if c['u'] in models:models[c['u']].append(c)
    knots,starts,coeff=search.load_inputs(True)
    started=time.time()
    for u in energies:
        threshold=max((2e-6)**(2/3),6e-6/gamma(u))/(u*u)
        anchors=[x for x in [.1,.3,1.,2.,4.,6.,10.,20.,42.] if x>=threshold/2]
        for chi in anchors:
            if any(abs(c['chi']-chi)<1e-12 for c in models[u]):continue
            grid=np.unique(np.r_[np.linspace(0,12,481),np.linspace(12,40,113),np.geomspace(40,256,65),knots,starts/u])
            validation=np.unique(np.r_[np.linspace(0,12,6001),np.linspace(12,40,2801),np.linspace(40,256,10801),np.geomspace(256,max(2048,64/u),2001),knots,starts/u])
            for iteration in range(args.rounds):
                c=search.solve(u,chi,knots,starts,coeff,grid)
                assert 'P_scaled' in c,c
                gaps=search.candidate_gap(c,validation,starts,coeff)
                c.update({'extended_profile':True,'iteration':iteration,'validation_min_gap_scaled':float(gaps.min())})
                bad=np.flatnonzero(gaps < -1e-6)
                if len(bad)==0:break
                chosen=bad[np.argsort(gaps[bad])[:150]]
                grid=np.unique(np.r_[grid,validation[chosen]])
            models[u].append(c)
            allmodels=[x for uu in energies for x in models[uu]]
            saved.write_text(json.dumps({'Agent-ID':'codex-6e2b','status':'N only: sampled duals; no full parameter certificate',
                                        'energies':energies,'results':allmodels},indent=2)+'\n')
            print(json.dumps({'N_only':True,'u':u,'chi':chi,'D_sampled':c['D_lower_sampled'],
                              'min_gap_scaled':c['validation_min_gap_scaled'],'models':len(allmodels),
                              'elapsed':time.time()-started}),flush=True)
    accepted,failed=assess(energies,models,benchmarks)
    (ROOT/'deficit_dual_cover_plan.json').write_text(json.dumps({'Agent-ID':'codex-6e2b',
        'status':'N only: proposed boxes; all polynomial and interval comparisons await acceptance',
        'energies':energies,'accepted':accepted,'failed':failed},indent=2)+'\n')
    print(json.dumps({'N_only':True,'accepted_boxes':len(accepted),'failed_boxes':len(failed),
                      'worst_failed':min((b['N_margin'] for b in failed),default=None),
                      'seconds':time.time()-started}),flush=True)


if __name__=='__main__':main()

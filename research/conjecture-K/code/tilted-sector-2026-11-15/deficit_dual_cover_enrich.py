#!/usr/bin/env python3
"""codex-6e2b: N-only extra dual candidates at uncovered chi midpoints."""
import importlib.util,json,time
from pathlib import Path
import numpy as np
ROOT=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('cover_search',ROOT/'deficit_dual_cover_search.py')
cover=importlib.util.module_from_spec(spec);spec.loader.exec_module(cover)
search=cover.search
plan=json.loads((ROOT/'deficit_dual_cover_plan.json').read_text())
base=json.loads((ROOT/'deficit_dual_cover_candidates.json').read_text())
groups={}
for box in plan['failed']:
    key=tuple(box['u'])
    if key not in groups or box['N_margin']<groups[key]['N_margin']:groups[key]=box
jobs=set()
for (ul,uh),box in groups.items():
    chi=round(sum(box['chi'])/2,1)
    jobs.add((ul,chi));jobs.add((uh,chi))
knots,starts,coeff=search.load_inputs(True)
extra=[];started=time.time()
for u,chi in sorted(jobs):
    grid=np.unique(np.r_[np.linspace(0,12,481),np.linspace(12,40,113),np.geomspace(40,256,65),knots,starts/u])
    validation=np.unique(np.r_[np.linspace(0,12,6001),np.linspace(12,40,2801),np.linspace(40,256,10801),np.geomspace(256,max(2048,64/u),2001),knots,starts/u])
    for iteration in range(4):
        c=search.solve(u,chi,knots,starts,coeff,grid)
        gap=search.candidate_gap(c,validation,starts,coeff)
        c.update({'extended_profile':True,'iteration':iteration,'validation_min_gap_scaled':float(gap.min())})
        bad=np.flatnonzero(gap < -1e-6)
        if len(bad)==0:break
        grid=np.unique(np.r_[grid,validation[bad[np.argsort(gap[bad])[:150]]]])
    extra.append(c)
    (ROOT/'deficit_dual_cover_extra.json').write_text(json.dumps({'Agent-ID':'codex-6e2b','status':'N only extra dual proposals','results':extra},indent=2)+'\n')
    print(json.dumps({'N_only':True,'u':u,'chi':chi,'D_sampled':c['D_lower_sampled'],'min_gap':float(gap.min()),'seconds':time.time()-started}),flush=True)
allmodels=base['results']+extra
models={u:[c for c in allmodels if c['u']==u] for u in base['energies']}
benchmarks={u:search.gaussian_B(u) for u in base['energies']}
accepted,failed=cover.assess(base['energies'],models,benchmarks)
(ROOT/'deficit_dual_cover_enriched_plan.json').write_text(json.dumps({'Agent-ID':'codex-6e2b','status':'N only','energies':base['energies'],'accepted':accepted,'failed':failed},indent=2)+'\n')
print(json.dumps({'N_only':True,'accepted':len(accepted),'failed':len(failed),'worst_failed':min((b['N_margin'] for b in failed),default=None),'seconds':time.time()-started}),flush=True)

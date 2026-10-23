#!/usr/bin/env python3
"""Floating cut exchange on saved source rows; NOT a continuum certificate.

Reoptimize the SAME table objective after common-kernel separators. Each new
cut is independently rationalized and exactly rejects its discovery law.
"""
import argparse
from copy import deepcopy
from fractions import Fraction as Q
import json
from pathlib import Path
import time

import numpy as np
from scipy.optimize import linprog
from reconstruct_binding_laws import G
import separate_common_stein as sep
from verify_radial_countermodel import solve3


def number(s): return float(Q(s))


def rational_law(template,v,w):
    mask=w>1e-9
    vs=[Q(float(a)).limit_denominator(10**8) for a in v[mask]]
    ws=[Q(round(float(a)*10**18),10**18) for a in w[mask]]
    u=[a*a for a in vs];x=Q(template['point']['x'])
    jj=[0,len(u)//2,len(u)-1]
    A=[[u[j]**k for j in jj] for k in range(3)]
    b=[target-sum(q*a**k for q,a in zip(ws,u)) for k,target in enumerate([Q(1),Q(1),2+x*x])]
    for j,c in zip(jj,solve3(A,b)): ws[j]+=c
    assert all(a>0 for a in ws)
    law=deepcopy(template)
    law['support']=[{'v':str(a),'weight':str(b)} for a,b in zip(vs,ws)]
    return law


def refine(template,seed_cut,rounds,out):
    start=time.monotonic()
    i=template['index'];tau=number(template['point']['tau']);x=number(template['point']['x'])
    pars=template['row_parameters'];t=number(template['point']['t'])
    const=t*t-2*number(pars['ell'])*t+2*number(pars['beta'])**2/.745-number(pars['price'])*tau*tau+1e-11
    bank=[a['data'] for a in template['cuts']]
    grids=[np.linspace(0,3,2401),np.linspace(3,12,1201),np.linspace(12,24,601)]
    grids += [np.array(list(map(number,a['rv']))) for a in bank]
    for item in template['rows']:
        row=item['row'];grids.append(np.array([number(a)/(number(row['delta'])*tau) for a,b in row['table']]))
    v=np.unique(np.concatenate(grids));v=v[(v>=0)&(v<=24)];u=v*v
    objective=np.zeros_like(v)
    for item in template['rows']:
        row=item['row'];sx,sy=np.array([(number(a),number(b)) for a,b in row['table']]).T
        arg=number(row['delta'])*tau*v
        tab=np.interp(arg,sx,sy)
        tab=np.where(arg>sx[-1],sy[-1]+number(row['smax'])*(arg-sx[-1]),tab)
        objective+=number(item['weight'])*tab
    m4=2+x*x;m6=6+9*x*x+40.45313*x**3
    history=[];last=template
    for step in range(rounds+1):
        if step==1: bank.append(seed_cut)
        raw=np.array([G(c,u) for c in bank]);scale=np.maximum(1e-8,np.max(abs(raw[:,u<=8]),axis=1))
        Aub=np.vstack([v,u**3/m6,-raw/scale[:,None]])
        bub=np.r_[.973612157-1e-8,1-1e-8,-np.full(len(bank),1e-7)]
        Aeq=np.vstack([np.ones_like(u),u,u*u/m4])
        lp=linprog(-objective,A_ub=Aub,b_ub=bub,A_eq=Aeq,b_eq=np.ones(3),bounds=(0,None),method='highs',
                   options={'dual_feasibility_tolerance':1e-9,'primal_feasibility_tolerance':1e-9})
        assert lp.success,lp.message
        law=rational_law(template,v,lp.x)
        record={'round':step,'cuts':len(bank),'grid_size':len(v),'score':float(const+lp.x@objective),
                'atoms':len(law['support']), 'constraint_error':float(np.max(Aub@lp.x-bub)),
                'seconds':time.monotonic()-start}
        history.append(record); print(i,record,flush=True)
        (out/f'law-{i}-round-{step}.json').write_text(json.dumps(law,indent=2)+'\n')
        if step:
            try:
                certificate=sep.propose(law)
            except AssertionError as e:
                record['separation_stop']=str(e); break
            (out/f'separator-{i}-round-{step}.json').write_text(json.dumps(certificate,indent=2)+'\n')
            record['next_cut_expectation']=certificate['exact_replay']['expectation_float']
            bank.append(certificate['cut'])
    return {'scope':__doc__,'index':i,'history':history}


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--input',type=Path,required=True)
    p.add_argument('--output',type=Path,required=True);p.add_argument('--indices',default='7234,5661,1247,8701')
    p.add_argument('--rounds',type=int,default=3);a=p.parse_args();a.output.mkdir(parents=True,exist_ok=True)
    rr=[]
    for i in map(int,a.indices.split(',')):
        law=json.loads((a.input/f'radial-complete-{i}-exact.json').read_text())
        cut=json.loads((a.output/f'separator-{i}.json').read_text())['cut']
        rr.append(refine(law,cut,a.rounds,a.output))
        (a.output/'exchange.json').write_text(json.dumps(rr,indent=2)+'\n')


if __name__=='__main__':main()

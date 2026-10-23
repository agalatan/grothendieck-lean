#!/usr/bin/env python3
"""FLOAT diagnostic: reconstruct finite-grid radial laws at audited binding rules.

These are laws in a finite relaxation, not Gaussian cubic response functions.
Neither grid refinement nor LP optimality certifies the infinite-dimensional
problem. The existing rational law cuts are evaluated with their range limits.
"""
import argparse
from fractions import Fraction
import json
from pathlib import Path
import re
import time

import numpy as np
from scipy.optimize import linprog


def f(x):
    return float(Fraction(x))


def G(node, u):
    mesh = np.array([f(v)**2 for v in node['rv']])
    ph = np.array([f(v) for v in node['phi']]+[0.])
    integrals = np.r_[0., np.cumsum((ph[:-1]+ph[1:])*np.diff(mesh)/2)]
    ii = np.minimum(np.searchsorted(mesh,u,side='right')-1,len(mesh)-1)
    lo = mesh[ii]
    slope = np.zeros_like(u)
    inner = ii < len(mesh)-1
    slope[inner] = (ph[ii[inner]+1]-ph[ii[inner]])/(mesh[ii[inner]+1]-lo[inner])
    du = u-lo
    phi = ph[ii]+slope*du
    Phi = integrals[ii]+ph[ii]*du+slope*du*du/2
    d = phi-np.divide(Phi,u,out=np.copy(phi),where=u>0)
    la,mu,tt,be,nu = [f(node.get(k,'0')) for k in ['lam','mu','t','beta','nu']]
    af,ag=la/3,mu/3
    if 'tensor_budget' in node:
        af,ag=f(node['tensor_budget']['A'])/2,f(node['tensor_budget']['B'])/2
    assert not node.get('extra_budgets')
    ff=-(phi+be)/2+(2*tt+af)*u
    gg=-d/2+(tt+ag-nu/2)*u
    ze=f(node.get('sixth_joint',{}).get('weight','0'))
    return ff*ff/la+gg*gg/mu+Phi-phi+(nu/3-2*tt)*(u*u-2)+ze*(-u**3+9*u*u-12)


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--input',type=Path,required=True)
    ap.add_argument('--output',type=Path,required=True)
    ap.add_argument('--indices',default='7234,5661,1247')
    ap.add_argument('--certificate',type=Path,required=True)
    ap.add_argument('--mixed-data',type=Path,required=True)
    ap.add_argument('--vmax',default='12,24')
    args=ap.parse_args()
    data=json.loads(args.input.read_text())
    rows=data['rows']; nodes=data['newnodes']; wanted=set(map(int,args.indices.split(',')))
    cases=[r for r in data['selected'] if r['index'] in wanted]
    assert len(cases)==len(wanted)
    # Independent cross-check against the exact piecewise-polynomial construction.
    import sys
    sys.path.insert(0,str(args.certificate))
    from certify_spectral import spectralpieces
    from flint import fmpq
    for key in list(nodes)[::19]:
        no=nodes[key];rv,pcs=spectralpieces(no)
        for s in ['1/25','1/4','1','4','20']:
            u=fmpq(s);j=sum(v*v<=u for v in rv)-1
            exact=pcs[j](u)/(u*u)
            got=G(no,np.array([float(u)]))[0]
            assert abs(got-float(exact))<=2e-8*(1+abs(float(exact))),(key,s,got,float(exact))
    print('PASS float cut evaluator versus exact rational pieces',flush=True)
    # Old Stein banks are also necessary: some binding rules reference these.
    source=args.mixed_data.read_text().split('def mixedBatches : List JBatch :=\n[',1)[1].split('\n\n/-- Boxes',1)[0]
    old={}
    for bi,block in enumerate(re.split(r'\s*⟨(?=\d+, \d+,)',source)[1:]):
        if not re.search(r'^\s*false,',block,re.M):continue
        quoted=re.findall(r'"([^"\n]*)"',block)
        rv=['0']+quoted[1].split(',')
        K=len(rv)-1
        for witness in quoted[2:]:
            for bankstr in witness.split('|')[1].split(';'):
                zz=[Fraction(int(v),10**8) for v in bankstr.split(',')]
                assert len(zz)==K+2
                alpha=zz[K+1]
                if not alpha:continue  # Then G is pointwise nonnegative.
                key=(tuple(rv),tuple(zz))
                old[key]={'rv':rv,'phi':[str(2*alpha*v) for v in zz[:K]],'beta':str(2*alpha*zz[K]),
                          'lam':str(alpha*alpha),'mu':str(alpha*alpha/2),'t':str(-alpha*alpha/6),'nu':'0'}
    source_cells=set()
    for rec in cases:
        for comp in rec['components']:
            for ref in comp['node_refs']:
                fields=ref.split(',')
                if fields[0]=='s':source_cells.add((int(fields[1]),int(fields[2])))
    for row_index,cell_index in sorted(source_cells):
        raw=(args.mixed_data.parent/f'RowData{row_index+1:02d}.lean').read_text()
        quoted=re.findall(r'"([^"\n]*)"',raw)
        rv=['0']+quoted[1].split(',');K=len(rv)-1
        bankstrs=quoted[2+cell_index].split('|')[3].split(';')
        for bankstr in bankstrs:
            zz=[Fraction(int(v),10**7) for v in bankstr.split(',')]
            assert len(zz)==K+2
            alpha=zz[K+1]
            if not alpha:continue
            key=(tuple(rv),tuple(zz))
            old[key]={'rv':rv,'phi':[str(2*alpha*v) for v in zz[:K]],'beta':str(2*alpha*zz[K]),
                      'lam':str(alpha*alpha),'mu':str(alpha*alpha/2),'t':str(-alpha*alpha/6),'nu':'0'}
    oldbank=[(f'old-stein-{j}',no) for j,no in enumerate(old.values())]
    print('EXTRACTED',len(oldbank),'distinct old Stein cuts from committed data; source cells',sorted(source_cells),flush=True)
    rho=.973612157;c6=40.45313;eps=.745;results=[]
    for rec in cases:
        tau=f(rec['envelope_argmax']['tau']);x=f(rec['envelope_argmax']['x'])
        tt=f(rec['envelope_argmax']['t']);ell=f(rec['row_parameters']['ell'])
        beta=f(rec['row_parameters']['beta']);price=f(rec['row_parameters']['price'])
        xq=Fraction(rec['envelope_argmax']['x'])
        bank=[(key,no) for key,no in nodes.items() if xq<=Fraction(no.get('sixth_joint',{}).get('xmax','31/4'))]+oldbank
        m4=2+x*x;m6=6+9*x*x+c6*x**3
        maxima=[float(v) for v in args.vmax.split(',')]
        for vmax in maxima:
            start=time.time()
            grids=[np.linspace(0,3,2401),np.linspace(3,12,1201)]
            if vmax>12:grids.append(np.linspace(12,vmax,601))
            grids.extend(np.array([f(v) for v in no['rv']]) for key,no in bank)
            for i,_ in rec['rows']:
                row=rows[i];grids.append(np.array([f(a)/(f(row['delta'])*tau) for a,b in row['table']]))
            v=np.unique(np.concatenate(grids));v=v[(v>=0)&(v<=vmax)];u=v*v
            objective=np.zeros_like(v)
            for i,w in rec['rows']:
                row=rows[i];sx=np.array([f(a) for a,b in row['table']]);sy=np.array([f(b) for a,b in row['table']])
                arg=f(row['delta'])*tau*v
                tab=np.interp(arg,sx,sy)
                tab=np.where(arg>sx[-1],sy[-1]+f(row['smax'])*(arg-sx[-1]),tab)
                objective+=f(w)*tab
            rawG=np.array([G(no,u) for key,no in bank])
            scales=np.maximum(1e-8,np.max(np.abs(rawG[:,u<=8]),axis=1))
            Aub=np.vstack([v,u**3/m6,-rawG/scales[:,None]])
            # Interior margins allow an independent rational replay of a primal law.
            bub=np.r_[rho-1e-8,1.-1e-8,-np.full(len(bank),1e-7)]
            Aeq=np.vstack([np.ones_like(u),u,u*u/m4]);beq=np.ones(3)
            lp=linprog(-objective,A_ub=Aub,b_ub=bub,A_eq=Aeq,b_eq=beq,bounds=(0,None),method='highs',
                       options={'dual_feasibility_tolerance':1e-9,'primal_feasibility_tolerance':1e-9})
            assert lp.success,(rec['index'],vmax,lp.message)
            w=lp.x
            score=tt*tt-2*ell*tt+2*beta*beta/eps+w@objective-price*tau*tau+1e-11
            support=[{'v':float(a),'u':float(a*a),'weight':float(q),'potential':float(z)}
                     for a,q,z in zip(v,w,objective) if q>1e-10]
            slack=rawG@w
            order=np.argsort(slack/scales)
            rr={'index':rec['index'],'status':'Floating finite-grid radial relaxation; not an actual response.',
                'vmax':vmax,'grid_size':len(v),'cuts':len(bank),'score':float(score),
                'certificate_rule_upper':rec['upper']['float'],
                'rule_minus_grid_score':rec['upper']['float']-float(score),
                'moments':{'mass':float(w.sum()),'EU':float(w@u),'EU2':float(w@(u*u)),
                           'EU3':float(w@u**3),'EU3_cap':m6,'EsqrtU':float(w@v)},
                'max_equality_error':float(np.max(np.abs(Aeq@w-beq))),
                'max_scaled_inequality_violation':float(np.max(Aub@w-bub)),
                'active_cuts':[{'name':bank[j][0],'slack':float(slack[j]),'scaled_slack':float(slack[j]/scales[j])} for j in order[:12]],
                'support':support,'elapsed_seconds':time.time()-start}
            results.append(rr)
            if vmax==max(maxima):
                from verify_radial_countermodel import rationalize, verify
                model=rationalize(v,w,rec,rows,bank)
                certificate=args.output.with_name(args.output.stem+f'-{rec["index"]}-exact.json')
                certificate.write_text(json.dumps(model,indent=2)+'\n')
                exact=verify(model)
                rr['exact_countermodel_file']=certificate.name
                rr['exact_countermodel_score']=float(Fraction(exact['score']))
                print('PASS EXACT TABLE-LAW COUNTERMODEL',rec['index'],float(Fraction(exact['score'])),flush=True)
            print('LAW',rec['index'],'vmax',vmax,'grid',len(v),'cuts',len(bank),'score',score,
                  'rule_gap',rr['rule_minus_grid_score'],'atoms',len(support),'EU3',rr['moments']['EU3'],flush=True)
    args.output.write_text(json.dumps({'scope':__doc__,'results':results},indent=2)+'\n')


if __name__=='__main__':main()

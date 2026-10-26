#!/usr/bin/env python3
"""Reoptimize five moment coefficients with a frozen inherited Stein bank.

Floats propose a polynomial. The final whole-half-line certificate is checked
by rankone_law.py using exact rationals. Source majorants remain inherited.
"""
import argparse
from fractions import Fraction as Q
import importlib.util
import json
from pathlib import Path
import sys
import numpy as np
from scipy.optimize import linprog

sys.dont_write_bytecode=True
spec=importlib.util.spec_from_file_location('rankone_law',Path(__file__).with_name('rankone_law.py'))
L=importlib.util.module_from_spec(spec);spec.loader.exec_module(L)


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--selection',type=Path,required=True)
    p.add_argument('--row',type=int,required=True)
    p.add_argument('--cell',type=int,required=True)
    p.add_argument('--node',type=int,required=True)
    p.add_argument('--objective-x',default='1/10')
    p.add_argument('--x-upper',default='31/256')
    p.add_argument('--out',type=Path,required=True)
    a=p.parse_args();doc=json.loads(a.selection.read_text())
    old,new,bank=L.verify_source_selection(doc)
    inh=json.loads(Path(doc['construction']['inherited']).read_text());row=inh['rows'][a.row]
    cell=row['cells'][a.cell];n=cell['nodes'][a.node]
    tau=Q(n['tau'])/Q(row['delta']);rv,cuts=L.stein_pieces(row,cell,n)
    oldP=np.array([float(Q(x)) for x in n['P']])
    vv=np.unique(np.concatenate([np.linspace(0,8,20001),
          np.array([float(k/tau) for k in old.knots if k/tau<=8]),
          np.array([float(k/tau) for k in new.knots if k/tau<=8])]))
    def evalsource(src):
        xx=np.array(list(map(float,src.knots)))
        pp=np.array([list(map(float,p))+[0.]*(3-len(p)) for k,p in src.pieces])
        r=vv*float(tau);ii=np.maximum(0,np.searchsorted(xx,r,side='right')-1)
        return pp[ii,0]+pp[ii,1]*r+pp[ii,2]*r*r
    source=np.minimum(evalsource(old),evalsource(new))
    ci=np.maximum(0,np.searchsorted(np.array(list(map(float,rv))),vv,side='right')-1)
    G=np.empty_like(vv)
    for i in np.unique(ci):
        ids=np.where(ci==i)[0];c=np.array(list(map(float,cuts[i])));u=vv[ids]**2
        G[ids]=np.polynomial.polynomial.polyval(u,c[2:]) if i==0 else np.polynomial.polynomial.polyval(u,c)/u**2
    mat=np.column_stack([np.ones_like(vv),vv,vv**2,vv**4,vv**6])
    rhs=(source+G-mat@oldP)*1e6
    x=float(Q(a.objective_x));obj=np.array([1.,float(L.RHO),1.,2+x*x,6+9*x*x+float(L.C6)*x**3])
    fit=linprog(obj,A_ub=-mat,b_ub=-rhs,bounds=[(None,None),(-oldP[1]*1e6,None),(None,None),(None,None),(-oldP[4]*1e6,None)],method='highs')
    L.require(fit.success,fit.message)
    P=[Q(c)+Q(str(float(d)))/10**6 for c,d in zip(n['P'],fit.x)]
    P=[Q(-((-c.numerator*10**12)//c.denominator),10**12) for c in P]
    for eps in [Q(1,10**10),Q(1,10**9),Q(1,10**8),Q(1,10**7)]:
        trial=P.copy();trial[0]+=eps
        try:L.verify_min_node(old,new,tau,trial,rv,cuts)
        except ValueError:continue
        cert={'format':'rankone-reused-stein/v1','source_selection':str(a.selection),
              'source_selection_sha256':L.sha(a.selection),
              'node_ref':[a.row,a.cell,a.node],'new_P':list(map(str,trial)),
              'x_interval':['0',str(Q(a.x_upper))],
              'discovery':{'method':'five-coefficient LP, fixed old cuts, exact rational acceptance',
                           'objective_x':str(Q(a.objective_x)),'constant_rounding_allowance':str(eps)}}
        L.write_json(a.out,cert)
        ledger=L.verify_reused_stein(a.out,a.out.with_name(a.out.stem+'-ledger.json'))
        print(json.dumps(ledger,indent=2,sort_keys=True));return
    raise ValueError('LP proposal failed exact whole-half-line acceptance')


if __name__=='__main__':
    L.require(__debug__,'Do not use -O or -OO');main()

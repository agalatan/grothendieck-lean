#!/usr/bin/env python3
"""Explicit-scale law nodes with unchanged inherited Stein cuts.

Shifted-source discovery uses scipy; verification uses exact arithmetic.
The unshifted certificate format uses only original source caps and hence
retains NodeCaps without a rank-one or shifted-source premise.
The old law-chord comparison is conditional on the existing row node proofs
and convexity of their unshifted potential. In the shifted format only,
shifted caps and rank-one response extraction remain additional premises.
This tool certifies nodes; interpolation, box and global assembly are separate.
"""
import argparse
from fractions import Fraction as Q
import importlib.util
import json
from pathlib import Path
import sys

sys.dont_write_bytecode=True
sys.path.insert(0,str(Path(__file__).resolve().parent))
from rankone_source_paths import resolve_archived_handoff_path
spec=importlib.util.spec_from_file_location('rankone_law',Path(__file__).with_name('rankone_law.py'))
L=importlib.util.module_from_spec(spec);spec.loader.exec_module(L)

def context(selection,row_index,cut_ref,left_ref,right_ref,tau):
    source_doc=json.loads(selection.read_text());old,new,bank=L.verify_source_selection(source_doc)
    L.require(source_doc['row_index']==row_index,'row mismatch')
    inherited=resolve_archived_handoff_path(source_doc['construction']['inherited'],Path(__file__).resolve().parents[1])
    row=json.loads(inherited.read_text())['rows'][row_index]
    ci,ni=cut_ref;cell=row['cells'][ci];node=cell['nodes'][ni];rv,cuts=L.stein_pieces(row,cell,node)
    endpoints=[]
    for c,n in [left_ref,right_ref]:
        nd=row['cells'][c]['nodes'][n];endpoints.append((Q(nd['tau'])/Q(row['delta']),list(map(Q,nd['P']))))
    a,b=[v[0] for v in endpoints];L.require(0<a<=tau<=b and a<b,'new scale outside old law bracket')
    theta=(tau-a)/(b-a);baseline=[(1-theta)*u+theta*v for u,v in zip(endpoints[0][1],endpoints[1][1])]
    return old,new,bank,rv,cuts,baseline,[a,b],theta

def verify(path):
    doc=json.loads(path.read_text())
    if doc['format']=='needle-unshifted-explicit-scale/v1':return verify_unshifted(path)
    L.require(doc['format']=='needle-rankone-explicit-scale/v1','bad node format')
    selection=resolve_archived_handoff_path(doc['source_selection'],Path(__file__).resolve().parents[1])
    L.require(L.sha(selection)==doc['source_selection_sha256'],'source SHA mismatch')
    tau=Q(doc['tau']);old,new,bank,rv,cuts,baseline,bracket,theta=context(selection,doc['row_index'],doc['cut_ref'],doc['left_ref'],doc['right_ref'],tau)
    L.require(baseline==list(map(Q,doc['baseline_chord_P'])),'baseline chord mismatch')
    P=list(map(Q,doc['P']));proof=L.verify_min_node(old,new,tau,P,rv,cuts)
    xa,xb=map(Q,doc['x_interval']);L.require(0<=xa<=xb<=Q(31,4),'bad x interval')
    delta=[a-b for a,b in zip(baseline,P)];a0,a1,a2,a4,a6=delta
    saving=[a0+a1*L.RHO+a2+2*a4+6*a6,Q(0),a4+9*a6,L.C6*a6]
    floor=L.lower_bound(L.trim(saving),xa,xb)
    witness=L.node_negative_witness(old,tau,P,rv,cuts)
    return dict(status='PASS_EXACT_EXPLICIT_SCALE_NODE_CONDITIONAL_ON_SOURCE_CAPS',tau=str(tau),
        P=list(map(str,P)),baseline_scale_bracket=list(map(str,bracket)),baseline_chord_theta=str(theta),
        moment_saving_polynomial=list(map(str,saving)),uniform_moment_saving=str(floor),uniform_moment_saving_decimal=float(floor),
        old_source_negative_witness=witness,source_bank_c=bank['c'],source_bank_d=bank['d'],
        semiconvex_coefficient=bank['semiconvex_coefficient'],input_sha256=L.sha(path),**proof,
        remaining_hypotheses=['Hash-pinned shifted source caps and the rank-one response extraction are external analytic inputs; NodeCaps alone is insufficient.',
            'Baseline is the convex law-node chord for the original potential, not a claim that the raw piecewise source table is convex.',
            'No semiconvex scale bridge, fixed-box cap or global endpoint is asserted.'])

def verify_unshifted(path):
    doc=json.loads(path.read_text())
    inherited=resolve_archived_handoff_path(doc['inherited'],Path(__file__).resolve().parents[1])
    L.require(L.sha(inherited)==doc['inherited_sha256'],'inherited SHA mismatch')
    row=json.loads(inherited.read_text())['rows'][doc['row_index']]
    old=L.source_from_table(row['table'],row['smax'],Q(row['delta']))
    ci,ni=doc['cut_ref'];cell=row['cells'][ci];node=cell['nodes'][ni]
    rv,cuts=L.stein_pieces(row,cell,node);tau=Q(doc['tau']);P=list(map(Q,doc['P']))
    proof=L.verify_node(old,tau,P,rv,cuts)
    L.require(proof==doc['proof'],'saved exact proof statistics mismatch')
    endpoints=[]
    for c,n in [doc['left_ref'],doc['right_ref']]:
        nd=row['cells'][c]['nodes'][n];endpoints.append((Q(nd['tau'])/Q(row['delta']),list(map(Q,nd['P']))))
    a,b=[v[0] for v in endpoints];L.require(0<a<=tau<=b and a<b,'new scale outside old law bracket')
    theta=(tau-a)/(b-a);baseline=[(1-theta)*u+theta*v for u,v in zip(endpoints[0][1],endpoints[1][1])]
    L.require(baseline==list(map(Q,doc['baseline_chord_P'])),'old law-chord baseline mismatch')
    xa,xb=map(Q,doc['x_interval']);L.require(0<=xa<=xb<=Q(31,4),'invalid x comparison range')
    a0,a1,a2,a4,a6=[a-b for a,b in zip(baseline,P)]
    saving=[a0+a1*L.RHO+a2+2*a4+6*a6,Q(0),a4+9*a6,L.C6*a6]
    floor=L.lower_bound(L.trim(saving),xa,xb)
    L.require(floor==Q(doc['uniform_moment_saving']) and floor>0,'moment saving mismatch')
    return dict(status='PASS_EXACT_ORIGINAL_SOURCE_ONLY',tau=str(tau),uniform_moment_saving_decimal=float(floor),**proof,
        scope='Only the original unshifted row source caps and inherited Stein cuts; no shifted source or rank-one response premise.')

def propose(a):
    import numpy as np
    from scipy.optimize import linprog
    old,new,bank,rv,cuts,baseline,bracket,theta=context(a.selection,a.row,a.cut_ref,a.left_ref,a.right_ref,a.tau)
    vv=np.unique(np.concatenate([np.linspace(0,8,20001),np.array([float(k/a.tau) for src in [old,new] for k in src.knots if k/a.tau<=8])]))
    def sourceval(src):
        xx=np.array(list(map(float,src.knots)));pp=np.array([list(map(float,p))+[0.]*(3-len(p)) for k,p in src.pieces])
        r=vv*float(a.tau);ii=np.maximum(0,np.searchsorted(xx,r,side='right')-1)
        return pp[ii,0]+pp[ii,1]*r+pp[ii,2]*r*r
    source=np.minimum(sourceval(old),sourceval(new));ci=np.maximum(0,np.searchsorted(np.array(list(map(float,rv))),vv,side='right')-1);G=np.empty_like(vv)
    for i in np.unique(ci):
        ids=np.where(ci==i)[0];p=np.array(list(map(float,cuts[i])));u=vv[ids]**2
        G[ids]=np.polynomial.polynomial.polyval(u,p[2:]) if i==0 else np.polynomial.polynomial.polyval(u,p)/u**2
    mat=np.column_stack([np.ones_like(vv),vv,vv**2,vv**4,vv**6]);bp=np.array(list(map(float,baseline)));rhs=(source+G-mat@bp)*1e6
    x=float(a.objective_x);obj=np.array([1.,float(L.RHO),1.,2+x*x,6+9*x*x+float(L.C6)*x**3])
    fit=linprog(obj,A_ub=-mat,b_ub=-rhs,bounds=[(None,None),(-bp[1]*1e6,None),(None,None),(None,None),(-bp[4]*1e6,None)],method='highs')
    L.require(fit.success,fit.message)
    P=[c+Q(str(float(d)))/10**6 for c,d in zip(baseline,fit.x)];P=[Q(-((-c.numerator*10**12)//c.denominator),10**12) for c in P]
    for allowance in [Q(1,10**10),Q(1,10**9),Q(1,10**8),Q(1,10**7)]:
        trial=P.copy();trial[0]+=allowance
        try:L.verify_min_node(old,new,a.tau,trial,rv,cuts)
        except ValueError:continue
        doc=dict(format='needle-rankone-explicit-scale/v1',source_selection=str(a.selection),source_selection_sha256=L.sha(a.selection),
            row_index=a.row,cut_ref=a.cut_ref,left_ref=a.left_ref,right_ref=a.right_ref,tau=str(a.tau),P=list(map(str,trial)),
            baseline_chord_P=list(map(str,baseline)),x_interval=['0',str(a.x_upper)],
            discovery=dict(method='five-coefficient LP with unchanged inherited Stein cuts',objective_x=str(a.objective_x),constant_rounding_allowance=str(allowance)))
        L.write_json(a.out,doc);result=verify(a.out);L.write_json(a.out.with_name(a.out.stem+'-ledger.json'),result);return result
    raise ValueError('LP proposal failed exact whole-half-line acceptance')

def main():
    L.require(__debug__,'Reject -O/-OO: exact checks required')
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--verify',type=Path)
    p.add_argument('--selection',type=Path);p.add_argument('--row',type=int,default=14)
    p.add_argument('--cut-ref',type=int,nargs=2,default=[0,3]);p.add_argument('--left-ref',type=int,nargs=2,default=[1,2]);p.add_argument('--right-ref',type=int,nargs=2,default=[0,3])
    p.add_argument('--tau',type=Q);p.add_argument('--objective-x',type=Q,default=Q(1,20));p.add_argument('--x-upper',type=Q,default=Q(31,256));p.add_argument('--out',type=Path)
    a=p.parse_args();L.require(bool(a.verify) or all(v is not None for v in [a.selection,a.tau,a.out]),'select verification or supply selection/tau/out')
    result=verify(a.verify) if a.verify else propose(a)
    print(json.dumps({k:result[k] for k in ['status','tau','uniform_moment_saving_decimal','intervals','max_degree']},indent=2),flush=True)

if __name__=='__main__':main()

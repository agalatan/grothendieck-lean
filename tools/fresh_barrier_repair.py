#!/usr/bin/env python3
"""FLOAT discovery: can finite spectral PSD constraints be repaired cheaply?

The final laws, when requested, are independently checked with exact fractions.
LP status and finite support limits are not global objective certificates.
"""
from __future__ import annotations
import argparse
from fractions import Fraction as Q
import importlib.util
import json
from math import comb, isfinite
from pathlib import Path
import sys
if sys.flags.optimize:
    raise SystemExit("Repair discovery/replay refuses Python -O/-OO: assertions are proof checks.")
sys.dont_write_bytecode = True
import numpy as np
from scipy.optimize import linprog

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("fresh_spectral", HERE / "fresh_barrier_radial_spectral.py")
S = importlib.util.module_from_spec(spec)
spec.loader.exec_module(S)


def external(path, name):
    spec = importlib.util.spec_from_file_location(name, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def cut_values(node,u):
    """Floating copy of the frozen verifier's exact cut, for LP proposals only."""
    f=lambda v:float(Q(v))
    mesh=np.array([f(v)**2 for v in node['rv']])
    ph=np.array([f(v) for v in node['phi']]+[0.])
    integrals=np.r_[0.,np.cumsum((ph[:-1]+ph[1:])*np.diff(mesh)/2)]
    ii=np.minimum(np.searchsorted(mesh,u,side='right')-1,len(mesh)-1)
    lo=mesh[ii]
    slope=np.zeros_like(u)
    inner=ii<len(mesh)-1
    slope[inner]=(ph[ii[inner]+1]-ph[ii[inner]])/(mesh[ii[inner]+1]-lo[inner])
    du=u-lo
    phi=ph[ii]+slope*du
    Phi=integrals[ii]+ph[ii]*du+slope*du*du/2
    d=phi-np.divide(Phi,u,out=np.copy(phi),where=u>0)
    la,mu,tt,be,nu=[f(node.get(k,'0')) for k in ['lam','mu','t','beta','nu']]
    af,ag=la/3,mu/3
    if 'tensor_budget' in node:
        af,ag=f(node['tensor_budget']['A'])/2,f(node['tensor_budget']['B'])/2
    assert not node.get('extra_budgets')
    ff=-(phi+be)/2+(2*tt+af)*u
    gg=-d/2+(tt+ag-nu/2)*u
    ze=f(node.get('sixth_joint',{}).get('weight','0'))
    return ff*ff/la+gg*gg/mu+Phi-phi+(nu/3-2*tt)*(u*u-2)+ze*(-u**3+9*u*u-12)


def float_blocks(v, max_degree):
    blocks = []
    for k in range(2, max_degree+1):
        for parity in (0, 1):
            ii = list(range(parity, k+1, 2))
            T = np.empty((len(ii), len(ii), len(v)))
            for a,i in enumerate(ii):
                for b,j in enumerate(ii):
                    n = i+j
                    T[a,b] = (k-i*j/(n-1)) * comb(n,n//2) / 2**(n//2) * v**n
            blocks.append((k,parity,T))
    return blocks


def main():
    ap=argparse.ArgumentParser()
    ap.add_argument("law",type=Path)
    ap.add_argument("--source-repo",type=Path,default=HERE.parent,
                    help="isolated replay root containing the frozen verifier")
    ap.add_argument("--max-degree",type=int,default=6)
    ap.add_argument("--vmax",type=float,default=16)
    ap.add_argument("--iterations",type=int,default=100)
    ap.add_argument("--out",type=Path,required=True)
    args=ap.parse_args()
    try:
        S.validate_degree(args.max_degree)
    except ValueError as exc:
        ap.error(str(exc))
    if not isfinite(args.vmax) or args.vmax<8:
        ap.error("--vmax must be finite and at least 8")
    if args.iterations<1:
        ap.error("--iterations must be at least 1")
    frozen=args.source_repo/"tools/fresh_barrier_frozen_countermodel.py"
    if not frozen.is_file():
        ap.error(f"frozen verifier is missing: {frozen}")
    V=external(frozen,"frozen_verify")
    args.out.parent.mkdir(parents=True,exist_ok=True)
    d=json.loads(args.law.read_text())
    orig=np.array([float(Q(z["v"])) for z in d["support"]])
    # A dense central grid and a logarithmic sparse tail test the repair mechanism.
    v=np.unique(np.r_[np.linspace(0,3,601),np.linspace(3,8,201),
        np.geomspace(8,args.vmax,65),orig])
    u=v*v
    m2=2+float(Q(d["point"]["x"]))**2
    x=float(Q(d["point"]["x"]))
    m3=6+9*x*x+40.45313*x**3
    rawG=np.array([cut_values(z["data"],u) for z in d["cuts"]])
    scales=np.maximum(1e-8,np.max(np.abs(rawG[:,u<=8]),axis=1))
    objective=np.zeros_like(v)
    tau=float(Q(d["point"]["tau"]))
    for z in d["rows"]:
        row=z["row"]
        xx=np.array([float(Q(a)) for a,b in row["table"]])
        yy=np.array([float(Q(b)) for a,b in row["table"]])
        arg=float(Q(row["delta"]))*tau*v
        tab=np.interp(arg,xx,yy)
        tab=np.where(arg>xx[-1],yy[-1]+float(Q(row["smax"]))*
                     (arg-xx[-1]),tab)
        objective+=float(Q(z["weight"]))*tab
    Aub=[v,u**3/m3,*(-rawG/scales[:,None])]
    bub=[.973612157-1e-8,1-1e-8,*np.full(len(rawG),-1e-7)]
    Aeq=np.vstack([np.ones_like(u),u,u*u/m2])
    beq=np.ones(3)
    blocks=float_blocks(v,args.max_degree)
    # Matrix monomials are scaled against the original law, independently of LP weights.
    origw=np.zeros_like(v)
    for z in d["support"]:
        origw[np.argmin(abs(v-float(Q(z["v"]))))]=float(Q(z["weight"]))
    for i,(k,par,T) in enumerate(blocks):
        diag=np.sqrt(np.diag(T@origw))
        blocks[i]=(k,par,T/diag[:,None,None]/diag[None,:,None])
    history=[]
    floor=1e-6
    w=None
    column_scale=np.maximum(1.,v/8.)**(2*args.max_degree)
    for it in range(args.iterations):
        lp=linprog(-objective/column_scale,
                   A_ub=np.array(Aub)/column_scale,b_ub=np.array(bub),
                   A_eq=Aeq/column_scale,b_eq=beq,bounds=(0,None),method="highs",
                   options={"primal_feasibility_tolerance":1e-9,
                            "dual_feasibility_tolerance":1e-9})
        if not lp.success:
            print("LPFAIL",lp.message,flush=True)
            break
        w=lp.x/column_scale
        worst=1.
        added=0
        for k,par,T in blocks:
            M=T@w
            ev,vec=np.linalg.eigh(M)
            worst=min(worst,float(ev[0]))
            if ev[0]<floor*.99:
                z=vec[:,0]
                row=np.einsum("i,ijv,j->v",z,T,z)
                # A strict numerical floor is used only to make a replayable primal.
                Aub.append(-row)
                bub.append(-floor)
                added+=1
        rec={"iteration":it,"potential":float(objective@w),
             "worst_scaled_eigenvalue":worst,"new_cuts":added,
             "spectral_cuts":len(Aub)-len(rawG)-2}
        history.append(rec)
        print(d["index"],args.vmax,rec,flush=True)
        if not added:
            break
    result={"scope":__doc__,"source":str(args.law),"index":d["index"],
            "vmax":args.vmax,"max_degree":args.max_degree,"history":history}
    if w is not None:
        result.update(final_potential=float(objective@w),
            support=[{"v":float(a),"weight":float(q)} for a,q in zip(v,w) if q>1e-15],
            equality_error=float(np.max(abs(Aeq@w-beq))),
            max_scaled_inequality_violation=float(np.max(np.array(Aub)@w-np.array(bub))))
        tt=float(Q(d["point"]["t"]))
        ell=float(Q(d["row_parameters"]["ell"]))
        beta=float(Q(d["row_parameters"]["beta"]))
        price=float(Q(d["row_parameters"]["price"]))
        result["score"]=tt*tt-2*ell*tt+2*beta*beta/.745+objective@w-price*tau*tau+1e-11
        # Preserve the original exact table model and rationalize the new weights.
        picks=np.where(w>0)[0]
        vs=[Q(float(v[i])).limit_denominator(10**8) for i in picks]
        ws=[Q(float(w[i])) for i in picks]
        us=[a*a for a in vs]
        corridx=[0,len(ws)//2,len(ws)-1]
        targets=[Q(1),Q(1),2+Q(d["point"]["x"])**2]
        correction=V.solve3([[us[j]**i for j in corridx] for i in range(3)],
            [targets[i]-sum(q*a**i for q,a in zip(ws,us)) for i in range(3)])
        for j,delta in zip(corridx,correction):
            ws[j]+=delta
        new=dict(d)
        new["support"]=[{"v":str(a),"weight":str(q)} for a,q in zip(vs,ws)]
        path=args.out.with_name(args.out.stem+"-law-exact.json")
        path.write_text(json.dumps(new,indent=2)+"\n")
        try:
            checked=V.verify(new)
            moments=[sum(q*a**(2*i) for q,a in zip(ws,vs))
                     for i in range(args.max_degree+1)]
            spectral=S.probe(moments,args.max_degree)
            result["exact_original_model_verified"]=True
            result["exact_original_model_result"]=checked
            result["exact_spectral_tests"]=spectral
            result["all_spectral_blocks_psd_exact"]=all(b["psd_exact"]
                for r in spectral for b in r["blocks"])
            result["exact_law"]=str(path)
        except Exception as exc:
            result["exact_replay_error"]=repr(exc)
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(result,indent=2)+"\n")


if __name__=="__main__":
    main()

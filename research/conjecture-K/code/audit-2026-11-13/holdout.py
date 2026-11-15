#!/usr/bin/env python3
"""Fresh, rotation-conditioned polar Gaussian QMC for preselected candidates.
Agent-ID: codex-a713. Rotation preserves the exact Gaussian functional; it
places the dominant Wick component in the first coordinate for lower variance.
Selection is frozen from the first validation stage before holdout evaluation.
"""
import sys,os
sys.dont_write_bytecode=True
for key in ('VECLIB_MAXIMUM_THREADS','OPENBLAS_NUM_THREADS','OMP_NUM_THREADS'):os.environ[key]='1'
from pathlib import Path
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT))
import argparse,json,time,hashlib,math
import numpy as np
from scipy.stats import qmc,t as student_t
from threadpoolctl import threadpool_limits
from optimise import features,indices,Objective
from kernels import Kernels
from moments import rotate_to_driver,fourth_excess,shell_weights,wick_overlap


def main(a):
    threadpool_limits(limits=1);start=time.monotonic();kernel=Kernels(a.row)
    source=ROOT/f'validation_{a.row}_n{a.n}_{a.selection_label}_winners.json'
    selected=json.loads(source.read_text())
    if a.u is not None:selected=[s for s in selected if s['u']==a.u]
    cs=[]
    for s in selected:
        c=np.array(s['coefficients_real'])+1j*np.array(s['coefficients_imag'])
        v=np.array(s['wick_direction_real'])+1j*np.array(s['wick_direction_imag'])
        cp,W=rotate_to_driver(c,indices(a.n),v)
        cs.append((s,c,cp,W))
    # Known Wick reference means are deterministic radial integrals of the
    # same kernels. Their quadrature error is retained as a numerical error,
    # while the sample reference fluctuations cancel those of nearby tensors.
    calibrations={s['u']:kernel.calibrate(s['u']) for s,_,_,_ in cs} if a.wick_control else {}
    prefix='holdout_cv' if a.wick_control else 'holdout'
    out=ROOT/f'{prefix}_{a.row}_n{a.n}.jsonl'
    records=[json.loads(l) for l in out.read_text().splitlines()] if out.exists() else []
    done={(r['tensor'],r['digest'],r['replicate'],r['seed'],r['power']) for r in records}
    print(json.dumps({'event':'holdout_start','n':a.n,'selected':len(cs),'power':a.power,'replicates':a.replicates,
                     'wick_control':a.wick_control,'selection_source':str(source)}),flush=True)
    for rep in range(a.replicates):
        seed=a.seed+1000*a.n+31*rep
        todo=[c for c in cs if (c[0]['tensor'],c[0]['digest'],rep,seed,a.power) not in done]
        if not todo:continue
        if time.monotonic()-start>a.seconds:break
        eng=qmc.Sobol(2*a.n,scramble=True,seed=seed)
        count=2**a.power;chunk=2**min(a.power,19)
        DD=np.zeros(len(todo));CC=np.zeros((len(todo),a.n),complex)
        for offset in range(0,count,chunk):
            U=eng.random(chunk);np.clip(U,2**-53,1-2**-53,out=U)
            z=np.ascontiguousarray(np.sqrt(-np.log(U[:,::2]))*np.exp(2j*np.pi*U[:,1::2]))
            basis=features(z);qvalues=np.asfortranarray(basis@np.column_stack([c[2] for c in todo]))
            objects={u:Objective(z,basis,u,kernel) for u in {c[0]['u'] for c in todo}}
            references={}
            if a.wick_control:
                for u,obj in objects.items():
                    reference=np.zeros(basis.shape[1],complex);reference[0]=np.sqrt(u)
                    _r,rd,rc,_=obj.physical(reference,grad=False,q=np.sqrt(u)*basis[:,0])
                    references[u]=(rd,rc)
            for j,(s,c,cp,W) in enumerate(todo):
                obj=objects[s['u']]
                r,d,cr,_=obj.physical(cp,grad=False,q=qvalues[:,j])
                if a.wick_control:
                    phase=cp[0]/abs(cp[0]) if abs(cp[0]) else 1.+0j
                    rd,rc=references[s['u']];calibration=calibrations[s['u']]
                    d=d-rd+calibration['D']
                    cr=cr-phase*rc
                    cr[0]+=phase*calibration['C']
                DD[j]+=d*chunk/count;CC[j]+=W.T@cr*chunk/count
            del basis,qvalues,z,U,obj,objects,references
        for j,(s,c,cp,W) in enumerate(todo):
            rec={'tensor':s['tensor'],'digest':s['digest'],'n':a.n,'u':s['u'],'row':a.row,
                 'replicate':rep,'seed':seed,'seed_family':a.seed,'power':a.power,
                 'D':float(DD[j]),'C_real':CC[j].real.tolist(),'C_imag':CC[j].imag.tolist(),
                 'R':float(np.vdot(CC[j],CC[j]).real/DD[j]),'sampling':'rotated_polar_Gaussian_Sobol',
                 'selection_source':str(source),'wick_control':a.wick_control}
            if a.wick_control:
                phase=cp[0]/abs(cp[0]) if abs(cp[0]) else 1.+0j
                rec.update(reference_calibration=calibrations[s['u']],
                           reference_phase=[float(phase.real),float(phase.imag)])
            with out.open('a') as f:f.write(json.dumps(rec)+'\n')
            records.append(rec)
        print(json.dumps({'event':'replicate','n':a.n,'replicate':rep,'seconds':time.monotonic()-start}),flush=True)
    summary=[]
    for s,c,cp,W in cs:
        rr=[r for r in records if r['tensor']==s['tensor'] and r['digest']==s['digest']
            and r['seed_family']==a.seed and r['power']==a.power and r['replicate']<a.replicates]
        rr=list({r['replicate']:r for r in rr}.values())
        if not rr:continue
        D=np.array([r['D'] for r in rr]);C=np.array([np.array(r['C_real'])+1j*np.array(r['C_imag']) for r in rr])
        dm=D.mean();cm=C.mean(axis=0);num=np.vdot(cm,cm).real;R=num/dm
        inf=2*np.real((C-cm)@cm.conj())/dm-num/dm**2*(D-dm)
        se=float(np.std(inf,ddof=1)/np.sqrt(len(rr))) if len(rr)>1 else None
        o=dict(s);o.update(R=float(R),SE=se,halfwidth95=float(student_t.ppf(.975,len(rr)-1)*se) if se is not None else None,
            D=float(dm),C2=float(num),C_real=cm.real.tolist(),C_imag=cm.imag.tolist(),
            content_shares=(abs(cm)**2/num).tolist(),replicates=len(rr),complete=len(rr)==a.replicates,
            points_per_replicate=2**a.power,total_points=len(rr)*2**a.power,seed_family=a.seed,
            sampling='rotated_polar_Gaussian_Sobol',selection_source=str(source),wick_control=a.wick_control,
            original_validation_R=s['R'],original_validation_SE=s['SE'],
            replicate_R=[r['R'] for r in rr])
        if a.wick_control:o['reference_calibration']=calibrations[s['u']]
        summary.append(o)
    target=ROOT/f'{prefix}_{a.row}_n{a.n}_summary.json'
    target.write_text(json.dumps(summary,indent=2)+'\n')
    print(json.dumps({'event':'holdout_end','seconds':time.monotonic()-start,
      'results':[{k:s[k] for k in ('n','u','R','SE','halfwidth95','total_points')} for s in summary]}),flush=True)


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--n',type=int,required=True);p.add_argument('--row',default='peak')
    p.add_argument('--u',type=float);p.add_argument('--power',type=int,default=21);p.add_argument('--replicates',type=int,default=8)
    p.add_argument('--seed',type=int,default=23110713);p.add_argument('--seconds',type=int,default=1350)
    p.add_argument('--selection-label',default='polar_p19_r8')
    p.add_argument('--wick-control',action='store_true')
    main(p.parse_args())

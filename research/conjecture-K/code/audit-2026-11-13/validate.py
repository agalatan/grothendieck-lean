#!/usr/bin/env python3
"""Independent scrambled-Sobol validation of every trained tensor, codex-a713.
Default: eight independent scrambles of2**19 points;2**22 total per candidate.
Errors are between-scramble standard errors, not deterministic error bounds.
All writes are confined beside this script. Resumes by coefficient SHA256.
"""
import os,sys
sys.dont_write_bytecode=True
for key in ('VECLIB_MAXIMUM_THREADS','OPENBLAS_NUM_THREADS','OMP_NUM_THREADS'):os.environ[key]='1'
from pathlib import Path
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT))
import argparse,hashlib,json,time,math
import numpy as np
from threadpoolctl import threadpool_limits
from scipy.stats import t as student_t,qmc
from optimise import gaussian_points,features,Objective,indices
from kernels import Kernels
from moments import fourth_excess,wick_overlap,shell_weights,rotate_to_driver


def candidates(args):
    ans=[]
    pattern=args.pattern or f'tensor_{args.row}_n{args.n}_u*_r*.npz'
    for path in sorted(ROOT.glob(pattern)):
        with np.load(path) as a:
            c=a['coefficients'].astype(complex)
            u=float(a['u']);n=int(a['n']);row=str(a['row'])
            direction=a['content'].astype(complex)
        if n!=args.n or row!=args.row:continue
        digest=hashlib.sha256(c.tobytes()).hexdigest()
        cp,W=rotate_to_driver(c,indices(n),direction) if args.rotated_polar else (c,np.eye(n))
        ans.append(dict(path=str(path),digest=digest,c=c,cp=cp,W=W,u=u,n=n,row=row))
    return ans


def read_records(path):
    ans=[]
    if path.exists():
        for line in path.read_text().splitlines():
            try: ans.append(json.loads(line))
            except json.JSONDecodeError: raise RuntimeError('Incomplete JSONL record: '+str(path))
    return ans


def key(rec):return rec['tensor'],rec['digest'],rec['replicate'],rec['seed'],rec['power']


def summarize(args,cs,path):
    records=read_records(path)
    groups={}
    for rec in records:
        if rec['power']==args.power and rec['seed_family']==args.seed:
            groups.setdefault((rec['tensor'],rec['digest']),{})[rec['replicate']]=rec
    output=[]
    for c in cs:
        reps=groups.get((c['path'],c['digest']),{})
        rr=[reps[r] for r in range(args.replicates) if r in reps]
        if not rr:continue
        D=np.array([r['D'] for r in rr]); C=np.array([np.array(r['C_real'])+1j*np.array(r['C_imag']) for r in rr])
        dm=float(D.mean());cm=C.mean(axis=0);n0=float(np.vdot(cm,cm).real)
        R=n0/dm
        influences=2*np.real((C-cm)@cm.conj())/dm-n0/dm**2*(D-dm)
        se=float(np.std(influences,ddof=1)/math.sqrt(len(rr))) if len(rr)>1 else None
        ci=float(student_t.ppf(.975,len(rr)-1)*se) if se is not None else None
        o=dict(tensor=c['path'],digest=c['digest'],n=c['n'],u=c['u'],row=c['row'],replicates=len(rr),
            complete=len(rr)==args.replicates,points_per_replicate=2**args.power,total_points=len(rr)*2**args.power,
            R=R,SE=se,halfwidth95=ci,D=dm,C2=n0,F=float(np.mean([r['F'] for r in rr])),
            C_real=cm.real.tolist(),C_imag=cm.imag.tolist(),content_shares=(abs(cm)**2/n0).tolist(),
            replicate_R=[r['R'] for r in rr],replicate_D=D.tolist(),seed_family=args.seed,
            statistical_status='Randomized QMC replicate SE; no deterministic or global-optimization guarantee')
        output.append(o)
    suffix=args.label or f'p{args.power}_r{args.replicates}'
    outpath=ROOT/f'validation_{args.row}_n{args.n}_{suffix}_summary.json'
    outpath.write_text(json.dumps(output,indent=2)+'\n')
    wins=[]
    for u in sorted({c['u'] for c in cs}):
        eligible=[o for o in output if o['u']==u and o['complete']]
        if not eligible:continue
        best=max(eligible,key=lambda x:x['R']).copy()
        c=next(c for c in cs if c['path']==best['tensor'] and c['digest']==best['digest'])
        cm=np.array(best['C_real'])+1j*np.array(best['C_imag'])
        ix=indices(args.n)
        overlap=wick_overlap(c['c'],ix,content=cm)
        best.update(validated_candidates=len(eligible),fourth_excess_exact_formula=fourth_excess(c['c'],ix),
            wick_overlap_squared=overlap['overlap_squared'],wick_relative_distance=overlap['relative_distance'],
            wick_direction_real=overlap['direction'].real.tolist(),wick_direction_imag=overlap['direction'].imag.tolist(),
            shell_weights_in_wick_frame=shell_weights(c['c'],ix,overlap['direction']),
            coefficients_real=c['c'].real.tolist(),coefficients_imag=c['c'].imag.tolist(),indices=ix)
        wins.append(best)
    winpath=ROOT/f'validation_{args.row}_n{args.n}_{suffix}_winners.json'
    winpath.write_text(json.dumps(wins,indent=2)+'\n')
    return output,wins


def run(args):
    threadpool_limits(limits=1)
    start=time.monotonic();cs=candidates(args)
    suffix=args.label or f'p{args.power}_r{args.replicates}'
    path=ROOT/f'validation_{args.row}_n{args.n}_{suffix}.jsonl'
    previous=read_records(path);done={key(r) for r in previous}
    print(json.dumps(dict(event='start',n=args.n,candidates=len(cs),power=args.power,replicates=args.replicates,resume_records=len(previous))),flush=True)
    if not args.summarize_only:
        kernel=Kernels(args.row)
        stop=False
        for rep in range(args.replicates):
            seed=args.seed+1000*args.n+17*rep
            todo=[c for c in cs if (c['path'],c['digest'],rep,seed,args.power) not in done]
            if not todo:continue
            if time.monotonic()-start>=args.seconds:break
            #2**19 basis points maximum (about1.06GB at n=6).
            if args.rotated_polar:
                U=qmc.Sobol(2*args.n,scramble=True,seed=seed).random_base2(args.power)
                np.clip(U,2**-53,1-2**-53,out=U)
                zall=np.ascontiguousarray(np.sqrt(-np.log(U[:,::2]))*np.exp(2j*np.pi*U[:,1::2]))
                del U
            else:zall=gaussian_points(args.n,args.power,seed)
            chunk=2**min(args.power,19)
            sums={c['path']:{'D':0.,'C':np.zeros(args.n,complex)} for c in todo}
            for offset in range(0,len(zall),chunk):
                z=np.ascontiguousarray(zall[offset:offset+chunk]);basis=features(z)
                objects={u:Objective(z,basis,u,kernel) for u in {c['u'] for c in todo}}
                for batch_start in range(0,len(todo),args.batch):
                    group=todo[batch_start:batch_start+args.batch]
                    cbatch=np.asfortranarray(np.column_stack([c['cp'] for c in group]))
                    qbatch=np.asfortranarray(basis@cbatch)
                    for j,c in enumerate(group):
                        R,D,C,q=objects[c['u']].physical(c['cp'],grad=False,q=qbatch[:,j])
                        C=c['W'].T@C
                        sums[c['path']]['D']+=D*len(z)/len(zall)
                        sums[c['path']]['C']+=C*len(z)/len(zall)
                        # Default one-chunk runs checkpoint every candidate.
                        if len(zall)==chunk:
                            rec=dict(tensor=c['path'],digest=c['digest'],n=args.n,u=c['u'],row=args.row,
                                replicate=rep,seed=seed,seed_family=args.seed,power=args.power,D=D,
                                C_real=C.real.tolist(),C_imag=C.imag.tolist(),C2=float(np.vdot(C,C).real),
                                R=R,F=kernel.B(c['u'])-D,sampling='rotated_polar' if args.rotated_polar else 'normal_icdf')
                            with path.open('a') as f:f.write(json.dumps(rec)+'\n')
                            done.add(key(rec))
                        if len(zall)==chunk and time.monotonic()-start>=args.seconds:
                            stop=True;break
                    del qbatch,cbatch
                    if stop:break
                del objects,basis,z
                if stop:break
            if len(zall)>chunk:
                for c in todo:
                    a=sums[c['path']];D=a['D'];C=a['C'];N=float(np.vdot(C,C).real)
                    rec=dict(tensor=c['path'],digest=c['digest'],n=args.n,u=c['u'],row=args.row,
                        replicate=rep,seed=seed,seed_family=args.seed,power=args.power,D=D,
                        C_real=C.real.tolist(),C_imag=C.imag.tolist(),C2=N,R=N/D,F=kernel.B(c['u'])-D,
                        sampling='rotated_polar' if args.rotated_polar else 'normal_icdf')
                    with path.open('a') as f:f.write(json.dumps(rec)+'\n')
                    done.add(key(rec))
            del zall
            print(json.dumps(dict(event='replicate_complete' if not stop else 'time_limit',replicate=rep,n=args.n,
                                  candidates=len(todo),seconds=time.monotonic()-start)),flush=True)
            if stop:break
    output,wins=summarize(args,cs,path)
    print(json.dumps(dict(event='end',seconds=time.monotonic()-start,complete=sum(o['complete'] for o in output),
                         winners=[{k:o[k] for k in ('n','u','R','SE','validated_candidates','fourth_excess_exact_formula','wick_overlap_squared')} for o in wins])),flush=True)


if __name__=='__main__':
    p=argparse.ArgumentParser()
    p.add_argument('--n',type=int,required=True);p.add_argument('--row',default='peak')
    p.add_argument('--seconds',type=int,default=1500);p.add_argument('--power',type=int,default=19)
    p.add_argument('--replicates',type=int,default=8);p.add_argument('--seed',type=int,default=914731)
    p.add_argument('--batch',type=int,default=10)
    p.add_argument('--pattern');p.add_argument('--label');p.add_argument('--summarize-only',action='store_true')
    p.add_argument('--rotated-polar',action='store_true')
    run(p.parse_args())

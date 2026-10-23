#!/usr/bin/env python3
"""Sparse rational proposal for an independent fixed-law primal verifier.

The LP is discovery only; rational simplex weights are exported, and every
Gaussian integral and repaired global moment must be independently enclosed.
"""
import argparse,json
from fractions import Fraction as Q
from pathlib import Path
import numpy as np
from scipy.optimize import linprog

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('bank',type=Path);p.add_argument('--law',type=Path,required=True);p.add_argument('--out',type=Path,required=True);p.add_argument('--denominator',type=int,default=10**9);a=p.parse_args()
 src=json.loads(a.bank.read_text());law=json.loads(a.law.read_text());banks=src['banks'];sizes=list(map(len,banks));n=sum(sizes);wv=np.array([float(Q(v['weight']))for v in law['support']])
 eq=np.zeros((len(banks)+5,n));c=[];off=0
 for j,(w,bank)in enumerate(zip(wv,banks)):
  eq[j,off:off+len(bank)]=1
  for k,b in enumerate(bank):eq[len(banks):,off+k]=w*np.array(b['moments']);c.append(-w*b['fibre'])
  off+=len(bank)
 target=np.r_[np.ones(len(banks)),src['moments']]
 result=linprog(c,A_eq=eq,b_eq=target,bounds=(0,None),method='highs',options={'primal_feasibility_tolerance':1e-9,'dual_feasibility_tolerance':1e-9})
 if not result.success:raise RuntimeError(result.message)
 rational=[];active=[];offset=0
 for j,(size,bank)in enumerate(zip(sizes,banks)):
  x=np.maximum(result.x[offset:offset+size],0);nums=np.rint(x*a.denominator).astype(np.int64);nums[np.argmax(nums)]+=a.denominator-int(nums.sum())
  assert np.all(nums>=0);probs=[str(Q(int(v),a.denominator))for v in nums];rational.append(probs)
  for k,num in enumerate(nums):
   if num:
    b=bank[k];active.append({'atom_index':j,'branch_index':k,'probability':probs[k],'L_coefficients':[str(Q(str(v)))for v in b['L_coefficients']],'phase_D_coefficients':[str(Q(str(v)))for v in b['phase_D_coefficients']],'scale':str(Q(str(b['scale'])))})
  offset+=size
 wr=np.array([float(Q(v))for row in rational for v in row]);mom=eq[len(banks):]@wr
 out={**src,'rational_mixing_weights':rational,'sparse_support':active,'sparse_active_count':len(active),'sparse_lp_status':result.message,'sparse_lp_original_moment_residual':float(max(abs(eq@result.x-target))),'sparse_rational_moments':mom.tolist(),'sparse_rational_moment_residual':(mom-np.array(src['moments'])).tolist(),'sparse_rational_fibre':float(-np.array(c)@wr),'sparse_lp_fibre':float(-result.fun),'scope_sparse':__doc__}
 a.out.write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:out[k]for k in ['sparse_active_count','sparse_lp_status','sparse_lp_original_moment_residual','sparse_rational_moments','sparse_rational_moment_residual','sparse_rational_fibre']},indent=2))

if __name__=='__main__':main()

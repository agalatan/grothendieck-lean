#!/usr/bin/env python3
"""Discover then exactly verify a moment-forced gain from an anchor bank.

SciPy is used only for discovery; tools/rankone_law.py verifies every finite
inequality with fractions. Source integration bounds remain explicitly inherited
from the anchor bank. This file never modifies an existing certificate.
"""
import argparse
from fractions import Fraction as Q
import importlib.util
import json
from math import ceil
from pathlib import Path
import sys
import numpy as np
from scipy.optimize import linprog

sys.dont_write_bytecode=True
SPEC=importlib.util.spec_from_file_location('rankone_law',Path(__file__).with_name('rankone_law.py'))
L=importlib.util.module_from_spec(SPEC);SPEC.loader.exec_module(L)


def ceil_q(q,den=10**12):
    q=Q(q);return Q(-((-q.numerator*den)//q.denominator),den)


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--bank',type=Path,required=True)
    p.add_argument('--inherited',type=Path,default=Path('handoff/lower-stein/cert-jointmoment-lifted-codex/inherited.json'))
    p.add_argument('--row',type=int,required=True)
    p.add_argument('--tau',default='1/5')
    p.add_argument('--tau-upper')
    p.add_argument('--x-upper',default='31/256')
    p.add_argument('--mesh',default='1/1000')
    p.add_argument('--out-prefix',type=Path,required=True)
    a=p.parse_args()
    bank=json.loads(a.bank.read_text());inh=json.loads(a.inherited.read_text());row=inh['rows'][a.row]
    require=L.require
    require(Q(bank['delta'])==Q(row['delta']),'bank source scale differs')
    require(L.sha(bank['source_row'])==bank['source_row_sha256'],'bank source row hash mismatch')
    require(all(L.sha(r['bundle'])==r['bundle_sha256'] for r in bank['records']),'bank bundle hash mismatch')
    old=L.source_from_table(row['table'],row['smax'],Q(row['delta']))
    rawq=[list(map(Q,r['quadratic'])) for r in bank['records']]
    caps=[[ceil_q(c) for c in q] for q in rawq]
    require(all(all(x>=y for x,y in zip(p,q)) for p,q in zip(caps,rawq)),'upward rounding failed')
    # A global upper quadratic can be selected on any measurable cell.
    # Keep old source for r close to zero and beyond the inherited last knot.
    step=Q(a.mesh);require(step>0,'invalid mesh')
    end=old.knots[-1]
    selected_end=min(end,Q(6,5))
    mesh=sorted(set(old.knots+[i*step for i in range(int(selected_end/step)+1)]))
    polys=np.array([[float(c) for c in q] for q in caps])
    pieces=[];choices=[]
    for i,lo in enumerate(mesh):
        if i+1==len(mesh) or lo==0 or lo>=selected_end:
            q=old.at(lo);choice=-1
        else:
            mid=(lo+mesh[i+1])/2;v=float(mid)
            values=polys[:,0]+v*polys[:,1]+v*v*polys[:,2]
            choice=int(np.argmin(values));q=caps[choice]
            if L.value(q,mid)>=L.value(old.at(mid),mid):
                q=old.at(lo);choice=-1
        pieces.append((lo,q));choices.append(choice)
    new=L.Source(pieces)
    # LP variables are coefficients of q(tau*v), in units 1e-6.
    # Dense source probes propose candidates; exact whole-cell proof is later.
    tau=Q(a.tau);tau_hi=Q(a.tau_upper or a.tau);xhi=Q(a.x_upper)
    require(0<tau<=tau_hi,'invalid tau range')
    rr=np.unique(np.concatenate([np.linspace(0,1.1,10001),np.linspace(1.1,4.0,1001),[float(k) for k in mesh]]))
    savings=[]
    for r in rr:
        rq=Q(str(float(r)))
        savings.append(max(0.,float(L.value(old.at(rq),rq)-L.value(new.at(rq),rq)))*1e6)
    vv=rr/float(tau)
    mat=np.column_stack([np.ones_like(vv),vv,vv**2,vv**4,vv**6])
    x=float(xhi)
    objective=np.array([1.,float(L.RHO),1.,2+x*x,6+9*x*x+float(L.C6)*x**3])
    fit=linprog(-objective,A_ub=mat,b_ub=np.array(savings),bounds=[(None,None),(None,0),(None,None),(None,None),(None,0)],method='highs')
    require(fit.success,fit.message)
    # Exact certificate rationalizes to 1e-14 in v-coordinates, lowering its
    # constant until polynomial positivity is certified on every source cell.
    cc=[Q(str(float(c)))/10**6 for c in fit.x]
    cc=[Q(round(c*10**14),10**14) for c in cc]
    coeff=[c/tau**k for c,k in zip(cc,[0,1,2,4,6])]
    last_error=None
    for slack in [Q(1,10**12),Q(3,10**12),Q(1,10**11),Q(3,10**11),Q(1,10**10),Q(3,10**10),Q(1,10**9),Q(3,10**9),Q(1,10**8),Q(3,10**8),Q(1,10**7)]:
        trial=coeff.copy();trial[0]-=slack
        try:
            check=L.gain_minorant(old,new,trial)
            coeff=trial;break
        except ValueError as e:last_error=str(e)
    else:raise ValueError('Unable to certify discovered polynomial: '+str(last_error))
    floor=L.gain_floor(coeff,[tau,tau_hi],[0,xhi])
    conditional={
        'format':'rankone-gain/v1',
        'row_index':a.row,'row':bank['row'],
        'old_source_pieces':old.encode(),'new_source_pieces':new.encode(),
        'minorant':list(map(str,coeff)),
        'tau_interval':list(map(str,[tau,tau_hi])), 'x_interval':['0',str(xhi)],
        'claimed_gain':str(floor),
        'source_proof_obligations':['The anchor bank quadratic caps are valid for the stated affine rank-one profiles; its archived Gaussian C,h,H integrations are inherited unless individually replayed.',
          'The original rank-one row reduction and L10 positivity connect these source caps to the same response pair.',
          'The old source-node and tail caps, law moments, and any reused node cuts retain the existing analytic premises.'],
        'source_pad_ledger':{'external_PAD':'1/100000000000','multiplicity':1,
          'inequality':'actual selected F <= min(raw inherited table, bank cap) + PAD; retain the existing external row PAD once.'},
        'construction':{'bank':str(a.bank),'bank_sha256':L.sha(a.bank),'inherited':str(a.inherited),'inherited_sha256':L.sha(a.inherited),'rounded_bank_coefficients':list(map(lambda p:list(map(str,p)),caps)),
             'coefficient_rounding':'Every coefficient rounded upward to denominator 10^12, valid for all r>=0.',
             'source_piece_bank_record':choices,'old_source_choice':-1,
             'origin':'First source cell uses f=0 and the inherited source table; final tail also uses f=0.'}}
    result={'status':'PASS_SIGNED_MINORANT_NO_POSITIVE_MOMENT_GAIN' if floor<=0 else 'PASS_EXACT_LAW_GAIN_CONDITIONAL_ON_SOURCE_CAPS',
         'row':bank['row'],'row_index':a.row,'gain_floor':str(floor),'gain_floor_display':float(floor),
         'tau_interval':conditional['tau_interval'],'x_interval':conditional['x_interval'],
         'source_cells':len(mesh),'used_anchor_records':len(set(c for c in choices if c>=0)),
         'minorant':conditional['minorant'],**check,
         'inputs':{'bank_sha256':L.sha(a.bank),'inherited_sha256':L.sha(a.inherited)},
         'scope':'Finite source-cap selection and moment-minorant check. A nonpositive floor asserts no positive moment-only saving. Source Gaussian caps are inherited; this is not a whole-cover or endpoint certificate.'}
    L.write_json(str(a.out_prefix)+'-certificate.json',conditional)
    L.write_json(str(a.out_prefix)+'-ledger.json',result)
    print(json.dumps(result,indent=2,sort_keys=True))


if __name__=='__main__':
    L.require(__debug__,'Do not use -O or -OO')
    main()

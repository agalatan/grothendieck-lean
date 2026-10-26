#!/usr/bin/env python3
"""A bounded continuation in one chosen asymmetric quadratic-phase direction.

No endpoint claim: all D values omit the infinite coefficient tail.
"""
import argparse
import json
from pathlib import Path
import numpy as np
from scipy.optimize import brentq
from fresh_upper_quadratic_kernel import Candidate,row,cauchy_coefficients


def continuation():
    J=np.array([[0,-1j],[1j,0]],complex)
    def candidate(a,h):
        return Candidate(f'asym-J-h{h:+g}-a{a:.12g}',row(1,a),row(1,-a),h*J,-h*J/3)
    rows=[]
    for h in [-.04,-.02,-.01,0.,.01,.02,.04]:
        def cubic(a):
            c,_=cauchy_coefficients(candidate(a,h),degree=5,radius=.25,points=128)
            return c[3].real
        a=brentq(cubic,.12,.6,xtol=2e-14)
        x=candidate(a,h)
        coefficients,b=cauchy_coefficients(x,51,.9,4096)
        c=coefficients.real
        rows.append({'h':h,'a':a,'D_head':float(c[1]-np.sum(abs(c[3::2]))),
                     'cubic':float(c[3]),'first_coefficients':c[1:14:2].tolist(),
                     'candidate':x.to_json(),'branches':b})
    return {'status':'FLOATING HEAD ONLY; one asymmetric direction, cubic cancelled',
            'direction':'H=h[[0,-i],[i,0]], K=−H/3; u∝(1,a), v∝(1,−a)',
            'rows':rows,'best_h':max(rows,key=lambda r:r['D_head'])['h']}


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--output',type=Path,required=True)
    a=p.parse_args();r=continuation()
    a.output.write_text(json.dumps(r,indent=2)+'\n')
    print(json.dumps({'status':r['status'],'rows':[
        {k:x[k] for k in ['h','a','D_head','cubic']} for x in r['rows']],
        'best_h':r['best_h']},indent=2))

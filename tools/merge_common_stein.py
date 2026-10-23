#!/usr/bin/env python3
"""Exactly merge two inherited Stein tests before squaring their common scores.

Discovery scans only the old cuts with mu=lambda/2, t=-lambda/6, nu=0.
Each is divided by lambda, so every pair has identical perspective prices.
The merged test has no new analytic premise. Its exact negative expectation
excludes the saved law although BOTH constituent expectations are nonnegative.
"""
from copy import deepcopy
from fractions import Fraction as Q
import argparse
import json
from pathlib import Path
import sys
sys.path.insert(0,str(Path(__file__).resolve().parent))
import separate_common_stein as sep


def normalized(c):
    lam=Q(c['lam'])
    out=deepcopy(c)
    out['phi']=[str(Q(a)/lam) for a in c['phi']]
    for k in ['lam','mu','t','beta','nu']:out[k]=str(Q(c.get(k,'0'))/lam)
    return out


def merge(c1,c2,theta):
    rv=sorted(set(map(Q,c1['rv']))|set(map(Q,c2['rv'])))
    ph=[]
    for r in rv[:-1]:
        p1=sep.exact_profile(c1,r*r)[0];p2=sep.exact_profile(c2,r*r)[0]
        ph.append(str(theta*p1+(1-theta)*p2))
    return {'rv':list(map(str,rv)),'phi':ph,
            **{k:str(theta*Q(c1.get(k,'0'))+(1-theta)*Q(c2.get(k,'0'))) for k in ['lam','mu','t','beta','nu']}}


def verify(cert):
    result=sep.verify(cert)
    w=Q(cert['mixing_weight']); assert 0<w<1
    assert len(cert['constituents'])==2
    c1,c2=[normalized(a['data']) for a in cert['constituents']]
    for c in [c1,c2]:
        rv=list(map(Q,c['rv']))
        assert rv[0]==0 and all(a<b for a,b in zip(rv,rv[1:]))
        assert len(c['phi'])==len(rv)-1
        assert not any(c.get(k) for k in ['tensor_budget','sixth_joint','extra_budgets'])
        assert [Q(c[k]) for k in ['lam','mu','t','nu']]==[Q(1),Q(1,2),Q(-1,6),Q(0)]
    assert merge(c1,c2,w)==cert['cut']
    atoms=[(Q(a['v'])**2,Q(a['weight'])) for a in cert['law']['support']]
    old=[sum(p*sep.exact_cut(c,u) for u,p in atoms) for c in [c1,c2]]
    assert all(a>=0 for a in old)
    gain=Q(0)
    for u,p in atoms:
        values=[]
        for c in [c1,c2]:
            phi,Phi,d=sep.exact_profile(c,u)
            values.append((-(phi+Q(c['beta']))/2,-d/2))
        gain+=p*((values[0][0]-values[1][0])**2+2*(values[0][1]-values[1][1])**2)
    actual=Q(result['expectation'])
    assert actual==w*old[0]+(1-w)*old[1]-w*(1-w)*gain
    result.update({'constituent_expectations':list(map(str,old)),
                   'constituent_expectations_float':list(map(float,old)),
                   'variance_saving':str(w*(1-w)*gain),'variance_saving_float':float(w*(1-w)*gain)})
    return result


def propose(law):
    import numpy as np
    bank=[]
    for item in law['cuts']:
        c=item['data'];la=Q(c['lam'])
        if c.get('tensor_budget') or c.get('sixth_joint') or c.get('extra_budgets'): continue
        if Q(c['mu'])!=la/2 or Q(c['t'])!=-la/6 or Q(c.get('nu','0')):continue
        bank.append(item)
    assert len(bank)>1
    atoms=[(Q(a['v'])**2,Q(a['weight'])) for a in law['support']]
    weights=np.array([float(p) for u,p in atoms]); F=[]; D=[]; scores=[]
    for item in bank:
        c=normalized(item['data']);v=[sep.exact_profile(c,u) for u,p in atoms]
        F.append([float(-(phi+Q(c['beta']))/2) for phi,Phi,d in v]);D.append([float(-d/2) for phi,Phi,d in v])
        scores.append(float(sum(p*sep.exact_cut(c,u) for u,p in atoms)))
    F,D=np.array(F),np.array(D); scores=np.array(scores)
    gram=(F*weights)@F.T+2*(D*weights)@D.T
    diag=np.diag(gram);variance=np.maximum(0,diag[:,None]+diag[None,:]-2*gram)
    denom=np.maximum(variance,1e-100)
    mixing=np.clip((variance+scores[None,:]-scores[:,None])/(2*denom),0,1)
    merged=mixing*scores[:,None]+(1-mixing)*scores[None,:]-mixing*(1-mixing)*variance
    j,k=np.unravel_index(np.argmin(merged),merged.shape)
    theta=Q(float(mixing[j,k])).limit_denominator(10**8)
    cert={'scope':__doc__,'law':{s:law[s] for s in ['index','point','support']},
          'mixing_weight':str(theta),'constituents':[bank[j],bank[k]],
          'cut':merge(normalized(bank[j]['data']),normalized(bank[k]['data']),theta),
          'discovery':{'cuts_scanned':len(bank),'float_expectation':float(merged[j,k])}}
    cert['exact_replay']=verify(cert)
    return cert


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('input',type=Path)
    p.add_argument('--out',type=Path);p.add_argument('--verify',action='store_true');a=p.parse_args()
    data=json.loads(a.input.read_text())
    if a.verify:
        r=verify(data)
        print('PASS exact two-cut common-kernel merge',r['index'],r['expectation_float'],r['constituent_expectations_float'],flush=True)
    else:
        assert a.out is not None
        r=propose(data);a.out.write_text(json.dumps(r,indent=2)+'\n')
        rr=r['exact_replay']
        print('PASS exact two-cut common-kernel merge',rr['index'],rr['expectation_float'],rr['constituent_expectations_float'],flush=True)


if __name__=='__main__':main()

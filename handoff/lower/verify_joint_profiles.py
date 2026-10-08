#!/usr/bin/env python3
"""Independent exact audit of coupled residual-moment profile certificates.

Prerequisites are the checked global physical polynomials and cubic-moment
inequalities. No proposal optimizer or source rectangle routine is used.
"""

if not __debug__:
    raise RuntimeError('Assertions are proof gates; do not use Python -O or -OO.')

from fractions import Fraction as Q
from math import comb
from pathlib import Path
import argparse,importlib.util,json
HERE=Path(__file__).resolve().parent
RHO=Q('0.977459');C6=Q('49.42289');EPS=Q(37,50);LIFT=Q(1,10**8)

def bernstein(p,lo,hi):
    n=len(p)-1
    power=[sum((p[j]*comb(j,k)*lo**(j-k)*(hi-lo)**k for j in range(k,n+1)),Q(0)) for k in range(n+1)]
    return [sum((power[j]*Q(comb(k,j),comb(n,j)) for j in range(k+1)),Q(0)) for k in range(n+1)]

def box_from_path(path):
    assert isinstance(path,str) and all(c in '01' for c in path)
    box=[Q(0),RHO,Q(0),Q(31,4)]
    for depth,side in enumerate(path):
        a=2*(depth%2);mid=(box[a]+box[a+1])/2
        if side=='0':box[a+1]=mid
        else:box[a]=mid
    return tuple(box)

def physical_coefficients(p,scale,x):
    assert len(p)==7 and p[3]==p[5]==0 and p[1]>=0 and p[6]>=0
    return [p[0],RHO*p[1]*scale,p[2]*scale**2,Q(0),
            p[4]*scale**4*(2+x*x),Q(0),p[6]*scale**6*(6+9*x*x+C6*x**3)]

def main():
    assert __debug__
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source',type=Path,required=True)
    parser.add_argument('--base',type=Path,default=HERE/'base')
    parser.add_argument('--certificate',type=Path,default=HERE/'coupled-profiles.json')
    args=parser.parse_args()
    import hashlib
    assert hashlib.sha256(args.source.read_bytes()).hexdigest()=='8c6105340cced0ee4b4d4977baab4c0d43f07466ce77e726eb1277b613473ac1'
    spec=importlib.util.spec_from_file_location('original_data',args.source)
    v=importlib.util.module_from_spec(spec);spec.loader.exec_module(v)
    extra=json.loads((args.base/'certificates/additional-polynomials.json').read_text())
    ps=[]
    for g in v.DATA:
        rows=[]
        for rec in g['polynomials']+extra.get(g['profile']['id'],[]):
            p=list(map(Q,rec['coefficients']));p[0]+=LIFT;rows.append(p)
        ps.append(rows)
    cert=json.loads(args.certificate.read_text());assert cert
    total=0
    for record in cert:
        assert Q(record['rho'])==RHO and Q(record['sixth'])==C6 and Q(record['lift'])==LIFT
        i,j=record['indices'];assert 0<=i<len(v.DATA) and 0<=j<len(v.DATA) and i!=j
        pi,pj=v.DATA[i]['profile'],v.DATA[j]['profile']
        assert record['profiles']==[pi['id'],pj['id']]
        a=Q(record['weight']);assert 0<a<1
        di,dj=Q(pi['delta']),Q(pj['delta'])
        for key in ('ell','beta'):
            assert Q(record[key])==a*Q(pi[key])+(1-a)*Q(pj[key])
        original_delta=a*di+(1-a)*dj
        scales=tuple(map(Q,record.get('argument_scales',[str(di),str(dj)])))
        assert len(scales)==2 and all(s>=0 for s in scales)
        assert a*scales[0]+(1-a)*scales[1]==original_delta
        penalty=Q(0)
        tightening=record.get('tightening')
        if tightening:
            profile=tightening['profile']
            v.profile_gate(profile)
            assert Q(record['original_delta'])==original_delta
            assert Q(tightening['old_delta'])==original_delta
            assert Q(tightening['weight'])==a
            for key in ('ell','beta'):
                assert Q(profile[key])==Q(record[key])
            for key in ('M_E','M_R','M_I'):
                expected=[[a*Q(x)+(1-a)*Q(y) for x,y in zip(r,s)]
                          for r,s in zip(pi[key],pj[key])]
                assert [[Q(x) for x in row] for row in profile[key]]==expected
            delta=Q(profile['delta'])
            assert 0<delta<=original_delta
            assert Q(record['delta'])==Q(tightening['new_delta'])==delta
            penalty=original_delta**2/delta-original_delta
            assert Q(record['extra_u2_penalty'])==Q(tightening['extra_u2_penalty'])==penalty
        else:
            assert Q(record['delta'])==original_delta
        gain=2*a*(1-a)*(Q(pi['beta'])-Q(pj['beta']))**2/EPS
        assert Q(record['gain'])==gain
        cap=Q(record['cap'])
        paths=sorted(leaf['path'] for leaf in record['leaves'])
        assert paths and len(set(paths))==len(paths)
        assert all(not b.startswith(a) for a,b in zip(paths,paths[1:]))
        maxdepth=max(map(len,paths))
        assert sum(1<<(maxdepth-len(p)) for p in paths)==1<<maxdepth
        for leaf in record['leaves']:
            lo,hi,xlo,xhi=box_from_path(leaf['path'])
            assert (lo,hi,xlo,xhi)==tuple(map(Q,leaf['box']))
            leaf_scales=tuple(map(Q,leaf.get('argument_scales',scales)))
            assert len(leaf_scales)==2 and all(s>=0 for s in leaf_scales)
            assert a*leaf_scales[0]+(1-a)*leaf_scales[1]==original_delta
            ki,kj=leaf['polynomials']
            assert 0<=ki<len(ps[i]) and 0<=kj<len(ps[j])
            for x in (xlo,xhi):
                ci=physical_coefficients(ps[i][ki],leaf_scales[0],x)
                cj=physical_coefficients(ps[j][kj],leaf_scales[1],x)
                p=[a*u+(1-a)*w for u,w in zip(ci,cj)]
                p[0]-=gain;p[2]-=original_delta+penalty
                assert max(bernstein(p,lo,hi))<=cap,record['profiles']
        total+=len(paths)
        print('PASS',record['profiles'],'weight',a,'cap',cap,'leaves',len(paths),flush=True)
    print('ALL COUPLED PROFILE BOUNDS AND DYADIC COVERS PASSED',len(cert),'profiles',total,'leaves')

if __name__=='__main__':main()

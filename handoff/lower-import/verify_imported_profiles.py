#!/usr/bin/env python3
"""Independent exact audit of imported physical polynomials and coupled caps.

Checks all old and pooled physical polynomials against lifted source chords
and the infinite affine tail, then every profile matrix gate, argument-scale
identity, moment rectangle, and full dyadic cover. The sharper C6 certificate
is checked first. Gaussian price integration, the established rho theorem,
and the operator-to-potential analytic reduction remain prerequisites.

No numerical optimization or conditional first-moment bound is used here.
"""
if not __debug__:
    raise RuntimeError('Do not use Python -O or -OO: assertions are proof gates.')

import argparse,hashlib,importlib.util,json
from fractions import Fraction as Q
from pathlib import Path

HERE=Path(__file__).resolve().parent
SOURCE_SHA256='8c6105340cced0ee4b4d4977baab4c0d43f07466ce77e726eb1277b613473ac1'
EPS=Q(37,50);RHO=Q(977459,1000000);C6=Q(4942288923,100000000);LIFT=Q(1,10**8)

def load_module(name,path):
    spec=importlib.util.spec_from_file_location(name,path)
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
    return module

def shifted(p,lo):
    # Horner substitution p(lo+y), independent of the proposal program.
    answer=[]
    for a in reversed(p):
        if answer:
            nxt=[Q(0)]*(len(answer)+1)
            for i,c in enumerate(answer):nxt[i]+=lo*c;nxt[i+1]+=c
            answer=nxt
        else:answer=[Q(0)]
        answer[0]+=a
    return answer

def physical_polynomial(group,record,bernstein):
    """Verify one lifted global majorant; no source verifier routine used."""
    points=[(Q(p['r']),Q(p['cap'])+LIFT) for p in group['points']]
    assert points and points[0][0]==0
    assert all(a[0]<b[0] for a,b in zip(points,points[1:]))
    supports=[]
    for (x,a),(y,b) in zip(points,points[1:]):
        slope=(b-a)/(y-x)
        supports.append(([a-slope*x,slope],x,y))
    x,a=points[-1];supports.append(([a-2*x,Q(2)],x,None))
    p=list(map(Q,record['coefficients']))
    assert len(p)==7 and p[3]==p[5]==0 and p[1]>=0 and p[6]>=0
    p[0]+=LIFT
    proof=record['physical'];tail=Q(proof['tail_start']);previous=Q(0)
    assert tail>=0
    for row in proof['cells']:
        assert len(row)==3
        lo,hi=map(Q,row[:2]);idx=row[2]
        assert isinstance(idx,int) and not isinstance(idx,bool) and 0<=idx<len(supports)
        assert lo==previous and lo<hi<=tail
        line,left,right=supports[idx]
        assert lo>=left and (right is None or hi<=right)
        gap=p.copy();gap[0]-=line[0];gap[1]-=line[1]
        assert min(bernstein(gap,lo,hi))>=0
        previous=hi
    assert previous==tail
    idx=proof['tail_index'];assert isinstance(idx,int) and not isinstance(idx,bool) and 0<=idx<len(supports)
    line,left,right=supports[idx]
    assert right is None and tail>=left
    gap=p.copy();gap[0]-=line[0];gap[1]-=line[1]
    assert min(shifted(gap,tail))>=0
    return p

def covered_paths(leaves):
    paths=[leaf['path'] for leaf in leaves]
    assert paths and all(isinstance(s,str) and set(s)<=set('01') for s in paths)
    paths.sort()
    assert len(paths)==len(set(paths))
    assert all(not b.startswith(a) for a,b in zip(paths,paths[1:]))
    depth=max(map(len,paths))
    assert sum(1<<(depth-len(p)) for p in paths)==1<<depth
    return paths

def box_from_path(path):
    box=[Q(0),RHO,Q(0),Q(31,4)]
    for level,digit in enumerate(path):
        axis=2*(level%2);mid=(box[axis]+box[axis+1])/2
        if digit=='0':box[axis+1]=mid
        else:box[axis]=mid
    return tuple(box)

def physical_moments(p,scale,x):
    assert p[1]>=0 and p[6]>=0 and scale>=0 and x>=0
    return [p[0],RHO*p[1]*scale,p[2]*scale**2,Q(0),
            p[4]*scale**4*(2+x*x),Q(0),
            p[6]*scale**6*(6+9*x*x+C6*x**3)]

def averaged_matrix(first,second,w):
    assert len(first)==len(second)
    assert all(len(a)==len(b) for a,b in zip(first,second))
    return [[w*Q(a)+(1-w)*Q(b) for a,b in zip(r,s)] for r,s in zip(first,second)]

def read_scales(value,w,d):
    assert len(value)==2
    scales=tuple(map(Q,value))
    assert min(scales)>=0 and w*scales[0]+(1-w)*scales[1]==d
    return scales

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source',type=Path,required=True)
    parser.add_argument('--pool',type=Path,required=True)
    parser.add_argument('--certificate',type=Path,required=True)
    adjacent_helper=HERE/'verify_moment_refinements.py'
    default_helper=adjacent_helper if adjacent_helper.is_file() else HERE/'moments/verify_moment_refinements.py'
    parser.add_argument('--moment-helper',type=Path,default=default_helper,
                        help='Exact helper; defaults to adjacent file, then moments/ subfolder.')
    parser.add_argument('--c6-certificate',type=Path,
                        help='Defaults to sharper_c6.json beside the moment helper.')
    args=parser.parse_args()
    moments=load_module('independent_moment_refinements',args.moment_helper)
    assert moments.C6==C6 and moments.RHO==RHO
    c6_certificate=args.c6_certificate or args.moment_helper.with_name('sharper_c6.json')
    count=moments.verify_c6(c6_certificate)
    print('PASS sharper C6',C6,'intervals',count,flush=True)
    bernstein=moments.bernstein_on_interval
    assert hashlib.sha256(args.source.read_bytes()).hexdigest()==SOURCE_SHA256
    source=load_module('pinned_original_lower',args.source)
    pool=json.loads(args.pool.read_text())
    assert isinstance(pool,dict)
    ids={g['profile']['id'] for g in source.DATA}
    assert set(pool)<=ids
    polynomials=[];physical_count=0
    for group in source.DATA:
        profile=group['profile'];source.profile_gate(profile)
        records=group['polynomials']+pool.get(profile['id'],[])
        rows=[physical_polynomial(group,p,bernstein) for p in records]
        polynomials.append(rows);physical_count+=len(rows)
        print('PASS global physical majorants',profile['id'],len(rows),flush=True)
    cert=json.loads(args.certificate.read_text())
    assert isinstance(cert,list) and cert
    total=0
    for record in cert:
        assert Q(record['rho'])==RHO and Q(record['sixth'])==C6 and Q(record['lift'])==LIFT
        assert len(record['indices'])==2
        i,j=record['indices']
        assert all(isinstance(k,int) and not isinstance(k,bool) and 0<=k<len(source.DATA) for k in (i,j)) and i!=j
        pi,pj=source.DATA[i]['profile'],source.DATA[j]['profile']
        assert record['profiles']==[pi['id'],pj['id']]
        weight=Q(record['weight']);assert 0<weight<1
        di,dj=Q(pi['delta']),Q(pj['delta'])
        d=weight*di+(1-weight)*dj
        for key in ('ell','beta'):
            assert Q(record[key])==weight*Q(pi[key])+(1-weight)*Q(pj[key])
        scales=read_scales(record.get('argument_scales',[str(di),str(dj)]),weight,d)
        tightened=record.get('tightening')
        if tightened:
            profile=tightened['profile'];source.profile_gate(profile)
            assert Q(record['original_delta'])==Q(tightened['old_delta'])==d
            assert Q(tightened['weight'])==weight
            if 'indices' in tightened:assert tightened['indices']==[i,j]
            for key in ('ell','beta'):assert Q(profile[key])==Q(record[key])
            for key in ('M_E','M_R','M_I'):
                assert [[Q(x) for x in row] for row in profile[key]]==averaged_matrix(pi[key],pj[key],weight)
            delta=Q(profile['delta']);assert 0<delta<=d
            assert Q(record['delta'])==Q(tightened['new_delta'])==delta
            penalty=d*d/delta-d
            assert Q(record['extra_u2_penalty'])==Q(tightened['extra_u2_penalty'])==penalty
        else:
            delta=d;assert Q(record['delta'])==delta
        gain=2*weight*(1-weight)*(Q(pi['beta'])-Q(pj['beta']))**2/EPS
        assert Q(record['gain'])==gain
        cap=Q(record['cap']);paths=covered_paths(record['leaves'])
        for leaf in record['leaves']:
            assert not leaf.get('contacts'), 'This checker intentionally uses constant rho only.'
            box=box_from_path(leaf['path'])
            assert len(leaf['box'])==4 and tuple(map(Q,leaf['box']))==box
            lo,hi,xlo,xhi=box
            ls=read_scales(leaf.get('argument_scales',scales),weight,d)
            assert len(leaf['polynomials'])==2
            ki,kj=leaf['polynomials']
            assert all(isinstance(k,int) and not isinstance(k,bool) for k in (ki,kj))
            assert 0<=ki<len(polynomials[i]) and 0<=kj<len(polynomials[j])
            for x in (xlo,xhi):
                one=physical_moments(polynomials[i][ki],ls[0],x)
                two=physical_moments(polynomials[j][kj],ls[1],x)
                p=[weight*a+(1-weight)*b for a,b in zip(one,two)]
                p[0]-=gain;p[2]-=d*d/delta
                assert max(bernstein(p,lo,hi))<=cap,(record['profiles'],record['weight'],leaf['path'])
        total+=len(paths)
        print('PASS coupled cap',record['profiles'],'weight',weight,'cap',cap,'leaves',len(paths),flush=True)
    print('ALL IMPORTED PROFILE CHECKS PASSED',len(cert),'profiles',total,'leaves',physical_count,'global physical majorants',flush=True)

if __name__=='__main__':main()

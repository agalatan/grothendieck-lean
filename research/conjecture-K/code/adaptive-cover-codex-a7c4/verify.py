#!/usr/bin/env python3
"""Agent-ID: codex-a7c4. Refs #431. Amplitude-adaptive spatial boxes of (P).

Fresh interval corner checks, exact tensor interpolation and exact coverage.
The output certifies only the explicit tube, never the full compact interior.
SHARD/NSHARDS partition jobs. --combine requires every job exactly once.
"""
import argparse
from fractions import Fraction as F
import hashlib
import importlib.util
import itertools
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile

if not __debug__:
    raise RuntimeError('Assertions must be enabled')
HERE = Path(__file__).resolve().parent
CODE = HERE.parent
REPO = HERE.parents[3]
spec = importlib.util.spec_from_file_location('normalized', CODE/'normalized-remainder-codex-a7c4/verify.py')
OLD = importlib.util.module_from_spec(spec)
spec.loader.exec_module(OLD)
PC = F(2500,1891)-F(463,5000)
RHO = F(5053,10000)
QA = PC-F(67,100)-F(2,25)*RHO**2
QB = PC-F(67,100)*RHO**2-F(2,25)
PARTIAL = 'PASS assigned corners; full (P) remains open'
COMPLETE = 'PASS amplitude-adaptive tube; full (P) remains open'


def dyadic_up(x):
    y=x*2**24
    return F(-(-y.numerator//y.denominator),2**24)


def bands():
    # (tau lower, tau upper, direction halfwidth, shift full width, subdivisions)
    return [(F(1,64),F(1,8),F(1,8),F(1,64),24),
            (F(1,8),F(1,4),F(1,16),F(1,128),8),
            (F(1,4),F(1,2),F(1,32),F(1,128),16),
            (F(1,2),F(5,8),F(1,16),F(1,64),8),
            (F(5,8),F(7,8),F(1,8),F(1,32),8)]


def box(radius,width):
    return [(F(3,5)-width/2,F(3,5)+width/2), (F(1),F(1)),
            (-radius,radius),(F(37,64)-radius,F(37,64)+radius),(-radius,radius)]


def spatial_error(pairs,tau_hi):
    w,*ds=pairs
    sm=sum(max(abs(l),abs(h))**2 for l,h in ds)
    err=F(481)*sm*(w[1]-w[0])**2/8
    for q,(l,h) in zip([QA,QA,QB,QB],ds):
        curvature=2*q+w[1]**2+4*tau_hi**2*sm+8*tau_hi**2*max(abs(l),abs(h))**2
        err+=curvature*(h-l)**2/8
    return err,sm


def manifest():
    regions=[]
    # Direct normalized interval at zero; all other intervals use endpoint continuation.
    regions.append((F(0),F(1,64),box(F(1,8),F(1,64)),True))
    for start,stop,radius,width,n in bands():
        if start==F(1,64):
            nodes=sorted({F(2**octave,64)*(1+F(j,8)) for octave in range(3) for j in range(9)})
            assert len(nodes)==n+1 and nodes[0]==start and nodes[-1]==stop
        else:
            nodes=[start+(stop-start)*F(i,n) for i in range(n+1)]
        regions.extend((lo,hi,box(radius,width),False) for lo,hi in zip(nodes,nodes[1:]))
    assert regions[0][0]==0 and regions[-1][1]==F(7,8)
    assert all(a[1]==b[0] for a,b in zip(regions,regions[1:]))
    assert F(7,8)**2>F(3,4)  # A=tau(1+i x), so S_physical>=tau^2.
    jobs={}; coverage=[]
    for lo,hi,pairs,direct in regions:
        error,sm=spatial_error(pairs,hi)
        if not direct:
            M=(2*PC+pairs[0][1]**2)*sm+12*hi**2*sm**2
            error+=M*(hi-lo)**2/(8*lo**2)
        reserve=dyadic_up(error+F(1,10**6))
        ids=[]
        # Conjugation maps ai<0 corners to ai>0, flipping bi too.
        corners=itertools.product(pairs[0], [F(1)], [pairs[2][1]], pairs[3], pairs[4])
        for corner in corners:
            for ta,tb in ([(lo,hi)] if direct else [(lo,lo),(hi,hi)]):
                key=(*corner,ta,tb)
                if key not in jobs: jobs[key]=[len(jobs),reserve]
                else: jobs[key][1]=max(jobs[key][1],reserve)
                ids.append(jobs[key][0])
        coverage.append({'tau':[str(lo),str(hi)],'box':[[str(x) for x in pair] for pair in pairs],
                         'direct':direct,'corners':ids,'required_reserve':str(reserve)})
    ordered=[None]*len(jobs)
    for key,(i,reserve) in jobs.items(): ordered[i]=(*key,reserve)
    return ordered,coverage


def hashes():
    files=[*OLD.dependencies(),HERE/'verify.py',HERE/'shift_curvature.cpp']
    return {str(p.relative_to(REPO)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files}


def validate_row(row,jobs):
    i=row['index']; assert type(i) is int and 0<=i<len(jobs)
    assert row['job']==list(map(str,jobs[i]))
    r=row['result']; assert set(r)=={'upper','target_lower','cells'}
    assert F(r['upper'])<F(r['target_lower'])
    assert type(r['cells']) is int and 240<=r['cells']<=300001
    return i


def combine(paths,output):
    jobs,coverage=manifest();rows={}
    for path in paths:
        data=json.loads(path.read_text())
        assert data['sha256']==hashes(),'stale source receipt'
        assert data['status']==PARTIAL
        assert data['shift_curvature']['constant']==480
        assert F(data['shift_curvature']['cap'])<100 and F(data['shift_curvature']['mass'])<140
        for row in data['rows']:
            i=validate_row(row,jobs);assert i not in rows,'duplicate corner'
            rows[i]=row
    assert sorted(rows)==list(range(len(jobs))),'missing corner'
    result={'agent_id':'codex-a7c4','status':COMPLETE,'complete_interior':False,'complete_tube':True,
            'coverage':coverage,'rows':[rows[i] for i in range(len(jobs))],'sha256':hashes()}
    output.write_text(json.dumps(result,indent=1)+'\n')
    print(COMPLETE,len(jobs),'corner jobs',len(coverage),'amplitude cells',flush=True)


def build(temp):
    inherited=CODE/'tilted-sector-2026-11-15'
    text=(inherited/'secant_verify.cpp').read_text()
    assert text.count('int main(')==1
    text=text.replace('int main(','int inherited_secant_main(')
    for name in ('theta_verify.cpp','localization_circle.hpp'):
        text=text.replace(f'#include "{name}"',f'#include "{inherited/name}"')
    (temp/'inherited_secant.hpp').write_text(text)
    base=(CODE/'compact-joint-2026-11-15/hessian_integral.cpp').read_text()
    assert base.count('std::array<J2,6> hk')==1
    (temp/'normalized_base.hpp').write_text(base[:base.index('std::array<J2,6> hk')])
    flags=['clang++','-O2','-std=c++17','-frounding-math','-ffp-contract=off','-fno-fast-math','-I',str(temp)]
    for name,source in [('normalized_integral',CODE/'normalized-remainder-codex-a7c4/normalized_integral.cpp'),
                        ('shift_curvature',HERE/'shift_curvature.cpp')]:
        subprocess.run(flags+[str(source),'-o',str(temp/name)],check=True)
        for bad in ('-DNDEBUG','-ffast-math'):
            r=subprocess.run(flags+[bad,'-fsyntax-only',str(source)],capture_output=True)
            assert r.returncode!=0
    for script in (CODE/'compact-joint-2026-11-15/strip_check.py',CODE/'progress-2026-11-15-codex-a7c4/joint_target_tail.py'):
        subprocess.run([sys.executable,'-I',str(script)],check=True,capture_output=True)


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--combine',nargs='+',type=Path)
    parser.add_argument('--output',type=Path)
    parser.add_argument('--smoke',action='store_true')
    args=parser.parse_args()
    output=args.output or Path(os.environ.get('OUT',str(REPO/'handoff/codex-a7c4-compact-cover')))/'adaptive-receipt.json'
    output.parent.mkdir(parents=True,exist_ok=True)
    if args.combine: combine(args.combine,output);return
    shard,nshards=int(os.environ.get('SHARD',0)),int(os.environ.get('NSHARDS',1))
    assert 0<=shard<nshards
    jobs,_=manifest();rows=[]
    scratch=REPO/'handoff';scratch.mkdir(exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='codex-a7c4-cover-',dir=scratch) as td:
        temp=Path(td);build(temp)
        for opt in ('-O','-OO'):
            assert subprocess.run([sys.executable,'-I',opt,str(HERE/'verify.py')],capture_output=True).returncode!=0
        r=subprocess.run([str(temp/'normalized_integral'),'0','1','0','0','0','0','1000','240'],capture_output=True)
        assert r.returncode==1 and b'UNRESOLVED' in r.stdout
        shift=subprocess.run([str(temp/'shift_curvature')],capture_output=True,text=True,check=True).stdout
        import re
        m=re.fullmatch(r'PASS SHIFT CURVATURE cap=(\S+) mass=(\S+) tail=(\S+) constant=480\n',shift)
        assert m and F(m[1])<100 and F(m[2])<140
        curv={'cap':m[1],'mass':m[2],'tail':m[3],'constant':480}
        indices=[0] if args.smoke else range(shard,len(jobs),nshards)
        for i in indices:
            w,ar,ai,br,bi,lo,hi,reserve=jobs[i]
            pairs=[(x,x) for x in (w,ar,ai,br,bi)]+[(lo,hi)]
            cmd=[str(temp/'normalized_integral'),*[str(x) for pair in pairs for x in pair],str(reserve),'300000']
            r=subprocess.run(cmd,capture_output=True,text=True)
            if r.returncode: raise RuntimeError(f'UNRESOLVED job {i} {jobs[i]}: {r.stdout}\n{r.stderr}')
            row={'index':i,'job':list(map(str,jobs[i])),'result':OLD.check_output(r.stdout)}
            validate_row(row,jobs);rows.append(row)
            print('PASS corner',i,'of',len(jobs),'tau',lo,hi,'cells',row['result']['cells'],flush=True)
        result={'status':PARTIAL,'complete_interior':False,'complete_tube':False,'rows':rows,
                'shift_curvature':curv,'sha256':hashes()}
        output.write_text(json.dumps(result,indent=1)+'\n')
        print(PARTIAL,output,flush=True)

if __name__=='__main__':main()

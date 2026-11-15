#!/usr/bin/env python3
"""Agent-ID: codex-a7c4. Refs #431. Direction-free matrix regions of (P).
Fresh interval quadrature; exact rational PSD and coverage aggregation.
The remaining compact interior is explicitly not certified by this runner.
"""
import argparse
from fractions import Fraction as F
import hashlib
import importlib.util
import json
import math
import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile

if not __debug__:
    raise RuntimeError('Assertions must be enabled')
HERE=Path(__file__).resolve().parent
CODE=HERE.parent
REPO=HERE.parents[3]
spec=importlib.util.spec_from_file_location('adaptive',CODE/'adaptive-cover-codex-a7c4/verify.py')
ADAPT=importlib.util.module_from_spec(spec);spec.loader.exec_module(ADAPT)
PC=F(2500,1891)-F(463,5000);RHO=F(5053,10000)
QA=PC-F(67,100)-F(2,25)*RHO**2
QB=PC-F(67,100)*RHO**2-F(2,25)
QC=-F(59,100)*RHO
STEP=F(1,128)
RESERVE=ADAPT.dyadic_up(F(481)*STEP**2/8+F(1,10**6))
PARTIAL='PASS assigned matrix jobs; full (P) remains open'
COMPLETE='PASS direction-free regions; full (P) remains open'
ORIGIN=[(F(0),F(1,8),F(1,512)),(F(1,8),F(1,4),F(1,256)),
        (F(1,4),F(1),F(1,64)),(F(1),F(9,8),F(1,32)),
        (F(9,8),F(19,16),F(1,16)),(F(19,16),F(5,4),F(3,32))]


def grid(lo,hi):
    n=(hi-lo)/STEP;assert n.denominator==1
    return [lo+i*STEP for i in range(n.numerator+1)]


def manifest():
    jobs=[];lookup={};groups=[]
    def add(key):
        if key not in lookup:lookup[key]=len(jobs);jobs.append(key)
        return lookup[key]
    for i in range(8):add(('cone',F(11*i,64),F(11*(i+1),64)))
    assert ORIGIN[0][0]==0 and ORIGIN[-1][1]==F(5,4)
    assert all(a[1]==b[0] for a,b in zip(ORIGIN,ORIGIN[1:]))
    assert all(s>=F(1,512) for _,_,s in ORIGIN)
    for lo,hi,s in ORIGIN:
        ids=[add(('matrix',w,F(0),s,RESERVE)) for w in grid(lo,hi)]
        groups.append(('origin',lo,hi,F(0),s,ids))
    nodes=[F(0),*[F(i,32) for i in range(4,17)],F(5,8),F(3,4),F(7,8)]
    assert nodes==sorted(set(nodes)) and nodes[0]==0 and nodes[-1]**2>F(3,4)
    for sl,sh in zip(nodes,nodes[1:]):
        ids=[add(('matrix',w,sl,sh,RESERVE)) for w in grid(F(5,4),F(11,8))]
        groups.append(('shift',F(5,4),F(11,8),sl,sh,ids))
    return jobs,groups


def hashes():
    result=ADAPT.hashes()
    for p in [HERE/'verify.py',HERE/'cone_integral.cpp',HERE/'radial_matrix.cpp',
              CODE/'compact-joint-2026-11-15/potential_integral.cpp']:
        result[str(p.relative_to(REPO))]=hashlib.sha256(p.read_bytes()).hexdigest()
    return result


def hx(s):
    x=float.fromhex(s);assert math.isfinite(x)
    return F(x)


PAT=re.compile(r'PASS (MATRIX|CONE) w=\[([^,]+),([^\]]+)\](?: s=\[([^,]+),([^\]]+)\] reserve=(\S+))? cells=(\d+)((?: \[[^,]+,[^\]]+\]){6})(?: lambda=(\d+)/128)?\n')


def parse(stdout):
    m=PAT.fullmatch(stdout);assert m,'malformed certificate line'
    kind=m[1].lower();wl,wh=hx(m[2]),hx(m[3]);assert 0<=wl<=wh<=2
    pairs=[(hx(l),hx(h)) for l,h in re.findall(r'\[([^,]+),([^\]]+)\]',m[8])]
    assert len(pairs)==6 and all(l<=h for l,h in pairs)
    count=int(m[7]);assert 88<=count<=300001
    if kind=='matrix':
        assert m[4] is not None and m[9] is None
        sl,sh,res=hx(m[4]),hx(m[5]),hx(m[6]);assert 0<=sl<=sh<=1 and res>=0
        lam=F(0)
    else:
        assert m[4] is None and m[9] is not None
        n=int(m[9]);assert 1<=n<=48
        sl=sh=res=F(0);lam=F(n,128)
    # Exact recomputation from the binary interval endpoints, not a float eigenvalue.
    for j in (0,3):
        aa=QA+wl**2/2+sl**2-res-pairs[j][1]+F(7,2)*lam
        bb=QB+wl**2/2+sl**2-res-pairs[j+2][1]+lam/2
        cc=(QC-pairs[j+1][1]+2*lam,QC-pairs[j+1][0]+2*lam)
        assert aa>0 and bb>0 and aa*bb>max(abs(c) for c in cc)**2,'PSD comparison failed'
    return kind,wl,wh,sl,sh,res,count


def validate(row,jobs):
    i=row['index'];assert type(i) is int and 0<=i<len(jobs)
    job=jobs[i];parsed=[parse(line) for line in row['leaves']]
    if job[0]=='matrix':
        assert len(parsed)==1
        kind,wl,wh,sl,sh,res,_=parsed[0]
        assert (kind,wl,sl,sh,res)==job and wh==wl,'changed matrix job'
    else:
        assert parsed
        for kind,wl,wh,_,_,_,_ in parsed:assert kind=='cone' and wl<wh
        parsed.sort(key=lambda x:x[1])
        assert parsed[0][1]==job[1] and parsed[-1][2]==job[2]
        assert all(a[2]==b[1] for a,b in zip(parsed,parsed[1:])),'cone coverage gap/overlap'
    return i


def combine(paths,output):
    jobs,groups=manifest();rows={}
    for path in paths:
        data=json.loads(path.read_text());assert data['status']==PARTIAL
        assert data['sha256']==hashes(),'stale source receipt'
        assert data['shift_curvature_constant']==480
        for row in data['rows']:
            i=validate(row,jobs);assert i not in rows,'duplicate job'
            rows[i]=row
    assert sorted(rows)==list(range(len(jobs))),'missing job'
    # Every group lists every endpoint of an exact step-1/128 shift chain.
    for kind,lo,hi,sl,sh,ids in groups:
        assert [jobs[i][1] for i in ids]==grid(lo,hi)
        assert all(jobs[i][2:]==(sl,sh,RESERVE) for i in ids)
    result={'agent_id':'codex-a7c4','status':COMPLETE,'complete_interior':False,
            'shift_exterior':'|w| >= 5/4, all amplitudes and directions',
            'uniform_origin':'sqrt(S) <= 1/512, all shifts and directions',
            'directional_exterior':'16 S^2 + 3 S >= 6 |2A+B|^2, all shifts',
            'origin_profile':[[str(x) for x in band] for band in ORIGIN],
            'shift_step':str(STEP),'shift_reserve':str(RESERVE),
            'rows':[rows[i] for i in range(len(jobs))],'sha256':hashes()}
    output.write_text(json.dumps(result,separators=(',',':'))+'\n')
    leaves=sum(len(r['leaves']) for r in rows.values())
    print(COMPLETE,len(jobs),'jobs',leaves,'matrix enclosures',flush=True)


def build(temp):
    ADAPT.build(temp)
    src=(CODE/'compact-joint-2026-11-15/potential_integral.cpp').read_text()
    assert src.count('bool positive_gap(')==1
    (temp/'potential_base.hpp').write_text(src[:src.index('bool positive_gap(')])
    flags=['clang++','-O2','-std=c++17','-frounding-math','-ffp-contract=off','-fno-fast-math','-I',str(temp)]
    for name in ('cone_integral','radial_matrix'):
        source=HERE/(name+'.cpp')
        subprocess.run(flags+[str(source),'-o',str(temp/name)],check=True)
        for bad in ('-DNDEBUG','-ffast-math'):
            assert subprocess.run(flags+[bad,'-fsyntax-only',str(source)],capture_output=True).returncode!=0
    shift=subprocess.run([str(temp/'shift_curvature')],capture_output=True,text=True,check=True).stdout
    assert re.fullmatch(r'PASS SHIFT CURVATURE cap=\S+ mass=\S+ tail=\S+ constant=480\n',shift)
    r=subprocess.run([str(temp/'radial_matrix'),'0','0','0','0','1000','104'],capture_output=True)
    assert r.returncode==1 and b'UNRESOLVED' in r.stdout


def runjob(temp,job):
    if job[0]=='matrix':
        _,w,sl,sh,res=job
        cmd=[str(temp/'radial_matrix'),*[float(x).hex() for x in (w,w,sl,sh,res)],'120000']
        r=subprocess.run(cmd,capture_output=True,text=True)
        if r.returncode:raise RuntimeError(f'UNRESOLVED {job}: {r.stdout} {r.stderr}')
        return [r.stdout]
    todo=[job[1:]];leaves=[]
    while todo:
        lo,hi=todo.pop()
        r=subprocess.run([str(temp/'cone_integral'),float(lo).hex(),float(hi).hex(),'40000'],capture_output=True,text=True)
        if r.returncode==0:parse(r.stdout);leaves.append(r.stdout);continue
        assert r.returncode==1 and r.stdout.startswith('UNRESOLVED CONE'),r.stdout+r.stderr
        assert hi-lo>F(1,65536),'unresolved cone interval'
        mid=(lo+hi)/2;todo.extend([(mid,hi),(lo,mid)])
    return leaves


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--combine',nargs='+',type=Path)
    parser.add_argument('--output',type=Path)
    parser.add_argument('--smoke',action='store_true')
    args=parser.parse_args()
    output=args.output or Path(os.environ.get('OUT',str(REPO/'handoff/codex-a7c4-direction-cover')))/'matrix-receipt.json'
    output.parent.mkdir(parents=True,exist_ok=True)
    if args.combine:combine(args.combine,output);return
    shard,nshards=int(os.environ.get('SHARD',0)),int(os.environ.get('NSHARDS',1));assert 0<=shard<nshards
    jobs,_=manifest();rows=[]
    scratch=REPO/'handoff';scratch.mkdir(exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='codex-a7c4-matrix-',dir=scratch) as td:
        temp=Path(td);build(temp)
        for opt in ('-O','-OO'):
            assert subprocess.run([sys.executable,'-I',opt,str(HERE/'verify.py')],capture_output=True).returncode!=0
        indices=[8] if args.smoke else range(shard,len(jobs),nshards)
        for i in indices:
            row={'index':i,'leaves':runjob(temp,jobs[i])};validate(row,jobs);rows.append(row)
            print('PASS job',i,'of',len(jobs),jobs[i][0],'enclosures',len(row['leaves']),flush=True)
        result={'status':PARTIAL,'complete_interior':False,'rows':rows,
                'shift_curvature_constant':480,'sha256':hashes()}
        output.write_text(json.dumps(result,separators=(',',':'))+'\n')
        print(PARTIAL,output,flush=True)

if __name__=='__main__':main()

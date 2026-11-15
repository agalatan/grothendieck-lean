#!/usr/bin/env python3
"""Agent-ID: codex-a7c4. Refs #431. Adaptive cover of the real aligned plane.

Floating quadrature chooses subdivisions and reserves only. Acceptance requires
fresh outward source integrals, rational interpolation, and complete trees.
The full complex interior of (P) remains open.
"""
from fractions import Fraction as F
from pathlib import Path
import argparse
import concurrent.futures
import functools
import hashlib
import importlib.util
import itertools
import json
import math
import multiprocessing
import os
import re
import subprocess
import sys
import tempfile

if not __debug__:
    raise RuntimeError('Assertions must be enabled')
HERE = Path(__file__).resolve().parent
CODE = HERE.parent
REPO = HERE.parents[3]
spec = importlib.util.spec_from_file_location('adaptive', CODE/'adaptive-cover-codex-a7c4/verify.py')
ADAPT = importlib.util.module_from_spec(spec)
spec.loader.exec_module(ADAPT)
PC, QA, QB = ADAPT.PC, ADAPT.QA, ADAPT.QB
QC = -F(59, 100)*ADAPT.RHO
PARTIAL = 'PASS assigned aligned regions; full complex (P) remains open'
COMPLETE = 'PASS real aligned plane; full complex (P) remains open'
PROFILE = [(F(0),F(1,8),F(1,512)),(F(1,8),F(1,4),F(1,256)),
           (F(1,4),F(1),F(1,64)),(F(1),F(9,8),F(1,32)),
           (F(9,8),F(19,16),F(1,16)),(F(19,16),F(5,4),F(3,32))]


def hashes():
    result = ADAPT.hashes()
    files = [HERE/n for n in ('verify.py','base_curvature.cpp','mixed_jet.hpp',
                             'central_integral.cpp','jet_test.cpp')]
    files += [CODE/'directional-matrix-codex-a7c4'/n for n in
              ('verify.py','cone_integral.cpp','radial_matrix.cpp','result.json')]
    for p in files:
        result[str(p.relative_to(REPO))] = hashlib.sha256(p.read_bytes()).hexdigest()
    return result


def amplitude_roots():
    nodes = [F(2**i,1024) for i in range(10)] + [F(7,8)]
    assert nodes == sorted(set(nodes)) and 2*nodes[0]**2 < F(1,512)**2
    assert nodes[-1]**2 > F(3,4)
    return list(zip(nodes,nodes[1:]))


def coefficients(chart, y):
    assert type(chart) is int and 0 <= chart < 4
    return ((F(1),y), (F(-1),y), (y,F(1)), (y,F(-1)))[chart]


def target(w,t,a,b):
    s = a*a+b*b
    return QA*a*a+QB*b*b+2*QC*a*b+w*w*s/2+t*t*s*s


def direction_bounds(chart,yl,yh):
    al,bl = coefficients(chart,yl)
    ah,bh = coefficients(chart,yh)
    ys = min(yl*yl,yh*yh) if yl*yh > 0 else F(0)
    return max(abs(al),abs(ah)), max(abs(bl),abs(bh)), 1+ys


def known(chart, cell):
    wl,wh,yl,yh,tl,th = cell
    a,b,smin = direction_bounds(chart,yl,yh)
    smax = a*a+b*b
    if th*th*smax <= F(1,512)**2:
        return 'o'
    for lo,hi,cap in PROFILE:
        if wl >= lo and wh <= hi and th*th*smax <= cap*cap:
            return 'o'
    if tl*tl*smin >= F(3,4):
        return 'a'
    a0,b0 = coefficients(chart,yl)
    a1,b1 = coefficients(chart,yh)
    if 16*tl*tl*smin*smin+3*smin >= 6*max((2*a0+b0)**2,(2*a1+b1)**2):
        return 'd'
    return None


def errors(chart, cell, curvature):
    wl,wh,yl,yh,tl,th = cell
    a,b,_ = direction_bounds(chart,yl,yh)
    s = a*a+b*b
    assert tl > 0
    wc = min(481*s,curvature[0]/(tl*tl)+2*(curvature[1]*a+curvature[2]*b)/tl+s)
    ew = wc*(wh-wl)**2/8
    q = QB if chart < 2 else QA
    ey = (2*q+wh*wh+4*th*th*s+8*th*th*max(yl*yl,yh*yh))*(yh-yl)**2/8
    et = ((2*PC+wh*wh)*s+12*th*th*s*s)*(th-tl)**2/(8*tl*tl)
    return ew,ey,et


def corners(chart, cell):
    wl,wh,yl,yh,tl,th = cell
    return [(w,t,*coefficients(chart,y)) for w,y,t in
            itertools.product((wl,wh),(yl,yh),(tl,th))]


def split(cell, axis):
    assert type(axis) is int and 0 <= axis < 3
    j = 2*axis
    mid = (cell[j]+cell[j+1])/2
    lower,upper = list(cell),list(cell)
    lower[j+1] = mid
    upper[j] = mid
    return tuple(lower),tuple(upper)


def hex_fraction(text):
    value = float.fromhex(text)
    assert math.isfinite(value)
    return F(value)


BASE_PATTERN = re.compile(r'ENCLOSURE BASE_CURVATURE w=\[([^,]+),([^\]]+)\] cells=(\d+)((?: \[[^,]+,[^\]]+\]){3})\n')
POINT_PATTERN = re.compile(r'PASS NORMALIZED w=\S+ rho=\S+ Sdir=\S+ upper=(\S+) target_lower=(\S+) cells=(\d+)\n')


def curvature_bounds(index, rows):
    assert len(rows) == 8
    entries = []
    for j,line in enumerate(rows):
        m = BASE_PATTERN.fullmatch(line)
        assert m, 'malformed curvature enclosure'
        lo,hi = hex_fraction(m[1]),hex_fraction(m[2])
        assert (lo,hi) == (F(8*index+j,128),F(8*index+j+1,128)), 'changed curvature interval'
        assert 104 <= int(m[3]) <= 24000
        pairs = [(hex_fraction(a),hex_fraction(b)) for a,b in
                 re.findall(r'\[([^,]+),([^\]]+)\]',m[4])]
        assert len(pairs) == 3 and all(a <= b for a,b in pairs)
        assert pairs[0][1] > 0
        entries.append(pairs)
    return (max(row[0][1] for row in entries),
            *(max(max(abs(row[j][0]),abs(row[j][1])) for row in entries) for j in (1,2)))


def validate(data):
    assert data['status'] == PARTIAL and data['sha256'] == hashes(), 'stale or incomplete receipt'
    index = data['index']
    assert type(index) is int and 0 <= index < 20
    curvature = curvature_bounds(index,data['curvature'])
    points = {}
    for row in data['points']:
        assert len(row) == 6
        w,t,a,b = map(F,row[:4])
        assert F(index,16) <= w <= F(index+1,16)
        assert F(1,1024) <= t <= F(7,8) and max(abs(a),abs(b)) == 1
        upper = hex_fraction(row[4])
        assert upper >= 0 and upper < target(w,t,a,b), 'failed point bound'
        assert type(row[5]) is int and 240 <= row[5] <= 300000
        key = (w,t,a,b)
        assert key not in points, 'duplicate point'
        points[key] = upper-target(*key)
    trees = {}
    for chart,root,path,kind in data['leaves']:
        assert type(chart) is int and 0 <= chart < 4
        assert type(root) is int and 0 <= root < len(amplitude_roots())
        assert isinstance(path,str) and len(path) <= 100 and all(c in '012345' for c in path)
        assert kind in ('c','o','a','d')
        tree = trees.setdefault((chart,root),{})
        for digit in path:
            assert 'leaf' not in tree, 'overlapping leaves'
            tree = tree.setdefault(digit,{})
        assert not tree, 'duplicate or overlapping leaf'
        tree['leaf'] = kind
    assert set(trees) == set(itertools.product(range(4),range(len(amplitude_roots())))), 'missing root'

    def walk(chart,cell,tree):
        if 'leaf' in tree:
            assert set(tree) == {'leaf'}
            kind = tree['leaf']
            if kind == 'c':
                keys = corners(chart,cell)
                assert all(k in points for k in keys), 'missing corner'
                assert max(points[k] for k in keys)+sum(errors(chart,cell,curvature)) < 0, 'failed interpolation'
            else:
                assert known(chart,cell) == kind, 'invalid inherited-region claim'
            return
        keys = set(tree)
        axis = next((a for a in range(3) if keys == {str(2*a),str(2*a+1)}),None)
        assert axis is not None, 'coverage gap or incompatible split'
        lower,upper = split(cell,axis)
        walk(chart,lower,tree[str(2*axis)])
        walk(chart,upper,tree[str(2*axis+1)])
    for (chart,root),tree in trees.items():
        lo,hi = amplitude_roots()[root]
        walk(chart,(F(index,16),F(index+1,16),F(-1),F(1),lo,hi),tree)
    return index


def build(temp):
    ADAPT.build(temp)
    flags = ['clang++','-O2','-std=c++17','-frounding-math','-ffp-contract=off',
             '-fno-fast-math','-I',str(temp),'-I',str(HERE)]
    for name in ('central_integral','base_curvature','jet_test'):
        source = HERE/(name+'.cpp')
        subprocess.run(flags+[str(source),'-o',str(temp/name)],check=True)
        for bad in ('-DNDEBUG','-ffast-math'):
            assert subprocess.run(flags+[bad,'-fsyntax-only',str(source)],capture_output=True).returncode != 0
    subprocess.run([str(temp/'jet_test')],check=True)
    shift = subprocess.run([str(temp/'shift_curvature')],capture_output=True,text=True,check=True).stdout
    assert re.fullmatch(r'PASS SHIFT CURVATURE cap=\S+ mass=\S+ tail=\S+ constant=480\n',shift)
    impossible = subprocess.run([str(temp/'central_integral'),'0','1','0','0','0','0','1000','240'],capture_output=True)
    assert impossible.returncode == 1 and b'UNRESOLVED' in impossible.stdout
    nonreal = subprocess.run([str(temp/'central_integral'),'0','1','1','0','0','0','0','240'],capture_output=True)
    assert nonreal.returncode != 0


class Selector:
    """Untrusted floating guidance: every proposed point still needs interval execution."""
    def __init__(self):
        import numpy as np
        from numpy.polynomial.legendre import leggauss
        self.np = np
        g,gw = leggauss(8)
        ends = [0,.01,.03,.1,.25,.5,1,2,4,8,16,32,40]
        self.r = np.concatenate([(l+h)/2+(h-l)*g/2 for l,h in zip(ends,ends[1:])])[:,None]
        self.wt = np.concatenate([(h-l)*gw/2 for l,h in zip(ends,ends[1:])])[:,None]/128
        theta = (np.arange(128)[None,:]+.5)*2*np.pi/128
        self.co,self.si = np.cos(theta),np.sin(theta)

    @functools.lru_cache(32)
    def base(self,w):
        np = self.np
        x,y = self.r*self.co-float(w),self.r*self.si
        radius = np.hypot(x,y)
        rad = (radius/.1432)**(1/3)
        for _ in range(20):
            rad -= ((.5592+.1432*rad*rad)*rad-radius)/(.5592+3*.1432*rad*rad)
        t = rad*rad
        aa = .5592+.1432*t
        return (t,(x*x-y*y)/(np.sqrt(2)*aa*aa),np.sqrt(2)*x*y/(aa*aa),
                4*self.r*np.exp(-t)/(aa*(.5592+3*.1432*t))*self.wt)

    @functools.lru_cache(None)
    def value(self,w,t,a,b):
        np = self.np
        tt,zr,zi,weight = self.base(w)
        af,bf,tf = map(float,(a,b,t))
        hr,hi = (tt-.4)*af+(.30318+zr)*bf,zi*bf
        kr,ki = hr*self.co+hi*self.si,hi*self.co-hr*self.si
        x,y = self.r+tf*kr,tf*ki
        norm = np.hypot(x,y)
        with np.errstate(divide='ignore',invalid='ignore'):
            value = np.where(x>=0,ki*ki/(norm+x),(norm-x)/(tf*tf))
        ans = float(np.sum(weight*value))-float(target(w,t,a,b))
        if not math.isfinite(ans):
            raise RuntimeError('nonfinite selector; no certificate produced')
        return ans


def run_region(arguments):
    index,temp,output = arguments
    temp,output = Path(temp),Path(output)
    curvature_rows = []
    for j in range(8):
        lo,hi = F(8*index+j,128),F(8*index+j+1,128)
        result = subprocess.run([str(temp/'base_curvature'),float(lo).hex(),float(hi).hex(),'.5','24000'],
                                capture_output=True,text=True,check=True)
        curvature_rows.append(result.stdout)
    curvature = curvature_bounds(index,curvature_rows)
    selector = Selector()
    cache,point_rows,leaves = {},[],[]

    def point(key):
        if key in cache:
            return cache[key]
        w,t,a,b = key
        estimate = selector.value(*key)
        reserve = max(F(1,128),F(max(0.,-estimate)*.55).limit_denominator(2**20))
        for _ in range(12):
            result = subprocess.run([str(temp/'central_integral'),str(w),str(a),'0',str(b),'0',str(t),
                                     str(reserve),'300000'],capture_output=True,text=True)
            if result.returncode == 0:
                m = POINT_PATTERN.fullmatch(result.stdout)
                assert m, 'malformed point enclosure'
                upper = hex_fraction(m[1])
                assert upper < target(*key)-reserve
                assert 240 <= int(m[3]) <= 300000
                cache[key] = upper-target(*key)
                point_rows.append([*map(str,key),m[1],int(m[3])])
                if len(cache)%100 == 0:
                    print('region',index,'points',len(cache),'leaves',len(leaves),flush=True)
                return cache[key]
            assert result.returncode == 1 and result.stdout.startswith('UNRESOLVED'), result.stdout+result.stderr
            reserve /= 2
        raise RuntimeError(f'UNRESOLVED point {key}')

    for chart in range(4):
        for root,(lo,hi) in enumerate(amplitude_roots()):
            todo = [((F(index,16),F(index+1,16),F(-1),F(1),lo,hi),'')]
            while todo:
                cell,path = todo.pop()
                kind = known(chart,cell)
                if kind:
                    leaves.append([chart,root,path,kind])
                    continue
                err = errors(chart,cell,curvature)
                keys = corners(chart,cell)
                margin = max(1/64,-max(selector.value(*k) for k in keys))
                if float(sum(err)) < margin*.4:
                    if max(point(k) for k in keys)+sum(err) < 0:
                        leaves.append([chart,root,path,'c'])
                        continue
                axis = max(range(3),key=lambda a:err[a])
                assert cell[2*axis+1]-cell[2*axis] > F(1,2**20), 'unresolved parameter box'
                lower,upper = split(cell,axis)
                todo.extend([(upper,path+str(2*axis+1)),(lower,path+str(2*axis))])
    data = {'agent_id':'codex-a7c4','status':PARTIAL,'index':index,'curvature':curvature_rows,
            'points':point_rows,'leaves':leaves,'sha256':hashes()}
    validate(data)
    output.write_text(json.dumps(data,separators=(',',':'))+'\n')
    print('PASS region',index,'points',len(point_rows),'leaves',len(leaves),flush=True)
    return index,len(point_rows),len(leaves)


def combine(paths,output):
    indices = set()
    rows = []
    for path in paths:
        data = json.loads(path.read_text())
        index = validate(data)
        assert index not in indices, 'duplicate shift region'
        indices.add(index)
        rows.append({'index':index,'points':len(data['points']),'leaves':len(data['leaves']),
                     'receipt_sha256':hashlib.sha256(path.read_bytes()).hexdigest()})
    assert indices == set(range(20)), 'missing shift region'
    result = {'agent_id':'codex-a7c4','status':COMPLETE,'complete_real_plane':True,
              'complete_complex_interior':False,'regions':sorted(rows,key=lambda r:r['index']),
              'sha256':hashes()}
    output.write_text(json.dumps(result,indent=2)+'\n')
    print(COMPLETE,sum(r['points'] for r in rows),'points',sum(r['leaves'] for r in rows),'leaves',flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--combine',nargs='+',type=Path)
    parser.add_argument('--output',type=Path)
    parser.add_argument('--smoke',action='store_true')
    parser.add_argument('--workers',type=int,default=4 if os.environ.get('GITHUB_ACTIONS') else 1)
    args = parser.parse_args()
    output = args.output or Path(os.environ.get('OUT',str(REPO/'handoff/codex-a7c4-central-aligned')))
    if args.combine:
        combine(args.combine,output)
        return
    output.mkdir(parents=True,exist_ok=True)
    assert 1 <= args.workers <= 4
    shard,nshards = int(os.environ.get('SHARD',0)),int(os.environ.get('NSHARDS',1))
    assert 0 <= shard < nshards
    (REPO/'handoff').mkdir(exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='codex-a7c4-central-',dir=REPO/'handoff') as td:
        temp = Path(td)
        build(temp)
        for opt in ('-O','-OO'):
            assert subprocess.run([sys.executable,'-I',opt,str(HERE/'verify.py')],capture_output=True).returncode != 0
        if args.smoke:
            subprocess.run([str(temp/'base_curvature'),'0x1.2p-1','0x1.24p-1','.5','1000'],check=True)
            point = subprocess.run([str(temp/'central_integral'),'3/5','1','0','37/64','0','7/20','1/50','300000'],
                                   capture_output=True,text=True,check=True)
            m = POINT_PATTERN.fullmatch(point.stdout)
            assert m and hex_fraction(m[1]) < target(F(3,5),F(7,20),F(1),F(37,64))-F(1,50)
            print('PASS smoke; no parameter cover claimed',flush=True)
            return
        jobs = [(i,str(temp),str(output/f'region-{i:02}.json')) for i in range(shard,20,nshards)]
        if args.workers == 1:
            for job in jobs:
                run_region(job)
        else:
            with concurrent.futures.ProcessPoolExecutor(max_workers=args.workers,
                    mp_context=multiprocessing.get_context('spawn')) as pool:
                list(pool.map(run_region,jobs))
        print(PARTIAL,'regions',[i for i,_,_ in jobs],flush=True)


if __name__ == '__main__':
    main()

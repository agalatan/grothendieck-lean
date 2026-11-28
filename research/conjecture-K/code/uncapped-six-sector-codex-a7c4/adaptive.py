"""Exact high-excess cover with the profile chosen on each physical-energy cell."""

import argparse
import json
from importlib.util import module_from_spec, spec_from_file_location
from pathlib import Path
from fractions import Fraction as Q

HERE = Path(__file__).resolve().parent
spec = spec_from_file_location('fixed_price_six', HERE/'verify.py')
fixed = module_from_spec(spec)
spec.loader.exec_module(fixed)
need = fixed.need
P0, D, EPS, RHO = fixed.P, fixed.D, fixed.EPS, fixed.RHO
PRICES = (P0, *map(Q,['1.33','1.34','1.35','1.36','1.37','1.38','1.39','1.4','1.42']))
REGIONS = [('.815','40'),('.8205','30'),('.826','27'),('.8296','25')]
LOW = [('.826','.1'),('.827','.15'),('.829','.2')]


def remote(src, index, p, ul, uh, cl, ch, mixed):
    need(type(index) is int, 'remote index')
    if index == -1:
        gap = max(0, ul-Q('.0403449'), Q('.0403448')-uh) if mixed and uh<=fixed.U0 else 0
        return fixed.S + (P0-p)*(uh if p<P0 else ul)-Q('1.08')*gap**2
    if index == -2:
        need(ul>=fixed.U0, 'exterior price domain')
        return src.exterior + (fixed.AF-p)*(uh if p<fixed.AF else ul)
    need(0 <= index < len(src.polys), 'remote index')
    a0,a1,a2,a3 = src.polys[index]
    need(a3 > 0, 'sixth-moment sign')
    upper = []
    for chi in (cl,ch):
        six = 6+9*chi+Q('40.45313')*chi*fixed.root_up(chi)
        upper.extend(src.bernstein([a0,a1-p,a2*(2+chi),a3*six],ul,uh))
    return max(upper)


def run(src, tree, slab, mixed=False):
    t, chi_min = map(Q,slab)
    G = fixed.PI/4-t*t
    tangent = 4*Q('.432306903')*(Q('.886762780')-t)
    X = min(tangent, 2*G)
    if t*t >= 3*fixed.PI/14:
        X = min(X,G)

    def visit(node, box):
        (l,h),(vl,vh),(cl,ch) = box
        vh = min(vh,3*G/2-3*l/4)
        if vl > vh:
            need(node is None,'nonempty adaptive witness on empty box')
            return 0, fixed.TARGET
        need(isinstance(node,list) and len(node) in (3,4),'adaptive partition gap')
        if len(node)==3 and not isinstance(node[2],str):
            axis = node[0]
            need(type(axis) is int and 0 <= axis < 3,'adaptive split axis')
            clipped = [(l,h),(vl,vh),(cl,ch)]
            lo,hi = clipped[axis]
            need(lo < hi,'empty split')
            mid = (lo+hi)/2
            answers = []
            for sub, child in zip(((lo,mid),(mid,hi)),node[1:]):
                part = clipped.copy()
                part[axis] = sub
                answers.append(visit(child,part))
            return sum(n for n,_ in answers), min(g for _,g in answers)
        if mixed:
            need(len(node)==4, 'mixed trial missing')
            price, share, index, multiplier = node
            p = P0 if price=='p0' else Q(price)
            theta = (p-Q('1.28'))/(P0-Q('1.28')) if share=='balanced' else Q(share)
        else:
            need(len(node)==3, 'high-excess trial length')
            price_id, index, multiplier = node
            need(type(price_id) is int and 0 <= price_id < len(PRICES), 'adaptive price index')
            p, theta = PRICES[price_id], Q(1)
        need(p>0 and 0<theta<=1,'invalid trial mix')
        mu = EPS*p
        ul,uh,vl,vh = [n/p**2 for n in (l,h,vl,vh)]
        odd = Q('1.28')+theta*(P0-Q('1.28'))-p+Q('.0784')*theta*max(0,mu*theta-1)
        wmax = max(0,G-l/2-2*vl*p**2/3)/p**2
        k = 2*(uh+vh-fixed.U0)
        err = Q('.0035')*fixed.root_up(uh)
        content = min(Q('.139')*fixed.root_up(uh), fixed.root_up(Q('.08')*ch)*uh)
        if mixed:
            k = ((1+min(3,fixed.root_up(3*ch/4)))*uh/2-2*fixed.U0)/theta+2*vh/theta**3
            power = ch*uh**2*fixed.root_up(ch*uh**2)
            content = min(content,fixed.root_up(Q('2.8')*power))
            err = min(err,fixed.root_up(Q('.03')*power))
        else:
            need(p>=P0 and odd<=0,'odd energy underpayment')
        a = (Q('.31')+Q('.36')*(1-mu*theta))/theta+(p-P0/theta-k)/D
        b = Q('.08')/theta+(p-P0/theta-k)/D
        x,y = content+RHO*err/D,err/D
        if multiplier == 'norm':
            m = min(a,b)
            increment = 2*fixed.root_up((x*x+y*y)*D*vh)-m*D*(vl if m>=0 else vh)
        else:
            m = Q(multiplier)
            need(min(a+m,b+m)>0, 'adaptive square denominator')
            increment = x*x/(a+m)+y*y/(b+m)+m*D*(vh if m>=0 else vl)
        offset = max(v*v-2*mu*Q('.8456')*v+2*(mu*Q('.1432'))**2/EPS for v in (t,Q('.833') if mixed else Q('.8393')))
        gap = fixed.TARGET-offset-mu*(remote(src,index,p,ul,uh,cl,ch,mixed)+increment+max(0,odd)*wmax)
        need(gap>0,'adaptive row clearance')
        return 1,gap

    return visit(tree,[(Q(0),X),(Q(0),3*G/2),((Q(0),chi_min) if mixed else (chi_min,Q(42)))])


def verify(src, data):
    need(len(data)==len(REGIONS),'missing adaptive region')
    counts = (93,97,79,62)
    clearances = (9332330,569587,14774073,5601628)
    for row,slab,count,promised in zip(data,REGIONS,counts,clearances):
        n,g = run(src,row,slab)
        need(n==count and g > Q(promised,10**12),'published adaptive clearance')
        print(f't in [{slab[0]},.8393], chi >= {slab[1]}: {n} leaves; clearance > {g*10**12//1}/10^12')
    for node,error in [(None,'adaptive partition gap'),([77,-1,'norm'],'adaptive price index'),
                       ([0,-1,'-100'],'adaptive square denominator')]:
        try:
            run(src,node,REGIONS[0])
        except ValueError as exc:
            need(str(exc)==error, 'adaptive control hit wrong condition')
        else:
            raise ValueError('adaptive corruption accepted')
    print('Three adaptive corruption controls passed.')


def low_regions(src, data):
    need(len(data)==len(LOW),'missing low-excess region')
    for row,slab,count,margin in zip(data,LOW,(40,40,37),(372985,337923,495622)):
        n,g = run(src,row,slab,True)
        need(n==count and g>Q(margin,10**12),'low-excess published clearance')
        print(f't in [{slab[0]},.833], chi <= {slab[1]}: {n} leaves; clearance > {g*10**12//1}/10^12')
    try:
        run(src,['p0','0',-1,'norm'],LOW[0],True)
    except ValueError as error:
        need(str(error)=='invalid trial mix','unexpected corruption outcome')
    else:
        raise ValueError('zero share accepted')


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--repo',type=Path,default=next((p for p in HERE.parents if (p/'research/conjecture-K').is_dir()),Path.cwd()))
    opt = ap.parse_args()
    public = fixed.inputs(opt.repo)
    verify(public,json.loads((HERE/'adaptive.json').read_bytes()))
    low_regions(public,json.loads((HERE/'adaptive-low.json').read_bytes()))

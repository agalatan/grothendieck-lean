#!/usr/bin/env python3
"""Exact rational enclosures of a two-disc response support.

Maximize a|u|²+b|v|²+Re(conj(p)u+conj(q)v)+2Re(conj(u)wv), |u|,|v|<=1.
Eliminate v exactly, then cover the u disc by dyadic rectangles. Every returned
interval is rigorous even if the requested tolerance is not reached. No floats,
optimizer tolerance, third-party library, or Gaussian integration is used.
"""
import argparse
import heapq
import json
from fractions import Fraction as F
from math import isqrt


def sqrt_bounds(x, digits=14):
    assert x >= 0
    s = 10**digits
    k = isqrt(x.numerator*s*s//x.denominator)
    lo = F(k,s)
    return lo, lo if lo*lo == x else F(k+1,s)


def chi(b, r):
    assert r >= 0
    return b+r if 2*b+r >= 0 else -r*r/(4*b)


def cmul(x,y):
    return x[0]*y[0]-x[1]*y[1], x[0]*y[1]+x[1]*y[0]


def norm2(z):
    return z[0]*z[0]+z[1]*z[1]


def enclose(a,b,p,q,w,tol=F(1,1000),max_cells=10000):
    p,q,w = tuple(map(F,p)),tuple(map(F,q)),tuple(map(F,w))
    a,b,tol = F(a),F(b),F(tol)
    assert tol > 0 and max_cells >= 1
    two_wbar = (2*w[0],-2*w[1])
    global_r = sqrt_bounds(norm2(q))[1]+2*sqrt_bounds(norm2(w))[1]
    global_p = sqrt_bounds(norm2(p))[1]

    def r2(u):
        x,y=cmul(two_wbar,u)
        return (q[0]+x)**2+(q[1]+y)**2

    def value_lower(u):
        # Rational radial contraction gives a feasible disc point.
        scale=max(F(1),sqrt_bounds(norm2(u))[1])
        u=(u[0]/scale,u[1]/scale)
        return a*norm2(u)+p[0]*u[0]+p[1]*u[1]+chi(b,sqrt_bounds(r2(u))[0]),u

    def cell_bounds(cell):
        xl,xh,yl,yh=cell
        dx=F(0) if xl<=0<=xh else min(abs(xl),abs(xh))
        dy=F(0) if yl<=0<=yh else min(abs(yl),abs(yh))
        near=dx*dx+dy*dy
        if near>1:
            return None
        corners=[(x,y) for x in [xl,xh] for y in [yl,yh]]
        far=min(F(1),max(map(norm2,corners)))
        linear=min(global_p,max(p[0]*x+p[1]*y for x,y in corners))
        rhi=min(global_r,sqrt_bounds(max(map(r2,corners)))[1])
        upper=a*(far if a>=0 else near)+linear+chi(b,rhi)
        lower,point=value_lower(((xl+xh)/2,(yl+yh)/2))
        return lower,upper,point

    lower,point=value_lower((F(0),F(0)))
    best=point
    queue=[]
    serial=0
    cell=(-F(1),F(1),-F(1),F(1))
    l,u,pt=cell_bounds(cell)
    heapq.heappush(queue,(-u,serial,cell))
    cells=1
    while queue and -queue[0][0]-lower>tol and cells+4<=max_cells:
        _,_,cell=heapq.heappop(queue)
        xl,xh,yl,yh=cell
        xm,ym=(xl+xh)/2,(yl+yh)/2
        for xa,xb in [(xl,xm),(xm,xh)]:
            for ya,yb in [(yl,ym),(ym,yh)]:
                child=(xa,xb,ya,yb)
                bounds=cell_bounds(child)
                cells+=1
                if bounds is None:
                    continue
                l,u,pt=bounds
                if l>lower:
                    lower,best=l,pt
                if u>=lower:
                    serial+=1
                    heapq.heappush(queue,(-u,serial,child))
    upper=max(lower,-queue[0][0]) if queue else lower
    return {'lower':str(lower),'upper':str(upper),'gap':str(upper-lower),
            'tolerance_met':upper-lower<=tol,'cells_evaluated':cells,
            'feasible_u':[str(v) for v in best], 'queued_cells':len(queue)}


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--out',required=True)
    p.add_argument('--max-cells',type=int,default=10000)
    p.add_argument('--tolerance',default='1/1000')
    args=p.parse_args()
    cases=[('bilinear',0,0,(0,0),(0,0),(1,0),F(2)),
           ('interior-independent',-1,-1,(1,0),(1,0),(0,0),F(1,2)),
           ('interior-coupled',-1,-1,(1,0),(1,0),(F(1,4),0),F(2,3)),
           ('complex-linear',0,0,(F(3,5),F(4,5)),(0,1),(0,0),F(2))]
    results=[]
    for name,a,b,p,q,w,exact in cases:
        result=enclose(a,b,p,q,w,F(args.tolerance),args.max_cells)
        assert F(result['lower'])<=exact<=F(result['upper'])
        result.update(name=name,a=str(a),b=str(b),p=list(map(str,p)),
                      q=list(map(str,q)),w=list(map(str,w)),known_exact=str(exact))
        results.append(result)
        print(name, 'PASS exact enclosure', 'cells',result['cells_evaluated'],
              'tolerance_met',result['tolerance_met'],flush=True)
    with open(args.out,'w') as f:
        json.dump({'scope':__doc__,'results':results},f,indent=2)
        f.write('\n')


if __name__=='__main__':
    main()

#!/usr/bin/env python3
"""Replay the quantitative gate interpolation after the sparse dilation implementation.
Run from the repository root. Uses the committed original row banks and 14-ordinate profile.
Agent-ID: codex-a7c4.
"""
from fractions import Fraction as Q
from math import ceil, comb, floor
from pathlib import Path
from copy import copy
import sys

sys.path.insert(0, str(Path.cwd() / "research/identity-tail/code"))
import sparse_stein_dilation as sparse
from coupled_stein_profile import checked, affine_pieces, quadratic_maximum, EPS


def plus(a, b):
    return tuple((a[i] if i < len(a) else 0) + (b[i] if i < len(b) else 0)
                 for i in range(max(len(a), len(b))))


def mul(a, b):
    return tuple(sum(a[j] * b[i-j]
                     for j in range(max(0, i-len(b)+1), min(len(a)-1, i)+1))
                 for i in range(len(a) + len(b) - 1))


def sub(a, b):
    return plus(a, tuple(-x for x in b))


def bernstein(f, n=6):
    return [sum(f[j] * Q(comb(i, j), comb(n, j)) for j in range(min(i+1, len(f))))
            for i in range(n+1)]


def curvature(i, j):
    lo = sparse.completed_gate(sparse.header(i)[0])
    hi = sparse.completed_gate(sparse.header(j)[0])
    _, b, c, A, B, C = [(a, z-a) for a,z in zip(lo, hi, strict=True)]
    for xx in (lo, hi):
        checked(xx[3] > 0 and xx[3]*xx[5] > xx[4]**2, "trailing block is not positive definite")
    det = sub(mul(A, C), mul(B, B))
    u, v = sub(mul(B,c), mul(C,b)), sub(mul(B,b), mul(A,c))
    p = plus(mul(det,b[1:]), plus(mul(A[1:],u), mul(B[1:],v)))
    q = plus(mul(det,c[1:]), plus(mul(B[1:],u), mul(C[1:],v)))
    num = sub(plus(mul(C,mul(p,p)), mul(A,mul(q,q))), mul((2,),mul(B,mul(p,q))))
    den = mul(mul(det,det),det)
    nb, db = bernstein(num), bernstein(den)
    checked(min(db) > 0, "invalid denominator coefficient")
    best = min(x/y for x,y in zip(nb,db,strict=True))
    checked(best in (nb[0]/db[0],nb[-1]/db[-1]), "endpoint does not attain the computed curvature")
    lower = Q(floor(best*10**10),10**10)
    checked(min(bernstein(sub(num,mul((lower,),den)))) >= 0, "curvature certificate failed")
    return lower


def weighted_profile(src, prices, curve):
    maxima = []
    outer_maxima = []
    for n,(lo,hi,i,j,old_weight) in enumerate(src.cells):
        rows = dict(src.rows)
        mid = (lo+hi)/2
        rows[0] = mid/2, Q(0), Q(1,2)+src.mass+mid**2/2
        if {i,j} <= {8,9}:
            i,j,price = 8,9,prices.__getitem__
        elif {i,j} <= {6,7}:
            i,j,price = 6,7,sparse.outer_discount
        else:
            if i == j == 13:
                j = 14
            price = lambda _: Q(0)
        el,beta,C = rows[i]
        er,br,D = rows[j]
        penalty = 2*(br-beta)**2/EPS
        for l,h,w,z in affine_pieces(rows,i,j,lo,hi,old_weight):
            dw,dz = price(w),price(z)
            extra = curve(w,z) if (i,j)==(8,9) else Q(0)
            def f(x):
                t,theta = l+x*(h-l),w+x*(z-w)
                return (t**2-2*((1-theta)*el+theta*er)*t+(1-theta)*C+theta*D
                        -penalty*theta*(1-theta)-(1-x)*dw-x*dz-extra*x*(1-x))
            y0,ym,y1 = f(Q(0)),f(Q(1,2)),f(Q(1))
            a = 2*(y0+y1-2*ym)
            val,at = quadratic_maximum((a,y1-y0-a,y0),Q(0),Q(1),True)
            maxima.append((val,n))
            if (i,j)!=(8,9):
                outer_maxima.append((val,n,i,j,l+at*(h-l)))
    val,cell=max(maxima)
    cap=Q(ceil(val*10**11),10**11)
    outside,outer_cell,i,j,t=max(outer_maxima)
    checked((outer_cell,i,j)==(14,6,7), "outer ceiling row changed")
    ceiling=1/(Q(47,2000)+Q(1953,2000)*Q(ceil(outside*10**11),10**11))
    checked(ceiling==Q(100000000000000,71325509501647), "rounded outer amplitude ceiling changed")
    return cap,cell,1/(Q(1953,2000)*cap+Q(47,2000))


def main():
    coeff = curvature(8,9)
    checked(coeff==Q(2019911,10**10) and curvature(6,7)==Q(2053489,10**10),
            "completed gate input changed")
    sparse.base.TestWeightedTightGate.setUpClass()
    src=sparse.base.TestWeightedTightGate()
    weights=sorted({p for lo,hi,i,j,w in src.cells if {i,j}<={8,9}
                    for _,_,a,b in affine_pieces(src.rows,8,9,lo,hi,w) for p in (a,b)})
    checked(len(weights)==9,"wrong mixture weights")
    law=sparse.law(src,True)
    cut=Q(21,100)
    small=copy(law)
    small.pieces=[(l,min(h,cut),a,b,c,d) for l,h,a,b,c,d in law.pieces if l<=cut]
    prices={w:Q(floor(law.discount(w)*10**13),10**13) for w in weights}
    small_prices={w:Q(floor(small.discount(w)*10**13),10**13) for w in weights}
    margins={w:small_prices[w]-d for w,d in prices.items()}
    checked(min(margins.values())>=0,"invalid small-scale margins")
    def curved(w,z):
        return min(4*margins[w],4*margins[z],coeff*(w-z)**2*(cut/law.delta)**2)
    result=weighted_profile(src,prices,curved)
    control=weighted_profile(src,prices,lambda w,z:Q(0))
    checked(result==(Q(8829435313,12500000000),23,Q(25000000000000,17831387166289)),
            "curved interpolation result changed")
    checked(control==(Q(7063549609,10000000000),26,Q(20000000000000,14265112386377)),
            "affine interpolation control changed")
    print("certified curvature",coeff,"shape pieces",len(law.pieces),"weights",len(weights))
    print("curved",result,"affine control",control)


if __name__=="__main__":
    main()

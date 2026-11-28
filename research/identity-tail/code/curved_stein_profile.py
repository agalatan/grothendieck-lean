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



def refinement_knots(source):
    """Amplitude cuts in the two increasing 08/09 affine pieces; keep the parent row data."""
    result = {}
    for cell, expected in ((23, (Q(3429,4096), Q(8577,10240))), (26, (Q(4293,5120), Q(2151,2560)))):
        lo, hi, i, j, fallback = source.cells[cell]
        checked((lo, hi) == expected and (i, j) == (8, 9), "binding cell changed")
        moving = [(l, h) for l, h, w, z in affine_pieces(source.rows, i, j, lo, hi, fallback) if w < z]
        checked(len(moving) == 1, "expected one rising price segment")
        l, h = moving[0]
        cuts = [(l+h)/2]
        if cell == 23:
            cuts.extend(map(Q, (".837431408", ".837436036", ".837437149", ".837447529")))
        checked(len(set(cuts)) == len(cuts) and all(l < t < h for t in cuts), "invalid refinement cut")
        result[cell] = tuple(sorted(cuts))
    return result


def split_pieces(rows, i, j, low, high, fallback, cuts):
    """Restrict one affine weight path; clipping points remain actual segment endpoints."""
    for l, h, w, z in affine_pieces(rows, i, j, low, high, fallback):
        stops = [l, *(t for t in cuts if l < t < h), h]
        for x, y in zip(stops, stops[1:]):
            yield x, y, w+(z-w)*(x-l)/(h-l), w+(z-w)*(y-l)/(h-l)


def central_weights(source, cuts):
    return {weight for n, (l,h,i,j,fallback) in enumerate(source.cells) if {i,j} <= {8,9}
            for _,_,a,b in split_pieces(source.rows, 8, 9, l, h, fallback, cuts.get(n, ()))
            for weight in (a,b)}


def weighted_segments(src, prices, curve, *, central_endpoints=None, cuts=None):
    """Yield the normalized quadratic on each closed amplitude segment."""
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
        extra_cuts = () if cuts is None else cuts.get(n, ())
        for l,h,w,z in split_pieces(rows, i, j, lo, hi, old_weight, extra_cuts):
            dw,dz = price(w),price(z)
            extra = curve(w,z) if (i,j)==(8,9) else Q(0)
            if (i,j)==(8,9) and central_endpoints is not None:
                dw,dz,extra = central_endpoints(n,l,h,w,z)
            def f(x):
                t,theta = l+x*(h-l),w+x*(z-w)
                return (t**2-2*((1-theta)*el+theta*er)*t+(1-theta)*C+theta*D
                        -penalty*theta*(1-theta)-(1-x)*dw-x*dz-extra*x*(1-x))
            y0,ym,y1 = f(Q(0)),f(Q(1,2)),f(Q(1))
            a = 2*(y0+y1-2*ym)
            yield n, i, j, l, h, (a, y1-y0-a, y0)


def weighted_profile(src, prices, curve, *, central_endpoints=None, cuts=None):
    maxima = []
    outer_maxima = []
    for n, i, j, l, h, coeffs in weighted_segments(src, prices, curve, central_endpoints=central_endpoints, cuts=cuts):
        val, at = quadratic_maximum(coeffs, Q(0), Q(1), True)
        maxima.append((val, n))
        if (i, j) != (8, 9):
            outer_maxima.append((val, n, i, j, l+at*(h-l)))
    val,cell=max(maxima)
    cap=Q(ceil(val*10**11),10**11)
    outside,outer_cell,i,j,t=max(outer_maxima)
    checked((outer_cell,i,j)==(14,6,7), "outer ceiling row changed")
    ceiling=1/(Q(47,2000)+Q(1953,2000)*Q(ceil(outside*10**11),10**11))
    checked(ceiling==Q(100000000000000,71325509501647), "rounded outer amplitude ceiling changed")
    return cap,cell,1/(Q(1953,2000)*cap+Q(47,2000))


def price_tables(law, weights):
    """Replay the two central price tables and their curvature deduction."""
    cut=Q(21,100)
    small=copy(law)
    small.pieces=[(l,min(h,cut),a,b,c,d) for l,h,a,b,c,d in law.pieces if l<=cut]
    prices={w:Q(floor(law.discount(w)*10**13),10**13) for w in weights}
    small_prices={w:Q(floor(small.discount(w)*10**13),10**13) for w in weights}
    return prices, small_prices


def curvature_deduction(law, coeff, prices, small_prices):
    cut=Q(21,100)
    margins={w:small_prices[w]-d for w,d in prices.items()}
    checked(min(margins.values())>=0,"invalid small-scale margins")
    def curved(w,z):
        return min(4*margins[w],4*margins[z],coeff*(w-z)**2*(cut/law.delta)**2)
    return curved


def production_deductions(law, weights, coeff):
    """The original replay API, including the physical Rice callback consumer."""
    prices, small_prices = price_tables(law, weights)
    return prices, curvature_deduction(law, coeff, prices, small_prices)


def check_lean_prices(declaration, expected, *, allow_additional=False):
    source = Path("Grothe/LowerAnalytic/SparseSteinWeights.lean").read_text()
    start = f"def {declaration} : List (ℚ × ℚ) := ["
    body = source.split(start, 1)[1].split("]", 1)[0]
    entries = []
    for line in body.strip().splitlines():
        pair = line.strip().removesuffix(",")
        checked(pair.startswith("(") and pair.endswith(")"), "invalid Lean price entry")
        weight, price = pair[1:-1].split(",")
        entries.append((Q(weight.strip()), Q(price.strip())))
    checked(entries == sorted(dict(entries).items()), f"Lean {declaration} weights must be unique and sorted")
    selected = [(w, price) for w, price in entries if w in expected] if allow_additional else entries
    checked(selected == sorted(expected.items()), f"Lean {declaration} differs from the physical replay")


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
    # A single amplitude and its exact worst admissible chord price limit this method.
    l,h,i,j,weight=src.cells[23]
    checked({i,j} <= {8,9}, "the obstruction must lie in the central cells")
    segment,=affine_pieces(src.rows,8,9,l,h,weight)
    l,h,w,z=segment
    u=Q(497,1000)
    t,v=l+(h-l)*u,w+(z-w)*u
    left,beta_left,cap_left=src.rows[8]
    right,beta_right,cap_right=src.rows[9]
    required_cap=(t*t-2*((1-v)*left+v*right)*t+(1-v)*cap_left+v*cap_right
                  -(2/EPS)*(beta_left-beta_right)**2*v*(1-v)-law.discount(v))
    ceiling=1/(Q(47,2000)+Q(1953,2000)*required_cap)
    checked(t==Q(17149473,20480000) and Q("1.402022188813") < ceiling < Q("1.402022188814"),
            "fixed central weight-path ceiling changed")
    prices, curved = production_deductions(law, weights, coeff)
    result=weighted_profile(src,prices,curved)
    control=weighted_profile(src,prices,lambda w,z:Q(0))
    checked(result==(Q(8829435313,12500000000),23,Q(25000000000000,17831387166289)),
            "curved interpolation result changed")
    checked(control==(Q(7063549609,10000000000),26,Q(20000000000000,14265112386377)),
            "affine interpolation control changed")
    # Historical pure identity-tail midpoint; it uses only the first cut on parent cell 23.
    cuts = {23: ((l+h)/2,)}
    refined_weights = central_weights(src, cuts)
    prices, small_prices = price_tables(law, refined_weights)
    midpoint = (w+z)/2
    checked(len(refined_weights) == 10 and
            (prices[midpoint], small_prices[midpoint]) == (Q(10853361,10**12), Q(251609893,10**13)),
            "pure midpoint discounts changed")
    curved = curvature_deduction(law, coeff, prices, small_prices)
    refined = weighted_profile(src, prices, curved, cuts=cuts)
    checked(refined == (Q(70635481227,10**11), 23, Q(200000000000000,142651094836331))
            and refined[2] > result[2], "pure midpoint result changed")
    print("pure midpoint", midpoint, "refined", refined)
    print("certified curvature",coeff,"shape pieces",len(law.pieces),"original weights",len(weights))
    print("curved",result,"affine control",control)
    print("fixed central path ceiling at amplitude",t,"< 1.402022188814")


if __name__=="__main__":
    main()

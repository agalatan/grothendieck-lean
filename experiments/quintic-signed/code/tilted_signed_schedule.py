"""Rational replay of the signed fifth witness and two controls on 57 physical pieces.

Run at the repository root. Agent-ID: codex-a7c4
"""
from fractions import Fraction as Q
from functools import cache
from math import ceil, floor, isqrt
from pathlib import Path
import sys

sys.path.insert(0, str(Path.cwd() / "research/identity-tail/code"))
sys.path.insert(0, str(Path(__file__).resolve().parent))
import first_chaos_profile as first
from physical_rice_scale import CUTS, MU_UP, SMALL, clipped_model
from coupled_stein_profile import checked, quadratic_maximum
from one_coordinate_multiplier import ALPHA, BETA, NU, pi_interval
from tilted_radial_prices import check_prices

CUT = Q(".885868")
MU = Q(".886226925452759")
PI_LO, PI_HI = Q("3.14159265358979323"), Q("3.14159265358979324")
R = Q(17,80)
W = Q(7,100000)
D = Q(1,31250000)
CAP = Q(7132538206126,10**13)
SWITCH = Q(".885908226465471")


def physical_segments():
    case = first.curved.sparse.base.TestWeightedTightGate
    case.setUpClass()
    source = case()
    law = first.curved.sparse.law(source, True)
    cuts = first.curved.refinement_knots(source)
    cuts[24] = (sum(source.cells[24][:2])/2,)
    cuts[25] = (Q(".83835"),)
    weights = first.curved.central_weights(source, cuts)
    prices, small = first.curved.price_tables(law, weights)
    curve = first.curved.curvature(8,9)
    old = first.curved.curvature_deduction(law,curve,prices,small)
    kappa = curve*(SMALL/law.delta)**2
    slope, intercept = Q(2129,2166), Q(2167,2166)

    @cache
    def debit(cut,w):
        return Q(floor(clipped_model(law,cut).discount(w)*10**13),10**13)

    def endpoints(n,lo,hi,w,z):
        if n in CUTS:
            limit = 2*slope*MU_UP*(intercept*MU_UP-lo)*law.delta**2
            checked(limit>=0,"negative Rice budget")
            cut = max(SMALL,Q(1+isqrt(floor(limit*10**8)),10000))
            checked(limit<=cut**2,"inadmissible scale cutoff")
            dw,dz = debit(cut,w),debit(cut,z)
        else:
            dw,dz = prices[w],prices[z]
        bonus = min(4*(small[w]-dw),4*(small[z]-dz),kappa*(w-z)**2)
        checked(bonus>=0,"negative curvature debit")
        return dw,dz,bonus

    pieces = [first.Segment(n,l,h,v) for n,_,_,l,h,v in
              first.curved.weighted_segments(source,prices,old,cuts=cuts,central_endpoints=endpoints)]
    first.check_partition(pieces,source.cells)
    checked(len(pieces)==57 and len(weights)==17,"physical partition changed")
    return pieces


def high(w,d,t,*,residual=R):
    return ((1-w)*(NU+PI_HI/4*(ALPHA-BETA/8)+ALPHA*(MU-t)**2+
                   2*residual*MU*(MU-t)+Q(1,10**52))+w*t*t-3*PI_LO*d/256)


def envelope(pieces,w,d,switch,*,residual=R,radial_start=CUT,radial_floor=Q(13,500)):
    a,b,c = first.physical_scales(w)
    checked(0<w<1 and 0<=d/(1-w)<=Q(1,10000),"effective debit outside multiplier range")
    candidates = [high(w,d,switch,residual=residual),high(w,d,MU,residual=residual)]
    for s in pieces:
        if s.low>=switch:
            continue
        for lo,hi,sc in [(s.low,min(radial_start,s.high,switch),(a,b-Q(41,20)*d,c+Q(3371,2000)*d)),
                         (max(s.low,radial_start),min(s.high,switch),(a,b,c-radial_floor*d))]:
            if lo<=hi:
                width = s.high-s.low
                price,_ = quadratic_maximum(s.transformed(sc),(lo-s.low)/width,(hi-s.low)/width,True)
                candidates.append(price)
    return max(candidates)


def main():
    checked(check_prices(Q(".09"),Q(1),Q(".0001"),Q(".485"),uniform=True) and
            R==BETA-Q(".485")-Q(".09"),"tilted high-arm certificate")
    lo,hi = pi_interval()
    checked(PI_LO<lo<hi<PI_HI<4*MU**2 and PI_HI<4*MU_UP**2,"Gaussian mean enclosure")
    pieces = physical_segments()
    value = envelope(pieces,W,D,SWITCH)
    checked(Q(ceil(value*10**13),10**13)==CAP and 1/CAP>Q("1.40202543765"),"signed endpoint")
    test = Q(".885908228863324")
    rows = [s.at(test,first.physical_scales(W)) for s in pieces if s.low<=test<=s.high]
    checked(rows and min([*rows,high(W,0,test)])>CAP,"fixed-weight zero-debit price also passes")
    other = envelope(pieces,Q(".00006989"),0,Q(".885908226432267"))
    checked(1/other>Q("1.40202545078"),"retuned zero-debit comparison")
    print(f"57 physical pieces: signed cap {CAP}, reciprocal > 1.40202543765.")
    print(f"At t={test} both zero-debit prices at the matched weight exceed the signed cap.")
    print("Retuning the weight at zero debit certifies > 1.40202545078.")


if __name__=="__main__":
    main()

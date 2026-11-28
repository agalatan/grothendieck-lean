"""Exact central cutoffs from the circular sixth moment on the 117-piece sparse cover.

Agent-ID: codex-a7c4
"""
from fractions import Fraction as Q
from math import ceil
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from sixth_rice_support import MAX_LAMBDA, MU_UP, factor
from repriced_signed import repriced_segments, first, checked, clipped_model, SMALL

LAMBDAS=[Q(i,400) for i in range(80,139)]
checked(max(LAMBDAS)==MAX_LAMBDA,"upper support parameter")


def scale_limit(law,l):
    tau=min((MU_UP*factor(lam)-l)/lam for lam in LAMBDAS)
    checked(tau>=0,"negative scale bound")
    return max(SMALL,Q(ceil(10000*law.delta*tau),10000))


def physical_pieces():
    pieces=repriced_segments(scale_limit=scale_limit)
    case=first.curved.sparse.base.TestWeightedTightGate
    case.setUpClass()
    source=case()
    law=first.curved.sparse.law(source,True)
    small=Q(134819,250000000000)
    checked(small<=clipped_model(law,SMALL).discount(Q(1)),"row 9 small scale price")
    result=[]
    for seg in pieces:
        if seg.cell not in (29,30):
            result.append(seg)
            continue
        l,h,i,j,fallback=source.cells[seg.cell]
        checked(i==9 and j==12 and scale_limit(law,l)==SMALL,"outer row correction")
        choices=[(w,z) for l0,h0,w,z in first.curved.split_pieces(source.rows,i,j,l,h,fallback,())
                 if l0==seg.low and h0==seg.high]
        checked(len(choices)==1,"missing outer row weights")
        w,z=choices[0]
        a,b,c=seg.hat
        result.append(first.Segment(seg.cell,seg.low,seg.high,(a,b+small*(z-w),c-small*(1-w))))
    first.check_partition(result,source.cells)
    return result


def main():
    from combined_central_profile import obstruction
    from joint_cubic_schedule import replay as joint_receipt
    from sixth_rice_support import main as sixth_receipt
    from tilted_signed_schedule import envelope

    sixth_receipt()
    joint_receipt()
    pieces=physical_pieces()
    options=dict(residual=Q(".149"), radial_start=Q(".88575"), radial_floor=Q(".023"))
    switch=Q(".885774")
    for name,w,d,numerator,claim in (
            ("signed",Q(".000049481859"),Q(1,10**8),7132523664641,Q("1.40202829603")),
            ("zero-debit",Q(".000049461431"),0,7132523642307,Q("1.40202830042"))):
        price=envelope(pieces,w,d,switch,**options)
        cap=Q(numerator,10**13)
        checked(ceil(price*10**13)==numerator and 1/cap>claim,name+" endpoint")
        print(f"Sixth-moment {name} cap {cap}; reciprocal > {float(claim):.11f}.")

    matched=envelope(pieces,Q(".000049481859"),0,switch,**options)
    checked(ceil(matched*10**13)==7132523648371,"matched signed-weight ablation")
    pure=envelope(pieces,Q(".00004946138633"),0,switch,**options)
    pure_cap=Q(713252364229283,10**15)
    checked(ceil(pure*10**15)==713252364229283,"two-contact pure weight")
    lower,debit=obstruction(
        pieces,options["residual"],contacts=(Q(".81120935856"),Q(".861937787768")),
        pure_cap=pure_cap,price_lower=Q(".7132523642292822"),debit_lower=Q(".22333265"),
        weight_range=(Q(".000048"),Q(".000051")),switch=switch,outer_cap=Q(".71325218370"),
    )
    checked(1/pure_cap>Q("1.402028300432718") and 1/lower<Q("1.402028300432721"),
            "sixth-order optimized pure price window")
    print("Matched zero-debit 7132523648371/10^13; retuned pure reciprocal >1.402028300432718.")
    print("Two central contacts: all positive debits lose to a pure weight under these estimates.")


if __name__=="__main__":
    main()

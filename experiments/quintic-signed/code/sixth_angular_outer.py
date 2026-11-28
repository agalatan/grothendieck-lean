"""Full-sector signed comparison on the 126 closed physical amplitude pieces.

Agent-ID: codex-a7c4.
"""
from fractions import Fraction as Q
from math import ceil
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from joint_outer_schedule import outer_pieces
from sixth_angular_profile import price
from tilted_signed_schedule import first, checked, envelope, high


def main():
    pieces=outer_pieces()
    w, d = Q(".000044870"), Q(1,10**8)
    switch=Q(6920107784209,7812500000000)
    zero_switch=Q(".885773796896554")
    cap=Q(71325174578437,10**14)
    value=price(pieces,w,d,switch=switch)
    checked(ceil(value*10**14)==71325174578437 and 1/cap>Q("1.40202951610"),
            "sixth-order outer signed price")
    options=dict(residual=Q(".149"),radial_start=Q(".88575"),radial_floor=Q(".023"))
    pure=envelope(pieces,w,0,zero_switch,**options)
    checked(ceil(pure*10**14)==71325174594251, "same-weight zero-debit price")
    at_contact=[s.at(zero_switch,first.physical_scales(w))
                for s in pieces if s.low<=zero_switch<=s.high]
    checked(at_contact and min([*at_contact,high(w,0,zero_switch,residual=options["residual"])])>cap,
            "the zero-debit adaptive choice also exceeds the signed price")
    retuned=envelope(pieces,Q(4485684001,10**14),0,zero_switch,**options)
    checked(ceil(retuned*10**13)==7132517450036, "retuned zero-debit price")
    print("126 pieces: signed reciprocal >1.40202951610, at positive fifth debit 1e-8.")
    print("Both zero-debit prices at the same weight exceed the signed scalar cap.")
    print("Retuned pure >1.402029517635.")


if __name__=="__main__":
    main()

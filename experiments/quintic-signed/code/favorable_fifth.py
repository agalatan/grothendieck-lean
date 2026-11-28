"""Strict full fifth energy on a populated high-central support region.

Agent-ID: codex-a7c4.
"""
from fractions import Fraction as Q
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from reverse_fifth_planes import proof_rows, floor, exclude_shapes, check_support, require
from gaussian_quadrature_rice import MU_LO

LAM=Q(".24")
SUP=Q(".911393002")
CENTERS=tuple(map(Q,[".20860",".07308",".05967"]))
H=Q(".16591")
ROWS=[tuple(map(Q,s.split())) for s in [
    ".015 -.03537 .00444 .01994 .000046",
    ".06 -.03374 .00455 .02014 .000052",
    ".15 -.03048 .00478 .02052 .000063",
]]


def main():
    proof_rows(LAM,CENTERS,H,ROWS,((0,2,512),(2,12,128),(12,32,16),(32,64,2)),Q(".23"))
    check_support(LAM,SUP)
    for t,r,shape,claim in [
        (Q(".862"), Q(".2058"), Q(".02"), Q(".010738")),
        (Q(".86183138"), Q(".206505"), Q(".02"), Q(".011010")),
        (Q(".862"), Q(".2057"), Q(".2"), Q(".006193")),
        (Q(".862"), Q(".2055"), Q(1), Q(".001448")),
        (Q(".862"), Q(".2054"), Q(1), Q(".000173")),
    ]:
        exclude_shapes(shape,t+LAM*r,LAM)
        require(t*t+r*r<MU_LO**2,"finite occupancy by strict Gaussian limit")
        bound=floor(t,r,shape,lam=LAM,sup=SUP,rows=ROWS)
        require(bound>claim,"favorable full fifth floor")
        print(f"Finite occupied t>={t}, tau>={r}: full fifth difference > {claim}.")
    print("The signed fifth debit is strictly favorable on each of these support half-planes.")


if __name__=="__main__":
    main()

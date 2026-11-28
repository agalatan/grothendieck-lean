"""Pay a physical cubic direction inside the 117-piece signed fifth estimate.

Agent-ID: codex-a7c4.
"""
from fractions import Fraction as Q
from math import ceil
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from central_fifth_floor import gram_blocks
from sixth_repriced import physical_pieces, MU_UP
from tilted_signed_schedule import ALPHA, BETA, NU, MU, PI_LO, high, first, quadratic_maximum, checked


def price(pieces, w, debit, switch=Q(".885774")):
    residual = Q(".149")
    checked(0 < w < 1 and 0 < debit <= (1-w)/10000, "signed high multiplier range")
    s = debit / (2*BETA)
    checked(0 <= 1-w-s, "negative sparse hat multiplier")
    candidates = [high(w,debit,t,residual=residual) for t in [switch,MU]]
    for p in pieces:
        if p.low >= switch:
            continue
        # Either choice holds at every amplitude. Select one per closed piece.
        lam = Q(4,5) if p.low < Q(".83") else Q(1,2)
        c = 1 + 1 / (1+lam)
        j = (1-lam)*c
        fifth_constant = j / (Q(51,64)+j) * 3*PI_LO/256
        fifth_slope = 2*c*MU_UP
        # L(t) includes one half of the full Qk cost. Scale down its row
        # coefficient, then retain the accompanying visible Qh debit.
        scales = (
            ALPHA*(1-w-s),
            w+s*ALPHA,
            (1-w)*NU-debit*fifth_constant+debit*fifth_slope*MU_UP
            -debit/2*(PI_LO/32-MU_UP**2),
        )
        a,b,c = p.transformed(scales)
        slope = -debit*(fifth_slope+MU_UP/2)
        width = p.high-p.low
        poly = a, b+slope*width, c+slope*p.low
        xhi = (min(switch,p.high)-p.low)/width
        candidates.append(quadratic_maximum(poly,Q(0),xhi,True)[0])
    return max(candidates)


def main():
    checked(gram_blocks()==9, "joint cubic and fifth Gram budget")
    pieces = physical_pieces()
    w, d = Q(".000049474748"), Q(1,10**8)
    bound = price(pieces,w,d)
    cap = Q(71325236499889,10**14)
    checked(ceil(bound*10**14)==71325236499889 and 1/cap>Q("1.40202829891"),
            "angular signed endpoint")
    from tilted_signed_schedule import envelope
    pure = envelope(pieces,w,0,Q(".885774"),residual=Q(".149"),
                    radial_start=Q(".88575"),radial_floor=Q(".023"))
    checked(pure < cap, "matched pure price")
    print(f"Angular full-sector signed cap {cap}; reciprocal >1.40202829891.")
    print(f"Matched pure cap {ceil(pure*10**14)}/10^14; retuned pure >1.402028300432718.")


if __name__=="__main__":
    main()

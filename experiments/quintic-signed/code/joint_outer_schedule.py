"""Rebuild the 06/07 and 09/12 outer prices from their original row bounds.

Agent-ID: codex-a7c4
"""
from fractions import Fraction as Q
from functools import cache
from math import ceil, floor
from pathlib import Path
import json
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from sixth_repriced import LAMBDAS, MU_UP, factor, physical_pieces
from repriced_signed import first, checked, SMALL
from coupled_stein_profile import chords, expected_value, quadratic_maximum
from test_tight_shared_gate import completed_gate, gate_minimum, header

sparse = first.curved.sparse
C6 = Q(4045313, 100000)
SMALL_RECT = Q(".03")


def row12_node(node, s_lo, s_hi):
    a0,a2,a4,a6,a1 = map(Q, node["y"])
    checked(a1 >= 0 and a6 >= 0, "unsigned moment coefficients")

    def expected(s):
        third = 6+9*s+C6*s*sparse.sqrt_upper(s)
        return a0+a2+a4*(2+s)+a6*third+Q(".93")*a1

    return Q(node["sigma"]), max(expected(s_lo),expected(s_hi))


def pair_prices(source):
    nine = json.loads(Path("data/antistein-rows/antistein_0.845.json").read_text())
    twelve = json.loads(Path("data/tail-rows/plain/row_0.87.json").read_text())
    row9,_ = header(9)
    row12,_ = header(12)
    delta,k12 = row12[2:4]
    checked(delta == row9[2] and k12 == Q(twelve["kappa"]), "different scale maps")
    cap9,cap12 = Q(nine["cap"]),row12[5]
    gate9,gate12 = source.gates[9],list(completed_gate(row12))
    gate12[0] -= k12*delta**2-delta
    knots = ({Q(c[k]) for c in nine["cells"] for k in ("s_lo","s_hi")}
             | {Q(x)**2 for c in twelve["cells"] for x in c["x"] if Q(x)**2 <= 42}
             | {Q(42)})
    knots = sorted(knots)
    checked(knots[0]==0 and knots[-1]==42,"fourth excess cover")
    extra = sparse.extra()
    bank = []
    for sl,sh in zip(knots,knots[1:]):
        src9 = [c for c in nine["cells"] if Q(c["s_lo"])<=sl and sh<=Q(c["s_hi"])]
        src12 = [c for c in twelve["cells"] if Q(c["x"][0])**2<=sl and sh<=Q(c["x"][1])**2]
        checked(len(src9)==len(src12)==1 and src12[0]["kind"]=="stein","shape parents")
        p,r = src9[0],src12[0]
        points = dict(expected_value(n,p,Q(nine["nodes"][0][1])) for n in p["nodes"])
        for (ll,hh,i),extra_points in extra.items():
            if i==9 and ll<=sl and sh<=hh:
                for z,v in extra_points.items():
                    points[z]=min(points.get(z,v),v)
        lefts=chords(sparse.hull(points.items()),SMALL)
        right_nodes=[row12_node(n,sl,sh) for n in r["nodes"]]
        checked(right_nodes[0][0]==SMALL_RECT and right_nodes[-1][0]>=SMALL,"row 12 coverage")
        for (lo,v),(hi,y) in zip(right_nodes,right_nodes[1:]):
            checked(lo<hi,"unordered row 12 nodes")
            slope=(y-v)/(hi-lo)
            for l,h,a,b in lefts:
                if max(lo,l)<=min(hi,h):
                    bank.append((max(lo,l),min(hi,h),a,b,v-lo*slope,slope))

    # Above every original node and on the final Lipschitz ray, including the
    # small-scale range where row 12's Stein node sequence has not started.
    B=Q("1.1157")
    _,encoded=header(12)
    points=sparse.hull([tuple(map(Q,pair.split(":"))) for pair in encoded.split(";")])
    faces=[(l,h,y,(z-y)/(h-l)) for (l,y),(h,z) in zip(points,points[1:])]
    faces.append((points[-1][0],None,points[-1][1],row12[4]))
    def intercept(l,h,y,slope):
        x=max(l,slope/(2*B))
        if h is not None:
            x=min(x,h)
        return y+slope*(x-l)-B*x*x
    A=max(intercept(*face) for face in faces)
    checked(B>0 and cap12-A-max(0,B-k12)*SMALL_RECT**2>0,"row 12 small reserve")

    @cache
    def deduction(w,cut):
        checked(0<=w<=1 and SMALL_RECT<=cut<=SMALL,"outer weight or cutoff")
        gate=gate_minimum([(1-w)*a+w*b for a,b in zip(gate9,gate12)])
        checked(gate>=0,"mixed gate")
        k=(1-w)*row9[3]+w*k12+gate/delta**2
        baseline=(1-w)*cap9+w*cap12
        saving=w*(cap12-A-max(0,B-k12)*SMALL_RECT**2)
        for l,h,a,b,c,d in bank:
            if l<=cut:
                value,_=quadratic_maximum((-k,(1-w)*b+w*d,(1-w)*a+w*c),l,min(h,cut),True)
                saving=min(saving,baseline-value)
        return Q(floor(10**13*saving),10**13)

    return delta,deduction


def segment(source,n,l,h,i,j,w,z,dw,dz):
    el,beta,C=source.rows[i]
    er,br,D=source.rows[j]
    penalty=2/first.curved.EPS*(beta-br)**2
    def at(x):
        t=l+x*(h-l)
        u=w+x*(z-w)
        return (t*t-2*((1-u)*el+u*er)*t+(1-u)*C+u*D-penalty*u*(1-u)
                -((1-x)*dw+x*dz))
    start,mid,end=at(0),at(Q(1,2)),at(1)
    a=2*(start+end-2*mid)
    return first.Segment(n,l,h,(a,end-start-a,start))


def outer_pieces():
    case=first.curved.sparse.base.TestWeightedTightGate
    case.setUpClass()
    source=case()
    pieces=[s for s in physical_pieces() if s.cell not in (14,29,30)]
    delta,price=pair_prices(source)
    for n in (29,30):
        left,right,i,j,_=source.cells[n]
        checked((i,j)==(9,12),"outer row indices")
        el,beta,C=source.rows[i]
        er,br,D=source.rows[j]
        penalty=2/first.curved.EPS*(br-beta)**2
        def weight(t):
            return max(0,min(1,(penalty+C-D+2*(er-el)*t)/(2*penalty)))
        for k in range(4):
            l,h=left+(right-left)*k/4,left+(right-left)*(k+1)/4
            w,z=weight(l),weight(h)
            tau=min((MU_UP*factor(lam)-l)/lam for lam in LAMBDAS)
            cut=Q(ceil(10000*delta*tau),10000)
            pieces.append(segment(source,n,l,h,9,12,w,z,price(w,cut),price(z,cut)))
    l,h,i,j,_=source.cells[14]
    checked((i,j)==(6,7),"outer shoulder rows")
    weights=[Q(n,1000) for n in (164,237,309,381,454)]
    gate6,H6,K6=sparse.outer_data(6,Q(112663,100000),Q(1306661436213,10**12))
    gate7,H7,K7=sparse.outer_data(7,Q(113409,100000),Q(332286882463,250000000000))

    def shoulder_price(w):
        gate=gate_minimum([(1-w)*a+w*b for a,b in zip(gate6,gate7)])
        checked(gate>=0 and min(H6,H7,K6,K7)>0,"separate outer reserves")
        return min((1-w)*max(0,H6-K6*x)+w*max(0,H7-K7*x)+gate*x
                   for x in (0,H6/K6,H7/K7))
    for k,(w,z) in enumerate(zip(weights,weights[1:])):
        left,right=l+(h-l)*k/4,l+(h-l)*(k+1)/4
        pieces.append(segment(source,14,left,right,6,7,w,z,shoulder_price(w),shoulder_price(z)))
    pieces.sort(key=lambda s:s.low)
    first.check_partition(pieces,source.cells)
    checked(len(pieces)==126,"outer schedule length")
    return pieces


def main():
    from tilted_signed_schedule import envelope
    from joint_cubic_schedule import replay
    from sixth_rice_support import main as sixth_receipt
    sixth_receipt()
    replay()
    pieces=outer_pieces()
    for label,w,d,switch,n,claim in (
        ("signed",Q(2244262513,50000000000000),Q(1,10**8),Q(6920107784209,7812500000000),7132517467996,Q("1.402029514104")),
        ("control",Q(4485684001,10**14),0,Q(".885773796896554"),7132517450036,Q("1.402029517635")),
    ):
        cap=Q(n,10**13)
        value=envelope(pieces,w,d,switch,residual=Q(".149"),radial_start=Q(".88575"),radial_floor=Q(".023"))
        checked(Q(ceil(value*10**13),10**13)==cap and 1/cap>claim,label+" bound")
        print(f"126-piece {label} cap {cap}; reciprocal > {float(claim):.12f}.")


if __name__=="__main__":
    main()

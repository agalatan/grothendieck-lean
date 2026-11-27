"""Exact shifted-resolvent comparison for every energy from .0463 to infinity.

Agent-ID: codex-a7c4. Run with python3 -IB verify.py.
"""
import hashlib
import json
from fractions import Fraction as Q
from pathlib import Path

HERE = Path(__file__).resolve().parent
OLD = HERE.parent / "tilted-sector-2026-11-15"
DIGESTS = {
    "": "2db0596069ea33bf8cb1a3ac7db07b53c55f4d161f4d7f8498beeb5390125196",
    "30": "f393ddc6b8f88039bcba2f4d351d0c4315fd7866cd9b37bd61546a258dfee50e",
    "35": "5b8080128ad1791fd57a491abbf814c996806fe32cd8213f16171580514a92e4",
    "44": "581f7e90ec6fe1a52e42271d43b5e337319a93fdcd37b2b934b87a7ce53b21c6",
}
EDGES = list(map(Q, [".0463", ".051", ".06", ".08", ".12", ".25"]))
PRICES = list(map(Q, [".032", ".0307", ".0285", ".0245", ".0191", ".0133"]))


def require(condition, message):
    if not condition:
        raise ValueError(message)


class Spline:
    def __init__(self, values, slopes):
        self.n = len(values) - 1
        require(self.n > 0 and len(values) == len(slopes), "spline dimensions")
        self.pieces = []
        for i in range(self.n):
            n = self.n
            jump = values[i + 1] - values[i]
            self.pieces.append((values[i], slopes[i],
                                3*n*n*jump - n*(2*slopes[i] + slopes[i + 1]),
                                n*n*(slopes[i] + slopes[i + 1] - 2*n*jump)))

    def jet(self, x, mid):
        i = int(self.n * mid)
        a,b,c,d = self.pieces[i]
        t = x - Q(i,self.n)
        return (a+t*(b+t*(c+t*d)), b+t*(2*c+3*d*t), 2*c+6*d*t, 6*d)


def ordinates(jets, x, y, energy=None):
    def value_and_slope(jet, z):
        f,df,ddf,dddf = jet
        if energy is None:
            return f,df
        return (Q(5,3)*f+z*df-energy*ddf/2,
                Q(8,3)*df+z*ddf-energy*dddf/2)
    a, da = value_and_slope(jets[0], x)
    b, db = value_and_slope(jets[1], y)
    return (a, a+(y-x)*da/3, b-(y-x)*db/3, b)


def load_source():
    sources = []
    for tag, digest in DIGESTS.items():
        raw = (OLD / f"deficit_structure_content_witness_absolute{tag}.json").read_bytes()
        require(hashlib.sha256(raw).hexdigest() == digest, "source witness digest")
        data = json.loads(raw)
        spline = Spline(list(map(Q,data["values"])), list(map(Q,data["derivatives"])))
        require(spline.n == 500 and data["absolute"] is True, "absolute source")
        sources.append((spline,list(map(Q,data["u"]))))
    return sources


def dominates_source(targets, candidates, depth=0):
    # Cubic Bernstein ordinates on a closed interval. The inherited source
    # majorant may differ between subintervals and between energy endpoints.
    if any(all(a >= b for a,b in zip(targets, old)) for old in candidates):
        return True
    if depth >= 12:
        return False
    def halves(poly):
        a,b,c,d = poly
        ab,bc,cd = (a+b)/2,(b+c)/2,(c+d)/2
        l,r = (ab+bc)/2,(bc+cd)/2
        return ((a,ab,l,(l+r)/2), ((l+r)/2,r,cd,d))
    left,right = halves(targets)
    lsrc,rsrc = zip(*(halves(poly) for poly in candidates))
    return dominates_source(left,lsrc,depth+1) and dominates_source(right,rsrc,depth+1)


def check_row(row, idx, sources):
    u0 = Q(row["lo"])
    u1 = None if row["hi"] is None else Q(row["hi"])
    require(u0 == EDGES[idx] and u1 == (EDGES[idx+1] if idx+1 < len(EDGES) else None),
            "energy coverage")
    alpha,beta,price = map(Q, (row["alpha"],row["beta"],row["gamma"]))
    require(min(alpha,beta) >= 0 and price == PRICES[idx], "announced price")
    # (alpha sqrt(.0325) + beta sqrt(11/108))^2 <= price, without radicals.
    left = alpha**2*Q(13,400)
    right = beta**2*Q(11,108)
    room = price-left-right
    require(room >= 0 and room**2 >= 4*left*right, "angular price")
    values = [Q(v,10**10) for v in row["values"]]
    slopes = [Q(v,10**10) for v in row["derivatives"]]
    new = Spline(values,slopes)
    require(new.n == 80 and values[0] >= 0 and slopes[-1] >= 0 and
            Q(9,25) <= values[-1] <= alpha*Q(9,25)+beta, "boundary or tail")
    edges = sorted({Q(i,n) for n in (80,500) for i in range(n+1)})
    for x,y in zip(edges,edges[1:]):
        mid=(x+y)/2
        fresh = [new.jet(z,mid) for z in (x,y)]
        old_candidates = []
        for old, us in sources:
            past = [old.jet(z,mid) for z in (x,y)]
            old_candidates.extend(ordinates(past,x,y,u) for u in us)
        # The last entry of DIGESTS is the angular witness at u=.044.
        angular = ordinates(past,x,y)
        bounds = ordinates(fresh,x,y)
        require(all(0 <= b <= alpha*a+beta for b,a in zip(bounds,angular)),
                f"angular envelope on {x}..{y}")
        for u in ((u0,u1) if u1 is not None else (u0,)):
            require(dominates_source(ordinates(fresh,x,y,u),old_candidates),
                    f"source comparison at energy {u} on {x}..{y}")
        if u1 is None:
            require(all(jet[2] <= 0 for jet in fresh), "curvature on infinite energy ray")
    return len(edges)-1


def main():
    rows=json.loads((HERE / "barriers.json").read_text())
    require(len(rows) == len(EDGES), "row count")
    sources=load_source()
    for i,row in enumerate(rows):
        cells=check_row(row,i,sources)
        print(f"{row['lo']} .. {row['hi'] or 'infinity'}: gamma <= {row['gamma']}, {cells} cells",flush=True)
    for key,value in [("hi",".052"),("beta","0"),("derivatives",rows[0]["derivatives"][:-1]+[-1])]:
        changed=dict(rows[0]); changed[key]=value
        try:
            check_row(changed,0,sources)
        except ValueError:
            continue
        raise RuntimeError(f"corruption accepted: {key}")
    print("Three corrupted witnesses rejected.")


if __name__ == "__main__":
    main()

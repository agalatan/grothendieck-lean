"""Exact central excess-window replay. Agent-ID: codex-a7c4.

Run with python3 -IB verify.py [repository-root].
"""
import copy
import hashlib
import importlib.util
import json
import sys
from fractions import Fraction as Q
from functools import lru_cache
from math import isqrt
from pathlib import Path

HERE = Path(__file__).resolve().parent
ENERGY = (Q(".0354"), Q(".0456"))
SHAPE = (Q(".0784"), Q(3))
RHO = Q(".5053")
DEN = 1 + RHO**2
TOTAL = Q(".080051")
BETA = Q(7, 25)
ALPHA = Q(6, 10**6)
C6 = Q(4045313, 100000)
INPUT_HASHES = {
    "code/raw-content-2026-11-17-gemini-5331/verify_raw_content.py":
        "ab237e8081dce81cecc82240690f6b5d41f46ebebf725acf75615645d76c20c0",
    "code/audit-2026-11-15-codex-a7c4/remote_stein_original/profile-caps.json":
        "01c2e2a7b4af452ce8729ec47cb0cd2c3aa7e1368c6b58336270c2a19b349514",
    "sources/received-2026-11-15-tilted-sector/deficit_dual_profile_caps.json":
        "3b176de011c935fa38bd03601a064bd37c8d730961914315326092b9858b24ff",
}


def check(ok, message):
    if not ok:
        raise ArithmeticError(message)


def read_public_inputs(repo):
    root = repo / "research/conjecture-K"
    for path, digest in INPUT_HASHES.items():
        check(hashlib.sha256((root/path).read_bytes()).hexdigest() == digest, "changed public input")
    raw_path, cap_path, ext_path = INPUT_HASHES
    spec = importlib.util.spec_from_file_location("raw", root/raw_path)
    raw = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(raw)
    src = json.loads((root/cap_path).read_bytes())
    ext = json.loads((root/ext_path).read_bytes())
    caps = [(Q(row["interval"][0]), Q(row["interval"][1]), list(map(Q, row["coefficients"])))
            for row in src["cells"] + ext["cells"]]
    check(len(caps) == 78 and caps[0][0] == 0 and caps[-1][1] == 64, "radial domain")
    check(all(a < b and len(p) == 4 for a, b, p in caps), "radial cell")
    check(all(cap[1] == nxt[0] for cap, nxt in zip(caps, caps[1:])), "radial gap")
    caps.append((Q(64), None, list(map(Q, ext["tail"]))))
    a, b = Q(699, 1250), Q(179, 1250)
    moments, rice = raw.compute_deficit_moments_and_rice_poly(
        a, b, raw.single_pole_integrals(a, b, n=26), raw.single_pole_integrals(a, 3*b, n=26))
    check(len(rice) == 9, "Rice degree")
    # V''(0) is negative, |V''(s)|<=-V''(0) from complete monotonicity.
    check(-moments[2].lo < Q(1673, 1000), "interpolation curvature")
    return raw, caps, rice


def load_nodes(packed, raw, caps):
    knots = list(map(Q, packed["knots"]))
    out = {}
    for label, row in packed["models"].items():
        check(0 < Q(row["v"]) <= Q(".0463"), "dual energy outside peak band")
        check(raw.check_stein_node(row, knots, caps), "global Stein inequality")
        k = int(label)
        check(str(k) == label and k not in out, "duplicate node")
        out[k] = (Q(row["v"]), list(map(Q, row["coefficients"])))
    return out


def sqrt_upper(x):
    den = 10**9
    num = isqrt(x.numerator * den**2 // x.denominator)
    if num**2 * x.denominator < x.numerator * den**2:
        num += 1
    return Q(num, den)


def cover_intervals(intervals, lo, hi):
    endpoint = lo
    for l, h in sorted(intervals):
        check(endpoint == l and l < h <= hi, "gap or overlap")
        endpoint = h
    check(endpoint == hi, "missing endpoint")


def shell_price(u0, u1, x1, v0, v1, deficit, mu, eta):
    k = 2*(min(u1+v1, TOTAL)-Q(".0463"))
    a, b = Q(".31")-k/DEN+mu, Q(".08")-k/DEN+mu
    check(min(a, b, eta) > 0, "invalid square completion")
    error_sq = Q(".0035")**2 * u1
    limit = min(Q(1, 2500), Q(".0355") * u1**2 * x1)
    slope = (1+eta)/a
    constant = error_sq * ((1+1/eta)*(RHO/DEN)**2/a + 1/(DEN**2*b))
    constant += mu*DEN*(v1 if mu >= 0 else v0)
    hinge = min(limit, BETA*deficit+ALPHA)
    peak = max(slope*hinge-deficit, slope*limit-max(deficit, (limit-ALPHA)/BETA))
    sigma = Q(27, 25) * max(Q(".0403448")-u1, u0-Q(".0403449"), 0)**2
    return peak + constant - sigma


def verify(data, nodes, rice):
    boxes, radial, shell = [], [], []
    used = set()

    @lru_cache(None)
    def node_value(i, shape):
        u, p = nodes[i]
        benchmark = sum(c*u**j for j, c in enumerate(rice))
        return benchmark-p[0]-p[1]-p[2]*(2+shape)-p[3]*(6+9*shape+C6*shape*sqrt_upper(shape))

    for row, ids, cells in data:
        u0, u1, x0, x1, deficit = map(Q, row)
        check(ENERGY[0] <= u0 < u1 <= ENERGY[1] and SHAPE[0] <= x0 < x1 <= SHAPE[1],
              "invalid window")
        check(deficit > 0, "positive deficit threshold required")
        boxes.append((u0,u1,x0,x1))
        i, j = ids
        check(all(type(k) is int and k in nodes for k in ids), "unknown dual")
        used.update(ids)
        a, b = nodes[i][0], nodes[j][0]
        check(a <= u0 < u1 <= b, "energy bracket")
        dl = min(node_value(i, x) for x in (x0,x1))
        dr = min(node_value(j, x) for x in (x0,x1))
        chord = min(((b-u)*dl+(u-a)*dr)/(b-a) for u in (u0,u1))
        z = min(u1, max(u0,(a+b)/2))
        loss = Q(1673,1000)*(2+x1)*(z-a)*(b-z)/2
        radial.append(chord-loss-deficit)
        check(radial[-1] > 0, "insufficient deficit")
        sectors = [(Q(v[0]),Q(v[1])) for v in cells]
        cover_intervals(sectors, 0, TOTAL-u0)
        for cell in cells:
            v0,v1,mu,eta=map(Q,cell)
            price=shell_price(u0,u1,x1,v0,v1,deficit,mu,eta)
            shell.append(-price)
            check(price<0,"insufficient shell reserve")
    bounds = sorted(set(ENERGY) | {v for u0,u1,_,_ in boxes for v in (u0,u1)})
    for lo,hi in zip(bounds,bounds[1:]):
        cover_intervals([(x,y) for a,b,x,y in boxes if a<=lo<hi<=b],*SHAPE)
    check(used == set(nodes), "unused dual")
    radial_floor, shell_floor = min(radial), min(shell)
    check(radial_floor > Q(1, 10**10), "claimed radial clearance")
    check(shell_floor > Q(1, 10**8), "claimed shell clearance")
    return radial_floor, shell_floor


def main():
    if not __debug__:
        raise RuntimeError("enable assertions for the upstream Rice code")
    repo = Path(sys.argv[1]).resolve() if len(sys.argv)>1 else HERE.parents[3]
    raw,caps,rice = read_public_inputs(repo)
    duals = json.loads((HERE/"duals.json").read_bytes())
    data = json.loads((HERE/"cover.json").read_bytes())
    nodes = load_nodes(duals,raw,caps)
    radial,shell=verify(data,nodes,rice)
    unit=10**15
    print(f"{len(nodes)} whole-half-line duals; {len(data)} (u,χ) tiles; "
          f"{sum(len(r[2]) for r in data)} V cells.")
    print(f"Radial threshold clearance > {int(radial*unit)}/10^15; "
          f"retained peak clearance > {int(shell*unit)}/10^15.")

    def reject(mutate,reason):
        broken = copy.deepcopy(data)
        mutate(broken)
        try:
            verify(broken,nodes,rice)
        except ArithmeticError as exc:
            check(str(exc)==reason,f"unexpected rejection: {exc}")
        else:
            raise ArithmeticError("corruption accepted")
    reject(lambda d: d.pop(), "missing endpoint")
    reject(lambda d: d[0][1].reverse(), "energy bracket")
    reject(lambda d: d[0][0].__setitem__(4, "1"), "insufficient deficit")
    reject(lambda d: d[0][2].pop(), "missing endpoint")
    reject(lambda d: d[0][2][0].__setitem__(2, "-1"), "invalid square completion")
    reject(lambda d: d[0][2][0].__setitem__(3, "100"), "insufficient shell reserve")
    # This raises one D0 by 10^-11, leaving the local radial floor positive
    # but below the >10^-10 clearance in the statement.
    reject(lambda d: d[22][0].__setitem__(4, "33108291/100000000000"),
           "claimed radial clearance")

    def reject_node(mutate, reason):
        bad = copy.deepcopy(duals)
        mutate(bad["models"]["65"])
        try:
            load_nodes(bad,raw,caps)
        except ArithmeticError as exc:
            check(str(exc)==reason,"unexpected global rejection")
        else:
            raise ArithmeticError("corrupt Stein model accepted")

    reject_node(lambda row: row["coefficients"].__setitem__(0, "0"), "global Stein inequality")
    reject_node(lambda row: row.__setitem__("v", "-1"), "dual energy outside peak band")
    reject_node(lambda row: row.__setitem__("v", ".04631"), "dual energy outside peak band")
    print("Ten corrupted certificates rejected.")


if __name__ == "__main__":
    main()

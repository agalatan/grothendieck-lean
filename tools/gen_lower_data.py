#!/usr/bin/env python3
"""Generate the lower-bound certificate data modules (exact rationals only):

  Grothe/Lower/SourceData.lean     the nine source profiles (nodes, global polynomials with chord
                                   certificates, moment covers) and the dense node tables
  Grothe/Lower/AveragedData{1,2}.lean  the averaged profiles (two shifted sources, node provenance,
                                   global polynomials, moment covers)
  Grothe/Lower/JoinData.lean       the pointwise joins and the shared-moment joins
  Grothe/Lower/RowData.lean        the support rows (profile, dilation, cap, gates after dilation),
                                   the fixed mixtures and the scalar cover

Every exact identity and inequality that Lean re-checks is asserted here first with the same
semantics (Bernstein maxima at both `x` endpoints, chord domination, sweep covers, LDL gates).
Inputs: the research archives under `handoff/` (see `INPUTS` below).
"""
import hashlib
import json
import os
from fractions import Fraction as Q
from math import comb
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
H = ROOT / "handoff"
V4 = H / "lower-v4"
EXT = V4 / "extension-1401"
INPUTS = {
    "sources": H / "data" / "lower-source-profiles.json",
    "source_extra": H / "lower-import" / "combined-polynomials.json",
    "source_cover": H / "lower" / "base" / "certificates" / "moment-cover.json",
    "dense": H / "lower-price-family" / "dense-source-nodes.json",
    "coupled": H / "lower-import" / "coupled-profiles.json",
    "pw_1_2": H / "next-lower-received" / "pointwise-1_2.json",
    "dense_13_16": H / "lower-price-family" / "profiles" / "dense-13_16.json",
    "claims": EXT / "CLAIMS.json",
    "envelope": EXT / "data" / "envelope.json",
}

def profile_path(name):
    """A profile file of the archive (the extension directory holds the newest profiles)."""
    for d in (EXT / "data" / "profiles", V4 / "data" / "profiles"):
        if (d / name).exists(): return d / name
    raise FileNotFoundError(name)
EPS0 = Q(37, 50)
EPS = Q(7400323787, 10**10)
RHO = Q(19476417, 20000000)
C6 = Q(81641, 2000)
LIFT = Q(1, 10**8)
XMAX = Q(31, 4)
SCALE_EPS = EPS / EPS0
FAST = os.environ.get("FAST") == "1"   # skip the Bernstein replays while iterating on the data layout

# ----------------------------------------------------------------- helpers
def qs(x) -> str:
    x = Q(x)
    return f"{x.numerator}/{x.denominator}" if x.denominator != 1 else f"{x.numerator}"

def q(x) -> str:
    x = Q(x)
    return f"({x.numerator} : ℚ) / {x.denominator}" if x.denominator != 1 else f"({x.numerator} : ℚ)"

def sym3(M):
    M = [[Q(v) for v in row] for row in M]
    assert all(M[i][j] == M[j][i] for i in range(3) for j in range(3))
    return (M[0][0], M[0][1], M[0][2], M[1][1], M[1][2], M[2][2])

def sym2(M):
    M = [[Q(v) for v in row] for row in M]
    assert M[0][1] == M[1][0]
    return (M[0][0], M[0][1], M[1][1])

def avg(w, A, B): return tuple(w * a + (1 - w) * b for a, b in zip(A, B))
def scl(E, r): return tuple(r * v for v in E)

def ldl3(m, strict):
    m11, m12, m13, m22, m23, m33 = m
    d1 = m11
    assert d1 > 0 if strict else d1 >= 0, (m, strict)
    if d1 == 0:
        assert m12 == 0 and m13 == 0; l21 = l31 = Q(0)
    else:
        l21, l31 = m12 / d1, m13 / d1
    d2 = m22 - d1 * l21 * l21
    assert d2 > 0 if strict else d2 >= 0, (m, strict)
    r = m23 - d1 * l21 * l31
    if d2 == 0:
        assert r == 0; l32 = Q(0)
    else:
        l32 = r / d2
    d3 = m33 - d1 * l31 * l31 - d2 * l32 * l32
    assert d3 > 0 if strict else d3 >= 0, (m, strict)
    assert (d1, d1*l21, d1*l31, d1*l21*l21 + d2, d1*l21*l31 + d2*l32, d1*l31*l31 + d2*l32*l32 + d3) == m
    return (d1, d2, d3, l21, l31, l32)

def ldl2(m, strict):
    m11, m12, m22 = m
    d1 = m11
    assert d1 > 0 if strict else d1 >= 0, (m, strict)
    if d1 == 0:
        assert m12 == 0; l21 = Q(0)
    else:
        l21 = m12 / d1
    d2 = m22 - d1 * l21 * l21
    assert d2 > 0 if strict else d2 >= 0, (m, strict)
    assert (d1, d1*l21, d1*l21*l21 + d2) == m
    return (d1, d2, l21)

def gates(E, R, delta, eps):
    assert 0 < delta < eps
    return (ldl3(E, True),
            ldl3((E[0] + 1, E[1], E[2], E[3] - eps, E[4], E[5] - eps), False),
            ldl3((E[0] - (eps - delta), E[1], E[2], E[3], E[4], E[5]), False),
            ldl2(R, True),
            ldl2((R[0] + 1, R[1], R[2] - eps), False),
            ldl2((R[0] - eps, R[1], R[2]), False))

def fmt_ldl(c): return "⟨" + ", ".join(q(v) for v in c) + "⟩"
def fmt_gates(g): return "⟨" + ", ".join(fmt_ldl(x) for x in g) + "⟩"
def fmt_sym(E): return "⟨" + ", ".join(q(v) for v in E) + "⟩"

def bernstein(p, lo, hi):
    assert lo < hi
    n = len(p) - 1
    power = [Q(0)] * (n + 1)
    for j, a in enumerate(p):
        for k in range(j + 1):
            power[k] += a * comb(j, k) * lo ** (j - k) * (hi - lo) ** k
    return [sum((power[j] * Q(comb(k, j), comb(n, j)) for j in range(k + 1)), Q(0)) for k in range(n + 1)]

def shift(p, lo):
    out = [Q(0)] * len(p)
    for j, a in enumerate(p):
        for k in range(j + 1):
            out[k] += a * comb(j, k) * lo ** (j - k)
    return out

def poly_valid(p):
    assert len(p) == 7 and p[3] == 0 and p[5] == 0 and p[1] >= 0 and p[6] >= 0, p

def moment_coeffs(p, delta, x):
    return [p[0], RHO * p[1], p[2] - 1 / delta, Q(0), p[4] * (2 + x * x), Q(0), p[6] * (6 + 9 * x * x + C6 * x ** 3)]

def moment_upper(p, delta, box):
    lo, hi, xlo, xhi = box
    return max(max(bernstein(moment_coeffs(p, delta, x), lo, hi)) for x in (xlo, xhi))

def check_cover(boxes, end):
    """Sweep cover of [0, end] × [0, XMAX] (the Lean `coversRect` semantics); returns the edges."""
    edges = sorted({Q(0), end} | {b[0] for b in boxes} | {b[1] for b in boxes})
    assert edges[0] == 0 and edges[-1] == end
    for a, b in zip(edges, edges[1:]):
        act = sorted((bx[2], bx[3]) for bx in boxes if bx[0] <= a and b <= bx[1])
        reach = Q(0)
        while reach < XMAX:
            nxt = [h for (l, h) in act if l <= reach < h]
            assert nxt, (a, b, reach)
            reach = max(nxt)
    return edges

def clip_boxes(boxes, end):
    out = []
    for (lo, hi, xlo, xhi, *rest) in boxes:
        if lo >= end: continue
        out.append((lo, min(hi, end), xlo, xhi, *rest))
    return out

def supports(nodes):
    sup = []
    for (x, a), (y, b) in zip(nodes, nodes[1:]):
        s = (b - a) / (y - x); sup.append((a - s * x, s, x, y))
    x, a = nodes[-1]; sup.append((a - 2 * x, Q(2), x, None))
    return sup

def check_chords(nodes, p, cells, tail):
    """`p` dominates the chord supports of `nodes` on every cell and the tail (Lean `checkPhysical`)."""
    sup = supports(nodes); prev = Q(0)
    assert tail == nodes[-1][0] and tail >= 0
    for hi, idx in cells:
        c0, c1, left, right = sup[idx]
        assert prev < hi <= tail and left <= prev and (right is None or hi <= right)
        gap = p.copy(); gap[0] -= c0; gap[1] -= c1
        assert FAST or min(bernstein(gap, prev, hi)) >= 0, (prev, hi, idx)
        prev = hi
    assert prev == tail
    c0, c1, left, right = sup[-1]
    assert right is None and left <= tail
    gap = p.copy(); gap[0] -= c0; gap[1] -= c1
    assert min(shift(gap, tail)) >= 0

def chord_value(nodes, s, j):
    """Value of the active support `j` of `nodes` at `s` (Lean: `Support.val` with `Active`)."""
    sup = supports(nodes); c0, c1, left, right = sup[j]
    assert left <= s and (right is None or s <= right)
    return c0 + c1 * s

def dyadic_box(root, path):
    ulo, uhi, xlo, xhi = root
    for depth, d in enumerate(path):
        if depth % 2 == 0:
            m = (ulo + uhi) / 2
            if d == '1': ulo = m
            else: uhi = m
        else:
            m = (xlo + xhi) / 2
            if d == '1': xlo = m
            else: xhi = m
    return (ulo, uhi, xlo, xhi)

# ----------------------------------------------------------------- profiles
class Profile:
    def __init__(self, **kw): self.__dict__.update(kw)

profiles = []
by_name = {}

def add(p):
    p.index = len(profiles); profiles.append(p); by_name[p.name] = p.index; return p

def finish_cover(name, polys, delta, cap, boxes):
    boxes = clip_boxes(boxes, delta * RHO)
    for bx in boxes:
        assert 0 <= bx[0] < bx[1] and 0 <= bx[2] < bx[3] <= XMAX and bx[4] < len(polys), (name, bx)
        assert FAST or moment_upper(polys[bx[4]], delta, bx[:4]) <= cap, (name, bx)
    return boxes, check_cover(boxes, delta * RHO)

# --- sources
src = json.load(open(INPUTS["sources"]))["groups"]
extra = json.load(open(INPUTS["source_extra"]))
cover = json.load(open(INPUTS["source_cover"]))
assert len(src) == 9 and len(cover["groups"]) == 9
for g, cg in zip(src, cover["groups"]):
    p = g["profile"]; assert p["id"] == cg["id"] and Q(p["epsilon"]) == EPS0 and p["M_R"] == p["M_I"]
    ell, beta, delta = Q(p["ell"]), Q(p["beta"]), Q(p["delta"])
    E, R = sym3(p["M_E"]), sym2(p["M_R"])
    nodes = [(Q(n["r"]), Q(n["cap"])) for n in g["points"]]
    assert nodes[0][0] == 0 and all(a[0] < b[0] for a, b in zip(nodes, nodes[1:]))
    recs = g["polynomials"] + extra.get(p["id"], [])
    polys, cellsets, certs = [], [], []
    for rec in recs:
        pl = [Q(c) for c in rec["coefficients"]]; poly_valid(pl)
        ph = rec["physical"]; tail = Q(ph["tail_start"]); assert ph["tail_index"] == len(nodes) - 1
        prev = Q(0); cells = []
        for lo, hi, idx in ph["cells"]:
            assert Q(lo) == prev; prev = Q(hi); cells.append((Q(hi), idx))
        check_chords(nodes, pl, cells, tail)
        s = ";".join(f"{qs(h)}:{i}" for h, i in cells)
        if s not in cellsets: cellsets.append(s)
        polys.append(pl); certs.append(cellsets.index(s))
    cap = Q(cg["cap"]); assert Q(cg["lift"]) == LIFT
    boxes, edges = finish_cover(p["id"], polys, delta, cap, [(*map(Q, r["box"]), r["polynomial"]) for r in cg["rectangles"]])
    assert 0 <= beta and 2 * beta <= ell
    add(Profile(name=p["id"], kind=0, i=0, j=0, w=Q(0), dei=Q(0), dbi=Q(0), dej=Q(0), dbj=Q(0),
                ell=ell, beta=beta, delta=delta, E=E, R=R, gain=Q(0), cap=cap, nodeKind=0,
                nodes=nodes, nodeSrc=[], cellsets=cellsets, polys=polys, certs=certs, pairs=[],
                boxes=boxes, edges=edges, gates=gates(E, R, delta, EPS0)))

# --- dense node tables (lifted) of the sources 7 and 8
dense = json.load(open(INPUTS["dense"]))
dense_tab = {}
for rec in dense:
    pts = [(Q(n["r"]), Q(n["cap"]) + LIFT) for n in rec["points"]]
    assert pts[0][0] == 0 and all(a[0] < b[0] for a, b in zip(pts, pts[1:]))
    dense_tab[rec["index"]] = pts
assert set(dense_tab) == {7, 8}

def averaged(name, g, c, node_kind):
    """An averaged profile of two shifted sources (kind 1)."""
    i, j = g["indices"]; w = Q(g["weight"]); assert 0 < w < 1 and i != j
    pi, pj = profiles[i], profiles[j]; assert pi.kind == 0 and pj.kind == 0
    de, db = (Q(g.get("de", 0)), Q(g.get("db", 0)))
    shifts = [[Q(v) for v in row] for row in g.get("source_shifts", [[de, db], [de, db]])]
    if node_kind != 2:
        assert de == 0 and db == 0
    assert de == w * shifts[0][0] + (1 - w) * shifts[1][0] and db == w * shifts[0][1] + (1 - w) * shifts[1][1]
    for side, (de_s, db_s) in zip((pi, pj), shifts):
        assert 0 <= side.beta + db_s and 2 * (side.beta + db_s) <= side.ell + de_s
    p = g["profile"]; assert Q(p["epsilon"]) == EPS0 and p["M_R"] == p["M_I"]
    ell = w * pi.ell + (1 - w) * pj.ell + de
    beta = w * pi.beta + (1 - w) * pj.beta + db
    assert Q(p["ell"]) == ell and Q(p["beta"]) == beta
    E, R = avg(w, pi.E, pj.E), avg(w, pi.R, pj.R)
    assert sym3(p["M_E"]) == E and sym2(p["M_R"]) == R
    delta = Q(p["delta"])
    gain = 2 * w * (1 - w) * (pi.beta + shifts[0][1] - pj.beta - shifts[1][1]) ** 2 / EPS0
    assert Q(g["variance_gain"]) == gain
    tables = None if node_kind == 2 else ((pi.nodes, pj.nodes) if node_kind == 0 else (dense_tab[i], dense_tab[j]))
    nodes, prov = [], []
    for n in g["points"]:
        a, b = n["source_nodes"]
        if node_kind == 2:
            assert a["source_index"] == i and b["source_index"] == j
            ra, ca, rb, cb = Q(a["r"]), Q(a["cap"]), Q(b["r"]), Q(b["cap"])
            assert ca >= Q(a["raw_upper"]) and cb >= Q(b["raw_upper"])
            prov.append(f"{qs(ra)}:{qs(ca)}:{qs(rb)}:{qs(cb)}")
        else:
            (ra, ca), (rb, cb) = tables[0][a], tables[1][b]
            prov.append(f"{a}:{b}")
        r = w * ra + (1 - w) * rb; cap = w * ca + (1 - w) * cb - gain
        assert r == Q(n["r"]), (name, n)
        # the archive lifts the source node tables by 10⁻⁸; the raw-table nodes are lower
        assert cap + (LIFT if node_kind == 0 else 0) == Q(n["cap"]), (name, n)
        nodes.append((r, cap))
    assert nodes[0][0] == 0 and all(a[0] < b[0] for a, b in zip(nodes, nodes[1:]))
    tail = Q(g["tail_start"]); assert tail == nodes[-1][0]
    cells = []; prev = Q(0)
    for lo, hi, idx in g["physical_cells"]:
        assert Q(lo) == prev; prev = Q(hi); cells.append((Q(hi), idx))
    polys = [[Q(x) for x in pl["coefficients"]] for pl in g["polynomials"]]
    for pl in polys:
        poly_valid(pl); check_chords(nodes, pl, cells, tail)
    cap = Q(c["C_cap"])
    assert c["id"] == p["id"] and Q(c["ell"]) == ell and Q(c["delta"]) == delta
    for bx in c["boxes"]: assert bx.get("contacts") is None
    boxes, edges = finish_cover(name, polys, delta, cap, [(*map(Q, bx["box"]), bx["polynomial"]) for bx in c["boxes"]])
    assert 0 <= beta and 2 * beta <= ell
    return Profile(name=name, kind=1, i=i, j=j, w=w, dei=shifts[0][0], dbi=shifts[0][1], dej=shifts[1][0],
                   dbj=shifts[1][1], ell=ell, beta=beta, delta=delta, E=E, R=R, gain=gain, cap=cap,
                   nodeKind=node_kind, nodes=nodes, nodeSrc=prov,
                   cellsets=[";".join(f"{qs(h)}:{k}" for h, k in cells)], polys=polys,
                   certs=[0] * len(polys), pairs=[], boxes=boxes, edges=edges,
                   gates=gates(E, R, delta, EPS0))

def load_pair(path):
    return json.load(open(path)), json.load(open(path.with_suffix(".cap.json")))

g, c = load_pair(INPUTS["pw_1_2"])
assert Q(g["lift"]) == LIFT
add(averaged("avg-1_2", g, c, 0))
g, c = load_pair(INPUTS["dense_13_16"])
assert Q(g["lift"]) == LIFT and g["extended_source_points"] == [rec["points"] for rec in dense]
add(averaged("dense-13_16", g, c, 1))

claims = json.load(open(INPUTS["claims"]))
assert Q(claims["C6"]) == C6 and Q(claims["rho"]) == RHO and Q(claims["epsilon"]) == EPS
sha_to_name = {}
for n in claims["profiles"]:
    sha_to_name[hashlib.sha256(profile_path(n).read_bytes()).hexdigest()] = n[:-5]
    assert claims["physical_sha256"][n] in sha_to_name
for fname in claims["profiles"]:
    if fname in claims["pointwise_profiles"]: continue
    g, c = load_pair(profile_path(fname))
    assert Q(c["C6"]) == C6 and Q(c["rho"]) == RHO
    if isinstance(g["points"][0]["source_nodes"][0], int):
        assert Q(g["lift"]) == LIFT and g["extended_source_points"] == [rec["points"] for rec in dense]
        add(averaged(fname[:-5], g, c, 1))
    else:
        assert Q(g["node_reserve"]) == LIFT and not g.get("conditional_moments")
        add(averaged(fname[:-5], g, c, 2))

# --- pointwise joins
for fname in claims["pointwise_profiles"]:
    g, c = load_pair(profile_path(fname))
    assert g["schema"] == "pointwise_joint_physical/v1" and Q(c["C6"]) == C6 and Q(c["rho"]) == RHO
    i, j = (by_name[sha_to_name[r["sha256"]]] for r in g["parents"]); pi, pj = profiles[i], profiles[j]
    assert pi.kind == 1 and pj.kind == 1 and i != j
    w = Q(g["weight"]); assert 0 < w < 1
    p = g["profile"]; assert Q(p["epsilon"]) == EPS0 and p["M_R"] == p["M_I"]
    ell = w * pi.ell + (1 - w) * pj.ell; beta = w * pi.beta + (1 - w) * pj.beta
    assert Q(p["ell"]) == ell and Q(p["beta"]) == beta
    E, R = avg(w, pi.E, pj.E), avg(w, pi.R, pj.R)
    assert sym3(p["M_E"]) == E and sym2(p["M_R"]) == R
    delta = Q(p["delta"]); gain = 2 * w * (1 - w) * (pi.beta - pj.beta) ** 2 / EPS0
    assert Q(g["variance_gain"]) == gain
    nodes, prov = [], []
    for n in g["points"]:
        s1, s2 = map(Q, n["parent_arguments"]); ja, jb = n["parent_node_indices"]
        assert s1 >= 0 and s2 >= 0 and w * s1 + (1 - w) * s2 == Q(n["r"])
        val = w * chord_value(pi.nodes, s1, ja) + (1 - w) * chord_value(pj.nodes, s2, jb) - gain
        assert Q(n["cap"]) >= val
        nodes.append((Q(n["r"]), Q(n["cap"]))); prov.append(f"{qs(s1)}:{qs(s2)}:{ja}:{jb}")
    assert nodes[0][0] == 0 and all(a[0] < b[0] for a, b in zip(nodes, nodes[1:]))
    tail = Q(g["tail_start"]); assert tail == nodes[-1][0]
    cells = []; prev = Q(0)
    for lo, hi, idx in g["physical_cells"]:
        assert Q(lo) == prev; prev = Q(hi); cells.append((Q(hi), idx))
    polys = [[Q(x) for x in pl["coefficients"]] for pl in g["polynomials"]]
    for pl in polys:
        poly_valid(pl); check_chords(nodes, pl, cells, tail)
    cap = Q(c["C_cap"]); assert c["id"] == p["id"] and Q(c["ell"]) == ell and Q(c["delta"]) == delta
    for bx in c["boxes"]: assert bx.get("contacts") is None
    boxes, edges = finish_cover(fname, polys, delta, cap, [(*map(Q, bx["box"]), bx["polynomial"]) for bx in c["boxes"]])
    assert 0 <= beta and 2 * beta <= ell
    add(Profile(name=fname[:-5], kind=2, i=i, j=j, w=w, dei=Q(0), dbi=Q(0), dej=Q(0), dbj=Q(0), ell=ell,
                beta=beta, delta=delta, E=E, R=R, gain=gain, cap=cap, nodeKind=0, nodes=nodes,
                nodeSrc=prov, cellsets=[";".join(f"{qs(h)}:{k}" for h, k in cells)], polys=polys,
                certs=[0] * len(polys), pairs=[], boxes=boxes, edges=edges,
                gates=gates(E, R, delta, EPS0)))

# --- shared-moment joins
def joint_poly(w, p1, p2, a, b, gain):
    z = [w * p1[k] * a ** k + (1 - w) * p2[k] * b ** k for k in range(7)]
    z[0] -= gain
    assert z[3] == 0 and z[5] == 0 and z[1] >= 0 and z[6] >= 0
    return z

def add_joint(name, i, j, w, delta, gain, cap, ell, beta, E, R, raw_boxes):
    """raw_boxes: (lo, hi, xlo, xhi, ki, kj, a, b) in σ-coordinates, before clipping."""
    pi, pj = profiles[i], profiles[j]
    assert 0 < w < 1 and i != j and pi.kind != 3 and pj.kind != 3
    assert ell == w * pi.ell + (1 - w) * pj.ell and beta == w * pi.beta + (1 - w) * pj.beta
    assert E == avg(w, pi.E, pj.E) and R == avg(w, pi.R, pj.R)
    assert gain == 2 * w * (1 - w) * (pi.beta - pj.beta) ** 2 / EPS0
    pairs, polys, boxes = [], [], []
    for bx in raw_boxes:
        lo, hi, xlo, xhi, ki, kj, a, b = bx
        assert a >= 0 and b >= 0 and w * a + (1 - w) * b == 1
        assert ki < len(pi.polys) and kj < len(pj.polys)
        key = (ki, kj, a, b)
        if key not in pairs:
            pairs.append(key); polys.append(joint_poly(w, pi.polys[ki], pj.polys[kj], a, b, gain))
        boxes.append((lo, hi, xlo, xhi, pairs.index(key)))
    boxes, edges = finish_cover(name, polys, delta, cap, boxes)
    assert 0 <= beta and 2 * beta <= ell
    add(Profile(name=name, kind=3, i=i, j=j, w=w, dei=Q(0), dbi=Q(0), dej=Q(0), dbj=Q(0), ell=ell, beta=beta,
                delta=delta, E=E, R=R, gain=gain, cap=cap, nodeKind=0, nodes=[], nodeSrc=[], cellsets=[],
                polys=[], certs=[], pairs=pairs, boxes=boxes, edges=edges, gates=gates(E, R, delta, EPS0)))

env = json.load(open(INPUTS["envelope"]))
assert Q(env["epsilon"]) == EPS and Q(env["C6"]) == C6 and Q(env["rho"]) == RHO
received = {(Q(r["ell"]), Q(r["beta"])): r["id"] for r in env["profiles"] if r.get("origin") == "received"}
coupled = json.load(open(INPUTS["coupled"]))
COUPLED_RHO = Q(977459, 10**6)   # the root rectangle of the dyadic leaves of the coupled archive
for r in coupled:
    key = (Q(r["ell"]), Q(r["beta"]))
    if key not in received: continue
    i, j = r["indices"]; pi, pj = profiles[i], profiles[j]; w = Q(r["weight"])
    d = w * pi.delta + (1 - w) * pj.delta
    scales = tuple(map(Q, r.get("argument_scales", [str(pi.delta), str(pj.delta)])))
    assert w * scales[0] + (1 - w) * scales[1] == d
    dprime = Q(r["delta"]); assert 0 < dprime <= d
    raw = []
    for leaf in r["leaves"]:
        ulo, uhi, xlo, xhi = dyadic_box((Q(0), COUPLED_RHO, Q(0), XMAX), leaf["path"])
        l1, l2 = map(Q, leaf.get("argument_scales", scales))
        assert w * l1 + (1 - w) * l2 == d
        raw.append((d * ulo, d * uhi, xlo, xhi, leaf["polynomials"][0], leaf["polynomials"][1], l1 / d, l2 / d))
    add_joint(f"joint-{pi.name}-{pj.name}-{qs(w).replace('/', '_')}", i, j, w, dprime, Q(r["gain"]), Q(r["cap"]),
              Q(r["ell"]), Q(r["beta"]), avg(w, pi.E, pj.E), avg(w, pi.R, pj.R), raw)

for fname in claims["joint_profiles"]:
    g = json.load(open(V4 / "data" / "joint" / fname))
    assert g["schema"] == "grothendieck_joint_physical_polynomial_pairs/v1"
    assert Q(g["C6"]) == C6 and Q(g["rho"]) == RHO and not g.get("polynomial_pairs")
    i, j = (by_name[sha_to_name[r["sha256"]]] for r in g["parents"])
    w = Q(g["weight"]); a, b = map(Q, g["argument_scales"])
    p = g["profile"]; assert Q(p["epsilon"]) == EPS0 and p["M_R"] == p["M_I"]
    raw = []
    for bx in g["boxes"]:
        assert bx["contacts"] is None
        lo, hi, xlo, xhi = map(Q, bx["box"]); ki, kj = bx["polynomials"]
        raw.append((lo, hi, xlo, xhi, ki, kj, a, b))
    add_joint(fname[:-5], i, j, w, Q(p["delta"]), Q(g["variance_gain"]), Q(g["C_cap"]), Q(p["ell"]), Q(p["beta"]),
              sym3(p["M_E"]), sym2(p["M_R"]), raw)

# ----------------------------------------------------------------- rows
def transfer(cap, beta, ea, eb): return cap + (eb - ea) * RHO ** 2 + 2 * beta ** 2 * (1 / eb - 1 / ea)

by_lb = {}
for p in profiles: by_lb.setdefault((p.ell, p.beta), []).append(p.index)
rows = []
for row in env["profiles"]:
    ell, beta, C = Q(row["ell"]), Q(row["beta"]), Q(row["C"]); assert Q(row["q2"]) == 1
    if row.get("origin") == "received":
        if ell == 0 and beta == 0:
            assert C >= EPS * RHO ** 2
            rows.append(dict(crude=True, prof=0, scale=Q(1), ell=ell, beta=beta, C=C, gates=None)); continue
        cands = by_lb.get((ell, beta), [])
        if cands:
            scale = Q(1)
        else:
            scale = SCALE_EPS; cands = by_lb.get((ell / scale, beta / scale), [])
        assert len(cands) == 1, (row["id"], cands)
        k = cands[0]
    else:
        scale = Q(row["scale"]); k = by_name[row["reference"][:-5]]
    p = profiles[k]
    assert 1 <= scale and scale * EPS0 <= EPS
    assert ell == scale * p.ell and beta == scale * p.beta
    exact = transfer(scale * p.cap, beta, scale * EPS0, EPS)
    assert 0 <= C - exact < Q(1, 10**6), (row["id"], C - exact)
    rows.append(dict(crude=False, prof=k, scale=scale, ell=ell, beta=beta, C=C,
                     gates=gates(scl(p.E, scale), scl(p.R, scale), scale * p.delta, scale * EPS0)))
NROWS = len(rows)
assert sum(r["crude"] for r in rows) == 1
used = {r["prof"] for r in rows if not r["crude"]}
for p in profiles:
    assert p.index in used or any(x.i == p.index or x.j == p.index for x in profiles), p.name

def quad_max(c0, c1, c2, lo, hi):
    f = lambda t: c0 + c1 * t + c2 * t * t
    e = max(f(lo), f(hi))
    if c2 < 0:
        v = -c1 / (2 * c2)
        if lo <= v <= hi: e = max(e, f(v))
    return e

B = Q(claims["norm_cap"]); L = Q(claims["lower_strict"])
assert B == Q(2855097757, 4000000000) and L == Q(7005014084, 5000000000)
assert 1 - L * B == Q(claims["strict_slack"]) > 0
models = []
for m in env["models"]:
    i, j = m["parents"]; th = Q(m["second_weight"]); assert 0 <= th <= 1 and i < NROWS and j < NROWS
    a, b = rows[i], rows[j]
    c0 = (1 - th) * a["C"] + th * b["C"] - 2 * (1 - th) * th * (a["beta"] - b["beta"]) ** 2 / EPS
    c1 = -2 * ((1 - th) * a["ell"] + th * b["ell"])
    assert [c0, c1, Q(1)] == list(map(Q, m["p"])) and Q(m["lo"]) == 0 and Q(m["hi"]) == Q(9, 10)
    models.append((i, j, th, c0, c1))
cells = []; last = Q(0)
for cell in env["cells"]:
    lo, hi, k = Q(cell["lo"]), Q(cell["hi"]), cell["model"]
    assert lo == last and lo < hi <= Q(9, 10) and k < len(models); last = hi
    i, j, th, c0, c1 = models[k]
    assert quad_max(c0, c1, Q(1), lo, hi) <= B, (cell,)
    cells.append((lo, hi, k))
assert last == Q(9, 10)

# ----------------------------------------------------------------- output
def fmt_profile(p):
    nodes = ";".join(f"{qs(r)}:{qs(c)}" for r, c in p.nodes)
    polys = ";".join(",".join(qs(c) for c in pl) for pl in p.polys)
    pairs = ";".join(f"{ki}:{kj}:{qs(a)}:{qs(b)}" for ki, kj, a, b in p.pairs)
    boxes = ";".join(f"{qs(lo)}:{qs(hi)}:{qs(xlo)}:{qs(xhi)}:{k}" for lo, hi, xlo, xhi, k in p.boxes)
    edges = ";".join(qs(e) for e in p.edges)
    cellsets = ", ".join(f"\"{s}\"" for s in p.cellsets)
    return (f"  ⟨\"{p.name}\", {p.kind}, {p.i}, {p.j}, {q(p.w)}, {q(p.dei)}, {q(p.dbi)}, {q(p.dej)}, {q(p.dbj)},\n"
            f"    {q(p.ell)}, {q(p.beta)}, {q(p.delta)},\n    {fmt_sym(p.E)},\n    {fmt_sym(p.R)},\n"
            f"    {q(p.gain)}, {q(p.cap)}, {p.nodeKind},\n    \"{nodes}\",\n    \"{';'.join(p.nodeSrc)}\",\n"
            f"    [{cellsets}],\n    \"{polys}\",\n    {p.certs},\n    \"{pairs}\",\n    \"{boxes}\",\n"
            f"    \"{edges}\",\n    {fmt_gates(p.gates)}⟩")

def write(path, imports, title, body, defs):
    if os.environ.get("NOWRITE") == "1": return   # replay only
    text = ("".join(f"import {m}\n" for m in imports) + "\n/-!\n# " + title +
            " (generated by `tools/gen_lower_data.py`; do not edit)\n\n" + body + "\n-/\n\nnamespace Grothe.Lower\n\n" +
            defs + "end Grothe.Lower\n")
    (ROOT / "Grothe" / "Lower" / path).write_text(text)

srcs = [p for p in profiles if p.kind == 0]
avgs = [p for p in profiles if p.kind == 1]
joins = [p for p in profiles if p.kind in (2, 3)]
assert [p.index for p in srcs + avgs + joins] == list(range(len(profiles)))
dense_defs = "".join(
    f"/-- Lifted dense node caps `(r, cap + 10⁻⁸)` of source profile {k} (`{profiles[k].name}`). -/\n"
    f"def denseNodes{k} : List (ℚ × ℚ) :=\n[" + ",\n".join(f"  ({q(r)}, {q(c)})" for r, c in dense_tab[k]) + "]\n\n"
    for k in sorted(dense_tab))
write("SourceData.lean", ["Grothe.Lower.Profiles"], "Source profiles",
      "The nine source profiles `(ℓ, β, δ, M_E, M_R)` of the Gaussian witness at the source parameter\n"
      "`ε₀ = 37/50`: their node caps `(r, cap)` (Gaussian enclosure hypothesis), the global physical\n"
      "polynomials with their chord certificates, and the moment covers with the caps; and the finer\n"
      "node tables of the two sources used by the dense averaged profiles.",
      "/-- The source profiles (kind `0`). -/\ndef sourceProfiles : List Profile :=\n[" + ",\n".join(fmt_profile(p) for p in srcs)
      + "]\n\n" + dense_defs + "/-- Dense node tables by source index. -/\ndef denseNodes : List (List (ℚ × ℚ)) :=\n  ["
      + ", ".join(f"denseNodes{k}" if k in dense_tab else "[]" for k in range(9)) + "]\n\n")
half = (len(avgs) + 1) // 2
for part, chunk in enumerate((avgs[:half], avgs[half:]), 1):
    write(f"AveragedData{part}.lean", ["Grothe.Lower.Profiles"], f"Averaged profiles, part {part}",
          "Profiles averaging two shifted sources (kind `1`) with their node provenance (indices into the\n"
          "source or dense node tables, or the side node caps of the shifted sources), global polynomials,\n"
          "chord certificates and moment covers.",
          f"/-- Averaged profiles, part {part}. -/\ndef averagedProfiles{part} : List Profile :=\n[" + ",\n".join(fmt_profile(p) for p in chunk) + "]\n\n")
write("JoinData.lean", ["Grothe.Lower.Profiles"], "Pointwise joins and shared-moment joins",
      "The pointwise joins (kind `2`: nodes allocated on the chords of two averaged parents) and the\n"
      "shared-moment joins (kind `3`: polynomial pairs of two parents with argument scales).",
      "/-- Pointwise and shared-moment joins. -/\ndef joinProfiles : List Profile :=\n[" + ",\n".join(fmt_profile(p) for p in joins) + "]\n\n")
row_defs = "/-- The support rows `(crude, profile, scale, ℓ, β, C, gates after dilation)`. -/\ndef rowData : List Row :=\n[" + ",\n".join(
    f"  ⟨{'true' if r['crude'] else 'false'}, {r['prof']}, {q(r['scale'])}, {q(r['ell'])}, {q(r['beta'])}, {q(r['C'])},\n    "
    + (fmt_gates(r["gates"]) if r["gates"] else "dfltGate") + "⟩" for r in rows) + "]\n\n"
row_defs += "/-- Fixed mixtures `(i, j, θ)`. -/\ndef envModels : List EnvModel :=\n[" + ",\n".join(f"  ⟨{i}, {j}, {q(th)}⟩" for i, j, th, _, _ in models) + "]\n\n"
row_defs += "/-- Cells `(lo, hi, model)` of the scalar cover of `[0, 9/10]`. -/\ndef envCells : List EnvCell :=\n[" + ",\n".join(f"  ⟨{q(l)}, {q(h)}, {k}⟩" for l, h, k in cells) + "]\n\n"
write("RowData.lean", ["Grothe.Lower.Support"], "Support rows, fixed mixtures and the scalar cover",
      f"The {len(rows)} support rows at the common witness parameter `ε` (the crude row and {len(rows)-1} dilated\n"
      f"profiles with transferred caps), the {len(models)} fixed mixtures and the {len(cells)} cells of the scalar cover.",
      row_defs)
summary = dict(profiles=len(profiles), sources=len(srcs), averaged=len(avgs), pointwise=sum(p.kind == 2 for p in profiles),
               joint=sum(p.kind == 3 for p in profiles), polys=sum(len(p.polys) for p in profiles),
               pairs=sum(len(p.pairs) for p in profiles), boxes=sum(len(p.boxes) for p in profiles),
               nodes=sum(len(p.nodes) for p in profiles), cells=sum(sum(s.count(";") + 1 for s in p.cellsets) for p in profiles),
               rows=len(rows), models=len(models), envcells=len(cells))
print("ok" + (" (FAST: Bernstein replays skipped)" if FAST else ""), json.dumps(summary))

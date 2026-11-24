#!/usr/bin/env python3
"""Per-channel head interval vectors (251 coefficients, scale 2^128) for the six-channel
(master, Grothe/UpperSix) and eighteen-channel (origin/gemini-1aa9/upper-mixture) upper
certificates.  Research script, Agent-ID: claude-b9ee (worker).  Reuses the exact interval
routines of tools/replay_private_upper_budget.py of the eighteen-channel branch.
Usage: channels.py OUTDIR [nproc]"""
import json, re, sys
from fractions import Fraction as Q
from pathlib import Path
from multiprocessing import Pool

HERE = Path(__file__).resolve().parent
R18 = HERE / "src18"
R6 = HERE / "src6"
sys.path.insert(0, str(R18 / "tools"))
import replay_private_upper_budget as rp  # noqa: E402

M = 251
D12 = 10**12
IV = re.compile(r"⟨(-?\d+),\s*(-?\d+)⟩")

# ---------------- six-channel family ----------------
def six_params():
    w = [Q(n, D12) for n in (855656321685, 87304183672, 156229336, 117021055, 56415370682, 350873570)]
    p0 = [Q(991, 1000), Q(-9, 1000)]
    p1 = [Q(99, 100), Q(-1, 100)]
    p2 = [Q(n, D12) for n in (91987193366, -494518221970, 403975324766, -99055436, 0, 0, 0,
                              -27080072, -217490491, -7730415, 0, -10946266, 0, 475570792, 8681386426)]
    r3 = [Q(980543369477, D12), Q(-19456630523, D12)]
    r4 = [Q(930767036298, D12), Q(-69232963702, D12)]
    p5 = [Q(n, D12) for n in (963782504048, -7609745775, 0, -26371854429, 0, 0, 0, 0, 0, 0, 0, 0, 2235895748)]
    q = [Q(0), Q(-1)]
    tail = [Q(n, D12) for n in (50024, 49816, 1785796, 110835, 3, 57619)]
    chans = [("six0_cell_p0", "cell", p0, q), ("six1_cell_p1", "cell", p1, q), ("six2_phase_p2", "oned_haag", p2, []),
             ("six3_tiger_r3", "oned_tig", r3, []), ("six4_tiger_r4", "oned_tig", r4, []), ("six5_cell_p5", "cell", p5, q)]
    return w, chans, tail

def check_six_params():
    """The hard-coded numbers above must be those of Parameters.lean."""
    text = (R6 / "Grothe/UpperSix/Haagerup/Parameters.lean").read_text()
    w, chans, tail = six_params()
    nums = set(re.findall(r"\d+", text))
    for n in (855656321685, 87304183672, 156229336, 117021055, 56415370682, 350873570, 91987193366, 494518221970,
              403975324766, 99055436, 27080072, 217490491, 7730415, 10946266, 475570792, 8681386426, 980543369477,
              19456630523, 930767036298, 69232963702, 963782504048, 7609745775, 26371854429, 2235895748,
              50024, 49816, 1785796, 110835, 57619, 711974258589, 6157850):
        assert str(n) in nums, n

def six_tables():
    text = (R6 / "Grothe/UpperSix/Haagerup/Data/OverlapData.lean").read_text()
    a = text.index("def tigMuList"); b = text.index("private def tcellRow_0")
    tig = [(int(x), int(y)) for x, y in IV.findall(text[a:b])]
    rows = []
    parts = re.split(r"private def tcellRow_(\d+) : RowI := \((\d+),", text[b:])
    for i in range(1, len(parts), 3):
        m = int(parts[i]); assert m == int(parts[i + 1])
        body = parts[i + 2]
        cut = body.find("def tcellRows")
        if cut >= 0:
            body = body[:cut]
        ent = [(int(n), (int(lo), int(hi))) for n, lo, hi in re.findall(r"\((\d+),\s*⟨(-?\d+),\s*(-?\d+)⟩\)", body)]
        rows.append((m, ent))
    assert [m for m, _ in rows] == list(range(168)), len(rows)
    return tig, rows

def haag_mu_six():
    pq = (rp.of_rat_lo(Q(314159265358979323846, 10**20) / 4), rp.of_rat_hi(Q(314159265358979323847, 10**20) / 4))
    return [rp.mul_i(pq, rp.of_rat_i(r)) for r in rp.haag_list(M)]

def oned_rows(nu):
    return [(0, [(2 * k + 1, nu[k]) for k in range(M)])]

# ---------------- eighteen-channel family ----------------
def columns18():
    return rp.load_verified_columns(R18)

def grades18():
    res = []
    for g in range(8):
        text = (R18 / f"Grothe/UpperReplacement/HeadWitnessFacts/Group{g:02d}.lean").read_text()
        text = text[text.index("def group"):]
        iv = [(int(x), int(y)) for x, y in IV.findall(text)]
        assert len(iv) == 8 * 126, len(iv)
        res += [iv[i * 126:(i + 1) * 126] for i in range(8)]
    return [(sum(x for x, _ in col), sum(y for _, y in col)) for col in zip(*res)]

def job(idx):
    I = lambda l: [rp.of_rat_i(r) for r in l]
    if idx < 6:
        w, chans, tail = six_params()
        name, kind, P, Qp = chans[idx]
        tig, rows = six_tables()
        if kind == "cell":
            ch = rp.bivar_t(M, rows, I(P), I(Qp), 501, 167)
        elif kind == "oned_haag":
            ch = rp.bivar_t(M, oned_rows(haag_mu_six()), I(P), [], 503, 0)
        else:
            assert len(tig) >= M, len(tig)
            ch = rp.bivar_t(M, oned_rows(tig), I(P), [], 503, 0)
        meta = dict(family="six", name=name, kind=kind, w=str(w[idx]), P=[str(x) for x in P], Q=[str(x) for x in Qp])
    else:
        cols = columns18(); col = cols[idx - 6]
        kind = col["kind"]
        primary = [Q(x) for x in col.get("P_Q", col.get("R_Q"))]
        if kind == "GT":
            ch = rp.bivar_t(M, rp.load_energy_rows(R18), I(primary), I([Q(x) for x in col["Q_Q"]]), 501, 167)
        elif kind == "phase":
            pi_i = rp.load_pi_i(R18)
            ch = rp.compose(M, primary, [rp.mul_i(pi_i, rp.of_rat_i(r / 4)) for r in rp.haag_list(M)])
        else:
            g = grades18()
            ch = rp.compose(min(M, len(g)), primary, g)
        meta = dict(family="eighteen", name=col["name"], kind=kind, w=str(Q(col["w_Q"])),
                    P=[str(x) for x in primary], Q=[str(Q(x)) for x in col.get("Q_Q", [])],
                    info=[float(x) for x in col["info"]])
    ch = list(ch) + [(0, 0)] * (M - len(ch))
    meta["nhead"] = sum(1 for a in ch if a != (0, 0))
    meta["head"] = [[str(lo), str(hi)] for lo, hi in ch[:M]]
    Path(sys.argv[1]).mkdir(parents=True, exist_ok=True)
    (Path(sys.argv[1]) / f"channel-{idx:02d}.json").write_text(json.dumps(meta))
    return idx, meta["name"], len(ch)

if __name__ == "__main__":
    check_six_params()
    n = int(sys.argv[2]) if len(sys.argv) > 2 else 24
    with Pool(n) as pool:
        for r in pool.imap_unordered(job, range(24)):
            print(r, flush=True)
    print("DONE", flush=True)

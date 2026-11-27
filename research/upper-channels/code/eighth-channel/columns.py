#!/usr/bin/env python3
"""Build every candidate column once and store it exactly (issue #723).

Columns, each a list of exact head intervals (lo, hi) as fraction strings plus an exact allowance that pays for
everything the head does not contain (tail, truncation, rounding):
  six_0 .. six_5   master's six root channels (Grothe/UpperSix/Certificate: degree-20 first preprocessor, phase cutoff 320,
                   other cutoffs 250, the Lean tail caps), via the replay of the angular-selector note (verify.six_columns)
  sel_d1           master's seventh channel: one angular selector, angle 17/100, R = 23/25 - (2/25)X, research
                   allowance (selector.py; Lean pays the larger 162464451464/10^15, see eighth.py)
  sel_d1_unit      the same selector with R = 1 (second column of the eight-channel research certificate)
  sel_d3a, sel_d3b, sel_d4   the three multiple-selector columns of FINITE.md (d = 3, 3/20, 197/200 and 39/40;
                   d = 4, 7/50, 199/200)
  e18_06 .. e18_23 the eighteen channels of the #556 branch, from channels.py (out/channel-NN.json), allowances as in
                   results.json (certified_exact)
Cell copies (the eighteen's cell channel with R = [a, -(1-a)]) are built on demand by eighth.py.
Agent-ID: claude-b9ee (worker).
Usage: columns.py SOURCES CHANNELDIR OUT.json   (SOURCES from fetch_sources.sh, CHANNELDIR from channels.py)"""
import json
import sys
from fractions import Fraction as Q
from pathlib import Path

HERE = Path(__file__).resolve().parent
CODE = HERE.parent
sys.path.insert(0, str(CODE / "angular-selector-transfer-codex-a7c4"))
from selector import selector_columns  # noqa: E402
from verify import six_columns, check_low_grades  # noqa: E402

src, chdir, out = Path(sys.argv[1]).resolve(), Path(sys.argv[2]), Path(sys.argv[3])
rows, caps, _ = six_columns(src)
cols = {}
for i in range(6):
    cols[f"six_{i}"] = dict(head=[[str(lo), str(hi)] for lo, hi in rows[i]], allowance=str(caps[i]))
    print("six", i, len(rows[i]), caps[i], flush=True)

single = selector_columns()
for name, key, p in (("sel_d1", "linear", Q(23, 25)), ("sel_d1_unit", "unit", Q(1))):
    head, cap = single[key]
    check_low_grades(head, p)
    cols[name] = dict(head=[[str(x), str(x)] for x in head], allowance=str(cap))
    print(name, float(cap), flush=True)
for name, (d, s, p) in (("sel_d3a", (3, Q(3, 20), Q(197, 200))), ("sel_d3b", (3, Q(3, 20), Q(39, 40))),
                        ("sel_d4", (4, Q(7, 50), Q(199, 200)))):
    head, cap = selector_columns(baths=d, strength=s, radial_terms=1800, preprocessor=p)["linear"]
    check_low_grades(head, p, baths=d, strength=s)
    cols[name] = dict(head=[[str(x), str(x)] for x in head], allowance=str(cap))
    print(name, float(cap), flush=True)

res = json.loads((CODE / "results.json").read_text())
D128 = 1 << 128
for i in range(6, 24):
    c = json.loads((chdir / f"channel-{i:02d}.json").read_text())
    cols[f"e18_{i:02d}"] = dict(head=[[str(Q(int(lo), D128)), str(Q(int(hi), D128))] for lo, hi in c["head"]],
                                allowance=res["allowances"][c["name"]]["certified_exact"], name=c["name"])
out.write_text(json.dumps(cols))
print("DONE", len(cols), flush=True)

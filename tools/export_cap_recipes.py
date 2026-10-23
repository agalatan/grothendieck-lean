#!/usr/bin/env python3
"""Export the price recipes stored in `Grothe/LowerAnalytic/CapRecipeData.lean` to JSON.

usage: tools/export_cap_recipes.py [OUTDIR]          (default: data/cap-recipes)

Writes OUTDIR/rowKK.json (the format read by `tools/gen_cap_recipes.py`: a list of
{k, g, v0, var, scale}, rationals as strings "p/q") and OUTDIR/rows.txt (the generator's
arguments, with the excluded nodes of each row). These JSON files are the canonical source
of the recipes: `tools/gen_cap_recipes.py $(cat data/cap-recipes/rows.txt)` must reproduce
CapRecipeData.lean byte for byte.
"""
import json, re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / "Grothe" / "LowerAnalytic" / "CapRecipeData.lean"
OUT = Path(sys.argv[1]) if len(sys.argv) > 1 else ROOT / "data" / "cap-recipes"

text = SRC.read_text()
rows = {}
for m in re.finditer(r"def capRecipes(\d\d) : List \(Nat × Nat × String\) := \[\n(.*?)\n\]", text, re.S):
    k = int(m.group(1))
    recs = []
    for e in re.finditer(r'\((\d+), (\d+), "([^"]*)"\)', m.group(2)):
        parts = e.group(3).split("|")
        recs.append({"k": int(e.group(1)), "g": int(e.group(2)),
                     "v0": parts[0].split(","),
                     "var": [p.split(",") for p in parts[1:-1]],
                     "scale": parts[-1]})
    rows[k] = recs
excl = {int(m.group(1)): m.group(2).replace(" ", "")
        for m in re.finditer(r"\((\d+), capRecipes\d\d, \[([^\]]*)\]\)", text)}
assert set(rows) == set(excl), (sorted(rows), sorted(excl))
OUT.mkdir(parents=True, exist_ok=True)
args = []
for k in sorted(rows):
    p = OUT / f"row{k:02d}.json"
    p.write_text(json.dumps(rows[k], indent=1) + "\n")
    rel = p.relative_to(ROOT) if p.is_relative_to(ROOT) else p
    args.append(f"{k}:{rel}" + (f":{excl[k]}" if excl[k] else ""))
(OUT / "rows.txt").write_text(" ".join(args) + "\n")
print(f"exported {sum(map(len, rows.values()))} recipes of rows {sorted(rows)} to {OUT}")

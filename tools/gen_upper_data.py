#!/usr/bin/env python3
"""Write `Grothe/Upper/Data.lean` (a `Cert` with Haagerup and two-coordinate branches) from a JSON file.

JSON layout (all numbers are exact: integers, decimal strings like "0.906231648312", or
fractions "a/b"; floats are rejected because they are not exact):

    {
      "K": 800,                      # retained radial coefficients (common to all branches)
      "target": "140481/100000",     # the bound K_G^C < target to certify (rational string)
      "dlo_needed": "0.7118...",     # rational: the finite value the checker must reach
      "branches": [
        {"kind": "scalar", "w": "0.559", "row": ["0.906231648312", "-0.093651693922", ...]},
        {"kind": "cauchy", "w": "0.8", "row": [...], "r": "53/50"},   # Haagerup branch with a Cauchy-tail hypothesis
        {"kind": "bivar",  "w": "0.076",
         "table": [[n, m, lo, hi], ...],   # known chaos masses mu[n,m] in [lo, hi], n+m odd
         "P": [...], "Q": [...],           # rho(t) = t P(t^2), sigma(t) = t Q(t^2), coefficient lists
         "UZ": "0.0012", "UW": "0.0011", "NZ": 200, "MW": 40}   # unknown mass beyond NZ (m <= MW) and beyond MW
      ]
    }

A file with top-level "table"/"P"/"Q"/"UZ"/"UW"/"NZ"/"MW" (and optional "w") is treated as a single
two-coordinate branch with weight 1.  `MxZ`, `MxW` may be omitted: they are then computed as
(sum|P|)^(NZ+1) and (sum|Q|)^(MW+1) rounded up to 1e-30.  Every branch's data must satisfy
`certOK` (checked here with the same rules the Lean side decides by `native_decide`)."""
import json, sys
from fractions import Fraction as Q
from math import ceil

def rat(x):
    if isinstance(x, bool) or isinstance(x, float): raise SystemExit(f"inexact number {x!r}")
    if isinstance(x, int): return Q(x)
    return Q(str(x))

def lean_rat(q):
    q = Q(q)
    if q.denominator == 1: return f"({q.numerator} : ℚ)"
    return f"({q.numerator} : ℚ) / {q.denominator}"

def lean_list(qs): return "[" + ", ".join(lean_rat(q) for q in qs) + "]"

def main():
    src = sys.argv[1] if len(sys.argv) > 1 else "handoff/upper-mixture/cert.json"
    out = sys.argv[2] if len(sys.argv) > 2 else "Grothe/Upper/Data.lean"
    J = json.load(open(src))
    if "branches" not in J:
        J = {"K": J.get("K", 800), "target": J.get("target", "2"), "dlo_needed": J.get("dlo_needed", "1/2"),
             "branches": [dict(J, kind="bivar", w=J.get("w", "1"))]}
    K = int(J["K"]); target = rat(J["target"]); dlo = rat(J["dlo_needed"])
    assert K >= 2048, "the retained length must be at least cutoff = 2048"
    specs, wts, rowdefs = [], [], []
    for b in J["branches"]:
        w = rat(b["w"]); assert w > 0, "weights must be positive"
        wts.append(w)
        if b["kind"] == "scalar":
            row = [rat(x) for x in b["row"]]
            assert sum(abs(x) for x in row) <= 1, "scalar row must have coefficient norm <= 1"
            specs.append(f".scalar {lean_list(row)}")
        elif b["kind"] == "bivar":
            P = [rat(x) for x in b["P"]]; Qc = [rat(x) for x in b["Q"]]
            NZ, MW = int(b["NZ"]), int(b["MW"]); UZ = rat(b["UZ"]); UW = rat(b["UW"]); assert UZ >= 0 and UW >= 0
            sP, sQ = sum(abs(x) for x in P), sum(abs(x) for x in Qc)
            assert sP <= 1 and sQ <= 1, "P, Q must have coefficient norm <= 1"
            MxZ = rat(b["MxZ"]) if "MxZ" in b else Q(ceil(sP ** (NZ + 1) * 10 ** 30), 10 ** 30)
            MxW = rat(b["MxW"]) if "MxW" in b else Q(ceil(sQ ** (MW + 1) * 10 ** 30), 10 ** 30)
            assert sP ** (NZ + 1) <= MxZ and sQ ** (MW + 1) <= MxW, "MxZ/MxW too small"
            rows = {}
            seen = set()
            for n, m, lo, hi in b["table"]:
                n, m = int(n), int(m); lo, hi = rat(lo), rat(hi)
                assert (n + m) % 2 == 1, f"even-parity index ({n},{m})"
                assert n <= NZ and m <= MW, f"index ({n},{m}) outside the box"
                assert lo <= hi and (n, m) not in seen, f"bad entry ({n},{m})"
                seen.add((n, m)); rows.setdefault(m, []).append((n, lo, hi))
            for n in range(NZ + 1):
                for m in range(MW + 1):
                    if (n + m) % 2 == 1: assert (n, m) in seen, f"missing odd index ({n},{m}) in the box"
            bidx = len(specs)
            for m in sorted(rows):
                entries = ", ".join(f"({n}, {lean_rat(lo)}, {lean_rat(hi)})" for n, lo, hi in sorted(rows[m]))
                rowdefs.append(f"/-- Row `m = {m}` of the table of branch {bidx}. -/\ndef tab_{bidx}_{m} : ℕ × List (ℕ × ℚ × ℚ) :=\n  ({m}, [{entries}])\n")
            rowtxt = ", ".join(f"tab_{bidx}_{m}" for m in sorted(rows))
            specs.append(f".bivar {{\n        tab := [{rowtxt}],\n        P := {lean_list(P)},\n        Q := {lean_list(Qc)},\n"
                         f"        NZ := {NZ}, MW := {MW}, UZ := {lean_rat(UZ)}, UW := {lean_rat(UW)}, MxZ := {lean_rat(MxZ)}, MxW := {lean_rat(MxW)} }}")
        elif b["kind"] == "cauchy":
            row = [rat(x) for x in b["row"]]; r = rat(b["r"])
            assert sum(abs(x) for x in row) <= 1, "cauchy row must have coefficient norm <= 1"
            assert r >= Q(53, 50), "Cauchy radius must be at least 53/50"
            specs.append(f".cauchy {lean_list(row)} ({lean_rat(r)})")
        else: raise SystemExit(f"unknown kind {b['kind']}")
    text = f"""import Grothe.Upper.Spec

/-!
# Exact data of the upper certificate

Generated by `tools/gen_upper_data.py` from `{src}` (exact rationals; no floats).

* `certData.specs`: the branches.  `cauchy row r` and `scalar row` are Haagerup's phase kernel
  composed with the preprocessor `ρ(t) = t·P(t²)` (`row` = coefficients of `P`), with the tail
  beyond the retained length bounded by the Cauchy estimate of radius `r` (an analytic
  hypothesis) resp. by the positive coefficient majorant.  `bivar d` is a two-coordinate rounding
  `phase(Z·p(|Z|²) + W·q(|Z|²))` (see `TwoCoordData`): enclosures `d.tab` of its chaos masses
  `μ[n,m]` as rows `(m, [(n, lo, hi), …])` (the rows are the definitions `tab_i_m`),
  preprocessors `d.P`, `d.Q` of the two coordinates, box `[0, d.NZ] × [0, d.MW]`, unknown masses
  `d.UZ` (beyond `NZ`), `d.UW` (beyond `MW`), and `d.MxZ ≥ (Σ|P|)^{{NZ+1}}`, `d.MxW ≥ (Σ|Q|)^{{MW+1}}`;
* `certData.wts`: the positive weights (same order);
* `certData.K`: the number of retained radial coefficients;
* `targetQ`: the certified bound `K_G^ℂ ≤ targetQ` (`complex_grothendieck_upper`);
* `dloNeededQ`: the finite value the kernel must reach (`dloIntC certData ≥ dloNeededQ · 2^128`).
-/

namespace Grothe.Upper

{"".join(rowdefs)}
/-- The certificate data. -/
def certData : Cert :=
  {{ specs := [
      {(",\n      ".join(specs))}],
    wts := {lean_list(wts)},
    K := {K} }}

/-- The certified bound. -/
def targetQ : ℚ := {lean_rat(target)}

/-- The required finite value. -/
def dloNeededQ : ℚ := {lean_rat(dlo)}

end Grothe.Upper
"""
    open(out, "w").write(text)
    print(f"wrote {out}: {len(specs)} branches, K = {K}, target {target} ≈ {float(target):.12f}")

if __name__ == "__main__": main()

#!/usr/bin/env python3
"""Audit Taylor-port table arithmetic without evaluating any quadrature nodes.

Reads exact Lean center literals and rational budgets, independently of the table
generator. Checks explicit source bindings for the arithmetic and indexing below;
this is not an audit of all transitive Lean dependencies. Optional --lean-output
emits standalone finalFact checks; it does not claim that Lean has run them. Neither
check establishes range acceptance, seed soundness, or analytic remainders.

Agent-ID: codex-40e8. Refs #335, #41, #313.
"""
from __future__ import annotations

import argparse
from fractions import Fraction
import hashlib
import importlib.util
import json
import math
from pathlib import Path
import re
import sys


class AuditError(ValueError):
    pass


def require(condition, message):
    if not condition:
        raise AuditError(message)


def compact(text):
    # Preserve literal strings: whitespace inside a packed dyadic is invalid.
    return '"'.join(part if i % 2 else re.sub(r"\s+", "", part)
                   for i, part in enumerate(text.split('"')))


def without_comments(text):
    # All inspected declarations have ordinary, non-nested block comments.
    return re.sub(r"--[^\n]*|/-.*?-/", "", text, flags=re.S)


def declaration(text, name, kind="def"):
    clean = without_comments(text)
    found = re.findall(
        rf"^(?:noncomputable )?{kind} {re.escape(name)}\b(.*?)"
        r"(?=^(?:noncomputable )?(?:def |theorem |lemma |structure |inductive |end |set_option )|\Z)",
        clean, flags=re.M | re.S)
    require(len(found) == 1, f"expected one {kind} {name}")
    return found[0].strip()


def body(text, name):
    decl = declaration(text, name)
    require(":=" in decl, f"missing body: {name}")
    return compact(decl.split(":=", 1)[1])


def bind(text, name, expected):
    require(body(text, name) == compact(expected), f"unsupported source binding: {name}")


def integer(text, name):
    value = body(text, name)
    require(re.fullmatch(r"-?\d+", value), f"expected integer literal: {name}")
    return int(value)


def rational_literal(value, label):
    match = re.fullmatch(r"\(?(-?\d+)/(\d+)\)?", compact(value))
    require(match is not None, f"expected rational literal: {label}")
    n, d = map(int, match.groups())
    require(d > 0, f"zero denominator: {label}")
    return Fraction(n, d)


def cases(text, name, count):
    decl = compact(declaration(text, name))
    match = re.fullmatch(rf":Fin{count}→[ℤℚℕ](.*)", decl)
    require(match is not None, f"unsupported cases: {name}")
    rows = re.findall(r"\|([\d_]+)=>([^|]+)", match[1])
    require("".join("|" + k + "=>" + v for k, v in rows) == match[1],
            f"malformed cases: {name}")
    require([k for k, _ in rows] == [str(i) for i in range(count - 1)] + ["_"],
            f"unexpected case order: {name}")
    return [v for _, v in rows]


def count_modes(q):
    return q * (q + 1) * (q + 2) // 3


class Inputs:
    def __init__(self, root):
        self.root = root
        self.hashes = {}

    def read(self, path):
        raw = (self.root / path).read_bytes()
        self.hashes[path] = hashlib.sha256(raw).hexdigest()
        return raw.decode("utf-8")

    def record_binary(self, path):
        self.hashes[path] = hashlib.sha256((self.root / path).read_bytes()).hexdigest()


def center_values(inputs, power, q, exponent):
    prefixes = {1: "first", 2: "second", 3: "third"}
    prefix = prefixes[power]
    if power < 3:
        src = inputs.read(f"Grothe/UpperChaos/Taylor{prefix.title()}Data.lean")
        require(integer(src, prefix + "CenterCommonExponent") == exponent, "center scale mismatch")
        expected = integer(src, prefix + "CenterCount")
        packed = body(src, prefix + "CenterPackedChunks")
        require(re.fullmatch(r'#\["[^"\\]*"(?:,"[^"\\]*")*\]', packed), "bad packed center")
        values = []
        for chunk in re.findall(r'"([^"\\]*)"', packed):
            for token in chunk.split(","):
                match = re.fullmatch(r"(-?\d+):(\d+)", token)
                require(match is not None, "malformed center dyadic")
                m, e = map(int, match.groups())
                require(0 <= e <= exponent and abs(m) < 2**53, "invalid center dyadic")
                values.append(m << (exponent - e))
        require(len(values) == expected == count_modes(q), "center cardinality mismatch")
        defs = inputs.read("Grothe/UpperChaos/TaylorCenters.lean")
        bind(defs, prefix + "CenterInts",
             f"(PackedDyadic.parseChunks {exponent} {prefix}CenterPackedChunks).getD #[]")
        bind(defs, prefix + "CenterAt", f"{prefix}CenterInts[gradedFlatIndex q c d]?.getD 0")
        bind(defs, prefix + "Center", f"gradedHermite {q} {prefix}CenterCoeff")
        bind(defs, prefix + "CenterCoeff", f"({prefix}CenterAt q c d : ℚ) / (2 : ℚ)^{exponent}")
    else:
        src = inputs.read("Grothe/UpperChaos/TaylorThirdIntegerData.lean")
        values = []
        names = []
        for grade in range(q):
            name = f"thirdCenterIntegerGrade{grade:02d}"
            refs = body(src, name).split("++")
            require(refs == [name + f"Part{i:03d}" for i in range(0, (grade+1)*(grade+2), 64)],
                    "unexpected third-center part order")
            row = []
            for ref in refs:
                literal = body(src, ref)
                require(re.fullmatch(r"#\[-?\d+(?:,-?\d+)*\]", literal), "bad third-center array")
                row.extend(map(int, literal[2:-1].split(",")))
            require(len(row) == (grade + 1) * (grade + 2), "third-center grade size mismatch")
            values.extend(row)
            names.append(name + ".toList")
        bind(src, "thirdCenterIntegerValues", "++".join(names))
        defs = inputs.read("Grothe/UpperChaos/TaylorBandData.lean")
        require(integer(defs, "thirdCenterExponent") == exponent, "third-center scale mismatch")
        bind(defs, "thirdCenterInts", "thirdCenterIntegerValues.toArray")
        bind(defs, "thirdCenterCoeff", "PackedDyadic.coeff thirdCenterExponent thirdCenterInts "
             "(q * (q + 1) * (q + 2) / 3 + c * (q + 1) + d)")
    return values


def read_tables(inputs, j, bounds, nlow):
    text = inputs.read(f"data/port-facts/j{j}-tables.txt")
    lines = [line for line in text.splitlines() if not line.startswith("#")]
    require(len(lines) == 2 * (len(bounds) - 1), f"j{j}: missing/extra table rows")
    rows = []
    for r in range(len(bounds) - 1):
        match = re.fullmatch(r"range (\d+) (\d+) (\d+) (-?\d+) (\d+) (\d+)", lines[2*r])
        require(match is not None, f"j{j} range {r}: malformed header")
        ordinal, lo, hi, mid, irad, lrad = map(int, match.groups())
        require((ordinal, lo, hi) == (r, bounds[r], bounds[r+1]),
                f"j{j} range {r}: order/boundary mismatch")
        raw = lines[2*r+1]
        require(re.fullmatch(r"-?\d+(?:,-?\d+)*", raw), f"j{j} range {r}: malformed integer")
        low = list(map(int, raw.split(",")))
        require(len(low) == nlow, f"j{j} range {r}: expected {nlow} low entries")
        rows.append(dict(lo=lo, hi=hi, iMid=mid, iRad=irad, lowRad=lrad, low=low))
    return rows


def bind_margin(src, j, prefix):
    statement = compact(declaration(src, f"j{j}_whole_margin", "theorem").split(":=", 1)[0])
    radius = f"comparisonGroupRadiusQ{j}^2" if j == 1 else f"({math.factorial(j)}*comparisonGroupRadiusQ{j})^2"
    pattern = (rf":\(phaseMoment{2*j}Q\+WholeCenterEnergies\.{prefix}EnergyQ-{re.escape(radius)}\)/2\+"
               rf"(\d+)/10\^(\d+)≤\(j{j}ThetaNum:ℚ\)/10\^20")
    match = re.fullmatch(pattern, statement)
    require(match is not None, f"unsupported whole margin statement j{j}")
    rho_i = Fraction(int(match[1]), 10**int(match[2]))
    statement = compact(declaration(src, f"j{j}_low_margin", "theorem").split(":=", 1)[0])
    match = re.fullmatch(rf":\(j{j}Eps:ℚ\)/2\^1024≤\({prefix}CapturedErrorQ0-(\d+)/10\^(\d+)\)\^2", statement)
    require(match is not None, f"unsupported low margin statement j{j}")
    return rho_i, Fraction(int(match[1]), 10**int(match[2]))


def emit_lean(path, results, hashes):
    lines = ["-- Generated by tools/audit_port_tables.py; Agent-ID: codex-40e8.",
             "-- Checks table arithmetic only. No range acceptance or analytic remainder is proved.",
             "import Grothe.UpperQuad.PortFacts.Common", "import Grothe.UpperQuad.PortFacts.Thresholds",
             "import Grothe.UpperQuad.PortFacts.Margins", "", "namespace GrothePortTableAudit",
             "open Grothe.UpperQuad.PortFacts", ""]
    for name, digest in sorted(hashes.items()):
        lines.append(f"-- SHA256 {digest} {name}")
    for j, result in results.items():
        for r, row in enumerate(result["rows"]):
            strings = []
            tokens = list(map(str, row["low"]))
            for first in range(0, len(tokens), 100):
                strings.append('"' + ",".join(tokens[first:first+100]) + '"')
            lines += [f"def table{j}_{r} : PartialTable :=",
                      f"  ⟨{row['iMid']}, {row['iRad']}, {row['lowRad']}, #[",
                      "    " + ",\n    ".join(strings) + "]⟩"]
        lines += [f"def bounds{j} : List ℕ := {result['bounds']}",
                  f"def tables{j} : List PartialTable := [" +
                  ", ".join(f"table{j}_{r}" for r in range(len(result["rows"]))) + "]",
                  f"theorem tableArithmetic{j} :",
                  f"    finalFact {j} bounds{j} tables{j} j{j}ThetaNum (10 ^ 20) j{j}Eps = true := by",
                  "  native_decide", f"#print axioms tableArithmetic{j}", ""]
    lines.append("end GrothePortTableAudit")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n")


def bind_arithmetic(inputs, common, node):
    """Fail on drift in the indexing, decoding and final arithmetic we reproduce."""
    flat = "q * (q + 1) * (q + 2) / 3 + c * (q + 1) + d"
    bind(node, "gradedFlat", flat)
    bind(inputs.read("Grothe/UpperChaos/GradedFlatIndex.lean"), "gradedFlatIndex", flat)
    bind(node, "twistQlow", "(prm.Dlow + 1) / 2")
    bind(common, "qlow", "twistQlow (twistParams j)")
    bind(inputs.read("GrotheQuadKernel/Basic.lean"), "pow2", "((1 : Nat) <<< n : Nat)")
    bind(inputs.read("GrotheQuadKernel/Contract.lean"), "addPair", "(a.1 + b.1, a.2 + b.2)")
    decoder = inputs.read("Grothe/UpperChaos/PackedDyadic.lean")
    bind(decoder, "parseRecord", '''match record.splitOn ":" with
      | [mantissaText, exponentText] => do
        let mantissa ← mantissaText.toInt?
        let exponent ← exponentText.toNat?
        if exponent ≤ E ∧ mantissa.natAbs < 2 ^ 53 then
          some (mantissa * (2 : ℤ) ^ (E - exponent)) else none
      | _ => none''')
    bind(decoder, "parse", '''if row == "" then some #[] else
      ((row.splitOn ",").mapM (parseRecord E)).map List.toArray''')
    bind(decoder, "coeff", "(a[k]?.getD 0 : ℚ) / (2 : ℚ) ^ E")
    bind(inputs.read("Grothe/UpperChaos/PackedDyadicChunks.lean"), "parseChunks", '''do
      let arrays ← chunks.mapM (parse E)
      pure (arrays.foldl (fun acc a => acc ++ a) #[])''')
    loop = inputs.read("GrotheQuadExtKernel/TwistLoop.lean")
    for source, bindings in [(loop, {
        "twAccZero": """⟨(0, 0), Array.ofFn fun q : Fin Qlow =>
          Array.ofFn fun _ : Fin (q.val + 2) =>
          Array.ofFn fun _ : Fin (q.val + 1) => ((0 : Int), (0 : Int))⟩""",
        "lowGet": "((low.getD q #[]).getD c #[]).getD d (0, 0)",
        "iPartialOK": "acc.iPart.1 * den ≥ num * pow2 (2 * KOut)",
        "excursionTw": "max (max (e.2 - t) (t - e.1)) 0",
        "lowBandExcursionSq": """(List.range Qlow).foldl (fun s q =>
          (List.range (q + 2)).foldl (fun s c => (List.range (q + 1)).foldl
          (fun s d => s + (excursionTw (lowGet acc.low q c d)
          (center.getD (gradedFlat q c d) 0 * pow2 (2 * KOut - E))) ^ 2) s) s) 0""",
        "lowBandOK": "lowBandExcursionSq acc center E Qlow ≤ eps",
    }), (common, {
        "PartialTable.lowMids": '''t.low.foldl (fun acc s =>
          acc ++ ((s.splitOn ",").map fun x => x.toInt?.getD 0).toArray) #[]''',
        "ballAcc": "((m - ρ) * pow2 (2 * KOut - KT), (m + ρ) * pow2 (2 * KOut - KT))",
        "PartialTable.toAcc": """let mids := t.lowMids
          ⟨ballAcc t.iMid t.iRad, Array.ofFn fun q : Fin Qlow =>
          Array.ofFn fun c : Fin (q.val + 2) => Array.ofFn fun d : Fin (q.val + 1) =>
          ballAcc (mids.getD (gradedFlat q.val c.val d.val) 0) t.lowRad⟩""",
        "accAdd": """⟨addPair a.iPart b.iPart, Array.ofFn fun q : Fin Qlow =>
          Array.ofFn fun c : Fin (q.val + 2) => Array.ofFn fun d : Fin (q.val + 1) =>
          addPair (lowGet a.low q.val c.val d.val) (lowGet b.low q.val c.val d.val)⟩""",
        "sumTables": "ts.foldl (fun acc t => accAdd Qlow acc (t.toAcc Qlow)) (twAccZero Qlow)",
        "tiles": """bounds.head? == some 0 && bounds.getLast? == some n &&
          (bounds.zip bounds.tail).all fun p => decide (p.1 ≤ p.2)""",
        "finalFact": """tiles partitionSpecs.length bounds && ts.length + 1 == bounds.length &&
          iPartialOK (sumTables (qlow j) ts) num den &&
          lowBandOK (sumTables (qlow j) ts) (centerInts j) (twistParams j).E (qlow j) eps""",
    })]:
        for name, expected in bindings.items():
            bind(source, name, expected)
    for source, name, expected in [
        (common, "PartialTable", "where iMid : ℤ iRad : ℕ lowRad : ℕ low : Array String deriving Inhabited"),
        (loop, "TwAcc", "where iPart : Int × Int low : Array (Array (Array (Int × Int))) deriving Inhabited"),
        (node, "TwistParams", "where j : Nat Dout : Nat Dlow : Nat Q : Nat E : Nat deriving Repr, Inhabited"),
    ]:
        require(compact(declaration(source, name, "structure")) == compact(expected),
                f"unsupported structure binding: {name}")


def audit(root, generator_check=False):
    inputs = Inputs(root)
    common = inputs.read("Grothe/UpperQuad/PortFacts/Common.lean")
    node = inputs.read("GrotheQuadExtKernel/TwistNode.lean")
    require(integer(common, "KT") == 64 and integer(node, "KOut") == 256, "unsupported scales")
    bind(common, "centerInts", "if j = 1 then firstCenterInts else if j = 2 then secondCenterInts else thirdCenterInts")
    bind(node, "twistParams", "if j == 1 then ⟨1, 181, 51, 91, 206⟩ else if j == 2 then "
         "⟨2, 91, 51, 46, 206⟩ else ⟨3, 51, 11, 26, 105⟩")
    bind_arithmetic(inputs, common, node)
    bounds_all = json.loads(inputs.read("data/port-facts/ranges.json"),
                            object_pairs_hook=unique_object)
    require(set(bounds_all) == {"1", "2", "3"}, "expected exactly three powers")
    thresholds = inputs.read("Grothe/UpperQuad/PortFacts/Thresholds.lean")
    margins = inputs.read("Grothe/UpperQuad/PortFacts/Margins.lean")
    moments = inputs.read("Grothe/UpperChaos/PhaseMomentData.lean")
    tails = inputs.read("Grothe/UpperChaos/TaylorTailData.lean")
    groups = inputs.read("Grothe/Upper/ComparisonGroups.lean")
    energy_defs = inputs.read("Grothe/UpperChaos/WholeCenterEnergies.lean")
    energy_data = inputs.read("Grothe/UpperChaos/TaylorCenterBandData.lean")
    radii = re.fullmatch(r"ifg=0then1/1000000000000000000elseifg=1then(\d+)/(\d+)"
                        r"elseifg=2then(\d+)/(\d+)else(\d+)/(\d+)", body(groups, "comparisonGroupRadiusQ"))
    require(radii is not None, "unsupported group radii")
    require(all(int(radii[2*j]) > 0 for j in (1, 2, 3)), "zero group radius denominator")
    result = {}
    for j, q, exponent, qlow, prefix, bands in [(1,91,206,26,"first",6),
                                               (2,46,206,26,"second",4), (3,26,105,6,"third",4)]:
        bounds = bounds_all[str(j)]
        require(isinstance(bounds, list) and len(bounds) >= 2 and
                all(type(x) is int for x in bounds), f"j{j}: invalid boundaries")
        require(bounds[0] == 0 and bounds[-1] == 21577 and all(a < b for a,b in zip(bounds,bounds[1:])),
                f"j{j}: ranges must strictly tile 0..21577")
        rows = read_tables(inputs, j, bounds, count_modes(qlow))
        centers = center_values(inputs, j, q, exponent)
        energy = Fraction(sum(x*x for x in centers), 1 << (2*exponent))
        if j < 3:
            bind(energy_defs, prefix + "EnergyQ", f"∑ k : Fin {bands}, {prefix}CenterBandEnergyQ k")
            bind(energy_data, prefix + "CenterBandEnergyQ", f"({prefix}CenterBandIntegerEnergy k : ℚ) / (2 : ℚ)^412")
            target = Fraction(sum(map(int, cases(energy_data, prefix + "CenterBandIntegerEnergy", bands))), 2**412)
        else:
            bind(energy_defs, "thirdEnergyQ", "thirdCenterEnergyQ")
            target = rational_literal(body(inputs.read("Grothe/UpperChaos/TaylorBandData.lean"), "thirdCenterEnergyQ"), "third energy")
        require(energy == target, f"j{j}: center energy does not match Lean target")
        ilo = Fraction(sum(t["iMid"]-t["iRad"] for t in rows), 2**64)
        theta_num = integer(thresholds, f"j{j}ThetaNum")
        require(theta_num == ilo.numerator * 10**20 // ilo.denominator, f"j{j}: threshold mismatch")
        eps_match = re.fullmatch(r"2\^(\d+)", body(thresholds, f"j{j}Eps"))
        require(eps_match is not None, f"j{j}: expected power-of-two tolerance")
        eps = 1 << int(eps_match[1])
        low_rad = sum(t["lowRad"] for t in rows)
        excursion_sq = 0
        for n, center in enumerate(centers[:count_modes(qlow)]):
            mid = sum(t["low"][n] for t in rows)
            lo, hi = (mid-low_rad) << 448, (mid+low_rad) << 448
            center <<= 512-exponent
            excursion_sq += max(hi-center, center-lo, 0)**2
        require(eps == 1 << max(excursion_sq.bit_length(), 1), f"j{j}: excursion tolerance mismatch")
        moment = rational_literal(body(moments, f"phaseMoment{2*j}Q"), "phase moment")
        cap = rational_literal(cases(tails, prefix + "CapturedErrorQ", bands)[0], "low cap")
        radius = Fraction(int(radii[2*j-1]), int(radii[2*j]))
        rho_i, rho_low = bind_margin(margins, j, prefix)
        require(moment >= 0 and radius > 0 and rho_i >= 0 and 0 <= rho_low < cap, f"j{j}: invalid budgets")
        imin = (moment + energy - (math.factorial(j)*radius)**2) / 2
        whole_slack = Fraction(theta_num,10**20)-rho_i-imin
        low_slack = (cap-rho_low)**2-Fraction(eps,2**1024)
        require(whole_slack >= 0, f"j{j}: insufficient whole-error margin")
        require(low_slack >= 0, f"j{j}: insufficient low-band margin")
        result[j] = dict(rows=rows, bounds=bounds, theta_num=theta_num, eps=eps,
                         excursion_sq=excursion_sq, ilo=ilo, imin=imin, whole_slack=whole_slack,
                         low_slack=low_slack, rho_i=rho_i, rho_low=rho_low, cap=cap)
    if generator_check:
        inputs.read("tools/gen_port_facts.py")
        for name in ("arb_first_phase_D181.npz", "arb_phase_power2_D151.npz", "arb_phase_power3_D51.npz"):
            inputs.record_binary("data/taylor-approximants/inputs/" + name)
        spec = importlib.util.spec_from_file_location("port_generator_crosscheck", root / "tools/gen_port_facts.py")
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        for j, r in result.items():
            num, den, eps, _, ilo, ex2 = module.final_values(j, module.read_tables(j))
            require((num,den,eps,ilo,ex2) == (r["theta_num"],10**20,r["eps"],r["ilo"],r["excursion_sq"]),
                    f"j{j}: generator disagrees with independent arithmetic")
    return result, inputs.hashes


def unique_object(pairs):
    value = {}
    for key, item in pairs:
        require(key not in value, f"duplicate JSON key: {key}")
        value[key] = item
    return value


def fraction_report(value):
    return {"exact": str(value), "approx": float(value)}


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--json", action="store_true", help="emit exact values and input hashes as JSON")
    parser.add_argument("--cross-check-generator", action="store_true", help="also compare the generator (requires NumPy)")
    parser.add_argument("--lean-output", type=Path, help="write a scratch .lean file; does not run Lean")
    args = parser.parse_args(argv)
    try:
        results, hashes = audit(args.repo.resolve(), args.cross_check_generator)
        report = {"status": "table_arithmetic_passed", "range_acceptance": "not_checked",
                  "analytic_remainders": "not_proved", "seed_soundness": "not_checked",
                  "generator_cross_check": args.cross_check_generator,
                  "inputs_sha256": dict(sorted(hashes.items())), "powers": {}}
        for j, r in results.items():
            report["powers"][str(j)] = dict(ranges=len(r["rows"]), low_entries=len(r["rows"][0]["low"]),
                i_table_lower=fraction_report(r["ilo"]), i_min=fraction_report(r["imin"]),
                theta_num=r["theta_num"], theta_den=10**20, eps_exponent=r["eps"].bit_length()-1,
                excursion_sq=fraction_report(Fraction(r["excursion_sq"],2**1024)),
                whole_margin=fraction_report(r["whole_slack"]), low_squared_margin=fraction_report(r["low_slack"]),
                assumed_whole_remainder=fraction_report(r["rho_i"]), assumed_low_remainder=fraction_report(r["rho_low"]))
        if args.lean_output:
            require(args.lean_output.suffix == ".lean", "--lean-output must name a .lean file")
            require(args.lean_output.resolve() not in {args.repo.resolve()/p for p in hashes}, "output would overwrite an input")
            emit_lean(args.lean_output, results, hashes)
            report["lean_output"] = str(args.lean_output.resolve())
            report["lean_check"] = "not_run"
        if args.json:
            print(json.dumps(report, indent=2, sort_keys=True))
        else:
            print("PASS: committed-table arithmetic; range acceptance and analytic remainders remain unchecked.")
            for j, r in results.items():
                print(f"j={j}: {len(r['rows'])} ranges, whole margin {float(r['whole_slack']):.6e}, "
                      f"low excursion {math.isqrt(r['excursion_sq']) / 2**512:.6e}")
            print(f"SHA256 recorded for {len(hashes)} inputs (use --json for hashes and exact values).")
            if args.lean_output:
                print(f"Wrote {args.lean_output}; Lean has not been run.")
        return 0
    except (AuditError, OSError, ValueError, ImportError) as error:
        if args.json:
            print(json.dumps({"status": "failed", "error": str(error)}))
        else:
            print(f"FAIL: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())

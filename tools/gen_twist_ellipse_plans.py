#!/usr/bin/env python3
"""Validate complete exact plans and generate twisted ellipse certificate arrays.

Agent-ID: codex-40e8. Refs #343.

Input uses the research producer's ``panel_count`` and ``plans`` schema. Certificate
numbers are JSON integers or integer/fraction strings, never floats or booleans.
Diagnostic metadata (including elapsed_seconds and previous failures) is ignored.
This validates serialization, coverage and disk-cover geometry, NOT interval mass
acceptance or the analytic remainder theorem. Lean must check every certificate.
"""
from __future__ import annotations

import argparse
from dataclasses import dataclass
from decimal import Decimal
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
ADDRESS = "Grothe/UpperChaos/Q0GaussAddress.lean"
SCAN = "Grothe/UpperChaos/Q0GaussAddressScan.lean"
PROVENANCE_FILES = (
    "Grothe/Upper/Data.lean", ADDRESS, SCAN, "GrotheQuadKernel/Profile.lean",
    "Grothe/UpperQuad/QuadEllipseCheck.lean", "GrotheQuadExtKernel/TwistNode.lean",
)


def rational(value, label: str) -> Q:
    if type(value) is int:
        return Q(value)
    if isinstance(value, str) and re.fullmatch(r"-?[0-9]+(?:/[1-9][0-9]*)?", value):
        return Q(value)
    raise ValueError(f"{label}: expected an exact integer or integer/fraction string")


def integer(value, label: str, minimum: int = 0) -> int:
    if type(value) is not int or value < minimum:
        raise ValueError(f"{label}: expected an integer >= {minimum} (not a boolean)")
    return value


def unique_object(pairs):
    out = {}
    for key, value in pairs:
        if key in out:
            raise ValueError(f"duplicate JSON key: {key}")
        out[key] = value
    return out


def parse_json(text: str):
    def bad_constant(value):
        raise ValueError(f"non-finite JSON constant: {value}")
    return json.loads(text, parse_float=Decimal,
                      parse_constant=bad_constant, object_pairs_hook=unique_object)


def read_json(path: Path):
    return parse_json(path.read_text())


def without_comments(text: str) -> str:
    """Remove Lean comments, including nested block comments, before literal parsing."""
    out, i, depth = [], 0, 0
    while i < len(text):
        if text.startswith("/-", i):
            depth += 1
            out.append(" ")
            i += 2
        elif depth and text.startswith("-/", i):
            depth -= 1
            i += 2
        elif not depth and text.startswith("--", i):
            stop = text.find("\n", i)
            i = len(text) if stop < 0 else stop
        else:
            out.append(text[i] if not depth or text[i] == "\n" else " ")
            i += 1
    if depth:
        raise ValueError("unterminated Lean source comment")
    return "".join(out)


@dataclass(frozen=True)
class Panel:
    lo: Q
    hi: Q
    order: int
    offset: int


def read_panels(repo: Path) -> list[Panel]:
    """Parse the supported source literals in the actual sourcePanels order."""
    text = without_comments((repo / ADDRESS).read_text())
    scan = without_comments((repo / SCAN).read_text())
    fields = re.search(r"structure Panel where\s+(.*?)\s+deriving", text, re.S)
    if not fields or fields[1].split() != "lo : ℚ hi : ℚ order : ℕ offset : ℕ".split():
        raise ValueError("unsupported production Panel structure")
    row = re.compile(r"⟨\(\((-?[0-9]+) : ℚ\) / ([1-9][0-9]*)\),\s*"
                     r"\(\((-?[0-9]+) : ℚ\) / ([1-9][0-9]*)\),\s*"
                     r"([0-9]+),\s*([0-9]+)⟩")
    blocks = {}
    for name, body in re.findall(r"def (panelBlock[0-9]+) : Array Panel := #\[(.*?)\]", text, re.S):
        if name in blocks or row.sub("", body).strip(" ,\n\t\r"):
            raise ValueError(f"duplicate or unsupported source block: {name}")
        matches = list(row.finditer(body))
        stop = 0
        for i, match in enumerate(matches):
            if body[stop:match.start()].strip() != ("," if i else ""):
                raise ValueError(f"malformed source row separator: {name}")
            stop = match.end()
        if body[stop:].strip() not in ("", ","):
            raise ValueError(f"malformed source block suffix: {name}")
        blocks[name] = [Panel(Q(int(l), int(ld)), Q(int(h), int(hd)), int(n), int(o))
                        for l, ld, h, hd, n, o in row.findall(body)]
        if not blocks[name]:
            raise ValueError(f"empty source block: {name}")
    declarations = re.findall(r"\bdef\s+(panelBlock[0-9]+)\b", text)
    if not blocks or len(declarations) != len(blocks) or set(declarations) != set(blocks):
        raise ValueError("unsupported or duplicate source block declaration")
    sources = re.findall(r"def sourcePanels : List Panel := ([^\n]+)", scan)
    if len(sources) != 1 or len(re.findall(r"\bdef\s+sourcePanels\b", scan)) != 1:
        raise ValueError("unsupported or duplicate sourcePanels declaration")
    names = re.findall(r"(panelBlock[0-9]+)\.toList", sources[0])
    if (sources[0].strip() != " ++ ".join(n + ".toList" for n in names)
            or len(names) != len(set(names)) or set(names) != set(blocks)):
        raise ValueError("sourcePanels must consume every source block exactly once")
    panels = [p for name in names for p in blocks[name]]
    offset, previous = 0, None
    for index, p in enumerate(panels):
        if (p.lo >= p.hi or p.order <= 0 or p.offset != offset
                or (previous is not None and p.lo < previous)):
            raise ValueError(f"malformed production panel order/offset at {index}")
        offset, previous = offset + p.order, p.hi
    return panels


@dataclass(frozen=True)
class Certificate:
    panel: int
    j: int
    rho: Q
    m: int
    radius: Q
    tau: Q
    eta_y: Q
    eta_k: Q
    mode: str
    mass_cap: Q
    error_cap: Q


def validate_row(row, panels: list[Panel]) -> Certificate:
    if not isinstance(row, dict):
        raise ValueError("plan row must be an object")
    required = {"panel", "j", "lo", "hi", "order", "rho", "m", "R", "tau",
                "etaY", "etaK", "mode", "M2cap", "errorCap"}
    missing = required - row.keys()
    if missing:
        raise ValueError(f"plan row missing fields: {', '.join(sorted(missing))}")
    index, j = integer(row["panel"], "panel"), integer(row["j"], "j", 1)
    label = f"panel {index}, j{j}"
    if index >= len(panels) or j > 3:
        raise ValueError(f"{label}: index or power out of range")
    source = panels[index]
    lo, hi = rational(row["lo"], label + " lo"), rational(row["hi"], label + " hi")
    order = integer(row["order"], label + " order", 1)
    if (lo, hi, order) != (source.lo, source.hi, source.order):
        raise ValueError(f"{label}: lo/hi/order disagree with production sourcePanels")
    rho, radius, tau, eta_y, eta_k, mass, error = (
        rational(row[k], label + " " + k)
        for k in ("rho", "R", "tau", "etaY", "etaK", "M2cap", "errorCap"))
    m = integer(row["m"], label + " m", 1)
    if rho <= 1 or radius < 0:
        raise ValueError(f"{label}: require rho > 1 and R >= 0")
    if any(not 0 < q < 1 for q in (tau, eta_y, eta_k)):
        raise ValueError(f"{label}: tau/etaY/etaK must lie strictly between 0 and 1")
    if mass < 0 or error < 0:
        raise ValueError(f"{label}: negative M2cap/errorCap")
    a, b = (hi - lo) * (rho + 1/rho) / 4, (hi - lo) * (rho - 1/rho) / 4
    if (a/m)**2 + b*b > radius*radius:
        raise ValueError(f"{label}: radius does not cover the ellipse disks")
    modes = {"Y": "y", "K": "k", "auto": "auto"}
    if not isinstance(row["mode"], str) or row["mode"] not in modes:
        raise ValueError(f"{label}: unrecognized mode (expected Y, K or auto)")
    return Certificate(index, j, rho, m, radius, tau, eta_y, eta_k,
                       modes[row["mode"]], mass, error)


def validate_plans(data, panels: list[Panel]) -> list[Certificate]:
    if not isinstance(data, dict) or "panel_count" not in data or "plans" not in data:
        raise ValueError("input must contain panel_count and plans")
    count = integer(data["panel_count"], "panel_count", 1)
    if count != len(panels):
        raise ValueError(f"panel_count {count} disagrees with sourcePanels length {len(panels)}")
    if not isinstance(data["plans"], list):
        raise ValueError("plans must be a list")
    rows = [validate_row(row, panels) for row in data["plans"]]
    keys = [(row.panel, row.j) for row in rows]
    if len(keys) != len(set(keys)):
        raise ValueError("duplicate (panel,j) certificate")
    missing = {(i, j) for i in range(count) for j in (1, 2, 3)} - set(keys)
    if missing:
        raise ValueError(f"incomplete certificates: missing {len(missing)} (panel,j) rows; "
                         f"first missing {sorted(missing)[:5]}")
    return sorted(rows, key=lambda row: (row.j, row.panel))


def check_provenance(data, repo: Path) -> None:
    hashes = data.get("source_sha256")
    if not isinstance(hashes, dict):
        raise ValueError("--require-source-hashes requires source_sha256")
    for name in PROVENANCE_FILES:
        expected = hashes.get(name)
        if not isinstance(expected, str) or not re.fullmatch(r"[0-9a-f]{64}", expected):
            raise ValueError(f"missing/malformed source SHA256: {name}")
        if hashlib.sha256((repo / name).read_bytes()).hexdigest() != expected:
            raise ValueError(f"source SHA256 mismatch: {name}")


def lean_q(q: Q) -> str:
    return f"({q.numerator} : ℚ)" if q.denominator == 1 else f"(({q.numerator} : ℚ) / {q.denominator})"


def render(rows: list[Certificate], input_sha256: str) -> str:
    lines = ["import Grothe.UpperQuad.TwistEllipseCertificate", "",
             "/-! Generated by tools/gen_twist_ellipse_plans.py. Do not edit by hand.",
             f"Input SHA256: {input_sha256}",
             "Only plan serialization/coverage/geometry validated here; interval acceptance and",
             "analytic soundness require separate Lean proofs.",
             "Agent-ID: codex-40e8. Refs #343. -/", "", "set_option maxRecDepth 8192", "",
             "namespace Grothe.UpperQuad.TwistEllCheck", ""]
    for j in (1, 2, 3):
        power = sorted((r for r in rows if r.j == j), key=lambda row: row.panel)
        blocks = []
        for first in range(0, len(power), 64):
            name = f"j{j}CertificateBlock{first // 64:03d}"
            blocks.append(name)
            lines.append(f"private def {name} : Array Certificate := #[")
            block = power[first:first+64]
            for k, row in enumerate(block):
                comma = "," if k + 1 < len(block) else ""
                q = lean_q
                lines.extend([
                    "  { plan := { geometry := { " + f"rho := {q(row.rho)}, m := {row.m}, "
                    + f"R := {q(row.radius)}, tau := {q(row.tau)}" + " },",
                    f"      etaY := {q(row.eta_y)}, etaK := {q(row.eta_k)}, mode := .{row.mode}" + " },",
                    f"    massCap := {q(row.mass_cap)}, errorCap := {q(row.error_cap)}" + " }" + comma])
            lines.extend(["]", ""])
        lines.extend([f"/-- Power {j} certificates in complete source-panel order. -/",
                      f"def j{j}Certificates : Array Certificate :=", "  " + " ++ ".join(blocks), ""])
    lines.extend(["end Grothe.UpperQuad.TwistEllCheck", ""])
    return "\n".join(lines)


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=ROOT)
    parser.add_argument("--input", type=Path)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--check", action="store_true", help="compare output without writing")
    parser.add_argument("--require-source-hashes", action="store_true",
                        help="require matching hashes for the six relevant production Lean inputs")
    parser.add_argument("--budgets", help="optional exact j1,j2,j3 panel budgets; require sum <= budget")
    args = parser.parse_args(argv)
    source = args.input or args.repo / "data/twist-ellipse/plans.json"
    output = args.output or args.repo / "Grothe/UpperQuad/TwistEllipsePlans.lean"
    try:
        if not source.is_file():
            raise ValueError(f"missing plan input: {source}; no verified full plan data supplied")
        if source.resolve() == output.resolve():
            raise ValueError("input and output must be different files")
        source_bytes = source.read_bytes()
        data = parse_json(source_bytes.decode("utf-8"))
        rows = validate_plans(data, read_panels(args.repo))
        if args.require_source_hashes:
            check_provenance(data, args.repo)
        totals = [sum((row.error_cap for row in rows if row.j == j), Q(0)) for j in (1, 2, 3)]
        if args.budgets is not None:
            budgets = [rational(v, "budget") for v in args.budgets.split(",")]
            if len(budgets) != 3 or any(q < 0 for q in budgets):
                raise ValueError("--budgets requires three nonnegative exact rationals")
            if any(total > budget for total, budget in zip(totals, budgets)):
                raise ValueError("certificate errorCap sum exceeds a supplied budget")
        digest = hashlib.sha256(source_bytes).hexdigest()
        text = render(rows, digest)
        if args.check:
            if not output.is_file() or output.read_text() != text:
                raise ValueError(f"generated output missing or stale: {output}")
        else:
            output.parent.mkdir(parents=True, exist_ok=True)
            output.write_text(text)
        print(json.dumps({"status": "checked" if args.check else "generated",
                          "panels": len(rows) // 3, "certificates": len(rows),
                          "errorCap_sums": [str(q) for q in totals],
                          "input_sha256": digest, "output": str(output)}))
        return 0
    except (ValueError, OSError) as error:
        print(f"error: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())

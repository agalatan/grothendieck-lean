#!/usr/bin/env python3
"""Replay an existing joint-prefix dual for the actual polynomial rounder T.

Exact rational arithmetic only. Inherited Gaussian, HS, and moment enclosures
remain hypotheses. This independently checks finite dual assembly, available
source identities, the T-X comparison, and an endpoint using the current head.
No inherited file is written. The small result is written under reassessment.
"""
from __future__ import annotations

import hashlib
import json
import re
import ast
import struct
from fractions import Fraction as Q
from math import factorial
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "handoff/research-third-decimal/reassessment-20261023/upper"
JOINT = ROOT / "handoff/upper-residual/matrix/joint_prefix_certificate.json"
OLD = ROOT / "handoff/upper-residual/global_norm/taylor_comparison_result.json"


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def ball_lower(value: str) -> Q:
    match = re.fullmatch(r"\[([^ ]+) \+/- ([^ ]+)\]", value)
    assert match is not None, value
    return Q(match[1]) - Q(match[2])


def lean_rationals(source: str, name: str, is_list: bool = False) -> list[Q]:
    ty = "List ℚ" if is_list else "ℚ"
    block = source.split(f"def {name} : {ty} :=", 1)[1].split("/--", 1)[0]
    values = re.findall(r"\((-?\d+) : ℚ\)(?:\s*/\s*(\d+))?", block)
    return [Q(int(n), int(d) if d else 1) for n, d in values]


def main() -> None:
    assert sha(JOINT) == "89498abdeb0f2a5827177e2147dd75f0f61346deb935e583f3f59eb4b1a5b4c3"
    assert sha(OLD) == "5619546626b7588ce64a2229aa58b0d161bde613dbf9a5eaad94a3ef93461915"
    joint = json.loads(JOINT.read_text())
    old = json.loads(OLD.read_text())
    assert joint["status"] == "PASS_EXACT_HS_UNION_AND_JOINT_PREFIX_DUAL"
    assert old["cuts"] == [181, 91, 51]
    assert len(joint["dual_rows"]) == len(old["details"]) == 3
    assert [r["power"] for r in joint["dual_rows"]] == [1, 2, 3]
    # Phase, frozen X, and old comparison JSON are identically hash-bound.
    hashes = joint["source_sha256"]
    assert hashes["outputs/grothendieck-1404599424-improvement/new/global_norm/taylor_comparison_result.json"] == sha(OLD)
    phase = ROOT / "handoff/upper-residual/taylor/phase_damped_m4_d36_eps1p05.json"
    frozen = ROOT / "handoff/upper-residual/global_norm/frozen_taylor_correction_D201.npz"
    assert sha(phase) == "04d581fa45e1d879623a0f233315dcfed39e0aa91c6684d554d0524ac8a71617"
    assert sha(frozen) == "e8b401a53806fd7e6801906ca531048660f85f102d32b6591fe3f198373de2c1"
    assert list(h for p, h in hashes.items() if p.endswith("frozen_taylor_correction_D201.npz")) == [sha(frozen)]

    # Bind every physical phase parameter and every current exact preprocessing
    # coefficient to the Lean source, not merely a matching numeral substring.
    source = (ROOT / "Grothe/Upper/Data.lean").read_text()
    contour = json.loads((ROOT / "handoff/upper-residual/taylor/contour_input.json").read_text())
    ph = json.loads(phase.read_text())
    for name, key in [("aQ", "a"), ("bQ", "b"), ("etaQ", "eta")]:
        assert lean_rationals(source, name) == [Q(contour[key])]
    assert lean_rationals(source, "profileQ", True) == [Q(x) for x in contour["profile"]]
    assert lean_rationals(source, "phaseEpsQ") == [Q(ph["epsilon"])]
    phase_block = source.split("def phaseStrs : List String :=", 1)[1].split("/--", 1)[0]
    phase_rows = re.findall(r'"(\d+,\d+,\d+):([^\"]+)"', phase_block)
    assert dict(phase_rows) == {",".join(map(str, row["powers"])):row["coefficient"]
                                for row in ph["monomial_coefficients"]}
    pq = json.loads((ROOT / "handoff/research-third-decimal/upper-newpq-20261022/step23_newPQ.json").read_text())
    assert lean_rationals(source, "pList", True) == [Q(x) for x in pq["P"]]
    assert lean_rationals(source, "qList", True) == [Q(0), -Q(pq["alpha"]), Q(0), -Q(pq["beta"])]

    # Bind all 21,168 stored exact dyadic energies to the unchanged X table.
    energy_block = source.split("def energyStrs : List String :=", 1)[1].split("/--", 1)[0]
    energy_rows = re.findall(r'"(\d+):([^\"]+)"', energy_block)
    packed = {}
    for m, row in energy_rows:
        for term in row.split(";"):
            n, num, exponent = map(int, term.split(","))
            packed[n, int(m)] = Q(num, 2**exponent)
    data = (ROOT / "handoff/upper-residual/taylor/X_energy_N501.npy").read_bytes()
    assert data[:8] == b"\x93NUMPY\x01\x00"
    size = int.from_bytes(data[8:10], "little")
    header = ast.literal_eval(data[10:10+size].decode("ascii").strip())
    assert header["descr"] == "<f8" and not header["fortran_order"]
    rows, columns = header["shape"]
    values = struct.unpack(f"<{rows*columns}d", data[10+size:])
    # The archive array is primary-major, as documented by the generator.
    expected = {(n,m):Q(values[n*columns+m]) for n in range(rows)
                for m in range(columns) if n+3*m <= 501 and values[n*columns+m] != 0}
    assert packed == expected and len(packed) == 21_168

    # Every supplied square root is checked by squaring exact positive rationals.
    roots = {}
    for gate in joint["square_root_gates"]:
        rad, upper = Q(gate["radicand"]), Q(gate["upper"])
        assert 0 <= rad <= upper * upper
        roots[rad] = upper
    assert len(roots) == 20

    hs = {}
    for power in [1, 2, 3]:
        path = ROOT / f"handoff/upper-residual/global_norm/natural/power{power}_hs_result.json"
        data = json.loads(path.read_text())
        assert data["status"] == "DIRECTED_POWER_HS_GATES"
        expected = next(h for p, h in hashes.items() if p.endswith(f"/power{power}_hs_result.json"))
        assert sha(path) == expected
        assert data["source_sha256"] == sha(phase)
        for row in data["bounds"]:
            hs[power, row["D"], row["coordinate"]] = Q(row["upper_rational"])

    # The union is bounded by the square root of the sum of four squared HS
    # caps. The first two power-1 cutoffs are preserved only inside this
    # certificate; the original rectangular_hs_result.json is absent here.
    union = {}
    rebound = 0
    for row in joint["union_caps"]:
        power, cutoff = row["power"], row["D"]
        coord = [Q(x) for x in row["coordinate_hs_caps"]]
        assert len(coord) == 4 and all(x >= 0 for x in coord)
        for k, value in enumerate(coord):
            if (power, cutoff, k) in hs:
                assert value == hs[power, cutoff, k]
                rebound += 1
        rad = sum(x * x for x in coord)
        upper = Q(row["union_hs_cap"])
        assert roots[rad] == upper
        epsilon = Q(1, 25_000_000_000) + Q(11, 500) * upper + Q(1, 10**18)
        assert epsilon == Q(row["prefix_error_cap"])
        assert epsilon <= Q(row["old_prefix_error_cap"])
        union[power, cutoff] = epsilon
    assert len(union) == 14 and rebound == 48

    cross, error = Q(0), Q(joint["rounding_norm_upper"])
    assert error == Q(old["rounding_error"]) and 0 <= error < Q(1, 10**18)
    dual_rows = []
    for row, inherited in zip(joint["dual_rows"], old["details"]):
        power = row["power"]
        assert power == inherited["power"]
        scale = Q(row["scale"])
        assert scale == Q(1, 10**6)
        ell = [Q(x) for x in row["center_norm_lowers_scaled"]]
        eps = [Q(x) for x in row["prefix_errors_scaled"]]
        a = [Q(x) for x in row["X_band_caps"]]
        at, mu = Q(row["X_tail_cap"]), Q(row["moment_scaled"])
        lam = Q(row["lambda_rational"])
        nu = [Q(x) for x in row["prefix_multipliers"]]
        assert lam > 0 and all(x >= 0 for x in nu)
        assert len(ell) == len(eps) == len(a) == len(nu) == len(inherited["bands"])
        assert at == Q(inherited["tail_X_norm_cap"])
        for lo, ep, ai, band in zip(ell, eps, a, inherited["bands"]):
            assert 0 <= ep < lo  # Needed before using (ell-e)^2.
            assert lo * scale <= ball_lower(band["center_norm"])
            assert ep * scale == union[power, band["hi"]]
            assert ai == Q(band["X_norm_cap"])
        # Independent completion-of-squares evaluation; the discovery solver
        # and its stated optimum are irrelevant to this inequality.
        terms = [lam * (mu - sum(x*x for x in ell)), at*at/(4*lam),
                 sum(v*x*x for v, x in zip(nu, eps))]
        terms += [(ai + 2*lam*li)**2 / (4*(lam+sum(nu[k:])))
                  for k, (ai, li) in enumerate(zip(a, ell))]
        assert terms == [Q(x) for x in row["dual_terms_scaled"]]
        dual = scale * sum(terms)
        assert dual == Q(row["dual_upper"])
        cross += 2*dual/factorial(power)
        tail2 = (mu - sum((li-ep)**2 for li, ep in zip(ell, eps))) * scale**2
        assert tail2 >= 0
        tail = roots[tail2]
        assert tail <= Q(inherited["tail_cap"])
        whole_error2 = tail*tail + (eps[-1]*scale)**2
        error += roots[whole_error2]/factorial(power)
        dual_rows.append({"power": power, "cross_upper": float(2*dual/factorial(power)),
                          "tail_l2_upper": float(tail)})
    assert cross == Q(joint["cross_upper"])
    assert error*error == Q(joint["quadratic_upper"])
    compare = cross + error*error + 4*Q(joint["rounding_norm_upper"])
    # T itself is the bounded rounder. No exponential Taylor remainder occurs.
    cap = Q(1017321032757, 10**18)
    assert compare < cap < Q(1065637497, 10**15)

    # Current native-checked head and its slope. This script does not rerun
    # native_decide or the current Hardy contour certificate.
    slope = Q(1779870886481, 25*10**11)
    head, energy, tail = Q(309, 3125000000), Q(6847009, 5*10**17), Q(36748, 10**12)
    assert lean_rationals(source, "slopeQ") == [slope]
    assert lean_rationals(source, "headCapQ") == [head]
    assert lean_rationals(source, "energyErrQ") == [energy]
    endpoint = 1/(slope-cap-head-energy-tail)
    advertised = Q(1404598540048, 10**12)
    old_endpoint = Q(500000000000000000, 355973576656604491)
    assert endpoint < advertised < old_endpoint
    result = {
        "status": "PASS_EXACT_CONDITIONAL_IMPROVED_COMPARISON_ASSEMBLY",
        "comparison_cap": str(cap), "comparison_decimal": float(cap),
        "endpoint": str(endpoint), "endpoint_decimal": float(endpoint),
        "strict_upper": str(advertised),
        "improvement_over_current": float(old_endpoint-endpoint),
        "unchanged_slope": str(slope), "unchanged_head_cap": str(head),
        "unchanged_energy_error": str(energy), "unchanged_hardy_tail": str(tail),
        "dual_rows": dual_rows, "exact_square_root_gates": 20,
        "union_caps": 14, "coordinate_HS_caps_rebound_to_local_sources": rebound,
        "current_Lean_dyadic_energy_entries_bound_to_X":len(packed),
        "moment_upper_premises": [str(Q(r["moment_scaled"])*Q(r["scale"])**2)
                                   for r in joint["dual_rows"]],
        "hashes": {str(p.relative_to(ROOT)):sha(p) for p in [JOINT, OLD, phase, frozen]},
        "inherited_missing_original_inputs": ["phase_damped_m4_d36_eps1p05_moments.json",
            "rectangular_hs_result.json (power-1 cutoffs 51 and 101)",
            "coefficient_norm_centers.json (their enclosures survive in taylor_comparison_result.json)"],
        "scope": "Exact replay of finite certificate consequences, conditional on inherited moment, HS, coefficient and Gaussian analytic enclosures. No fresh integration and no unconditional Grothendieck bound. Existing native head and Hardy premises reused."
    }
    OUT.mkdir(parents=True, exist_ok=True)
    (OUT / "comparison-result.json").write_text(json.dumps(result, indent=2)+"\n")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()

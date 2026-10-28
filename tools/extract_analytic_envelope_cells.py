#!/usr/bin/env python3
"""Pin the 183 analytic envelope candidates with exact rational replay.

The input models and scalar exponential claims remain unproved numerical
candidates. This extractor checks provenance, the complete midpoint geometry,
analytic-formula arithmetic, outward rounding, and stored finite integrals;
none of these Python checks replaces a Lean proof of the actual kernels.

Agent-ID: codex-2ca4
"""

from __future__ import annotations

import argparse
from collections import Counter
from fractions import Fraction
import gzip
import hashlib
import json
from math import factorial
from pathlib import Path


Q = Fraction
PINNED_PARENT_SHA256 = "1cc2750625e0abd9b877fc299211656832be00e04789fb5f34ffdf9f27b1efd9"
PINNED_FINISH_SHA256 = "3d25a0ee80f7a011ee7385f96be58655118a74057d7a4dbd8785a6acee9f93e6"
PINNED_PACK_SHA256 = "4fcd821b160c49181d48b43a9408abcfdbe2787de694c7ebc2203fc2a9e5e465"
DIRECT_RULE = "GaussianDenominatorEnvelope.direct_core/direct_companion"
RECIPROCAL_RULE = "GaussianDenominatorEnvelope.inverse_sq_box/companion_inverse_sq_box"
DEFAULT_OUTPUT = Path(__file__).resolve().parents[1] / "data/analytic-envelope-cells/certificate.json"


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def sha256(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def stable_json(value: object) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"))


def geometry(cell: dict) -> tuple:
    """Exact geometry, excluding numerical evaluation-policy annotations."""
    s = tuple(map(Q, cell["s"]))
    aux = tuple(map(Q, cell["aux"]))
    require(len(s) == len(aux) == 2, "a rectangle needs two endpoints per axis")
    require(s[0] < s[1] and aux[0] < aux[1], "nonpositive rectangle width")
    require(cell["chart"] in ("direct", "reciprocal"), "unknown chart")
    return cell["chart"], cell["strip"], s, aux


def replay_partition(roots: list, splits: list, rows: list) -> None:
    frontier = {(k, ""): geometry(cell) for k, cell in enumerate(roots)}
    for split in splits:
        key = split["root"], split["path"]
        require(key in frontier, f"split is not an active leaf: {key}")
        chart, strip, s, aux = frontier.pop(key)
        axis = split["axis"]
        require(axis in ("s", "aux"), f"unknown split axis: {axis}")
        lo, hi = s if axis == "s" else aux
        midpoint = (lo + hi) / 2
        for side, bounds in enumerate(((lo, midpoint), (midpoint, hi))):
            child = (chart, strip, bounds, aux) if axis == "s" else (chart, strip, s, bounds)
            frontier[key[0], key[1] + str(side)] = child
    actual = {}
    for row in rows:
        key = row["root"], row["path"]
        require(key not in actual, f"duplicate terminal cell: {key}")
        actual[key] = geometry(row["cell"])
    require(actual == frontier, "terminal cells do not equal the complete midpoint frontier")


def model_range(model: dict, *, constant: bool = False) -> tuple[Q, Q]:
    unit = 2 ** model["bits"]
    require(model["bits"] >= 0, "negative model precision")
    terms = {}
    for i, j, value in model["coefficients"]:
        require(i >= 0 and j >= 0 and (i, j) not in terms, "invalid polynomial index")
        require(not constant or (i, j) == (0, 0), "envelope output is not a constant model")
        terms[i, j] = int(value)
    center = terms.get((0, 0), 0)
    radius = sum(abs(value) for index, value in terms.items() if index != (0, 0))
    lo, hi = map(int, model["remainder"])
    require(lo <= hi, "reversed model remainder")
    return Q(center - radius + lo, unit), Q(center + radius + hi, unit)


def rounded_interval(lo: Q, hi: Q, bits: int) -> tuple[Q, Q]:
    unit = 2 ** bits
    low = lo * unit
    high = hi * unit
    return Q(low.numerator // low.denominator, unit), Q(-((-high.numerator) // high.denominator), unit)


def envelope_parameters(row: dict) -> tuple[dict, dict, dict]:
    env = row["envelope"]
    chart, _, (slo, shi), (alo, ahi) = geometry(row["cell"])
    require(Q(env["radial_lower"]) == slo and Q(env["radial_upper"]) == shi,
            "envelope radial bounds differ from cell geometry")
    require(slo >= 0, "negative radial lower bound")
    xbound, kbound, exp_upper = map(Q, (env["aux_abs_upper"], env["profile_abs_upper"], env["exp_upper"]))
    require(xbound == max(abs(alo), abs(ahi)), "auxiliary bound does not match the cell")
    profile_range = model_range(env["profile_model"])
    require(kbound == max(map(abs, profile_range)), "profile absolute bound does not match its model")
    require(exp_upper > 0, "nonpositive exponential candidate")
    if chart == "direct":
        require(env["rule"] == DIRECT_RULE, "wrong analytic rule for direct chart")
        first = 2 * shi * exp_upper
        companion = 4 * kbound * exp_upper
    else:
        require(env["rule"] == RECIPROCAL_RULE, "wrong analytic rule for reciprocal chart")
        require(slo > 0, "reciprocal envelope requires a positive radial lower bound")
        power = env["power"]
        require(isinstance(power, int) and 0 <= power <= 32, "unexpected reciprocal power")
        denominator = Q(env["denominator_upper"])
        require(denominator == xbound**2 + kbound**2, "incorrect denominator upper bound")
        base = exp_upper * factorial(power + 2) * denominator**power / slo**(power + 2)
        first = 2 * shi * xbound**2 * base
        companion = 2 * kbound * xbound**2 * (power + 4) * base
    require(first == Q(env["first_upper"]), "stored first formula differs from exact analytic formula")
    require(companion == Q(env["companion_abs_upper"]), "stored companion formula differs from exact analytic formula")
    require(len(row["models"]) == len(row["integrals"]) == 2, "expected both base-pair outputs")
    area = (shi - slo) * (ahi - alo)
    for model, claimed, target in zip(row["models"], row["integrals"], ((Q(0), first), (-companion, companion))):
        actual = model_range(model, constant=True)
        require(actual == rounded_interval(*target, model["bits"]), "model is not the exact outward-rounded envelope")
        require(tuple(map(Q, claimed)) == tuple(area * endpoint for endpoint in actual),
                "stored integral differs from the exact area-weighted envelope")
    requests = row["scalar_exp_requests"]
    require(len(requests) == 1, "analytic envelope needs exactly one scalar exponential input")
    key, request = next(iter(requests.items()))
    require(Q(key) == Q(request["input"]) == -slo, "wrong scalar exponential input")
    require(Q(request["lo"]) == 0 and Q(request["hi"]) == exp_upper, "scalar request differs from envelope")
    profile = {
        "radial_bounds": row["cell"]["s"],
        "profile_abs_upper": env["profile_abs_upper"],
        "model": env["profile_model"],
    }
    exponential = {"input": str(-slo), "upper": env["exp_upper"]}
    parameters = {k: v for k, v in env.items() if k not in {
        "profile_model", "profile_abs_upper", "radial_lower", "radial_upper", "exp_upper",
        "first_upper", "companion_abs_upper",
    }}
    return profile, exponential, parameters


def extract(parent_raw: bytes, finish_raw: bytes, source_raw: bytes) -> dict:
    parent, finish = json.loads(parent_raw), json.loads(finish_raw)
    return extract_payloads(parent, finish, source_raw, sha256(parent_raw), sha256(finish_raw))


def extract_payloads(parent: dict, finish: dict, source_raw: bytes,
                     parent_sha: str, finish_sha: str) -> dict:
    source_sha = sha256(source_raw)
    require(parent_sha == PINNED_PARENT_SHA256, "parent input is not the pinned candidate")
    require(finish_sha == PINNED_FINISH_SHA256, "finish input is not the pinned candidate")
    require(finish["parent_candidate_sha256"] == parent_sha, "finish input names another parent")
    require(parent["profile_input_sha256"] == finish["profile_input_sha256"] == source_sha,
            "profile source hash mismatch")
    source = json.loads(source_raw)
    require(len(source["profileCoefficients"]) == 12, "unexpected profile coefficient count")
    require(not finish["pending"], "finish input still has unresolved cells")
    roots = parent["roots"]
    splits = parent["splits"] + finish["extra_splits"]
    rows = parent["accepted"] + finish["leaves"]
    require(len(roots) == 14 and len(rows) == 19161, "unexpected full partition size")
    require(len(rows) == len(roots) + len(splits), "split/leaf count mismatch")
    replay_partition(roots, splits, rows)
    profiles, exponentials, cells = [], [], []
    profile_ids, exponential_ids = {}, {}
    for origin, records in (("parent", parent["accepted"]), ("finish", finish["leaves"])):
        for record_index, row in enumerate(records):
            if row.get("envelope") is None:
                continue
            profile, exponential, parameters = envelope_parameters(row)
            profile_key = stable_json(profile)
            if profile_key not in profile_ids:
                profile_ids[profile_key] = len(profiles)
                profiles.append(profile)
            exponential_key = exponential["input"]
            if exponential_key not in exponential_ids:
                exponential_ids[exponential_key] = len(exponentials)
                exponentials.append(exponential)
            exp_index = exponential_ids[exponential_key]
            require(exponentials[exp_index] == exponential, "inconsistent bounds for a shared exponential input")
            cells.append({
                "root": row["root"], "path": row["path"], "cell": row["cell"],
                "profile_context": profile_ids[profile_key], "exponential_input": exp_index,
                "parameters": parameters, "models": row["models"], "integrals": row["integrals"],
                "provenance": {"input": origin, "record_index": record_index},
            })
    charts = Counter(cell["cell"]["chart"] for cell in cells)
    require(len(cells) == 183 and charts == {"direct": 54, "reciprocal": 129}, "unexpected envelope classification")
    require(len(profiles) == 104 and len(exponentials) == 83, "unexpected deduplicated context counts")
    return {
        "schema_version": 1,
        "agent": "codex-2ca4",
        "status": "External numerical candidates; actual profile, exponential and kernel bounds still require Lean replay.",
        "provenance": {
            "parent_sha256": parent_sha, "finish_sha256": finish_sha, "profile_source_sha256": source_sha,
            "parent_recorded_recipe_sha256": parent["recipe_sha256"],
            "parent_recorded_seed_partition_sha256": parent["seed_partition_sha256"],
            "finish_recorded_recipe_sha256": finish["recipe_sha256"],
        },
        "source_polynomial": "source-polynomial.json",
        "counts": {
            "roots": len(roots), "splits": len(splits), "full_partition_leaves": len(rows),
            "envelope_leaves": len(cells), "algebraic_leaves": len(rows) - len(cells),
            "direct_envelopes": charts["direct"], "reciprocal_envelopes": charts["reciprocal"],
            "profile_contexts": len(profiles), "exponential_inputs": len(exponentials),
        },
        "roots": roots, "splits": splits, "profile_contexts": profiles,
        "exponential_inputs": exponentials, "cells": cells,
    }


def make_packed(parent_raw: bytes, finish_raw: bytes) -> bytes:
    """Keep all geometry and envelope records, omitting algebraic model arrays.

    Original raw-file hashes are checked before packing, then retained as
    provenance. They cannot be recomputed from a reduced source pack. The
    packed input has a separate pinned byte hash, checked on every replay.
    """
    require(sha256(parent_raw) == PINNED_PARENT_SHA256, "wrong parent for source pack")
    require(sha256(finish_raw) == PINNED_FINISH_SHA256, "wrong finish for source pack")
    parent, finish = json.loads(parent_raw), json.loads(finish_raw)

    def compact_row(row: dict) -> dict:
        if row.get("envelope") is not None:
            return row
        return {key: row[key] for key in ("root", "path", "cell")}

    pack = {
        "schema_version": 1,
        "agent": "codex-2ca4",
        "status": "Extracted numerical source, not a Lean certificate; original raw hashes are retained provenance.",
        "original_parent_sha256": PINNED_PARENT_SHA256,
        "original_finish_sha256": PINNED_FINISH_SHA256,
        "parent": {
            **{key: parent[key] for key in ("roots", "splits", "profile_input_sha256",
                                           "recipe_sha256", "seed_partition_sha256")},
            "accepted": [compact_row(row) for row in parent["accepted"]],
        },
        "finish": {
            **{key: finish[key] for key in ("extra_splits", "pending", "parent_candidate_sha256",
                                           "profile_input_sha256", "recipe_sha256")},
            "leaves": [compact_row(row) for row in finish["leaves"]],
        },
    }
    compressed = bytearray(gzip.compress(stable_json(pack).encode(), compresslevel=9, mtime=0))
    # gzip.compress may record the host OS even with mtime=0. Keep the header
    # independent of whether the pinned sources are replayed on macOS or Linux.
    compressed[9] = 255
    return bytes(compressed)


def extract_packed(packed_raw: bytes, source_raw: bytes) -> dict:
    require(sha256(packed_raw) == PINNED_PACK_SHA256, "source pack byte hash mismatch")
    pack = json.loads(gzip.decompress(packed_raw))
    require(pack["schema_version"] == 1, "unsupported source pack version")
    return extract_payloads(pack["parent"], pack["finish"], source_raw,
                            pack["original_parent_sha256"], pack["original_finish_sha256"])


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--parent", type=Path, help="Pinned parent base-pair-cover.json")
    parser.add_argument("--finish", type=Path, help="Replacement base-pair-finish.json")
    parser.add_argument("--source", type=Path, help="Hash-pinned profile source; defaults beside --packed-input")
    parser.add_argument("--packed-input", type=Path, help="Self-contained compact source-pack.json.gz")
    parser.add_argument("--write-packed", type=Path, help="Also reproduce a source pack from the raw inputs")
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--check", action="store_true", help="Compare with committed outputs; do not write")
    args = parser.parse_args()
    if args.packed_input:
        if args.parent or args.finish or args.write_packed:
            parser.error("--packed-input cannot be combined with raw inputs or --write-packed")
        source_path = args.source or args.packed_input.parent / "source-polynomial.json"
        source_raw = source_path.read_bytes()
        result = extract_packed(args.packed_input.read_bytes(), source_raw)
    else:
        if not (args.parent and args.finish and args.source):
            parser.error("supply --packed-input, or all of --parent, --finish and --source")
        source_raw = args.source.read_bytes()
        parent_raw, finish_raw = args.parent.read_bytes(), args.finish.read_bytes()
        result = extract(parent_raw, finish_raw, source_raw)
        if args.write_packed:
            packed_raw = make_packed(parent_raw, finish_raw)
            if args.check:
                require(args.write_packed.read_bytes() == packed_raw, "source pack differs from raw-input extraction")
            else:
                args.write_packed.parent.mkdir(parents=True, exist_ok=True)
                args.write_packed.write_bytes(packed_raw)
    output_raw = (json.dumps(result, indent=2, sort_keys=True) + "\n").encode()
    source_output = args.output.parent / "source-polynomial.json"
    if args.check:
        require(args.output.read_bytes() == output_raw, "generated certificate differs from existing output")
        require(source_output.read_bytes() == source_raw, "copied profile source differs from pinned input")
    else:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_bytes(output_raw)
        source_output.write_bytes(source_raw)
    print(json.dumps({"check": args.check, "certificate_sha256": sha256(output_raw),
                      "certificate_bytes": len(output_raw), "counts": result["counts"]}, sort_keys=True))


if __name__ == "__main__":
    main()

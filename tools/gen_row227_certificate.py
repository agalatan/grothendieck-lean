#!/usr/bin/env python3
"""Exact inputs for the original row227 Lean certificate.

Agent-ID: codex-aa04. Refs #293, #21.
No historical floating enclosure is consumed. This generator uses only the
pinned midpoint, scalar center and original payload. Its independently
structured verifier checks each outward inclusion and every selected address.
The emitted transcript is certificate input, not a substitute for Lean proof.
"""

from __future__ import annotations

import argparse
from fractions import Fraction
import gzip
import hashlib
import json
from math import isqrt
from pathlib import Path
import struct


ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "data/original-row227-certificate"
BITS, HORIZON, TRIANGLE = 768, 2546, 502
SOURCE_BITS, SOURCE_CUTOFF = 1024, 532
SOURCE_START, SOURCE_END = 8121379, 8157156
PINS = {
    "data/original-moment-seed/row227-charge-replay.json":
        "05ca9474e8e5994b201cb6c56f93ef1c2fd855ab5ff8b63c0dfbaec3ca71015f",
    "data/original-row227-binding/row227-common-scalar-budget.json":
        "cdd4b1f7e530955fec067db6d82530f578a5bfd136e2b4a9668124b82dbdc5de",
    "data/original-row227-certificate/row227.bin":
        "85f6792a14d4c198979bfc9ea6c513b765bd76147cc4fe0d0a9566addae48d1c",
    "data/original-row227-certificate/row227-ledger.jsonl":
        "9e766df3dd1874356d3d7c5506b063b2051531e4677d6dda796a6fdf1def3146",
}


def require(condition, message):
    if not condition:
        raise ValueError(message)


def ceildiv(n, d):
    require(d > 0, "positive denominator")
    return -((-n) // d)


def ceil_sqrt(n):
    r = isqrt(n)
    return r + (r * r != n)


def rank(c, d):
    """Production natural-subtraction formula, not list enumeration."""
    m = c + d
    return max(0, max(0, m + m * m // 4 - max(0, m - 266) * max(0, m - 265) // 2)
               + c - max(0, m - 265))


def triangle_keys():
    return [(c, d) for c in range(252) for d in range(max(0, c - 1), TRIANGLE - c)]


def selected_keys():
    return [(c, d) for d in range(251) for c in range(d + 2)]


def storage_keys():
    return [(c, degree - c) for degree in range(SOURCE_CUTOFF)
            for c in range(max(0, degree - 265), min(266, degree, (degree + 1) // 2) + 1)]


def check_scalar_receipt(receipt, midpoint):
    """Replay the rational budget already bound to actual S by PR290.

    This validates arithmetic provenance; the Lean consumer must still use
    ConditionalSourceRow227Scalar's actual integral theorem.
    """
    def rat(record):
        return Fraction(int(record["numerator"]), int(record["denominator"]))

    exact, actual = receipt["exact_inputs"], receipt["actual_scalar"]
    a = Fraction(midpoint, 1 << SOURCE_BITS)
    require(rat(exact["A_midpoint"]) == a, "scalar midpoint binding")
    lo = rat(exact["sqrtPi_lower"]) * a * rat(exact["J0_lower"]) / 2
    hi = rat(exact["sqrtPi_upper"]) * a * rat(exact["J0_upper"]) / 2
    shat = Fraction(int(actual["dyadic_midpoint_numerator"]), 1 << SOURCE_BITS)
    require(lo == rat(actual["lower"]) and hi == rat(actual["upper"]), "scalar endpoint identity")
    require(Fraction(49, 50) < lo <= hi, "scalar positive lower bound")
    radius = max(abs(lo - shat), abs(hi - shat))
    require(radius <= Fraction(784, 10**24), "scalar center error")
    require(radius / Fraction(49, 50) <= Fraction(800, 10**24), "once-only scalar error")
    require(abs(shat) <= 1, "scalar center norm")


def load_inputs(root=ROOT):
    for name, digest in PINS.items():
        require(hashlib.sha256((root / name).read_bytes()).hexdigest() == digest,
                f"input digest: {name}")
    charge = json.loads((root / "data/original-moment-seed/row227-charge-replay.json").read_text())
    scalar = json.loads((root / "data/original-row227-binding/row227-common-scalar-budget.json").read_text())
    ledger = json.loads((root / "data/original-row227-certificate/row227-ledger.jsonl").read_text())
    payload = (root / "data/original-row227-certificate/row227.bin").read_bytes()
    require(int(charge["denominator"]) == 1 << SOURCE_BITS, "midpoint scale")
    require(int(charge["ratio_terminal"]) == HORIZON, "ratio horizon")
    require(int(scalar["actual_scalar"]["dyadic_midpoint_denominator"]) == 1 << SOURCE_BITS,
            "scalar center scale")
    require(ledger["index"] == 227 and ledger["cutoff"] == SOURCE_CUTOFF, "ledger address")
    require(ledger["sha256"] == PINS["data/original-row227-certificate/row227.bin"], "ledger payload")
    require(len(payload) == 8 * (SOURCE_END - SOURCE_START), "payload byte count")
    check_scalar_receipt(scalar, int(charge["A_midpoint"]))
    return (int(charge["A_midpoint"]),
            int(scalar["actual_scalar"]["dyadic_midpoint_numerator"]),
            struct.unpack("<" + "Q" * (len(payload) // 8), payload))


def mul(a, b, scale):
    products = [x * y for x in a for y in b]
    return min(products) // scale, ceildiv(max(products), scale)


def div(a, b, scale):
    require(b[0] > 0, "positive interval denominator")
    return mul(a, (scale * scale // b[1], ceildiv(scale * scale, b[0])), scale)


def decode_scaled(word):
    """Exact production normal binary64 scalar on scale 2^(1024+768)."""
    exponent = (word >> 52) & 2047
    require(0 <= word < 1 << 64 and 1 <= exponent <= 1023, "normal binary64 word")
    mantissa = (1 << 52) + (word & ((1 << 52) - 1))
    if word >> 63:
        mantissa = -mantissa
    return mantissa << (SOURCE_BITS + BITS + exponent - 1075)


def generate(inputs):
    midpoint, scalar, words = inputs
    q = 1 << BITS
    a = (midpoint * q // (1 << SOURCE_BITS), ceildiv(midpoint * q, 1 << SOURCE_BITS))
    x = mul(a, a, q)
    ratios = [None] * (HORIZON + 1)
    ratios[HORIZON] = (0, q)
    for h in reversed(range(HORIZON)):
        lo_next, hi_next = ratios[h + 1]
        lower_den = (h + 2) * q * q + x[1] * (q - lo_next)
        upper_den = (h + 2) * q * q + x[0] * (q - hi_next)
        numerator = (2 * h + 1) * q**3
        ratios[h] = (numerator // (2 * lower_den), ceildiv(numerator, 2 * upper_den))
    roots = []
    for n in range(TRIANGLE):
        lo = isqrt(n * q * q)
        roots.append((lo, lo + (lo * lo != n * q * q)))
    table = {(0, 0): (q, q)}
    for d in range(TRIANGLE - 1):
        table[0, d + 1] = div(mul(mul((-a[1], -a[0]), ratios[d], q), table[0, d], q), roots[d + 1], q)
    for c in range(1, 252):
        for d in range(max(0, c - 1), TRIANGLE - c):
            left = mul(div(roots[d + 1], roots[c], q), table[c - 1, d + 1], q)
            charge = (d + 2 - c) * q
            right = mul(div((charge, charge), mul(a, roots[c], q), q), table[c - 1, d], q)
            table[c, d] = (left[0] + right[0], left[1] + right[1])
    selected = []
    for c, d in selected_keys():
        lo, hi = table[c, d]
        center = (lo + hi) // 2
        index = rank(c, d)
        selected.append([c, d, index, words[index], center, max(center - lo, hi - center),
                         scalar * center - decode_scaled(words[index])])
    return {"schema": 1, "bits": BITS, "horizon": HORIZON, "triangle": TRIANGLE,
            "source_cutoff": SOURCE_CUTOFF, "midpoint": midpoint, "scalar_center": scalar,
            "shift": a, "squared_shift": x, "ratios": ratios, "roots": roots,
            "coefficients": [[c, d, *table[c, d]] for c, d in triangle_keys()],
            "selected": selected}


def verify(packet, inputs):
    """Check coverage and inequalities, allowing any sound outward checkpoints.

    This intentionally does not compare a transcript with generate(). A bad
    endpoint, dropped mode or original-word mismatch must fail on its own.
    Lean will prove the analytic interpretation separately.
    """
    midpoint, scalar, words = inputs
    q = 1 << BITS
    for key, value in [("schema", 1), ("bits", BITS), ("horizon", HORIZON),
                       ("triangle", TRIANGLE), ("source_cutoff", SOURCE_CUTOFF),
                       ("midpoint", midpoint), ("scalar_center", scalar)]:
        require(packet[key] == value, f"header {key}")
    a, x = packet["shift"], packet["squared_shift"]
    require(0 < a[0] <= a[1] and a[0] * (1 << SOURCE_BITS) <= midpoint * q <= a[1] * (1 << SOURCE_BITS),
            "actual midpoint enclosure")
    require(0 <= x[0] * q <= a[0] * a[0] and a[1] * a[1] <= x[1] * q, "squared shift enclosure")
    ratios, roots = packet["ratios"], packet["roots"]
    require(len(ratios) == HORIZON + 1 and len(roots) == TRIANGLE, "ratio/root coverage")
    require(ratios[-1][0] <= 0 and q <= ratios[-1][1], "terminal unit interval")
    for h, (lo, hi) in enumerate(ratios):
        require(0 <= lo <= hi <= q, "ratio unit interval")
        if h == HORIZON:
            continue
        nl, nu = ratios[h + 1]
        den_lo = (h + 2) * q * q + x[1] * (q - nl)
        den_hi = (h + 2) * q * q + x[0] * (q - nu)
        require(2 * lo * den_lo <= (2 * h + 1) * q**3 <= 2 * hi * den_hi, f"ratio step {h}")
    for n, (lo, hi) in enumerate(roots):
        require(0 <= lo <= hi and lo * lo <= n * q * q <= hi * hi, f"root {n}")
        require(n == 0 or lo > 0, f"positive root {n}")
    require([(c, d) for c, d, _, _ in packet["coefficients"]] == triangle_keys(), "exact triangle coverage")
    table = {(c, d): (lo, hi) for c, d, lo, hi in packet["coefficients"]}
    require(table[0, 0][0] <= q <= table[0, 0][1], "normalized seed")
    for (c, d), (lo, hi) in table.items():
        require(lo <= hi, "ordered coefficient endpoints")
        if c == d == 0:
            continue
        if c == 0:
            expected = div(mul(mul((-a[1], -a[0]), ratios[d - 1], q), table[0, d - 1], q), roots[d], q)
        else:
            first = mul(div(roots[d + 1], roots[c], q), table[c - 1, d + 1], q)
            z = (d + 2 - c) * q
            second = mul(div((z, z), mul(a, roots[c], q), q), table[c - 1, d], q)
            expected = (first[0] + second[0], first[1] + second[1])
        require(lo <= expected[0] <= expected[1] <= hi, f"signed recurrence {c},{d}")
    pairs = storage_keys()
    require(len(pairs) == len(words) == SOURCE_END - SOURCE_START, "original word coverage")
    require(all(rank(c, d) == j for j, (c, d) in enumerate(pairs)), "production rank vs source order")
    require([(r[0], r[1]) for r in packet["selected"]] == selected_keys(), "exact selected coverage")
    u_sq = saved_sq = 0
    for c, d, index, word, center, radius, delta in packet["selected"]:
        require(index == rank(c, d) and 0 <= index < len(words), "selected rank")
        require(word == words[index], "original saved word")
        lo, hi = table[c, d]
        require(radius >= 0 and center - radius <= lo <= hi <= center + radius, "selected enclosure radius")
        require(delta == scalar * center - decode_scaled(word), "decoded saved difference")
        u_sq += radius * radius
        saved_sq += delta * delta
    require(u_sq * 10**80 <= (157 * q)**2, "normalized vector budget")
    require(saved_sq * 10**48 <= (13759969 * (1 << (SOURCE_BITS + BITS)))**2, "saved vector budget")
    require(abs(scalar) <= 1 << SOURCE_BITS, "scalar center norm")
    total = Fraction(800, 10**24) + Fraction(157, 10**40) + Fraction(13759969, 10**24)
    require(total < Fraction(14, 10**18), "combined midpoint margin")
    return {"triangle_entries": len(table), "ratio_transitions": HORIZON,
            "source_words": len(words), "selected_modes": len(packet["selected"]),
            "normalized_sum_sq": str(u_sq), "saved_sum_sq": str(saved_sq),
            "normalized_radius_ceiling": str(Fraction(ceil_sqrt(u_sq), q)),
            "saved_radius_ceiling": str(Fraction(ceil_sqrt(saved_sq), 1 << (SOURCE_BITS + BITS))),
            "boundary_rank": rank(251, 250), "status": "EXACT_ARITHMETIC_NOT_LEAN_ACCEPTANCE"}


def encoded(packet):
    # Integer literals are decimal and never routed through a binary float.
    return (json.dumps(packet, separators=(",", ":"), sort_keys=True) + "\n").encode()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    inputs = load_inputs()
    packet = generate(inputs)
    evidence = verify(packet, inputs)
    raw = encoded(packet)
    outputs = {
        "certificate.json.gz": gzip.compress(raw, compresslevel=9, mtime=0),
        "arithmetic-verification.json": (json.dumps({"agent": "codex-aa04", "inputs": PINS,
            "transcript_sha256": hashlib.sha256(raw).hexdigest(), **evidence}, indent=2) + "\n").encode(),
    }
    for name, content in outputs.items():
        target = DATA / name
        if args.check:
            require(target.read_bytes() == content, f"reproduction: {name}")
        else:
            target.write_bytes(content)
    print(json.dumps({k: evidence[k] for k in ("triangle_entries", "ratio_transitions", "source_words",
                                             "selected_modes", "boundary_rank", "status")}, indent=2))


if __name__ == "__main__":
    main()

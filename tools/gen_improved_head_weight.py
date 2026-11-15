# tools/gen_improved_head_weight.py
"""Reproduce the longer-prefix costs with exact outward-rounded arithmetic.

Agent-ID: codex-9b17. Refs #379.
This generator proposes the two finite mass ceilings. Their acceptance is an
independent Lean native check in Grothe.Upper.ImprovedHeadWeightFacts. No floating
point values are used in either calculation. The weighted geometric remainder
and its analytic interpretation are separately proved in Lean.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from math import isqrt
from pathlib import Path
import re
import time

from head_weights import D, Z, Weights, conv, mul, ofrat

ROOT = Path(__file__).resolve().parents[1]
PREFIX = 51
TAIL = Q(1, 50000000)
GRID = 10**15


def conv_take(a, b, count):
    """The first `count` coefficients of the unchanged interval convolution."""
    if not a or not b or not count:
        return []
    out = [Z] * min(count, len(a) + len(b) - 1)
    for i, x in enumerate(a[:count]):
        if x == Z:
            continue
        for j, y in enumerate(b[:count - i]):
            if y == Z:
                continue
            lo, hi = mul(x, y)
            old_lo, old_hi = out[i + j]
            out[i + j] = old_lo + lo, old_hi + hi
    return out


def powers(coefficients, count):
    coefficients = list(map(ofrat, coefficients))
    out = [[(D, D)]]
    for _ in range(count):
        out.append(conv_take(coefficients, out[-1], PREFIX))
    return out


def sqrt_up(x):
    numerator = isqrt(x.numerator * GRID**2 // x.denominator)
    if numerator**2 * x.denominator < x.numerator * GRID**2:
        numerator += 1
    ceiling = Q(numerator, GRID)
    assert (ceiling - Q(1, GRID))**2 < x <= ceiling**2
    return ceiling


def main(check):
    if not __debug__:
        raise RuntimeError("Run without -O: assertions are certificate checks")
    started = time.monotonic()
    source = ROOT / "data/upper-preprocess/certificate.json"
    data = json.loads(source.read_text())
    p, q = list(map(Q, data["pList"])), list(map(Q, data["qList"]))
    entries = [(n, m, Q(value)) for n, m, value in data["energies"]]
    error = Q(data["energyErrQ"])
    assert all(value >= 0 and n + 3*m <= 501 for n, m, value in entries)
    assert len({(n, m) for n, m, _ in entries}) == len(entries)
    radius = Q(3, 2)
    p_norm = sum(abs(value) * radius**i for i, value in enumerate(p))
    q_norm = sum(abs(value) * radius**i for i, value in enumerate(q[1:]))
    p_cap, q_cap = Q(10049, 10000), Q(10023, 10000)
    tail_bound = p_cap**501 * q_cap**167 / radius**PREFIX
    assert p_norm <= p_cap and q_norm <= q_cap and tail_bound <= TAIL

    pp, qq = powers(p, 501), powers(q[1:], 167)
    old_weights = Weights(data["pList"], data["qList"])
    # Independent full-convolution spot checks validate the truncation shortcut.
    for n, m in [(0, 0), (1, 1), (23, 17), (102, 48), (501, 167)]:
        for count in [1, 21, 51]:
            assert conv_take(pp[n], qq[m], count) == conv(pp[n], qq[m])[:count]

    masses = {11: Q(0), 51: Q(0)}
    old_masses = {11: Q(0), 51: Q(0)}
    strict_improvements = 0
    for index, (n, m, energy) in enumerate(entries):
        retained = max(0, 251 - (n//2 + m//2 + m))
        prefix = conv_take(pp[n], qq[m], min(retained, PREFIX))
        prefix_cost = Q(sum(max(-lo, hi, 0) for lo, hi in prefix), D)
        old = old_weights(n, m)
        weight = min(old, Q(1), max(Q(0), prefix_cost +
            (TAIL if PREFIX < retained else Q(0))))
        assert 0 <= weight <= old <= 1
        strict_improvements += weight < old
        for cutoff in masses:
            if cutoff < n + m:
                masses[cutoff] += energy * weight**2
                old_masses[cutoff] += energy * old**2
        if (index + 1) % 2000 == 0:
            print(f"{index + 1}/{len(entries)} columns; "
                  f"{time.monotonic() - started:.1f}s", flush=True)

    caps = {cutoff: sqrt_up(mass + error) for cutoff, mass in masses.items()}
    relevant_source = {key: data[key] for key in
                       ["pList", "qList", "energies", "energyErrQ"]}
    recipe = {
        "agent_id": "codex-9b17",
        "scope": "Exact finite mass proposals; acceptance and analytic soundness are checked in Lean.",
        "method": "128-bit outward interval prefix, at most 51 unshifted coefficients, "
                  "plus 1/50000000 if any retained coefficients remain; minimum with original cost.",
        "source_sha256": hashlib.sha256(source.read_bytes()).hexdigest(),
        "relevant_source_sha256": hashlib.sha256(json.dumps(relevant_source,
            sort_keys=True, separators=(",", ":")).encode()).hexdigest(),
        "generator_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "interval_helper_sha256": hashlib.sha256((ROOT / "tools/head_weights.py").read_bytes()).hexdigest(),
        "scale_bits": 128,
        "prefix_length": PREFIX,
        "radius": str(radius),
        "p_scaled_norm": str(p_norm),
        "q_scaled_norm": str(q_norm),
        "p_scaled_cap": str(p_cap),
        "q_scaled_cap": str(q_cap),
        "tail_bound": str(tail_bound),
        "tail_reserve": str(TAIL),
        "table_l1_error": str(error),
        "entries": len(entries),
        "strictly_improved_entries": strict_improvements,
        "bands": [{"lo": cutoff, "hi": 0, "old_weighted_mass": str(old_masses[cutoff]),
            "improved_weighted_mass": str(masses[cutoff]), "norm_cap": str(caps[cutoff]),
            "square_margin": str(caps[cutoff]**2 - masses[cutoff] - error)}
            for cutoff in [51, 11]],
    }
    recipe_text = json.dumps(recipe, indent=2) + "\n"
    recipe_path = ROOT / "data/improved-head-weight/recipe.json"
    def rat(value):
        return f"({value.numerator} : ℚ) / {value.denominator}"
    generated = "\n".join([
        "-- BEGIN GENERATED MASS CAPS: tools/gen_improved_head_weight.py",
        "/-- Mass square-root ceilings; the four low-band caps retain their existing values. -/",
        "def improvedThreeBandMassQ (j : Fin 7) : ℚ :=",
        f"  if j = 2 then {rat(caps[51])} else",
        f"  if j = 4 then {rat(caps[51])} else",
        f"  if j = 6 then {rat(caps[11])} else",
        "  if j = 0 then comparisonBands[0].norm else",
        "  if j = 1 then comparisonBands[1].norm else",
        "  if j = 3 then comparisonBands[8].norm else comparisonBands[13].norm",
        "-- END GENERATED MASS CAPS",
    ])
    lean_path = ROOT / "Grothe/Upper/ImprovedHeadWeightData.lean"
    lean_text = lean_path.read_text()
    pattern = r"-- BEGIN GENERATED MASS CAPS:.*?-- END GENERATED MASS CAPS"
    replacement, count = re.subn(pattern, lambda _: generated, lean_text, flags=re.S)
    assert count == 1
    if check:
        assert recipe_path.read_text() == recipe_text, "stale improved-head-weight recipe"
        assert lean_text == replacement, "stale improved-head-weight Lean caps"
    else:
        recipe_path.parent.mkdir(parents=True, exist_ok=True)
        recipe_path.write_text(recipe_text)
        lean_path.write_text(replacement)
    for cutoff in [51, 11]:
        print(f"n+m>{cutoff}: norm cap {caps[cutoff]}; "
              f"grid numerator {int(caps[cutoff] * GRID)} / {GRID}", flush=True)
    print(f"{strict_improvements} costs strictly improved; "
          f"finished in {time.monotonic() - started:.1f}s", flush=True)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    main(parser.parse_args().check)

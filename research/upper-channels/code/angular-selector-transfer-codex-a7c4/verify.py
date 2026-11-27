"""Verify the fixed upper mixtures and the six-column dual. Agent-ID: codex-a7c4."""

import argparse
from fractions import Fraction
import json
from pathlib import Path
import re
import sys

from flint import acb, arb, ctx
from math import comb

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from selector import require, selector_columns

CODE = HERE.parent
ROOT = CODE.parents[2]
MAX_INDEX = 320
PHASE_CAPS = [45093333, 44082953, 28458209, 88593460, 1, 53006658]
CURRENT = Fraction(711968558203721328194311213, 10**27)


def six_columns(sources):
    """Recompute each root column's outward interval head from the pinned source tables."""
    sys.path.insert(0, str(sources / "src18/tools"))
    import replay_private_upper_budget as replay

    sys.path.insert(0, str(CODE))
    import channels

    channels.R6 = sources / "src6"
    channels.check_six_params()
    overlap = Path("Grothe/UpperSix/Haagerup/Data/OverlapData.lean")
    require((ROOT / overlap).read_bytes() == (channels.R6 / overlap).read_bytes(), "current six overlap table")
    common = Path("Grothe/UpperSix/Haagerup/Parameters.lean")
    require((ROOT / common).read_bytes() == (channels.R6 / common).read_bytes(), "current six preprocessors")
    params = (ROOT / "Grothe/UpperSix/Certificate/Parameters.lean").read_text()
    first = params.split("def firstPolynomial : List ℚ := [", 1)[1].split("]", 1)[0]
    first_poly = [Fraction(int(x.strip().removesuffix(" / d12Q")), 10**12) for x in first.split(",")]
    tail_block = params.partition("def tailCap : Fin 6 → ℚ")[2]
    caps = [int(x) for x in re.findall(r"\| [0-5] => (\d+) / 10 \^ 15", tail_block)]
    variable = (ROOT / "Grothe/UpperSix/Certificate/Head.lean").read_text()
    phase = re.search(r"if p = 2 then (\d+) / 10 \^ 15 else tailCap p", variable)
    require(len(caps) == 6 and phase is not None, "Lean root tail-cap declarations")
    caps[2] = int(phase.group(1))
    require(caps == PHASE_CAPS and "if p = 2 then 320 else 250" in variable, "Lean variable cutoff and caps")
    original_weights, params6, _ = channels.six_params()
    tiger, table = channels.six_tables()
    pi_interval = (replay.of_rat_lo(Fraction(314159265358979323846, 4 * 10**20)),
                   replay.of_rat_hi(Fraction(314159265358979323847, 4 * 10**20)))
    rows = []
    for index, (_, kind, primary, secondary) in enumerate(params6):
        primary = first_poly if index == 0 else primary
        length = MAX_INDEX + 1 if index == 2 else 251
        p = [replay.of_rat_i(x) for x in primary]
        q = [replay.of_rat_i(x) for x in secondary]
        if kind == "cell":
            head = replay.bivar_t(length, table, p, q, 501, 167)
        else:
            coeff = tiger
            if kind == "oned_haag":
                coeff = [replay.mul_i(pi_interval, replay.of_rat_i(x)) for x in replay.haag_list(length)]
            one_dimensional = [(0, [(2 * j + 1, coeff[j]) for j in range(length)])]
            head = replay.bivar_t(length, one_dimensional, p, [], 2 * length + 1, 0)
        rows.append([(Fraction(lo, replay.D), Fraction(hi, replay.D)) for lo, hi in head])
    return rows, [Fraction(v, 10**15) for v in caps], original_weights


def fixed_lower(rows, caps, weights):
    require(len(weights) <= len(rows) and len(rows) == len(caps), "input dimensions")
    require(all(w >= 0 for w in weights) and sum(weights) == 1, "convex mixture")
    linear = sum(w * row[0][0] for w, row in zip(weights, rows))
    nonlinear = Fraction(0)
    for index in range(1, MAX_INDEX + 1):
        paired = [(w, row[index]) for w, row in zip(weights, rows) if index < len(row)]
        lo = sum(w * pair[0] for w, pair in paired)
        hi = sum(w * pair[1] for w, pair in paired)
        nonlinear += max(abs(lo), abs(hi))
    return linear - nonlinear - sum(w * cap for w, cap in zip(weights, caps))


def six_dual(rows, caps, witness):
    signs = "".join(witness["dual_signs"])
    exceptions = {int(k): Fraction(v) for k, v in witness["dual_exceptions"].items()}
    require({i for i, s in enumerate(signs, 1) if s == "*"} == set(exceptions), "fractional dual coordinates")
    z = [exceptions[i] if s == "*" else {"+": 1, "-": -1}[s] for i, s in enumerate(signs, 1)]
    require(len(z) == MAX_INDEX and all(abs(t) <= 1 for t in z), "dual feasibility")
    return max(row[0][1] - cap + sum(max(t * lo, t * hi) for t, (lo, hi) in zip(z, row[1:]))
               for row, cap in zip(rows[:6], caps[:6]))


def check_low_grades(head, p, baths=1, strength=Fraction(17, 100)):
    """Independent binomial/power calculation, avoiding the verifier's three row recurrences."""
    ctx.prec = 150
    ab = lambda x: arb(x.numerator) / x.denominator
    size = 13
    reference = [arb(0) for _ in range(size)]
    r = arb.pi() / 4
    for k in range(size):
        degree = 2 * k + 1
        for f in range(k + 1):
            t = arb(strength.numerator * (2 * f + 1)) / strength.denominator
            freq_weight = Fraction(comb(degree, k - f), 4**k)
            for j in range(size - k):
                value = (acb(0, -2 * t * baths).exp() * comb(j + baths - 1, baths - 1)
                         * (-t * t)**j / acb(1, -t)**(2 * j + 2 * baths)).real
                for d in range(min(degree, size - k - j - 1) + 1):
                    coefficient = comb(degree, d) * p**(degree - d) * (p - 1)**d
                    reference[k + j + d] += r * ab(freq_weight * coefficient) * value
        r *= arb(degree**2) / (4 * (k + 1) * (k + 2))
    require(sum(abs(x - ab(y)) for x, y in zip(reference, head)) < arb(1) / 10**7,
            "independent selector head and reflection signs")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--sources", required=True, type=Path,
                        help="directory prepared by research/upper-channels/code/fetch_sources.sh")
    args = parser.parse_args()
    rows, caps, original_weights = six_columns(args.sources.resolve())
    old = fixed_lower(rows, caps, original_weights)
    require(CURRENT <= old < CURRENT + Fraction(1, 10**13), "published Lean fixed-weight budget")
    columns = selector_columns()
    for name, p in (("linear", Fraction(23, 25)), ("unit", Fraction(1))):
        head, cap = columns[name]
        check_low_grades(head, p)
        rows.append([(x, x) for x in head])
        caps.append(cap)
        threshold = Fraction("0.000048285") if name == "linear" else Fraction("0.000126603")
        require(cap < threshold, "selector approximation and tail budget")
        print(f"{name} selector allowance < {threshold}")

    witness = json.loads((HERE / "witness.json").read_text())
    values = []
    for count, name, target in ((7, "seven_weights", "0.7119685759810"),
                                (8, "eight_weights", "0.7119685767545")):
        weights = [Fraction(v, witness["weight_denominator"]) for v in witness[name]]
        require(len(weights) == count, "number of channels")
        slope = fixed_lower(rows, caps, weights)
        require(slope > Fraction(target), f"{count}-channel transfer")
        values.append(slope)
        print(f"{count} channels: D > {target}; exact reciprocal {1 / slope}")

    upper = six_dual(rows, caps, witness)
    require(upper < Fraction("0.7119685648573") and values[-1] - upper > Fraction("0.0000000118"),
            "separation from the six-column certificate with its paid caps")
    require(1 / values[-1] < Fraction("1.404556371"), "rounded transfer endpoint")
    print("Six-column paid-cap D < 0.7119685648573. Eight-channel reciprocal < 1.404556371.")


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Recover exact Gaussian moments of the frozen damped polynomial phase.

For independent standard proper complex Gaussians z,w, put U=|z|^2,
V=|w|^2, W=Re(conj(z)*w), D=Im(conj(z)*w), and
phi=D*exp(-epsilon*(U+V))*S(U,V,W).  The source is Upper/Data.lean.

All polynomial and moment arithmetic is integral/rational; no quadrature or
floating point enters a certified value.  The Gaussian integration identity is
derived in needle-20261023/MOMENTS.md; this script does not formalize it in Lean
or discharge the other comparison inputs.  Requires python-flint >= 0.9.

Run heavy powers only on the research droplet, in an owned directory, e.g.:
  nice -n 19 /home/agalatan/stable-venv/bin/python needle_phase_moments.py \
    --data Data.lean --powers 2 --max-seconds 110 --output phase2.json
The default POSIX wall-clock limit is less than two minutes.  Completed powers
are checkpointed individually when --output is provided.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import math
import platform
import re
import signal
import sys
import time
from decimal import Decimal, localcontext
from fractions import Fraction as Q
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def decimal(q: Q, digits: int = 40) -> str:
    """Display only: all decisions use exact fractions."""
    with localcontext() as context:
        context.prec = digits
        return str(Decimal(q.numerator) / Decimal(q.denominator))


def read_phase(path: Path) -> tuple[dict[tuple[int, int, int], Q], Q, dict]:
    raw = path.read_bytes()
    source = raw.decode()
    block = source.split("def phaseStrs : List String :=", 1)[1].split("/--", 1)[0]
    rows = re.findall(r'"(\d+),(\d+),(\d+):([^"]+)"', block)
    if len(rows) != len(re.findall(r'"[^"]*"', block)):
        raise ValueError("an unrecognized phase string would be omitted")
    terms: dict[tuple[int, int, int], Q] = {}
    for a, b, c, coefficient in rows:
        key = (int(a), int(b), int(c))
        if key in terms:
            raise ValueError(f"duplicate phase monomial {key}")
        terms[key] = Q(coefficient)
    eps_block = source.split("def phaseEpsQ : ℚ :=", 1)[1].split("/--", 1)[0]
    match = re.fullmatch(r"\s*\((-?\d+)\s*:\s*ℚ\)\s*/\s*(\d+)\s*", eps_block)
    if match is None:
        raise ValueError("unrecognized phaseEpsQ declaration")
    epsilon = Q(int(match[1]), int(match[2]))
    if not terms or epsilon <= 0:
        raise ValueError("expected a nonempty phase polynomial and positive damping")
    payload = {"epsilon": str(epsilon), "terms": [
        [*powers, str(value)] for powers, value in sorted(terms.items())]}
    metadata = {
        "source": str(path.resolve()),
        "source_sha256": hashlib.sha256(raw).hexdigest(),
        "phase_payload_sha256": hashlib.sha256(json.dumps(
            payload, separators=(",", ":"), sort_keys=True).encode()).hexdigest(),
        "phase_terms": len(terms),
        "phase_total_degree": max(map(sum, terms)),
        "epsilon": str(epsilon),
        "all_coefficients_dyadic": all(
            value.denominator & (value.denominator - 1) == 0 for value in terms.values()),
    }
    return terms, epsilon, metadata


def monomial_moment(j: int, a: int, b: int, w_power: int, epsilon: Q) -> Q:
    """The analytic monomial formula, evaluated directly as a rational."""
    if w_power % 2:
        return Q(0)
    k = w_power // 2
    s = j + k
    angular = Q(math.factorial(2 * j) * math.factorial(2 * k),
                4 ** s * math.factorial(j) * math.factorial(k) * math.factorial(s))
    rate = 1 + 2 * j * epsilon
    return angular * math.factorial(a + s) * math.factorial(b + s) / rate ** (a + b + 2 * s + 2)


def accumulate_moment(coefficients, j: int, epsilon: Q, denominator: int,
                      degree: int, fmpz) -> tuple[Q, dict]:
    """One integer accumulation, then one final rational reduction.

    coefficients are those of (denominator*S)^(2j), not S^(2j).
    max_s bounds j+k, and max_e bounds a+b+2j+2k+2.  The
    factorial quotients below are integers, so there is no per-term gcd.
    """
    max_s = j + degree // 2
    max_e = degree + 2 * j + 2
    rate = 1 + 2 * j * epsilon
    p, q = rate.numerator, rate.denominator
    pp = [p ** n for n in range(max_e + 1)]
    qp = [q ** n for n in range(max_e + 1)]
    four = [4 ** n for n in range(max_s + 1)]
    factorial = [math.factorial(n) for n in range(degree + max_s + 1)]
    j_factor = factorial[2 * j] // factorial[j]
    acc = fmpz(0)
    odd_skipped = 0
    included = 0
    digest = hashlib.sha256()
    for (a, b, w_power), coefficient in sorted(coefficients.items()):
        digest.update(f"{a},{b},{w_power}:{coefficient}\n".encode())
        if w_power % 2:
            odd_skipped += 1
            continue
        k = w_power // 2
        s = j + k
        e = a + b + 2 * s + 2
        assert s <= max_s and e <= max_e
        numerator = (factorial[a + s] // factorial[s]) * factorial[b + s]
        numerator *= j_factor * (factorial[2 * k] // factorial[k])
        acc += coefficient * numerator * qp[e] * pp[max_e - e] * four[max_s - s]
        included += 1
    den = denominator ** (2 * j) * four[max_s] * pp[max_e]
    result = Q(int(acc), den)
    if result < 0:
        raise ArithmeticError("an even phase moment cannot be negative")
    return result, {
        "expanded_terms": len(coefficients),
        "even_W_terms_integrated": included,
        "odd_W_terms_zero": odd_skipped,
        "integer_polynomial_power_sha256": digest.hexdigest(),
        "max_s": max_s,
        "max_e": max_e,
        "rate": str(rate),
        "unreduced_numerator_bits": int(acc).bit_length(),
        "unreduced_denominator_bits": den.bit_length(),
    }


def self_check(fmpz) -> None:
    """Check normalization and integer accumulation on independent small cases."""
    assert monomial_moment(1, 0, 0, 0, Q(0)) == Q(1, 2)
    assert monomial_moment(1, 0, 0, 2, Q(0)) == Q(1, 2)
    assert monomial_moment(2, 0, 0, 0, Q(0)) == Q(3, 2)
    assert monomial_moment(1, 0, 0, 1, Q(0)) == 0
    # S=(2U-3V+W)/5, with its square expanded by hand.
    square = {(2, 0, 0): 4, (0, 2, 0): 9, (0, 0, 2): 1,
              (1, 1, 0): -12, (1, 0, 1): 4, (0, 1, 1): -6}
    eps = Q(21, 20)
    accumulated, _ = accumulate_moment(square, 1, eps, 5, 2, fmpz)
    direct = sum((Q(c, 25) * monomial_moment(1, *powers, eps)
                  for powers, c in square.items()), Q(0))
    assert accumulated == direct


def save(result: dict, path: Path | None) -> None:
    data = json.dumps(result, indent=2) + "\n"
    if path is None:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(path.name + ".tmp")
    temporary.write_text(data)
    temporary.replace(path)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--data", type=Path, default=ROOT / "Grothe/Upper/Data.lean")
    parser.add_argument("--powers", type=int, nargs="+", choices=[2, 4, 6], default=[2, 4, 6])
    parser.add_argument("--max-seconds", type=int, default=110)
    parser.add_argument("--comparison", type=Path,
                        help="optionally compare with old comparison-result.json moment premises")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if not 1 <= args.max_seconds < 120:
        parser.error("use a time bound from 1 to 119 seconds; coordinate longer runs separately")
    # A default signal disposition terminates even inside a long native call.
    # Partial completed moments have already been atomically checkpointed.
    signal.signal(signal.SIGALRM, signal.SIG_DFL)
    signal.alarm(args.max_seconds)
    import flint
    flint.ctx.threads = 1
    self_check(flint.fmpz)
    terms, epsilon, metadata = read_phase(args.data)
    denominator = math.lcm(*(value.denominator for value in terms.values()))
    integers = {powers: value.numerator * (denominator // value.denominator)
                for powers, value in terms.items()}
    ctx = flint.fmpz_mpoly_ctx.get(("U", "V", "W"), "lex")
    polynomial = ctx.from_dict(integers)
    previous = None
    if args.comparison:
        previous = [Q(x) for x in json.loads(args.comparison.read_text())["moment_upper_premises"]]
        if len(previous) != 3:
            raise ValueError("expected three old moment premises")
    result = {
        "status": "PARTIAL_EXACT_RATIONAL_PHASE_MOMENTS",
        "scope": "Exact finite arithmetic using the analytically derived standard-complex-Gaussian moment identity; not a Lean formalization or a complete energy comparison certificate.",
        **metadata,
        "tool_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "python": platform.python_version(),
        "python_flint": flint.__version__,
        "flint_threads": flint.ctx.threads,
        "common_denominator": str(denominator),
        "common_denominator_bits": denominator.bit_length(),
        "requested_powers": sorted(set(args.powers)),
        "moments": [],
    }
    if args.comparison:
        result.update(comparison_source=str(args.comparison.resolve()),
                      comparison_sha256=hashlib.sha256(args.comparison.read_bytes()).hexdigest())
    save(result, args.output)
    for power in result["requested_powers"]:
        started = time.monotonic()
        print(f"START phi^{power}", file=sys.stderr, flush=True)
        expanded = polynomial ** power
        power_seconds = time.monotonic() - started
        coefficients = expanded.to_dict()
        moment, detail = accumulate_moment(coefficients, power // 2, epsilon,
                                            denominator, power * metadata["phase_total_degree"], flint.fmpz)
        row = {"power": power, "exact_rational": str(moment), "decimal": decimal(moment),
               **detail, "polynomial_power_seconds": power_seconds,
               "total_seconds": time.monotonic() - started}
        if previous:
            cap = previous[power // 2 - 1]
            row.update(old_upper_premise=str(cap), old_upper_decimal=decimal(cap),
                       satisfies_old_upper=moment <= cap, equals_old_upper=moment == cap)
            if moment > cap:
                row["old_upper_minus_exact"] = str(cap - moment)
        result["moments"].append(row)
        save(result, args.output)
        print(f"END phi^{power}: {row['decimal']}, {len(coefficients)} terms, "
              f"{row['total_seconds']:.3f}s", file=sys.stderr, flush=True)
    result["status"] = "COMPLETE_EXACT_RATIONAL_PHASE_MOMENTS"
    save(result, args.output)
    signal.alarm(0)
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()

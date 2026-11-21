#!/usr/bin/env python3
"""Replay the exact mixture budgets and optional saved head intervals. Agent-ID: codex-a7c4."""

import argparse
import hashlib
import json
import math
from fractions import Fraction as Q
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SCALE = 10**15


def sqrt_ceiling(square: Q) -> int:
    """Least n such that (n / SCALE)² is at least square."""
    scaled = square * SCALE**2
    n = math.isqrt(scaled.numerator // scaled.denominator)
    return n + (n * n < scaled)


def hardy_ceiling(radius: Q, budget: Q, start: int, linear: Q = Q(0)) -> Q:
    residual = budget - linear**2 * radius**2
    square = residual * radius ** -(2 * (2 * start + 1)) / (1 - radius**-4)
    return Q(sqrt_ceiling(square), SCALE)


def read_intervals(path: Path, expected: int) -> list[tuple[int, int]]:
    rows = []
    for line in path.read_text().splitlines():
        lo, hi = map(int, line.split(","))
        if lo > hi:
            raise ValueError(f"Reversed interval in {path}")
        rows.append((lo, hi))
    if len(rows) != expected:
        raise ValueError(f"Expected {expected} intervals in {path}, found {len(rows)}")
    return rows


def check_saved_head(directory: Path) -> None:
    residues = [read_intervals(directory / f"head125-residue-{r}.txt", 126) for r in range(64)]
    grades = [(sum(x for x, _ in column), sum(y for _, y in column)) for column in zip(*residues)]
    if grades != read_intervals(directory / "head125-grades.txt", 126):
        raise ValueError("The saved cell grades do not equal the sums of the 64 residues")
    head = read_intervals(directory / "head125-mixture.txt", 251)
    denominator = 2**128
    linear = Q(head[0][0], denominator)
    nonlinear = Q(sum(max(-lo, hi) for lo, hi in head[1:]), denominator)
    if linear < Q(711964618746086, 10**15) or nonlinear > Q(873503595, 10**15):
        raise ValueError("The signed finite head misses a stated budget")
    print(f"Signed linear lower endpoint = {linear}")
    print(f"Absolute nonlinear head upper endpoint = {nonlinear}")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--head-dir", type=Path,
                        help="Verify the exact outputs of replay_private_upper_head.py")
    args = parser.parse_args()
    if args.head_dir:
        check_saved_head(args.head_dir)
    directory = ROOT / "data/upper-replacement"
    path = directory / "exact-columns.json"
    manifest = json.loads((directory / "manifest.json").read_text())
    hashes = {item["path"]: item["sha256"] for item in manifest["inputs"]}
    raw = path.read_bytes()
    if hashlib.sha256(raw).hexdigest() != hashes[path.name]:
        raise ValueError("The exact columns differ from the local audit manifest")
    columns = json.loads(raw, parse_float=Q)["columns"]
    total = Q(0)
    print("channel  radius  circle budget  linear lower  tail numerator / 10^15")
    for i, column in enumerate(columns):
        weight = Q(column["w_Q"])
        radius = Q(51, 50) if weight < Q(1, 1000) else Q(column["info"][0])
        if i == 0:
            radius = Q(1033, 1000)
        budget = {0: Q(7, 5), 7: Q(13, 10), 15: Q(2)}.get(i, Q(3))
        primary = Q(column.get("P_Q", column.get("R_Q"))[0])
        first = {"GT": Q(7181579359, 10**10), "phase": Q(785398163397, 10**12), "tiger": Q(0)}
        if primary < 0:
            raise ValueError(f"Negative primary constant coefficient on channel {i}")
        linear = first[column["kind"]] * primary
        tail = hardy_ceiling(radius, budget, 251, linear)
        total += weight * tail
        print(i, radius, budget, linear, int(tail * SCALE), sep="  ")
    truncation = hardy_ceiling(Q(109, 100), Q(2), 126)
    mixture = Q(math.ceil(total * SCALE), SCALE)
    # The seven unweighted reference masses and the factorial-scaled radii of GTInterface.
    masses = [Q(n, 10**12) for n in (999411428628, 995201080567, 91640672869,
                                      995201080567, 91640672869, 979402692536, 198981329621)]
    whole = [Q(1, 10**18)] + [Q(n, SCALE) for n in (6338057765, 1086368451, 334910976)]
    low = [Q(n, SCALE) + Q(1, 2**e) for n, e in ((9, 41), (17, 42), (1132, 45))]
    errors = [whole[0], low[0], whole[1], low[1] / 2, whole[2], low[2] / 6, whole[3]]
    public_table = json.loads((ROOT / "data/upper-preprocess/certificate.json").read_text())
    gt_error = 2 * sum(m * e for m, e in zip(masses, errors)) + sum(whole)**2 + Q(public_table["energyErrQ"])
    by_kind = {"GT": gt_error, "phase": Q(0), "tiger": truncation}
    finite_error = sum(Q(c["w_Q"]) * by_kind[c["kind"]] for c in columns)
    allowance = Q(math.ceil(finite_error * SCALE), SCALE)
    gap = Q(711964618746086, SCALE) - Q(873503595, SCALE) - allowance - mixture
    print(f"Weighted GT and cell comparison = {finite_error}")
    print(f"Finite comparison rounded up at 10^-15 = {allowance}")
    print(f"Cell tail from index 126 = {truncation}")
    print(f"Weighted tail = {total}")
    print(f"Weighted tail rounded up at 10^-15 = {mixture}")
    print(f"Reciprocal of the budget gap = {1 / gap}")
    if truncation != Q(889685, SCALE) or mixture != Q(225168500, SCALE):
        raise ValueError("Tail ceilings differ from the Lean certificate")
    if allowance != Q(1467492832, SCALE) or 1 / gap != Q(10**15, 711962052581159):
        raise ValueError("Reciprocal differs from the Lean statement")


if __name__ == "__main__":
    main()

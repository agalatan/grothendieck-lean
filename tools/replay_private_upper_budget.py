#!/usr/bin/env python3
"""Replay the exact mixture budgets and optional saved head intervals. Agent-ID: codex-a7c4, gemini-1aa9."""

import argparse
import hashlib
import json
import math
import re
from fractions import Fraction as Q
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SCALE = 10**15
D = 1 << 128
ZERO_I = (0, 0)


def sqrt_ceiling(square: Q) -> int:
    """Least n such that (n / SCALE)² is at least square."""
    scaled = square * SCALE**2
    n = math.isqrt(scaled.numerator // scaled.denominator)
    return n + (n * n < scaled)


def hardy_ceiling(radius: Q, budget: Q, start: int, linear: Q = Q(0)) -> Q:
    residual = budget - linear**2 * radius**2
    square = residual * radius ** -(2 * (2 * start + 1)) / (1 - radius**-4)
    return Q(sqrt_ceiling(square), SCALE)


def of_rat_lo(q: Q) -> int:
    return (q.numerator * D) // q.denominator


def of_rat_hi(q: Q) -> int:
    return -((-q.numerator * D) // q.denominator)


def of_rat_i(q: Q) -> tuple[int, int]:
    return (of_rat_lo(q), of_rat_hi(q))


def add_i(a: tuple[int, int], b: tuple[int, int]) -> tuple[int, int]:
    return (a[0] + b[0], a[1] + b[1])


def mul_i(a: tuple[int, int], b: tuple[int, int]) -> tuple[int, int]:
    p1 = a[0] * b[0]
    p2 = a[0] * b[1]
    p3 = a[1] * b[0]
    p4 = a[1] * b[1]
    lo = min(p1, p2, p3, p4) // D
    hi = -((-max(p1, p2, p3, p4)) // D)
    return (lo, hi)


def add_l(left: list[tuple[int, int]], right: list[tuple[int, int]]) -> list[tuple[int, int]]:
    n = max(len(left), len(right))
    out: list[tuple[int, int]] = []
    for i in range(n):
        if i < len(left) and i < len(right):
            out.append(add_i(left[i], right[i]))
        elif i < len(left):
            out.append(left[i])
        else:
            out.append(right[i])
    return out


def sum_l(lists: list[list[tuple[int, int]]]) -> list[tuple[int, int]]:
    acc: list[tuple[int, int]] = []
    for lst in reversed(lists):
        acc = add_l(lst, acc)
    return acc


def conv_i_trunc(left: list[tuple[int, int]], right: list[tuple[int, int]],
                 limit: int | None = None) -> list[tuple[int, int]]:
    if not left or not right:
        n = min(len(left), limit) if limit is not None else len(left)
        return [ZERO_I] * n
    out_len = len(left) + len(right) - 1
    if limit is not None and limit < out_len:
        out_len = limit
    lo = [0] * out_len
    hi = [0] * out_len
    nz_left = [(i, a[0], a[1]) for i, a in enumerate(left[:out_len]) if a[0] or a[1]]
    nz_right = [(j, b[0], b[1]) for j, b in enumerate(right[:out_len]) if b[0] or b[1]]
    d = D
    for i, alo, ahi in nz_left:
        max_j = out_len - i
        for j, blo, bhi in nz_right:
            if j >= max_j:
                break
            p1 = alo * blo
            p2 = alo * bhi
            p3 = ahi * blo
            p4 = ahi * bhi
            mn = p1 if p1 < p2 else p2
            if p3 < mn:
                mn = p3
            if p4 < mn:
                mn = p4
            mx = p1 if p1 > p2 else p2
            if p3 > mx:
                mx = p3
            if p4 > mx:
                mx = p4
            idx = i + j
            lo[idx] += mn // d
            hi[idx] += -((-mx) // d)
    return list(zip(lo, hi))


def pows_t(k: int, poly: list[tuple[int, int]], degree: int) -> list[list[tuple[int, int]]]:
    cur = [of_rat_i(Q(1))]
    out = [cur]
    for _ in range(degree):
        cur = conv_i_trunc(poly, cur, k)
        out.append(cur)
    return out


def bivar_t(k: int, tab: list[tuple[int, list[tuple[int, tuple[int, int]]]]],
            p_poly: list[tuple[int, int]], q_poly: list[tuple[int, int]],
            nz: int, mw: int) -> list[tuple[int, int]]:
    pow_p = pows_t(k, p_poly, nz)
    pow_q = pows_t(k, q_poly, mw)
    total_lo = [0] * k
    total_hi = [0] * k
    d = D
    for m, entries in tab:
        m_shift = m // 2
        if m_shift >= k:
            continue
        q_pow = pow_q[m] if m < len(pow_q) else []
        nz_q = [(i, a[0], a[1]) for i, a in enumerate(q_pow[: k - m_shift]) if a[0] or a[1]]
        if not nz_q:
            continue
        lim = k - m_shift
        rlo = [0] * lim
        rhi = [0] * lim
        for n, (ilo, ihi) in entries:
            shift = n // 2
            if shift >= lim or n >= len(pow_p):
                continue
            p_n = pow_p[n]
            end_c = min(len(p_n), lim - shift)
            for idx_c in range(end_c):
                plo, phi = p_n[idx_c]
                if not (plo or phi):
                    continue
                if ilo >= 0:
                    mn = (ilo if plo >= 0 else ihi) * plo
                    mx = (ihi if phi >= 0 else ilo) * phi
                else:
                    p1 = ilo * plo
                    p2 = ilo * phi
                    p3 = ihi * plo
                    p4 = ihi * phi
                    mn = min(p1, p2, p3, p4)
                    mx = max(p1, p2, p3, p4)
                pos = shift + idx_c
                rlo[pos] += mn // d
                rhi[pos] += -((-mx) // d)
        nz_r = [(j, rlo[j], rhi[j]) for j in range(lim) if rlo[j] or rhi[j]]
        for i, qlo, qhi in nz_q:
            max_j = lim - i
            for j, blo, bhi in nz_r:
                if j >= max_j:
                    break
                p1 = qlo * blo
                p2 = qlo * bhi
                p3 = qhi * blo
                p4 = qhi * bhi
                mn = p1 if p1 < p2 else p2
                if p3 < mn:
                    mn = p3
                if p4 < mn:
                    mn = p4
                mx = p1 if p1 > p2 else p2
                if p3 > mx:
                    mx = p3
                if p4 > mx:
                    mx = p4
                pos = m_shift + i + j
                total_lo[pos] += mn // d
                total_hi[pos] += -((-mx) // d)
    return list(zip(total_lo, total_hi))


def compose(m: int, primary: list[Q], coeffs: list[tuple[int, int]]) -> list[tuple[int, int]]:
    p_poly = [of_rat_i(r) for r in primary]
    y_poly = [ZERO_I] + conv_i_trunc(p_poly, p_poly)
    acc: list[tuple[int, int]] = []
    for coeff in reversed(coeffs):
        acc = add_l([coeff], conv_i_trunc(y_poly, acc, m))[:m]
    return conv_i_trunc(p_poly, acc, m)


def haag_list(count: int) -> list[Q]:
    out: list[Q] = []
    r = Q(1)
    for k in range(count):
        out.append(r)
        r = r * Q((2 * k + 1) ** 2, 4 * (k + 1) * (k + 2))
    return out


def load_energy_rows(root: Path = ROOT) -> list[tuple[int, list[tuple[int, tuple[int, int]]]]]:
    text = (root / "Grothe/Upper/Data.lean").read_text(encoding="utf-8")
    start = text.index("def energyStrs : List String := [")
    end = text.index("def energyRows", start)
    rows = []
    for raw in re.findall(r'"([^"]+)"', text[start:end]):
        m_str, entries_str = raw.split(":")
        entries = []
        for item in entries_str.split(";"):
            n_s, a_s, k_s = item.split(",")
            entries.append((int(n_s), of_rat_i(Q(int(a_s), 1 << int(k_s)))))
        rows.append((int(m_str), entries))
    return rows


def load_pi_i(root: Path = ROOT) -> tuple[int, int]:
    text = (root / "Grothe/UpperReplacement/RootData.lean").read_text(encoding="utf-8")
    match = re.search(r"def piI : Ival := ⟨(-?\d+),\s*(-?\d+)⟩", text)
    if match is None:
        raise ValueError("Could not parse piI from RootData.lean")
    return (int(match.group(1)), int(match.group(2)))


def compute_mixture_head(columns: list[dict], grades: list[tuple[int, int]],
                         root: Path = ROOT, m: int = 251) -> list[tuple[int, int]]:
    """Bit-for-bit replay of `Grothe.UpperReplacement.HeadCompute.mixtureHead`."""
    energy_tab = load_energy_rows(root)
    pi_i = load_pi_i(root)
    phase_coeffs = [mul_i(pi_i, of_rat_i(r / 4)) for r in haag_list(m)]
    weighted: list[list[tuple[int, int]]] = []
    for col in columns:
        kind = col["kind"]
        primary = [Q(x) for x in col.get("P_Q", col.get("R_Q"))]
        if kind == "GT":
            auxiliary = [Q(x) for x in col["Q_Q"]]
            ch = bivar_t(m, energy_tab, [of_rat_i(r) for r in primary],
                         [of_rat_i(r) for r in auxiliary], 501, 167)
        elif kind == "phase":
            ch = compose(m, primary, phase_coeffs)
        elif kind == "tiger":
            ch = compose(min(m, len(grades)), primary, grades)
        else:
            raise ValueError(f"Unknown channel kind: {kind}")
        w_i = of_rat_i(Q(col["w_Q"]))
        weighted.append([mul_i(w_i, x) for x in ch])
    return sum_l(weighted)


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


def check_saved_head(directory: Path, columns: list[dict], root: Path = ROOT) -> None:
    residues = [read_intervals(directory / f"head125-residue-{r}.txt", 126) for r in range(64)]
    grades = [(sum(x for x, _ in column), sum(y for _, y in column)) for column in zip(*residues)]
    if grades != read_intervals(directory / "head125-grades.txt", 126):
        raise ValueError("The saved cell grades do not equal the sums of the 64 residues")
    head = read_intervals(directory / "head125-mixture.txt", 251)
    expected_head = compute_mixture_head(columns, grades, root=root)
    if head != expected_head:
        raise ValueError(
            "The saved mixture head does not match HeadCompute.mixtureHead recomputed from these residues"
        )
    linear = Q(head[0][0], D)
    nonlinear = Q(sum(max(-lo, hi, 0) for lo, hi in head[1:]), D)
    if linear < Q(711964618746086, SCALE) or nonlinear > Q(873503595, SCALE):
        raise ValueError("The signed finite head misses a stated budget")
    print(f"Signed linear lower endpoint = {linear}")
    print(f"Absolute nonlinear head upper endpoint = {nonlinear}")


def load_verified_columns(root: Path = ROOT) -> list[dict]:
    directory = root / "data/upper-replacement"
    path = directory / "exact-columns.json"
    manifest = json.loads((directory / "manifest.json").read_text())
    hashes = {item["path"]: item["sha256"] for item in manifest["inputs"]}
    raw = path.read_bytes()
    if hashlib.sha256(raw).hexdigest() != hashes[path.name]:
        raise ValueError("The exact columns differ from the local audit manifest")
    return json.loads(raw, parse_float=Q)["columns"]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--head-dir", type=Path,
                        help="Verify the exact outputs of replay_private_upper_head.py")
    args = parser.parse_args()
    columns = load_verified_columns(ROOT)
    if args.head_dir:
        check_saved_head(args.head_dir, columns, root=ROOT)
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

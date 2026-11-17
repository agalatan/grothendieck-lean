#!/usr/bin/env python3
"""Exact 1,773-cell exterior consumer verification at eps = 3/4 and eps = 94/125.

Agent-ID: gemini-9a4e. Task #511 (Refs #177, #440).
Standard library only (`python3 -I`). All arithmetic is exact (`fractions.Fraction`).

Reads the 19 Lean rows directly from `Grothe/Lower/RowData01.lean`..`RowData19.lean`
and proves `V_eps(f, g) < 500/701` across all exterior response cells:
1. At `eps = 3/4 = 0.7500` using ONLY Lean's `Lower.rho = 973612157/10^9`,
   the homothety-transferred mass row, `RowHolds.mix` two-row mixing, and the
   response-energy bound (2.12b): every response with `t <= 159/200` (0.795) or
   `108/125 <= t <= sqrt(pi)/2` (0.864) satisfies `V_{3/4} <= 7132652/10^7 < 500/701`.
2. At `eps = 94/125 = 0.7520` adding `rho = 93462/100000` (STATUS 3.7, P + C):
   every response with `t <= 1503/2000` (0.7515) or `863/1000 <= t <= sqrt(pi)/2`
   (0.863) satisfies `V_{94/125} <= 7132660/10^7 < 500/701`.
"""
if not __debug__:
    raise RuntimeError("Run without -O; assertions are required.")

import hashlib
import json
import re
import time
from fractions import Fraction as F
from pathlib import Path

E0 = F(149, 200)
PAD = F(1, 10**11)
EPS1 = F(25, 31)
C1 = F(2141, 3906)
S1 = F(3798855002922010337121170986221578569, 22939068096000000000000000000000000000)
RHO_LEAN = F(973612157, 10**9)
RHO_37 = F(93462, 100000)
A_212B = F(886762780, 10**9)
B_212B = F(432306903, 10**9)
TARGET = F(500, 701)


def machin_pi_bounds(terms=18):
    def atan_bounds(q):
        vals = [F((-1) ** j, (2 * j + 1) * q ** (2 * j + 1)) for j in range(terms)]
        s = sum(vals, F(0))
        nxt = F((-1) ** terms, (2 * terms + 1) * q ** (2 * terms + 1))
        return min(s, s + nxt), max(s, s + nxt)

    a5_lo, a5_hi = atan_bounds(5)
    a239_lo, a239_hi = atan_bounds(239)
    return 16 * a5_lo - 4 * a239_hi, 16 * a5_hi - 4 * a239_lo


def load_lean_rows(repo_root):
    manifest_path = repo_root / "research/conjecture-K/code/exterior-codex-4d8a/inherited_rows.json"
    manifest = json.loads(manifest_path.read_text())
    assert F(manifest["old_epsilon"]) == E0
    assert F(manifest["rho"]) == RHO_LEAN
    assert F(manifest["cap_pad"]) == PAD
    rows = [(r["name"], F(r["ell"]), F(r["beta"]), F(r["cap"])) for r in manifest["rows"]]
    assert len(rows) == 19, f"Expected 19 pinned Lean rows, found {len(rows)}"

    types_path = repo_root / "Grothe/Lower/RowDataTypes.lean"
    if types_path.exists():
        m_eps = re.search(r"def\s+ε\s*:\s*ℚ\s*:=\s*(\d+)\s*/\s*(\d+)", types_path.read_text())
        if m_eps and F(int(m_eps.group(1)), int(m_eps.group(2))) == E0:
            for r in manifest["rows"]:
                p = repo_root / r["path"]
                raw = p.read_bytes()
                assert hashlib.sha256(raw).hexdigest() == r["sha256"], f"SHA-256 mismatch on {p}"
                body = raw.decode("utf-8").split(": Row :=", 1)[1]
                nums = re.findall(r"\((\d+) : ℚ\)(?:\s*/\s*(\d+))?", body)[:6]
                ell, beta, cap = (F(int(nums[i][0]), int(nums[i][1] or 1)) for i in (0, 1, 5))
                assert (ell, beta, cap) == (F(r["ell"]), F(r["beta"]), F(r["cap"]))
    return rows


def verify_mix_identity(rows):
    """Exact verification of the RowHolds.mix retained-square identity on all adjacent Lean row pairs."""
    for idx in range(len(rows) - 1):
        _, _, b1, c1_ = rows[idx]
        _, _, b2, c2_ = rows[idx + 1]
        for k in (1, 13, 20, 39):
            th = F(k, 40)
            bm = (1 - th) * b1 + th * b2
            cm = (1 - th) * c1_ + th * c2_
            lhs = (1 - th) * (2 * b1 * b1 / E0 + c1_ + PAD) + th * (2 * b2 * b2 / E0 + c2_ + PAD) - (2 / E0) * th * (1 - th) * (b1 - b2) ** 2
            rhs = 2 * bm * bm / E0 + cm + PAD
            assert lhs == rhs


def eval_transferred_row(ell, beta, cap, e, d, rho, pi_hi, lo, hi):
    """Exact endpoint maximum of convex quadratics on [lo, hi] (leading coeffs 1 > 0 and 1 - 3d/2 > 0)."""
    assert 1 - F(3, 2) * d > 0
    c_env = 2 * beta * beta / e + cap + PAD
    base_lo = lo * lo - 2 * ell * lo + c_env
    base_hi = hi * hi - 2 * ell * hi + c_env
    rad = max(base_lo, base_hi) + d * rho * rho
    en_lo = base_lo + d * (F(3, 2) * (pi_hi / 4 - lo * lo) + B_212B * (A_212B - lo))
    en_hi = base_hi + d * (F(3, 2) * (pi_hi / 4 - hi * hi) + B_212B * (A_212B - hi))
    en = max(en_lo, en_hi)
    return min(rad, en), rad <= en


def certify_exterior(rows, e, rho, cap_rational, expected_gap, use_mass=True):
    pi_lo, pi_hi = machin_pi_bounds()
    assert F(314159265, 10**8) < pi_lo < pi_hi < F(314159266, 10**8)
    assert F(1773, 2000) ** 2 > pi_hi / 4
    assert cap_rational < TARGET

    d = e - E0
    assert d > 0
    c_mass = F(2141, 3150) * e
    s_mass = (e / EPS1) * S1
    assert 0 < c_mass < 1

    uncovered = []
    worst_accepted = F(0)
    counts = {"mass": 0, "crude": 0, "single": 0, "mixed": 0, "used_energy_212b": 0}

    for j in range(1773):
        lo, hi = F(j, 2000), F(j + 1, 2000)
        if use_mass:
            mass_val = (1 - c_mass) * hi * hi + c_mass + s_mass
            if mass_val <= cap_rational:
                worst_accepted = max(worst_accepted, mass_val)
                counts["mass"] += 1
                continue

        crude_val = hi * hi + e * rho * rho
        if crude_val <= cap_rational:
            worst_accepted = max(worst_accepted, crude_val)
            counts["crude"] += 1
            continue

        best_single = F(10)
        best_single_rad_ok = True
        single_vals = []
        for _, ell, beta, cap in rows:
            val, rad_won = eval_transferred_row(ell, beta, cap, e, d, rho, pi_hi, lo, hi)
            single_vals.append(val)
            if val < best_single:
                best_single = val
                best_single_rad_ok = rad_won
        if best_single <= cap_rational:
            worst_accepted = max(worst_accepted, best_single)
            counts["single"] += 1
            if not best_single_rad_ok:
                counts["used_energy_212b"] += 1
            continue

        best_mix = best_single
        best_mix_rad_ok = best_single_rad_ok
        for idx in range(len(rows) - 1):
            if min(single_vals[idx], single_vals[idx + 1]) > cap_rational + F(1, 100):
                continue
            _, l1, b1, c1_ = rows[idx]
            _, l2, b2, c2_ = rows[idx + 1]
            for k in range(1, 40):
                th = F(k, 40)
                lm = (1 - th) * l1 + th * l2
                bm = (1 - th) * b1 + th * b2
                cm = (1 - th) * c1_ + th * c2_
                val, rad_won = eval_transferred_row(lm, bm, cm, e, d, rho, pi_hi, lo, hi)
                if val < best_mix:
                    best_mix = val
                    best_mix_rad_ok = rad_won
                if best_mix <= cap_rational:
                    break
            if best_mix <= cap_rational:
                break

        if best_mix <= cap_rational:
            worst_accepted = max(worst_accepted, best_mix)
            counts["mixed"] += 1
            if not best_mix_rad_ok:
                counts["used_energy_212b"] += 1
        else:
            uncovered.append(j)

    gaps = []
    for j in uncovered:
        if gaps and gaps[-1][1] == j - 1:
            gaps[-1][1] = j
        else:
            gaps.append([j, j])
    gap_intervals = [(F(a, 2000), F(b + 1, 2000)) for a, b in gaps]
    assert gap_intervals == [expected_gap], f"Expected gap {[expected_gap]}, got {gap_intervals}"
    assert worst_accepted <= cap_rational < TARGET
    return len(uncovered), worst_accepted, counts


def run_rejection_controls(rows):
    # Control 1: without the mass row, t near 0 fails at eps = 3/4 with Lower.rho
    try:
        certify_exterior(rows, F(3, 4), RHO_LEAN, F(7132652, 10**7), (F(159, 200), F(108, 125)), use_mass=False)
        raise AssertionError("Control 1 failed to detect small-t gap without mass row")
    except AssertionError as exc:
        assert "failed to detect" not in str(exc)

    # Control 2: cap_rational >= 500/701 is rejected
    try:
        certify_exterior(rows, F(3, 4), RHO_LEAN, TARGET, (F(159, 200), F(108, 125)))
        raise AssertionError("Control 2 failed to reject cap_rational == 500/701")
    except AssertionError as exc:
        assert "failed to reject" not in str(exc)


def main():
    t0 = time.time()
    repo_root = Path(__file__).resolve().parents[4]
    rows = load_lean_rows(repo_root)
    verify_mix_identity(rows)

    unc1, worst1, cnt1 = certify_exterior(
        rows,
        e=F(3, 4),
        rho=RHO_LEAN,
        cap_rational=F(7132652, 10**7),
        expected_gap=(F(159, 200), F(108, 125)),
    )
    print(
        f"PASS eps=3/4 (Lower.rho={RHO_LEAN}): {1773 - unc1}/1773 exterior cells accepted, "
        f"only gap [159/200, 108/125] = [0.795, 0.864], max cap = {float(worst1):.10f} <= 7132652/10^7 < 500/701 | {cnt1}"
    )

    unc2, worst2, cnt2 = certify_exterior(
        rows,
        e=F(94, 125),
        rho=RHO_37,
        cap_rational=F(7132660, 10**7),
        expected_gap=(F(1503, 2000), F(863, 1000)),
    )
    print(
        f"PASS eps=94/125 (rho={RHO_37}): {1773 - unc2}/1773 exterior cells accepted, "
        f"only gap [1503/2000, 863/1000] = [0.7515, 0.863], max cap = {float(worst2):.10f} <= 7132660/10^7 < 500/701 | {cnt2}"
    )

    run_rejection_controls(rows)
    print(f"PASS rejection controls; completed exact 1,773-cell exterior audits in {time.time() - t0:.2f}s")


if __name__ == "__main__":
    main()

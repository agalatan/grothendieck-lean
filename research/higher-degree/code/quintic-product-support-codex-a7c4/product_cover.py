"""Extend the buffered degree-five strips by spiked derivative and radial Gram estimates.

Agent-ID: codex-a7c4. Run python3 -IB product_cover.py --repo .
"""

import argparse
from copy import copy
from fractions import Fraction as Q
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import p7_product
import step_charges

SHAPES = (("4.2", "5.4"), ("5.4", "6.6"), ("6.6", "8.1"), ("12", "18"))
CLAIMS = (
    ("1.4023", ".40869", ".416", 93490),
    ("1.4025", ".40825", ".4155", 148925),
    ("1.403", ".40705", ".414", 833075),
)


def build(repo):
    sources = repo / "research/higher-degree/code"
    predecessor = sources / "quintic-sector-moments-codex-a7c4"
    sys.path.insert(0, str(predecessor))
    import cover
    import spiked_p7

    proof = cover.Payoff(repo)
    verifier = cover.module(sources / "spiked-cubic-radius-gemini-4c4c/verify.py")
    original = json.loads((predecessor / "p7_stein_rows.json").read_text())
    source = sources / "spiked-cubic-radius-gemini-4c4c/cert_spiked.json"
    old_ray = json.loads(source.read_text())["rays"][0]
    cover.need(tuple(old_ray["abc"]) == (84, 187, 205), "same legacy ray")

    class ProductVerifier:
        def verify_spiked_row(self, row, abc, weights, rhs, knots, quiet):
            # Verify the supplied potential, inequalities and C3 dual before
            # taking the improved derivative contribution at each endpoint.
            result = verifier.verify_spiked_row(
                row, abc, weights, rhs, knots, quiet=quiet
            )
            cover.need(result["ok"], "source conditions C1, C2 and C3")
            self.last = row, Q(abc[1], abc[2]), result["bounds"].copy()
            result["bounds"] = {
                side: bound
                - p7_product.reduction(verifier, row, Q(abc[1], abc[2]), side)
                for side, bound in result["bounds"].items()
            }
            result["bound"] = max(result["bounds"].values())
            return result

        def variant(self, slab, symmetric):
            # Retain checked_model's physical charge slopes. Recompute only
            # its intercept from the same validated source result and row.
            row, beta, raw = self.last
            ends = []
            for side, (slope, _) in zip(("lo", "hi"), slab.endpoints):
                debit = (
                    p7_product.reduction(verifier, row, beta, side, symmetric=True)
                    if symmetric
                    else 0
                )
                upper = Q(((raw[side] - debit) * 10**12).__ceil__(), 10**12)
                ends.append((slope, upper))
            return spiked_p7.Slab(slab.low, slab.high, tuple(ends))

    def improve(checked, rows, beta, symmetric=False):
        cover.need(len(checked) == len(rows), "every verified shape model")
        models = []
        for (lo, hi, endpoints), row in zip(checked, rows):
            scope = Q(row["s_lo"]), Q(row["s_hi"])
            cover.need(scope == (lo, hi), "matching source shape scope")
            ends = tuple(
                (
                    slope,
                    intercept
                    - p7_product.reduction(verifier, row, beta, side, symmetric),
                )
                for side, (slope, intercept) in zip(("lo", "hi"), endpoints)
            )
            models.append(spiked_p7.Slab(lo, hi, ends))
        return tuple(models)

    baseline = copy(proof)
    symmetric = copy(proof)
    symmetric.chords = improve(proof.chords, old_ray["rows"], proof.old.BETA, True)
    symmetric.spiked = improve(proof.spiked, original["rows"], spiked_p7.BETA, True)
    proof.chords = improve(proof.chords, old_ray["rows"], proof.old.BETA)
    proof.spiked = improve(proof.spiked, original["rows"], spiked_p7.BETA)
    improved = ProductVerifier()
    repriced = spiked_p7.repriced_model(improved)
    proof.spiked += (repriced,)
    baseline.spiked += (improved.variant(repriced, symmetric=False),)
    symmetric.spiked += (improved.variant(repriced, symmetric=True),)
    bank = json.loads((HERE / "p7_product_rows.json").read_text())
    cover.need(tuple(bank["abc"]) == spiked_p7.ABC, "same secondary Pythagorean ray")
    shapes = tuple((Q(row["s_lo"]), Q(row["s_hi"])) for row in bank["rows"])
    cover.need(
        shapes == tuple((Q(a), Q(b)) for a, b in SHAPES), "four displayed intervals"
    )
    for row in bank["rows"]:
        slab = spiked_p7.checked_model(improved, row, bank["knots"])
        proof.spiked += (slab,)
        symmetric.spiked += (improved.variant(slab, symmetric=True),)
    without_steps = copy(proof)
    new_rows = step_charges.make_rows(repo, spiked_p7.WEIGHTS)
    cover.need(len(new_rows) == 7, "seven radial profile rows")
    proof.mass_rows += tuple(cover.mass_gram.MassRow(*row) for row in new_rows)
    symmetric.mass_rows = proof.mass_rows
    # Preserve the four-row symmetric model for a matched deletion control.
    crossing = copy(symmetric)
    extra = json.loads((HERE / "crossing_row.json").read_text())
    cover.need(
        (Q(extra["s_lo"]), Q(extra["s_hi"])) == (Q("5.05"), Q("5.75")),
        "crossing shape interval",
    )
    slab = spiked_p7.checked_model(improved, extra, bank["knots"])
    crossing.spiked += (improved.variant(slab, symmetric=True),)
    wide = copy(crossing)
    extra = json.loads((HERE / "wide_row.json").read_text())
    cover.need(
        (Q(extra["s_lo"]), Q(extra["s_hi"])) == (Q("4.8"), Q("6.2")),
        "wide overlapping shape interval",
    )
    slab = spiked_p7.checked_model(improved, extra, bank["knots"])
    wide.spiked += (improved.variant(slab, symmetric=True),)
    return proof, baseline, without_steps, symmetric, crossing, wide


def point(proof, t, y):
    target = 1 / Q("1.4023") - Q(1, 10**5)
    t, y = Q(t), Q(y)
    return target - proof.cell(t, t, y, y, target)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    proof, baseline, without_steps, symmetric, crossing, wide = build(
        parser.parse_args().repo.resolve()
    )
    print(
        "All source Sturm constraints and seven radial Gram rows verified.", flush=True
    )
    # At a rational point immediately beyond chi=12, test both proofs
    # on exactly the same input and the same already-buffered threshold.
    t, y = ".408694", "3.464102"
    if not (
        Q(y) ** 2 > 12
        and point(baseline, t, y) < -Q(".000464")
        and point(proof, t, y) > Q(".00252")
    ):
        raise ValueError("matched predecessor upper-shoulder control")
    step_only = copy(baseline)
    step_only.mass_rows = proof.mass_rows
    if (
        point(baseline, ".4093", y) >= -Q(".000833311")
        or point(step_only, ".4093", y) <= Q(".000010498")
        or point(step_only, ".40935", y) >= -Q(".000100998")
    ):
        raise ValueError("radial-only controls at fixed predecessor supports")
    t, y = ".416", "2.323791"
    if not (
        point(without_steps, t, y) < -Q(".00282") and point(proof, t, y) > Q(".00045")
    ):
        raise ValueError("seven radial profiles active at fixed derivative bounds")
    if point(proof, ".417", "2.323791") >= -Q(".00207"):
        raise ValueError("outside-strip control for this majorant")
    print(
        "Matched upper shoulder, fixed-row deletion and outside-strip controls passed.",
        flush=True,
    )
    if point(proof, ".4163", "2.323791") >= -Q(".00154") or point(
        symmetric, ".4163", "2.323791"
    ) <= Q(".00013"):
        raise ValueError("fixed-row symmetrization control")
    if point(symmetric, ".4167", "2.323791") >= -Q(".00159"):
        raise ValueError("outside the symmetric strip for these fixed rows")
    for k, left, right, spare in CLAIMS:
        if proof.cover(Q(left), Q(right), Q(k)) <= Q(spare, 10**12):
            raise ValueError("contradiction clearance")
    if symmetric.cover(Q(".416"), Q(".4165"), Q("1.4023")) <= Q(6809117, 10**12):
        raise ValueError("symmetric product strip clearance")
    if point(symmetric, ".417", "2.323791") >= -Q(".00182") or point(
        crossing, ".417", "2.323791"
    ) <= Q(".0007354"):
        raise ValueError("deleting just the crossing row must recover the old failure")
    if crossing.cover(Q(".4165"), Q(".417"), Q("1.4023")) <= Q(1953433, 10**12):
        raise ValueError("crossing row clearance")
    if crossing.cover(Q(".417"), Q(".4171"), Q("1.4023")) <= Q(12785514, 10**12):
        raise ValueError("upper crossing strip clearance")
    if crossing.cover(Q(".4171"), Q(".4172"), Q("1.4023")) <= Q(667089, 10**12):
        raise ValueError("last crossing strip clearance")
    if crossing.cover(Q(".4155"), Q(".4166"), Q("1.4025")) <= Q(596664, 10**12):
        raise ValueError("crossing strip at target 1.4025")
    if crossing.cover(Q(".414"), Q(".4154"), Q("1.403")) <= Q(1116260, 10**12):
        raise ValueError("crossing strip at target 1.403")
    if point(crossing, ".4173", "2.397916") >= -Q(".001532"):
        raise ValueError("outside the five-row extension")
    if point(wide, ".4173", "2.397916") <= Q(".00025117"):
        raise ValueError("wider model did not clear the previous shape edge")
    if wide.cover(Q(".4172"), Q(".4173"), Q("1.4023")) <= Q(521290, 10**12):
        raise ValueError("six-row strip clearance")
    if point(wide, ".4174", "2.569047") >= -Q(".00166"):
        raise ValueError("outside the six-row extension")


if __name__ == "__main__":
    main()

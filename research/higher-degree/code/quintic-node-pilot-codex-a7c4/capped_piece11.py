"""Lower-bound the Gaussian benchmark for the capped degree-five row on piece 11.

The integral helper and its C++ source are shared with the diffuse g84 payoff replay.
Agent-ID: codex-a7c4.
"""

import argparse
from decimal import Decimal
from fractions import Fraction as F
from hashlib import sha256
import json
from pathlib import Path
import runpy
import tempfile

TABLES = Path("research/higher-degree/code/degree5-design/design-2026-11-25/tables")
COVER = "0b2dd0cf302d0cd0c2c85c2892c9015541d38669195a2a707529f3beec3cb28e"
MATCHED = "822b30e326853d63ff4fc93ad1d04c2078634cfcc64015194b56f4cf60ff1f31"


def need(condition, why):
    if not condition:
        raise ValueError(why)


def read_pinned(path, digest):
    data = path.read_bytes()
    need(sha256(data).hexdigest() == digest, f"source changed: {path.name}")
    return data


def capped_parameters(root):
    base = root / TABLES
    data = json.loads(read_pinned(base / "fin_table.json", COVER), parse_float=Decimal)
    chosen = data["chosen"][10]  # Pieces are numbered 1 to 21 in the design.
    need(chosen["row_tag"] == "0.830", "capped piece 11 covering row")
    matching = [r for r in data["cases"] if all(r[k] == v for k, v in chosen.items())]
    need(len(matching) == 1, "unique selected cover row")
    row = dict(
        t=".83", l=".816538", beta=".139578", bA="-.049674", bB="-.026924", sig=".24"
    )
    need(
        all(F(row[k]) == F(v) for k, v in matching[0]["row"].items()),
        "exact rounded row",
    )
    records = [
        json.loads(line, parse_float=Decimal)
        for line in read_pinned(base / "nu_matched/rows5.lines", MATCHED).splitlines()
    ]
    chosen_nu = [
        r for r in records if r["piece_j"] == 11 and r["t"] == Decimal(row["t"])
    ]
    need(len(chosen_nu) == 1, "fixed visible coefficient on piece 11")
    selected = chosen_nu[0]
    need(
        selected["nu5_row"] == selected["driver_nu5"] == Decimal(".010338438615358537"),
        "design comparator uses its fixed visible coefficient",
    )
    need(
        selected["e1"] == Decimal(".78") and selected["eta"] == Decimal(".0779"),
        "capped game prices",
    )
    row.update(nu5=selected["nu5_row"], e1=selected["e1"], eta=selected["eta"])
    return row


def gap_lower(exe, row, helpers, nr=384, nq=192):
    """Return exact rational lower bounds for S5 and S5−F(ν₅), plus F(ν₅) upper."""
    payoff_lo, _, _, _ = helpers["evaluate_row"](exe, row, nr, nq)
    t, ell, beta, nu, eps, eta = (
        F(row[k]) for k in ("t", "l", "beta", "nu5", "e1", "eta")
    )
    offset = t * t - 2 * ell * t + 2 * beta * beta / eps
    bench_lo = payoff_lo - offset
    root12_lo = helpers["sqrt_lo"](F(12))
    need(
        ell > 2 * beta and beta * root12_lo > 6 * nu and nu > 0,
        "positive radial polynomial at zero remote energy",
    )

    Fzero_hi = (
        helpers["sqrt_pi_upper"]() * (ell - beta / 2 + 3 * nu / (4 * root12_lo))
        - nu * nu / eta
    )
    need(
        bench_lo > F("1.32919438") and Fzero_hi < F("1.32617344"),
        "capped benchmark / zero-energy directions",
    )
    gap = bench_lo - Fzero_hi
    need(gap > F(".00302"), "piece 11 finite Gaussian slack below claimed clearance")
    return bench_lo, gap, Fzero_hi


def run(root, integrator, nr=384, nq=192):
    helpers = runpy.run_path(str(integrator))
    row = capped_parameters(root)
    with tempfile.TemporaryDirectory() as folder:
        exe = helpers["compile_integrator"](
            Path(folder), integrator.with_name("cert.cpp")
        )
        bench, gap, zero = gap_lower(exe, row, helpers, nr, nq)
    print(
        f"Capped piece 11, σ=.24: S5 > 1.32919438, F(ν₅) < 1.32617344, S5−F(ν₅) > .00302 (calculated endpoints {float(bench):.12f}, {float(zero):.12f}, {float(gap):.12f})."
    )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path)
    parser.add_argument(
        "--integrator",
        type=Path,
        default=Path(__file__).resolve().with_name("verify.py"),
    )
    args = parser.parse_args()
    root = args.root or next(
        (p for p in Path(__file__).resolve().parents if (p / TABLES).is_dir()), None
    )
    if root is None:
        parser.error("please supply --root")
    run(root, args.integrator)

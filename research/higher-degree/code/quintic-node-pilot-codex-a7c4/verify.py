"""Verify the finite g84 payoff using a pinned row and a validated midpoint integral. Agent-ID: codex-a7c4."""

import argparse
from decimal import Decimal
from fractions import Fraction as F
from hashlib import sha256
import json
from math import comb, factorial, isfinite, isqrt
from pathlib import Path
import os
import re
import subprocess
import tempfile

ROW = Path("research/higher-degree/code/degree5-stage0/results/b/g84/rows_all.lines")
DIGEST = "ae102696fb1e62265aa879d598491a43e03a24376a72d8eed17ac8c744b1c4c3"


def need(condition, message):
    if not condition:
        raise ValueError(message)


def expneg(x, degree):
    return sum((-x) ** i / factorial(i) for i in range(degree + 1))


def sqrt_lo(x, unit=10**16):
    return F(isqrt(x.numerator * unit**2 // x.denominator), unit)


def sqrt_hi(x):
    return sqrt_lo(x) + F(1, 10**16)


def sqrt_pi_upper():
    # Machin's identity; alternating truncations go up at even and down at odd degree.
    def arctan_partial(x, final_term):
        return sum(
            (-1) ** i * x ** (2 * i + 1) / (2 * i + 1) for i in range(final_term + 1)
        )

    pi_hi = 16 * arctan_partial(F(1, 5), 8) - 4 * arctan_partial(F(1, 239), 3)
    bound = sqrt_hi(pi_hi)
    need(bound * bound > pi_hi and bound < F("1.77246"), "outward square root of pi")
    return bound


def parse_integral(lines):
    need(
        len(lines) == 2 and lines[0].startswith("F ") and "; grad " in lines[0],
        "unexpected integral diagnostics",
    )
    fields = lines[1].split()
    need(
        len(fields) == 5 and fields[0] == "enclosure", "missing binary interval record"
    )
    pattern = r"-?0x[0-9a-f]+(?:\.[0-9a-f]+)?p[+-]?[0-9]+"
    need(all(re.fullmatch(pattern, x) for x in fields[1:]), "malformed hex endpoint")
    floats = [float.fromhex(x) for x in fields[1:]]
    need(all(isfinite(x) for x in floats), "nonfinite enclosure")
    out = [F.from_float(x) for x in floats]
    need(out[0] <= out[1] and out[2] <= out[3], "unordered intervals")
    return out


def projection():
    # S(S−2)^2 on these intervals has minima at an endpoint; no interior minimum except 2.
    lo = F(0)
    for a, b, lower in [
        (F(1, 4), F(1, 2), F(49, 64)),
        (F(1, 2), F(1), F(1)),
        (F(1), F(3, 2), F(3, 8)),
        (F(3), None, F(1)),
    ]:
        need(
            0 < lower <= min(1, a * (a - 2) ** 2),
            "left endpoint of clipped second-moment test",
        )
        if b is not None:
            need(
                lower <= b * (b - 2) ** 2 and (b < 2 or a > 2),
                "right endpoint of clipped second-moment test",
            )
        lo += lower * (expneg(a, 31) - (expneg(b, 30) if b is not None else 0)) / 2
    need(lo > F(23, 100), "clipped second-moment debit")
    fourth = F(3, 8) * sum(
        comb(4, j) * (-2) ** (4 - j) * factorial(j + 2) for j in range(5)
    )
    need(fourth == 66 and expneg(F(3, 2), 20) * 2 < F(".45"), "fourth-derivative debit")
    return F(77, 100), F(".45") * fourth + 3


def compile_integrator(folder, source=None):
    """Build the validated C++ integrator in a caller-owned temporary directory."""
    exe = folder / "integral"
    command = [
        os.environ.get("CXX", "c++"),
        "-std=c++17",
        "-O2",
        "-fno-fast-math",
        "-ffp-contract=off",
    ]
    # pkg-config may put libraries in a non-default location (Homebrew or Linux).
    flags = subprocess.check_output(
        ["pkg-config", "--cflags", "--libs", "mpfr", "gmp"], text=True
    ).split()
    subprocess.run(
        command
        + [str(source or Path(__file__).with_name("cert.cpp")), "-o", str(exe)]
        + flags,
        check=True,
    )
    return exe


def evaluate_row(exe, row, nr=384, nq=192):
    """Return exact rational endpoints (payoff lo, payoff hi, ν derivative lo, ν derivative hi).

    Row values are exact decimal strings or Decimals with the keys below. The payoff includes
    t²−2ℓt+2β²/ε. The fold is at σ>0, c=0 and A=B=0. The executable checks its tail domain.
    """
    keys = ("t", "l", "beta", "bA", "bB", "sig", "nu5", "e1", "eta")
    need(
        all(isinstance(row[k], (str, Decimal)) for k in keys),
        "supply row constants as exact decimals",
    )
    record = subprocess.check_output(
        [str(exe), str(nr), str(nq), *[str(row[k]) for k in keys]], text=True
    )
    return parse_integral(record.splitlines())


def run(root, nr, nq):
    data = (root / ROW).read_bytes()
    need(sha256(data).hexdigest() == DIGEST, "g84 row provenance")
    rows = {
        str(r["t"]): r
        for r in (json.loads(x, parse_float=Decimal) for x in data.splitlines())
    }
    clip, fourth = projection()
    sqrt_pi = sqrt_pi_upper()
    with tempfile.TemporaryDirectory() as folder:
        exe = compile_integrator(Path(folder))
        # Bath theorem #827: complex .80 on [0,.73], real .85 on [0,.20].
        # These are the ambient unpriced Hessian caps; at c=0 all but one gradient vanish.
        for name, hessian, reach, cap, full_cap in [
            ("0.8", "7.712", ".058", ".712146", ".712899087"),
            ("0.85", "7.786", ".052", ".712483", ".712881421"),
        ]:
            curv = 2 / F(".2552") - F(hessian)
            row = rows[name]
            need(
                row["e1"] == Decimal(".84") and row["eta"] == Decimal(".2552"),
                "row prices",
            )
            boxes = evaluate_row(exe, row, nr, nq)
            residual = max(abs(boxes[2]), abs(boxes[3]))
            sup = boxes[1] + residual**2 / (2 * F(curv))
            need(sup < F(cap), "diffuse payoff clearance")
            sig, bA, bB = [F(row[k]) for k in ("sig", "bA", "bB")]
            pref = sqrt_pi * sig * sqrt_hi(1 + bA * bA + bB * bB) / 2
            c = F(reach)
            z = sqrt_lo(1 - c * c)

            def debit(clip):
                return pref * (clip * c * c / z + fourth * c**4 / (12 * z**3))

            target = F(10000, 14027)
            need(
                F(cap) + debit(clip) < F(full_cap) < target - F(1, 10**5),
                "positive-spike target",
            )
            need(F(cap) + debit(1) > target, "removed compensation control")
            print(
                name,
                "trial and gradient box",
                tuple(format(float(v), ".10g") for v in boxes),
                "diffuse <",
                cap,
                "for c ≤",
                reach,
                "full cap <",
                full_cap,
                "< target − 1e−5",
            )


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--root", type=Path)
    ap.add_argument("--grid", type=int, nargs=2, default=(384, 192))
    args = ap.parse_args()
    root = args.root or next(
        (p for p in Path(__file__).resolve().parents if (p / ROW).exists()), None
    )
    if root is None:
        ap.error("please supply --root")
    run(root, *args.grid)

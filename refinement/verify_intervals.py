#!/usr/bin/env python3
"""Verify the six-branch interval calculation for K_G^C < 1.404898426735.

Requires numpy, python-flint >= 0.9, and the upstream repository at
https://github.com/sheilman77/grothendieck_cx (tested at commit 7139f4...).
This script never alters upstream files. It checks the selected coefficient
tables and uses them in directed arithmetic; it does not regenerate their
quadrature enclosures. Supplied replacement tables must themselves have
been produced by a certified generator.

The adjacent verify_exact.py is run first, as a separate process, to check
the new polynomial-power inequalities, Wallis bound, and exact arithmetic.
With --full, also rerun upstream nonvanishing, energy, Cauchy-boundary, and
finite fifth-tail prerequisites. Without --full those prerequisites are
explicitly retained as upstream inputs, not represented as rerun checks.
"""
from __future__ import annotations

if not __debug__:
    raise SystemExit("ERROR: assertions are required; do not run Python with -O or -OO")

import argparse
from contextlib import contextmanager
from fractions import Fraction as Q
import hashlib
import os
from pathlib import Path
import subprocess
import sys

import verify_exact as exact_certificate


PINNED_ORIGIN_SHA256 = "fc29fa555fb66c5cd6a2ac53dbd2508207b6058cfe0b339163faadeb85ad54da"
PINNED_EXTENSION_SHA256 = "8bcc654f4fd44881a7b487fe1336a8905aaa2d1b52deca45e622e1c397fb03aa"
WEIGHTS = tuple(map(Q, (
    "0.983543458398378100",
    "0.012416654023174663",
    "0.003031585753026536",
    "0.000593628184609741",
    "0.000016934659448514",
    "0.000397738981362458",
)))
Q0_LOWER = Q("0.7117964083067696")
PREFIX_UPPER = Q("1.0747148914e-6")
TAILS_UPPER = Q("1.027264992e-7")
FINAL_UPPER = Q("1.404898426735")
FIFTH_FINITE_OLD_WEIGHTED = Q("2.699176355797438e-12")
SIXTH_UNWEIGHTED = Q(258088051054978, 10**18)


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha256(path):
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


@contextmanager
def working_directory(path):
    previous = Path.cwd()
    os.chdir(path)
    try:
        yield
    finally:
        os.chdir(previous)


def validate_table(np, path, *, extension, supplied):
    require(path.is_file(), f"coefficient table does not exist: {path}")
    expected = PINNED_EXTENSION_SHA256 if extension else PINNED_ORIGIN_SHA256
    actual = sha256(path)
    title = "extension [25,36]" if extension else "origin [0,25]"
    print(f"{title} table: {path}", flush=True)
    print(f"  original pinned SHA256: {expected}", flush=True)
    print(f"  selected file SHA256:   {actual}", flush=True)
    if supplied:
        print("  source: caller-supplied interval table; quadrature is not regenerated here", flush=True)
        print(f"  original hash match: {'yes' if actual == expected else 'no (replacement selected explicitly)'}", flush=True)
    else:
        require(actual == expected, f"default {title} table failed its pinned hash check")
        print("  source: original pinned table; hash verified", flush=True)

    with np.load(path, allow_pickle=False) as saved:
        require(int(saved["count"]) == 120, f"{title}: count must be 120")
        require(int(saved["cutoff"]) == (36 if extension else 25), f"{title}: incorrect cutoff")
        if extension:
            require(int(saved["start"]) == 25, "extension: start must be 25")
        for side in ("left", "right"):
            for part in ("real", "imag"):
                lo = saved[f"{side}_{part}_lower"]
                hi = saved[f"{side}_{part}_upper"]
                require(lo.shape == hi.shape == (120,), f"{title}: invalid {side}/{part} shape")
                require(np.all(np.isfinite(lo)) and np.all(np.isfinite(hi)), f"{title}: nonfinite endpoint")
                require(np.all(lo <= hi), f"{title}: lower endpoint exceeds upper endpoint")
    print("  interval metadata and endpoint ordering: PASS", flush=True)
    return actual


def run_exact_verifier():
    exact = Path(__file__).resolve().with_name("verify_exact.py")
    require(exact.is_file(), f"missing adjacent exact verifier: {exact}")
    print("Running adjacent verify_exact.py in a separate process...", flush=True)
    subprocess.run([sys.executable, str(exact)], check=True)


def run_full_prerequisites(audit, certificate_directory, selected_origin):
    """Execute only named prerequisites, and report them after they pass."""
    from flint import arb, ctx
    import complex_upper_convex_2e6_polynomial_certificate as polynomial_check

    print("Full mode: checking origin-polynomial nonvanishing and derivative bounds...", flush=True)
    polynomial_check.main()
    audit.base.check_origin_identity()
    print("Exact origin cancellation and unit-phase identities: PASS", flush=True)

    # The energy helper's TABLE is independent of base.TABLE. Explicitly
    # redirect it as well, so replacement origin intervals are used here.
    energy_check = audit.origin_check
    energy_check.TABLE = str(selected_origin)
    ctx.dps = 80
    print("Full mode: recomputing total energies and visible energies using the selected origin table...", flush=True)
    with working_directory(certificate_directory):
        left_total = energy_check.energy(energy_check.complex_polynomial(energy_check.LEFT), "left", energy_check.A)
        right_total = energy_check.energy(energy_check.complex_polynomial(energy_check.RIGHT), "right", energy_check.B)
        left_visible = energy_check.visible_energy("left", energy_check.LEFT)
        right_visible = energy_check.visible_energy("right", energy_check.RIGHT)
    assert left_total < energy_check.aq(energy_check.LEFT_TOTAL)
    assert right_total < energy_check.aq(energy_check.RIGHT_TOTAL)
    assert left_visible > energy_check.aq(energy_check.LEFT_VISIBLE)
    assert right_visible > energy_check.aq(energy_check.RIGHT_VISIBLE)
    assert energy_check.LEFT_TAIL_ENERGY == Q("1.174")
    assert energy_check.RIGHT_TAIL_ENERGY == Q("1.176")
    print("Origin energy prerequisites: PASS (tail energies < 1.174 and 1.176)", flush=True)

    print("Full mode: checking the first four scalar Cauchy boundaries...", flush=True)
    for number, (row, radius) in enumerate(zip(
        audit.RHO_ROWS[:4], (Q("1.2"), Q("1.11"), Q("1.11"), Q("1.11"))
    ), start=1):
        audit.scalar_check.root_check(row, radius)
        weighted_norm, distance = audit.scalar_check.boundary_check(row, radius)
        assert weighted_norm < Q(5, 4)
        assert distance > arb("0.01")
        print(f"  scalar branch {number}: PASS", flush=True)

    print("Full mode: recomputing the fifth finite tail through mode 5000...", flush=True)
    finite, _old_remainder, _old_total, description = audit.sparse_tail(audit.RHO_5)
    assert description[0] == 67
    assert finite < audit.base.aq(FIFTH_FINITE_OLD_WEIGHTED)
    print("Fifth finite-block prerequisite: PASS", flush=True)
    print("All prerequisites requested by --full were executed and passed.", flush=True)


def verify(args):
    try:
        import numpy as np
        from flint import ctx
    except ImportError as error:
        raise ValueError("install numpy and python-flint >= 0.9 in this Python environment") from error

    source = args.source.expanduser().resolve()
    cert = source / "support_compression_certificate"
    require((source / "audit_sparse6_altgroups.py").is_file(), f"not an upstream source checkout: {source}")
    require(cert.is_dir(), f"missing upstream certificate directory: {cert}")
    sys.path.insert(0, str(source))
    sys.path.insert(0, str(cert))
    import audit_sparse6_altgroups as audit

    origin = (args.origin_table.expanduser().resolve() if args.origin_table else
              cert / "complex_upper_origin_layer_coefficients_n120_analytic.npz")
    extension = (args.extension_table.expanduser().resolve() if args.extension_table else
                 source / "origin_tail_25_36.npz")
    origin_hash = validate_table(np, origin, extension=False, supplied=args.origin_table is not None)
    extension_hash = validate_table(np, extension, extension=True, supplied=args.extension_table is not None)

    # Upstream loaders contain their own hash assertions. For explicitly
    # selected replacement files, pin those assertions to the SHA256 just
    # printed. This identifies selected data; it does not authenticate that
    # a replacement was generated by certified quadrature.
    audit.base.TABLE = origin
    audit.base.EXPECTED_TABLE_SHA256 = origin_hash
    audit.tight.TABLE = extension
    audit.tight.EXPECTED_SHA256 = extension_hash
    audit.origin_check.TABLE = str(origin)
    ctx.dps = 80

    if args.full:
        run_full_prerequisites(audit, cert, origin)
    else:
        print("Assembly mode: upstream nonvanishing, energy, boundary, and fifth finite-tail prerequisites are assumed; use --full to rerun them.", flush=True)

    # The upstream code negates both rho_3 and its weight. Undo both signs
    # so that our exact positive weights agree with the paper's convention.
    rows = [list(row) for row in audit.RHO_ROWS]
    rows[2] = [-value for value in rows[2]]
    assert WEIGHTS == exact_certificate.WEIGHTS
    assert audit.RHO_5 == tuple(
        Q(exact_certificate.P.get(n, 0), exact_certificate.DEN)
        for n in range(120)
    )
    assert abs(audit.WEIGHTS[4]) == Q("0.0000169358532612748746")
    assert all(sum(map(abs, row)) <= 1 for row in rows)
    scalar = [Q(0)] * 120
    for weight, row in zip(WEIGHTS[:5], rows):
        for n, coefficient in enumerate(audit.scalar_profile(row)):
            scalar[n] += weight * coefficient
    q0, prefix = audit.tight.directed_origin_mixture(scalar, WEIGHTS[5])

    low_tails = sum(
        WEIGHTS[i] * Q(10) * radius**(-241) / (1 - radius**(-2))
        for i, radius in enumerate((Q("1.2"), Q("1.11"), Q("1.11"), Q("1.11")))
    )
    fifth_tail = WEIGHTS[4] * (
        FIFTH_FINITE_OLD_WEIGHTED / abs(audit.WEIGHTS[4]) + Q(1, 273360)
    )
    sixth_tail = WEIGHTS[5] * SIXTH_UNWEIGHTED
    tails = low_tails + fifth_tail + sixth_tail
    mass = sum(WEIGHTS)
    assert mass == Q("1.000000000000000012")
    assert q0 > audit.base.aq(Q0_LOWER)
    assert prefix < audit.base.aq(PREFIX_UPPER)
    assert tails < TAILS_UPPER
    denominator = Q0_LOWER - PREFIX_UPPER - TAILS_UPPER
    assert denominator > 0
    assert mass / denominator < FINAL_UPPER

    print("Directed coefficient checks: PASS", flush=True)
    print("  q0 > 0.7117964083067696", flush=True)
    print("  nonlinear prefix < 1.0747148914e-6", flush=True)
    print("  all remaining tails < 1.027264992e-7", flush=True)
    print("  unnormalized selector mass = 1.000000000000000012", flush=True)
    print("Exact final comparison: PASS; K_G^C < 1.404898426735", flush=True)
    print("No coefficient-table quadrature regeneration was performed by this script.", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--source", type=Path, required=True, help="path to the upstream grothendieck_cx checkout")
    parser.add_argument("--origin-table", type=Path, help="explicit replacement certified [0,25] interval table")
    parser.add_argument("--extension-table", type=Path, help="explicit replacement certified [25,36] interval table")
    parser.add_argument("--full", action="store_true", help="rerun named upstream analytic and finite-tail prerequisites")
    args = parser.parse_args()
    try:
        run_exact_verifier()
        verify(args)
    except (AssertionError, ValueError, OSError, KeyError, subprocess.CalledProcessError) as error:
        raise SystemExit(f"VERIFICATION FAILED: {type(error).__name__}: {error}") from error


if __name__ == "__main__":
    main()

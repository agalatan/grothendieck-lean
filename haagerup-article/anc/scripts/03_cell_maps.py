#!/usr/bin/env python3
"""03 - The two cell maps: decoding, |F| <= 1, charge one.

Arithmetic : exact (Python integers) for the sum-of-squares certificate of all 4,096 cells of both maps;
             floating point (numpy) for the sampled maximum of |F| and for the symmetry checks.
Paper      : the subsection "Cell maps" (the lemma "Sum-of-squares bound") and the computation "Sums of squares".
Lean       : `Haagerup.Data.tig_sos_ok`, `Haagerup.Data.tcell_sos_ok` (the same integer inequality, evaluated by
             `sosAllOK` of HaagerupKernel/CellKernel.lean), `Haagerup.norm_cellFn_le` (it implies |F| <= 1) and
             `Haagerup.cellFn_rot2` (charge one), in CellMap.lean.
Runtime    : about 5 seconds.
Needs      : numpy for the floating-point part.

The map (on a cell (i, j): |z_1| in [3i/32, 3(i+1)/32), |z_2| in [3j/32, 3(j+1)/32); zero outside [0,6)^2 and on
the axes):
    F(z_1, z_2) = ph(z_2) * conj(w)^17 * sum_{l=0}^{35} (cre[l] + i cim[l]) / 2^24 * w^l,   w = ph(z_1) conj(ph(z_2)).

The certificate, exactly as the paper states it: with C(w) = sum_l (cre[l] + i cim[l]) w^l and the witness
S(w) = sum_l (qre[l] + i qim[l]) w^l, put  kappa_m = sum_d (C[d+m] conj(C[d]) + S[d+m] conj(S[d]))  (m = 0..35).
On |w| = 1,  |C|^2 + |S|^2 = kappa_0 + 2 Re sum_{m>=1} kappa_m w^m, so
    |C(w)|^2 <= kappa_0 + 2 sum_{m=1}^{35} (|Re kappa_m| + |Im kappa_m|),
and the check is that the right-hand side is <= 2^48 in every cell.
"""
import sys

sys.dont_write_bytecode = True  # leave no __pycache__ next to the scripts

import cmath
import math
import random

import common
from common import Report

CAP = 1 << 48


def sos_total(cr, ci, qr, qi) -> int:
    """kappa_0 + 2 sum_{m>=1} (|Re kappa_m| + |Im kappa_m|) for one cell (lists of 36 integers)."""
    total = sum(a * a for a in cr) + sum(a * a for a in ci) + sum(a * a for a in qr) + sum(a * a for a in qi)
    for m in range(1, 36):
        re = im = 0
        for d in range(36 - m):
            e = d + m
            re += cr[e] * cr[d] + ci[e] * ci[d] + qr[e] * qr[d] + qi[e] * qi[d]
            im += ci[e] * cr[d] - cr[e] * ci[d] + qi[e] * qr[d] - qr[e] * qi[d]
        total += 2 * (abs(re) + abs(im))
    return total


def cell_fn(tab, z1: complex, z2: complex) -> complex:
    """The cell map, straight from its definition (floating point)."""
    r1, r2 = abs(z1), abs(z2)
    if z1 == 0 or z2 == 0 or r1 >= 6 or r2 >= 6:
        return 0j
    cell = 64 * math.floor(32 * r1 / 3) + math.floor(32 * r2 / 3)
    w = (z1 / r1) * (z2 / r2).conjugate()
    s = sum(complex(tab["cre"][l][cell], tab["cim"][l][cell]) * w ** l for l in range(36)) / 2 ** 24
    return (z2 / r2) * w.conjugate() ** 17 * s


def main() -> int:
    rep = Report("03  The cell maps f_tig and T_cell")
    try:
        import numpy as np
    except ImportError:
        np = None
    for which, name in (("tig", "f_tig"), ("tcell", "T_cell")):
        tab = common.cell_tables(which)
        rep.section(f"{name}: tables decoded from Haagerup/Data/{'TigerData' if which == 'tig' else 'TCellData'}.lean")
        flat = [v for key in ("cre", "cim", "qre", "qim") for row in tab[key] for v in row]
        rep.info(f"  4 tables of 36 x 4096 integers; largest absolute value {max(abs(v) for v in flat)} "
                 f"(2^24 = {1 << 24})")
        nonzero = sum(1 for c in range(4096) if any(tab["cre"][l][c] or tab["cim"][l][c] for l in range(36)))
        rep.info(f"  cells with a non-zero coefficient: {nonzero} of 4096")

        worst, worst_cell, bad = 0, None, 0
        for cell in range(4096):
            t = sos_total([tab["cre"][l][cell] for l in range(36)], [tab["cim"][l][cell] for l in range(36)],
                          [tab["qre"][l][cell] for l in range(36)], [tab["qim"][l][cell] for l in range(36)])
            if t > CAP:
                bad += 1
            if t > worst:
                worst, worst_cell = t, cell
        rep.check("exact", f"sum-of-squares bound <= 2^48 in all 4096 cells (cells failing: {bad})", bad == 0)
        rep.info(f"  largest bound: {worst} = 2^48 - {CAP - worst}, in cell (i, j) = "
                 f"({worst_cell // 64}, {worst_cell % 64}); it gives |F| <= sqrt(bound) / 2^24 <= 1")

        if np is None:
            rep.check("floating point", "numpy is installed (sampled maximum of |F|)", False)
        else:
            n = 4096                                           # points of the circle per cell
            c = (np.array(tab["cre"], dtype=np.float64) + 1j * np.array(tab["cim"], dtype=np.float64)) / 2.0 ** 24
            pad = np.zeros((n, 4096), dtype=np.complex128)
            pad[:36] = c
            vals = np.abs(np.fft.fft(pad, axis=0))             # |C(w)| / 2^24 at w = exp(-2 pi i k / n)
            per_cell = vals.max(axis=0)
            top = int(per_cell.argmax())
            rep.info(f"  sampled maximum of |F| over {n} points of the circle in each cell: "
                     f"{per_cell.max():.9f}, in cell ({top // 64}, {top % 64})")
            rep.check("floating point", "sampled maximum of |F| is <= 1", bool(per_cell.max() <= 1.0))
            rep.info(f"  cells where the sampled maximum exceeds 0.999: {int((per_cell > 0.999).sum())}; "
                     f"smallest sampled minimum of |F| over the non-zero cells: "
                     f"{vals.min(axis=0)[per_cell > 0].min():.6f}")

        rng = random.Random(20261125)
        err_charge = err_fft = 0.0
        outside = 0.0
        for _ in range(2000):
            z1 = cmath.rect(rng.uniform(0.0, 6.0), rng.uniform(0, 2 * math.pi))
            z2 = cmath.rect(rng.uniform(0.0, 6.0), rng.uniform(0, 2 * math.pi))
            u = cmath.rect(1.0, rng.uniform(0, 2 * math.pi))
            f = cell_fn(tab, z1, z2)
            err_charge = max(err_charge, abs(cell_fn(tab, u * z1, u * z2) - u * f))
            err_fft = max(err_fft, abs(f) - 1.0)
            outside = max(outside, abs(cell_fn(tab, 6.5 * z1 / abs(z1), z2)))
        rep.check("floating point", "charge one: |F(u z_1, u z_2) - u F(z_1, z_2)| <= 1e-12 at 2000 random points",
                  err_charge <= 1e-12)
        rep.check("floating point", "|F| <= 1 at the same random points, and F = 0 for |z_1| >= 6",
                  err_fft <= 0 and outside == 0)
    rep.section("The reflected partner")
    rep.info("  g_tig(z_1, z_2) = f_tig(-z_1, z_2) replaces w by -w, i.e. multiplies the coefficient of the")
    rep.info("  harmonic m = l - 17 by (-1)^m; it has the same modulus, so the same bound.")
    tab = common.cell_tables("tig")
    rng = random.Random(7)
    err = 0.0
    for _ in range(500):
        z1 = cmath.rect(rng.uniform(0.0, 6.0), rng.uniform(0, 2 * math.pi))
        z2 = cmath.rect(rng.uniform(0.0, 6.0), rng.uniform(0, 2 * math.pi))
        r1, r2 = abs(z1), abs(z2)
        cell = 64 * math.floor(32 * r1 / 3) + math.floor(32 * r2 / 3)
        w = (z1 / r1) * (z2 / r2).conjugate()
        alt = sum((-1) ** (l - 17) * complex(tab["cre"][l][cell], tab["cim"][l][cell]) * w ** (l - 17)
                  for l in range(36)) / 2 ** 24 * (z2 / r2)
        err = max(err, abs(cell_fn(tab, -z1, z2) - alt))
    rep.check("floating point", "f_tig(-z_1, z_2) = sum_m (-1)^m c_m ph(z_2) w^m at 500 random points, up to 1e-12",
              err <= 1e-12)
    return rep.finish()


if __name__ == "__main__":
    common.main_guard(main)

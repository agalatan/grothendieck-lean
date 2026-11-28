#!/usr/bin/env python3
"""04 - Recompute the overlaps mu_n of the reflected pair and the energies E(d1, d2) of the smoothed map from the
decoded cell maps, and compare with the certified intervals of the Lean data.

Arithmetic : floating point at high precision (non-rigorous): the incomplete gamma functions are evaluated with
             mpmath at several hundred digits, and the linear algebra is done on Python integers in fixed point
             with at least 200 guard bits beyond the 2^-128 of the intervals.  No error bound is proved here; the
             option --precision-check repeats the computation with 192 more bits and compares.
Paper      : the computations "Overlaps of f_tig" and "Energies of f_sm"; the proposition "Overlaps of a cell
             map" (the Laguerre formula for mu_n), the lemma "Hermite coefficients of the smoothed map", and the
             appendix sections on the Laguerre integrals, the overlaps of f_tig and the energies of f_sm.
Lean       : `Haagerup.Data.tig_mu_ok` and `Haagerup.Data.tcell_rows_ok` (OverlapData.lean) check the tables;
             `Haagerup.mem_muTigOf` (CellOverlapCore.lean) and `Haagerup.smoothedRowsCheck_table_sound`
             (CellOverlap.lean) prove that the tables enclose the true values; the formula for the smoothed
             energies is `Haagerup.smoothed_energy_eq` (CellHermite.lean).
Runtime    : default (mu_0..mu_40, E for d1 + 3 d2 <= 41) about 15 seconds;
             --all (mu_0..mu_250 and all 21,168 energies) about 12 minutes on one core (4 minutes with --jobs 3).
Needs      : mpmath.
Prints     : how many recomputed values lie inside their certified intervals, sample values to 36 decimals
             (truncated), the largest interval widths, and one line per check; progress lines go to stderr.

Method (different from the paper's algorithm, which Lean runs: there the cell integrals are propagated by
three-term recurrences in n in interval arithmetic; here every Laguerre polynomial is expanded in monomials and
integrated in closed form).

1. Cell integrals.  With s = |z|^2 and the grid s_i = (3i/32)^2,
       J(a, n, i) = int_{s_i}^{s_{i+1}} s^(a/2) (-1)^n L_n^(a)(s) e^(-s) ds
                  = sum_{j=0}^{n} (-1)^(n+j) binom(n+a, n-j) [ g(a/2+j+1, s_{i+1}) - g(a/2+j+1, s_i) ] / j!,
   g = the lower incomplete gamma function.  g(a/2+j+1, x)/j! is computed at the top j from the series
   x^s e^-x sum_k x^k / (s (s+1) ... (s+k)) and downwards by g(s, x) = (g(s+1, x) + x^s e^-x) / s (stable in
   this direction); at j = 0 it is compared with 1 - e^-x (a even) or with erf (a odd).
   In the paper's notation J(a, n, i) = (-1)^n I_{n,a,i}, and J_{n,a,i} = sqrt(n!/(n+a)!) I_{n,a,i}; the signs
   and the square roots disappear in the squares below.

2. Reflected pair.  For the harmonic m = l - 17 put a = |m|, b = |1 - m|, k0 = (a + b - 1)/2 and
       M_m(n1, n2) = sum_{i,j} (cre + i cim)[l][64 i + j] / 2^24 * J(a, n1, i) J(b, n2, j).
   Then  mu_n = sum_m (-1)^m sum_{n1 + n2 = n - k0} |M_m(n1, n2)|^2 * n1! n2! / ((n1 + a)! (n2 + b)!).

3. Smoothed map f_sm(z) = E_xi T_cell(ct z_1 + st z_2, se (-st z_1 + ct z_2) + ce xi).  A Wick monomial of z is
   mapped by the linear substitution to Wick monomials of the arguments of T_cell, which gives, for
   d1 + d2 = 2k + 1,
       E(d1, d2) = sum_{p2 + q2 = d2} binom(k+1, p1) binom(k, q1) / (k + 1) *
                   | sum_{j1, j2} beta(p1, p2, j1) beta(q1, q2, j2) G(k, j1, j2) |^2,     p1 = k+1-p2, q1 = k-q2,
   where beta(a, b, j) is the coefficient of x^j in (ct x - se st)^a (st x + se ct)^b (a rational number), and
       G(k, j1, j2) = M_m(n1, n2) n1! n2! / k!,   m = j1 - j2 in [-17, 18], n1 = min(j1, j2),
                                                  n2 = min(k + 1 - j1, k - j2)
   is the coefficient of T_cell on the Wick monomial z_1^j1 conj(z_1)^j2 z_2^(k+1-j1) conj(z_2)^(k-j2) (the
   paper's t_{j1,j2}, up to sign), divided by k!.  This is the paper's formula for the energies of f_sm with the
   factorials distributed as binomial coefficients, as in `Haagerup.smoothed_energy_eq`.

Each recomputed value v is compared with its interval: lo <= v * 2^128 <= hi.
"""
import sys

sys.dont_write_bytecode = True  # leave no __pycache__ next to the scripts

import argparse
import importlib.util
import math
from fractions import Fraction
from operator import mul

import common
from common import Report, dec, sci

GRID = 64          # radial cells per coordinate
A_MAX = 18         # |m| <= 18 and |1 - m| <= 18 for m = -17..18
_STATE = {}        # shared with forked workers


def log(msg: str) -> None:
    print(msg, file=sys.stderr, flush=True)


# ------------------------------------------------------------------------------------------------- step 1
def laguerre_cell_integrals(n_max: int, bits: int):
    """J[a][n][i] = round-down of 2^bits * J(a, n, i), for a = 0..18, n = 0..n_max, i = 0..63."""
    import mpmath as mp
    mp.mp.prec = bits + 256
    sqrt_pi = mp.sqrt(mp.pi)
    table = []
    worst = mp.mpf(0)
    for a in range(A_MAX + 1):
        fixed = [[0] * (GRID + 1) for _ in range(n_max + 1)]          # fixed[j][i] ~ 2^bits g(a/2+j+1, s_i)/j!
        for i in range(1, GRID + 1):
            r = mp.mpf(3 * i) / 32
            x = r * r
            ex = mp.exp(-x)
            pw = [r ** a * ex]                                         # pw[j] = x^(a/2+j) e^-x / j!
            for j in range(1, n_max + 1):
                pw.append(pw[-1] * x / j)
            s = mp.mpf(a + 2 * n_max + 2) / 2                          # s = a/2 + n_max + 1
            term = 1 / s
            total = term
            k = 1
            while term > mp.ldexp(total, -(bits + 250)):
                term = term * x / (s + k)
                total += term
                k += 1
            d = [None] * (n_max + 1)
            d[n_max] = pw[n_max] * x * total                           # g(s, x) / n_max!
            for j in range(n_max, 0, -1):
                alpha = mp.mpf(a + 2 * j) / 2
                d[j - 1] = j * (d[j] + pw[j]) / alpha
            if a == 0:
                worst = max(worst, abs(d[0] - (1 - ex)))
            elif a == 1:
                worst = max(worst, abs(d[0] - (sqrt_pi / 2 * mp.erf(r) - r * ex)))
            for j in range(n_max + 1):
                fixed[j][i] = int(mp.floor(mp.ldexp(d[j], bits)))
        cols = [[fixed[j][i + 1] - fixed[j][i] for j in range(n_max + 1)] for i in range(GRID)]
        ja = []
        for n in range(n_max + 1):
            coef = [(-1) ** (n + j) * math.comb(n + a, n - j) for j in range(n + 1)]
            ja.append([sum(map(mul, coef, cols[i])) for i in range(GRID)])
        table.append(ja)
    closed_form_ok = worst < mp.ldexp(1, -(bits + 100))
    return table, closed_form_ok


# ------------------------------------------------------------------------------------------------- step 2
def _rising(n: int, a: int) -> int:
    return math.factorial(n + a) // math.factorial(n)


def _mode_worker(l: int):
    """Mode overlaps of harmonic l.  kind "mu": the contributions to mu_n as integers at scale 2^Q;
    kind "g": the scaled coefficients G of step 3 as integers at scale 2^pg."""
    st = _STATE
    tab, J, bits = st["tab"], st["J"], st["jbits"]
    m = l - 17
    a, b = abs(m), abs(1 - m)
    k0 = (a + b - 1) // 2
    nr = st["n_lim"] - k0
    if nr < 0:
        return l, None
    cre, cim = tab["cre"][l], tab["cim"][l]
    cre_cols = [[cre[64 * i + j] for i in range(GRID)] for j in range(GRID)]
    cim_cols = [[cim[64 * i + j] for i in range(GRID)] for j in range(GRID)]
    ja, jb = J[a], J[b]
    if st["kind"] == "mu":
        q = st["qbits"]
        shift = 4 * bits + 48
        out = [0] * (st["n_lim"] + 1)
        for n1 in range(nr + 1):
            row = ja[n1]
            gre = [sum(map(mul, row, c)) for c in cre_cols]
            gim = [sum(map(mul, row, c)) for c in cim_cols]
            ra = _rising(n1, a)
            for n2 in range(nr - n1 + 1):
                re = sum(map(mul, gre, jb[n2]))
                im = sum(map(mul, gim, jb[n2]))
                out[k0 + n1 + n2] += ((re * re + im * im) << q) // ((ra * _rising(n2, b)) << shift)
        return l, [(-x if m % 2 else x) for x in out]
    pg = st["pg"]
    shift = 2 * bits + 24
    out = []
    for n1 in range(nr + 1):
        row = ja[n1]
        gre = [sum(map(mul, row, c)) for c in cre_cols]
        gim = [sum(map(mul, row, c)) for c in cim_cols]
        line = []
        for n2 in range(nr - n1 + 1):
            den = (math.comb(n1 + n2, n1) * _rising(n1 + n2, k0)) << shift     # k!/(n1! n2!) * 2^(2 bits + 24)
            line.append(((sum(map(mul, gre, jb[n2])) << pg) // den, (sum(map(mul, gim, jb[n2])) << pg) // den))
        out.append(line)
    return l, out


def _pool_map(fn, items, jobs: int):
    if jobs > 1:
        try:
            import multiprocessing
            ctx = multiprocessing.get_context("fork")
        except (ImportError, ValueError):
            ctx = None
        if ctx is not None:
            with ctx.Pool(jobs) as pool:
                return list(pool.imap(fn, items, 1))
    return [fn(x) for x in items]


# ------------------------------------------------------------------------------------------------- step 3
def _energy_worker(ks):
    """E(d1, d2) for every pair with (d1 + d2 - 1)/2 in ks and d1 + 3 d2 <= e_max, as exact Fractions of the
    fixed-point amplitudes."""
    st = _STATE
    G, pg, pb, e_max = st["G"], st["pg"], st["pb"], st["e_max"]
    u0, u1, v0, v1, den_m = st["lin"]
    ks = sorted(ks)
    want = set(ks) | {k + 1 for k in ks}
    out = {}
    level = {0: [1]}                       # level[b] = numerators of beta(d - b, b, .), over den_m^d
    fixed_prev = None                      # fixed-point rows of level d - 1
    for d in range(0, ks[-1] + 2):
        if d > 0:
            new = {}
            for b, old in level.items():   # multiply by (u0 x + u1)
                row = [u1 * old[0]]
                row.extend(u0 * old[j - 1] + u1 * old[j] for j in range(1, d))
                row.append(u0 * old[d - 1])
                new[b] = row
            if d <= 167:                   # beta(0, d, .) = (v0 x + v1) * beta(0, d - 1, .)
                old = level[d - 1]
                row = [v1 * old[0]]
                row.extend(v0 * old[j - 1] + v1 * old[j] for j in range(1, d))
                row.append(v0 * old[d - 1])
                new[d] = row
            level = new
        if d not in want:
            fixed_prev = None
            continue
        dd = den_m ** d
        fixed = {b: [(x << pb) // dd for x in row] for b, row in level.items()}
        k = d - 1
        if k in ks and fixed_prev is not None:
            _energies_at(k, fixed_prev, fixed, G, pg, pb, e_max, out)
        fixed_prev = fixed
    return out


def _energies_at(k, bq, bp, G, pg, pb, e_max, out):
    max_d2 = min(167, (e_max - 2 * k - 1) // 2, 2 * k + 1)
    if max_d2 < 0:
        return
    band = []                              # for each j1: (first j2, re list, im list)
    for j1 in range(k + 2):
        j2a, j2b = max(0, j1 - 18), min(k, j1 + 17)
        re, im = [], []
        for j2 in range(j2a, j2b + 1):
            g = G[j1 - j2 + 17][min(j1, j2)][min(k + 1 - j1, k - j2)]
            re.append(g[0])
            im.append(g[1])
        band.append((j2a, j2b + 1, re, im))
    t_re, t_im = [], []
    for q2 in range(min(max_d2, k) + 1):
        row = bq[q2]                       # beta(k - q2, q2, .), length k + 1
        t_re.append([sum(map(mul, re, row[a:b])) for a, b, re, _ in band])
        t_im.append([sum(map(mul, im, row[a:b])) for a, b, _, im in band])
    shift = 2 * (pg + 2 * pb)
    for d2 in range(max_d2 + 1):
        d1 = 2 * k + 1 - d2
        num = 0
        for p2 in range(max(0, d2 - k), min(d2, k + 1) + 1):
            q2 = d2 - p2
            row = bp[p2]                   # beta(k + 1 - p2, p2, .), length k + 2
            are = sum(map(mul, row, t_re[q2]))
            aim = sum(map(mul, row, t_im[q2]))
            num += math.comb(k + 1, p2) * math.comb(k, q2) * (are * are + aim * aim)
        out[(d1, d2)] = Fraction(num, (k + 1) << shift)


# ------------------------------------------------------------------------------------------------- driver
def recompute(n_mu: int, e_max: int, extra_bits: int, jobs: int):
    """Returns (mu, energies, closed_form_ok): mu[n] for n <= n_mu and {(d1, d2): E} for d1 + 3 d2 <= e_max."""
    k_max = (e_max - 1) // 2
    n_max = max(n_mu, k_max)
    jbits = 2 * n_max + 400 + extra_bits
    log(f"  [04] cell integrals: n <= {n_max}, {jbits} fractional bits ...")
    J, closed_form_ok = laguerre_cell_integrals(n_max, jbits)
    par = common.parameters()

    _STATE.clear()
    _STATE.update(tab=common.cell_tables("tig"), J=J, jbits=jbits, n_lim=n_mu, kind="mu", qbits=600 + extra_bits)
    log("  [04] reflected pair: mode overlaps and mu_n ...")
    mu_int = [0] * (n_mu + 1)
    for _, part in _pool_map(_mode_worker, range(36), jobs):
        if part is not None:
            for n, x in enumerate(part):
                mu_int[n] += x
    mu = [Fraction(x, 1 << _STATE["qbits"]) for x in mu_int]

    pg = pb = max(2 * k_max + 220, 420) + extra_bits
    _STATE.clear()
    _STATE.update(tab=common.cell_tables("tcell"), J=J, jbits=jbits, n_lim=k_max, kind="g", pg=pg)
    log("  [04] smoothed map: mode overlaps of T_cell ...")
    G = [None] * 36
    for l, part in _pool_map(_mode_worker, range(36), jobs):
        G[l] = part
    ct, st, se = par["ctQ"], par["stQ"], par["seQ"]
    den_m = se.denominator * ct.denominator
    lin = (int(ct * den_m), int(-se * st * den_m), int(st * den_m), int(se * ct * den_m), den_m)
    assert ct.denominator == st.denominator and Fraction(lin[1], den_m) == -se * st
    _STATE.clear()
    _STATE.update(G=G, pg=pg, pb=pb, e_max=e_max, lin=lin)
    log("  [04] smoothed map: energies ...")
    chunks = [list(range(r, k_max + 1, max(jobs, 1))) for r in range(max(jobs, 1))]
    energies = {}
    for part in _pool_map(_energy_worker, [c for c in chunks if c], jobs):
        energies.update(part)
    _STATE.clear()
    return mu, energies, closed_form_ok


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--all", action="store_true", help="mu_0..mu_250 and all 21,168 energies (long)")
    ap.add_argument("--n-mu", type=int, default=40, help="recompute mu_0..mu_N (default 40, at most 250)")
    ap.add_argument("--e-max", type=int, default=41, help="recompute E(d1,d2) for d1 + 3 d2 <= this (default 41, at most 501)")
    ap.add_argument("--jobs", type=int, default=1, help="worker processes (fork); the output does not depend on it")
    ap.add_argument("--precision-check", action="store_true",
                    help="repeat with 192 more bits and compare (always done unless --all)")
    args = ap.parse_args()
    n_mu, e_max = (250, 501) if args.all else (args.n_mu, args.e_max)
    if not (0 <= n_mu <= 250 and 1 <= e_max <= 501):
        ap.error("need 0 <= n-mu <= 250 and 1 <= e-max <= 501")
    rep = Report(f"04  Overlaps recomputed from the cell maps: mu_0..mu_{n_mu}, E(d1, d2) for d1 + 3 d2 <= {e_max}")
    if importlib.util.find_spec("mpmath") is None:
        rep.check("floating point", "mpmath is installed", False)
        return rep.finish()

    mu, energies, closed_ok = recompute(n_mu, e_max, 0, args.jobs)
    rep.section("Cell integrals")
    rep.check("floating point", "g(a/2 + 1, s_i) agrees with 1 - exp(-s) (a = 0) and with the erf formula (a = 1) "
                                "at all 64 grid points, beyond the working precision of the tables", closed_ok)

    rep.section(f"Reflected pair: mu_0 .. mu_{n_mu} against tigMuList")
    cert = common.tig_mu_intervals()
    inside = 0
    margin = None
    for n, v in enumerate(mu):
        lo, hi = cert[n]
        x = v * common.SCALE
        if lo <= x <= hi:
            inside += 1
        mg = min(x - lo, hi - x)
        margin = mg if margin is None else min(margin, mg)
    for n in list(range(0, min(n_mu, 5) + 1)) + ([n_mu] if n_mu > 5 else []):
        rep.info(f"  mu_{n:<3d} = {dec(mu[n], 36)}   interval [{cert[n][0]}, {cert[n][1]}] / 2^128")
    rep.check("floating point", f"{inside} of {len(mu)} recomputed values lie inside their certified intervals",
              inside == len(mu))
    rep.info(f"  largest width among these intervals: {max(cert[n][1] - cert[n][0] for n in range(n_mu + 1))} / 2^128; "
             f"smallest distance of a value to an endpoint: {sci(margin, 2)} / 2^128")

    rep.section(f"Smoothed map: E(d1, d2), d1 + d2 odd, d1 + 3 d2 <= {e_max}, against tcellRows")
    table = common.tcell_energy_intervals()
    expected = sorted(key for key in table if key[0] + 3 * key[1] <= e_max)
    rep.check("exact", f"the recomputed index set is the table's: {len(expected)} pairs",
              sorted(energies) == expected)
    inside = 0
    margin = None
    width = 0
    for key in expected:
        lo, hi = table[key]
        x = energies[key] * common.SCALE
        if lo <= x <= hi:
            inside += 1
        mg = min(x - lo, hi - x)
        margin = mg if margin is None else min(margin, mg)
        width = max(width, hi - lo)
    for key in [(1, 0), (0, 1), (3, 0), (2, 1), (1, 2), (0, 3)] + ([expected[-1]] if e_max > 9 else []):
        if key in energies:
            rep.info(f"  E{key} = {dec(energies[key], 36)}   interval [{table[key][0]}, {table[key][1]}] / 2^128")
    rep.check("floating point", f"{inside} of {len(expected)} recomputed values lie inside their certified intervals",
              inside == len(expected))
    rep.info(f"  largest width among these intervals: {width} / 2^128; "
             f"smallest distance of a value to an endpoint: {sci(margin, 2)} / 2^128")
    total = sum(energies.values())
    rep.info(f"  sum of the recomputed energies: {dec(total, 12)} (at most ||f_sm||^2 <= 1)")
    rep.check("floating point", "every recomputed energy is >= 0 and their sum is <= 1",
              min(energies.values()) >= 0 and total <= 1)

    rep.section("Summary")
    rep.info(f"  values checked: {len(mu)} overlaps mu_n and {len(expected)} energies E(d1, d2)")
    if args.precision_check or not args.all:
        mu2, en2, _ = recompute(n_mu, e_max, 192, args.jobs)
        diff = max([abs(a - b) for a, b in zip(mu, mu2)] + [abs(energies[key] - en2[key]) for key in expected])
        rep.check("floating point", "recomputing with 192 more bits changes no value by more than 2^-250 "
                                    "(the intervals have scale 2^-128)", diff < Fraction(1, 1 << 250))
    return rep.finish()


if __name__ == "__main__":
    common.main_guard(main)

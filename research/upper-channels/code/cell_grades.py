#!/usr/bin/env python3
"""Signed Hermite grades of the cell response pair of the eighteen-channel certificate, recomputed
from its integer cell data in Arb ball arithmetic (python-flint), independently of the Lean replay.

mu_n = sum over tensor Hermite indices of total degree 2n+1 of Re(conj<h,F> <h,G>), where F, G are the
two charge-one responses  ph(z2) * table[angular cell of arg(z1 conj z2), radial cell of |z1|, of |z2|]
(64 centred angular cells, 128 x 128 radial cells of width 6/128, zero beyond radius 6, entries / 2^26).

Angular mode m of the relative phase: c_m = sinc(m pi/64)/64 * sum_k exp(-2 pi i m k/64) v_k.
Radial part: orthonormal Laguerre functions phi_{n,a}(s) = sqrt(n!/(n+a)!) s^(a/2) L_n^(a)(s) on
(0,inf) with weight exp(-s), s = |z|^2; cell integrals J_{n,a,i} through lower incomplete gamma
functions.  Mode m contributes to grade n = n1 + n2 + k0(m), k0 = (|m| + |1-m| - 1)/2.

Research script (label N until replayed by someone else; the balls are rigorous only as far as this
derivation and Arb are).  Agent-ID: claude-b9ee (worker).
Usage: cell_grades.py CELL_INPUTS.npz N OUT.json [nproc] [prec_bits]"""
import json, sys, time
from math import comb, factorial
from multiprocessing import Pool
import numpy as np
from flint import arb, arb_mat, fmpq, ctx

NPZ, N, OUT = sys.argv[1], int(sys.argv[2]), sys.argv[3]
NPROC = int(sys.argv[4]) if len(sys.argv) > 4 else 30
PREC = int(sys.argv[5]) if len(sys.argv) > 5 else 1536
LOW = 512
A, NR = 64, 128
DIG = PREC // 3  # decimal digits used to pass balls between processes (rigorous, slightly widened)

def s_out(x, digits):
    return x.str(digits, radius=True)

def gamma_job(two_alpha):
    ctx.prec = PREC
    al = arb(fmpq(two_alpha, 2))
    return two_alpha, [s_out(arb(fmpq(9 * i * i, 4096)).gamma_lower(al), DIG) if i else "0" for i in range(NR + 1)]

G = {}      # two_alpha -> 129 balls gamma(alpha, x_i), x_i = (6 i/128)^2
V = {}      # the four integer tables as 64 x 16384 arb matrices

def J_mat(a, nmax):
    """J[n][i] = int over radial cell i of phi_{n,a}(s) exp(-s) ds, n <= nmax."""
    ctx.prec = PREC
    cf = arb_mat([[arb(fmpq((-1) ** k * comb(n + a, n - k), factorial(k))) if k <= n else arb(0)
                   for k in range(nmax + 1)] for n in range(nmax + 1)])
    gd = arb_mat([[G[a + 2 * k + 2][i + 1] - G[a + 2 * k + 2][i] for i in range(NR)] for k in range(nmax + 1)])
    J = cf * gd
    sc = [arb(fmpq(factorial(n), factorial(n + a))).sqrt() for n in range(nmax + 1)]
    ctx.prec = LOW
    return arb_mat([[sc[n] * J[n, i] for i in range(NR)] for n in range(nmax + 1)])

def mode_job(m):
    t0 = time.time()
    k0 = m - 1 if m >= 1 else -m
    nmax = N - k0
    if nmax < 0 or (m != 0 and m % A == 0):
        return m, k0, [], 0.0
    J1 = J_mat(abs(m), nmax)
    J2t = J_mat(abs(1 - m), nmax).transpose()
    ctx.prec = LOW
    pi = arb.pi()
    fac = arb(1) / A if m == 0 else (pi * m / A).sin() / (pi * m)
    cs = arb_mat([[(2 * pi * m * k / A).cos() * fac for k in range(A)]])
    sn = arb_mat([[(2 * pi * m * k / A).sin() * fac for k in range(A)]])
    hat = {}
    for nm in ("F", "G"):
        re = cs * V[nm + "re"] + sn * V[nm + "im"]      # exp(-i theta)(x + i y)
        im = cs * V[nm + "im"] - sn * V[nm + "re"]
        hat[nm] = (J1 * arb_mat(NR, NR, re.entries()) * J2t, J1 * arb_mat(NR, NR, im.entries()) * J2t)
    out = [arb(0) for _ in range(nmax + 1)]
    (fr, fi), (gr, gi) = hat["F"], hat["G"]
    for n1 in range(nmax + 1):
        for n2 in range(nmax + 1 - n1):
            out[n1 + n2] += fr[n1, n2] * gr[n1, n2] + fi[n1, n2] * gi[n1, n2]
    return m, k0, [s_out(x, 140) for x in out], time.time() - t0

if __name__ == "__main__":
    t0 = time.time()
    z = np.load(NPZ)
    assert int(z["q_shift"]) == 26
    arrs = {k: z[k + "_i"].astype(object) for k in ("F_re", "F_im", "G_re", "G_im")}
    for nm in ("F", "G"):
        x, y = arrs[nm + "_re"], arrs[nm + "_im"]
        assert x.shape == (A, NR, NR) and int((x * x + y * y).max()) <= 1 << 52   # no entry is clipped
    with Pool(NPROC) as pool:
        for ta, row in pool.imap_unordered(gamma_job, range(2, 2 * N + 5), chunksize=4):
            ctx.prec = PREC
            G[ta] = [arb(s) for s in row]
    print("gamma table: %.1f s" % (time.time() - t0), flush=True)
    ctx.prec = LOW
    den = arb(1 << 26)
    for nm in ("F", "G"):
        for part in ("re", "im"):
            V[nm + part] = arb_mat(A, NR * NR, [arb(int(v)) / den for v in arrs[f"{nm}_{part}"].reshape(-1)])
    print("tables: %.1f s" % (time.time() - t0), flush=True)
    mu = [arb(0) for _ in range(N + 1)]
    modes = sorted(range(-N, N + 2), key=lambda m: abs(m))       # heavy modes first
    with Pool(NPROC) as pool:                                     # forked after G and V exist
        for m, k0, vals, dt in pool.imap_unordered(mode_job, modes):
            ctx.prec = LOW
            for t, s in enumerate(vals):
                mu[k0 + t] += arb(s)
            if abs(m) % 16 == 0:
                print("mode %d done (%.1f s in worker, %.1f s elapsed)" % (m, dt, time.time() - t0), flush=True)
    ctx.prec = LOW
    rad = max(float(x.rad()) for x in mu)
    json.dump(dict(agent="claude-b9ee-worker", N=N, prec_bits=PREC, max_radius=rad,
                   note="mu_n as Arb balls printed with 100 digits; label N (not replayed)",
                   grades=[s_out(x, 100) for x in mu]), open(OUT, "w"), indent=0)
    print("N = %d: max radius %.3e ; mu_0 = %s ; %.1f s" % (N, rad, s_out(mu[0], 40), time.time() - t0), flush=True)

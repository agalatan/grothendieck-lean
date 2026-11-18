#!/usr/bin/env python3
"""Generate HaagerupRefutation/HeadData.lean: per channel of the six-channel certificate, the centres of the head
coefficients h_i(0..250), an l1 radius of the head and a bound on the tail beyond 250, as integers at the scale 10^30.
The output is byte for byte reproducible.

Run from the repository root (the script finds its inputs relative to its own location; about 3 minutes on one
core, 0.5 GB of memory):

    nice -n 10 uv run --offline --no-project --with numpy --with python-flint \\
        python3 -I haagerup-article/lean/scripts/gen_head_data.py [--check] [--dump OUT.json]

  --check       write nothing; exit 1 unless HeadData.lean equals the regenerated text
  --dump PATH   also write diagnostics (mu midpoints, per-channel sums, Hardy data) as JSON to PATH

Tested with Python 3.14.8, python-flint 0.9.0 and numpy 2.5.5. One process, one thread; it lowers its own priority
to nice 10 at least.

Inputs (all committed; nothing else is read):
  haagerup-article/certificate/channels.json, tiger.json, tiger.npz   checked against certificate/SHA256SUMS
  Grothe/Upper/Data.lean                     the GT energy table energyStrs, bQ, etaQ, energyErrQ, and the production
                                             column pList, qList, slopeQ, headCapQ (a self-test of the table convention)
  Grothe/UpperTightBudget.lean, Grothe/Upper/ComparisonGroups.lean, Grothe/Upper/ThreeBandBudget.lean,
  Grothe/Upper/ComparisonData.lean, GrotheKernel/BandMass.lean
                                             the radii and bands of the GT comparison: the constants used below are
                                             checked against the verbatim Lean definitions (LEAN_SNIPPETS)

The numerics are those of the certificate's verifier (verify_cert.py, 256-bit Arb balls), done per channel:
  heads     GT: h^tab_i(k) = sum over the table of E_tab(n1,n2) [X^k] X^((n1+n2-1)/2) P^n1 Q^n2;
            tiger: sum_m mu_m [X^(k-m)] R^(2m+1), with balls for mu_0..mu_250 (Laguerre cell integrals at 1024 bits,
            exact DFT of the integer table); phase: the same with Haagerup's r_m;
  allowance the GT comparison eps_GT >= sum_{n1+3n2<=501} |E_GT - E_tab| (article, Proposition 6.1), here as an exact
            rational upper bound (square roots rounded up), so that sum_{k<=250} |h_i(k) - h^tab_i(k)| <= eps_GT;
  tails     the Hardy bound of the article, Section 5 (Theorem 5.2 and Lemma 5.3 with K = 250), with the verifier's
            interval cover; the linear coefficient is bounded below by the ball's lower end (minus eps_GT for GT).
Rounding (exact rational arithmetic on the balls' midpoints and radii):
  centre_i[k] = nearest integer to S * mid(ball_i(k));
  radius_i    = ceil(S * (eps_GT [GT only] + sum_{k<=250} (|mid(ball_i(k)) - centre_i[k]/S| + rad(ball_i(k)))));
  tail_i      = ceil(S * (mid + rad of the Hardy tail ball)).
"""
import argparse
import hashlib
import json
import math
import os
import re
import sys
import time
from fractions import Fraction

os.environ["OMP_NUM_THREADS"] = "1"
import numpy as np  # noqa: E402
import flint  # noqa: E402

flint.ctx.prec = 256
flint.ctx.threads = 1
arb, acb, arb_mat, acb_mat, arb_poly = flint.arb, flint.acb, flint.arb_mat, flint.acb_mat, flint.arb_poly

KH = 250                      # head k = 0..KH; the tail is k > KH
SCALE = 10 ** 30              # common scale of every integer in HeadData.lean
HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.normpath(os.path.join(HERE, "..", "..", ".."))
CERT_REL = "haagerup-article/certificate"
OUT_REL = "haagerup-article/lean/HaagerupRefutation/HeadData.lean"
DATA_REL = "Grothe/Upper/Data.lean"
CERT_FILES = ["channels.json", "tiger.json", "tiger.npz"]
t0 = time.time()


def log(s):
    print(f"[{time.time() - t0:7.1f}s] {s}", flush=True)


def path(rel):
    return os.path.join(ROOT, *rel.split("/"))


def sha256(rel):
    with open(path(rel), "rb") as fh:
        return hashlib.sha256(fh.read()).hexdigest()


def A(q):
    q = Fraction(q)
    return arb(int(q.numerator)) / arb(int(q.denominator))


def interval(lo, hi):
    return lo.union(hi)


def trunc_poly(p, L):
    return p if p.length() <= L else arb_poly(p.coeffs()[:L])


def exact(x):
    """The exact value of an exact arb (radius 0) as a Fraction."""
    m, e = x.man_exp()
    m, e = int(m), int(e)
    return Fraction(m << e) if e >= 0 else Fraction(m, 1 << -e)


def ball(x):
    """(midpoint, radius) of an arb ball, as exact Fractions."""
    assert x.is_finite(), x
    return exact(x.mid()), exact(x.rad())


def ceil_frac(q):
    return -((-q.numerator) // q.denominator)


def dec_up(q, sig=31):
    """A decimal upper bound of the rational q > 0 with sig significant digits, as 'd.ddd...e<exponent>'."""
    assert q > 0
    e = 0
    while q >= Fraction(10) ** (e + 1):
        e += 1
    while q < Fraction(10) ** e:
        e -= 1
    s = str(ceil_frac(q / Fraction(10) ** (e - sig + 1)))
    if len(s) > sig:            # rounded up to 10^sig
        e, s = e + 1, s[:sig]
    return f"{s[0]}.{s[1:]}e{e}"


def sqrt_up(q, bits=256):
    """A rational upper bound of sqrt(q) for a rational q >= 0, within 2^-bits."""
    assert q >= 0
    n = ceil_frac(q * 4 ** bits)
    return Fraction(math.isqrt(n) + 1, 2 ** bits)


# ---------------------------------------------------------------------------------------------- 0. inputs and hashes
def check_inputs():
    sums = {}
    with open(path(CERT_REL + "/SHA256SUMS")) as fh:
        for line in fh:
            h, name = line.split()
            sums[name] = h
    assert sorted(sums) == sorted(CERT_FILES), sums
    for name in CERT_FILES:
        assert sha256(CERT_REL + "/" + name) == sums[name], f"SHA-256 mismatch: {name}"
    return {CERT_REL + "/" + n: sums[n] for n in CERT_FILES} | {DATA_REL: sha256(DATA_REL)}


# The Lean definitions behind the constants of the GT allowance, verbatim. The generator stops if any differs.
LEAN_SNIPPETS = {
    "Grothe/UpperTightBudget.lean": [
        "def tightQuadRadiusQ : Fin 3 → ℚ\n  | 0 => 9 / 10 ^ 15\n  | 1 => 17 / 10 ^ 15\n  | _ => 1132 / 10 ^ 15\n",
        "def tightLowReserveQ : Fin 3 → ℚ\n  | 0 => 1 / 2 ^ 41\n  | 1 => 1 / 2 ^ 42\n  | _ => 1 / 2 ^ 45\n",
        "def tightLowErrorQ (g : Fin 3) : ℚ := tightQuadRadiusQ g + tightLowReserveQ g\n",
        "def tightScaledRQ : Fin 3 → ℚ\n  | 0 => 6338057765 / 10 ^ 15\n  | 1 => 1086368451 / 10 ^ 15\n"
        "  | _ => 334910976 / 10 ^ 15\n",
        "def tightGroupRadiusQ (g : Fin 4) : ℚ :=\n  if g = 0 then comparisonGroupRadiusQ 0 else\n"
        "  if g = 1 then tightScaledRQ 0 else\n  if g = 2 then tightScaledRQ 1 else tightScaledRQ 2\n",
        "def tightThreeBandErrorQ (j : Fin 7) : ℚ :=\n  if j = 0 then tightGroupRadiusQ 0 else\n"
        "  if j = 1 then tightLowErrorQ 0 else\n  if j = 2 then tightScaledRQ 0 else\n"
        "  if j = 3 then tightLowErrorQ 1 / 2 else\n  if j = 4 then tightScaledRQ 1 else\n"
        "  if j = 5 then tightLowErrorQ 2 / 6 else tightScaledRQ 2\n",
    ],
    "Grothe/Upper/ComparisonGroups.lean": [
        "def comparisonGroupRadiusQ (g : Fin 4) : ℚ :=\n  if g = 0 then 1 / 1000000000000000000 else\n",
    ],
    "Grothe/Upper/ThreeBandBudget.lean": [
        "def threeBandBands (j : Fin 7) : ComparisonBand :=\n  if j = 0 then comparisonBands[0] else\n"
        "  if j = 1 then comparisonBands[1] else\n"
        "  if j = 2 then ⟨51, 0, threeBandScaledRQ 0, threeBandHighRadiusQ 0⟩ else\n"
        "  if j = 3 then comparisonBands[8] else\n"
        "  if j = 4 then ⟨51, 0, threeBandScaledRQ 1, threeBandHighRadiusQ 1⟩ else\n"
        "  if j = 5 then comparisonBands[13] else\n"
        "    ⟨11, 0, threeBandScaledRQ 2, threeBandHighRadiusQ 2⟩\n",
    ],
    "GrotheKernel/BandMass.lean": [
        "def ComparisonBand.contains (b : ComparisonBand) (n m : Nat) : Bool :=\n"
        "  b.lo < n + m && (b.hi == 0 || n + m ≤ b.hi)\n",
    ],
}
# (lo, hi) of comparisonBands[0], [1], [8], [13] in Grothe/Upper/ComparisonData.lean
COMPARISON_BANDS_USED = {0: (0, 0), 1: (0, 51), 8: (0, 51), 13: (0, 11)}

# The same constants in Python: tightLowErrorQ, tightScaledRQ, tightGroupRadiusQ, tightThreeBandErrorQ, threeBandBands.
TL = [Fraction(9, 10**15) + Fraction(1, 2**41), Fraction(17, 10**15) + Fraction(1, 2**42),
      Fraction(1132, 10**15) + Fraction(1, 2**45)]
TR = [Fraction(6338057765, 10**15), Fraction(1086368451, 10**15), Fraction(334910976, 10**15)]
TG = [Fraction(1, 10**18), TR[0], TR[1], TR[2]]
TBE = [TG[0], TL[0], TR[0], TL[1] / 2, TR[1], TL[2] / 6, TR[2]]
BANDS = [(0, 0), (0, 51), (51, 0), (0, 51), (51, 0), (0, 11), (11, 0)]


def band_contains(j, n, m):
    lo, hi = BANDS[j]
    return lo < n + m and (hi == 0 or n + m <= hi)


def check_lean_snippets():
    for rel, snippets in LEAN_SNIPPETS.items():
        text = open(path(rel), encoding="utf-8").read()
        for s in snippets:
            assert s in text, f"{rel}: definition changed:\n{s}"
    text = open(path("Grothe/Upper/ComparisonData.lean"), encoding="utf-8").read()
    blk = re.search(r"def comparisonBands : List ComparisonBand := \[(.*?)\]\n", text, re.S).group(1)
    lohi = [(int(a), int(b)) for a, b in re.findall(r"⟨(\d+), (\d+), ", blk)]
    assert len(lohi) == 18
    for i, v in COMPARISON_BANDS_USED.items():
        assert lohi[i] == v, (i, lohi[i], v)


# ---------------------------------------------------------------------------------------------- 1. Data.lean
def read_data_lean():
    text = open(path(DATA_REL), encoding="utf-8").read()

    def rat_def(name):
        m = re.search(r"def " + name + r" : ℚ := \((-?\d+) : ℚ\) / (\d+)\n", text)
        return Fraction(int(m.group(1)), int(m.group(2)))

    def rat_list(name):
        blk = re.search(r"def " + name + r" : List ℚ :=\s*\[(.*?)\]\n", text, re.S).group(1)
        return [Fraction(int(a), int(b) if b else 1) for a, b in re.findall(r"\((-?\d+) : ℚ\)(?: / (\d+))?", blk)]

    consts = {n: rat_def(n) for n in ("bQ", "etaQ", "energyErrQ", "slopeQ", "headCapQ")}
    consts["pList"], consts["qList"] = rat_list("pList"), rat_list("qList")
    blk = re.search(r"def energyStrs\s*:\s*List String\s*:=\s*\[(.*?)\]\n", text, re.S).group(1)
    rows, seen = [], set()
    for line in re.findall(r'"([^"]*)"', blk):
        assert "-" not in line
        ms, rest = line.split(":")
        m = int(ms)
        ents = []
        for it in rest.split(";"):
            n, a, k = (int(x) for x in it.split(","))
            assert (n + m) % 2 == 1 and n + 3 * m <= 2 * KH + 1 and (n, m) not in seen
            seen.add((n, m))
            ents.append((n, Fraction(a, 2 ** k)))
        rows.append((m, ents))
    assert len(seen) == 21168, len(seen)
    return consts, rows


# ---------------------------------------------------------------------------------------------- 2. GT allowance
def gt_allowance(rows, energy_err):
    """Exact rational upper bound of 2 sum_j a_j e_j + (sum_g R_g)^2 + energyErrQ with a_j^2 = band mass + energyErrQ
    (UpperTightComparison.localized_comparison_of_weight_mass_radii at w = 1, plus Final.hclose_final)."""
    mass = [Fraction(0)] * 7
    for m, ents in rows:
        for n, v in ents:
            for j in range(7):
                if band_contains(j, n, m):
                    mass[j] += v
    eps = sum(TG) ** 2 + energy_err
    for j in range(7):
        eps += 2 * sqrt_up(mass[j] + energy_err) * TBE[j]
    return eps


# ---------------------------------------------------------------------------------------------- 3. tiger overlaps
def parse_edges(lst):
    out = [None if s == "inf" else Fraction(s) for s in lst]
    assert out[0] == 0 and all(out[i] < out[i + 1] for i in range(len(out) - 2))
    assert all(x is not None for x in out[:-1])
    return out


def lag_tables(edges, amax, nmax, transpose):
    """For a = 0..amax: the matrix of cell integrals int_{cell i} phi_{n,a}(r) 2 r e^{-r^2} dr, rows n = 0..n_lim
    (columns n when transpose), as acb_mat. 1024 bits internally, rounded to 256-bit balls (verify_cert.py)."""
    old = flint.ctx.prec
    inf_last = edges[-1] is None
    fin = edges[:-1] if inf_last else edges
    Ncell = len(edges) - 1
    out = {}
    K_SER = 400
    for a in range(amax + 1):
        n_lim = nmax - max(0, a - 1)
        if n_lim < 0:
            continue
        flint.ctx.prec = 1024
        try:
            S = [A(e * e) for e in fin]
            ems = [(-s).exp() for s in S]
            ha = arb(a) / 2
            sqfa = arb.fac_ui(a).sqrt()
            F0 = [arb(0)]
            b0 = [arb(0)]
            for idx in range(1, len(fin)):
                s = S[idx]
                pref = (A(fin[idx]) ** (a + 2)) * ems[idx] / sqfa      # s^{a/2+1} e^{-s} / sqrt(a!)
                b0.append(pref)
                term = pref / (ha + 1)
                acc = term
                for k in range(1, K_SER + 1):
                    term = term * s / (ha + 1 + k)
                    acc += term
                ratio = s / (ha + K_SER + 2)
                assert bool(ratio < 1)
                rem = term * ratio / (1 - ratio)
                F0.append(acc + interval(arb(0), rem))
            if inf_last:
                F0.append((ha + 1).gamma() / sqfa)
                b0.append(arb(0))
            Sb = S + ([None] if inf_last else [])
            J = [F0[i + 1] - F0[i] for i in range(Ncell)]
            rows = [J]
            bm1 = [arb(0)] * (Ncell + 1)
            for n in range(n_lim):
                den = arb((n + 1) * (n + 1 + a)).sqrt()
                cp = arb(n) + ha
                J = [(cp * J[i] + (b0[i + 1] - b0[i])) / den for i in range(Ncell)]
                rows.append(J)
                if n + 1 < n_lim:
                    cm = arb(n * (n + a)).sqrt()
                    bn = []
                    for idx in range(Ncell + 1):
                        if Sb[idx] is None:
                            bn.append(arb(0))
                        else:
                            bn.append(((arb(2 * n + 1 + a) - Sb[idx]) * b0[idx] - cm * bm1[idx]) / den)
                    bm1, b0 = b0, bn
        finally:
            flint.ctx.prec = old
        M = acb_mat(arb_mat([[+x for x in row] for row in rows]))
        out[a] = M.transpose() if transpose else M
    return out


def tiger_mu(tj, npz):
    Npsi, qs = int(tj["Npsi"]), int(tj["q_shift"])
    assert tj["symmetry"] == "G[p] = F[(p + Npsi/2) mod Npsi]" and Npsi % 2 == 0
    Fre = [[[int(x) for x in row] for row in pl] for pl in npz["F_re"].astype(np.int64).tolist()]
    Fim = [[[int(x) for x in row] for row in pl] for pl in npz["F_im"].astype(np.int64).tolist()]
    N1, N2 = len(Fre[0]), len(Fre[0][0])
    assert len(Fre) == Npsi and len(Fim) == Npsi
    mx = max(Fre[p][i][j] ** 2 + Fim[p][i][j] ** 2 for p in range(Npsi) for i in range(N1) for j in range(N2))
    assert mx <= 1 << (2 * qs)
    log(f"tiger: Npsi={Npsi}, N1={N1}, N2={N2}, q_shift={qs}; exact disk check max|F|^2 = {mx}/2^{2 * qs} <= 1")
    e1, e2 = parse_edges(tj["e1"]), parse_edges(tj["e2"])
    assert len(e1) == N1 + 1 and len(e2) == N2 + 1
    PA = lag_tables(e1, KH + 1, KH, False)
    PBT = lag_tables(e2, KH + 1, KH, True)
    log("Laguerre cell tables done (1024-bit internal)")
    Wd = acb_mat(Npsi, Npsi)
    sc = arb(1) / (arb(Npsi) * arb(2) ** qs)
    for q in range(Npsi):
        for p in range(Npsi):
            s_, c_ = arb.sin_cos_pi_fmpq(flint.fmpq(-2 * ((q * p) % Npsi), Npsi))
            Wd[q, p] = acb(c_, s_) * sc
    Gre = [Fre[(p + Npsi // 2) % Npsi] for p in range(Npsi)]
    Gim = [Fim[(p + Npsi // 2) % Npsi] for p in range(Npsi)]

    def dft(Hre, Him):
        M = acb_mat([[acb(Hre[p][i][j], Him[p][i][j]) for i in range(N1) for j in range(N2)] for p in range(Npsi)])
        D = Wd * M
        return [acb_mat([[D[q, i * N2 + j] for j in range(N2)] for i in range(N1)]) for q in range(Npsi)]

    DF = dft(Fre, Fim)
    DG = dft(Gre, Gim)
    log("exact DFTs done")
    mu = [arb(0) for _ in range(KH + 1)]
    for m in range(-KH, KH + 2):
        Aa, Bb = abs(m), abs(1 - m)
        k0 = m - 1 if m >= 1 else -m
        if k0 > KH or (m != 0 and m % Npsi == 0):
            continue
        sinc = arb(1) if m == 0 else arb.sinc_pi(arb(flint.fmpq(m, Npsi)))
        nm = KH - k0
        pa = PA[Aa] if PA[Aa].nrows() == nm + 1 else acb_mat([[PA[Aa][i, j] for j in range(N1)] for i in range(nm + 1)])
        pbt = PBT[Bb] if PBT[Bb].ncols() == nm + 1 else acb_mat([[PBT[Bb][i, j] for j in range(nm + 1)]
                                                                 for i in range(N2)])
        cf = pa * DF[m % Npsi] * pbt
        cg = pa * DG[m % Npsi] * pbt
        s2 = sinc * sinc
        for n1 in range(nm + 1):
            for n2 in range(nm + 1 - n1):
                u = cf[n1, n2]
                v = cg[n1, n2]
                mu[k0 + n1 + n2] += (u.real * v.real + u.imag * v.imag) * s2
    log(f"tiger overlaps mu_0..mu_{KH}: mu_0 = {mu[0].str(20)}, max radius = {max(float(x.rad()) for x in mu):.2e}")
    return mu


# ---------------------------------------------------------------------------------------------- 4. heads
def gt_head(P_Q, Q_Q, rows_arb, nmax, mmax):
    Pp = arb_poly([A(x) for x in P_Q])
    Qp = arb_poly([A(x) for x in Q_Q])
    Ppow = [arb_poly([1])]
    for _ in range(nmax):
        Ppow.append(trunc_poly(Ppow[-1] * Pp, KH + 1))
    Qpow = [arb_poly([1])]
    for _ in range(mmax):
        Qpow.append(trunc_poly(Qpow[-1] * Qp, KH + 1))
    X = [arb_poly([0] * s + [1]) for s in range(KH + 1)]
    tot = arb_poly([])
    for mi, ea in rows_arb:
        s_m = mi // 2
        if s_m > KH:
            continue
        Lm = KH + 1 - s_m
        row = arb_poly([])
        for n, v in ea:
            sh = n // 2
            if sh < Lm:
                row = row + X[sh] * (trunc_poly(Ppow[n], Lm - sh) * arb_poly([v]))
        tot = tot + X[s_m] * (trunc_poly(row, Lm) if mi == 0 else trunc_poly(row * trunc_poly(Qpow[mi], Lm), Lm))
    cs = tot.coeffs()
    return [cs[k] if k < len(cs) else arb(0) for k in range(KH + 1)]


def oned_head(mu_l, R_Q):
    Rp = arb_poly([A(x) for x in R_Q])
    R2 = trunc_poly(Rp * Rp, KH + 1)
    pw = Rp
    X = [arb_poly([0] * s + [1]) for s in range(KH + 1)]
    tot = arb_poly([])
    for m in range(KH + 1):
        Lm = KH + 1 - m
        tot = tot + X[m] * (trunc_poly(pw, Lm) * arb_poly([mu_l[m]]))
        if m < KH:
            pw = trunc_poly(pw * R2, KH - m)
    cs = tot.coeffs()
    return [cs[k] if k < len(cs) else arb(0) for k in range(KH + 1)]


def eval_poly(cs, z):
    r = acb(0)
    for c in reversed(cs):
        r = r * z + acb(c)
    return r


# ---------------------------------------------------------------------------------------------- 5. Hardy tails
def hardy_tail(kind, P_Q, Q_Q, R_Q, r_Q, j_Q, c0_lower, mmat):
    """verify_cert.py's cover: B >= circle mean of the Gaussian-amplitude bound on |t| = r (half circle, adaptive
    arcs), the holomorphy check I -+ Re R(t) > 0 on |t| = r + 1e-5, and the tail bound of Lemma 5.3 with K = KH."""
    m00, m01, m11 = mmat
    rp = A(r_Q + Fraction(1, 100000))
    ra = A(r_Q)
    ja = A(j_Q)
    if kind == "GT":
        Pa = [A(x) for x in P_Q]
        Qa = [A(x) for x in Q_Q]

        def Rent(z):
            z2 = z * z
            p = z * eval_poly(Pa, z2)
            q = z * eval_poly(Qa, z2)
            return (acb(m00 * m00) * p + acb(m01 * m01) * q, acb(m00 * m01) * p + acb(m01 * m11) * q,
                    acb(m01 * m01) * p + acb(m11 * m11) * q)
    else:
        Ra = [A(x) for x in R_Q]

        def Rent(z):
            rho = z * eval_poly(Ra, z * z)
            return rho, acb(0), rho

    def arc(lo, hi, depth):
        th = interval(lo, hi)
        z = acb(ra * th.cos(), ra * th.sin())
        a_, b_, c_ = Rent(z)
        wp00, wp01, wp11 = 1 - a_, -b_, 1 - c_
        wm00, wm01, wm11 = 1 + a_, b_, 1 + c_
        dp = wp00 * wp11 - wp01 * wp01
        dm = wm00 * wm11 - wm01 * wm01
        ok, rhs = False, None
        if bool(abs(dp) > 0 and abs(dm) > 0):
            det_im = dp * dm
            sp00 = (wp11 / dp).real; sp01 = (-wp01 / dp).real; sp11 = (wp00 / dp).real  # noqa: E702
            sm00 = (wm11 / dm).real; sm01 = (-wm01 / dm).real; sm11 = (wm00 / dm).real  # noqa: E702
            z00 = (sp00 + sm00) / 2 - ja; z01 = (sp01 + sm01) / 2; z11 = (sp11 + sm11) / 2 - ja  # noqa: E702
            detZ = z00 * z11 - z01 * z01
            um00 = sm00 - ja; um01 = sm01; um11 = sm11 - ja  # noqa: E702
            up00 = sp00 - ja; up01 = sp01; up11 = sp11 - ja  # noqa: E702
            if bool(z00 > 0 and detZ > 0):
                iz00 = z11 / detZ; iz01 = -z01 / detZ; iz11 = z00 / detZ  # noqa: E702
                w00 = iz00 * up00 + iz01 * up01; w01 = iz00 * up01 + iz01 * up11  # noqa: E702
                w10 = iz01 * up00 + iz11 * up01; w11 = iz01 * up01 + iz11 * up11  # noqa: E702
                t00 = um00 * w00 + um01 * w10
                t01 = (um00 * w01 + um01 * w11 + um01 * w00 + um11 * w10) / 2
                t11 = um01 * w01 + um11 * w11
                detT = (um00 * um11 - um01 * um01) * (up00 * up11 - up01 * up01) / detZ
                if bool(t00 > 0 and detT > 0):
                    ci00 = ((wp11 / dp).imag - (wm11 / dm).imag) / 2
                    ci01 = ((-wp01 / dp).imag - (-wm01 / dm).imag) / 2
                    ci11 = ((wp00 / dp).imag - (wm00 / dm).imag) / 2
                    vi00 = iz00 * ci00 + iz01 * ci01; vi01 = iz00 * ci01 + iz01 * ci11  # noqa: E702
                    vi10 = iz01 * ci00 + iz11 * ci01; vi11 = iz01 * ci01 + iz11 * ci11  # noqa: E702
                    q00 = ci00 * vi00 + ci01 * vi10
                    q01 = ci00 * vi01 + ci01 * vi11
                    q11 = ci01 * vi01 + ci11 * vi11
                    m1_00 = t00 + ja; m1_01 = t01; m1_11 = t11 + ja  # noqa: E702
                    det1 = m1_00 * m1_11 - m1_01 * m1_01
                    m2_00 = (sp00 + sm00) / 2 + q00; m2_01 = (sp01 + sm01) / 2 + q01  # noqa: E702
                    m2_11 = (sp11 + sm11) / 2 + q11
                    det2 = m2_00 * m2_11 - m2_01 * m2_01
                    if bool(det1 > 0 and det2 > 0):
                        aq = det_im.real * det_im.real + det_im.imag * det_im.imag
                        rhs = arb(1) / (16 * ja * ja * aq * detZ * det1 * det2)
                        ok = rhs.is_finite()
        if ok and (depth <= 0 or float(rhs.rad()) <= 0.05 * max(1.0, float(rhs.mid()))):
            return True, rhs * (hi - lo), 1
        if depth <= 0:
            return False, arb(0), 0
        tm = (lo + hi) / 2
        o1, i1, n1 = arc(lo, tm, depth - 1)
        if not o1:
            return False, arb(0), 0
        o2, i2, n2 = arc(tm, hi, depth - 1)
        if not o2:
            return False, arb(0), 0
        return True, i1 + i2, n1 + n2

    NT = 256
    dth = arb.pi() / NT
    tot = arb(0)
    narcs = 0
    for s in range(NT):
        ok, v, n = arc(arb(s) * dth, arb(s + 1) * dth, 12)
        if not ok:
            return None
        tot += v
        narcs += n
    B = tot / arb.pi()      # half circle suffices: the bound is invariant under t -> -t (R odd)

    def harm(lo, hi, depth):
        th = interval(lo, hi)
        z = acb(rp * th.cos(), rp * th.sin())
        a_, b_, c_ = Rent(z)
        good = True
        for sg in (1, -1):
            x00 = 1 + sg * a_.real
            x01 = sg * b_.real
            x11 = 1 + sg * c_.real
            if not bool(x00 > 0 and x00 * x11 - x01 * x01 > 0):
                good = False
                break
        if good:
            return True
        if depth <= 0:
            return False
        tm = (lo + hi) / 2
        return harm(lo, tm, depth - 1) and harm(tm, hi, depth - 1)

    if not all(harm(arb(s) * dth, arb(s + 1) * dth, 10) for s in range(NT)):
        return None
    c0 = c0_lower if bool(c0_lower > 0) else arb(0)
    Bn = B - c0 * c0 * ra * ra
    if not bool(Bn > 0):
        Bn = B
    tail = (Bn / ra ** 4 / (1 - ra ** (-4))).sqrt() * ra ** (-(2 * KH + 1))
    return tail, B, narcs


# ---------------------------------------------------------------------------------------------- 6. Lean output
def lean_int_list(name, doc, vals, width):
    """A `List Int` literal, three entries per line, each line commented with the index k of its first entry."""
    lines = [f"/-- {doc} -/", f"def {name} : List Int := ["]
    for s in range(0, len(vals), 3):
        chunk = vals[s:s + 3]
        last = s + 3 >= len(vals)
        body = ", ".join(str(v).rjust(width) for v in chunk) + ("]" if last else ",")
        lines.append(f"  {body}  -- k = {s}")
    return "\n".join(lines)


def render(hashes, chans, eps_gt, data, D):
    kinds = [c["kind"] for c in chans]
    width = max(len(str(v)) for d in data for v in d["centre"])
    eps_dec = dec_up(eps_gt)
    assert 0 < D < 1
    d_dec = "0." + str(-ceil_frac(-D * 10**27)).rjust(27, "0")       # D rounded down to 27 decimals
    head = f"""/-!
# Head data of the six-channel certificate

Generated by `haagerup-article/lean/scripts/gen_head_data.py`; do not edit. To regenerate, run from the repository
root (about 3 minutes on one core)

    nice -n 10 uv run --offline --no-project --with numpy --with python-flint \\
      python3 -I haagerup-article/lean/scripts/gen_head_data.py

and add `--check` to verify instead that this file is reproduced byte for byte.

Inputs (SHA-256):
{chr(10).join(f"* `{rel}` `{h}`" for rel, h in hashes.items())}
* the radii and bands of the GT comparison (`Grothe/UpperTightBudget.lean`, `Grothe/Upper/ThreeBandBudget.lean` and
  the definitions they use), checked verbatim by the generator.

## Meaning

Channel `i : Fin 6` is entry `i` of `channels.json`, the article's channel `i + 1`
({", ".join(f"`{i}` {k}" for i, k in enumerate(kinds))}). Its kernel is `H_i(t) = ∑_k h_i(k) t |t|^(2k)`,
with the true coefficient sequence `h_i` (article, Section 2):
* GT(P, Q): `h_i(k) = ∑ E(n₁, n₂) [X^k] X^((n₁+n₂-1)/2) P(X)^n₁ Q(X)^n₂`, summed over all `n₁ + n₂` odd, where
  `E(n₁, n₂)` are the true bivariate energies of the rounder `G_T` (equation (4), Section 4.2). Since `Q(0) = 0`, the
  coefficients `k ≤ 250` involve only `n₁ + 3 n₂ ≤ 501`.
* tiger(R): `h_i(k) = ∑_(m ≤ k) μ_m [X^(k-m)] R(X)^(2m+1)` (equation (3)), with `μ_m = ⟨P_m f, P_m g⟩`, where
  `f` is the cell function of `tiger.json`/`tiger.npz` and `g(z₁, z₂) = f(-z₁, z₂)` (Section 3.4, Appendices A, B).
* phase(R): the same with Haagerup's coefficients `r_0 = π/4`, `r_(m+1) = r_m (2m+1)² / (4 (m+1)(m+2))` in place of
  `μ_m` (equation (1)).
With `S = scale = 10^30`, the certificate's computation gives, for every `i`,
* (b) `∑_(k=0)^250 |h_i(k) - (centre i)[k] / S| ≤ radius i / S`,
* (c) `∑_(k>250) |h_i(k)| ≤ tail i / S`.

With the weights `w_i` of `channels.json` (`CertData.w1`, …, `CertData.w6`) and `c_i(k) = (centre i)[k] / S`,
`D = ∑_i w_i c_i(0) - ∑_(k=1)^250 |∑_i w_i c_i(k)| - ∑_i w_i radius i / S - ∑_i w_i tail i / S` is
`{d_dec}…`. `python3 -I haagerup-article/lean/scripts/check_budget.py` checks exactly that
`D > 7119595/10^7` and `1/D < 14045611/10^7`.

## Where the numbers come from

All in 256-bit Arb balls, as in the certificate's verifier, then rounded in exact rational arithmetic.
* `(centre i)[k]` is the integer nearest to `S` times the midpoint of the ball of the computed `k`-th coefficient:
  for GT the table coefficient `h^tab_i(k)`, i.e. the formula above with the 21168 table energies `E_tab` of
  `Grothe/Upper/Data.lean` in place of `E` (absent entries are `0`); for tiger and phase the formula itself, with
  balls of `μ_0, …, μ_250` (Appendix B) and of `r_0, …, r_250`.
* `radius i` is `S` times the following, rounded up: `∑_(k ≤ 250)` (distance from the ball's midpoint to
  `(centre i)[k] / S` + the ball's radius), plus, for the GT channels only, the allowance
  `ε_GT ≤ {eps_dec}`,
  an upper bound of `∑_(n₁+3n₂ ≤ 501) |E - E_tab|` (Proposition 6.1, computed exactly with square roots rounded
  up). Since `‖P‖₁, ‖Q‖₁ ≤ 1`, it bounds `∑_(k ≤ 250) |h_i(k) - h^tab_i(k)|`.
* `tail i` is `S` times the upper end of the ball of the Hardy bound
  `((B - c² r²) / (r⁴ (1 - r⁻⁴)))^(1/2) r^(-501)` (Lemma 5.3, `K = 250`), rounded up. Here `B` bounds the mean of the
  Gaussian-amplitude bound (Theorem 5.2) over `|t| = r`, with `r` and `j` from `channels.json`, and `c ≥ 0` is a
  lower bound of `h_i(0)` (for GT: the table value minus `ε_GT`).
-/
"""
    body = ["namespace HaagerupRefutation.HeadData", "",
            "/-- The common scale `S = 10^30` of every number below. -/",
            f"def scale : Nat := {SCALE}", ""]
    for i, d in enumerate(data):
        doc = (f"`S` times the head centres `c_{i}(0), …, c_{i}(250)` of channel `{i}` ({kinds[i]}, weight "
               f"`{chans[i]['w']}`).")
        body.append(lean_int_list(f"centre{i}", doc, d["centre"], width))
        body.append("")
    body.append("/-- The head centres of channel `i`, scaled by `S`: 251 entries, `k = 0, …, 250`. -/")
    body.append("def centre : Fin 6 → List Int")
    body += [f"  | {i} => centre{i}" for i in range(6)]
    body.append("")
    body.append("/-- `S` times an upper bound of `∑_(k=0)^250 |h_i(k) - (centre i)[k] / S|`. -/")
    body.append("def radius : Fin 6 → Nat")
    body += [f"  | {i} => {d['radius']}" for i, d in enumerate(data)]
    body.append("")
    body.append("/-- `S` times an upper bound of `∑_(k>250) |h_i(k)|`. -/")
    body.append("def tail : Fin 6 → Nat")
    body += [f"  | {i} => {d['tail']}" for i, d in enumerate(data)]
    body.append("")
    body.append("end HaagerupRefutation.HeadData")
    return head + "\n" + "\n".join(body) + "\n"


# ---------------------------------------------------------------------------------------------- main
def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--dump")
    args = ap.parse_args()
    cur = os.nice(0)
    if cur < 10:
        os.nice(10 - cur)
    log(f"python {sys.version.split()[0]}, python-flint {flint.__version__}, numpy {np.__version__}; root {ROOT}")
    hashes = check_inputs()
    check_lean_snippets()
    chans = json.load(open(path(CERT_REL + "/channels.json")))
    tj = json.load(open(path(CERT_REL + "/tiger.json")))
    consts, rows = read_data_lean()
    nmax = max(n for _, e in rows for n, _ in e)
    mmax = max(m for m, _ in rows)
    rows_arb = [(m, [(n, A(v)) for n, v in e]) for m, e in rows]

    # admissibility, exact (as verify_cert.py)
    assert len(chans) == 6 and sum(Fraction(c["w"]) for c in chans) == 1 and all(Fraction(c["w"]) > 0 for c in chans)
    for c in chans:
        assert Fraction(c["r"]) > 1 and Fraction(c["j"]) > 0
        if c["kind"] == "GT":
            Pq, Qq = [Fraction(x) for x in c["P"]], [Fraction(x) for x in c["Q"]]
            assert sum(abs(x) for x in Pq) <= 1 and sum(abs(x) for x in Qq) <= 1 and Qq[0] == 0
        else:
            assert c["kind"] in ("tiger", "phase") and sum(abs(Fraction(x)) for x in c["R"]) <= 1

    eps_gt = gt_allowance(rows, consts["energyErrQ"])
    log(f"GT allowance eps_GT <= {float(eps_gt):.16e} (exact rational upper bound)")

    # self-test of the table convention: the production column of Data.lean against the Lean fact headCapQ
    hp = gt_head(consts["pList"], consts["qList"], rows_arb, nmax, mmax)
    res = abs(hp[0] - A(consts["slopeQ"])) + sum((abs(x) for x in hp[1:]), arb(0))
    assert bool(res < A(consts["headCapQ"])), res
    log(f"self-test: production column sum_k |h_k - slopeQ [k=0]| = {res.str(8)} <= headCapQ = "
        f"{float(consts['headCapQ']):.4e}")

    mu = tiger_mu(tj, np.load(path(CERT_REL + "/tiger.npz")))
    r_ph = [arb.pi() / 4]
    for k in range(KH):
        r_ph.append(r_ph[-1] * arb((2 * k + 1) ** 2) / arb(4 * (k + 1) * (k + 2)))

    b_a = A(consts["bQ"])
    pu = arb(1) / (1 + b_a * b_a)
    se = A(consts["etaQ"]).sqrt()
    mmat = (pu + se * (1 - pu), pu * b_a * (1 - se), pu * b_a * b_a + se * (1 - pu * b_a * b_a))

    data, dump = [], {"mu_mid": [float(x.mid()) for x in mu], "channels": []}
    for idx, c in enumerate(chans):
        r_Q, j_Q = Fraction(c["r"]), Fraction(c["j"])
        if c["kind"] == "GT":
            Pq, Qq = [Fraction(x) for x in c["P"]], [Fraction(x) for x in c["Q"]]
            hd = gt_head(Pq, Qq, rows_arb, nmax, mmax)
            res = hardy_tail("GT", Pq, Qq, None, r_Q, j_Q, arb(hd[0].lower()) - A(eps_gt), mmat)
            allowance = eps_gt
        else:
            Rq = [Fraction(x) for x in c["R"]]
            hd = oned_head(mu if c["kind"] == "tiger" else r_ph, Rq)
            res = hardy_tail(c["kind"], None, None, Rq, r_Q, j_Q, arb(hd[0].lower()), mmat)
            allowance = Fraction(0)
        assert res is not None, f"Hardy cover failed for channel {idx}"
        tl_, B, narcs = res
        centres, err = [], Fraction(0)
        for k in range(KH + 1):
            mid, rad = ball(hd[k])
            ck = round(mid * SCALE)
            centres.append(ck)
            err += abs(mid - Fraction(ck, SCALE)) + rad
        rad_int = ceil_frac((allowance + err) * SCALE)
        tmid, trad = ball(tl_)
        assert tmid + trad > 0
        tail_int = ceil_frac((tmid + trad) * SCALE)
        data.append({"centre": centres, "radius": rad_int, "tail": tail_int})
        l1 = sum((abs(x) for x in hd[1:]), arb(0))
        dump["channels"].append({"kind": c["kind"], "c0": hd[0].str(30, radius=True), "l1": l1.str(20, radius=True),
                                 "B": B.str(10, radius=True), "arcs": narcs, "tail": tl_.str(10, radius=True),
                                 "head_rounding_and_balls": float(err), "radius": rad_int, "tail_int": tail_int,
                                 "h_mid": [float(x.mid()) for x in hd]})
        log(f"channel {idx} {c['kind']:5s} c0 = {hd[0].str(15)}, sum_(k>=1)|c_k| = {l1.str(10)}, B <= "
            f"{float(B.upper()):.5f} ({narcs} arcs), tail <= {float(tmid + trad):.4e}; radius = {rad_int}, "
            f"tail = {tail_int} (/ 10^30)")

    # the budget, as check_budget.py computes it from the file
    w = [Fraction(c["w"]) for c in chans]
    lin = sum(w[i] * data[i]["centre"][0] for i in range(6))
    res_ = sum(abs(sum(w[i] * data[i]["centre"][k] for i in range(6))) for k in range(1, KH + 1))
    pen = sum(w[i] * (data[i]["radius"] + data[i]["tail"]) for i in range(6))
    D = (lin - res_ - pen) / SCALE
    log(f"D_lean = {float(D):.16f}, 1/D_lean = {float(1 / D):.12f}")

    text = render(hashes, chans, eps_gt, data, D)
    out = path(OUT_REL)
    if args.dump:
        with open(args.dump, "w") as fh:
            json.dump(dump | {"eps_gt": str(eps_gt), "D_lean": str(D)}, fh, indent=1)
    if args.check:
        old = open(out, encoding="utf-8").read() if os.path.exists(out) else None
        if old != text:
            print(f"{OUT_REL} differs from the regenerated text", file=sys.stderr)
            sys.exit(1)
        log(f"{OUT_REL} is reproduced byte for byte")
    else:
        with open(out, "w", encoding="utf-8", newline="\n") as fh:
            fh.write(text)
        log(f"wrote {OUT_REL} ({len(text.encode())} bytes, sha256 {hashlib.sha256(text.encode()).hexdigest()})")


if __name__ == "__main__":
    main()

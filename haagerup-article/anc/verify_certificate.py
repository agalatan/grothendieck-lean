#!/usr/bin/env python3
"""Standalone 256-bit Arb verifier of the six-channel certificate:  K_G^C <= 1.40456109 < 1/gamma_dagger.

usage:  python3 verify_certificate.py [ANC_DIR]          (default: the directory of this file)

It reads only these files of ANC_DIR (their SHA-256 hashes are in SHA256SUMS):
  channels.json    the six channels: kind (GT | tiger | phase), weight w, polynomials P, Q (GT) or R, and the Hardy
                   circle parameters r, j, all exact rationals as strings
  tiger.json       the tiger grid: Npsi angle cells, radial edges e1, e2 (exact rationals, last edge "inf"),
                   q_shift, and the reflection rule  G[p] = F[(p + Npsi/2) mod Npsi]
  tiger.npz        F_re, F_im (int64, shape (Npsi, N1, N2)); the value of F on a cell is (F_re + i F_im) / 2^q_shift
  gt_energy.npz    the exact dyadic GT energy table E[n, m] = a / 2^k (21,168 entries) and the rationals bQ, etaQ,
                   energyErrQ, exported from the repository's Grothe/Upper/Data.lean by export_gt_energy.py

It checks, in 256-bit ball arithmetic (python-flint), every numerical fact of Section 4 of the article against the
exact rational constants written there, and exits with status 0 only if all checks pass:
  channel data      the weights and polynomials equal w1..w6, P1, Q1, ..., R6 of Table 1 exactly
  dominated         the hypotheses of the realisation argument (Section 3 of the article): l1(P), l1(Q), l1(R) <= 1,
                    Q(0) = 0, and |F| <= 1 on every tiger cell (exact integers). Domination itself is the
                    mathematical statement of Section 3; it is not a numerical fact
  head_comparison   GT channels: the universal comparison and table allowance <= 1494117 / 10^12;
                    tiger and phase channels: the head coefficients are the exact values, enclosed in the balls below
  h0_enclosure      h_0 of the mixture >= 711968933048 / 10^12
  head_l1_encl      sum_{k=1..250} |h_k| <= 1248782 / 10^12
  hardy_tails,
  tail_enclosure    sum_i w_i tail_i <= 32 / 10^9, each tail bounding sum_{k>250} |h_{i,k}|
  budget            the exact rational budget D_cert of Section 4, and gamma_dagger < 7119595 / 10^7

The Lean companion of the article is not part of these files; it is kept in the repository (Appendix B).

The numerical core (Laguerre cell integrals, exact DFT, heads, the Hardy-circle cover) is the verifier that certified
the certificate first, unchanged except for where it reads its inputs.
"""
import json
import os
import sys
import time

os.environ["OMP_NUM_THREADS"] = "1"
from fractions import Fraction  # noqa: E402

import flint  # noqa: E402
import numpy as np  # noqa: E402

flint.ctx.prec = 256
arb, acb, arb_mat, acb_mat, arb_poly = flint.arb, flint.acb, flint.arb_mat, flint.acb_mat, flint.arb_poly
KH = 250
t0 = time.time()
ANC = os.path.abspath(sys.argv[1] if len(sys.argv) > 1 else os.path.dirname(os.path.abspath(__file__)))
RESULTS = []


def log(s):
    print(f"[{time.time()-t0:7.1f}s] {s}", flush=True)


def check(name, ok, detail):
    RESULTS.append((name, bool(ok), detail))
    log(f"{'PASS' if ok else 'FAIL'}  {name}: {detail}")


def Q(s):
    return Fraction(s)


def A(q):
    q = Fraction(q)
    return arb(int(q.numerator)) / arb(int(q.denominator))


def interval(lo, hi):
    return lo.union(hi)


def trunc_poly(p, L):
    return p if p.length() <= L else arb_poly(p.coeffs()[:L])


# ------------------------------------------------------------------ 0. the exact constants of the article
DEN = 10 ** 12
CONST = {
    "w": [Fraction(x, DEN) for x in (971858734217, 8906483332, 201845612, 18797147285, 50102530, 185687024)],
    "P1": [Fraction(991833356533, DEN), Fraction(-8166643466, DEN)],
    "Q1": [Fraction(0), Fraction(-1)],
    "P2": [Fraction(989554427299, DEN), Fraction(0), Fraction(0), Fraction(-10445572700, DEN)],
    "Q2": [Fraction(0), Fraction(-833435315100, DEN), Fraction(0), Fraction(-166564684899, DEN)],
    "P3": [Fraction(91371963319, DEN), Fraction(-825194568310, DEN), Fraction(0), Fraction(-83433468370, DEN)],
    "Q3": [Fraction(0), Fraction(-999999999999, DEN)],
    "R4": [Fraction(920082833249, DEN), Fraction(-79917166750, DEN)],
    "R5": [Fraction(211831968397, DEN), Fraction(-67863691543, DEN), Fraction(720304340059, DEN)],
    "R6": [Fraction(364133034656, DEN), Fraction(-635866965343, DEN)],
}
H0_LOWER = Fraction(711968933048, DEN)
HEAD_L1_UPPER = Fraction(1248782, DEN)
UNIV_GT_ERR_UPPER = Fraction(1494117, DEN)
HARDY_TAIL_UPPER = Fraction(32, 10 ** 9)
HAAGERUP_UPPER = Fraction(7119595, 10 ** 7)
KIND = ["GT", "GT", "GT", "tiger", "phase", "phase"]

tj = json.load(open(os.path.join(ANC, "tiger.json")))
chans = json.load(open(os.path.join(ANC, "channels.json")))
log(f"reading {ANC}")

same = len(chans) == 6 and [c["kind"] for c in chans] == KIND
for i, c in enumerate(chans if same else []):
    same &= Q(c["w"]) == CONST["w"][i]
    if c["kind"] == "GT":
        same &= [Q(x) for x in c["P"]] == CONST[f"P{i+1}"] and [Q(x) for x in c["Q"]] == CONST[f"Q{i+1}"]
    else:
        same &= [Q(x) for x in c["R"]] == CONST[f"R{i+1}"]
check("channel data = article constants", same, "kinds, weights w1..w6 and P1, Q1, P2, Q2, P3, Q3, R4, R5, R6 (exact)")
check("weights", sum(CONST["w"]) == 1 and all(x > 0 for x in CONST["w"]), "w_i > 0, sum w_i = 1 (exact)")

# ------------------------------------------------------------------ 1. gamma_dagger
half = acb(1) / 2
gd_hyp = (acb.pi() / 4 * acb(-1).hypgeom_2f1(half, half, acb(2))).real
gd_int = acb.integral(lambda z, _: (z.cos() ** 2) / ((1 + z.sin() ** 2).sqrt()), acb(0), acb.pi() / 2).real
assert gd_hyp.overlaps(gd_int)
GD = gd_hyp
log(f"gamma_dagger = {GD.str(30)}")

# ------------------------------------------------------------------ 2. GT energy table and the universal GT allowance
gz = np.load(os.path.join(ANC, "gt_energy.npz"), allow_pickle=False)


def rat_arr(name):
    num, den = (int(x) for x in gz[name].tolist())
    return Fraction(num, den)


bQ, etaQ, energyErrQ = rat_arr("bQ"), rat_arr("etaQ"), rat_arr("energyErrQ")
b_a = A(bQ)
pu = arb(1) / (1 + b_a * b_a)
se = A(etaQ).sqrt()
m00 = pu + se * (1 - pu)
m01 = pu * b_a * (1 - se)
m11 = pu * b_a * b_a + se * (1 - pu * b_a * b_a)
em, en, ea_, ek = (gz[x].tolist() for x in ("m", "n", "a", "k"))
assert len(em) == len(en) == len(ea_) == len(ek) == 21168
rows_exact = []
for mi, n, a, k in zip(em, en, ea_, ek):
    if not rows_exact or rows_exact[-1][0] != mi:
        assert all(r[0] != mi for r in rows_exact), "rows of the energy table must be contiguous"
        rows_exact.append((mi, []))
    rows_exact[-1][1].append((int(n), int(a), int(k)))
assert sum(len(e) for _, e in rows_exact) == 21168


def band_contains(j, n, m):
    d = n + m
    return {0: d > 0, 1: 0 < d <= 51, 3: 0 < d <= 51, 2: d > 51, 4: d > 51, 5: 0 < d <= 11, 6: d > 11}[j]


# Error radii of the seven-band comparison, from the grothendieck-lean repository: tl = tightLowErrorQ (quadrature
# radius tightQuadRadiusQ + table reserve tightLowReserveQ), tr = tightScaledRQ (Grothe/UpperTightBudget.lean),
# tg[0] = comparisonGroupRadiusQ 0 = 10^-18 (Grothe/Upper/ComparisonGroups.lean); tbe = tightThreeBandErrorQ.
tl = [Fraction(9, 10**15) + Fraction(1, 2**41), Fraction(17, 10**15) + Fraction(1, 2**42),
      Fraction(1132, 10**15) + Fraction(1, 2**45)]
tr = [Fraction(6338057765, 10**15), Fraction(1086368451, 10**15), Fraction(334910976, 10**15)]
tg = [Fraction(1, 10**18), tr[0], tr[1], tr[2]]
tbe = [tg[0], tl[0], tr[0], tl[1] / 2, tr[1], tl[2] / 6, tr[2]]
band_mass = [Fraction(0)] * 7
rows_arb = []
for mi, ents in rows_exact:
    ea = []
    for n, a, k in ents:
        v = Fraction(a, 2 ** k)
        ea.append((n, A(v)))
        for j in range(7):
            if band_contains(j, n, mi):
                band_mass[j] += v
    rows_arb.append((mi, ea))
univ = A(sum(tg) ** 2)
for j in range(7):
    univ += 2 * (A(band_mass[j] + energyErrQ)).sqrt() * A(tbe[j])
UNIV = univ + A(energyErrQ)
check("head_comparison (GT channels)", bool(UNIV < A(UNIV_GT_ERR_UPPER)),
      f"universal comparison + table allowance {UNIV.str(25)} < univGTErrUpperQ = 1494117/10^12")

# ------------------------------------------------------------------ 3. tiger data, exact disk check
Npsi, qs = int(tj["Npsi"]), int(tj["q_shift"])
assert tj["symmetry"] == "G[p] = F[(p + Npsi/2) mod Npsi]" and Npsi % 2 == 0
npz = np.load(os.path.join(ANC, "tiger.npz"), allow_pickle=False)
Fre = [[[int(x) for x in row] for row in pl] for pl in npz["F_re"].astype(np.int64).tolist()]
Fim = [[[int(x) for x in row] for row in pl] for pl in npz["F_im"].astype(np.int64).tolist()]
N1, N2 = len(Fre[0]), len(Fre[0][0])
assert len(Fre) == Npsi
LIM = 1 << (2 * qs)
mx = max(Fre[p][i][j] ** 2 + Fim[p][i][j] ** 2 for p in range(Npsi) for i in range(N1) for j in range(N2))
check("dominated: tiger |F| <= 1", mx <= LIM,
      f"Npsi={Npsi}, N1={N1}, N2={N2}, q_shift={qs}: max (F_re^2 + F_im^2) = {mx} <= 2^{2*qs} (exact integers)")


def parse_edges(lst):
    out = []
    for s in lst:
        out.append(None if s == "inf" else Fraction(s))
    assert out[0] == 0 and all(out[i] < out[i + 1] for i in range(len(out) - 2))
    assert all(x is not None for x in out[:-1])
    return out


e1 = parse_edges(tj["e1"])
e2 = parse_edges(tj["e2"])
assert len(e1) == N1 + 1 and len(e2) == N2 + 1


def lag_tables(edges, amax, nmax):
    """P[a] = list of rows n = 0..n_lim of cell integrals int_{cell i} phi_{n,a}(s) e^{-s} ds (1024-bit
    internal, rounded to 256-bit balls).  Outer cell [r_N, inf) when the last edge is None."""
    old = flint.ctx.prec
    flint.ctx.prec = 1024
    try:
        inf_last = edges[-1] is None
        fin = edges[:-1] if inf_last else edges
        S = [A(e * e) for e in fin]
        ems = [(-s).exp() for s in S]
        Ncell = len(edges) - 1
        out = {}
        K_SER = 400
        for a in range(amax + 1):
            n_lim = nmax - max(0, a - 1)
            if n_lim < 0:
                continue
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
            out[a] = rows
    finally:
        flint.ctx.prec = old
    return {a: arb_mat([[+x for x in row] for row in rows]) for a, rows in out.items()}


P1 = lag_tables(e1, KH + 1, KH)
P2 = P1 if tj["e1"] == tj["e2"] else lag_tables(e2, KH + 1, KH)
log("Laguerre cell tables done (1024-bit internal)")

# exact DFT along psi:  D[q] = (1/Npsi) sum_p H[p] e^{-2 pi i q p / Npsi} / 2^qs  (cells centred at 2 pi p / Npsi)
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
PA = {a: acb_mat(M) for a, M in P1.items()}
PBT = {a: acb_mat(M).transpose() for a, M in P2.items()}
mu = [arb(0) for _ in range(KH + 1)]
for m in range(-KH, KH + 2):
    Aa, Bb = abs(m), abs(1 - m)
    k0 = m - 1 if m >= 1 else -m
    if k0 > KH or (m != 0 and m % Npsi == 0):
        continue
    sinc = arb(1) if m == 0 else arb.sinc_pi(arb(flint.fmpq(m, Npsi)))
    nm = KH - k0
    pa = PA[Aa] if PA[Aa].nrows() == nm + 1 else acb_mat([[PA[Aa][i, j] for j in range(N1)] for i in range(nm + 1)])
    pbt = PBT[Bb] if PBT[Bb].ncols() == nm + 1 else acb_mat([[PBT[Bb][i, j] for j in range(nm + 1)] for i in range(N2)])
    cf = pa * DF[m % Npsi] * pbt
    cg = pa * DG[m % Npsi] * pbt
    s2 = sinc * sinc
    for n1 in range(nm + 1):
        for n2 in range(nm + 1 - n1):
            u = cf[n1, n2]
            v = cg[n1, n2]
            mu[k0 + n1 + n2] += (u.real * v.real + u.imag * v.imag) * s2
log(f"tiger overlaps mu_0..mu_{KH}: mu_0 = {mu[0].str(20)}, max radius = {max(float(x.rad()) for x in mu):.2e}")

# phase coefficients (Haagerup's series of ph(X): r_0 = pi/4, r_{k+1}/r_k = (2k+1)^2 / (4(k+1)(k+2)))
r_ph = [arb.pi() / 4]
for k in range(KH):
    r_ph.append(r_ph[-1] * arb((2 * k + 1) ** 2) / arb(4 * (k + 1) * (k + 2)))


# ------------------------------------------------------------------ 4. heads
def gt_head(P_Q, Q_Q):
    Pp = arb_poly([A(x) for x in P_Q])
    Qp = arb_poly([A(x) for x in Q_Q])
    Ppow = [arb_poly([1])]
    for _ in range(2 * KH + 1):
        Ppow.append(trunc_poly(Ppow[-1] * Pp, KH + 1))
    Qpow = [arb_poly([1])]
    for _ in range(167):
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


# ------------------------------------------------------------------ 5. Hardy tails (cancellation-free circle cover)
def hardy_tail(kind, P_Q, Q_Q, R_Q, r_Q, j_Q, c0_lower):
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
            sp00 = (wp11 / dp).real; sp01 = (-wp01 / dp).real; sp11 = (wp00 / dp).real
            sm00 = (wm11 / dm).real; sm01 = (-wm01 / dm).real; sm11 = (wm00 / dm).real
            z00 = (sp00 + sm00) / 2 - ja; z01 = (sp01 + sm01) / 2; z11 = (sp11 + sm11) / 2 - ja
            detZ = z00 * z11 - z01 * z01
            um00 = sm00 - ja; um01 = sm01; um11 = sm11 - ja
            up00 = sp00 - ja; up01 = sp01; up11 = sp11 - ja
            if bool(z00 > 0 and detZ > 0):
                iz00 = z11 / detZ; iz01 = -z01 / detZ; iz11 = z00 / detZ
                w00 = iz00 * up00 + iz01 * up01; w01 = iz00 * up01 + iz01 * up11
                w10 = iz01 * up00 + iz11 * up01; w11 = iz01 * up01 + iz11 * up11
                t00 = um00 * w00 + um01 * w10
                t01 = (um00 * w01 + um01 * w11 + um01 * w00 + um11 * w10) / 2
                t11 = um01 * w01 + um11 * w11
                detT = (um00 * um11 - um01 * um01) * (up00 * up11 - up01 * up01) / detZ
                if bool(t00 > 0 and detT > 0):
                    ci00 = ((wp11 / dp).imag - (wm11 / dm).imag) / 2
                    ci01 = ((-wp01 / dp).imag - (-wm01 / dm).imag) / 2
                    ci11 = ((wp00 / dp).imag - (wm00 / dm).imag) / 2
                    vi00 = iz00 * ci00 + iz01 * ci01; vi01 = iz00 * ci01 + iz01 * ci11
                    vi10 = iz01 * ci00 + iz11 * ci01; vi11 = iz01 * ci01 + iz11 * ci11
                    q00 = ci00 * vi00 + ci01 * vi10
                    q01 = ci00 * vi01 + ci01 * vi11
                    q11 = ci01 * vi01 + ci11 * vi11
                    m1_00 = t00 + ja; m1_01 = t01; m1_11 = t11 + ja
                    det1 = m1_00 * m1_11 - m1_01 * m1_01
                    m2_00 = (sp00 + sm00) / 2 + q00; m2_01 = (sp01 + sm01) / 2 + q01; m2_11 = (sp11 + sm11) / 2 + q11
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


# ------------------------------------------------------------------ 6. channels
h = [arb(0) for _ in range(KH + 1)]
tail_tot = arb(0)
gt_w = Fraction(0)
norms_ok = True
for idx, c in enumerate(chans):
    w = Q(c["w"])
    if c["kind"] == "GT":
        Pq = [Q(x) for x in c["P"]]
        Qq = [Q(x) for x in c["Q"]]
        norms_ok &= sum(abs(x) for x in Pq) <= 1 and sum(abs(x) for x in Qq) <= 1 and Qq[0] == 0
        hd = gt_head(Pq, Qq)
        c0l = arb(hd[0].lower()) - UNIV
        res = hardy_tail("GT", Pq, Qq, None, Q(c["r"]), Q(c["j"]), c0l)
        gt_w += w
    else:
        Rq = [Q(x) for x in c["R"]]
        norms_ok &= sum(abs(x) for x in Rq) <= 1
        hd = oned_head(mu if c["kind"] == "tiger" else r_ph, Rq)
        res = hardy_tail(c["kind"], None, None, Rq, Q(c["r"]), Q(c["j"]), arb(hd[0].lower()))
    if res is None:
        check(f"hardy_tails: channel {idx+1}", False, "the Hardy-circle cover failed")
        continue
    tl_, B, narcs = res
    wa = A(w)
    for k in range(KH + 1):
        h[k] += wa * hd[k]
    tail_tot += wa * tl_
    log(f"channel {idx+1} {c['kind']:5s} w={float(w):.8f} r={c['r']} j={c['j']} c0={hd[0].str(12)} "
        f"B<={float(B.upper()):.5f} ({narcs} arcs) w*tail<={float((wa*tl_).upper()):.3e}")
check("dominated: preprocessors", norms_ok, "l1(P), l1(Q), l1(R) <= 1 and Q(0) = 0 for every channel (exact)")

l1 = arb(0)
for k in range(1, KH + 1):
    l1 += abs(h[k])
gt_tax = A(gt_w) * UNIV
D = h[0] - l1 - tail_tot - gt_tax
check("h0_enclosure", bool(h[0] > A(H0_LOWER)), f"h_0 = {h[0].str(30)} > h0LowerQ = 711968933048/10^12")
check("head_l1_encl", bool(l1 < A(HEAD_L1_UPPER)), f"sum_(k=1..250) |h_k| = {l1.str(25)} < headL1UpperQ = 1248782/10^12")
check("hardy_tails + tail_enclosure", bool(tail_tot < A(HARDY_TAIL_UPPER)),
      f"sum_i w_i tail_i = {tail_tot.str(25)} < hardyTailUpperQ = 32/10^9")

# ------------------------------------------------------------------ 7. the exact budget D_cert (Section 4 of the article)
wGT = sum(CONST["w"][:3])
certD = H0_LOWER - HEAD_L1_UPPER - wGT * UNIV_GT_ERR_UPPER - HARDY_TAIL_UPPER
check("budget: GT weight", gt_w == wGT, f"the GT weights of channels.json sum to wGT = w1 + w2 + w3 = {wGT}")
check("budget: haagerupUpperQ < certDLowerQ", HAAGERUP_UPPER < certD,
      f"certDLowerQ = {certD} = {float(certD):.15f} > haagerupUpperQ = 7119595/10^7")
check("budget: 1 / certDLowerQ < 1.40456109", 1 / certD < Fraction(140456109, 10 ** 8),
      f"1 / certDLowerQ = {float(1 / certD):.15f}")
check("gamma_dagger < haagerupUpperQ", bool(GD < A(HAAGERUP_UPPER)), f"gamma_dagger = {GD.str(20)}")

print("=" * 78)
print(f"  h_0                        = {h[0].str(30)}")
print(f"  sum_{{k=1..250}} |h_k|       = {l1.str(25)}")
print(f"  GT weight x allowance      = {gt_tax.str(25)}")
print(f"  Hardy tails (k > 250)      = {tail_tot.str(25)}")
print(f"  D (direct, from the balls) = {D.str(30)}")
print(f"  certDLowerQ (rational)     = {float(certD):.15f}")
print(f"  gamma_dagger               = {GD.str(30)}")
print(f"  D - gamma_dagger           = {(D - GD).str(25)}")
print(f"  1/D                        = {(1 / D).str(25)}")
print("=" * 78)
failed = [name for name, ok, _ in RESULTS if not ok]
print(f"  {len(RESULTS) - len(failed)} of {len(RESULTS)} checks passed; total time {time.time()-t0:.1f}s")
print("  ALL CHECKS PASSED: K_G^C <= 1/D < 1.40456109 < 1/gamma_dagger" if not failed else f"  FAILED: {', '.join(failed)}")
sys.exit(0 if not failed else 1)

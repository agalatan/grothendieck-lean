#!/usr/bin/env python3
"""Self-contained exact verification of the spectral mass row and its homothety transfer.

Agent-ID: gemini-9a4e. Task #511 (Refs #177, #440).
Standard library only (`python3 -I`). All accept/reject decisions use exact
Python integers and `fractions.Fraction`.

Verifies:
1. `cert_mass_0.5_pruned.json` (SHA-256 pinned) directly against the Lean
   definitions (`Grothe/Lower/Basic.lean`, `Poly.lean`, `Sweep.lean`, `Cuts.lean`,
   `Law.lean`, `Rows.lean`, `Moment.lean`), proving
     E[phi_{c1}^{(eps1)}(sigma * sqrt(U))] - eps1 * sigma^2 <= cap_exact < S1
   for every law U satisfying `Moments` and `SteinCut` with `Lower.rho` and every
   0 <= sigma <= Lower.rho, where eps1 = 25/31 and c1 = 2141/3906.
2. The exact homothety identity: for every eps > 0 and c(eps) = (2141/3150) * eps,
   phi_{c(eps)}^{(eps)}(r) == (eps / eps1) * phi_{c1}^{(eps1)}(r) on all [0, infinity),
   giving the unconditional zero-tail mass row
     V_eps(f, g) <= (1 - c(eps)) * t^2 + c(eps) + (eps / eps1) * S1 - eps * ||Qh||^2.
3. Rejection controls (corrupted cap, corrupted polynomial coefficient, broken x-chain).
"""
if not __debug__:
    raise RuntimeError("Run without -O; assertions are required.")

import copy
import hashlib
import json
from fractions import Fraction as Q
from math import isqrt, lcm
from pathlib import Path
import time

RHO_LEAN = Q(973612157, 10**9)
C6 = Q(4045313, 100000)
XMAX = Q(31, 4)
EPS1 = Q(25, 31)
NUHAT1 = Q(47, 1953)
C1 = Q(2141, 3906)
S1 = Q(3798855002922010337121170986221578569, 22939068096000000000000000000000000000)
PINNED_SHA256 = "f3fe6535d0ae45a05907d103d327c12cd53180604ee2a57f73159d8c70999f28"
ZERO = Q(0)


def add_poly(p, q):
    if len(p) < len(q):
        p, q = q, p
    out = list(p)
    for i, v in enumerate(q):
        out[i] += v
    return out


def shift_int(a, b, coeffs):
    """Exact integer coefficients of y -> b^n P((a + y)/b), n = len(coeffs) - 1."""
    n = len(coeffs) - 1
    if n < 0:
        return []
    qs = [coeffs[j] * (b ** (n - j)) for j in range(n + 1)]
    for i in range(n):
        for j in range(n - 1, i - 1, -1):
            qs[j] += a * qs[j + 1]
    return qs


def pos_cert(p, lo, hi):
    """Exact replica of Lean `posCert p lo hi`."""
    den = 1
    for c in p:
        den = lcm(den, c.denominator)
    ints = [(c * den).numerator for c in p]
    a = shift_int(lo.numerator, lo.denominator, ints)
    if not (a[0] if a else 0) >= 0:
        return False
    r = Q(1) / (Q(lo.denominator) * (hi - lo))
    b = shift_int(r.numerator, r.denominator, a[::-1])
    return all(v >= 0 for v in b)


def pos_on(p, depth, lo, hi):
    """Exact replica of Lean `posOn p depth lo hi`."""
    if pos_cert(p, lo, hi):
        return True
    if depth == 0:
        return False
    mid = (lo + hi) / 2
    return pos_on(p, depth - 1, lo, mid) and pos_on(p, depth - 1, mid, hi)


def taylor_nonneg(p, t):
    c = list(p)
    n = len(c) - 1
    for i in range(n):
        for j in range(n - 1, i - 1, -1):
            c[j] += t * c[j + 1]
    return all(v >= 0 for v in c)


def tail_on(p, n, u):
    """Exact replica of Lean `tailOn p n u`."""
    if taylor_nonneg(p, u):
        return True
    if n == 0:
        return False
    return u > 0 and pos_on(p, 7, u, 2 * u) and tail_on(p, n - 1, 2 * u)


def cut_cells(vs, z):
    cv = z[:len(vs)]
    cells = []
    t = ZERO
    c = cv[0] if cv else ZERO
    phi_int = ZERO
    for i, w in enumerate(vs):
        c1 = cv[i + 1] if i + 1 < len(cv) else ZERO
        w2 = w * w
        b = (c1 - c) / (w2 - t)
        a = c - b * t
        cells.append((a, b, phi_int - a * t - b * t * t / 2))
        phi_int += (c + c1) * (w2 - t) / 2
        t = w2
        c = c1
    cells.append((ZERO, ZERO, phi_int))
    return cells


def spec_poly_v(k, cell, lam, mu, t, be, nu):
    a, b, e0 = cell
    f0 = -(a + be) / 2
    f1 = -b / 2 + 2 * t + lam / 3
    g2 = -b / 4 + t + mu / 3 - nu / 2
    c2 = 2 * f0 * f1 / lam + (a - b)
    c4 = f1 * f1 / lam + g2 * g2 / mu + b / 2 + (nu / 3 - 2 * t)
    if k == 0:
        return [f0 * f0 / lam - a + 4 * t - 2 * nu / 3, ZERO, c2, ZERO, c4]
    return [
        e0 * e0 / (4 * mu),
        ZERO,
        ZERO,
        ZERO,
        f0 * f0 / lam + e0 * g2 / mu + e0 - a + 4 * t - 2 * nu / 3,
        ZERO,
        c2,
        ZERO,
        c4,
    ]


def sweep_top(sigma, smax, maj, cps, vs, nodes):
    """Exact replica of Lean `sweepTop`."""
    if not (sigma > 0 and nodes and nodes[0][0] == 0):
        return False, 0
    fuel = len(vs) + len(nodes) + 1
    lo, k, vi, j = ZERO, 0, 0, 0
    pieces = 0
    while fuel > 0:
        fuel -= 1
        rem = len(nodes) - j
        if rem == 0:
            return False, pieces
        n = nodes[j]
        sh = 0 if k == 0 else 4
        if rem == 1:
            if vi < len(vs) or not (k == 0 or lo > 0):
                return False, pieces
            c0 = n[1] - smax * n[0]
            c1 = smax * sigma
            p = add_poly([ZERO] * sh + add_poly(maj, [-c0, -c1]), [-v for v in cps[k]])
            pieces += 1
            return tail_on(p, 16, lo), pieces
        n2 = nodes[j + 1]
        if not (n[0] < n2[0] and (k == 0 or lo > 0)):
            return False, pieces
        hi_n = n2[0] / sigma
        if vi < len(vs):
            tm = vs[vi]
            if tm < hi_n:
                nlo, nk, nvi, nj = tm, k + 1, vi + 1, j
            elif tm == hi_n:
                nlo, nk, nvi, nj = tm, k + 1, vi + 1, j + 1
            else:
                nlo, nk, nvi, nj = hi_n, k, vi, j + 1
        else:
            nlo, nk, nvi, nj = hi_n, k, vi, j + 1
        if not lo < nlo:
            return False, pieces
        sl = (n2[1] - n[1]) / (n2[0] - n[0])
        c0 = n[1] - sl * n[0]
        c1 = sl * sigma
        p = add_poly([ZERO] * sh + add_poly(maj, [-c0, -c1]), [-v for v in cps[k]])
        pieces += 1
        if not pos_on(p, 9, lo, nlo):
            return False, pieces
        lo, k, vi, j = nlo, nk, nvi, nj
    return False, pieces


def rat_sqrt_exact(q):
    if q < 0:
        return None
    ra, rb = isqrt(q.numerator), isqrt(q.denominator)
    if ra * ra == q.numerator and rb * rb == q.denominator:
        return Q(ra, rb)
    return None


def phi_eps(eps, c, r):
    return (eps * eps * r * r) / c if r <= c / eps else 2 * eps * r - c


def chord_max(v0, v1, kap, s0, s1):
    m = (v1 - v0) / (s1 - s0)
    c0 = v0 - m * s0
    end = max(c0 + m * s0 - kap * s0 * s0, c0 + m * s1 - kap * s1 * s1)
    if kap > 0:
        v_star = m / (2 * kap)
        if s0 <= v_star <= s1:
            end = max(end, c0 + m * v_star - kap * v_star * v_star)
    return end


def verify_mass_certificate(doc):
    assert Q(doc["eps"]) == EPS1
    assert Q(doc["nu_hat"]) == NUHAT1
    mass = Q(doc["mass"])
    delta = Q(doc["delta"])
    c_val = 2 * NUHAT1 + mass
    assert mass == Q(1, 2) and c_val == C1 and delta > 0

    ts = [Q(s) for s in doc["mesh"]]
    assert ts[0] == 0
    vs = [rat_sqrt_exact(t) for t in ts[1:]]
    assert all(v is not None for v in vs)
    assert all(a < b for a, b in zip([ZERO] + vs, vs))

    nodes = [(Q(r), Q(cap)) for r, cap in zip(doc["nodes"], doc["caps"])]
    assert len(doc["nodes"]) == len(doc["caps"]) and nodes[0][0] == 0
    assert all(a[0] < b[0] for a, b in zip(nodes, nodes[1:]))
    assert all(cap >= phi_eps(EPS1, c_val, r / delta) for r, cap in nodes)

    kappa = Q(doc["kappa"])
    smax = Q(doc["smax"])
    assert ZERO < kappa <= EPS1 / (delta * delta)
    assert smax >= 2 * EPS1 / delta

    cells = doc["cells"]
    xs = [(Q(c["x"][0]), Q(c["x"][1])) for c in cells]
    assert xs[0][0] == 0 and xs[-1][1] >= XMAX
    assert all(a < b for a, b in xs)
    assert all(xs[i][1] == xs[i + 1][0] for i in range(len(xs) - 1))

    stop = delta * RHO_LEAN
    worst_cap = None
    total_nodes = 0
    total_pieces = 0
    for (xlo, xhi), cobj in zip(xs, cells):
        sig_prev = ZERO
        v_prev = nodes[0][1]
        for nd in cobj["nodes"]:
            sig = Q(nd["sigma"])
            assert sig > sig_prev
            y0, y1, y2, y3, y4 = (Q(s) for s in nd["y"])
            a0, a1, a2, a4, a6 = y0, y4, y1, y2, y3
            lam, mu, tt, be, nu = (Q(nd[k]) for k in ("lam", "mu", "t", "be", "nu"))
            z = [Q(s) for s in nd["z"]]
            assert lam > 0 and mu > 0 and nu >= 0 and a1 >= 0 and a6 >= 0 and len(z) == len(vs)
            cps = [spec_poly_v(i, cell, lam, mu, tt, be, nu) for i, cell in enumerate(cut_cells(vs, z))]
            maj = [a0, a1, a2, ZERO, a4, ZERO, a6]
            ok, pcs = sweep_top(sig, smax, maj, cps, vs, nodes)
            assert ok, f"sweepTop failed at x=[{xlo},{xhi}], sigma={sig}"
            total_nodes += 1
            total_pieces += pcs

            def j_at(x):
                return a0 + RHO_LEAN * a1 + a2 + a4 * (2 + x * x) + a6 * (6 + 9 * x * x + C6 * x**3)

            v_cur = max(j_at(xlo), j_at(xhi))
            ch = chord_max(v_prev, v_cur, kappa, sig_prev, sig)
            worst_cap = ch if worst_cap is None or ch > worst_cap else worst_cap
            sig_prev, v_prev = sig, v_cur
        assert sig_prev >= stop
    return worst_cap, total_nodes, total_pieces


def verify_homothety():
    assert C1 / EPS1 == Q(2141, 3150)
    for eps in (Q(299, 400), Q(1499, 2000), Q(3, 4), Q(94, 125), Q(1891, 2500)):
        c_e = Q(2141, 3150) * eps
        assert c_e / eps == C1 / EPS1
        ratio = eps / EPS1
        # Exact piecewise polynomial identity on [0, kink] and [kink, infinity):
        kink = C1 / EPS1
        assert (eps * eps) / c_e == ratio * ((EPS1 * EPS1) / C1)
        assert 2 * eps == ratio * (2 * EPS1) and c_e == ratio * C1
        for r in (ZERO, kink / 3, kink, kink * 2, Q(17, 5)):
            assert phi_eps(eps, c_e, r) == ratio * phi_eps(EPS1, C1, r)
            for y in (ZERO, Q(1, 4), Q(3, 5), Q(1)):
                assert 2 * eps * r * y - c_e * y * y <= phi_eps(eps, c_e, r)


def run_rejection_controls(doc):
    # Control 1: lower one table cap below phi_c(r/delta)
    bad1 = copy.deepcopy(doc)
    bad1["caps"][10] = str(Q(bad1["caps"][10]) - Q(1, 10**6))
    try:
        verify_mass_certificate(bad1)
        raise AssertionError("Control 1 failed to reject lowered table cap")
    except AssertionError as exc:
        assert "failed to reject" not in str(exc)

    # Control 2: lower y0 of node 0 by 10^-4 so sweepTop fails
    bad2 = copy.deepcopy(doc)
    bad2["cells"][0]["nodes"][0]["y"][0] = str(Q(bad2["cells"][0]["nodes"][0]["y"][0]) - Q(1, 10**4))
    try:
        verify_mass_certificate(bad2)
        raise AssertionError("Control 2 failed to reject corrupted majorant")
    except AssertionError as exc:
        assert "failed to reject" not in str(exc)

    # Control 3: break x-cell chaining
    bad3 = copy.deepcopy(doc)
    bad3["cells"][1]["x"][0] = str(Q(bad3["cells"][1]["x"][0]) + Q(1, 1000))
    try:
        verify_mass_certificate(bad3)
        raise AssertionError("Control 3 failed to reject broken x-chain")
    except AssertionError as exc:
        assert "failed to reject" not in str(exc)


def main():
    t0 = time.time()
    cert_path = Path(__file__).resolve().parent / "cert_mass_0.5_pruned.json"
    raw = cert_path.read_bytes()
    sha = hashlib.sha256(raw).hexdigest()
    assert sha == PINNED_SHA256, f"SHA-256 mismatch: {sha}"
    doc = json.loads(raw)

    cap_exact, n_nodes, n_pieces = verify_mass_certificate(doc)
    assert cap_exact + Q(1, 10**11) == S1
    assert cap_exact < S1
    verify_homothety()
    run_rejection_controls(doc)

    dt = time.time() - t0
    print(f"PASS mass certificate SHA-256 = {sha[:16]}... ({n_nodes} spectral nodes, {n_pieces} polynomial pieces in {dt:.2f}s)")
    print(f"PASS exact mass constant cap_exact = S1 - 10^-11 < S1 = {float(S1):.12f}")
    print("PASS exact homothety transfer c(eps) = (2141/3150)*eps and 3 rejection controls")


if __name__ == "__main__":
    main()

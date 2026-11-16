#!/usr/bin/env python3
"""Reviewer's independent checks of ADDENDUM.md (package-v2).  Nothing of the package is imported.

Part A (exact; the Wick-basis calculus of exact_wickbasis.py):
  A1  fact (N):  sum_j <dbar_j F, dbar_j G> = r <F, G>  and  sum_j <d_j F, d_j G> = p <F, G>  on H_{p,r}
  A2  fact (W):  <P22(R conj S), P22(R' conj S')> = <R, R'> conj<S, S'>  for R, S, R', S' in H_{2,0}
  A3  Theorem 13 (a), (b), (c), Corollary 13.1 (identity and bound), Corollary 13.2, Corollary 13.3  [via check()]
  A4  Proposition 14 on q = a :X^2 conj X: + b X^2 conj Y, real and complex (a, b):  u = 2(s+t), J1 = diag(2u, 0),
      I2 of rank one and trace u, |P20 q^2|^2 = 32 s^2, |P31 q^2|^2 = 96 s^2 + 96 s t, chi = 8p^2 + 24p + 10
  A5  the family R(X) conj(Y), R = X_1^2 + ... + X_N^2 (ADDENDUM section 2, last table row): chi = 2 + 8/N, l2 = u,
      l2^2/delta = N/(2N+8)
  A6  exact rational cubics with |P11 |q|^2|^2 / delta > 1/2 (erratum E2), if argmax files of the replayed search are
      given: the float argmax is rounded to Gaussian integers /1000 and evaluated exactly
Part B (floating point; the profiles and quadrature of own_numerics.py):
  B1  the table of numerics/half.py: (F), Theorem 9 with 3/4 and with 1/2, Gaussian-law shadows; crossovers with 11.49
  B2  the corner family at the peak row: truth, Corollary 6.1 with exact shadows, (F), 11.49, the Bessel losses, and
      the two comparators of REVIEW.md F4 (H of ledger 11.30/11.49 and the plain Bessel bound)

usage: own_v2.py <review-dir> [<delivered half.log>] [argmax_M_n*.npy ...]
"""
import sys, os, math, re, random
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
import numpy as np
from scipy import optimize
import exact_wickbasis as E
from exact_wickbasis import W, cubic, cabs2, cconj, cmul, cadd, ZERO
from own_numerics import Prof, Two, R1, W1, law_functionals, cap, GAMMA, Bbench, S2

def rnd_in(A, p, r, rng, terms=6):
    """a random element of H_{p,r} with Gaussian-integer coefficients (a Wick polynomial of that bidegree)."""
    n = A.n; F = {}
    for _ in range(terms):
        k = [0] * (2 * n)
        for _ in range(p): k[rng.randrange(n)] += 1
        for _ in range(r): k[n + rng.randrange(n)] += 1
        F[tuple(k)] = (rng.randint(-4, 4), rng.randint(-4, 4))
    return A.clean(F)

def part_A(argmax_files):
    rng = random.Random(99)
    # A1, A2
    for n in (2, 3):
        A = W(n)
        for (p, r) in ((1, 1), (2, 1), (2, 2), (1, 2), (2, 0), (3, 1)):
            for _ in range(4):
                F = rnd_in(A, p, r, rng); G = rnd_in(A, p, r, rng)
                sb = ZERO; sd = ZERO
                for j in range(n):
                    sb = cadd(sb, A.ip(A.db(F, j), A.db(G, j))); sd = cadd(sd, A.ip(A.d(F, j), A.d(G, j)))
                fg = A.ip(F, G)
                assert sb == (r * fg[0], r * fg[1]) and sd == (p * fg[0], p * fg[1]), "fact (N)"
        for _ in range(6):
            R, S, R2, S2_ = (rnd_in(A, 2, 0, rng) for _ in range(4))
            lhs = A.ip(A.proj(A.mul(R, A.conj(S)), 2, 2), A.proj(A.mul(R2, A.conj(S2_)), 2, 2))
            assert lhs == cmul(A.ip(R, R2), cconj(A.ip(S, S2_))), "fact (W)"
    print("A1, A2  facts (N) and (W) of ADDENDUM section 2: exact on random elements, n = 2, 3")
    # A3: Theorem 13 and its corollaries are asserted inside exact_wickbasis.check (components of c2, K3, K4, K5)
    cnt = 0
    for n_, trials, dens in ((1, 1, 1.0), (2, 8, 0.9), (3, 6, 0.6), (4, 2, 0.3)):
        for _ in range(trials):
            f_ = {}
            for a_ in range(n_):
                for b_ in range(a_, n_):
                    for c_ in range(n_):
                        if rng.random() < dens: f_[(a_, b_, c_)] = (rng.randint(-5, 5), rng.randint(-5, 5))
            f_ = {k: v for k, v in f_.items() if v != (0, 0)}
            if not f_: continue
            r = E.check("rnd", n_, f_, [1] * n_, mmax=1, do_p10=False, do_p11=False, do_p12=False, verbose=False)
            assert Fr(r["delta"], r["u"] ** 2) >= Fr(10, n_), "Corollary 13.2"
            cnt += 1
    print(f"A3      Theorem 13 (a)-(c), Corollaries 13.1, 13.2, 13.3: exact on {cnt} further random cubics (n = 1..4)")
    # A4: Proposition 14
    rows = []
    for a, b in ((1, 0), (0, 1), (1, 1), (1, 2), (2, 1), (1, 3), (3, 1), ((1, 2), (3, -1)), ((2, -1), (1, 1)), ((0, 1), 2), (3, (0, 2)), ((2, 3), (-1, 4))):
        ca, cb = E.C(a), E.C(b); s = cabs2(ca); t = cabs2(cb)
        f_ = {k: v for k, v in {(0, 0, 0): ca, (0, 0, 1): cb}.items() if v != (0, 0)}
        r = E.check("corner", 2, f_, [1, 1], mmax=1, do_p10=False, do_p11=False, do_p12=False, verbose=False)
        u = 2 * (s + t); assert r["u"] == u
        A = W(2); q = cubic(A, f_); dq = [A.d(q, j) for j in range(2)]; dbq = [A.db(q, j) for j in range(2)]
        J1 = [[A.ip(dq[b_], dq[a_]) for b_ in range(2)] for a_ in range(2)]
        I2 = [[A.ip(dbq[a_], dbq[b_]) for b_ in range(2)] for a_ in range(2)]
        assert J1 == [[(2 * u, 0), ZERO], [ZERO, ZERO]], "J1 = diag(2u, 0)"
        det = cadd(cmul(I2[0][0], I2[1][1]), tuple(-x for x in cmul(I2[0][1], I2[1][0])))
        assert det == ZERO and I2[0][0][0] + I2[1][1][0] == u, "I2 of rank one, trace u"
        assert r["q20"] == 32 * s * s and r["q31"] == 96 * s * s + 96 * s * t, "the two norms of Proposition 14"
        assert r["delta"] == 128 * s * s + 96 * s * t + 10 * u * u
        p = Fr(s, s + t); chi = Fr(r["delta"], u * u); assert chi == 8 * p * p + 24 * p + 10 and 10 <= chi <= 42
        assert abs(r["l1"] - 2 * u) < 1e-9 * u and abs(r["l2"] - u) < 1e-9 * u
        rows.append(f"(a,b)=({a},{b}): s={s}, t={t}, |P20 q^2|^2={r['q20']}, |P31 q^2|^2={r['q31']}, chi={chi}")
    print("A4      Proposition 14, exact on 12 members (5 with complex coefficients):"); [print("          " + x) for x in rows]
    # A5: R(X) conj(Y), R = X_1^2 + ... + X_N^2
    for N in (1, 2, 3):
        f_ = {(k, k, N): 1 for k in range(N)}
        r = E.check("RY", N + 1, f_, [1] * (N + 1), mmax=1, do_p10=False, do_p11=False, do_p12=False, verbose=False)
        chi = Fr(r["delta"], r["u"] ** 2)
        assert chi == 2 + Fr(8, N) and abs(r["l2"] - r["u"]) < 1e-9 * r["u"] and r["q20"] == 0 and r["q31"] == 0
        assert abs(r["l2"] ** 2 / r["delta"] - N / (2 * N + 8)) < 1e-12
        print(f"A5      R(X) conj(Y), N = {N}: chi = {chi}, l1/u = {r['l1']/r['u']:.4f}, l2/u = {r['l2']/r['u']:.4f}, l2^2/delta = {Fr(N, 2*N+8)}, (|J1|^2+|I2|^2)/delta = {Fr(r['hsJ']+r['hsI'], r['delta'])}")
    # A6: exact rational cubics with |P11 V|^2/delta > 1/2
    for path in argmax_files:
        x = np.load(path); m_ = re.search(r"_n(\d+)_", os.path.basename(path)); n = int(m_.group(1))
        IDX = [(a, b, j) for a in range(n) for b in range(a, n) for j in range(n)]; m = len(IDX)
        z = x[:m] + 1j * x[m:]; z = z / np.max(abs(z))
        # the package's build(): T[a,a,j] = z, T[a,b,j] = T[b,a,j] = z/sqrt2; q = sum T[a,b,j] :y_a y_b conj y_j:
        # exact data: coefficient of :y_a y_b conj y_j: (a <= b) is z for a = b and sqrt2 z for a < b; sqrt2 is replaced by 1414/1000
        f_ = {}
        for k, (a, b, j) in enumerate(IDX):
            w = z[k] * (1.0 if a == b else 1.414)
            v = (int(round(1000 * w.real)), int(round(1000 * w.imag)))
            if v != (0, 0): f_[(a, b, j)] = v
        A = W(n); q = cubic(A, f_); V = A.mul(q, A.conj(q)); u = A.n2(q); dl = A.EP(V, V)[0] - 2 * u * u
        v11 = A.n2(A.proj(V, 1, 1))
        print(f"A6      exact Gaussian-rational cubic in n = {n} variables (argmax of the replayed search, rounded): |P11 V|^2/delta = {v11}/{dl} = {v11/dl:.6f}  (chi = {dl/u/u:.4f})")
        print("          1000 x its coefficients of :y_a y_b conj(y_j): as {(a, b, j): (re, im)}: " + str(f_))
        assert 4 * v11 <= 3 * dl and 2 * v11 > dl

def part_B(out, half_log):
    P = Prof(os.path.join(out, "tab_reviewer.npz"))
    print("B1      (F) | Theorem 9 with 3/4 | with 1/2, over delta, Gaussian-law shadows (tilt 3/5):")
    mine = []
    for lab in ("tilt", "raw"):
        for u in (0.009, 0.02, 0.03, 0.0463):
            sA, sB, _ = law_functionals(P, lab, u * R1, W1); F = u * (S2 * sA + sB) ** 2
            vals = [(F / (c * u * u), cap(u, c * u * u, sA, sB, 0.75) / (c * u * u), cap(u, c * u * u, sA, sB, 0.5) / (c * u * u)) for c in (1, 2, 4, 6, 8, 10)]
            mine.append([x for v in vals for x in v])
            line = f"          {lab} u={u}: " + " ".join(f"chi={c}: {v[0]:.4f} | {v[1]:.4f} | {v[2]:.4f};" for c, v in zip((1, 2, 4, 6, 8, 10), vals))
            if lab == "tilt":
                g = GAMMA[u]
                x34 = optimize.brentq(lambda c: cap(u, c * u * u, sA, sB, 0.75) - g * c * u * u, 0.05, 60)
                x12 = optimize.brentq(lambda c: cap(u, c * u * u, sA, sB, 0.5) - g * c * u * u, 0.05, 60)
                line += f" crossover {x34:.2f} (3/4), {x12:.2f} (1/2); gain of 1/2 over (F) at chi = 2, 4, 6, 8: " + ", ".join(f"{vals[i][0]/vals[i][2]:.2f}" for i in (1, 2, 3, 4))
            print(line)
    if half_log and os.path.exists(half_log):
        worst = 0.0; k = 0
        for ln in open(half_log):
            nums = [float(x) for x in re.findall(r"(?:F|3/4|1/2) (\d\.\d{4})", ln)]
            if len(nums) == 18: worst = max(worst, max(abs(a - b) for a, b in zip(nums, mine[k]))); k += 1
        print(f"          against the delivered half.log ({k} lines, 18 numbers each): largest difference {worst:.1e}")
    print("B2      the corner family q = sqrt(p) H(X) + sqrt(1-p) X^2 conj(Y)/sqrt2, chi = 8p^2 + 24p + 10 (reviewer's quadrature):")
    G = Two(7, 56)
    X, Y = G.X, G.Y
    b11 = [abs(X) ** 2 - 1, X * np.conj(Y), Y * np.conj(X), abs(Y) ** 2 - 1]
    b20 = [X * X / S2, X * Y, Y * Y / S2]
    for lab, u, chis in (("tilt", 0.0463, (10, 12, 16, 20, 30, 42)), ("tilt", 0.02, (16,)), ("raw", 0.0463, (16,))):
        for chi in chis:
            p = (-3 + math.sqrt(9 + (chi - 10) / 2)) / 2
            c = [math.sqrt(p), 0, 0, 0, 0, math.sqrt(1 - p)]
            r = G.evaluate(P, c, u, lab)
            q, dX, dXb, dY, dYb = G.fields(c, u); V = abs(q) ** 2
            hv = P.h(lab, V); hp = P.hp(lab, V); psi = hv + V * hp
            Ah = np.array([G.E(np.conj(b) * psi) for b in b11]); Bh = np.array([G.E(np.conj(b) * q * q * hp) for b in b20])
            nA = float(np.sum(abs(Ah) ** 2)); nB = float(np.sum(abs(Bh) ** 2))
            # the content through the shadows (Theorem 6, operator form)
            d1 = [[G.E(np.conj(b) * np.conj(dj)) for b in b11] for dj in (dX, dY)]
            d2 = [[G.E(np.conj(b) * dj) for b in b20] for dj in (dXb, dYb)]
            cs = np.array([np.vdot(np.array(d1[j]), Ah) + np.vdot(np.array(d2[j]), Bh) for j in range(2)])
            C2s = float(np.sum(abs(cs) ** 2))
            cor61 = (math.sqrt(r["l1"] * nA) + math.sqrt(r["l2"] * nB)) ** 2
            mixed = (math.sqrt(r["l1"]) * r["sA"] + math.sqrt(r["l2"] * nB)) ** 2          # Bessel on A only
            F = u * (S2 * r["sA"] + r["sB"]) ** 2; D = r["D"]; g = GAMMA[u]
            Hh = min(g * r["dl"], 19321e-6 * u, 1 / 2500)
            s = (f"          {lab} u={u} chi={chi} (measured {r['chi']:.3f}; l1/u={r['l1']/u:.3f}, l2/u={r['l2']/u:.3f}): C2/D={r['C2']/D:.4f} (through the shadows {C2s/D:.4f}) | "
                 f"Cor 6.1 exact shadows/D={cor61/D:.4f} | Bessel on A only/D={mixed/D:.4f} | (F)/D={F/D:.4f} | sA^2/|A|^2={r['sA']**2/nA:.2f}, sB^2/|B|^2={(r['sB']**2/nB if nB > 1e-30 else float('inf')):.3g}")
            if lab == "tilt": s += f" | gamma*delta/D={g*r['dl']/D:.4f} | H/D={Hh/D:.4f} | plain Bessel Bz/D={r['Bz']/D:.4f}"
            else: s += f" | plain Bessel Bz/D={r['Bz']/D:.4f}"
            print(s)

if __name__ == "__main__":
    out = sys.argv[1]; half_log = sys.argv[2] if len(sys.argv) > 2 else None
    part_A([a for a in sys.argv[3:] if a.endswith(".npy")])
    part_B(out, half_log)

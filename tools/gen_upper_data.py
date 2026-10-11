#!/usr/bin/env python3
"""Write `Grothe/Upper/Data.lean`: the exact data of the upper certificate.

Inputs (folder `handoff/upper-residual/taylor`, or the folder given as first argument):

* `contour_input.json`: the profile `x`, `a`, `b`, `eta`, the odd polynomial `p` and the working
  slope `c` (decimal strings / fractions).  No other field of that file is used.
* `phase_damped_m4_d36_eps1p05.json`: the damping `epsilon` and the monomial coefficients of the
  phase polynomial `S(U, V, W)`.
* `X_energy_N501.npy`: the binary64 energy table of the truncated rounding `X`; every entry is read
  as the exact dyadic rational it represents.  Only the entries with `n + 3 m <= 501` are kept.
* `finite_head_N501_result.json`, `kernel_result.json`: the rational error bounds of the table
  (reflection, rotation, grouping) and of the correction tail.
* `taylor_comparison_result.json`, `baseline_tail_result.json`, `endpoint_result.json`: the
  comparison bound, the contour bound and the assembled endpoint (checked against the constants
  written here).

All numbers written are exact rationals.  Usage:
    python3 tools/gen_upper_data.py [handoff/upper-residual/taylor] [Grothe/Upper/Data.lean]"""
import json, struct, sys, ast
from fractions import Fraction as Q

N = 501                              # head degree in t
HEAD_CAP = Q(7143, 10 ** 12)         # certified bound for the computed head (value 7.14272e-9)
COMPARE = Q(2497, 2 * 10 ** 9)       # l1 distance of the energies of the rounding and of X
TAIL = Q(72, 10 ** 9)                # Hardy tail bound of the base kernel beyond degree N
SQUARE, RADIUS = Q(7, 4), Q(259, 250)   # weighted square-sum bound and its radius
DELTA = Q(133, 10 ** 8)              # total residual

def up(q, k=18):
    """Round a positive rational up to k decimals."""
    return Q(-((-q.numerator * 10 ** k) // q.denominator), 10 ** k)

def rat(x):
    if isinstance(x, (bool, float)): raise SystemExit(f"inexact number {x!r}")
    return Q(x) if isinstance(x, int) else Q(str(x))

def lean_rat(q):
    q = Q(q)
    return f"({q.numerator} : ℚ)" if q.denominator == 1 else f"({q.numerator} : ℚ) / {q.denominator}"

def lean_list(qs, per=4):
    items = [lean_rat(q) for q in qs]
    lines = [", ".join(items[i:i + per]) for i in range(0, len(items), per)]
    return "[" + ",\n   ".join(lines) + "]"

def load_npy(path):
    """Read a 2-d little-endian float64 C-ordered .npy file exactly (no numpy needed)."""
    with open(path, "rb") as f:
        raw = f.read()
    if raw[:6] != b"\x93NUMPY": raise SystemExit("not an npy file")
    major = raw[6]
    hlen, off = (struct.unpack("<H", raw[8:10])[0], 10) if major == 1 else (struct.unpack("<I", raw[8:12])[0], 12)
    header = ast.literal_eval(raw[off:off + hlen].decode("latin1"))
    if header["descr"] != "<f8" or header["fortran_order"]: raise SystemExit("unexpected npy layout")
    rows, cols = header["shape"]
    vals = struct.unpack(f"<{rows * cols}d", raw[off + hlen:off + hlen + 8 * rows * cols])
    return rows, cols, vals

def main():
    src = sys.argv[1] if len(sys.argv) > 1 else "handoff/upper-residual/taylor"
    out = sys.argv[2] if len(sys.argv) > 2 else "Grothe/Upper/Data.lean"
    inp = json.load(open(f"{src}/contour_input.json"))
    old = json.load(open(f"{src}/finite_head_N501_result.json"))
    ker = json.load(open(f"{src}/kernel_result.json"))
    cmp_ = json.load(open(f"{src}/taylor_comparison_result.json"))
    tl = json.load(open(f"{src}/baseline_tail_result.json"))
    end = json.load(open(f"{src}/endpoint_result.json"))
    ph = json.load(open(f"{src}/phase_damped_m4_d36_eps1p05.json"))
    prof = [rat(s) for s in inp["profile"]]
    a, b, eta, c = rat(inp["a"]), rat(inp["b"]), rat(inp["eta"]), rat(inp["working_slope"])
    p = [rat(s) for s in inp["p"]]
    if any(x != 0 for x in p[0::2]): raise SystemExit("p is not odd")
    P = p[1::2]
    while P and P[-1] == 0: P.pop()
    if 2 * len(P) - 1 > N: raise SystemExit("degree of p too large")
    if sum(abs(x) for x in P) > 1: raise SystemExit("||p||_A > 1")
    eps = rat(ph["epsilon"])
    mono = [(tuple(t["powers"]), rat(t["coefficient"])) for t in ph["monomial_coefficients"]]

    # The error budgets of the source computation (`certify_kernel.py`), recomputed exactly.
    gamma1 = Q(1, 2 ** 53 - 1)
    ref, rot, grp = (rat(old[k]) for k in ("reflection_error_upper_rational",
                     "rotation_error_upper_rational", "grouping_error_upper_rational"))
    raw = Q(5, 10 ** 12)
    addition = gamma1 * Q(1003, 1000) + Q(1, 10 ** 290)
    dl = raw + ref + addition + rot * Q(1010, 1001)
    energy = dl * (Q(201, 100) + dl) + grp * Q(1010, 1001)          # table of X, l1
    base = (raw + ref + rot) * (2 + raw + ref + rot) + grp           # table of the base, l1
    fin = 2 * energy + base + gamma1 * Q(201, 100) + Q(1, 10 ** 290)
    if fin != rat(ker["finite_arithmetic_error_cap"]): raise SystemExit("error budget mismatch")
    corr = rat(ker["best_correction_tail"]["tail_cap"]) + fin - energy
    err_e, err_c = up(energy), up(corr)
    if rat(ker["center_residual_head_l1_upper_rational"]) > HEAD_CAP: raise SystemExit("head cap")
    if rat(cmp_["comparison_upper"]) > COMPARE: raise SystemExit("comparison cap")
    if rat(tl["radius"]) != RADIUS or rat(tl["mean_square_upper_rational"]) > SQUARE or tl["N"] != N:
        raise SystemExit("contour data")
    if rat(tl["tail_cap"]) > TAIL: raise SystemExit("tail cap")
    if c != rat(end["working_slope"]) or DELTA != rat(end["wiener_error_cap"]): raise SystemExit("endpoint data")
    if HEAD_CAP + err_e + err_c + TAIL + COMPARE > DELTA: raise SystemExit("budget does not close")
    if not DELTA < c: raise SystemExit("residual not below the slope")
    bound = 1 / (c - DELTA)
    if bound != rat(end["endpoint_exact"]): raise SystemExit("endpoint mismatch")

    rows, cols, vals = load_npy(f"{src}/X_energy_N501.npy")
    table = {}
    for n in range(rows):
        for m in range(cols):
            v = vals[n * cols + m]
            if v == 0.0 or n + 3 * m > N: continue
            if (n + m) % 2 == 0 or not v > 0: raise SystemExit(f"unexpected entry {(n, m, v)}")
            num, den = v.as_integer_ratio()          # exact
            k = den.bit_length() - 1
            assert den == 1 << k and Q(num, den) == Q(v)
            table.setdefault(m, []).append((n, num, k))
    count = sum(len(r) for r in table.values())
    strs = ['  "' + f"{m}:" + ";".join(f"{n},{num},{k}" for n, num, k in table[m]) + '"' for m in sorted(table)]

    L = []
    L.append("import GrotheKernel.Table\nimport Mathlib.Data.Rat.Init\n")
    L.append(f"""/-!
# Exact data of the upper certificate

Generated by `tools/gen_upper_data.py` from the files in `handoff/upper-residual/taylor` (exact
rationals and exact dyadic rationals).

**The rounding.**  Let `F₀(z, w) = phase(z + √(1 + a²) · v(|z|²) · w)` with
`v(s) = Σ_j x_j L_j^{{(−1/2)}}(s) / √(Γ(j + ½)/j!)` (`profileQ`), and, with `U = |z|²`, `V = |w|²`,
`W = Re(z̄w)`, `D = Im(z̄w)`,

  `φ(z, w) = D · exp(−ε(U + V)) · S(U, V, W)`,  `F = F₀ · exp(iφ)`

(`phaseEpsQ`, `phaseStrs`: `S` has {len(mono)} monomials).  The rounding is the smoothed function
`G(x) = 𝔼 F(M x + √(I − M²) Z)`, `M = P_u + √η (I − P_u)` with `P_u` the orthogonal projection on
`u = (1, b)`; the primary coordinate has correlation `p(t)` and the auxiliary one `−τ(t)`,
`τ(t) = (t³ + a² t⁷)/(1 + a²)`.  A function `Y` of this kind has the correlation kernel

  `H_Y(t) = Σ_{{n,m}} E_Y[n,m] · p(t)^n · (−τ(t))^m`,

with `E_Y[n,m] ≥ 0` its chaos energies (primary degree `n`, auxiliary degree `m`, `n + m` odd).
Three such functions occur: the rounding `F₀ e^{{iφ}}`, the base `F₀`, and the truncation
`X = F₀ + v`, where `v` is a fixed polynomial of degree `≤ 181` approximating
`(iφ + (iφ)²/2 + (iφ)³/6) F₀` (Hermite cutoffs `181`, `91`, `51` for the three terms).

* `profileQ`, `aQ`, `bQ`, `etaQ`, `phaseEpsQ`, `phaseStrs`: the parameters of the rounding;
* `pList`: the coefficients of `P`, where `p(t) = t·P(t²)` (degree {2 * len(P) - 1}, `Σ|p_k| ≤ 1`);
* `qList`: the coefficients of `Q`, where `−τ(t) = t·Q(t²)`;
* `slopeQ`: the working slope `c`;
* `energyStrs`, `energyRows`: the computed energies `Ê[n,m]` of `X` with `n + 3m ≤ {N}` ({count}
  entries, rows `m:n,a,k;…` meaning `Ê[n,m] = a/2^k`), the binary64 values of the source table read
  as exact dyadic rationals;
* `energyErrQ`: a bound for `Σ_{{n+3m ≤ {N}}} |E_X[n,m] − Ê[n,m]|` established by the source
  computation ({float(energy):.6e}, rounded up);
* `corrTailQ`: a bound for the kernel coefficients of `E_X − E_{{F₀}}` beyond degree `{N}`
  established by the source computation ({float(corr):.6e}, rounded up);
* `compareQ`: the bound for `Σ |E[n,m] − E_X[n,m]|` established by the source computation
  ({float(rat(cmp_["comparison_upper"])):.9e});
* `headCapQ`: the bound certified in `Final.lean` for `Σ_{{k ≤ {N}}} |[t^k](Ĥ(t) − c·t)|`, where `Ĥ`
  is the kernel of `Ê`.

The certified bound is `1/(c − {DELTA}) = {bound}`.
-/

namespace Grothe.Upper

open GrotheKernel
""")
    L.append("/-- The profile coefficients `x_j` of `v`. -/")
    L.append(f"def profileQ : List ℚ :=\n  {lean_list(prof)}\n")
    L.append("/-- The auxiliary amplitude `a`. -/")
    L.append(f"def aQ : ℚ := {lean_rat(a)}\n")
    L.append("/-- The smoothing direction `u = (1, b)`. -/")
    L.append(f"def bQ : ℚ := {lean_rat(b)}\n")
    L.append("/-- The smoothing parameter `η`. -/")
    L.append(f"def etaQ : ℚ := {lean_rat(eta)}\n")
    L.append("/-- The working slope `c`. -/")
    L.append(f"def slopeQ : ℚ := {lean_rat(c)}\n")
    L.append("/-- Coefficients of `P`: `p(t) = t·P(t²)`. -/")
    L.append(f"def pList : List ℚ :=\n  {lean_list(P)}\n")
    L.append("/-- Coefficients of `Q`: `−τ(t) = t·Q(t²)`, `Q(X) = −X(1 + a²X²)/(1 + a²)`. -/")
    L.append("def qList : List ℚ := [0, -1 / (1 + aQ * aQ), 0, -(aQ * aQ) / (1 + aQ * aQ)]\n")
    L.append("/-- The damping `ε` of the phase. -/")
    L.append(f"def phaseEpsQ : ℚ := {lean_rat(eps)}\n")
    L.append("/-- The monomials `i,j,k:c` of the phase polynomial `S = Σ c · U^i V^j W^k`. -/")
    L.append("def phaseStrs : List String := [\n" + ",\n".join(
        '  "' + f"{i},{j},{k}:{cf.numerator}/{cf.denominator}" + '"' for (i, j, k), cf in mono) + "]\n")
    L.append("/-- The `ℓ¹` error bound of the stored energies of `X`. -/")
    L.append(f"def energyErrQ : ℚ := {lean_rat(err_e)}\n")
    L.append("/-- The bound for the kernel coefficients of `E_X − E_{F₀}` beyond degree `501`. -/")
    L.append(f"def corrTailQ : ℚ := {lean_rat(err_c)}\n")
    L.append("/-- The `ℓ¹` distance of the energies of the rounding and of `X`. -/")
    L.append(f"def compareQ : ℚ := {lean_rat(COMPARE)}\n")
    L.append("/-- Certified bound for the head of the stored table. -/")
    L.append(f"def headCapQ : ℚ := {lean_rat(HEAD_CAP)}\n")
    L.append("/-- The stored energies, one string per auxiliary degree `m`. -/")
    L.append("def energyStrs : List String := [\n" + ",\n".join(strs) + "]\n")
    L.append("/-- The stored energies as exact rows `(m, [(n, Ê[n,m]), …])`. -/")
    L.append("def energyRows : List RowQ := energyStrs.map parseRow\n")
    L.append("end Grothe.Upper")
    open(out, "w").write("\n".join(L) + "\n")
    print(f"wrote {out}: {count} entries, {len(table)} rows, bound = {bound} ~ {float(bound):.15f}")

main()

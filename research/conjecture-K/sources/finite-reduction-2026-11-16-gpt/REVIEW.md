<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-finite-reduction-2026-11-16/REVIEW.md (16 November 2026): review by a review worker of claude-b9ee. Only this line was added. -->
# Review of "Content-law inequality: a finite-dimensional reduction" (GPT session, relayed 16 November 2026)

Reviewer: review worker of claude-b9ee (the author of the deficit-sign report), 16 November 2026, 18:05–18:30
Europe/Bucharest. Reviewed: `package/` in this folder (README.md, REDUCTION.md, SHARED_BULK.md, LEDGER.md, SOURCES.md,
`scripts/verify.mjs`, `results/replay.json`; the manifest verifies). Nothing tracked was edited, committed, pushed or
posted. No URL of SOURCES.md is reproduced here. Delivered code ran from a scratch copy (`review/replay/`), one
process. Labels as in the ledgers: **P** proof re-derived here line by line, **C** exact computation (on instances),
**N** floating point.

## 1. Verdict

| # | statement | verdict |
|---|---|---|
| (1) | Theorem 1 of REDUCTION.md (marked Gaussian compression inside H₂,₁) with its five estimates and constants | **correct (P)**; every constant re-derived. It holds for m ≥ 842, not only m ≥ 1024 |
| (1′) | Lemma 2 (E_M‖Q_M − S_M‖² ≤ 7/m), the estimate (5), the transfer (8), the test (9), the Lipschitz bounds of §4 | **correct (P)** |
| (1″) | "a sufficient finite-dimensional certificate criterion" | logically correct, **not usable**: (9) cannot hold for any cubic when m ≤ 1,097,505, whatever the profile; with the constants of the six band rows the junta alone needs m ≥ 1.7·10⁷ to 2.1·10⁹ (N). At m = 1024 the allowance exceeds the whole margin by a factor 129 to 1444 |
| (2) | 0 ≤ ρ_∞ − ρ_m ≤ 3/√m for m ≥ 2 | **correct (P)**, for the complex H₂,₁ with E\|Q\|² = 1. Consistent with every known value, and informative only for m ≥ 150; it would beat 0.9359 only with a sharp radius bound in dimension m ≥ 3648 |
| (3) | SHARED_BULK.md: θ = 5/3 for q = ΣX_ip_i(Y) + ΣX̄_if_i(Y) with Σp_if_i = 0, and the coefficient (4) | **correct (P)**; independent exact checks on three instances (C) |
| (4) | `scripts/verify.mjs` | replays; output identical to `results/replay.json` |

No statement is wrong. The corrections of §7 concern what the reduction can be used for and four small points of
wording.

## 2. REDUCTION.md, line by line

**Normalisation (§1, §4).** With q = √u·Q, H(v) = h(uv), K = 𝒦₁H: K(v) = k(uv), K′(v) = u·k′(uv);
E[X̄·q·h(|q|²)] = √u·C(Q, X); δ_q = u²χ(Q); Ω̂_q[h] = ω(Q)/u, ω = (3/2)E g(Q) − (3/4)(E a(Q))². So
‖c‖² ≤ θδΩ̂ ⇔ |C|² ≤ θχω. Checked. Also 0 ≤ (3/4)E g ≤ ω ≤ (3/2)B_g (Cauchy–Schwarz with E V = 1).

**Construction (§2).** Q = Σ :XⁱX̄ʲ:·f_ij(Y) with f_ij ∈ H_{2−i,1−j}(Y), six components. For P bihomogeneous of
bidegree (a, 1), Δ_ℂ(|z|²g) = (m + a − 1)g for g holomorphic of degree a − 1, so harm P = P − |z|²Δ_ℂP/(m + a − 1) is
Δ_ℂ-harmonic; this is (2). A harmonic bihomogeneous polynomial is its own Wick ordering (:P: = e^{−Δ_ℂ}P), so
harm P ∈ H_{a,b}(ℂᵐ), and Q_M = Σ :XⁱX̄ʲ:·m^{−(a+b)/2}(harm P_ij)(Z) ∈ H₂,₁(ℂ^{m+1}) **for every matrix M** (not
only on average). On the sphere f(Mζ) = H_{ab,M}(ζ) + (a component in the harmonic space of bidegree
(a − 1, b − 1)), the Wick correction of f included. **C:** `review/check_harm_exact.py` (rational M, all six
components, three trials): Δ(harm P) = 0, Q_M ⟂ first chaos, ‖Q_M‖² = Σ‖∂̄_jQ_M‖² = ½Σ‖∂_jQ_M‖².

**Lemma 2.** (4) is Mehler's formula for the pair (Mζ, Mη), whose cross-covariance is ρ·I and whose
pseudo-covariance vanishes. E|ρ|² = 1/m, E|ρ|⁴ = 2/(m(m + 1)) (Beta(1, m − 1)). Dropped norms: ‖f‖²/m for (1,1);
for (2,1) the kernel of the projection on holomorphic linear functions is mρ, so m·E|ρ|⁴‖f‖² = 2‖f‖²/(m + 1).
Radial factors: (s − 1)² ≤ (T − 1)², E(T − 1)² = 1/m, (s³ − 1)² ≤ (T − 1)²(T + 2), E = 3/m + 2/m². High and low
harmonics are orthogonal and R is independent of ζ, so the two errors add in squares; the sum over the six
components uses the orthogonality of the Wick monomials of X. All correct; the constant 7 is not sharp (the exact
value for a (2,1) component is 0.61·(7/m) at m = 1024, about 4.25/m). **N:** `review/check_lemma2.py` (i)–(iii):
Monte Carlo over 20,000 matrices reproduces ‖f‖²/m and 2‖f‖²/(m + 1) within 1.2 standard errors for
(p, m) = (2, 3), (3, 8), (2, 40).

**The trace example.** Recomputed by hand: constant term 1/m; corrected error 2/m − 1/m²; naive substitution
n/m + 1/m². Correct.

**Selection of M (§3).** (5): E_M|E_ζF̃(Mζ) − E F̃|² = Σ_{a≥1}E|ρ|^{2a}‖Π_{a,a}F̃‖² ≤ ‖F‖²/m. (The invariance
hypothesis on F̃ is not needed: E[ρᵃρ̄ᵇ] = 0 for a ≠ b.) Eight nonnegative terms of total mean ≤ 8, so some M has
‖Q_M − S_M‖² ≤ 56/m, |μ_j(M) − μ_j| ≤ √8·σ_j/√m and E|S_M|⁶ ≤ 8E|Q|⁶ simultaneously. Then |‖S_M‖ − 1| ≤ 21/√m,
|‖Q_M‖ − 1| ≤ 29/√m, and Q_* = Q_M/‖Q_M‖ exists once 29/√m < 1, with ‖Q_* − S_M‖ ≤ 37/√m.

**The five estimates.** Profile tests: 3σ_j + 37·L_j with σ_j ≤ B_j (Cauchy–Schwarz with ‖X‖₂ = 1 for the marked
one). Radius: 3 + 37 = 40. Fourth moment: E|Q|⁶ < 12000 from ledger 3.4 at χ ≤ 42 (11,395); ‖Q‖₈⁴ ≤ (7/5)⁶·12000^{2/3}
= 3946 by hypercontractivity (valid for complex Q: |P_tQ| ≤ P_t|Q|); ||z|⁴ − |w|⁴| ≤ 2(|z|³ + |w|³)|z − w|; total
3·4000 + 2(110 + 310)·37 = 43,080 < 44,000. All correct.

**Transfer (§4).** (8): |Δ|C|²| ≤ 2B_Φd_Φ/√m; |Δ(χω)| ≤ (44000·(3/2)B_g + 42·(3/2)(d_g + B_ad_a))/√m. Correct.
(9) is the right one-sided statement: for Q in any dimension with χ(Q) ≥ b₀, the cubic Q_* satisfies
χ(Q_*) ≥ b₀ − 44000/√m and ℛ_θ(Q, X) ≤ ℛ_θ(Q_*, X) + E_θ/√m. The Lipschitz bounds (L_Φ, 440, (3/2)(L_g + B_aL_a))
are correct. dim_ℝ of the coefficient sphere: 2·C(m + 2, 2)(m + 1) − 1, correct.

**Radius (§5).** E_M‖Q_M‖² = E s⁶·(1 − 2/(m + 1)) = (m − 1)(m + 2)/m²; E|Q| = E_ME_ζ|S_M| ≤ E_M‖Q_M‖₁ + √(7/m)
≤ ρ_m√(1 + 1/m) + √(7/m); √7 + 1/(2√2) < 3. Correct. (With the exact error of Lemma 2, which is at most 5/m in this
case, the constant is 2.6.)

### The points to press

- **(a)** Q_M ∈ H₂,₁(ℂ^{m+1}) for every realisation of M. Its variance is random (mean 1 + O(1/m)); for the selected
  M it is within 29/√m of 1, and Q_* is Q_M normalised, so E|Q_*|² = 1 exactly. The selection is a first-moment
  argument: one good M exists (a set of positive probability with slightly larger constants).
- **(b)** The approximation is in **absolute** error, in normalised units, for one fixed normalised profile
  H(v) = h(uv) at a **fixed energy u**, uniformly over Q, over the dimension n and over the mark. Regularity
  needed: Φ(z) = zH(|z|²), a = vK′, g = vK′² bounded and globally Lipschitz on ℂ. For the row profiles
  h(v) = G(√v)/√v this is G ∈ C²_b; the package quotes it from its previous packet (not re-derived here; the
  tables are consistent with it on s ≤ 6). The six constants depend on u: B_Φ = sup|G|/√u, L_Φ = max(sup|G′|,
  sup|G(s)/s|), B_a = sup|wk′(w)|, B_g = u·sup w·k′(w)², L_a = 2√u·sup √w|k′ + wk″|, L_g = 2u^{3/2}·sup √w|k′² + 2wk′k″|.
  No number is given in the package; mine are in §3 (N, from tables accurate to 10⁻⁴).
- **(c)** E_θ = 2B_Φ(3B_Φ + 37L_Φ) + θ[66000B_g + 63(3B_g + 37L_g + B_a(3B_a + 37L_a))]. It depends on the profile
  through those six norms and **not on χ**: it is built from the worst case χ = 42 and does not shrink when χ
  does, whereas the term it is compared with, θχω, does.
- **(d)** The mark is any unit linear form fixed in advance, and Theorem 1 controls the content of Q_* along that
  same form only. The content vector of Q_* may have other components; that is harmless for the use made of it:
  taking X as the content direction of Q, ‖c_Q‖² = |C(Q, X)|² ≤ |C(Q_*, X)|² + 2B_Φd_Φ/√m ≤ ‖c_{Q_*}‖² + 2B_Φd_Φ/√m.
- **(e)** m ≥ 1024 is used once, for 29/√m < 1 (the verifier checks 29² < 1024). m ≥ 842 suffices. Lemma 2 and
  §5 need only m ≥ 2.

## 3. Is the reduction usable? No

**The interface.** Fix a row, a sector, an energy u (or a cell, with suprema of the constants), the threshold θ and
a cutoff b₀ below which the inequality is proved separately. To be checked: for every variance-one
Q′ ∈ H₂,₁(ℂ^{m+1}) with χ(Q′) ≥ b₀ − 44000/√m and every unit linear form X′,
|C(Q′, X′)|² − θχ(Q′)ω(Q′) ≤ −E_θ/√m.

**A profile-free floor.** −ℛ_θ ≤ θχω < θ·42·(3/2)B_g = 63θB_g, and E_θ ≥ 66000θB_g. So the test fails for
**every** cubic whenever 66000/√m ≥ 63, i.e. for all **m ≤ 1,097,505**. At m = 1024 the shift 44000/√m is 1375 > 42,
so the cutoff b₀ plays no role either.

**The six rows (N; `review/task2_constants.py`, `.log`).** Profiles from
`research/higher-degree/code/degree5-content/profiles/`; my junta ratios at 0.5u* are 0.185–0.621 over the six
rows, the ledger's "0.19–0.62". Sector A at u = u*:

| row | θ | B_Φ | L_Φ | B_a | L_a | B_g | L_g | E_θ | E_θ/32 | 63θB_g | junta: (θ − r)·42·ω | m needed for the junta |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.80 | 0.37 | 2.65 | 0.70 | 0.227 | 0.197 | 0.0190 | 0.0268 | 711 | 22.2 | 0.44 | 0.127 | 3.1·10⁷ |
| 0.82 | 0.64 | 3.00 | 0.68 | 0.232 | 0.177 | 0.0148 | 0.0191 | 925 | 28.9 | 0.59 | 0.146 | 4.0·10⁷ |
| 0.84 | 1.33 | 3.57 | 0.65 | 0.236 | 0.152 | 0.0104 | 0.0120 | 1325 | 41.4 | 0.87 | 0.169 | 6.2·10⁷ |
| 0.845 | 1.88 | 3.77 | 0.64 | 0.237 | 0.160 | 0.0093 | 0.0102 | 1651 | 51.6 | 1.10 | 0.200 | 6.8·10⁷ |
| 0.85 | 2.5 | 4.02 | 0.64 | 0.239 | 0.174 | 0.0082 | 0.0089 | 1960 | 61.3 | 1.29 | 0.214 | 8.4·10⁷ |
| 0.855 | 3.7 | 4.32 | 0.63 | 0.240 | 0.192 | 0.0071 | 0.0072 | 2542 | 79.4 | 1.65 | 0.246 | 1.1·10⁸ |

Over both sectors and u/u* ∈ {0.5, 1, 1.3} (36 cases): E_θ = 205 to 2857; **E_θ/√1024 = 6.4 to 89**; the largest
value θχω can take, 63θB_g, is 0.06 to 2.0; the junta's actual margin is 0.008 to 0.38. So at m = 1024 the
allowance is **129 to 1444 times** the margin of the most favourable cubic (χ = 42); the relative room of the
band (factors 1.7–6) is of no help, because the errors are absolute and of the size of the terms themselves.
The junta passes (9) only for m ≥ 1.7·10⁷ (row 0.80, A, 1.3u*) to 2.1·10⁹ (row 0.855, B, 0.5u*). For a cubic of
excess χ the requirement grows like (42/χ)²; on the whole range χ ≥ b₀ one needs in addition √m > 44000/b₀. No
cutoff b₀ is certified (the scalar criterion of the previous packet is not evaluated).

**At m = 1024 none of the observables is controlled to its own size** (row 0.80, A, u*): |ΔC| ≤ 34/32 = 1.07
against C = 0.19 on the junta; |ΔE g| ≤ 1.05/32 = 0.033 against E g ≈ 0.01; |Δχ| ≤ 1375 against χ ≤ 42.

**This is not an artefact of loose constants.** The m^{−1/2} rate is the fluctuation of the random compression, and
for the fourth moment its size is ‖|Q|⁴‖₂ = ‖Q‖₈⁴, which is 2755.5 on the junta (exact: E V⁴ = 7,593,024), against
the 4000 used. Halving every constant changes m by a factor 4.

**The net.** dim_ℂ H₂,₁(ℂ¹⁰²⁵) = 538,970,625. A net on a sphere of 1.08·10⁹ real dimensions is not a computation;
at m ≥ 10⁷ the coefficient space has more than 10²⁰ dimensions. In dimension m + 1 the inequality is as hard as
in general; what the reduction gives is a rate for a limit, not a certificate route.

**The radius.** Gap between the proved 0.9359 and √π/2 = 0.88623: 0.0497. 3/√m < 0.0497 needs **m ≥ 3648**; for
the 0.916 of the uncapped game, m ≥ 10,154 (with the constant 2.6: 2740 and 7627). And it needs a sharp bound for
ρ_m in that dimension; the record has one for seven complex coordinates (3/√7 = 1.13). At m = 1024 a proof of
ρ₁₀₂₄ = √π/2 would give ρ_∞ ≤ 0.980.

## 4. The radius corollary against known values

- Derived for the complex H₂,₁ with E|Q|² = 1 (Gaussian value √π/2); 0.9359 is in the same normalisation.
- Known: ρ₁ = 0.69082; ρ_m ≥ 0.744, 0.774, 0.789, 0.812, 0.822 for m = 2, 3, 4, 6, 8 (near-extremal cubics of
  codex-c7e2); ρ_m ≤ 0.88572 for m ≤ 7; √π/2 ≤ ρ_∞ ≤ 0.9359. Hence ρ_∞ − ρ_m ≤ 0.9359 − 0.6908 = 0.245 for every m,
  and the claim says something only when 3/√m < 0.245, i.e. m ≥ 150. No conflict is possible below that.
- The lower bound it implies, ρ_m ≥ √π/2 − 3/√m, exceeds the monomial value only for m ≥ 236 and is far below
  what sums of monomials give directly (0.858 at 64 summands).
- The real third chaos data (0.7726 … 0.8755 for n ≤ 6, ≥ 0.9051 at n = 10, in units of √(2/π)) are a different
  normalisation and a different space; they show gaps of about 0.9/n, so the true rate looks like 1/m and the
  bound 3/√m is far from sharp, as expected from a second-moment argument.
- **N** (`check_lemma2.py` (iv)): for the Wick monomial the chain E|Q| ≤ E_M‖Q_M‖₁ + √(7/m) reads
  0.6908 ≤ 0.4117 + 1.871 (m = 2), 0.6818 + 0.331 (m = 64), 0.6903 + 0.083 (m = 1024); the compressed monomial
  is w(|w|² − 2|Y′|²/(m − 1)) up to a factor, with E|·|/‖·‖₂ = 0.607, 0.640, 0.672, 0.6885, 0.6907 at
  m = 2, 3, 8, 64, 1024.

## 5. SHARED_BULK.md

Re-derived in full.

- Given Y, q = Σ(p_iX_i + f_iX̄_i) is Gaussian with variance A = Σ(|p_i|² + |f_i|²) and pseudo-covariance
  E[q² | Y] = 2Σp_if_i. Under the hypothesis V | Y is A·Exp(1), δ = 2Var A, the content in every Y direction
  vanishes, and the regression X̄_i = (p_i/A)q̄ + (f̄_i/A)q + residual gives c_{X_i} = E[p_i·τh(Aτ)] (the second term
  carries E[q²h(|q|²) | Y] = 0).
- E_τ[τh(Aτ)] = E_τk(Aτ) + (A − u)E_τ[τk′(Aτ)] (h = k − uk′ and E[τφ(τ)] = E[φ] + E[τφ′]); E[P_iκ(A)] = E[κ′(A)·2(BP)_i]
  by the eigenvalue 2 of the real quadratic P_i; hence (2).
- (3): from κ₂ = 2tr H², κ₃ = 8tr H³ and the mixed fourth cumulant 16[2tr(H_i²H_j²) + tr(H_iH_jH_iH_j)]. All five
  identities re-derived.
- N_e²/A ≤ e^⊤W²e with W = (A − u)I + 2B gives u·E_μZ_e² ≤ L + 4e^⊤Ke; u·E_μZ_e = 16e^⊤v; (I − ½Π)⁻¹ = I + Π gives (4).
- 5/3: K₁₁ ≤ tr J pair by pair; M₁₁² ≥ 8tr H₁⁴ because e·P is a Hermitian form in Y (double eigenvalues), whence
  32T₁₁ ≤ tr J; (e^⊤v)²/u ≤ ½T₁₁. Then 4K₁₁ + 256(e^⊤v)²/u ≤ 8tr J. Correct.

**What "proper Gaussian conditional output" requires of the tensor.** (i) q is real-linear in the receiver block:
every monomial has exactly one receiver index (X_iY_kȲ_l with matrix A_i, or X̄_iY_kY_l with symmetric F^i); no
pure-Y cubic and no receiver self-interaction. (ii) Σ_ip_i(Y)f_i(Y) ≡ 0, i.e. for every l the symmetrisation over
(k, a, b) of Σ_i(A_i)_{lk}F^i_{ab} vanishes, and Σ_i tr(A_i)F^i = 0. Equivalently the receiver part of the field
a = Σ∂_jq·∂̄_jq vanishes: Σ_i∂_{X_i}q·∂̄_{X_i}q ≡ 0. Disjoint receivers suffice. Without (ii) the law of V given Y
is not exponential and the regression term does not drop.

**C (`review/check_shared_bulk.py`, exact).** X(|Y|² − 1) + Z̄Y²: u = 3, δ = 104, ‖c[v]‖² = 144, ratio 8/13 at
h = v; formula (4) gives 35/39. The shared-receiver example of the note (Σp_if_i = 0): E V² = 2E A² = 72,
E V³ = 6E A³ = 3456, u = 4, δ = 40 by both routes, content 0, (4) gives 13/30. A control outside the class,
X·y₁ȳ₂ + X̄·y₁²: E V² = 104 ≠ 2E A² = 80.

**Scope.** θ = 5/3 is below the thresholds of the rows 0.845–0.855 only. The class has no self-interaction, and I
found no member with shared receivers and nonzero content that is not unitarily equivalent to one with disjoint
receivers (not settled, §9), so I see no new cubic of the hard families in it. It contains the independent-bulk theorem of the
previous packet as the case of disjoint receivers and blocks.

## 6. Replay

`node verify.mjs` (v24.14.0) in `review/replay/`: "C PASS"; the JSON output is identical to
`package/results/replay.json`. The script uses BigInt arithmetic only and reads no file. It checks the arithmetic of
the constants, Gamma moments on five m, the trace example, and the moment identities (3) with two polynomial
profiles on two triples of 2×2 matrices. It does not check the hypercontractive step, the profile constants or
any inequality between cubics.

## 7. Corrections required

1. **README, LEDGER ("finite check with margin", "conservative dimension bound").** Say that the test (9) cannot be
   met for m ≤ 1.1·10⁶ for any profile, that on the band rows the junta alone needs m ≥ 10⁷–10⁹, and that the
   statement is a rate of approximation, not a certificate route. "m ≥ 1024" reads as the working dimension; it
   is only where Q_M ≠ 0 is guaranteed.
2. **Theorem 1.** State that the errors are absolute and that B, L are norms of the normalised profile at the
   given energy (they depend on u). m ≥ 842 suffices.
3. **(5).** The invariance hypothesis is not needed.
4. **§4, regularity.** The constants of (8) are not enclosed; the claim rests on the previous packet.
5. **§5.** The constant 3 can be 2.6 (Lemma 2 gives at most 5/m when everything is in bidegree (2,1)).

## 8. Proposed ledger rows (placeholder numbers)

**K ledger, 3.C1.** *Radius: finite dimensions approach the supremum.* For ρ_d = sup{E|Q| : Q ∈ H₂,₁(ℂᵈ),
E|Q|² = 1}: 0 ≤ ρ_∞ − ρ_m ≤ 3/√m for m ≥ 2 (2.6/√m by the review). Scope: no new radius; it beats 0.9359 only with
a sharp bound in dimension m ≥ 3648, and the record has seven. Status: **P** (a GPT session of the user;
re-derived by a review worker of claude-b9ee; **N** check on the Wick monomial). Where: REDUCTION.md §5; REVIEW §4.

**K ledger, 6.3.C1.** *Content law on conditionally proper Gaussian block-linear cubics.* For
q = Σ_iX_ip_i(Y) + Σ_iX̄_if_i(Y), p_i = Y*A_iY − tr A_i, f_i holomorphic quadratics, with Σp_if_i ≡ 0 (in
particular disjoint receivers): V | Y is exponential with mean A = Σ(|p_i|² + |f_i|²), δ = 2Var A, and
‖c[h]‖² ≤ θ(e)·δ·Ω̂[h] ≤ (5/3)·δ·Ω̂[h] for every real continuous profile of polynomial growth and every energy,
θ(e) = ⅓[1 + (4e^⊤Ke + 256(e^⊤v)²/u)/(2tr J)]. Scope: no self-interaction; 5/3 is below the thresholds of
t = 0.845–0.855 only; X(|Y|² − 1) + Z̄Y² has 35/39 (8/13 at h = v). Status: **P** (same author and review) + **C**
(delivered replay; the review's exact instances). Where: SHARED_BULK.md; REVIEW §5.

**Higher-degree ledger, 4.C1.** *Marked Gaussian compression; a finite-dimensional form of 4.19 (v) that is not a
route.* For a variance-one Q ∈ H₂,₁(ℂⁿ), a unit linear form X and m ≥ 842 there is a variance-one
Q_* ∈ H₂,₁(ℂ^{m+1}) with |Δχ| ≤ 44000/√m and |ΔC|, |ΔE a|, |ΔE g| ≤ (3B + 37L)/√m for a fixed normalised profile
(absolute errors; B, L its sup and Lipschitz norms). Hence the inequality on {χ ≥ b₀} follows from
ℛ_θ ≤ −E_θ/√m in dimension m + 1 on {χ ≥ b₀ − 44000/√m}. Scope: that test cannot hold for m ≤ 1,097,505 (any
profile); on the six rows E_θ = 205–2857, and the junta needs m ≥ 1.7·10⁷–2.1·10⁹ (**N**); at m = 1024 the
allowance is 129–1444 times the junta's margin. It closes no row. Status: **P** (same author and review); the
constants of the rows **N** (review). Where: REDUCTION.md §§1–4; REVIEW §§2–3.

**Section 14 of either ledger, 14.C1.** *A finite-dimensional certificate through random compression.* The error
is absolute, of order ‖Q‖₈⁴/√m for the fourth excess (2755/√m on the junta), while the margin is θχω ≤ 63θB_g;
dimension ≥ 10⁷ is needed, where the coefficient space has more than 10²⁰ dimensions.

## 9. Not checked

- The regularity of the six row profiles (previous packet, PROOFS §4) and any certified value of the six
  constants; my values are N, from tables accurate to 10⁻⁴ and frozen beyond s = 6.
- The scalar small-χ criterion of the previous packet and its Theorem 2; the families of its §2.
- An end-to-end simulation of Theorem 1 on a cubic (the lemmas were checked separately).
- Whether the class of SHARED_BULK contains a cubic with shared receivers and nonzero content that is not
  unitarily equivalent to disjoint receivers.
- The arXiv references of SOURCES.md; no constant from them is used.

## 10. Files (`review/`)

`replay/verify.mjs`, `replay/replay_stdout.json`; `check_harm_exact.py`, `check_lemma2.py`,
`check_shared_bulk.py`, `task2_constants.py` with their `.log`; `wick_exact.py` (verbatim copy of the
antiholomorphic package's exact Wick calculus). Run with `/usr/local/bin/python3 -I <script>` from that folder.

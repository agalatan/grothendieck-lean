<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-content-law-2026-11-16/REVIEW.md (16 November 2026); a review worker of claude-b9ee. Only this line was added. -->
# Review of the content-law package of codex-a786 (16 November 2026)

Reviewer: a review worker of claude-b9ee (another session than the author's; no contact with the author).
16 November 2026. Repository at `eb2591042`; the package pins `b00862999` (the ledger rows it cites are unchanged).

- Package: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-content-law-2026-11-16/package/`
  (`README.md`, `PROOFS.md`, `SCALAR_REDUCTION.md`, `AUDIT.md`, `LEDGER_PATCH.md`, `SOURCES.md`, `verify.mjs`, `rows.json`,
  `results_exact.json`). Hashes 9/9 against its `SHA256SUMS`.
- Everything of mine: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-content-law-2026-11-16/review/`
  (`scripts/`, `logs/`, `data/`, and `package-copy/`, the copy in which the replay ran). §9 lists the files.
- Labels as in `/Users/alingalatan/workspaces/grothe/research/README.md`: **P** re-derived on paper by me, **C** exact
  arithmetic (the package's replay, or my own exact script), **N** floating point (mine; accuracy stated in §4.1).

Notation of the package: q ∈ H₂,₁, u = E|q|², V = |q|², δ = E|q|⁴ − 2u², h a real radial profile, k(v) = E h(v + uτ),
τ ~ Exp(1), Ω̂[h] = (3/2)E[V k′(V)²] − (3/4)(E[V k′(V)])²/u, c[h] = Π₁[q·h(V)], P_m = m^{−1/2}Σ_{j≤m}(|Y_j|² − 1).
"Ratio" always means ‖c[h]‖²/(δ·Ω̂[h]).

## 0. Verdict

1. **The three statements are correct as stated, and the proofs are complete.** I re-derived `PROOFS.md` line by line:
   every identity and every constant (77/9, 253/18, 2/(9m), 55/16, 11009947/8553600, the bias bound 2/(3m), the affinity
   (20), the dual form (9)). No gap. One misprint: the display (29a) lacks a "+" (§7).
2. **The admissibility argument holds for the actual profiles.** Checked against the study's code (`prof.py`, `rowlib.py`,
   `tilt.py`, `t4lib.py`) and against my own recomputation of the six rows' profiles. The real profiles are much better than the
   package assumes: bounded and smooth at v = 0. `rows.json` equals the study's row file rounded to 10 decimals.
3. **"At every energy u > 0" is justified** (the profile does not depend on u, and no step restricts u). It has a price
   that the package does not state: for the row profiles the ratio tends to 16/(3(m + 3)) as u → 0, so no constant below
   that value can hold at all energies (§4.5).
4. **Replay:** `node verify.mjs` passes in my copy and reproduces `results_exact.json` byte for byte. It checks rational
   arithmetic and corroborating polynomial instances; the theorem rests on the written proofs (§3).
5. **Numerics (§4):** on all six rows, both profiles, u/σ² ∈ {0.5, 1, 1.3}, m ∈ {1, 2, 4, 8, 21}, the proved constant is an
   upper bound, 3.3 to 42 times above the measured ratio. As a statement for all profiles and all energies it is nearly
   sharp: within a factor 1.11–1.38 of the best such constant.
6. **Scope:** a structured class, stated honestly. It closes no row and does not reduce the open lemma (which needs every
   remote cubic). Of the hard families of `CONTENT_LEMMA_D5.md` only X(|Y|² − 1) (m = 1) and its bulk version are covered,
   with θ = 77/36 (below the row thresholds at t = 0.85 and 0.855 only) and 55/16 (at 0.855 only).
7. **Ledger:** the three K rows can be entered as **P** (re-derived) with the wording of §6; the degree-5 annotation needs
   two additions (no row closed; the energy band).

## 1. Verdict per statement

| # | statement (`PROOFS.md`) | verdict | remark |
|---|---|---|---|
| 1 | (1) admissible profile: continuous on (0, ∞), \|h\| ≤ C(v^{−1/2} + 1 + v^d) | well defined | all that the proofs use; the row profiles satisfy it with room (§2.5) |
| 2 | (9) \|E_μ[df]\|² ≤ (E_μd² + (E_μd)²)(E_μf² − ½(E_μf)²) | **correct** | sharp: equality at f = d + E_μd. Without the subtraction P1 would be 106/(9(m+3)) |
| 3 | (10) Ω̂ = (3u/2)(E_μk′² − ½(E_μk′)²), dμ = (V/u)dP; concave in the law at fixed u | **correct** | |
| 4 | (11) only the X coordinate of the content is non-zero; c_X = √u·E[P S h(uP²S)] | **correct** | |
| 5 | (12) E[P g(P)] = E[B g′(P)] | **correct** | holds directly: g = S·k(uP²S) is locally Lipschitz in P under (1) |
| 6 | (13) c_X = u^{3/2}E[S(2S·b(R) − p(R))k′(uRS)] | **correct** | it is ledger 6.3.23 at e = X with a = uX²B, c₂ − u = u(\|X\|²B − 1); P1 does not need 6.3.23 |
| 7 | (14), (15), δ = u²(4 + 12κ) ⇒ **P3**, formula (7) | **correct** | N at five unequal spectra (§4.7) |
| 8 | (8) simpler sufficient bound | **correct** | lossy for spectra of mixed sign (0.87 against 0.008 at (20/29, −21/29)) |
| 9 | (16), (17) equal eigenvalues: 17α_m² + 40/m | **correct** | the cross term is (40/√m)·E p(R) = 0 |
| 10 | (18), (19) folded formula; α_m² ≤ 1 − A_m² | **correct** | |
| 11 | (20) A_m, both closed forms | **correct** | 40-digit quadrature against both forms, m = 1 … 64 |
| 12 | (21) Binet: 0 < r(x) < 1/(12x) | **correct** | |
| 13 | (22) α_m² ≤ 1 − e^{−2/(3m)} ≤ 2/(3m) ⇒ **P1**, formula (2) | **correct** | the bound 2/(3m) is asymptotically exact (exact α_m²·3m/2 = 0.54, 0.71, 0.80, 0.89 at m = 1, 8, 21, 64) |
| 14 | §5: content = X coordinate; V = uAT; (23) | **correct** | |
| 15 | (24) the Stein pair of (4); a_W = 0, c₂,W = D | **correct** | |
| 16 | (25) regression form of 6.3.23 | **correct** | all four terms re-derived; N: equals the direct content to 3.5·10⁻⁹ for the row profiles |
| 17 | E_T identities 9 + 8b², 4 + 2b², 2; (26), (27) | **correct** | symbolic check; E_T[T(2H − 1)] = 3 for every b |
| 18 | (28), (29) ⇒ **P2**, formula (5), 253/18 | **correct** | |
| 19 | m = 1: 55/16 | **correct** | exact α₁² = 0.3630 (closed form); the package uses 1 − 4/e² < 1/2 |
| 20 | m = 8: 11009947/8553600 < 13/10 | **correct value** | **misprint in (29a)**: the last term is added, not multiplied |
| 21 | (6) W_N: E\|W_N\|² = 1, χ = 10/N | **correct** | |
| 22 | §6 admissibility of the row profiles: (30), reality, continuity, the passage ε → 0 | **correct** | checked against the code; the regularisation is not needed for these profiles (§2.5) |
| 23 | §7 rank thresholds; (31); the control 1024/252 | **correct** | thresholds checked with minimality; 34 pairs |
| 24 | §8 dependencies | **correct** | P2 uses 6.3.23 (reviewed, **P**); 11.31a is not needed |
| 25 | README: P1, P2, P3, thresholds, "every admissible profile, every u > 0" | **correct** | framing remarks in §5.2 |
| 26 | `SCALAR_REDUCTION.md`: formulas, 34 pairs | **correct** | 17 of the 34 are out of reach of any profile-free constant (§5.3) |
| 27 | `LEDGER_PATCH.md` | statements correct | statuses and wording: §6 |

## 2. The re-derivation: points that needed care

**2.1 The dual form (9), (10).** With d = d̄ + d₀, f = f̄ + f₀ (mean plus centred part):
E_μ[df] = d̄f̄ + E_μ[d₀f₀] ≤ (√2|d̄|)(|f̄|/√2) + ‖d₀‖‖f₀‖ ≤ √(2d̄² + ‖d₀‖²)·√(f̄²/2 + ‖f₀‖²), which is (9).
(I − Π/2)(I + Π) = I. Equality at f = d + E_μd, so (9) is the exact dual norm of the form f ↦ E_μf² − ½(E_μf)².
With dμ = (V/u)dP this form is (2/(3u))Ω̂. With the cruder Ω̂ ≥ (3/4)E[Vk′²] the constant of P1 would be 106/(9(m + 3)).

**2.2 Where the sign enters.** For q = √u·X·P, P = Σλ_j(|Y_j|² − 1), S = |X|²:
- c_X = √u·E[P S h(uP²S)]; the exponential integration by parts in each T_j = |Y_j|² gives E[P g(P)] = E[B g′(P)],
  B = Σλ_j²T_j; with g = S·k(uP²S) and h = k − uk′: c_X = u^{3/2}E[S(2S·P·B − P)·k′(uP²S)].
- This is exactly ledger 6.3.23 for this q: a = Σ∂_jq·∂̄_jq = uX²B and c₂ − u = u(|X|²B − 1), so
  E[X̄ k′(V)(q̄a + q(c₂ − u))] = u^{3/2}E[k′(V)·S·(2S·P·B − P)]. P1 and P3 are therefore self-contained; only P2 cites 6.3.23.
- **The step:** k′(uP²S) depends on P only through R = P². So P and P·B may be replaced by their conditional means given
  (R, S) *before* Cauchy–Schwarz. For equal eigenvalues, 2S·P·B − P = (2S − 1)P + 2S·R/√m: the part odd in P keeps only the
  conditional sign bias E[sign P | |P|], of L² size α_m ≤ √(2/(3m)); the even part is explicitly O(m^{−1/2}).
- Then (9) with d = (2S·b(R) − p(R))/R under dμ = RS·dP: E_μd² = 24E(b²/R) − 8E(pb/R) + E(p²/R), E_μd = 4E[PB] = 4Σλ_j³.
  Equal eigenvalues: 17α_m² + 24/m and 4/√m. So θ = (2/3)(17α_m² + 40/m)/(4 + 12/m) ≤ 77/(9(m + 3)).
- Without the conditioning the same Cauchy–Schwarz gives (2/3)(17 + 40/m)/(4 + 12/m), which does not decay (2.38 at
  m = 1, 2.76 at m = 21). Ledger 6.3.25 has the same defect on this class: for h(v) = v, G_X = √u·X²P_m lies in H₃,₁ and
  Ω_X = 3u/2 = 2Ω̂ for every m (P, two lines), so δΩ_X/‖c‖² = 3(m + 3)/8. The README's "retains a cancellation lost by
  6.3.25" is accurate.

**2.3 The Hellinger step.** With f_m the density of P_m: α_m² = ∫₀^∞(f_m(p) − f_m(−p))²/(f_m(p) + f_m(−p))dp, and Jensen for
√(1 − a²) under the folded law gives A_m² ≤ 1 − α_m². f_m(p)f_m(−p) is supported on |p| < √m and equals
m·(m²(1 − s²))^{m−1}e^{−2m}/Γ(m)² at p = √m·s, whence A_m = mᵐe^{−m}√π·Γ((m+1)/2)/(Γ(m)Γ((m+2)/2)); duplication turns
this into π·m^{m−1}e^{−m}/(2^{m−2}Γ(m/2)²) = exp(−2r(m/2)). Binet: 0 < r(x) < 1/(12x), so A_m ≥ e^{−1/(3m)}. All confirmed
to 25–30 digits (`review/logs/exact_checks.log`, part B1).

**2.4 P2.** Given (Y, U), (X, q) is a proper Gaussian pair: X | q ~ CN(M, s), M = √ρ·P_m·q/(√u·A), s = (1 − ρ)D/A, and
E[X|X|² | q] = M(|M|² + 2s) = M·H with H = bT + 2(1 − b), b = ρR/A, |q|² = uAT. Inserting the pair (24) into 6.3.23:
the terms X̄q̄a and X̄q·uρ|X|²B each give u^{3/2}ρ^{3/2}·B·H·P_m·T, the term −uρX̄q gives −u^{3/2}ρ^{3/2}P_m·T, the bulk
term gives u^{3/2}√ρ(1 − ρ)(D − 1)P_m·T. This is (25). The bounds (26)–(29) follow as written (A ≥ ρR; D independent of
P_m; Cauchy–Schwarz on the two budgets δ_c, δ_b). The extension of 6.3.23 from continuous h on [0, ∞) to (1) by
h_ε(v) = h(max(v, ε)) is correct (uniform bound |h_ε(s)| ≤ C(s^{−1/2} + 2 + s^d) for ε ≤ 1; dominated convergence).

**2.5 Admissibility against the actual profiles.**
- *Definitions.* In the study's code h_X(v) = G_X(√v)/√v with G_A = Γ_A + 0.4Γ₀, G_B = Γ_B + 0.3Γ₀ on all six rows
  (`t4lib.Profile`, `t4fam.py`, the lane scripts), Γ_X(s) = Re E_z[ē_X(ph A₊ − ph A₋)], A_± = L′ ± s·D,
  e₁₁ = |z|² − 1, e₂₀ = z²/√2 (`prof.e_ab`). This is what the package assumes; its bounds (30) use exactly these tilts
  (14/5 = 2 + 0.4·2; 21/10 ≥ √2 + 0.3·2).
- *The package's three facts.* |Γ_A| ≤ 2E|e₁₁| (= 4/e), |Γ_B| ≤ √2, |Γ₀| ≤ 2: true. A_±(0; r) = ±r(1 + b_A): true
  (e₁₁(0) = −1, e₂₀(0) = e₃₂(0) = 0), and 1 + b_A ∈ [0.9472, 0.9539]. Reality by z → z̄, continuity in r > 0 by
  dominated convergence: true.
- *What the profiles really are* (my recomputation, §4.1): sup|Γ_A| = 0.50, sup|Γ_B| = 0.27, sup|Γ₀| = 1.99 on [0, 6];
  sup √v|h_A| = 0.78 (package: 14/5), sup √v|h_B| = 0.615 (21/10). Γ(s) = Φ(s) − Φ(−s) is odd, and Φ is smooth because
  A₊ has one simple real zero that moves smoothly with s (N: the vortex-centred rule converges spectrally). So h is a
  bounded smooth function of v ≥ 0: h_A(0) = −0.48 … −0.45, h_A′(0) = 2.8 … 2.2, h_A ∈ [−0.48, 0.36];
  h_B(0) = −0.03 … −0.01, h_B′(0) = 1.3 … 1.0, h_B ∈ [−0.03, 0.32]. So (1) holds with d = 0 and without the v^{−1/2}
  term, 6.3.23 applies as stated in the ledger, and the ε-regularisation is harmless but unnecessary.
- *The implemented profiles* (tables on s ∈ [0, 6], cubic spline, G constant beyond 6) are also continuous and
  O(v^{−1/2}): admissible. The theorem covers the exact profiles and the tabulated ones.
- *Row data.* `rows.json` = `rows5.lines` (lines 5, 7, 9, 10, 11, 12) rounded to 10 decimals, all six fields
  (`review/logs/check_rows.log`). The proofs use nothing of a row except admissibility; the replay uses only 1 + b_A ≠ 0.

**2.6 "At every energy u > 0."** Justified: h is fixed, (1) is scale-free, and u enters only through k = E h(· + uτ) and
V; every step holds for each u > 0 (all integrals converge under (1): V k′(V)² is bounded near V = 0). See §4.5 for what
this costs.

## 3. Replay (C)

`node verify.mjs` (Node 24.14.0) in `review/package-copy/`: **PASS**, 0.4 s, `results_exact.json` reproduced byte for byte
(`review/logs/verify_replay.log`). The script reads `rows.json`, writes `results_exact.json`, and uses no network, child
process or package. What it does, in exact rational arithmetic:

- **246 polynomial instances.** q = X·(G − m) + b·Σ_{j≤N}U_j²Z̄_j, G ~ Gamma(m, 1) (so u = m + 2b²N, ρ = m/u, bulk W_N).
  - 96 with N = 0: m ∈ {1, 2, 3, 4, 5, 8, 9, 11, 20, 21, 36, 64} × h = v^d, d = 0 … 7 (the 12 with d = 0 are vacuous: 0 ≤ 0);
  - 150 with a bulk: m ∈ {1, 2, 4, 9, 36} × N ∈ {1, 3, 7} × b ∈ {1, 2} × (h = v¹ … v⁴ and one mixed-sign cubic polynomial).
  - Per instance: E V = u and E V² − 2u² = δ; k − uk′ = h; **the direct content equals the regression form of 6.3.23**
    (identity (25) before the conditioning on R); Ω̂ ≥ 0; and c² ≤ θδΩ̂ with the claimed θ. For d = 1, N = 0 the ratio is
    exactly 16/(3(m + 3)).
- **Six "exact row comparisons":** the rational inequalities 77/(9(m + 3)) < target and θ_P2(m) < target at the stated
  ranks, targets 37/100, 16/25, 133/100, 47/25, 5/2, 37/10. No profile enters; of `rows.json` only 1 + b_A ≠ 0 and σ > 0
  are used.
- Constants: 17, 24, 4; (33/8)² > 17; 15² > 204; (49/18)² < 8; 253/18; 55/16; the m = 8 constant; 256/63.

Is that what the proof needs? Yes, in this sense: the proof needs from a computation only the rational arithmetic, and
that is checked. The instances corroborate (25) and the normalisations; they do not test the sign conditioning, the bias
bound, (9), a general bulk F_j, or any non-polynomial profile. Those are the written proofs (§§1–2). My own exact script
(`review/scripts/exact_checks.py`) re-derives the constants, checks the thresholds **with minimality**, recomputes the 17
instances stored in `results_exact.json` with independent code (identical content, Ω̂, ratio), and computes the exact
supremum of the ratio over polynomial profiles with deg k′ ≤ 9: 1.488, 1.259, 0.967, 0.657, 0.322 at m = 1, 2, 4, 8, 21,
below 77/(9(m + 3)) in exact arithmetic.

## 4. Independent numerical check (N)

### 4.1 Method and accuracy

- **Profiles** (`review/scripts/profiles_hp.py`): Γ_A, Γ_B, Γ₀ and ψ recomputed from the definitions, from the package's
  `rows.json`. Since L′ is odd and D even, Γ_X(s) = 2Re E_z[ē_X·ph A₊]; polar coordinates centred at the real zero of A₊
  remove the phase vortex, and two rules agree to 10⁻¹⁵. The study's stored tables (`content5/out/prof_<k>.npz`) agree with
  this to 8.3·10⁻⁵ (Γ) and 1.6·10⁻⁷ (ψ); a plain polar rule of mine to 10⁻⁴. Spline interpolation error 3·10⁻⁹.
- **Ratios** (`review/scripts/content_ratio.py`): given the factor and the bulk, q is Gaussian of variance u·a, so the
  content, E[Vk′] and E[Vk′²] are one-dimensional transforms in a, integrated against Gamma(m) (and D for the bulk).
  k′ = (k − h)/u by panel quadrature, cross-checked against E h′(v + uτ) (10⁻⁸).
- **Validation:** closed forms for h = v, v², e^{−8v}, e^{−40v} at m = 1, 2, 4, 8, 21: relative error ≤ 8·10⁻⁹. Finer
  quadrature changes no ratio by more than 3.5·10⁻⁷; the study's tables instead of mine change them by at most 3.2·10⁻⁴.
  The content computed by (13)/(25) equals the direct content to 3.5·10⁻⁹ in all 468 evaluations.
- σ is the row's `sigma`; my recomputed u* = argmax[B₅(u) − cost(u)] equals σ² to five digits on all six rows.

### 4.2 P1: q = √u·X·P_m, both profiles, six rows

Ratio for sector A (tilt 0.4) / sector B (tilt 0.3). Full precision: `review/logs/tables_hp.txt`.

| t | u/σ² | m = 1 | m = 2 | m = 4 | m = 8 | m = 21 |
|---|---|---|---|---|---|---|
| 0.80 | 0.5 | 0.189 / 0.163 | 0.181 / 0.158 | 0.144 / 0.126 | 0.097 / 0.085 | 0.046 / 0.040 |
| 0.80 | 1 | 0.094 / 0.073 | 0.089 / 0.069 | 0.069 / 0.054 | 0.046 / 0.035 | 0.022 / 0.017 |
| 0.80 | 1.3 | 0.071 / 0.051 | 0.066 / 0.047 | 0.050 / 0.036 | 0.033 / 0.023 | 0.015 / 0.011 |
| 0.82 | 0.5 | 0.249 / 0.221 | 0.238 / 0.213 | 0.189 / 0.170 | 0.127 / 0.115 | 0.060 / 0.055 |
| 0.82 | 1 | 0.131 / 0.106 | 0.125 / 0.102 | 0.098 / 0.081 | 0.066 / 0.054 | 0.031 / 0.026 |
| 0.82 | 1.3 | 0.100 / 0.077 | 0.094 / 0.073 | 0.074 / 0.057 | 0.049 / 0.038 | 0.023 / 0.018 |
| 0.84 | 0.5 | 0.346 / 0.316 | 0.326 / 0.302 | 0.257 / 0.239 | 0.173 / 0.161 | 0.082 / 0.077 |
| 0.84 | 1 | 0.193 / 0.166 | 0.185 / 0.160 | 0.147 / 0.128 | 0.099 / 0.086 | 0.047 / 0.041 |
| 0.84 | 1.3 | 0.151 / 0.125 | 0.144 / 0.121 | 0.114 / 0.096 | 0.076 / 0.064 | 0.036 / 0.031 |
| 0.845 | 0.5 | 0.380 / 0.350 | 0.357 / 0.332 | 0.280 / 0.263 | 0.188 / 0.177 | 0.089 / 0.084 |
| 0.845 | 1 | 0.217 / 0.188 | 0.207 / 0.182 | 0.164 / 0.145 | 0.111 / 0.098 | 0.053 / 0.047 |
| 0.845 | 1.3 | 0.170 / 0.144 | 0.163 / 0.139 | 0.129 / 0.111 | 0.087 / 0.074 | 0.041 / 0.035 |
| 0.85 | 0.5 | 0.420 / 0.390 | 0.392 / 0.368 | 0.307 / 0.290 | 0.205 / 0.195 | 0.097 / 0.092 |
| 0.85 | 1 | 0.245 / 0.216 | 0.234 / 0.209 | 0.185 / 0.166 | 0.125 / 0.112 | 0.059 / 0.054 |
| 0.85 | 1.3 | 0.194 / 0.166 | 0.186 / 0.161 | 0.147 / 0.128 | 0.099 / 0.087 | 0.047 / 0.041 |
| 0.855 | 0.5 | 0.468 / 0.438 | 0.433 / 0.410 | 0.337 / 0.321 | 0.225 / 0.215 | 0.106 / 0.102 |
| 0.855 | 1 | 0.280 / 0.250 | 0.266 / 0.241 | 0.211 / 0.192 | 0.142 / 0.130 | 0.067 / 0.062 |
| 0.855 | 1.3 | 0.224 / 0.195 | 0.214 / 0.189 | 0.170 / 0.151 | 0.114 / 0.102 | 0.054 / 0.049 |
| **proved θ = 77/(9(m+3))** | | **2.139** | **1.711** | **1.222** | **0.778** | **0.356** |
| largest measured ratio | | 0.468 | 0.433 | 0.337 | 0.225 | 0.106 |
| θ / ratio: smallest … largest | | 4.6 … 42 | 4.0 … 36 | 3.6 … 34 | 3.5 … 33 | 3.3 … 33 |

The proved constant is an upper bound in all 180 cases. The largest ratio is always at t = 0.855, u = 0.5σ², sector A;
the smallest at t = 0.80, u = 1.3σ², sector B.

### 4.3 P2: two cases

q = √u(√ρ·X·P_m + √(1 − ρ)·W), with W₁ = U²Z̄/√2 (Var D = 5) and with the diffuse limit D ≡ 1 (N → ∞ of W_N).
Ranges over the six rows, u/σ² ∈ {0.5, 1, 1.3} and both profiles:

| case | χ | measured ratio | proved θ | θ / ratio |
|---|---|---|---|---|
| m = 1, ρ = 0.36, W₁ | 6.17 | 0.029 … 0.102 | 55/16 = 3.44 | 34 … 120 |
| m = 1, ρ = 0.36, diffuse | 2.07 | 0.043 … 0.246 | 3.44 | 14 … 79 |
| m = 4, ρ = 0.5, W₁ | 4.25 | 0.023 … 0.101 | 253/126 + 1/18 = 2.06 | 20 … 91 |
| m = 4, ρ = 0.5, diffuse | 1.75 | 0.035 … 0.213 | 2.06 | 9.7 … 60 |

Exact, polynomial profiles with deg k′ ≤ 5 on W_N (b = 1): the supremum of the ratio is 0.133 (m = 1, N = 1), 0.480
(m = 4, N = 1), 0.303 (m = 8, N = 3), 0.474 (m = 9, N = 1), against 3.44, 2.06, 1.29, 1.20. With a bulk outside the
replay's family, W ∝ Z̄U₁U₂ (a non-diagonal F): 0.618 (m = 1, ρ = 1/2), 0.803 (m = 2, ρ = 2/3), 0.782 (m = 4, ρ = 4/5),
0.362 (m = 9, ρ = 9/13), against 3.44, 2.92, 2.06, 1.20 (`review/logs/exact_checks.log`, parts A6, A7). P2 is correct
and loose.

### 4.4 Comparison with `CONTENT_LEMMA_D5.md`

X(|Y|² − 1) is P1 at m = 1 (χ = 16), and "X(|Y|² − 1) + bulk, c = 0.6" is the diffuse limit of P2 at m = 1, ρ = 0.36
(χ = 2.07). My code reproduces the study's logs (`content5/out/t4fam_<k>.log`) **to every printed digit**, on all six rows
at u = 0.85u* and u*: content/δ (A + B), Ω̂ (A + B), D/δ and the share of the allowance 4μκ(D + V_sl), 48 numbers; and
content/δ and Ω̂ of the bulk version at u*, 12 numbers (`review/logs/compare_d5.log`, `review/logs/tables_hp.txt`).
Example, t = 0.84, u = 0.85u*: 0.01570, 0.0717, 0.2068, 0.053 (the row of §11.3 there).

One remark on that document, not on the package: its line "true constant of (L_c): largest ‖c‖²/(δΩ̂) measured, 0.13,
0.17, 0.26, 0.29, 0.33, 0.38" was taken at u ∈ {0.85, 1}σ*², summed over A and B. The law-layer test runs from 0.5σ*², and
the ratio grows as u falls. At 0.5σ*², sector A (B is lower), on the six rows:

| family | 0.80 | 0.82 | 0.84 | 0.845 | 0.85 | 0.855 |
|---|---|---|---|---|---|---|
| X(\|Y\|² − 1) (P1, m = 1) | 0.19 | 0.25 | 0.35 | 0.38 | 0.42 | 0.47 |
| junta H(X) | 0.19 | 0.26 | 0.41 | 0.46 | 0.53 | 0.62 |
| Wick + shared (0.3, i) | 0.19 | 0.27 | 0.41 | 0.46 | 0.53 | 0.61 |
| H(X) + H(Y) | 0.22 | 0.29 | 0.42 | 0.46 | 0.51 | 0.58 |
| row threshold | 0.37 | 0.64 | 1.33 | 1.88 | 2.5 | 3.7 |
| threshold / largest | 1.7 | 2.2 | 3.2 | 4.1 | 4.7 | 6.0 |

The last three families have self-interaction and are outside the package's class; these are my evaluations
(`review/scripts/hard_families.py`), which reproduce the study's content/δ and Ω̂ for them at 0.85u* and u* to one unit of
the last printed digit. So on the band the requested inequality holds numerically on these families too, with the
smallest margin at t = 0.80 and at the low end of the band.

### 4.5 Energy dependence

For a smooth profile with h′(0) ≠ 0 the ratio of q = √u·X·P_m tends to that of h(v) = v, 16/(3(m + 3)), as u → 0
(V → 0 and k′ → h′(0)). Measured, t = 0.80, sector A (`review/logs/uscan.log`):

| u/σ² | 0.001 | 0.01 | 0.03 | 0.1 | 0.2 | 0.35 | 0.5 | 0.75 | 1 | 1.3 | 2 | 3 | u → 0 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| m = 1 | 1.319 | 1.197 | 0.992 | 0.623 | 0.404 | 0.260 | 0.189 | 0.127 | 0.094 | 0.071 | 0.042 | 0.024 | 4/3 |
| m = 21 | 0.221 | 0.209 | 0.186 | 0.134 | 0.094 | 0.063 | 0.046 | 0.030 | 0.022 | 0.015 | 0.008 | 0.004 | 2/9 |

Consequences:
- The package's constant at all energies is within 77/48 = 1.6 of what the two row profiles themselves require as u → 0.
- The row thresholds cannot hold at all energies for small m: at t = 0.80, m = 1 the ratio exceeds 0.37 at u = 0.2σ² and
  below (0.404 at 0.2σ², 0.260 at 0.35σ²).
  `SCALAR_REDUCTION.md` restricts its 34 pairs to u/σ² ∈ [1/2, 13/10], correctly; the README should say why.
- On the band the ratio decreases in u (all 34 pairs, 10 energies), so the binding energy is the lower end.

### 4.6 How loose is P1, and where

Three levels of conditioning in the same Cauchy–Schwarz (`review/logs/exact_checks.log` part C, `review/logs/sharp_table.log`):

| m | h(v) = v (exact) | θ* sharp, all profiles (N) | (17) with the exact α_m (N) | proved 77/(9(m+3)) | no conditioning |
|---|---|---|---|---|---|
| 1 | 1.3333 | 1.547 | 1.924 | 2.139 | 2.375 |
| 2 | 1.0667 | 1.301 | 1.562 | 1.711 | 2.467 |
| 4 | 0.7619 | 0.981 | 1.129 | 1.222 | 2.571 |
| 8 | 0.4848 | 0.659 | 0.728 | 0.778 | 2.667 |
| 21 | 0.2222 | 0.322 | 0.341 | 0.356 | 2.757 |

θ* = (2/3)(E_μ[E_μ[d | V]²] + 16/m)/(4 + 12/m) is the supremum of the ratio over all profiles (the dual norm in (9), with
the conditional expectation given V instead of (R, S)); the exact polynomial suprema of §3 lie below it (by 4 % at m = 1,
0.1 % at m = 21). A second route, a Galerkin supremum over 53 Gaussian bumps in log V by plain two-dimensional
quadrature, gives the same five digits at every m (`review/logs/sharp_galerkin.log`).
So the proof loses 10–38 % against the best profile-free constant, and that constant is 3 to 30 times above the
ratios of the row profiles on the band. The slack is in "all profiles, all energies", not in the proof.

### 4.7 P3 at unequal spectra

The replay covers equal eigenvalues only. For P = l₁(T₁ − 1) + l₂(T₂ − 1) (`review/logs/p3_check.log`; the polynomial
column is exact rational arithmetic, deg k′ ≤ 5):

| (l₁, l₂) | h = v | polynomials | sharp θ* | (7) | (8) |
|---|---|---|---|---|---|
| (3/5, 4/5) | 1.080 | 1.260 | 1.316 | 1.580 | 2.445 |
| (4/5, −3/5) | 0.179 | 0.238 | 0.239 | 0.255 | 1.264 |
| (5/13, 12/13) | 1.170 | 1.342 | 1.406 | 1.698 | 2.594 |
| (12/13, −5/13) | 0.875 | 1.042 | 1.069 | 1.206 | 2.147 |
| (20/29, −21/29) | 0.0057 | 0.0079 | 0.0079 | 0.0083 | 0.868 |

(7) is an upper bound everywhere, as proved. (8) is poor when the eigenvalues have mixed signs: it bounds E[P(B − 1)|R]
by Var B and misses its sign cancellation.

## 5. Scope

### 5.1 What is proved

For every real h satisfying (1) and every u > 0:
- **P1:** ‖c[h]‖² ≤ (77/(9(m + 3)))δΩ̂[h] for q = √u·X·P_m. This is one cubic per m (up to unitary changes, a phase and
  unused coordinates), with χ = 4 + 12/m. As m → ∞ it tends to X·g, g a real Gaussian: a zero-content cubic (sign
  symmetry) with χ = 4. The constant is small because the cofactor P_m becomes symmetric, not because the cubic is
  diffuse or concentrated.
- **P2:** the same with an independent bulk W = ΣZ̄_jF_j(U) of any finite size, θ = 253/(18(m + 3)) + 2/(9m).
- **P3:** a formula θ(P) for q = √u·X·P with any normalised Hermitian P; no claim that it is small.

Not covered: any self-interaction of the driver (the junta H(X), Wick + shared drivers, the spike family, the search
maximisers of `CONTENT_LEMMA_D5.md` §4.2, which are junta-like), non-Hermitian cofactors, several drivers.

### 5.2 Does the README overstate?

No false statement. Four points of framing:
1. *"both requested profiles on all six rows"* is true but empty of row content: the constants are profile-free, and the
   rows enter only as six rational targets. No row is closed, and the README says so at the end.
2. *"covers moderate kurtosis, not only a small-cumulant neighbourhood"*: true, but it should add that the class is a
   quantitative neighbourhood of the zero-content cubic X·g. The band of 4.19 (χ ≈ 2–16, with spikes) is not this.
3. The thresholds (m ≥ 21, 11, 4, 2, 1, 1; with bulk 36, 20, 8, 5, 3, 1) compare an all-energy, all-profile constant with
   targets that are meant on a band of energies. At m = 1, the only member that is a hard family of the study, P1 meets
   the targets at t = 0.85 and 0.855 only, P2 at 0.855 only.
4. The row targets are numerical, interpolated (0.855: extrapolated) values of §11.4; the package says they are inputs.

### 5.3 Extending the conditional-sign argument

- **The general form of the step (P, same proof).** For any cubic and unit e, 6.3.23 reads c_e[h] = E[k′(V)·M_e(V)] with
  M_e(v) = E[ȳ_e(q̄a + q(c₂ − u)) | V = v]. By (9) (which holds for complex d and real f, with moduli),
  |c_e[h]|² ≤ θ*(q, e)·δ·Ω̂[h],  θ*(q, e) = (2/(3δ))(E[|M_e(V)|²/V] + |E[ȳ_e q|q|²]|²/u),
  with equality for some profile when M_e has a constant phase, as on the package's classes.
  The package conditions on (R, S), which is coarser than V; conditioning on V is the best any profile-free argument can
  do, for any cubic.
- **Profile-free constants cannot reach general cubics.** θ*(q, e) ≥ 4|E[ȳ_e q|q|²]|²/(3uδ), the ratio of h(v) = v; on
  the Wick monomial this is 256/63 = 4.06, above every row target. On a self-interaction core the profile must be used.
  Ledger 6.3.25 is profile-aware and nearly sharp there (×1.3 on the junta) but loses the factor 3(m + 3)/8 on X·P_m
  (at h(v) = v, §2.2); the sign conditioning is the opposite. An extension needs both: a split of the cubic at its content direction into a
  self-interaction core, treated with the profile, and a cofactor part with a small conditional sign bias.
- **What the argument uses, and a general cubic lacks:** the content direction is a holomorphic factor X, independent of
  its cofactor; the test function depends on the cofactor through |P| only; and the law of the cofactor has an explicit
  Hellinger affinity with its reflection. For a general cubic the object is M_e(V), which is not a function of the law
  of V; a certificate would need constraints linking M_e to the law layer.
- **P3 (unequal spectrum).** Needed: bounds for α²(λ) = E[E[P|R]²/R] and for the terms with b.
  - What follows at once from the package (P, mine, two lines): for a spectrum made of blocks of equal eigenvalues with
    multiplicities m_b, the affinity is at least Π_b A_{m_b} (data processing, product measures), so
    α² ≤ 1 − exp(−(2/3)Σ_b 1/m_b). Useless when all eigenvalues differ.
  - A guess from the Edgeworth expansion: α² ≤ (2/3)(Σλ_j³)². It holds on 13 two-eigenvalue spectra (ratio at most
    0.61; `review/logs/p3_spectrum.log`). **Not proved.** With it, (8) would give
    θ(P) ≤ (77/9 + (4/3)√17)·κ/(1 + 3κ), κ = Σλ_j⁴, for every spectrum (the package's θ_c at κ = 1/m).
  - For mixed signs use (7), not (8) (§4.7).
- **The "34 low-rank row pairs"** (`SCALAR_REDUCTION.md`). The count is right. Of the 34 (`review/logs/sharp_table.log`):
  - 3 would fall to (17) with a certified α_m (a one-dimensional integral): (0.80, 20), (0.82, 10), (0.84, 3);
  - 5 more to the sharp constant θ*(m), if certified: (0.80, 18), (0.80, 19), (0.82, 9), (0.84, 2), (0.845, 1);
  - 26 need the profile and the band; for 17 of them h(v) = v alone exceeds the target (0.80: m ≤ 11; 0.82: m ≤ 5;
    0.84: m = 1, where 4/3 > 1.33), so they are false at small energies.
  - N (`review/logs/pairs34.log`): all 34 hold on the band, both profiles, 10 energies, the ratio decreasing in u; the
    smallest margin is target/ratio = 1.96 at (0.80, m = 1, u = 0.5σ²), then 2.04 and 2.29 at m = 2, 3.
  - Closing these 34 would still concern one cubic per rank; it would not touch the junta-like families.

## 6. Proposed ledger rows

Statuses: my re-derivation makes the proofs **P** in the sense of `research/README.md` (re-derived by someone other than
the author). The package's own "C" covers the rational constants and thresholds (replayed by claude-b9ee and by me; the
implication inspected in §3); the instances are corroboration. Suggested text, to be edited by claude-b9ee.

**K ledger, §6.3** (columns: # | family and statement | constant | status | where; "KCL" = this package):

| # | family and statement | constant | status | where |
|---|---|---|---|---|
| 6.3.26 | **Sign-conditioned content bound, Hermitian factor (criterion).** Notation of 6.3.23; for real h continuous on (0, ∞) with \|h(v)\| ≤ C(v^{−1/2} + 1 + v^d) let Ω̂[h] = (3/2)E[V·k′(V)²] − (3/4)(E[V·k′(V)])²/u. For q = √u·X·P, P = Σλ_j(\|Y_j\|² − 1), Σλ_j² = 1, X independent of Y, every such h and every u > 0: ‖c[h]‖² ≤ θ(P)·δ·Ω̂[h], θ(P) = 2[24E(b²/R) − 8E(pb/R) + E(p²/R) + 16(Σλ_j³)²]/[3(4 + 12Σλ_j⁴)], R = P², p = E[P\|R], b = E[P·B\|R], B = Σλ_j²\|Y_j\|². Mechanism: in 6.3.23 the test function k′(V) depends on P through \|P\| only, so P is replaced by its conditional mean given \|P\| before Cauchy–Schwarz; the subtraction in Ω̂ is kept by the sharp dual form \|E_μ[df]\|² ≤ (E_μd² + (E_μd)²)(E_μf² − ½(E_μf)²). Conditioning on V instead gives the best constant valid for all profiles | a formula, not a small bound: 1.924 for P = \|Y\|² − 1; 1.58, 0.255, 0.0083 at λ = (3/5, 4/5), (4/5, −3/5), (20/29, −21/29) (**N**) | **P** (codex-a786; re-derived line by line by a review worker of claude-b9ee); values **N** (review) | KCL `PROOFS.md` §§1–3; `REVIEW.md` §§2, 4.7 |
| 6.3.27 | **Equal eigenvalues.** q = √u·X·P_m, P_m = m^{−1/2}Σ_{j≤m}(\|Y_j\|² − 1), χ = 4 + 12/m: ‖c[h]‖² ≤ [77/(9(m + 3))]·δ·Ω̂[h] for every h as in 6.3.26 and every u > 0. The conditional sign bias α_m² = E[E[P_m\|P_m²]²/P_m²] is at most 1 − A_m² ≤ 2/(3m), A_m = exp(−2r(m/2)) the Hellinger affinity of P_m and −P_m (r the Stirling remainder; Binet). One cubic per m; as m → ∞ it tends to X·g, g real Gaussian, of zero content. No self-interaction: the junta is not in the class, and there every profile-free constant is at least 256/63. h(v) = v gives exactly 16/(3(m + 3)), and a smooth profile with h′(0) ≠ 0 tends to that ratio as u → 0. On this class 6.3.25 gives 2δΩ̂ for h(v) = v at every m | 77/(9(m+3)): 2.139, 1.222, 0.356 at m = 1, 4, 21. Best profile-free constant 1.547, 0.981, 0.322 (**N**). Degree-5 row profiles on u/σ*² ∈ [0.5, 1.3]: at most 0.47, 0.34, 0.11 (**N**) | **P** (codex-a786; re-derived line by line by a review worker of claude-b9ee, with its own exact and 40-digit checks); constants **C** (replayed); the comparisons **N** (review) | KCL `PROOFS.md` §§3–4, 6–7; `verify.mjs`; `REVIEW.md` §§2–4 |
| 6.3.28 | **With a decoupled holomorphic bulk.** q = √u(√ρ·X·P_m + √(1 − ρ)·W), W = Σ_j conj(Z_j)·F_j(U), F_j homogeneous holomorphic quadratics, E\|W\|² = 1, the blocks X, Y, U, Z independent, 0 ≤ ρ ≤ 1 (χ = ρ²(4 + 12/m) + 2(1 − ρ)²Var Σ\|F_j\|²): the bound of 6.3.27 holds with the constant on the right, for every finite bulk; W_N = (2N)^{−1/2}ΣU_j²conj(Z_j) has χ = 10/N. Uses 6.3.23 with the pair a = uρX²(1 + P_m/√m), c₂ − u = uρ(\|X\|²(1 + P_m/√m) − 1) + u(1 − ρ)(D − 1) and the Gaussian regression of X on q | 253/(18(m+3)) + 2/(9m); 55/16 at m = 1; 11009947/8553600 at m = 8. Measured for the degree-5 row profiles at m = 1, ρ = 0.36: at most 0.25 (**N**) | **P** (same author and review); the regression identity **C** on polynomial instances with W_N (replayed); **N** (review) | KCL `PROOFS.md` §5; `verify.mjs`; `REVIEW.md` §§2.4, 4.3 |

**Higher-degree ledger**: a new row 4.20 is clearer than an annotation inside 4.19 (columns as there):

| ID | statement | scope | status | source |
|---|---|---|---|---|
| 4.20 | **The same-law inequality of 4.19 (v) on a structured class.** ‖c[h]‖² ≤ θ·δ·Ω̂[h] is proved for q = √u·X·P_m with θ = 77/(9(m + 3)), and with an independent bulk ΣZ̄_jF_j(U) with θ = 253/(18(m + 3)) + 2/(9m), for every u > 0 and every real profile of growth O(v^{−1/2} + 1 + v^d), in particular the tilted A/B profiles of the six rows (`../conjecture-K/STATUS.md` 6.3.26–6.3.28). θ is below the thresholds 0.37, 0.64, 1.33, 1.88, 2.5, 3.7 for m ≥ 21, 11, 4, 2, 1, 1 (with bulk: 36, 20, 8, 5, 3, 1). **It closes no row and does not reduce 4.19 (v)**, which needs every remote cubic: the class has no self-interaction, and of the families of CONT5 it contains only X(\|Y\|² − 1) (m = 1; θ = 77/36, with bulk 55/16). New in it: conditioning on the sign of the cofactor before Cauchy–Schwarz, which keeps a cancellation that 6.3.25 loses on this class. Measured (**N**): on u/σ*² ∈ {0.5, 1, 1.3} the ratio ‖c‖²/(δΩ̂) of X·P_m is at most 0.47, 0.43, 0.34, 0.23, 0.11 at m = 1, 2, 4, 8, 21, decreasing in u; all 34 row/rank pairs below the proved ranks hold on the band, with margin at least 1.96. The ratio tends to 16/(3(m + 3)) as u → 0 for the row profiles, so the inequality with the row thresholds fails at small energies (t = 0.80, m = 1: at u = 0.2σ*² and below) and must be stated on the band. At 0.5σ*² X(\|Y\|² − 1) gives 0.19–0.47, the junta 0.19–0.62 and H(X) + H(Y) 0.22–0.58 over the six rows (per sector), above the "largest measured" 0.13–0.38 of CONT5 §11.4 (taken at 0.85–1σ*², sectors summed) and below the thresholds by a factor 1.7 at t = 0.80, 2.2 at 0.82 and at least 3.2 on the other rows | a structured class; the capped game; the measured numbers at sampled energies | **P** (see the K ledger); the comparison **N** (review worker of claude-b9ee) | KCL; its `REVIEW.md` §§4–5 |

Leave 6.3.18, the majorant of 6.3.25 and the conclusion of 4.19 open, as the patch says.

## 7. Required corrections and suggestions

**Required** (none changes a result):
1. `PROOFS.md` (29a): the display reads (4/33)(17·829/10368 + 5 + 101/25) 829/31104; it must be
   (4/33)(…) **+** 829/31104. The value 11009947/8553600 and `verify.mjs` are right.
2. `LEDGER_PATCH.md`: statuses after this review; rows must define Ω̂ and the admissible class (the K ledger does not);
   "E‖W‖² = 1" should read E|W|² = 1 (also in the README table); the degree-5 annotation must say that no row is closed
   and that the row thresholds are meant on a band of energies (§6).
3. `PROOFS.md` §1, last sentence of P3: "(2) evaluates this criterion" should read "(17) evaluates it; (2) bounds it".

**Suggestions:**
1. State the sharp form: conditioning on V gives the supremum over profiles; give θ* beside 77/(9(m + 3)).
2. State the u → 0 limit 16/(3(m + 3)) for every smooth profile, and that 17 of the 34 pairs are therefore false at
   small energies; this is why the scalar reduction must keep the band.
3. Say in the README that X(|Y|² − 1) is m = 1 and which rows P1 and P2 reach there.
4. §6 of `PROOFS.md` can be shortened: the row profiles are bounded and smooth at 0 (§2.5).
5. For the m = 1 refinement the exact α₁² = (2/e)(sinh 1 − 2 arctan tanh ½) + e^{−2} = 0.3630 is available.
6. In P3, warn that (8) is weak for eigenvalues of mixed sign.

## 8. Not checked

- No interval or certified numerics: §4 is floating point (estimated relative accuracy 10⁻⁶ given the profile tables).
- The row targets 0.37 … 3.7 and the rooms: taken from `CONTENT_LEMMA_D5.md` §11.4, not re-derived.
- P2 numerically for bulks other than W₁, the diffuse limit and (exactly, polynomial profiles) W_N with N ≤ 7 and
  Z̄U₁U₂. The proof for general F_j was re-derived on paper.
- P3 numerically beyond two eigenvalues; θ* beyond m = 24; the guess α² ≤ (2/3)(Σλ_j³)² beyond 13 spectra.
- The 34 pairs between the 10 sampled energies, and energies above 1.3σ² except the scan of §4.5.
- The secant margins, the deficit side and the law layer of the degree-5 study; nothing in Lean.
- `SOURCES.md`: the literature list. The three DLMF identities were re-derived or confirmed to 25–30 digits instead.
- `verify.mjs` was read and replayed, not mutation-tested; 17 of its instances were recomputed independently.

## 9. Files

All under `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-content-law-2026-11-16/review/`.
Run with `/usr/local/bin/python3 -I`, one process, single thread; the whole set takes about five minutes.

| script (`scripts/`) | log (`logs/`) | what |
|---|---|---|
| — | `verify_replay.log`, `results_exact.delivered.json` | the replay of `verify.mjs` in `package-copy/` |
| `check_rows.py` | `check_rows.log` | `rows.json` against `rows5.lines` and the stored profile records |
| `profiles_own.py` | `profiles_own.log` | profiles from the definitions, plain polar rule; bounds of `PROOFS.md` §6 |
| `profiles_hp.py`, `spline_check.py` | `profiles_hp.log`, `spline_check.log` | profiles with the vortex-centred rule (`data/prof_hp_<k>.npz`); interpolation error |
| `exact_checks.py` | `exact_checks.log` | constants, thresholds with minimality, 17 stored instances, polynomial suprema (exact); affinity, Binet, α_m (40 digits); the dual form; the sharp constant |
| `content_ratio.py`, `tabulate.py`, `compare_runs.py` | `content_ratio_hp.log/.json`, `content_ratio_hp_fine.*`, `content_ratio_stored.*`, `tables_hp.txt`, `compare_runs.log` | §4.1–4.4: validation, the ratios; finer quadrature; with the study's tables |
| `uscan.py` | `uscan.log/.json` | §4.5 |
| `compare_d5.py`, `hard_families.py` | `compare_d5.log`, `hard_families.log/.json` | §4.4: the study's four numbers per case; the junta, Wick + shared and H(X) + H(Y) across the band |
| `sharp_table.py`, `sharp_galerkin.py` | `sharp_table.log`, `sharp_galerkin.log` | §4.6, §5.3: θ*(m), m ≤ 24, by two routes; the 34 pairs by what could cover them |
| `pairs34.py` | `pairs34.log/.json` | §5.3: the 34 pairs on the band |
| `p3_check.py`, `p3_spectrum.py` | `p3_check.log`, `p3_spectrum.log` | §4.7, §5.3: P3 at unequal spectra; the sign bias of two-eigenvalue spectra |

`uscan.py`, `compare_d5.py`, `pairs34.py` and `spline_check.py` import other scripts; their headers give the command line.
The study's folder `content5/` was only read. Nothing was written outside
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-content-law-2026-11-16/` (this file and
`review/`); no tracked file was touched, and there was no commit, push or post.

<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-content-law-blocks-2026-11-16/REVIEW.md (16 November 2026): review by a review worker of claude-b9ee. Only this line was added. -->
# Review of the second content-law package of codex-a786 ("blocks", 16 November 2026)

Reviewer: a review worker of claude-b9ee (another session than the author's; no contact with the author).
16 November 2026. The package pins the repository at `b3cca5048`; the ledger rows it cites are unchanged since.

- Package: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-content-law-blocks-2026-11-16/package/`
  (`README.md`, `PROOFS.md`, `INTERVAL_PROOF.md`, `COORDINATE_OBSTRUCTION.md`, `AUDIT.md`, `LEDGER_PATCH.md`,
  `LITERATURE.md`, `verify.mjs`, `certify_phase.mjs`, `phase_intervals.json`, `results_exact.json`, `rows.json`,
  `source_manifest.json`). All 13 files listed in its `SHA256SUMS` verify; `rows.json` is the file of the first package.
- Everything of mine: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-content-law-blocks-2026-11-16/review/`
  (`scripts/`, `logs/`, `data/`, and `package-copy/`, the scratch copy in which the replays ran). §10 lists the files.
- Labels as in `/Users/alingalatan/workspaces/grothe/research/README.md`: **P** re-derived on paper by me, **C** exact or
  interval arithmetic (the package's replay, or my own scripts), **N** floating point (mine).
- The first package and its review: ledger rows 6.3.27–6.3.29 and 4.20 (K ledger and higher-degree ledger).

Notation of the package: q = √u(Σ_i √ρ_i·X_i·P_i + √ρ₀·W), independent blocks, P_i = Σ_j λ_ij(|Y_ij|² − 1), Σ_j λ_ij² = 1,
B_i = Σ_j λ_ij²|Y_ij|², R_i = P_i², κ_i = Σ_j λ_ij⁴, s_i = Σ_j λ_ij³, χ_i = 4 + 12κ_i, W = Σ_a Z̄_a F_a(U) with E|W|² = 1,
D = Σ_a|F_a(U)|², A = Σ_i ρ_iR_i + ρ₀D, α_i² = E[E(P_i|R_i)²/R_i]. "Ratio" means ‖c[h]‖²/(δ·Ω̂[h]).

## 0. Verdict

1. **Every statement is correct as stated and the proofs are complete.** I re-derived `PROOFS.md`, `INTERVAL_PROOF.md`
   and `COORDINATE_OBSTRUCTION.md` line by line: every identity and every constant. No gap and no misprint found.
2. **The multi-block step is right, and it is the new idea.** The content vector is tested against a unit vector e, and
   one pointwise Cauchy–Schwarz with the common variance A ≥ Σ_i ρ_iR_i turns the sum over blocks into a sum with the
   weights e_i². The two norms then use the complementary budgets J_e and χ − J_e. No factor r appears (§2.3).
3. **The sign bound for unequal signed spectra, α² ≤ min(1, 2√κ), is proved, and it is weak.** It is of order √κ; the
   true bias is of order (Σλ³)² ≤ κ. So the hypotheses κ ≤ 1/64 and κ ≤ 1/576 are far from necessary (§2.4).
4. **The interval argument is sound**: every rounding is directed the right way, and the enclosure covers the whole
   integral, tail included. I re-enclosed all twelve integrals with other code and another arithmetic (§3).
5. **Replays:** `verify.mjs` and `certify_phase.mjs` pass in a scratch copy and reproduce `results_exact.json` and
   `phase_intervals.json` byte for byte.
6. **Numerics:** on eight multi-block cubics with the row profiles the ratio is at most 0.18, 0.23, 0.31, 0.33, 0.37, 0.40
   on the band (rows 0.80 … 0.855), below the one-block values and 2 to 9 times below the row thresholds. The proved
   constants (39/16 at rank one) are 6 to 18 times above the band values (§4).
7. **Scope:** of the hard families of `CONTENT_LEMMA_D5.md` the class contains X(|Y|² − 1) and its bulk version, as
   before, and nothing with self-interaction. **Nothing here bears on the rows 0.80 and 0.82 on the energy band** (§5).
8. **The coordinate obstruction is correct**; §6 says exactly what it states and what it does not.

## 1. Verdict per statement

| # | statement | verdict | remark |
|---|---|---|---|
| 1 | `PROOFS` (1)–(2): the class; W_N = N^{−1/2}ΣU_aV_aZ̄_a has Var D = 3/N | **correct** | |
| 2 | (7) χ = Σρ_i²χ_i + 2ρ₀²Var D, from E\|q\|⁴ = 2u²E A² | **correct** | |
| 3 | §2: only the X_i carry content; (8), (9) c_i = √(uρ_i)·E[P_i T h(uAT)] | **correct** | the radius uAT is that of the whole sum |
| 4 | (10), (11): E[P g(P)] = E[B g′(P)]; E B = 1, Var B = κ, E[PB] = s | **correct** | |
| 5 | (12) | **correct** | |
| 6 | (13), the exact zero | **correct** | uses that C_i is independent of block i; needs k ∈ C² (smooth h first, then §6) |
| 7 | (14), the balanced identity | **correct** | exact on 190 polynomial checks of mine; to 4·10⁻⁹ for the row profiles (N) |
| 8 | (15), conditioning on (R, D, T) | **correct** | |
| 9 | (16), (17): dual form; Ω̂ in the measure AT·dP | **correct** | as in the first package |
| 10 | (18), (19): the vector e; pointwise Cauchy–Schwarz with A ≥ Σρ_iR_i | **correct** | the cross terms between blocks are bounded here, not dropped |
| 11 | (20): 9 + 8b², 4 + 2b², 2 | **correct** | symbolic |
| 12 | (21): ‖d₀‖² ≤ K·J_e, J_e = Σe_i²ρ_i²χ_i | **correct** | |
| 13 | (22): ‖d₁‖² ≤ ½a²(χ − J_e); Var C_i = (χ − ρ_i²χ_i)/2 | **correct** | |
| 14 | (23), (24) and Theorem 1, formula (6) | **correct** | no factor r; see §2.3 for what the same proof gives for many blocks |
| 15 | Lemma 2, (25), (26): α² ≤ min(1, 2√κ) | **correct** | the identity α² = E[(1 − B)s′(P)] holds to 10⁻¹⁵ on eight spectra (N) |
| 16 | (27) and the monotonicity of x^p/(4 + 12x) on [0, 1/3] | **correct** | |
| 17 | Corollary 3: 1015/804 (κ ≤ 1/64), 2465/6948 (κ ≤ 1/576) | **correct** | |
| 18 | (28)–(30): α_m² ≤ 1 − e^{−2/(3m)}, Binet's first formula | **correct** | |
| 19 | (31a), (31b): the centred cross term; L_m ≤ 42/m | **correct** | the triangle inequality would give 68.3/m |
| 20 | (31): θ ≤ 29/(3(m+3)) + 2/(9m); rank one: 39/16 | **correct** | |
| 21 | minimum ranks 24, 13, 5, 3, 1, 1 and their constants | **correct** | minimality checked |
| 22 | (32): h(v) = v gives ‖c‖² = 16u³Σρ_i³s_i², ratio 16/(3r(m+3)) for r equal blocks | **correct** | in general 64Σρ_i³s_i²/(3χ) |
| 23 | §6: admissibility, passage from smooth h to (3) | **correct** | the row profiles are bounded and smooth at 0 (first review, §2.5) |
| 24 | `INTERVAL_PROOF` (1): α_m² as an integral over [0, m] plus a Poisson tail | **correct** | a 30-digit quadrature of the folded-density definition lies inside all enclosures |
| 25 | `INTERVAL_PROOF` §2: the enclosure algorithm | **correct** | §3 below |
| 26 | `INTERVAL_PROOF` §3: the twelve bounds | **correct** | re-enclosed independently |
| 27 | `INTERVAL_PROOF` §4: 1361/750, 8153/6300, 91/144, 16226/43875; ranks 23, 12, 4, 2, 1, 1 | **correct** | |
| 28 | `COORDINATE_OBSTRUCTION` (1), (2) and the remarks | **correct** | §6; a second proof by the projector formula |
| 29 | README table and the sentence "the constants do not grow with the number of blocks" | **correct** | they do not decrease either, while the truth does (§2.3, §4) |
| 30 | `LEDGER_PATCH.md` | statements correct | wording: §7 |

## 2. The re-derivation: points that needed care

**2.1 The common radius.** Given all cofactors (Y, U), q is a proper complex Gaussian of variance uA, so |q|² = uAT with
T ~ Exp(1) independent, and the regression of X_i on q gives c_i = √(uρ_i)·E[P_i T h(uAT)]. Every block sees the radius
of the whole sum; nothing is added driver by driver (the invalid argument of the K ledger, §14, item 32, is not used).

**2.2 The exact zero (13) and the balanced identity (14).** With f = k′, C_i = A − ρ_iR_i, b_i = ρ_iR_i/A:
- the Stein identity (10) on the k-part of h = k − uk′ gives (12);
- E_T[T(2 − T)f(uAT)] = −uA·E_T[T²f′(uAT)] (integration by parts in T), and (10) applied to T·f(uAT) with the other
  blocks frozen gives E[P_i T f] = 2uρ_i·E[P_iB_i T² f′]; multiplied by C_i, which is independent of block i, the two
  cancel: this is (13);
- adding it, with C_i/A = 1 − b_i: T + (1 − b_i)(2 − T) = 2 + (T − 2)b_i = H_i and −1 + C_i = −ρ_i + (C_i − E C_i), which
  is (14).
For one block with a bulk it is the identity (25) of the first package. The role of (13) is to trade the term in
P_i·C_i, which is not centred, for a term in P_i(C_i − E C_i), which is.

**2.3 The multi-block step: why no factor r.** For a real unit vector e, e·c = u^{3/2}E_μ[(d₀ + d₁)f], dμ = AT·dP, with
d₀ = A⁻¹Σe_iρ_i^{3/2}U_i and d₁ = A⁻¹Σe_i√ρ_i·η_i(C_i − E C_i).
- **The one inequality that matters** is (19): since A ≥ Σρ_iR_i, pointwise
  (Σe_i√ρ_i·v_i)² = (Σ(e_iv_i/√R_i)·√(ρ_iR_i))² ≤ (Σe_i²v_i²/R_i)·A. The square of the sum over blocks, cross terms
  included, is bounded by a sum with weights e_i², which add up to one. Independence of the blocks is not used here.
- With v_i = ρ_iU_i: ‖d₀‖² ≤ Σe_i²ρ_i²·E[T·U_i²/R_i] ≤ K·J_e, J_e = Σe_i²ρ_i²χ_i. The factor E[T·U_i²/R_i] is bounded
  using only 0 ≤ b_i ≤ 1, so the dependence of b_i on the other blocks is harmless.
- With v_i = η_i(C_i − E C_i): ‖d₁‖² ≤ Σe_i²α_i²·Var C_i, by independence of C_i and block i, and
  Var C_i = (χ − ρ_i²χ_i)/2. So ‖d₁‖² ≤ ½a²(χ − J_e).
- Cauchy–Schwarz on the two budgets: (√(K·J_e) + √(½a²(χ − J_e)))² ≤ (K + ½a²)·χ. The means: E_μd₁ = 0 and
  E_μd₀ = 4Σe_iρ_i^{3/2}s_i (E_T[T(2H − 1)] = 3 for every b), so (E_μd)² ≤ 16Σρ_i³s_i² ≤ 16M·χ.
- Hence |e·c|² ≤ (2/3)(K + ½a² + 16M)·u²χ·Ω̂ for every e, which is (6).

*A remark the package does not make (P, from the same lines).* J_e ≤ J* = max_i ρ_i²χ_i, so the proof gives
θ ≤ (2/3)[(√(K·J*/χ) + √(a²/2))² + 16Σρ_i³s_i²/χ]. For r equal blocks J*/χ = 1/r, and the constant falls to a²/3 as
r grows (at most 1/6 at rank one; 0.12 with the exact α₁² = 0.363). The truth falls faster: the exact supremum over polynomial profiles with deg k′ ≤ 5 is 1.480,
0.732, 0.360, 0.202 for 1, 2, 4, 7 equal blocks of rank one (`review/logs/exact_checks2.log`, part A4), and h(v) = v gives
exactly 4/(3r). The stated constant 39/16 is uniform in r; it is not the size of the content for many blocks.

**2.4 Lemma 2: α² ≤ min(1, 2√κ), and how it compares.**
- *Proof, checked.* With g(x) = (p(x) − p(−x))/(p(x) + p(−x)) (odd, |g| ≤ 1): E g(P) = E g(P)² = α². The function
  s(x) = −e^{x²/2}∫_x^∞ g(t)e^{−t²/2}dt solves s′ − xs = g, is even, and |xs| ≤ 1 by the Mills bound, so |s′| ≤ 2. Then
  α² = E[s′(P) − P·s(P)] = E[(1 − B)s′(P)] ≤ 2E|1 − B| ≤ 2√κ, by (10) for the Lipschitz test s.
- *Numerically* (`review/logs/lemma2_check.log`): the identity holds to 10⁻¹⁵ on equal spectra with
  m = 1, 2, 4, 16, 64, 576 and on the signed pairs (4/5, −3/5), (12/13, −5/13); sup|xs| = 1.000, sup|s′| ≤ 1.42.
- *It is weak.* For equal eigenvalues, κ = 1/m:

  | m | exact α_m² | Lemma 2 | sharpened (below) | Hellinger, 2/(3m) | (2/3)(Σλ³)² |
  |---|---|---|---|---|---|
  | 16 | 0.0322 | 0.5 | 0.410 | 0.0417 | 0.0417 |
  | 64 | 0.00922 | 0.25 | 0.178 | 0.0104 | 0.0104 |
  | 576 | 0.00113 | 0.0833 | 0.0511 | 0.00116 | 0.00116 |

  The bound is of order √κ and the truth of order κ. For two eigenvalues κ ≥ 1/2, so Lemma 2 gives only the trivial
  bound 1 there (exact values 0.029 at (4/5, −3/5) and 0.138 at (12/13, −5/13)).
- *The guess of my first review*, α² ≤ (2/3)(Σλ_j³)², is of the true order and sees the cancellation of signs (it
  vanishes for a symmetric spectrum, where α = 0). It holds on every spectrum computed so far (the 13 of the first
  review, and all those above). **It is still not proved**; Lemma 2 does not prove it. A bound of that kind would turn
  the hypothesis κ ≤ 1/576 into roughly κ ≤ 1/24.
- *The other weakness I pointed out for (8) remains*: K contains √(24κ_i) from E[ζ_i²/R_i] ≤ κ_i, which ignores the sign
  cancellation in ζ_i = E[P_i(B_i − 1)|R_i]. With Lemma 2 this term is of lower order, so it no longer dominates.
- *A sharpening in two lines (P, mine).* E[(1 − B)s′(P)] = E[(1 − B)P·s(P)] + E[(1 − B)g(P)] ≤ √κ + √κ·α, because
  E g(P)² = α². So **α² ≤ √κ(1 + α)**, i.e. α ≤ (√κ + √(κ + 4√κ))/2. With it the two hypotheses of Corollary 3 become
  κ ≤ 1/40 (for 1.33; Lemma 2: 1/58) and κ ≤ 1/283 (for 0.37; Lemma 2: 1/535), in floating point.

**2.5 Equal eigenvalues: the centred cross term.** ζ_i = R_i/√m_i, so
E[T·U_i²/R_i] = E[(9 + 8b_i²)η_i²/R_i + (24 + 16b_i²)η_i/√m_i + (16 + 8b_i²)R_i/m_i]. E η_i = 0 removes the 24, and
E[b_i²η_i] = E[(b_i² − ½)η_i] ≤ ½E|η_i| ≤ ½α. So L_m ≤ 17α² + 24/m + 8α/√m ≤ 42/m. No independence of b_i and η_i is
used. With K ≤ 42/(4(m+3)), M = 1/(4(m+3)), a² ≤ 2/(3m): θ ≤ 29/(3(m+3)) + 2/(9m). This replaces the constant
253/(18(m+3)) + 2/(9m) of the first package's bulk theorem (6.3.29) and extends it to any number of blocks. For one
block without bulk the first package's 77/(9(m+3)) (6.3.28) stays the better constant.

**2.6 Admissibility.** As in the first package; the proof needs f′ in (13), so it is done for smooth h and passed to
the limit in the final inequality. The approximation argument is correct (uniform bound C′(v^{−1/2} + 1 + v^d), pointwise
convergence of k_n′ on v > 0, dominated convergence).

## 3. Replays and the interval certificates (C)

**Replays.** `node certify_phase.mjs` (7 s) and `node verify.mjs` (7 s), Node 24.14.0, in `review/package-copy/`: PASS;
`phase_intervals.json` and `results_exact.json` reproduced byte for byte (`review/logs/*_replay.log`). Both scripts
only read `rows.json` and write the two JSON files; no network, no child process.

**What `verify.mjs` checks, exactly.**
- 72 polynomial instances: 9 models × 8 profiles (v⁰ … v⁴ and three mixed-sign polynomials). Models: two to seven blocks,
  equal ranks 1, 4, 9, 64, 576 and the signed spectra (3/5, 4/5), (3/5, −4/5), unequal amplitudes, bulk UVZ̄.
  Per instance: E V = u, δ = Σw_i²χ_i + 6w₀²; **the direct content (9) equals the balanced form (14)**, coordinate by
  coordinate; Ω̂ ≥ 0; ‖c‖² ≤ θδΩ̂ with the claimed θ; for h(v) = v, c_i = 4a_i³s_i.
- An independent Wick-monomial engine on five models: E|q|², E|q|⁴, E|q|⁶ and every content coordinate for h = 1, v, v²,
  the zero ones included.
- The rational arithmetic of every constant; the three T-moments of (31a); the six row comparisons (no profile enters;
  of `rows.json` only 1 + b_A ≠ 0 and σ > 0).
- It calls `certifyPhase()` and recomputes the twelve enclosures.
- It does **not** test the allocation (19)–(23), Lemma 2, or the conditioning (15): those are the written proofs.

**Is every rounding directed the right way? Yes.** I read `certify_phase.mjs` line by line.
- Numbers are [lo, hi]/2²⁵⁶ with BigInt ends. `I`, `add`, `mul`, `div`, `byInt`: lower ends by floor, upper ends by
  ceiling; only non-negative intervals are multiplied; divisors have a positive lower end (asserted).
- `expInterval`: Taylor to degree 128, each term from the same-side end of x (all terms increase in x ≥ 0); the
  remainder is bounded by the term of degree 129 times 130/70, valid for x ≤ 60 (asserted; the arguments are ≤ 54).
- A_m = (m+t)^{m−1}e^{−t} decreases on [0, m] (A′/A = −(1+t)/(m+t)); B_m = (m−t)^{m−1}e^{t} increases to t = 1 and
  then decreases (B′/B = (1−t)/(m−t)). So the panel ranges are the endpoint enclosures, with B_m(1) added on the panel
  that contains 1 (on both panels when 1 is a node).
- φ(a, b) = (a−b)²/(a+b) is convex for a + b > 0, so its maximum over a box is at a vertex; its minimum is 0 if the two
  intervals overlap, else at the closest ends (∂_aφ and ∂_bφ have the signs of a − b and b − a). `phiBox` does this.
  a + b > 0 on every box because A_m > 0.
- **Coverage:** [0, m] is covered by 8192 panels; beyond t = m the reflected density vanishes and the integrand is the
  density itself, whose integral is the Poisson sum e^{−2m}Σ_{j<m}(2m)^j/j!, enclosed too. Nothing is truncated.

**Own enclosures of all twelve integrals** (`review/scripts/interval_alpha.py`): mpmath interval arithmetic at 160 bits,
6,000 to 30,000 panels, the natural interval extension of the integrand on each panel, with **no** use of the
monotonicity of A_m, B_m or of the convexity of φ. In every case my upper end is below the target, my enclosure overlaps
the package's, and a 30-digit quadrature of the definition α_m² = ∫(p(x) − p(−x))²/(p(x) + p(−x))dx lies inside both.

| m | target | package enclosure | own enclosure | 30-digit value |
|---|---|---|---|---|
| 2 | 21/100 | [0.201928, 0.202030] | [0.201727, 0.202232] | 0.201979 |
| 4 | 11/100 | [0.108890, 0.108994] | [0.108711, 0.109174] | 0.108942 |
| 12 | 11/250 | [0.041452, 0.041576] | [0.041258, 0.041772] | 0.041514 |
| 23 | 3/125 | [0.023278, 0.023410] | [0.023167, 0.023521] | 0.023344 |
| 27 | 3/125 | [0.020159, 0.020292] | [0.020036, 0.020417] | 0.020225 |

(Ends rounded outwards to six places; the other seven are in `review/logs/interval_alpha.log`.) The tightest target is
m = 4: 0.11 against 0.10894.

**Own exact checks** (`review/scripts/exact_checks2.py`): every constant of `PROOFS` §§4–5 and `INTERVAL_PROOF` §4; the
minimum ranks with minimality; the nine examples stored in `results_exact.json`, reproduced by independent moment code
(convolution over the eigenvalues, not the package's cumulant recursion); (14) on 190 further coordinate checks,
with a second bulk U²Z̄/√2; the polynomial suprema of §2.3; the obstruction formula on 66 random rational subspaces.

## 4. Independent numerics with the row profiles (N)

Method (`review/scripts/multiblock.py`): c_i = √(uρ_i)·E[P_i·Φ₁(A)] with Φ₁(a) = E_T[T h(uaT)]; the expectation over the
other blocks and the bulk by successive one-dimensional smoothings F(a) → E F(a + ρ_jR_j); own profile tables (accurate
to 10⁻¹⁵; the JSON tables on master agree with them to 8·10⁻⁵). Validation: h(v) = v to 10⁻¹⁵ against
64Σρ_i³s_i²/(3χ); the balanced form (14) against the direct form (9) to 4·10⁻⁹ on every model and row, signed spectra
included; one block against the first review's code to 1.5·10⁻⁸.

Largest ratio over u/u* ∈ {0.5, 0.75, 1, 1.3} and both sectors (it is always at 0.5u*; the ratio decreases in u):

| model | χ | 0.80 | 0.82 | 0.84 | 0.845 | 0.85 | 0.855 | u → 0 | proved θ |
|---|---|---|---|---|---|---|---|---|---|
| M0: one block, rank 1 (control) | 16 | 0.189 | 0.249 | 0.346 | 0.380 | 0.420 | 0.468 | 1.333 | 39/16 |
| M1: 2 × rank 1, weights ½, ½ | 8 | 0.180 | 0.222 | 0.283 | 0.303 | 0.325 | 0.351 | 0.667 | 39/16 |
| M2: 2 × rank 1, weights 0.8, 0.2 | 10.9 | 0.177 | 0.228 | 0.307 | 0.335 | 0.366 | 0.404 | 1.020 | 39/16 |
| M3: ranks 1, 4 (0.4, 0.3), diffuse bulk 0.3 | 3.19 | 0.133 | 0.163 | 0.206 | 0.220 | 0.235 | 0.252 | 0.473 | 39/16 |
| M4: 4 × rank 1, weights ¼ | 4 | 0.144 | 0.168 | 0.199 | 0.208 | 0.218 | 0.229 | 0.333 | 39/16 |
| M5: ranks 1, 1, 2, 4 (0.4, 0.2, 0.2, 0.1), bulk U²Z̄ 0.1 | 3.77 | 0.138 | 0.166 | 0.205 | 0.217 | 0.231 | 0.246 | 0.431 | 39/16 |
| M6: spectra (3/5, 4/5), (4/5, −3/5), weights ½, ½ | 5.24 | 0.098 | 0.120 | 0.149 | 0.159 | 0.169 | 0.181 | 0.315 | 2.51 (criterion); 4.67 (Lemma 2) |
| M7: 2 × rank 4 (0.4, 0.4), bulk U²Z̄ 0.2 | 2.64 | 0.103 | 0.123 | 0.148 | 0.156 | 0.164 | 0.173 | 0.259 | 8153/6300 |
| row threshold | | 0.37 | 0.64 | 1.33 | 1.88 | 2.5 | 3.7 | | |

- The proved constant is an upper bound in all 576 evaluations (8 models, 6 rows, 6 energies, 2 sectors).
- On the band every multi-block cubic is below the one-block cubic X(|Y|² − 1), and 2.05, 2.8, 4.3, 5.6, 6.8, 9.2 times
  below the row thresholds.
- At low energy the ratio rises to the value of h(v) = v, as for one block: at 0.02u* it is 0.60–0.64 for M1 and
  0.85–0.96 for M2, above the thresholds of the rows 0.80 and 0.82. Those thresholds hold on a band of energies only.
- The proved constant 39/16 is 6 to 18 times the largest band values of the rank-one models M1–M5 (0.13–0.40), and
  8153/6300 is 7.5 to 12.5 times those of M7 (0.10–0.17).

## 5. Scope

**What the class contains.** Sums of independent blocks X_i·P_i(Y_i) with real diagonalisable (Hermitian) cofactors on
disjoint sets of coordinates, plus an independent bulk ΣZ̄_aF_a(U). Each driver X_i occurs once and never in a cofactor.

| hard family of `CONTENT_LEMMA_D5.md` | in the class? | proved θ |
|---|---|---|
| junta H(X) = X(\|X\|² − 2)/√2 | no: self-interaction | |
| spike c·H(X) + bulk; several spikes ΣH(X_j) (4.13) | no: self-interaction | |
| Wick + shared drivers | no: self-interaction | |
| H(X) + H(Y) | no: two self-interacting drivers | |
| X(\|Y\|² − 1) | yes (one block, rank 1) | 39/16 here; 77/36 in 6.3.28 |
| X(\|Y\|² − 1) + bulk | yes | 39/16 (was 55/16 in 6.3.29) |
| X²Ȳ | yes, as a bulk; zero content | |
| X(\|Y\|² − 1) + Y(\|X\|² − 1), random two-variable cubics | no: the blocks share coordinates | |
| new: ΣX_i(\|Y_i\|² − 1) on disjoint coordinates, any weights, with bulk | yes | 39/16 |

So the class has grown in the diffuse direction (sums of independent pieces), not towards the junta. The one gain on a
family of the study: X(|Y|² − 1) + bulk now has a proved constant below the threshold of t = 0.85 as well as 0.855.

**Rows 0.80 and 0.82 on the band: nothing here bears on them.**
- These rows need the inequality with θ ≤ 0.37 and 0.64 for every remote cubic on the band, or a majorant that falls
  with concentration (4.19 (v)). The binding cubics are junta-like and have self-interaction; none is in the class.
- Inside the class the two thresholds are reached only when every block has rank at least 23 and 12 (equal positive
  eigenvalues), or κ ≤ 1/576 for general spectra: cofactors that are nearly Gaussian, next to the zero-content class.
- At rank one the proved constant is 39/16, 6.6 and 3.8 times above the two thresholds. No constant that holds for all
  profiles and energies can do better than the value at h(v) = v, 64Σρ_i³s_i²/(3χ), which is 4/3 for one block.
- Numerically the class is harmless on the band (table of §4), as the first package's class was.
- What does carry over is a technique: several drivers with independent cofactors cost no factor in their number. The
  case the ledger lists as open (6.3.17, several *self-interacting* drivers) is not touched: (13) and (22) both use that
  C_i is independent of block i.

## 6. `COORDINATE_OBSTRUCTION.md`

**Correct.** What it states, exactly:

> Let q_m = X·Σ_{j≤m}(|Y_j|² − 1)/√m (‖q_m‖₂ = 1), let E be a k-dimensional complex subspace of the span of the
> original coordinates X, Y₁, …, Y_m, and c = ‖Proj_E X‖². Then ‖E[q_m | σ(E)]‖₂² = (c/m)(k − 1 + 2(1 − c)²).
> Its supremum over E is 8/(27m) for k = 1 and (k − 1)/m for 2 ≤ k ≤ m + 1.

- Since a conditional expectation is the best L² approximation, this says: **no function of k original coordinates,
  chosen after any unitary change of the coordinates, has squared correlation above (k − 1)/m with q_m.** A bounded
  number of original coordinates carries a vanishing share of the energy of q_m as m grows, although the coordinate X
  has full influence (E|∂_Xq_m|² = 1).
- Proof checked: by U(m)-invariance E = span(v, Y₂, …, Y_k) with v = √c·X + √(1−c)·Y₁, and the conditional expectation
  of a Wick product projects each linear factor, so E[q_m | σ(E)] = √(c/m)·((1−c)·v(|v|² − 2) + v·Σ_{j=2}^k(|Y_j|² − 1)),
  two orthogonal pieces of squared norms 2(1−c)² and k − 1.
- A second proof (mine): with Π the projector on E, ‖E[q_m|σ(E)]‖² = (1/m)Σ_{j,l≥1}(Π₀₀Π_jl² + Π₀_lΠ_j0Π_jl), and Π² = Π
  gives Σ_{j,l}Π_jl² = k − 2c + c² and Π₀_YΠ_YYΠ_Y0 = c(1−c)². Checked exactly on 66 random rational subspaces.
- The remarks are correct too: (X, q_m) ⇒ (X, X·G) with G a real standard Gaussian independent of X; the limit is not
  "a function of X plus an independent proper Gaussian", by the conditional variance |X|² and pseudo-variance X²;
  the finite-m witnesses E[(|X|² − 1)|q_m|²] = 1 and E[X̄²q_m²] = 2 are right.

**What it does not state.**
- Nothing about approximation in law, and nothing about reductions on new coordinates (compressions, kernels, the
  variable P_m itself kept as an object). The note says so.
- Nothing about the content or about Λ: it is a statement on L² energy only.
- Nothing about trace terms. A later package may cite it for one thing: a finite-dimensional reduction cannot work by
  *selecting or conditioning on* boundedly many original coordinates, so it must change coordinates. Why a compression
  then needs a trace (Wick re-ordering) correction is a separate fact, to be proved where it is used. The example fits
  that discussion only because its cofactor ‖Y‖² − m is the trace form itself.

## 7. Proposed ledger rows (placeholder numbers)

Statuses: the proofs become **P** in the sense of `research/README.md` (re-derived by someone other than the author).
"KCB" stands for this package. Text to be edited by claude-b9ee.

**K ledger, §6.3** (columns: # | family and statement | constant | status | where):

| # | family and statement | constant | status | where |
|---|---|---|---|---|
| 6.3.A1 | **Independent Hermitian-factor blocks: no loss in their number.** q = √u(Σ_{i≤r}√ρ_i·X_i·P_i + √ρ₀·W), independent blocks, P_i = Σ_jλ_ij(\|Y_ij\|² − 1) with real λ, Σ_jλ_ij² = 1, W the bulk of 6.3.29, Σρ_i = 1. For every profile as in 6.3.27 and every u > 0: ‖c[h]‖² ≤ [(2/3)(K + 16M) + a²/3]·δ·Ω̂[h], with a² = max α_i², K = max(√17·α_i + √(24κ_i))²/χ_i, M = max s_i²/χ_i (α_i² = E[E(P_i\|P_i²)²/P_i²], κ_i = Σλ⁴, s_i = Σλ³, χ_i = 4 + 12κ_i); K may be replaced by max L_i/χ_i for any bound L_i ≥ E[T·U_i²/R_i]. Mechanism: all blocks keep the radius of the whole sum; an exact zero (two integrations by parts) centres the fluctuation C_i of the other blocks; the content vector is tested against a unit vector e and one pointwise Cauchy–Schwarz with A ≥ Σρ_iR_i gives the two norms the complementary budgets J_e and χ − J_e of the same δ. It is not a driver-by-driver addition (§14, item 32) | no factor r. The same proof gives (2/3)[(√(K·J*/χ) + √(a²/2))² + 16Σρ_i³s_i²/χ], J* = max ρ_i²χ_i, which falls to a²/3 for many comparable blocks; h(v) = v gives exactly 64Σρ_i³s_i²/(3χ) (4/(3r) for r equal blocks of rank one) | **P** (codex-a786; re-derived line by line by a review worker of claude-b9ee); the balanced identity **C** on polynomial instances (replayed; 190 further checks by the reviewer's code) and **N** for the degree-5 row profiles | KCB `PROOFS.md` §§1–3; `verify.mjs`; `REVIEW.md` §§2.2–2.3 |
| 6.3.A2 | **Sign bias of a Hermitian quadratic form.** For P = Σλ_j(T_j − 1), T_j independent Exp(1), Σλ_j² = 1, κ = Σλ_j⁴: α² = E[E(P\|P²)²/P²] ≤ min(1, 2√κ). Proof: the Stein equation s′ − xs = g for the odd density contrast g of P, with \|s′\| ≤ 2, and α² = E[(1 − B)s′(P)]. Hence in 6.3.A1: θ = 1015/804 if every κ_i ≤ 1/64 and θ = 2465/6948 if every κ_i ≤ 1/576, for signed unequal spectra | of order √κ, while the bias is of order (Σλ³)² ≤ κ: at 64 equal eigenvalues 0.25 against the exact 0.0092. A two-line sharpening, α² ≤ √κ(1 + α), relaxes the hypotheses to about κ ≤ 1/40 and 1/283 (review). The bound α² ≤ (2/3)(Σλ_j³)² holds on every spectrum computed and is **open** | **P** (same author and review); the identity **N** on eight spectra (review) | KCB `PROOFS.md` §4; `REVIEW.md` §2.4 |
| 6.3.A3 | **Equal positive eigenvalues, any number of blocks, with bulk.** If every block is P_{m_i} with m_i ≥ m: θ = 29/(3(m + 3)) + 2/(9m); θ = 39/16 for every rank. With twelve interval enclosures of α_m² (m = 2–6, 12, 13, 23–27): θ = 1361/750, 8153/6300, 91/144, 16226/43875 for all ranks ≥ 2, 4, 12, 23. The gain over 6.3.29 is a cross term centred by E η_i = 0 | replaces 253/(18(m+3)) + 2/(9m) of 6.3.29 and extends it to any number of blocks; for one block without bulk 77/(9(m+3)) of 6.3.28 is smaller | **P** (same author and review) + **C** (interval certificates replayed, and all twelve re-enclosed by the reviewer with other code) | KCB `PROOFS.md` §5, `INTERVAL_PROOF.md`, `certify_phase.mjs`; `REVIEW.md` §3 |
| 6.3.A4 (or §14, next to item 32) | **Original coordinates do not capture X·P_m.** For q_m = X·Σ_{j≤m}(\|Y_j\|² − 1)/√m and a k-dimensional subspace E of the span of the original coordinates, ‖E[q_m\|σ(E)]‖² = (c/m)(k − 1 + 2(1 − c)²), c = ‖Proj_E X‖²; the supremum is 8/(27m) for k = 1 and (k − 1)/m for 2 ≤ k ≤ m + 1, although X has full influence. (X, q_m) converges in law to (X, X·G), G real Gaussian, which is not a function of X plus an independent proper Gaussian | an obstruction to selecting or conditioning on boundedly many original coordinates in L². It says nothing about reductions on new coordinates, about approximation in law, or about trace corrections | **P** (same author and review; a second proof by the projector formula) + **C** (66 random rational subspaces, reviewer) | KCB `COORDINATE_OBSTRUCTION.md`; `REVIEW.md` §6 |

**Higher-degree ledger** (columns as there):

| ID | statement | scope | status | source |
|---|---|---|---|---|
| 4.A1 | **The same-law inequality of 4.19 (v) on sums of independent blocks.** ‖c[h]‖² ≤ θ·δ·Ω̂[h] holds for q = √u(Σ√ρ_i·X_i·P_i + √ρ₀·W) with independent Hermitian-factor blocks and a decoupled bulk, any number of blocks, every u > 0 and both tilted profiles of the six rows (`../conjecture-K/STATUS.md` 6.3.A1–6.3.A3). θ is below the thresholds 0.37, 0.64, 1.33, 1.88, 2.5, 3.7 when every block has equal positive eigenvalues of rank at least 23, 12, 4, 2, 1, 1 (24, 13, 5, 3, 1, 1 without the interval certificates), or κ ≤ 1/576 (all six) and κ ≤ 1/64 (the last four) for signed spectra. **It closes no row and nothing in it bears on t = 0.80 and 0.82**: the class has no self-interaction, of the families of CONT5 it contains only X(\|Y\|² − 1) and its bulk version (θ = 39/16), and its constants hold for all profiles and energies, where the value at h(v) = v is already 4/3 for one block. Measured (**N**): on eight multi-block cubics the ratio is at most 0.18, 0.23, 0.31, 0.33, 0.37, 0.40 on u/u* ∈ [0.5, 1.3] (rows 0.80 … 0.855), decreasing in u and below the one-block values of 4.20; at 0.02u* it is 0.60–0.96 for two blocks of rank one, so the thresholds of the first two rows hold on a band of energies only | a structured class; the capped game; sampled energies | **P** (see the K ledger); the comparison **N** (review worker of claude-b9ee) | KCB; its `REVIEW.md` §§4–5 |

## 8. Required corrections and suggestions

**Required:** none in the mathematics. For the ledger text (`LEDGER_PATCH.md`): the degree-5 note must say that no row
is closed and that the row thresholds are meant on a band of energies, as for 4.20; the rows must define Ω̂ and the
admissible class or refer to 6.3.27.

**Suggestions:**
1. State what the proof gives for many blocks: J_e ≤ max ρ_i²χ_i (§2.3). "No factor r" undersells it.
2. Lemma 2: add the sharpening α² ≤ √κ(1 + α); say that the bound is of order √κ against a bias of order (Σλ³)², and
   that the hypotheses κ ≤ 1/64 and 1/576 are therefore far from necessary.
3. Say in the README that at rank one the constant is 39/16 for every number of blocks, and which rows it reaches.
4. `INTERVAL_PROOF.md` §2: state that B_m(1) is added on both panels when t = 1 is a node (the code does it).
5. The interval certificates could be run for all m ≤ 27 and L_m evaluated with them; the thresholds would move little.

## 9. Not checked

- No certified numerics for the row profiles: §4 is floating point (relative accuracy about 10⁻⁷ given the tables).
- The row thresholds themselves (from `CONTENT_LEMMA_D5.md` §11.4).
- `LITERATURE.md` and `source_manifest.json`: the reading notes and the hashes of the downloads. The Binet and
  duplication formulas were confirmed numerically in the first review.
- The Wick engine of `verify.mjs` was read and replayed, not re-implemented; its five models overlap with the nine
  examples that my own moment code reproduces.
- Lemma 2 numerically beyond eight spectra; multi-block cubics beyond eight models, four blocks and six energies.
- Bulks other than the diffuse limit, U²Z̄/√2 and UVZ̄ (the proof for general F_a was re-derived on paper).
- The later package that cites the obstruction: only the passage that cites it was read.
- Nothing in Lean.

## 10. Files

All under `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-content-law-blocks-2026-11-16/review/`.
Run with `/usr/local/bin/python3 -I -B`, one process, one thread.

| script (`scripts/`) | log (`logs/`) | what |
|---|---|---|
| — | `certify_phase_replay.log`, `verify_replay.log`, `*.delivered.json` | the two replays in `package-copy/` |
| `exact_checks2.py` | `exact_checks2.log` | identities, constants, minimum ranks, stored examples, (14), polynomial suprema, the obstruction formula |
| `interval_alpha.py` | `interval_alpha.log` | own enclosures of the twelve integrals |
| `lemma2_check.py` | `lemma2_check.log` | Lemma 2: the identity, the bounds, the κ thresholds with the sharpening (six minutes) |
| `multiblock.py` (imports `content_ratio.py` of the first review) | `multiblock.log/.json` | §4 (two minutes) |
| — | `json_profiles_check.log` | the JSON profile tables on master against `data/prof_hp_<k>.npz` |

`content_ratio.py`, `profiles_hp.py` and `data/prof_hp_<k>.npz` are copies from the first review. The study's folders
were only read. Nothing was written outside
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-content-law-blocks-2026-11-16/` (this file and
`review/`); no tracked file was touched, and there was no commit, push or post.

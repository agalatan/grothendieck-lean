# Conjecture K: start here

Conjecture K is an open statement about Gaussian chaos. An error of 10⁻⁴ would give the cubic witness a lower bound around 1.402. The exact conjecture could give about 1.4022. This folder is the
organised record of everything known about it: the statement, what is proved, what is only computed, what is false,
and what does not work. It is research material: nothing here is imported by Lean or checked by CI, and the
conjecture is **open**.

| file | what it is |
|---|---|
| `README.md` | this file: statement, why it matters, the layers of a proof, reading order, index |
| [`MONOGRAPH.md`](MONOGRAPH.md) | **the book**: the current best-known state as one text, from the setting to what is proved, what is open, what is false, the numerical evidence and where everything is |
| [`STATUS.md`](STATUS.md) | **the ledger**: every statement in its current form, with its scope, its status (P / C / Lean / N / R / open / false), its author and checker and its source; the false statements; the routes that do not work; the open problems in order |
| [`INVENTORY.md`](INVENTORY.md) | what is kept outside the repository (zips, large certificates, logs, binaries), with paths, sizes and SHA-256 |
| `sources/` | verbatim copies of the working documents: the audits and their reviews, the log, the digest and chapters of the October manuscript, notes received, prompts, the reports with their reviews, the numerical write-ups; also the monograph of 5 and 6 November with its errata (`monograph-2026-11-05/`) and the ledger with its dated passages (`status-2026-11-15/`) |
| `code/` | the scripts behind the results still relied on, their small result files and logs, the verifiers of the reports and the checkers of the audits |

**Living documents.** `MONOGRAPH.md` is the living book and `STATUS.md` the living ledger: every PR that changes the
state of knowledge edits them in place, with no errata sections and no dated update paragraphs. A ledger row keeps
its ID, and a strengthened statement replaces the weaker text in its row. Copies under `sources/` stay verbatim
([`../README.md`](../README.md)).

**Status labels** ([`STATUS.md`](STATUS.md), section 0): **P** a proof re-derived by someone other than its author,
**C** an exact or interval checker replayed by someone other than its author, **Lean** a theorem of this repository,
**N** numerical only, **R** read from the record without independent verification, **open** no claim, **false**
shown false (section 13 of the ledger gives the counterexample). The ledger names the author and the checker of every
statement.

## (a) The statement

**Setting.** z = (z₁, …, z_n) are independent standard complex Gaussians, E|z_j|² = 1, and ⟨f, g⟩ = E[f̄g].
H_{p,q} is the Wick chaos of bidegree (p, q) (Wick-ordered polynomials of degree p in z and q in z̄) and P_{p,q} the
orthogonal projection onto it. T = |z₁|² (so T is Exp(1)); z₁ is the *visible* coordinate and z₂, …, z_n are the
*remote* ones (written w, X, Y in the sources). W always denotes a standard complex Gaussian independent of z.

**The witness and the row.** The lower bound uses the cubic witness T_ε = P₁,₀ − εP₂,₁:
K_G^ℂ ≥ 1/‖T_ε‖, where ‖T_ε‖ = sup{Re⟨f, T_εg⟩ : |f| = |g| = 1}. For unimodular f, g put h = (f+g)/2, k = (f−g)/2,
rotate so that P₁,₀h = t·z₁ (0 ≤ t ≤ √π/2), and set G = εP₂,₁k ∈ H₂,₁(ℂⁿ). Then, for every real ℓ and β
(the *exact gate-free row*, status **P**):

    Re⟨f, T_ε g⟩ ≤ t² − 2ℓt + 2β²/ε + Λ(G),
    Λ(G) = E|L + G| + E|L − G| − ‖G‖²/ε,
    L = z₁(ℓ + β(|z₁|² − 2)) = z₁(a + b|z₁|²),   a = ℓ − 2β,  b = β.

Three nonnegative terms are dropped to get it: ‖P₁,₀k‖², ε‖P₂,₁h + B/ε‖² with B = βz₁(|z₁|² − 2), and the pointwise
phase slack. The whole difficulty of the lower bound is the supremum of Λ over G.

**Conjecture K.** For every n and every G ∈ H₂,₁(ℂⁿ),

    Λ(G) ≤ S(ε, ℓ, β) := sup_{σ ≥ 0} Λ(σW) = sup_{σ ≥ 0} { 2E|L + σW| − σ²/ε }.

The comparison object σW is the *diffuse Gaussian adversary*: the limit in law of N^{−1/2}Σ_{j≤N} H(w_j),
H(w) = w(|w|² − 2)/√2, over fresh coordinates w_j, a limit of elements of H₂,₁ independent of z₁. If K holds, the
supremum over **all finite dimensions** equals S and is approached by these diffuse sequences. This does not assert
attainment in a fixed H₂,₁(ℂⁿ): at the peak, n = 1 has supremum 2E|L| < S; at the corner (0.74, 0.90, 0.12), σ\* = 0
and G = 0 attains S.

**Weaker forms that would suffice.**
- **K_η:** Λ(G) ≤ S + η. For 1.402 at the peak row, η ≤ 10⁻⁴ suffices on t ∈ [0.84, 0.851], with the cap more than
  6.12·10⁻⁷ below 500/701; the largest admissible allowance there is η_max = 0.0001006120988404375…, with no reserve
  (`STATUS.md` 8.1).
- **K′ and the retained functional Λ̂:** keep −‖P₁,₀k‖² in the row. Its unconstrained form is
  Λ̂(G) = min_ξ {‖ξ‖² + E|L + G − ξ| + E|L − G + ξ|} − ‖G‖²/ε, ξ in the remote first chaos, with Λ′ ≤ Λ̂ ≤ Λ; the row
  holds with Λ̂, and sup Λ̂ ≤ S + η suffices. The benchmark of Λ̂ is the same S (2.14), although Λ̂ < Λ pointwise on
  some remote cubics (3.16). **For Λ̂ the A shell is closed at the peak row:** Λ̂(q + (T − 1)r) < S + 2·10⁻⁵ for every
  remote cubic q with ‖q‖² ≤ 0.0463 and every remote linear form r, in every dimension and at every amplitude (11.51,
  **P + C**); 11.47 is sharper on ‖q‖² ≤ 0.021 (below S − 2.76·10⁻⁶), 11.48 is a special case, and 11.53 extends the
  bound to a profile rectangle around the peak with error below 9.8·10⁻⁵.
- **Response-restricted forms:** only G that come from actual responses (f, g) matter. At ε = 1891/2500, for t ≥ 0.84
  the remote energy of a response is below 0.046266 (2.12a) and its total energy below 0.080051
  (0.070564 for t ≥ 0.8456; 2.12b). Such cuts hold for responses only and must not be inserted into raw K; omitted
  response regions still need coverage.

**Where it is needed.** The box ε ∈ [0.74, 0.76], ℓ ∈ [0.76, 0.90], β ∈ [0.12, 0.16]. The corner (0.74, 0.90, 0.12)
has σ\* = 0 and needs separate treatment if a row cover uses it. K for *every* profile is false
(profiles with ℓ − 2β ≲ 10⁻¹⁰ at tiny norms; `STATUS.md`, section 13, item 1), so the box matters. The principal
certificates use three rows; whole-box results say so:

| row | ε | ℓ | β = b | a = ℓ − 2β | σ\* (maximiser of Λ(σW)) |
|---|---|---|---|---|---|
| peak | 1891/2500 = 0.7564 | 1057/1250 = 0.8456 | 179/1250 = 0.1432 | 699/1250 = 0.5592 | 0.2009 |
| flank | 149/200 = 0.745 | 4267/5000 = 0.8534 | 1467/10000 = 0.1467 | 14/25 = 0.56 | 0.1726 |
| upper | 1891/2500 = 0.7564 | 0.877 | 19/125 = 0.152 | 573/1000 = 0.573 | 0.1617 |

Peak-row constants: p = 1/ε = 2500/1891; 1.3739535256614 < S < 1.3739535256616 (**C**, 3.14), attained at
σ\*² = v\* ≈ 0.0403; B₀ = Λ(0) = 2E|L| = (387/500)√π = 1.3718793; S − B₀ > 0.002074245.

**Vocabulary used everywhere.** Decompose G by its dependence on z₁:

    G = q + (T − 1)·r_A + z₁²·conj(r_B)/√2 + z₁·Q + z̄₁·P + d·z₁(T − 2),

with q a remote cubic (in H₂,₁ of the remote coordinates), r_A and r_B remote linear forms (the **A shell** and the
**B shell**), Q ∈ H₁,₁ and P ∈ H₂,₀ of the remote coordinates, d ∈ ℂ. u = ‖q‖², w = ‖r_A‖², δ = E|q|⁴ − 2u²,
χ = δ/u² ∈ [0, 42]. The **core** is q + (T − 1)r_A. For every G, F(G) = E|L + G| + E|L − G|, so
Λ(G) = F(G) − ‖G‖²/ε; for a remote q, F(q) = 2E|L + q|. B(u) = 2E|L + √u·W| (Gaussian of the same energy),
D(q) = B(u) − F(q) (the **deficit**, also written Δ), F_A(y) = E_{z₁}[(T − 1)·ph(L + y)] = y·g(|y|²), and
C(q) = ‖P₁,₀F_A(q)‖ (the **A-content**). The **content inequality** is C(q)² ≤ κ·D(q). The **tilted
content** of Λ̂ is c_s(q) = Π₁[q·h_s(|q|²)] with h_s = (g − g₀) − s(j₀ − j), where E_{z₁}ph(L + y) = y·j(|y|²).
Trap: the sectors z₁Q, z̄₁P, d·z₁(T − 2) are called "even sectors" in the October manuscript (even frequency after
factoring the phase of z₁) and "z-odd sectors" elsewhere (odd under z₁ → −z₁). They are the same sectors. The A and B
shells and q are the "odd-frequency" = "z-even" block.

## (b) Why it matters

| quantity | value | status and source |
|---|---|---|
| proved bounds (Lean, `main_bounds`) | 1.4020237104 < K_G^ℂ ≤ 1.404554025 | `Grothe/MainResult.lean`; `docs/LEAN_DETAILS.md` |
| witness cap of the proved lower bound | B = 713254699303/1000000000000 for the mixture of the identity-tail witness and the first-chaos projector. Its reciprocal is the exact endpoint rounded down in `main_bounds`. | [Certificate and controls](../identity-tail/FIRST_CHAOS_RETUNING.md) · [Exact constants](../../docs/CONSTANTS.md#behind-the-lower-bound) |
| row cap of the cubic-witness cover (Lean until #525) | 891774069/1250000000 = 0.7134192552 | `STATUS.md` 12.1 |
| row cap needed for 1.402 | below 500/701 = 0.7132667617… | `STATUS.md`, section 8 |
| row cap needed for 1.4022 | below 5000/7011 = 0.7131650263… | `STATUS.md`, section 8 |
| what K_η with η ≤ 10⁻⁴ would give | about 1.402 | `STATUS.md` 8.1 |
| what exact K would give | about 1.4022 (cap 0.713160 at ε = 0.7564 from a moment LP) | **N**, read from the record (`STATUS.md` 8.4) |
| ceiling of the cubic witness family (no certificate with T_ε can exceed it) | below 1.4022581233, for every complex multiplier ε and every dimension; the model optimum is near ε = 0.7564 (model norm 0.7131355). At ε = 0.75 the model gives 1.402166, at ε = 0.745 only 1.401957: the flank value ε = 149/200 cannot reach 1.402 | `docs/overview.tex`, "Limits of the witness method" ([P, C], part in Lean); `STATUS.md` 8.3, 12.2 |
| ceiling with an identity tail (witness (1, −ε, ν, ν, …)) | 1.40248 at ε ≈ 0.768, ν ≈ 0.0235 | **N**, the game value in the model (`STATUS.md`, section 10). The certificate at (ε, ν) = (191/250, 47/2000), designed for the target 1.4018 and giving the Lean lower bound, has its own ledger: [`../identity-tail/STATUS.md`](../identity-tail/STATUS.md) |

The proved certificates replace sup Λ by scalar relaxations (fibre potentials, moment and Stein cuts, node caps). Each
further decimal that way costs weeks of computation for about 10⁻⁵. K would remove the gate loss, the residual-law
loss and the price layer at once and reach the witness's own ceiling. K gives nothing beyond that ceiling and nothing
on the upper side; the degree-5 analogue K₅ fails numerically at its flank rows and at its peak row
(`STATUS.md` 12.3).

## (c) The layers of a proof, and where each stands

K_η must hold for every G ∈ H₂,₁, not only for the core. A proof has six layers; `MONOGRAPH.md` chapter 2 states
each result, and `STATUS.md` gives its evidence.

| layer | statement | status |
|---|---|---|
| **L1** remote part | Λ(q) ≤ S + η for every remote cubic q | **Exact at all three named profiles**, η = 0 over all energies and finite dimensions (peak 3.3a, flank and upper 3.15a, **P + C** for the radial/exterior certificates and corollaries, inheriting the **author only** KRAW/KSLIV inputs of 3.19, 3.29 and 6.3.43). At the peak the same-variance deficit is strictly positive for 0 < u ≤ 0.0463. The independent absolute cap is in 3.3 (**P + C**), with quantitative bounds in the peak tube and one-sided rectangle (3.11, 3.15). Exact remote K over the full profile box and the universal sharp-radius question remain open (3.5–3.6). Across general profiles the near-Gaussian comparison holds for 0 < χ ≤ 1/72000 (3.18, author only). The radius bound E\|q\| ≤ (2287/2500)‖q‖₂ = 0.9148‖q‖₂ holds on all of H₂,₁ (3.7, **P + C**; 114/125 = 0.912 **P + C**; 4571/5000 = 0.9142 **P, author only + C**) |
| **L2** core with disjoint drivers | q + (T − 1)U with U independent of q | **P + C** on the whole box at every amplitude, cost at least 3/152 (4.2) |
| **L3** core with shared drivers, explicit regions | q, r remote and orthogonal | **P + C** at the peak: Λ < S + 10⁻⁴ for u ≤ 0.00558 + 0.31907w and for w ≥ 0.0206 (6.1.1, 6.1.1a); the fourth-moment cutoff w ≥ 0.01125 is **R** (6.1.2) |
| **L4** core on the residual R = {w < 0.01125, 0.00551 + 0.319w < u ≤ 0.0463} | A-shell cost plus the content inequality | **K:** cost 0.24 **P** (6.2.1; upgraded globally to 7/25, 3/10, 31/100 at all driver amplitudes in 7.4.17, **P + C**); content **P + C** for structured families (0.22 for X·P(Y), 0.239 for the Gaussian-factor class; 6.3.3, 6.3.4), and **P + C, author only** across the full one-driver self-interaction class (47/200 for every Wick share, and 11/50 for Wick share f ≥ 1/16; 6.3.5, 6.3.13–6.3.15), mixed/real-driver blocks (47/200; 6.3.16–6.3.16b, implications **P**) and Wick neighbourhood (9/40; 6.3.6); **open for a general cubic** (6.3.18; the largest C²/D found is 0.0876, at u = 0.0463). Covered at the peak for a general cubic: the allowance form C² ≤ 0.24(S − Λ + 10⁻⁴), hence Λ < S + 10⁻⁴ on the core, for χ ≤ 0.2809 on the whole band and for maximal normalised influence at most 0.054 (6.3.40, **P + C**); C² ≤ 0.24·D for χ ≥ 40.32 (6.3.41, **P + C**); the allowance form for 95 or more independent blocks of equal energy (6.3.42, **P + C**); C² ≤ 0.24·D + 10⁻⁶ for χ ≤ 841/10000, and without the 10⁻⁶ across all of χ ≤ 49/625 with no near-Gaussian sliver (6.3.43, author only). **Λ̂:** the A shell is **closed at the peak** at every amplitude (11.51) |
| **L5** sector assembly | G = q + A + B + (z₁Q, z̄₁P, d·z₁(T − 2)) | **Open** for raw K; **closed at the peak for Λ̂ (7.5.13)**. Proved: B-shell cost (7.1.1); peak alignment ‖c_B − 0.5053c_A‖ ≤ 0.0035√u for Π₁q = 0 (7.1.4, 7.1.6), the retained B-content at first order (7.1.7) and the raw B-content against the fourth cumulant (7.1.8); zero-core odd costs (5.4); odd sectors over every remote core at the peak, with arbitrary sharing, for Λ and Λ̂ (7.2.10); the local joint A/B form (7.3.1, 7.4.9); **global raw joint A/B closure on all of $\mathbb{C}^3$ at the three rows** with reserve $1/100$ and common diagonal costs $\kappa_{\mathrm{diag}} = 7/25, 3/10, 31/100$, raising 7.4.2's sufficient raw A-content constant for diagonal closure to $11/50 = 0.22$ (7.4.17, **P + C**, independently reviewed); for Λ̂ at the peak, all sectors below S + 10⁻⁴ on an energy region around the zero core and at most 2E\|L\| < S when q = 0 (attained at G = 0; 7.5.1). The retained premise (P) holds globally on ℂ³, giving Λ̂(q + A + B) < S + 4936/10⁸ throughout the capped peak domain (7.4.10, 7.4.16). Independently checked odd regions cover W ≤ 1/1800000 and wider harmonic-dependent strips (7.5.4c), V ≤ 11/100000, and W ≥ 150V (7.5.12, 7.4.16). Global pointwise closure $F_{\mathrm{joint}}(c^*) \le 0$ on all of $\mathbb{C}^6$ at the peak row is certified in 7.5.13 (**P + C**), giving the original six-sector $\widehat{\Lambda}(G) < S + 4936/10^8$ and the sharpened $< S + 27.00\cdot10^{-6}$ (signed 11.61, KAST) on $u \le 0.0463, u + V \le 0.080051$. Open are the general averaged odd premise (P_Ψ) of 7.5.3, odd sectors over cores with A/B shells for raw K (7.2.4), a second retained target without energy caps at the A-tilt alone (7.4.15), and B-content for general cubics (7.1.5) |
| **L6** row envelope and consumption | a fixed-ε row cover with exact thresholds, coverage of all response regions, a Lean theorem consuming K_η | **Open for 1.402**; **row and response-region cover completed outside Lean across `[0, √π/2]` for the 1.40171 test witness at ε = 149/200** (`KHOM`, **P + C, author only**, from reviewed **P + C** / **Lean** inputs + 3.14 [**C**]; 8.5, 8.6; no Lean consumer theorem yet). At the peak row an all-sector K_η with η ≤ 10⁻⁴ covers t ∈ [0.84, 0.851], the subdivided `KAST` cover reaches [0.8400, 0.8661] (**P + C**), and free-homothety `KHOM` slabs reach [0.8400, √π/2] (Track A) and [0.8395, √π/2] (Track B, **P + C, author only**; 8.1, 8.7). At ε = 299/400 every response outside (0.8165, 0.866) is covered without a K premise (8.9), and its central bank has ten rows, with binding allowances of 3.0 to 4.4·10⁻⁵ (8.10). At ε = 94/125 every response outside (0.7515, 0.863) is covered (8.12, author only), its central bank has thirteen rows admitting > 1.021·10⁻⁴ (8.13, author only), and `KHOM` closes all of Rows 8–13 (`[0.8400, 0.8645]`) in Track A and `[0.8395, √π/2]` in Track B (**P + C, author only**); at ε = 3/4, outside (0.795, 0.864) from Lean's `Lower.ρ` alone, with nine central rows admitting > 7.57·10⁻⁵ (8.12, 8.13, author only) and `KHOM` closing `[0.8400, 0.8580]` in Track A and `[0.8395, √π/2]` (all of Rows 5–9) in Track B (**P + C, author only**). No `lower_of_K` or `KHyp` exists |

**What remains.** A bound on sup Λ̂ on the rows of a consumer gives the lower bound; K itself is not needed for it.
At the peak, (P) is proved for every complex shift and both complex drivers (7.4.16), and global all-sector pointwise closure $F_{\mathrm{joint}}(c^*) \le 0$ on all of $\mathbb{C}^6$ is now certified in 7.5.13 (**P + C**), yielding the original six-sector $\widehat{\Lambda}(G) < S + 4936/10^8$ and the sharpened $< S + 27.00\cdot10^{-6}$ (signed 11.61, KAST; exempt-box-free on $u \ge 3/2000$ in KHOM, **P + C, author only**) on $u \le 0.0463, u + V \le 0.080051$. Independently checked pieces of $(P_\Psi)$ already cover all cores throughout W ≤ 1/1800000 and wider harmonic-dependent strips (7.5.4a–c), plus $V \le 11/100000$ and $W \ge 150V$ (7.5.12, 7.4.16). [independent full replay](code/global-all-sector-gemini-c1de/REPLAY.md).
Fixed-scale peak-row slabs (`KAST`, **P + C**) cover $t\in[0.8400,0.8661]$ at ε = 1891/2500, [0.84000, 0.84948] at ε = 299/400, [0.84000, 0.85168] at ε = 3/4 and [0.8400, 0.8547] at ε = 94/125, while free-homothety peak-ray slabs (`KHOM`, **P + C, author only**) cover all 1,773 cells of $[0, \sqrt{\pi}/2]$ outside Lean at ε = 149/200 (8.5), widen Track A to $[0.8400, \sqrt{\pi}/2]$ at ε = 1891/2500, $[0.8400, 0.8645]$ (all of Rows 8–13) at ε = 94/125, $[0.8400, 0.8580]$ at ε = 3/4 and $[0.8400, 0.8498]$ at ε = 299/400, and widen Track B (`+ 3.5a, 3.3a`) to $[0.8395, \sqrt{\pi}/2]$ across ε ∈ {1891/2500, 94/125, 3/4} (all of Rows 5–9 at ε = 3/4) plus $[0.8395, 0.8499] \cup [0.8655, \sqrt{\pi}/2]$ at ε = 299/400. Open response intervals per witness (plus a Lean consumer theorem in every case): at ε = 1891/2500, `[0, 0.418]`, `[0.618, 0.664]`, and `[0.696, 0.8400]` (`[0.696, 0.8395]` in Track B; 8.7, 8.11); at ε = 299/400 (cap `713263/10⁶`, 8.9–8.10), `[0.8165, 0.8400]` and `[0.8498, 0.8660]` in Track A (`[0.8165, 0.8395]` and `[0.8499, 0.8655]` in Track B); at ε = 3/4 (cap `500/701`, 8.12–8.13), `[0.795, 0.8400]` and `[0.8580, 0.864]` in Track A (`[0.795, 0.8395]` in Track B); and at ε = 94/125, `[0.7515, 0.8400]` in Track A and `[0.7515, 0.8395]` in Track B at cap `500/701` (8.12–8.13), or `[0.751, 0.826]` at the stricter cap `0.713245` (8.13d, **P + C, author only**). K itself still needs odd sectors over cores with A/B shells (7.2.4),
and the raw content inequality of L4 (6.3.18), from which B-content follows (7.1.5). For Λ̂ the A shell is done at the
peak (11.51); 11.48 is a special case of it, 11.47 the only stronger statement, and item 83 of the ledger limits only
the October moment bank, which 11.50 does not need. The order of attack is `STATUS.md`, section 15, and
`MONOGRAPH.md`, chapter 3. The independent audit of 13 November 2026 (REP) advised treating K as a bounded research
programme with an explicit decision point, not as a near-complete route to an additional 0.0005; the A shell for Λ̂
(11.51), the odd sectors over remote cores (7.2.10), the all-sector trial bound (7.5.1) and the cover at ε = 299/400
(8.9) were proved after it.

## (d) Reading order

1. [`MONOGRAPH.md`](MONOGRAPH.md), chapters 0 to 3: the state of the problem.
2. [`STATUS.md`](STATUS.md): the evidence for each statement; its sections 13 (false statements) and 14 (routes that
   do not work) before trying anything.
3. The audits: `sources/audit-2026-11-13/REPORT.md` (the one-page verdict, sections 2, 4 and 5), then the audits of
   codex-a7c4 with the reviews by claude-b9ee archived in them: `sources/audit-2026-11-15-codex-a7c4/`,
   `reaudit-2026-11-15-codex-a7c4/`, `third-audit-…`, `fourth-audit-…`, `fifth-audit-…`, `sixth-audit-…`.
4. `sources/manuscript/MANUSCRIPT_DIGEST_K.md`: the October manuscript in 460 lines (the response-side constraints,
   the restricted forms K′ and K_rot, the negative results, everything known about the A shell).
5. Then by need:
   - a certificate or a family theorem: `sources/audit-2026-11-13/CERTIFICATE_AUDIT.md` and `record_audit.md`, then
     the proof in `sources/received-2026-11-05/<package>/`;
   - the A+B assembly: `sources/audit-2026-11-13/ASSEMBLY_AUDIT.md`, `improvement_joint_tail.md`, and the joint notes
     of the fourth and fifth audits (`JOINT.md`);
   - the numerics: `sources/audit-2026-11-13/KERNEL_DERIVATION.md`, `RUNS.md`, `code/audit-2026-11-13/`,
     `sources/numerics-kscan-2026-11-13/README.md`;
   - the remote part: `sources/audit-2026-11-15-codex-a7c4/REMOTE.md`, `remote_strong_PROOF.md`,
     `sources/manuscript/legacy/ch24-remote-diagonal.tex`, `ch32-stronger.tex`, `sources/d1/`,
     `sources/external-2026-11-15/remote-closure-report.md`;
   - the retained functional (K′, Λ̂ = Λ_P): `STATUS.md`, section 11; `sources/external-2026-11-15/REVIEW.md` and
     `sources/numerics-kprime-2026-11-15/README.md`; then `sources/received-2026-11-15-tilted-sector/`: `REVIEW_4.md`
     (what is proved and checked), `REPORT.md` with `deficit_dual_proof.md` and `deficit_moment_verify_proof.md`,
     and for the remainder step `REVIEW_3.md` with `REPORT_secant_history.md` and `secant_proof.md`; the earlier
     versions of the report with their reviews: `REVIEW.md` with `first-version/REPORT.md`, `REVIEW_2.md` with
     `REPORT_localization_history.md`. The October side: `sources/manuscript/legacy/ch20-pinned-gate.tex`,
     `ch17-crossbound.tex`, `ch25-parts/` and `sources/october-handoff/weak-k-2026-10-15/`;
   - the response side: the digest §1, `sources/manuscript/legacy/ch25-parts/`;
   - the deliveries that the index of section (e) does not cover (among them the joint premise (P), the odd sectors
     over cores with shells, the consumer at ε = 299/400, the radius and the content law): the rows of `STATUS.md`,
     whose tag table (section 0) names their folders;
   - how a claim came about: `sources/log/ASSESSMENT_2026-11-04.md` (chronological, 4 to 7 November),
     `sources/prompts/`, the monograph of 5 and 6 November with its errata
     (`sources/monograph-2026-11-05/MONOGRAPH_with_errata.md`) and the ledger with its dated passages
     (`sources/status-2026-11-15/STATUS_with_history.md`).

**Where the original paths now live.** The copied documents keep their original absolute links. A copy that cites
`MONOGRAPH.md` by section, or `STATUS.md` by its sections 13 to 15 or by a row that the current ledger does not
have, means the versions kept in `sources/monograph-2026-11-05/` and `sources/status-2026-11-15/`.

| original path (under `/Users/alingalatan/workspaces/grothe/handoff/`) | here |
|---|---|
| `research-degree5/CONJECTURE_K_MONOGRAPH.md` | `sources/monograph-2026-11-05/MONOGRAPH_with_errata.md` (below its marker line) |
| `research-degree5/ASSESSMENT_2026-11-04.md` | `sources/log/` |
| `research-degree5/MANUSCRIPT_DIGEST_K.md` | `sources/manuscript/` |
| `research-degree5/gpt-audit-2026-11-13/*.md` | `sources/audit-2026-11-13/` |
| `research-degree5/gpt-audit-2026-11-13/*.py`, `*.cpp`, small `*.json` | `code/audit-2026-11-13/` (JSON under `results/`) |
| `research-degree5/kscan-2026-11-13/` | `sources/numerics-kscan-2026-11-13/` (README), `code/kscan-2026-11-13/` |
| `research-degree5/tailgames-2026-11-14/` | `sources/numerics-tailgames-2026-11-14/` (README), `code/tailgames-2026-11-14/` |
| `research-degree5/external-2026-11-15/` (reports, package, `REVIEW.md`, `review/`) | `sources/external-2026-11-15/` |
| `research-degree5/kprime-2026-11-15/` | `sources/numerics-kprime-2026-11-15/` (README), `code/kprime-2026-11-15/` (scripts, logs, `search/`, `search3/`) |
| `research-degree5/gpt-tilted-sector-2026-11-15/` | `sources/received-2026-11-15-tilted-sector/` (reports, notes, result files), `code/tilted-sector-2026-11-15/` (verifiers, their inputs, probes). The folder held one version at a time: the copies are of the sixth version (06:06), with the fifth under the name `REPORT_secant_history.md`, the fourth under `REPORT_localization_history.md` and the first under `first-version/`; the verifiers of the first, second and fourth versions are in subfolders of `code/tilted-sector-2026-11-15/`, the fifth's is `verify_secant_history.py`. What the folder holds beyond the copies (five files above 300 KB): `INVENTORY.md` |
| `research-degree5/gpt-tilted-sector-2026-11-15-review/` | `sources/received-2026-11-15-tilted-sector/` (`REVIEW.md`, `REVIEW_2.md`, `REVIEW_3.md`, `REVIEW_4.md`), `code/tilted-sector-2026-11-15/` (scripts and logs). The scripts of REVIEW_4 were in a scratch folder of the reviewer's session, not here: `code/tilted-sector-2026-11-15/review4/` |
| `research-degree5/prompts-2026-11-15/` | `sources/prompts/` |
| `research-degree5/d1/` | `sources/d1/` (notes), `code/d1/` (scripts) |
| `research-degree5/k5/` | `sources/k5-2026-11-04/` (RESULTS.md), `code/experiments-2026-11-04/k5/` |
| `research-degree5/e*.py`, `shell_content.py`, `spike_content.py` | `code/experiments-2026-11-04/` |
| `research-degree5/ai-notes/*.txt` | `sources/prompts/` |
| `research-degree5/ai-notes/*.tex`, `*.md`, `<package>/**/*.md` | `sources/received-2026-11-05/` |
| `research-degree5/ai-notes/*.mjs` | `code/ai-thread-verifiers-2026-11-05/` |
| `research-third-decimal/…` | `sources/october-handoff/` |
| `research-third-decimal/gpt-reviews/weak-k-20261015/package/` (five notes) | `sources/october-handoff/weak-k-2026-10-15/` |
| `manuscript/README.md`, `stale-annotations.md`, `legacy/…`, three files of `new/` | `sources/manuscript/` |

## (e) Index: one line per file

This index covers 36 of the 137 top-level folders under `sources/` and `code/`: those assembled up to 15
November 2026. The later deliveries are indexed by [`STATUS.md`](STATUS.md) (the tag table of its section 0 and the
"where" cells of its rows) and by [`INVENTORY.md`](INVENTORY.md).

Sizes are those of the files in this folder. Descriptions of the notes are taken from the documents themselves
(title or opening words) unless a status is added; a status in this index is always the one in `STATUS.md`.

### `sources/monograph-2026-11-05/`: the monograph of 5 and 6 November with its errata

| file | size | contents |
|---|---:|---|
| `MONOGRAPH_with_errata.md` | 121 KB | `MONOGRAPH.md` at commit `854a512cd` (PR #419, 15 November 2026), with one provenance line added: the monograph of 5 and 6 November 2026 by claude-b9ee, verbatim below its marker line, under the errata sections A to I of 15 November. Its relative links are relative to `research/conjecture-K/`. Alias MON in `STATUS.md` (the text below the marker line). |

### `sources/status-2026-11-15/`: the ledger with its dated passages

| file | size | contents |
|---|---:|---|
| `STATUS_with_history.md` | 240 KB | `STATUS.md` at commit `854a512cd` (PR #419, 15 November 2026), with one provenance line added: the ledger with its dated passages, relabel notes, the version history of the tilted-sector report, the relation of each result to the October record, and section 14 (where the sources disagree, 59 items). Its relative links are relative to `research/conjecture-K/`. The current ledger keeps the IDs of its surviving rows. |

### `sources/sixth-audit-2026-11-15-codex-a7c4/`: sixth audit after merged #413

Its new proofs were re-derived, and its four checkers replayed, in the review of #419 by claude-b9ee (`STATUS.md`,
section 0); the completed tilted input and the peak corollary are inherited from the received tilted-sector package.

| file | size | contents |
|---|---:|---|
| `AUDIT.md` | 17,472 B | Findings, completed proofs, full-monograph coverage, review disposition, reproduction and bounded next work. |
| `FOUNDATIONS.md` | 11,113 B | Finite-dimensional retained diffusion bound and Gaussian benchmark sharpness; no limit/infimum interchange (`STATUS.md` 2.14). |
| `JOINT.md` | 11,009 B | Both real Q/ν Hessian kernels, conditional-centering cancellation and a finite genuine-cubic witness (`STATUS.md` 7.2.5). |
| `OBSTRUCTION.md` | 6,432 B | Re-derived Gaussian-marginal obstruction and explicit noncubic excess >7·10⁻⁷ (`STATUS.md` 6.5.1). |
| `PR413_FEEDBACK.md` | 1,372 B | Initial coordination comment and format decision; the subsequent mathematical review is archived separately. |
| `REVIEW_413_claude-b9ee.md` | 3,631 B | Verbatim post-merge Claude approval of #413, its re-derivations/replays, exclusions and corrections. |
| `REMOTE.md` | 12,338 B | Full peak retained A-core corollary, strict failure of retained homogeneity and the profile transfer (`STATUS.md` 3.17, 11.51, 11.53). |

### `code/sixth-audit-2026-11-15-codex-a7c4/`: sixth audit after merged #413

Read-only by default; use `python3 -I`. Saved JSON is output, not acceptance input. Only the obstruction
checker needs python-flint; its documented option points to the existing dependency installation.

| file | size | contents |
|---|---:|---|
| `diffuse_retained_exact.py` | 3,605 B | Exact block moments, Gaussian score moment and explicit diffusion constants; standard library. |
| `diffuse_retained_exact_result.json` | 976 B | PASS output of the finite-dimensional diffusion arithmetic. |
| `gaussian_obstruction.py` | 3,802 B | Fresh A-kernel derivatives and direct Rice benchmark replay; finite obstruction acceptance. |
| `gaussian_obstruction_result.json` | 1,302 B | PASS output: explicit positive excess and hashes of reused code. |
| `odd_coupling.py` | 3,627 B | Exact radial recurrences and analytic remainder acceptance for both Q/ν channels. |
| `odd_coupling_result.json` | 1,582 B | PASS output: opposite signs at the genuine cubic of energy 10⁻⁶. |
| `retained_profile_transfer.py` | 4,959 B | Exact peak/profile error budgets, scaled energy cutoff and changed multiplier cost. |
| `retained_profile_transfer_result.json` | 1,586 B | PASS output of the full peak and continuum-profile corollaries. |

### `sources/fifth-audit-2026-11-15-codex-a7c4/`: fifth audit after merged #409

The #413 review re-derived the fifth-pass arguments and replayed its three checkers, within the exclusions
archived in the sixth-audit review. The original notes keep their historical author labels.

| file | size | contents |
|---|---:|---|
| `AUDIT.md` | 16,143 B | Findings, completed results, whole-monograph coverage, #409 review disposition and bounded next work. |
| `FOUNDATIONS.md` | 11,403 B | Retained trial and symmetry; remote equality criterion; strict genuine-cubic family and exact finite gap. |
| `JOINT.md` | 12,761 B | Complete joint-tail reduction, exact old inputs, shift cutoff 2.9, local spectral enclosures. |
| `REMOTE.md` | 12,453 B | Augmented retained A-core covers: all tensors u≤.021, and χ≤.25 up to .0463; fixed-bank limitation. |
| `REVIEW_409_claude-b9ee.md` | 5,049 B | Exact archived review of #409 with reviewed head, approval, exclusions and requested provenance fixes. |

### `code/fifth-audit-2026-11-15-codex-a7c4/`: fifth-audit checkers and full replay outputs

All default `python3 -I` runs are read-only and reproduce the adjacent JSON. No Lean build is involved.

| file | size | contents |
|---|---:|---|
| `joint_tail.py` | 7,393 B | Exact density cells, Gaussian tail reserves, angular shift estimate and local spectra; read-only. |
| `joint_tail_result.json` | 5,023 B | PASS; three-row constants, cutoff2.9, reserve .007, density/tail/spectral witnesses. |
| `remote_augmented.py` | 7,860 B | Fresh Arb Hermite inputs and exact Bernstein continuum acceptance; read-only by default. |
| `remote_augmented_result.json` | 19,083 B | PASS; 17 polynomials, 34 profile nodes, 33 leaves, exact margins and source hashes. |
| `retained_remote_exact.py` | 3,272 B | Exact derivative budgets, moments and strict raw-minus-retained witness; standard library, read-only. |
| `retained_remote_exact_result.json` | 844 B | PASS; explicit peak projection/gap and all rational budgets. |

### `sources/fourth-audit-2026-11-15-codex-a7c4/`: fourth audit after #403 and #408

New notes/checkers; prior sources remain unchanged. New author proofs await external review.

| file | size | contents |
|---|---:|---|
| `AUDIT.md` | 16,914 B | Fourth-pass findings, completed partial results, full-monograph coverage, review disposition and next work. |
| `CONTENT.md` | 11,975 B | Re-derived second-moment shared-A theorem, larger affine cone and certified continuum strips. |
| `JOINT.md` | 14,242 B | Three-row .08 local A/B reserve, shift tail from 17/4, exact .300 and pointwise five-sector obstructions. |
| `REFORMULATIONS.md` | 12,017 B | Correct remote equivalences, BNC scope, SEI counterexample and repaired closure, diffuse attainment. |
| `REMOTE.md` | 15,780 B | One-sided profile rectangle, direct Rice and Bernstein audit, central near-Gaussian tilted-A subclass. |
| `REVIEW_403_claude-b9ee.md` | 4,850 B | Archived independent approval of #403, re-derived/replayed items and explicit exclusions. |


### `code/fourth-audit-2026-11-15-codex-a7c4/`: fourth audit after #403 and #408

New notes/checkers; prior sources remain unchanged. New author proofs await external review.

| file | size | contents |
|---|---:|---|
| `bernstein_crosscheck.py` | 3,337 B | Independent rational reverse expansion of all six third-audit Bernstein cell polynomials. |
| `bernstein_crosscheck_result.json` | 1,528 B | PASS: polynomial reconstruction, positivity and exact controls. |
| `joint_reduction.py` | 6,134 B | Exact local matrix, all-amplitude large-shift potential and joint-margin checks. |
| `joint_reduction_result.json` | 4,172 B | PASS: local reserves, shift-tail bounds, .300 and pointwise five-sector obstructions; scan normalization. |
| `reformulations_exact.py` | 1,323 B | Exact SEI counterexample and scalar consistency checks. |
| `reformulations_exact_result.json` | 325 B | PASS: sum variance, interval radius and positive SEI violation ≥91/18000. |
| `remote_profile_transfer.py` | 4,351 B | Exact support-plane profile-transfer budget and central tilted-A subclass. |
| `remote_profile_transfer_result.json` | 1,658 B | PASS: normalized rectangle error below 1e−4 and central χ≤.07 excess below 2e−5. |
| `shared_a_second_moment.py` | 7,145 B | Exact circular mean, radial integrals and finite integral acceptance for three unbounded strips. |
| `shared_a_second_moment_result.json` | 2,383 B | PASS: .00558+.31907w cone and .0206/.0208/.02105 strip boundaries. |

### `sources/third-audit-2026-11-15-codex-a7c4/`: third audit after reviewed PR #399

New research only; all earlier sources remain unchanged. The independent review of these results is archived in
`../fourth-audit-2026-11-15-codex-a7c4/REVIEW_403_claude-b9ee.md`; its exclusions remain explicit.

| file | size | contents |
|---|---:|---|
| `AUDIT.md` | 12,621 B | Third-pass findings, completed targets, full-monograph sweep and trust boundaries. |
| `ALIGNMENT.md` | 9,913 B | Global peak .007 kernel certificate and exact conditional signed budget. |
| `CONTENT_KERNELS.md` | 21,739 B | Complete monotonicity of both kernels; derivative envelopes; D/90 neighbourhood. |
| `POTENTIAL.md` | 11,541 B | Elementary Gaussian/Bessel derivations and stronger full-box disjoint cost. |
| `SECTORS.md` | 14,244 B | Raw P-axis cost, exact retained equality, sharp retained d-axis and Q counterexample. |


### `code/third-audit-2026-11-15-codex-a7c4/`: third audit after reviewed PR #399

New research only; all earlier sources remain unchanged. See AUDIT for proof and replay boundaries.

| file | size | contents |
|---|---:|---|
| `kernel_alignment.py` | 5,853 B | Arb endpoints and derivative moments; exact continuum cover and infinite tail. |
| `kernel_alignment_result.json` | 19,742 B | PASS: 79 cells, 80 nodes, whole peak v≥0 comparison below .007. |
| `alignment_budget.py` | 1,749 B | Exact conditional signed A/B excess below .000051525. |
| `alignment_budget_result.json` | 601 B | PASS: rational Schur complement, norms and excess budget. |
| `content_kernels_exact.py` | 6,362 B | Positive derivative formulas, exact moments through order four and D/90 budget. |
| `content_kernels_exact_result.json` | 3,306 B | PASS: three-row moments, off-character weight and conditional extension. |
| `potential_bounds.py` | 3,974 B | Exact polynomial premises for sharper inverse-radius kernel estimates. |
| `potential_bounds_result.json` | 945 B | PASS: 147/125 global bound and 2/5 far-field coefficient. |
| `potential_full_box.py` | 4,157 B | Updated exact full-box disk cover using existing audited interval helpers. |
| `potential_full_box_result.json` | 566 B | PASS: potential below 1.97, uniform disjoint cost≥3/152. |
| `sector_axis_costs.py` | 3,707 B | Exact P-axis and retained odd-block/n=1 scalar bounds and retained Q witness. |
| `sector_axis_costs_result.json` | 2,625 B | PASS: .41 P cost, .39242 retained d cost and retained Q gain>7e−6. |


### `sources/reaudit-2026-11-15-codex-a7c4/`: second full-monograph audit

New research after PR #397; no historical source was edited. Reproduction and scope are in the new audit report.

| file | size | contents |
|---|---:|---|
| `AUDIT.md` | 15,559 B | Second-pass findings, full section coverage, completed improvements and trust limits. |
| `FOUNDATIONS.md` | 15,161 B | Response-region corrections, re-derived energy caps, retained dual and exact central budget. |
| `CONTENT.md` | 7,162 B | Conditional mixed-character extension widened from .006D to .01D. |
| `REMOTE.md` | 18,103 B | All-amplitude disjoint cost; direct Rice benchmark; mesh-density and convex-cell transfer. |
| `SECTORS.md` | 13,666 B | Sharp odd costs, explicit cubic counterexamples, parity and matrix scope corrections. |
| `REVIEW_claude-b9ee.md` | 5,997 B | Review by claude-b9ee (approve, no error found): replayed, re-derived, tested, not checked; the reviewer's changes. |

### `code/reaudit-2026-11-15-codex-a7c4/`: second full-monograph audit

New research after PR #397; no historical source was edited. Reproduction and scope are in the new audit report.

| file | size | contents |
|---|---:|---|
| `foundations_exact.py` | 4,574 B | Exact Rice tangent, response energies and conditional central endpoint budget. |
| `foundations_exact_result.json` | 2,723 B | PASS: exact regional caps, response counterexample and central allowance. |
| `content_constants.py` | 3,604 B | Exact scalar/partial-fraction check for the larger content neighbourhood. |
| `content_constants.json` | 903 B | PASS: sharpened kernel constants and .01D extension budget. |
| `sectors_exact.py` | 3,203 B | Exact finite-amplitude odd-cost witnesses and sharp n=1 constant. |
| `sectors_exact_result.json` | 1,032 B | PASS: corner gain, false .36 flank cost and sharp full-box n=1 enclosure. |
| `remote_disjoint_cost.py` | 6,047 B | Independent dyadic full-box disjoint-cost verifier, including infinite scale ray. |
| `remote_disjoint_cost_result.json` | 415 B | PASS: 12 profile/278 scale intervals and uniform cost ≥1/152. |
| `remote_benchmark_crosscheck.py` | 3,540 B | Independent direct I0/I1 Arb Gaussian benchmark and support gradients. |
| `remote_benchmark_result.json` | 1,020 B | PASS: peak S enclosure and explicit Gaussian supporting plane. |
| `review_claude-b9ee_spot_checks.py` | 6,428 B | Reviewer's floating-point recomputation of the main numbers by plain quadrature (N). |
| `review_claude-b9ee_spot_checks.log` | 2,589 B | Output of the script above: every number agrees with the audit. |

### `sources/audit-2026-11-15-codex-a7c4/`: bounded follow-up audit

New audit material; historical archive copies are explicitly marked. Check commands and trust limits are in the new `AUDIT.md`.

| file | size | contents |
|---|---:|---|
| `AUDIT.md` | 11,833 B | Findings, completed results, status/novelty boundaries, checks and next work. |
| `CLAIMS.md` | 18,578 B | Section-by-section coverage, two explicit lost-independence counterexamples, finite kernel replay. |
| `ODD_COST.md` | 5,400 B | Zero-core odd costs; uniform one-coordinate theorem on the whole application box. |
| `REMOTE.md` | 23,463 B | October package audit, peak certificate bridge, profile tube and disjoint-driver consequence. |
| `REVIEW_claude-b9ee.md` | 7,001 B | Review by claude-b9ee (approve): what was replayed, re-derived, tested and not checked; the changes the reviewer made. |
| `SECTORS.md` | 14,228 B | Independent sector numerics, full complex local matrix, error assembly and Gaussian tail. |
| `remote_INHERITED_COVARIANCE.tex` | 7,292 B | Verbatim covariance input, with provenance; independent re-derivation in REMOTE. |
| `remote_strong_PROOF.md` | 17,938 B | Verbatim October proof of the peak remote 3.6e-7 certificate, with provenance line. |


### `code/audit-2026-11-15-codex-a7c4/`: bounded follow-up audit

New audit material; historical archive copies are explicitly marked. Check commands and trust limits are in the new `AUDIT.md`.

| file | size | contents |
|---|---:|---|
| `claims_exact.py` | 3,479 B | Standard-library exact scope-witness, budget and countermodel checks. |
| `claims_exact_result.json` | 845 B | PASS: finite rational support for CLAIMS. |
| `claims_kernels.py` | 4,083 B | Standalone Arb enclosures at specified kernel points; no continuum claim. |
| `claims_kernels_result.json` | 2,211 B | PASS: endpoints and selected shifts, with balls and precision. |
| `odd_cost_check.py` | 4,753 B | Standard-library rational interval certificate for three-row odd costs and full-box n=1. |
| `odd_cost_result.json` | 1,437 B | PASS: cost and optimum enclosures; uniform n=1 cost 3/20. |
| `remote_legacy_replay.log` | 2,664 B | Small cited record of weaker-package algebra replay. |
| `remote_legacy_replay.py` | 3,123 B | Read-only ZIP adapter for weaker October acceptance; conditional on stored grids. |
| `remote_legacy_result.json` | 792 B | PASS conditional on stored grids; archive and script hashes. |
| `remote_rational_audit.py` | 4,881 B | Independent Stein cut identities, cover slicing, five rejection controls and tube budget. |
| `remote_rational_result.json` | 562 B | PASS: exact identities, cover, controls and profile-transfer allowance. |
| `remote_replay.log` | 2,425 B | Small cited record of full fresh-integral acceptance and benchmark. |
| `remote_replay.py` | 2,503 B | Isolated-mode wrapper for unchanged stronger acceptance scripts; optional explicit flint path; saves its record only with `--write-result`. |
| `remote_replay_all.json` | 975 B | Full PASS metadata, dependency version and eight original input hashes. |
| `review_claude-b9ee_stein_inputs_check.log` | 444 B | N: output of the script below (42 tensors, all inequalities hold). |
| `review_claude-b9ee_stein_inputs_check.py` | 4,196 B | Reviewer's numerical test of the structural inputs of the Stein certificate on two-variable cubics. |
| `remote_stein_original/benchmark.py` | 2,592 B | Verbatim original Arb Gaussian benchmark enclosure. |
| `remote_stein_original/check_stein.py` | 2,783 B | Verbatim original exact half-line Stein acceptance. |
| `remote_stein_original/exact.py` | 1,641 B | Verbatim original exact polynomial and Bernstein utilities. |
| `remote_stein_original/moment-boxes.json` | 55,551 B | Verbatim 154 outer moment rectangles and witnesses. |
| `remote_stein_original/profile-caps.json` | 22,383 B | Verbatim 68 profile-majorant witnesses and tail. |
| `remote_stein_original/profile.py` | 2,100 B | Verbatim original Arb profile integrator; fresh acceptance input computation. |
| `remote_stein_original/stein-nodes.json` | 240,483 B | Verbatim 45 central Stein-node witnesses. |
| `remote_stein_original/verify.py` | 3,671 B | Verbatim original full fresh-integral/cover/benchmark verifier. |
| `sector_constants.json` | 1,481 B | PASS: exact scalar bounds, including eigenvalue >0.477. |
| `sector_constants.py` | 4,299 B | Standard-library rational intervals for local retained matrix, tilt roots and tail. |
| `sector_numerics.json` | 16,670 B | N: four energies, three quadrature orders, gradients and gains. |
| `sector_numerics.py` | 4,970 B | Independent direct-norm quadrature and stationary saddle solve; N only. |


### `sources/audit-2026-11-13/`: the independent audit (codex-a713, 13 November 2026)

Reference for every status in `STATUS.md`. Read `REPORT.md` first. The folder holds two audits under the same agent ID, and each says it does not adopt the other's files: the main audit (`REPORT.md` and the files marked "main audit") and a second audit run separately (`independent-pushforward-audit/REPORT.md` with three supplements). They agree on the verdicts. The `improvement_*` files and `IMPROVEMENT.md` were written by the same agent after the audit.

18 files, 274 KB.

| file | size | contents |
|---|---:|---|
| `ADDITIONAL_ANALYTIC_AUDIT.md` | 20 KB | Main audit. Gate-free row re-derived; Theorem A reconstructed; Theorem B checked; the two disjoint-driver arguments; remote K-a (reduction, numerical scope, Lean provenance); near-Gaussian coverage overstated; status ledger. |
| `ASSEMBLY_AUDIT.md` | 20 KB | Main audit. Sector assembly. Which A-content constants suffice under which joint hypothesis; exact countermodel to the inference from separate costs; B-cost, parity, all-shift infinitesimal theorem and J3 audit checked; further errors; the recommended next target. |
| `CERTIFICATE_AUDIT.md` | 25 KB | Main audit. Certificate-to-theorem audit of the family content theorems: quadratic moment theorem, Gaussian-factor 0.239, reweighted 0.22 (end-to-end replay), Hermitian self-interaction 0.23 (conditional), Wick endpoint p ≤ u/5, the saddle, the u ≤ 0.00038 claim, shell bookkeeping. |
| `IMPROVEMENT.md` | 9.5 KB | After the audit, by the same agent: the cover improvement K_G^ℂ > 1.401697318640 (exact rational arithmetic outside Lean; independent of K) and two partial results toward K (joint-tail reduction, content extension). |
| `KERNEL_DERIVATION.md` | 10 KB | Main audit. The full Wick basis of H₂,₁(ℂⁿ) (correcting the dimension given in the task statement), the kernels φ and g with stable derivatives, the gradients, deterministic calibrations (Wick monomial 0.087565304234 at u = 0.0463). |
| `NUMERICAL_N2_N4.md` | 7.6 KB | Experiment of the main audit: report of the worker that ran dimensions 2 and 4 of the full-tensor experiment, with the structure of the selected tensors. Computations, not bounds on the supremum. |
| `NUMERICAL_REVIEW.md` | 9.0 KB | Experiment of the main audit, source review: the stopping defect of the first optimiser and its repair, what the error bars mean, the wording the report must use. |
| `REPORT.md` | 34 KB | Main audit, main report. One-page verdict; ledger with the status of each claim (section 1); verdicts on four concerns (2); twelve incorrect or stale statements (3); the constants that would suffice for A+B and the missing joint remainder bound (4); full-tensor experiment, n = 2…6 (5); reproducibility (6). |
| `RESULTS.md` | 2.4 KB | Experiment of the main audit: table of the 15 selected candidates with their integration errors and the run counts (written by `summarize_results.py`). |
| `RUNS.md` | 7.8 KB | Main audit, reproduction record: environment, seeds, the command of each stage of the experiment and of the certificate replays. |
| `diffuse_asymptotic.md` | 13 KB | Second audit, supplement on large dimension and the diffuse boundary: with an independent Gaussian buffer C²/D tends to 0 linearly in the structured share (P), constants at the peak row (N), genuine diffuse cubics; what this does not prove. |
| `improvement_bound_review.md` | 9.9 KB | Review of the cover improvement: what was checked and in which arithmetic, replay table of the versions v1, v3, v5 and v6, caveats. |
| `improvement_content_extension.md` | 10 KB | After the audit: lemma (P), peak row, every dimension: a core p with C(p)² ≤ (9/40)D(p), plus any remainder h of the other circle characters with ‖h‖² ≤ (3/500)D(p), satisfies C(p+h)² ≤ (6/25)D(p+h). The core inequality is an input. |
| `improvement_cover_method.md` | 13 KB | Method and generation commands of the cover improvement, stage by stage (v1 to v6), against commit 32cfb7d87. |
| `improvement_joint_tail.md` | 11 KB | After the audit: reduction (P) of the finite-amplitude joint A/B remainder bound to the compact box 0 ≤ x ≤ 6, \|α\|, \|β\| ≤ 0.4 with reserve 7.53·10⁻⁵ (signed form 8.07·10⁻⁵); the box inequality itself is open. |
| `independent-pushforward-audit/REPORT.md` | 33 KB | The second audit, run separately in the same folder (labels P / N / R): logic of "content plus cost", certificate implications, the A+B budget, the kscan optimiser, deterministic values on ℂ² (0.0876025944), large-dimension asymptotics, stale statements. Its supplements are `record_audit.md`, `diffuse_asymptotic.md` and `optimizer_audit.md`. |
| `optimizer_audit.md` | 15 KB | Second audit, by its optimiser sub-agent: formula and code audit of `kscan.py` and `tables.py` (formulas correct, seven implementation limitations), an independent deterministic search over all of H₂,₁(ℂ²), and why the scan's 0.0892 is not supported. The main report adopts from it only the candidate polynomial. |
| `record_audit.md` | 24 KB | Second audit, supplement on the record. Corrected budget arithmetic (exact threshold κ ≤ 4889900/47482107 under the adverse joint hypothesis); quantifiers of "content plus cost"; certificate checks (A-cost, B-cost, XP, Gaussian-factor, Hermitian); why the families do not assemble; obligations of L5 and L6; six stale statements. |

### `sources/log/`: the running log (claude-b9ee, 4 to 7 November 2026)

1 files, 155 KB.

| file | size | contents |
|---|---:|---|
| `ASSESSMENT_2026-11-04.md` | 155 KB | The chronological log, 45 sections, 4 to 7 November 2026: where a better bound can come from, the degree-5 route, then every claim on K with its verification. Dated; superseded by `STATUS.md` where the audit disagrees (sections 31, 33, 44, 45). |

### `sources/numerics-kscan-2026-11-13/`: global search of the ratio C²/D (claude-b9ee, 13 November 2026)

1 files, 2.4 KB.

| file | size | contents |
|---|---:|---|
| `README.md` | 2.4 KB | Question, method, calibration and tables of the global search of C²/D over all of H₂,₁(ℂⁿ), n = 2…10 (840 runs and a second pass with 2²² samples). Floating point (N). |

### `sources/numerics-tailgames-2026-11-14/`: games with an identity tail (claude-b9ee, 14 November 2026)

1 files, 7.4 KB.

| file | size | contents |
|---|---:|---|
| `README.md` | 7.4 KB | The identity-tail device (witness (1, −ε, ν, ν, …)), the potential Ψ_ν and its dual formula, model norms (cubic head with tail: 0.713021, ceiling 1.402483), second variations, and five ideas tested and refuted the same day. Floating point (N). |

### `sources/external-2026-11-15/`: two reports received on 15 November 2026, and their review

The reports as received (transcripts), the package of the first one, and the review by claude-b9ee of the same day. Verification record: see REVIEW.md in this folder; its scripts and logs are in `review/`. The package of the second report was not received. Statuses: `STATUS.md`, 2.10a, 3.16, 11.2 to 11.11.

16 files, 53 KB.

| file | size | contents |
|---|---:|---|
| `REVIEW.md` | 8.3 KB | Verification record of the two reports (claude-b9ee, 15 November): what was re-derived, replayed and tested for each item, what the October manuscript already had, the first numbers with the retained element optimised together with the A-sector (N), remarks on the remote-closure report, next steps. The copy is of 04:15: its author corrected the wording after the audit of codex-a7c4 ("numerical" for "exact", the remote part as Λ(q) ≤ S + η_R) and added that the remote cap is now certified at the peak row. |
| `projection-attack-package/README.txt` | 1014 B | The package's own summary and scope ("rigorous partial progress; no improved numerical Grothendieck bound"). |
| `projection-attack-package/proofs.tex` | 14 KB | The written proofs: penalised support duality and the row with Λ̂ (Theorem 1), Lipschitz lemma, global retained-projection bound (Theorem 3), local Schur-complement matrix (Theorem 4), a necessary maximiser condition, the counterexample (Proposition 5). |
| `projection-attack-package/results.txt` | 1.4 KB | Output of the package's verifier as received (Arb enclosures of j₀, g₀, d₀, the matrix entries, the counterexample integral). |
| `projection-attack-package/verify.py` | 4.0 KB | The package's verifier (python-flint, rational arithmetic and Arb balls). |
| `projection-attack-report.md` | 2.5 KB | Transcript of the report "retaining the first-chaos penalty": the functional Λ̂, the global bound for remote q, the local A/B cost matrix at G = 0, a counterexample to a positivity shortcut. |
| `remote-closure-report.md` | 5.3 KB | Transcript of the report "remote closure": claims (1) to (3) for remote cubics and a sixth-moment bound with the factor θ; a second message on the upper bound. Package not received; nothing checked (R). |
| `review/ratio_form.log` | 458 B | Its output: visible profile ratio 0.25568 (peak row 0.25608), supremum over Gaussian q 0.7131355 at E\|q\|² = 0.05723, values at larger energies. |
| `review/ratio_form.py` | 1.6 KB | Check of the normalisation of the remote-closure report: Φ at Gaussian remote q and its supremum. |
| `review/retained_content.log` | 872 B | Its output. Byte-identical to `code/kprime-2026-11-15/retained_content.log`. |
| `review/retained_content.py` | 2.1 KB | The Wick monomial with the A-sector, with and without the retained element. Byte-identical to `code/kprime-2026-11-15/retained_content.py`. |
| `review/retained_joint.log` | 756 B | Its output. Byte-identical to `code/kprime-2026-11-15/retained_joint.log`. |
| `review/retained_joint.py` | 2.5 KB | The Wick monomial with the A- and B-sectors jointly. Byte-identical to `code/kprime-2026-11-15/retained_joint.py`. |
| `review/review_check.log` | 1.9 KB | Its output: the integrals by quadrature and in closed form, both matrices, finite differences at s = 0.02, 0.01, 0.005 in four directions, the global inequality at six amplitudes (margins 1.5·10⁻⁸ to 2.7·10⁻²). |
| `review/review_check.py` | 4.3 KB | Independent floating-point check of the first report: the scalar integrals and the local A/B matrices, the local expansion by finite differences of the exact functional (one driver, real coefficients), the global inequality on Wick monomials. |
| `review/verify_replay.log` | 1.6 KB | The package's `verify.py` replayed by the recipient with python-flint 0.9.0. Its 21 result lines are identical to `projection-attack-package/results.txt` (compared again when this folder was assembled). |

### `sources/numerics-kprime-2026-11-15/`: the retained first-chaos penalty optimised together with the sectors (claude-b9ee, 15 November 2026)

The numerical follow-up of the review. The copy shows the write-up as it stood at the time given in its provenance line (15 November, 05:01): its author corrected the wording after the audit of codex-a7c4, put the final state of the three-variable search into section 8 and added section 12. Statuses: `STATUS.md`, section 11 (c), and 11.45.

1 files, 23 KB.

| file | size | contents |
|---|---:|---|
| `README.md` | 23 KB | Write-up of the follow-up: setting, what the record has, the tilted sector (statement with proof, local cost, content profile), numerically optimised values on the Wick monomial, the searches over all tensors in two and in three remote variables, a fixed tilt, the structured family with a bath, the second derivative at restricted amplitude, Cauchy–Schwarz, and (section 12) the global quadratic bound of the remainder at a remote base, for one sector, for A and B together and for all sectors. The summary table of its section 0 names the energies 0.02 and 0.0463 for three variables, while section 8 has 0.03 as well, where the largest ratio was found. Statuses: `STATUS.md`, section 11 (c) and 11.37, 11.45. |

### `sources/received-2026-11-15-tilted-sector/`: the report on the tilted sector (codex-6e2b, 15 November 2026, six versions) and the reviews of its first, second, fifth and sixth versions

The answer of an external assistant (agent ID codex-6e2b) to the request to prove the sector lemma behind `STATUS.md`, 11.12 to 11.20, at the tilt 3/5. The first five versions do not prove the lemma on the range that matters, and say so; the fifth reduces it to one inequality, and **the sixth proves that inequality and with it the lemma** (`STATUS.md` 11.49 to 11.52). Its author revised the report in place five times, and the working folder held one version at a time. The files at the top level are the sixth version (06:06), with the notes, probes and result files of the earlier versions that the folder still held; `REPORT_secant_history.md` is the fifth version (05:17), `REPORT_localization_history.md` the fourth (04:40), both kept by the author under those names, and `first-version/REPORT.md` the first (03:23). The second and third versions of the report were overwritten. `REVIEW.md`, `REVIEW_2.md`, `REVIEW_3.md` and `REVIEW_4.md` are the reviews by claude-b9ee of the first, the second, the fifth and the sixth version. The verifiers, their inputs, the probes and the scripts and logs of the reviews are in `code/tilted-sector-2026-11-15/` (the documents say "beside this file" or link to the same folder for them). Five JSON files above 300 KB stay in the working folder. The documents are Markdown with LaTeX formulas. The prompt that produced the report was not kept in a file. Hashes of the copies, and what the working folder held beyond them: `INVENTORY.md`. Statuses: `STATUS.md`, section 11 (b).

106 files, 1.5 MB.

| file | size | contents |
|---|---:|---|
| `REPORT.md` | 13 KB | "Tilted sector lemma: complete range u ≤ 0.0463", **the sixth version** (06:06): the content-to-deficit inequality ‖c_{3/5}(q)‖² ≤ (3/10)·D₊(q) + 6·10⁻⁶ on the whole range and with it the lemma with κ = 56730/59009, η = 5673/295045000 (head); the inherited inputs (section 1); the ten energy-dependent content coefficients (2); the cover of 178 rectangles by moment caps and Stein duals, with the energy interpolation and the exempt boxes (3); the assembly (4); reproducibility and history (5). Labels P, C, N, O by its author. Reviewed in `REVIEW_4.md`. `STATUS.md` 11.49 to 11.52. |
| `REPORT_localization_history.md` | 42 KB | "Tilted sector: proved partial results and exact remaining obligations", **the fourth version** (04:40), which its author kept under this name beside the fifth; byte-identical to the copy of `REPORT.md` taken at 04:40. Keeps the reviewed results (sections 2.2, 2.3, 3.1, 3.2, 3.3.1, 3.4, 4.1, 4.2) and adds: a sharpened global bound and the radius 0.371 (2.3, 2.4); the lemma for u ≤ 0.001123 and u ≤ 0.00173 (2.5, 2.6); the content bounds (2/25)·δ, (19321/10⁶)·u, 1/2500 and 3·δ^{3/2} (3.3); the curvature inequality (4.3); the localisation of every maximiser below 0.085 and the assembly with κ = 50/53 (5.1). Its sections 2.3 to 2.5, 3.3 (first two bounds) and 4.3 are what `REVIEW_2.md` covers; the rest of its new material is not reviewed. TILT-4 in `STATUS.md`. |
| `REPORT_secant_history.md` | 11 KB | "Tilted sector: global secants and stronger structural content", **the fifth version** (05:17), which its author kept under this name beside the sixth; byte-identical to the copy of `REPORT.md` taken at 05:17: the global remainder bound Rem ≤ (13/20)·\|ρ\|² and with it 𝒥 ≤ C²/k (section 2); the content coefficient 1077659/27000000 on 0.03 ≤ u ≤ 0.0463 (3); the classes on which the lemma holds and the inequality (5) left open (4); evidence, replay and history (5). Reviewed in `REVIEW_3.md`. TILT-5 in `STATUS.md`. |
| `REVIEW.md` | 6.7 KB | Review of the first version by claude-b9ee, 15 November 03:31, with an erratum added at 04:40: verdict; a table of what was re-derived, replayed or tested, item by item; what the report is worth, with a table of how far the structural bound is from sufficient on the Wick monomial and remarks on the three statements then open; what to ask for next. The erratum corrects the figures of that table; see also `sources/status-2026-11-15/STATUS_with_history.md`, section 14, items 41 and 42. |
| `REVIEW_2.md` | 11 KB | Review of the second version (state of 04:05) by claude-b9ee, 15 November 04:40, with an addendum of the same evening (section 7): what was replayed and re-derived, claim by claim; a correction to the first review; why the localisation of the maximiser cannot be reached from the reviewed inequalities and is not needed if the remainder has a global quadratic bound (numerically it has: 0.600 against the budget 0.962); the content against the deficit on a family of tensors (the certified chain closes with no margin); what to ask for next. The addendum: that remainder is the one of the note of 13 November (`STATUS.md` 7.4.5), its numerical bound for A and B together and with the odd sectors, and a cheaper way to sharpen the content bound. |
| `REVIEW_3.md` | 6.9 KB | Review of the fifth version (state of about 05:10) by claude-b9ee, 15 November 05:29: verdict ("correct as far as I checked, and a real step"); what was re-derived, replayed or computed, claim by claim, and what was not read; the replay of the whole verifier (pass, the same counts as the run of its author); what is left, the inequality (5), and a route to it through an augmented remote certificate; then the B-sector and the odd sectors. |
| `REVIEW_4.md` | 5.2 KB | Review of the sixth version (state of 06:07) by claude-b9ee with a reviewer agent of the same session, 15 November 06:38: verdict ("sound as far as checked; the claim stands as P + C"); the replay (the full verifier, and the deficit chain in a copy with the repository layout); what was re-derived; independent numerics on about 1,600 cubics; five findings, none blocking; what is still open for K′. Its scripts and two logs are in `code/tilted-sector-2026-11-15/review4/`. |
| `content_next_m3_proof.md` | 5.7 KB | Note of the fourth version: "Scalar third-derivative certificate", the Arb certificate of sup \|m‴\| < 13 for m(x) = E[(T − 2/5)·sign(Re L + x)], the scalar input of the bound 3·δ^{3/2} of `content_tensor_next.md`. Not reviewed. |
| `content_next_m3_results.txt` | 39 KB | Output of `content_next_m3.py` (JSON lines): the enclosures behind sup \|m‴\| < 13. |
| `content_next_profile_table.json` | 67 KB | The profile table written by `content_next_bound.py` (third version): 300 cells of the tilted profile. The fifth version no longer reads it: its replay recomputes the profile from the regenerated radial table (`secant_profile_dual.py`). |
| `content_next_proof.md` | 6.4 KB | Note of the third version: "A Gaussian-probe bound on tilted content", ‖Π₁[q·h_{3/5}(\|q\|²)]‖ ≤ 1/50 for remote cubics of energy at most 0.0463, with its Arb certificate. Not reviewed (`REVIEW_3.md`: not read). |
| `content_next_results.txt` | 1.6 KB | Output of `content_next_bound.py` (JSON lines): the dual certificate with its upper bound 0.0198. |
| `content_profile_proof.md` | 17 KB | Note of the second version: "A certified structural bound for the tilted content", ‖c_{3/5}(q)‖² ≤ (2/25)·δ through a sharper Stein budget, a Gaussian resolvent with shift 1/3 and the certified bound sup N_Φ < 1/3; a uniform bound on the content. Reviewed in `REVIEW_2.md`. |
| `content_profile_results.txt` | 46 KB | Output of `content_profile.py` (JSON lines): 111 interval boxes for the Hessian norm of the tilted profile and the tail bounds. |
| `content_tensor_next.md` | 11 KB | Note of the fourth version: "A third-order tensor bound for the nonlinear tilted content", ‖c_{3/5}(q)‖² ≤ 3·δ^{3/2}, from a theorem for the real third chaos and the certified bound sup \|m‴\| < 13. It says that it also proves the leading tensor bound of `STATUS.md` 6.3.12. Its sections 1 and 2 were re-derived in `REVIEW_3.md`; the rest is not reviewed. The copy is of 05:11 (one reference renamed for the fifth version). |
| `deficit_angular30_results.txt` | 221 B | The same for the envelope starting at 3/100 (coefficient 3/80). |
| `deficit_angular35_results.txt` | 221 B | The same for the envelope starting at 7/200 (coefficient 71/2000). |
| `deficit_angular44_results.txt` | 221 B | The same for the envelope starting at 11/250 (coefficient 13/400). |
| `deficit_angular_proof.md` | 8.2 KB | Note of the sixth version: "Sharper angular content constants from the absolute scalar envelopes", the one-switch reduction of the angular norm and its interval check, behind the last four coefficients of `STATUS.md` 11.49. Reviewed in `REVIEW_4.md`. |
| `deficit_angular_results.txt` | 221 B | Output of `deficit_angular_verify.cpp` for the envelope starting at 1/25: the tail R ≥ 2 and the 400 accepted radial intervals, largest accepted 0.0336507. |
| `deficit_audit_content_results.txt` | 2.1 KB | Output of a replay of the content barriers by the author's audit (JSON lines). |
| `deficit_audit_moments_results.txt` | 945 B | Output of `deficit_audit_moments.py`: a moment-only relaxation with separate envelopes violates the budget, so the Stein constraints are needed (not a cubic counterexample). |
| `deficit_audit_notes.md` | 7.7 KB | Note of codex-6e2b's side: "Independent audit of the remaining content–deficit step", an audit made while the sixth version was being written. Not independent of the report. |
| `deficit_audit_results.md` | 7.4 KB | Note of codex-6e2b's side: "Independent audit of the completed content–deficit certificate", what its author's audit checked in the proofs and in the code, and the replays (it says that the combined default command was not rerun as one invocation). Not independent of the report. |
| `deficit_cover_union_results.json` | 373 B | Output of `deficit_cover_union.py`: 178 rectangles, 45 energy strips, the domain [0, 463/10000] × [0, 42] covered. |
| `deficit_dual_budget_retest_results.txt` | 1.2 KB | A conditional retest of the Stein budgets with accepted duals, slab by slab (its witness, 767 KB, stays in the working folder). |
| `deficit_dual_candidates.json` | 32 KB | Output of `deficit_dual_search.py`: floating-point dual candidates (**N**), not inputs of the certificate. |
| `deficit_dual_certified_nodes.json` | 19 KB | Dual models accepted at single nodes by `deficit_dual_exact.py` (exact global polynomial checks). |
| `deficit_dual_cover_enrich_results.txt` | 1.8 KB | Output of `deficit_dual_cover_enrich.py`: extra candidates at uncovered points (**N**). |
| `deficit_dual_cover_extra.json` | 54 KB | The extra candidates written by `deficit_dual_cover_enrich.py` (**N**). |
| `deficit_dual_cover_results.txt` | 2.2 KB | Output of a run of `deficit_dual_cover_verify.py`: the recomputed profile caps and the accepted boxes slab by slab. |
| `deficit_dual_cover_search_results.txt` | 19 KB | Output of `deficit_dual_cover_search.py`: candidate duals over the energy grid (**N**). |
| `deficit_dual_exact_results.txt` | 1.6 KB | Output of `deficit_dual_exact.py` at single (u, χ) nodes (JSON lines). |
| `deficit_dual_extended_candidates.json` | 9.2 KB | Dual candidates with the extended profile caps (**N**). |
| `deficit_dual_extended_certified.json` | 13 KB | Those of them accepted by the exact global check. |
| `deficit_dual_extended_exact_results.txt` | 1.2 KB | Output of that exact check (JSON lines). |
| `deficit_dual_extended_results.txt` | 4.5 KB | Output of the extended candidate search (**N**). |
| `deficit_dual_profile_caps.json` | 3.4 KB | Output of `deficit_dual_profile_caps.py`: the ten Hermite caps on [2, 64] and the tangent beyond. |
| `deficit_dual_proof.md` | 9.6 KB | Note of the sixth version: "Spectral-dual certificates for content versus the actual deficit", the Stein duals, the energy-interpolation allowance and the exempt boxes of the Stein cover (`STATUS.md` 11.50). Reviewed in `REVIEW_4.md`. |
| `deficit_dual_psd_candidates.json` | 20 KB | Dual candidates of a variant with a semidefinite constraint (**N**). |
| `deficit_dual_psd_results.txt` | 5.1 KB | Output of that search (**N**). |
| `deficit_dual_results.txt` | 15 KB | Output of `deficit_dual_search.py` (**N**). |
| `deficit_gaussian_results.txt` | 172 B | Output of `deficit_gaussian.py`: Arb enclosures of the Gaussian benchmark B(u) at four energies. |
| `deficit_integrated_results.txt` | 26 KB | **The log of the run of the new chain**, `verify.py --deficit-only` (06:02): the 14 historical hashes, the ten barriers, the four angular checks, the two moment covers, the Stein cover (119 duals, 106 boxes) and the exact union; it ends with "PASS FULL CONTENT/DEFICIT COVER". |
| `deficit_moment_mid_results.txt` | 46 KB | Output of the exploratory `deficit_moment_mid.py` (incomplete; not an input of the theorem). |
| `deficit_moment_prefix_proof.md` | 4.0 KB | Note of the sixth version: "Certified moment prefix from energy .009 to .016", the moment cover of [9/1000, 2/125] with the stronger content bounds. Reviewed in `REVIEW_4.md`. |
| `deficit_moment_prefix_results.txt` | 2.9 KB | Output of `deficit_moment_prefix.py`: the 33 caps and the 40 accepted boxes in 14 strips. |
| `deficit_moment_prefix_witness.json` | 26 KB | The witness written by `deficit_moment_prefix.py` (caps, benchmark lower ends, accepted boxes); regenerated at each replay, hash in `results.txt`. |
| `deficit_moment_probe_results.jsonl` | 21 KB | Output of `deficit_moment_probe.py`: a two-node moment relaxation (**N**). |
| `deficit_moment_verify_proof.md` | 6.9 KB | Note of the sixth version: "Certified low-energy content–deficit inequality", the global Hermite caps, the Gaussian lower chords and the moment cover of [0, 9/1000]. Reviewed in `REVIEW_4.md`. |
| `deficit_moment_verify_results.txt` | 2.2 KB | Output of `deficit_moment_verify.py`: 18 slabs, 32 accepted boxes, 3 exempt. |
| `deficit_moment_verify_witness.json` | 18 KB | The witness written by `deficit_moment_verify.py` (caps, benchmark lower ends, accepted boxes); regenerated at each replay, hash in `results.txt`. |
| `deficit_structure_absolute_low_proof.md` | 2.5 KB | Note of the sixth version: "Absolute scalar envelopes starting at energies .03 and .035", two of the envelopes W behind the last four coefficients. |
| `deficit_structure_absolute_low_results.txt` | 1.1 KB | Output of `deficit_structure_absolute_low_verify.py`. |
| `deficit_structure_adaptive_results.txt` | 15 KB | Output of a numerical primal Stein feasibility scan with adaptive knots (**N**). |
| `deficit_structure_content_candidate_absolute.json` | 20 KB | Output of `deficit_structure_content_search.py`: a floating-point candidate barrier (**N**), not an input of the certificate. |
| `deficit_structure_content_candidate_absolute30.json` | 20 KB | Output of `deficit_structure_content_search.py`: a floating-point candidate barrier (**N**), not an input of the certificate. |
| `deficit_structure_content_candidate_absolute35.json` | 20 KB | Output of `deficit_structure_content_search.py`: a floating-point candidate barrier (**N**), not an input of the certificate. |
| `deficit_structure_content_candidate_absolute44.json` | 20 KB | Output of `deficit_structure_content_search.py`: a floating-point candidate barrier (**N**), not an input of the certificate. |
| `deficit_structure_content_candidate_high.json` | 20 KB | Output of `deficit_structure_content_search.py`: a floating-point candidate barrier (**N**), not an input of the certificate. |
| `deficit_structure_content_candidate_low.json` | 20 KB | Output of `deficit_structure_content_search.py`: a floating-point candidate barrier (**N**), not an input of the certificate. |
| `deficit_structure_content_candidate_low9.json` | 20 KB | Output of `deficit_structure_content_search.py`: a floating-point candidate barrier (**N**), not an input of the certificate. |
| `deficit_structure_content_candidate_medium.json` | 20 KB | Output of `deficit_structure_content_search.py`: a floating-point candidate barrier (**N**), not an input of the certificate. |
| `deficit_structure_content_candidate_medium25.json` | 20 KB | Output of `deficit_structure_content_search.py`: a floating-point candidate barrier (**N**), not an input of the certificate. |
| `deficit_structure_content_proof.md` | 5.8 KB | Note of the sixth version: "Further energy-dependent content bounds and absolute profile envelopes", the scalar barriers and the envelopes W. |
| `deficit_structure_content_results.txt` | 2.1 KB | Output of `deficit_structure_content_verify.py`: the barriers accepted, with their residual margins. |
| `deficit_structure_content_witness_absolute.txt` | 52 KB | The envelope W of the witness `absolute` serialized outward for the angular checker, written by `deficit_angular_prepare.py`; regenerated at each replay. |
| `deficit_structure_content_witness_absolute30.txt` | 52 KB | The envelope W of the witness `absolute30` serialized outward for the angular checker, written by `deficit_angular_prepare.py`; regenerated at each replay. |
| `deficit_structure_content_witness_absolute35.txt` | 52 KB | The envelope W of the witness `absolute35` serialized outward for the angular checker, written by `deficit_angular_prepare.py`; regenerated at each replay. |
| `deficit_structure_content_witness_absolute44.txt` | 52 KB | The envelope W of the witness `absolute44` serialized outward for the angular checker, written by `deficit_angular_prepare.py`; regenerated at each replay. |
| `deficit_structure_content_witness_high.json` | 26 KB | A rational barrier of an earlier stage of the sixth version; not an input of its final chain (the inputs are in `code/tilted-sector-2026-11-15/`). |
| `deficit_structure_content_witness_low.json` | 26 KB | A rational barrier of an earlier stage of the sixth version; not an input of its final chain (the inputs are in `code/tilted-sector-2026-11-15/`). |
| `deficit_structure_content_witness_low9.json` | 26 KB | A rational barrier of an earlier stage of the sixth version; not an input of its final chain (the inputs are in `code/tilted-sector-2026-11-15/`). |
| `deficit_structure_content_witness_medium.json` | 26 KB | A rational barrier of an earlier stage of the sixth version; not an input of its final chain (the inputs are in `code/tilted-sector-2026-11-15/`). |
| `deficit_structure_medium25_proof.md` | 1.8 KB | Note of the sixth version: "Additional content interval starting at u=1/40", the coefficient 1859/43200. |
| `deficit_structure_medium25_results.txt` | 709 B | Output of `deficit_structure_medium25_verify.py`. |
| `deficit_structure_psd_results.txt` | 2.0 KB | Output of the feasibility scan with a semidefinite variant (**N**). |
| `deficit_structure_refine_proof.md` | 3.2 KB | Note of the sixth version: "Refined low-energy content coefficients", the first five coefficients of `STATUS.md` 11.49. Reviewed in `REVIEW_4.md`. |
| `deficit_structure_refine_results.txt` | 2.2 KB | Output of `deficit_structure_refine_verify.py`: the five refined low-energy barriers accepted. |
| `deficit_structure_refine_search_results.txt` | 1.0 KB | Output of `deficit_structure_refine_search.py`: the optimised scalar caps (**N**). |
| `deficit_structure_results.txt` | 16 KB | Output of `deficit_structure_scan.py` (**N**). |
| `deficit_structure_stable_results.txt` | 1.3 KB | Output of a stabilised run of the same scan (**N**). |
| `first-version/REPORT.md` | 24 KB | **The first version** (03:23), the one that `REVIEW.md` covers: the global bound at the tilt 3/5 with its circular-mean lemma and the sector lemma for u ≤ 1/85920 (section 2); the structural bound on the content with the explicit constant 848, and a class with zero content (3); the conditional remainder theorem with a Gaussian tail, existence of maximisers (4); the three open statements O-A1, O-A2, O-B and the conditional assembly (5); numerical evidence on the Wick monomial (6); qualifications (7). The working file was overwritten at 04:04; this copy has the SHA-256 recorded from it before that (`INVENTORY.md`). |
| `localization_alternative_proof.md` | 11 KB | Note of the third version: "Global localization from a scalar derivative majorant", every maximiser has norm below 0.085, from the inequality β(w, ρ) ≤ (4/5)ρ + (63/400)·Re w + \|w\|²/(40ρ) and a certificate in directed interval arithmetic. Not reviewed; not used by the fifth version. |
| `localization_majorant_results.txt` | 5.5 KB | Output of the checker `localization_majorant.cpp`: 70,373 accepted boxes, largest accepted value 0.7999968 against 4/5. |
| `localization_notes.md` | 3.3 KB | Note of the second version: "Improved elementary localization", 𝒥 ≤ (1273/1250)·u − (859/2500)·‖r‖² for u ≤ 0.0463 and the radius 371/1000, from the fourth-moment cap. Reviewed in `REVIEW_2.md`. |
| `localization_radial_probe_results.txt` | 5.0 KB | Output of `localization_radial_probe.py`: floating-point values of a radial-derivative bound and of the resulting margins (N, "no interval certificate"). |
| `localization_radial_proof.md` | 8.9 KB | "Radial-gradient reduction for global sector localization": a probe of codex-6e2b towards the localisation, from a scalar majorant with other constants than the third version's; its premise is open in the note itself. Named by no version of the report. Not reviewed. |
| `preliminary_results.txt` | 4.5 KB | Output of the verifier of the first version, both runs (exact rational arithmetic; `--numerical` on the Wick monomial), kept by the author under this name. Its third line is the SHA-256 of that verifier, which is `code/tilted-sector-2026-11-15/first-version/verify.py`. It was `results.txt` when the first version was reviewed. |
| `profile_range_results.txt` | 54 KB | Output of `profile_range.py` (JSON lines): 158 interval boxes for −1/40 < h_{3/5} < 253/1000. |
| `results.txt` | 31 KB | Output index of the verifier of the sixth version (06:06): the final status, the two runs that make up the evidence (the earlier full secant run, `results_secant_history.txt`, and the run of the new chain, `deficit_integrated_results.txt`; the combined default command was not run as one invocation), the cover summary, the SHA-256 of the report and its notes, the inherited inputs and the inputs and outputs of the new chain, and the transcript of that run. Its hashes are those of the copies here, and of the five large files listed in `INVENTORY.md`. |
| `results_localization_history.txt` | 16 KB | Output of the verifier of the fourth version (04:38): the exact rational checks C1 to C10, the replays of the other certificates, and the SHA-256 of the files of that verifier (it is `code/tilted-sector-2026-11-15/fourth-version/verify.py`). Ends with "PASS FINAL CERTIFICATE SET". Kept by the author under this name. |
| `results_secant_history.txt` | 25 KB | Output of the verifier of the fifth version (05:17), kept by its author under this name; byte-identical to the earlier copy of `results.txt`: the exact comparisons, the SHA-256 of the 14 files of that verifier, the Θ certificate, the profile certificates, the 602-value radial table, the compact secant cover (102,104 boxes) and the content certificates, ending with "PASS FULL SECANT REPLAY". Its final line about the open comparison describes the state before the sixth version. |
| `secant_assembly.md` | 5.2 KB | Note of the fifth version: "Consequences of a global secant bound of 13/20": the general condition H(u, δ)/k ≤ κ·D₊ + η, the three explicit classes, the weaker remaining target (5), and why the remote certificates do not absorb the sector by themselves. Reviewed in `REVIEW_3.md` (arithmetic). Revised at 06:02 for the sixth version: section 3 is now "The completed content-to-deficit comparison" and the last paragraph of section 4 says that the new certificate couples the content bounds with the remote moment constraints; the copy is of that state (the hash of the 05:17 state is in `INVENTORY.md`). |
| `secant_audit_math.md` | 8.4 KB | Note of the fifth version: "Independent secant-certificate reductions", the convex interpolation formula, a nonnegative ring decomposition, a root-based alternative and the exterior bounds, with an audit of the point quadrature. By the author's side, not independent of the report. |
| `secant_audit_results.md` | 8.4 KB | Note of the fifth version: "Independent audit of the active secant route", by a sub-agent of codex-6e2b: what was checked in the proofs and in the code, and the replays. Its last line still says that the end-to-end replay was in progress, which its first paragraph and `results.txt` supersede. Not independent of the report. |
| `secant_content_candidate.json` | 20 KB | Output of `secant_content_probe.py`: a floating-point candidate for the barrier ("N_only"); not an input of the certificate. |
| `secant_content_proof.md` | 9.6 KB | Note of the fifth version: "A factor-two content improvement on the central energy interval", ‖c_{3/5}(q)‖² ≤ (1077659/27000000)·δ for 0.03 ≤ u ≤ 0.0463, through the shifted resolvent, a sharp angular bound and a rational supersolution. Reviewed in `REVIEW_3.md`. |
| `secant_content_results.txt` | 720 B | Output of `secant_content_verify.py` (JSON lines): the bound 92.11 on m⁗, the outer source bounds, and the barrier accepted on 500 cells with the smallest residual margin 1.937·10⁻⁵. |
| `secant_core_results.txt` | 12 KB | The log of the first complete run of the compact secant cover (153.7 s): progress lines and "PASS GLOBAL SECANT CORE: accepted=102104 visited=204207 pruned=7788". |
| `secant_profile_dual_results.txt` | 849 B | Output of `secant_profile_dual.py`: the Gaussian-probe dual from the regenerated radial table, content norm below 0.0198306 < 1/50. |
| `secant_profile_table.txt` | 19 KB | The radial table of β₀ written by `secant_profile_table.py`: 602 nodes on [0, 6] with outward integer endpoints (scale 10⁸). The verifier regenerates it at each replay; its SHA-256 is printed at the end of `results.txt`. |
| `secant_profile_table_results.txt` | 3.4 KB | Output of `secant_profile_table.py` (JSON lines): progress of the 602 Arb values and the final record (610.6 s). |
| `secant_proof.md` | 16 KB | Note of the fifth version: "Global secant curvature: analytic reduction and certificate contract", the four regions of the global remainder bound (small amplitudes from the Θ certificate, large amplitudes, the exterior \|w\| ≥ 6, the compact cover with convex interpolation) and its consequence for every sector. Reviewed in `REVIEW_3.md`. Its closing paragraph was revised at 06:02 to say that the comparison is now proved; the copy is of that state (the hash of the 05:17 state is in `INVENTORY.md`). |
| `theta_proof.md` | 22 KB | Note of the second version: "Uniform tilted-sector curvature: analytic reduction and certificate contract", the second derivative along the sector is at most 3/4 for sector values up to 3/10, with a certificate in directed interval arithmetic. Reviewed in `REVIEW_2.md` (the interval code replayed, not audited line by line). One of its scalar targets is used by `secant_proof.md`. |
| `theta_results.txt` | 937 B | Output of the checker `theta_verify.cpp`: 6,168 accepted rectangles and the two final matrix enclosures. |

### `sources/d1/`: the degree-2 case of the L¹/L² inequality (4 and 5 November 2026)

2 files, 38 KB.

| file | size | contents |
|---|---:|---|
| `D1_NOTES.md` | 13 KB | Notes of the proof of D₁ for the real second chaos: E\|X\| ≤ √(2/π)‖X‖₂ for X = Σλ_i(g_i² − 1), and for weighted sums of Gammas; what each numerical script tests; routes that failed. |
| `d1-note.tex` | 25 KB | The same proof written as a note (5 November 2026), with the level-2 corollary ‖Π₂u‖² ≤ 2/π and a remark on what does not extend to degree 3 or to the complex charge-one case (open). |

### `sources/k5-2026-11-04/`: numerical test of the degree-5 analogue K₅ (4 November 2026)

1 files, 24 KB.

| file | size | contents |
|---|---:|---|
| `RESULTS.md` | 24 KB | Numerical test of the degree-5 analogue K₅ with full tensors: no excess at the peak row in the families it tests (many spikes give one: `../higher-degree/STATUS.md` 4.9), an excess of about 8·10⁻⁵ at the flank rows t ∈ [0.86, 0.88]. Floating point and Monte Carlo; nothing certified. |

### `sources/prompts/`: prompts and replies sent to the external assistants (5 and 6 November 2026, and one prompt of 15 November)

The `.txt` files are copied byte for byte (no line added). `prompt-*`, `lemma-content-prompt` and `conjectureK-olympiad` are statements sent to an assistant; `subproblem-*` are self-contained subproblem statements; `reply-*` are the replies of claude-b9ee to an assistant's result (what was verified, corrected or refuted). `PROMPT_GPT_AUDIT_MONOGRAPH.md` is of 15 November; as a `.md` file it carries the provenance line of every copied `.md`. The prompt of the same day that produced the report on the tilted sector (`sources/received-2026-11-15-tilted-sector/`) was not kept in a file.

43 files, 111 KB.

| file | size | contents |
|---|---:|---|
| `PROMPT_GPT_AUDIT_MONOGRAPH.md` | 7.3 KB | Prompt given to an external assistant on 15 November 2026: audit `MONOGRAPH.md` and the claims of `STATUS.md` that carry P or C, propose improvements, finish one or two open items (candidates: the joint A/B remainder bound, a content theorem, the kernel comparison, the remote part with the packages of 22 October), and deliver one pull request under `research/conjecture-K/`. It says that another assistant was asked to prove the tilted-sector lemma. The audit of codex-a7c4 (`sources/audit-2026-11-15-codex-a7c4/`) is the answer to it. |
| `conjectureK-olympiad.txt` | 1.5 KB | Statement sent. For eps=1891/2500, l=1057/1250, b=179/1250, L=z_1(l+b(T−2)): prove Lambda(G) <= sup_sigma Lambda(sigma W) for every G in H; sigma* in (0.19,0.21); variants with 1e-4 error or the box. |
| `lemma-content-prompt.txt` | 3.1 KB | Prompt sent. Asks to prove the lemma C_X(q)^2 <= (19/100) D(q) for remote cubics with u <= 0.0463 at the peak row; lists known facts (0.138, D_1=34.55, 3·sqrt6/4, −D_0 >= 25.04). |
| `prompt-A-content-sharpening.txt` | 1.9 KB | Prompt sent. "NEXT TASK (S1): sharpen the A-content certificates" from 11/50, 0.239, 23/100, 9/40 to <= 0.10 (0.15 useful) on u in [0.03,0.0463]; plus kernel bound with 0.5053 and 0.007. |
| `prompt-J3-finite-amplitude.txt` | 4.8 KB | Prompt sent. "NEXT TASK (J3)": finite-amplitude signed A/B cost, (kA,kB,m)=(0.24,0.26,0.118) minus delta <= 0.07, routes (a)/(b); rho_0 = 0.5053/0.502632/0.501130, h <= 0.007; budget note (5.5e-5). |
| `prompt-fresh-selfinteraction.txt` | 3.2 KB | Prompt sent. Gives a numerical map of C^2/D (worst 0.0884 at u=0.0463, Wick monomial); requests R26 (self-interaction family X[c(R−2)+Y*AY−tr A]) and R27 (extremality); appended x^2-weight correction. |
| `prompt-hermitian-r26.txt` | 2.4 KB | Prompt sent. Reports R23 replayed green (983,671/157,507/27,601 boxes); requests R26 for q=X[c(R−2)+P], 0.00551 <= u <= 0.0463, constant 0.24, and R27, the extremality conjecture E. |
| `prompt-one-driver-closure.txt` | 4.3 KB | Prompt sent. "TASK: close the content inequality for the one-driver self-interaction family" by two interval certificates: (*) giving 0.22 on 1/16 <= f <= 4/5, (dagger) giving 0.235 on f <= 1/16. |
| `reply-b-content-kernel.txt` | 1.9 KB | Reply sent. Reports own numerics (g_B(0)=−0.42203, ratio 0.5053–0.5586, C_B <= 0.5053 C_A + 0.007 sqrt u); asks to certify these kernel bounds, kappa_AB, and smaller A-content constants. |
| `reply-b-cost.txt` | 1.8 KB | Reply sent. Records the B-cost kappa_B = 0.26/0.29/0.30 as received (replay running); proposes three routes for the B-content against B(u)−F(q), including a joint 2x2 cost matrix. |
| `reply-envelope-audit.txt` | 1.9 KB | Reply sent. Accepts all three audit points (K(0.0463)=0.16669, not 0.1913; the obstruction; directional envelope 0.2393); re-checked (*) margins 0.00747 and 0.00378; lists certificate work (a)–(c). |
| `reply-envelope-star.txt` | 2.1 KB | Reply sent. Confirms envelope (*) numerically with own kernels (worst margin 0.00355 at u=0.0463, f=1/16); asks for a rigorous interval certificate on modulus(z) <= 4; suggestions for f < 1/16. |
| `reply-fresh-gaussian-factor.txt` | 2.5 KB | Reply sent. Verifies Q(0)=3.3452 > 167/50, A'(0)=4.3184 < 108/25, 11.15 < 56/5; calls it "a genuine new theorem"; requests R20 (covariance gap), R21 (self-interaction), R22 (general cubics). |
| `reply-fresh-lemma.txt` | 2.4 KB | Reply sent. Verifies −D_0=26.762, D_1=34.547, Phi^(6)(0)=2740.8 and bound (1); says the Taylor step collapses beyond u=0.0017; requests R19: Gaussian-mixture bounds c(u), c'(u). |
| `reply-gaussian-factor-full.txt` | 1.2 KB | Reply sent. Confirms the Gaussian-factor certificate (vector inequality by Monte Carlo, ratios 0.57–0.80); records the class closed; asks for R26 on u in [0.03,0.0463], any constant below 0.24. |
| `reply-gpt3-fourthmoment.txt` | 2.7 KB | Reply sent. Verifies Lambda(H+(T−1)U) <= B_0+(11/100)u−(8/25)w+(21/4)w^2 (C_4=5.2444) and the obstruction (1.374167); asks for refinements reaching u <= 0.0463 for w < 0.0113. |
| `reply-gpt3-refinement.txt` | 2.4 KB | Reply sent. Verifies the refined bound at five table points (cutoff 0.01125); asks (A) a closed universal bound in (u,w,m40) using constant 3·sqrt6/4, (B) optimisation over four coefficients. |
| `reply-hermitian-E-saddle.txt` | 1.0 KB | Reply sent. Confirms by quadrature that "exact E is false: the monomial is a saddle" (0.0876133 at tau=0, excess 1.3e-4); asks for R26 and the vector moment inequality. |
| `reply-hermitian-family.txt` | 2.4 KB | Reply sent. Verifies the coupled moment inequality and envelope (constant 0.236) closing the Hermitian one-driver family; asks R23 (non-Hermitian A), R24 (self-interaction), R25 (remaining shells). |
| `reply-hermitian-scanfix.txt` | 622 B | Reply sent. Confirms a fix of its own scan (g(0) = −0.835136); rerun monomial ratios 0.0406/0.0708/0.0891; "conclusions unchanged"; asks to proceed with R26 and R27. |
| `reply-j2-kernels.txt` | 1.5 KB | Reply sent. Reports the infinitesimal bound holds at every shift (min eigenvalue +0.080 at x=0) and the pointwise finite-amplitude Hessian fails for beta >= 0.1; asks to extend to all x >= 0. |
| `reply-j3-budget.txt` | 1.5 KB | Reply sent. Says both corrections are in the task (B-cost scope; rho_0 per row); gives the budget sensitivity (5.5e-5 at m=0.118); asks for the smallest A-content constants on [0.03,0.0463]. |
| `reply-joint-signed.txt` | 1.3 KB | Reply sent. Agrees on the signed joint form as the A+B target (5.5e-5 checked); asks to certify the mixed term's sign and size for q != 0 and the bounds [0.505,0.56], 0.007. |
| `reply-odd-form.txt` | 1.2 KB | Reply sent. Says the (6)-obstruction matches its own computation (top eigenvalue 1.195 at H=0, 1.494 at the core); sets the target: phase-averaged Hessian form with a third-order remainder. |
| `reply-progress-archive.txt` | 899 B | Reply sent. Records the progress archive (second variation in (0.00140,0.00198), "exact E is closed as false"); accepts two corrections; R26 on [0.03,0.0463] remains the request. |
| `reply-r26-directional.txt` | 1.2 KB | Reply sent. Accepts both corrections (content not analytic in p at the pure-P end); records the directional matrix bound as certificate target; offers to replay envelopes on 0.03 <= u <= 0.0463. |
| `reply-r26-hermitian-proved.txt` | 1.5 KB | Reply sent. Records R26 for real c and Hermitian A (0.23, reserve 1/40000, u in [0.03,0.0463]); asks whether the method takes complex P and energies down to 0.00551. |
| `reply-r26-reweighted.txt` | 1.4 KB | Reply sent. Records the reweighted certificate C(XP)^2 <= 0.22 Delta for every complex quadratic P (0.2468 barrier bypassed); suggests organising (dagger) on f <= 1/16; asks about u < 0.03. |
| `reply-r26-sync.txt` | 825 B | Reply sent. Accepts both corrections "made in the monograph"; updates status: p <= u/5 certified with 9/40, (*) pending on [u/5,15u/16], directional envelope 0.2393; duality recorded. |
| `reply-refined-target.txt` | 1.5 KB | Reply sent. Adopts the refined target with r(u)^2 = min{0.01125,(u−0.00551)/0.319}; quantifies it along the Wick monomial; asks to certify X[c(R−2)+P(Y)] on [0.03,0.0463]. |
| `reply-sizebias-reduction.txt` | 1.7 KB | Reply sent. Verifies the reduction numerically ("lossless to 0.02", K(u)=0.1913 quoted); says the remaining task is the envelope N(z)^2 <= H_{c,u}(z) Q; two remarks on phase and moments. |
| `reply-thread1-r10r12.txt` | 3.0 KB | Reply sent. Checks C = 3·sqrt6/4 (ratio 0.4808) and cutoff (19); says only finite-amplitude certificates can close the rectangle; requests R13, R14, R15. |
| `reply-thread1-r5.txt` | 3.7 KB | Reply sent. Checks R5 (content/slack 0.039–0.088, below 0.103 and 0.138) and R4; relays the third thread's bound (11/100, 8/25, 21/4); requests R10, R11, R12. |
| `reply-thread2-r10r12.txt` | 2.4 KB | Reply sent. Checks the 0.24 w cost, polynomial maximum 0.48086 and the fifth-order obstruction; accepts (18)–(23); requests R16 (numerical scan of (25)), R17, R18. |
| `reply-thread2-r4r6.txt` | 4.1 KB | Reply sent. Gives verdicts on remote_cubic_and_linear_shell.tex (main theorem verified, 199/(200 l)); concedes its own R4 normalisation; states K1, K2 and rectangle R; requests R7, R8, R9. |
| `reply-thread2-r7r9.txt` | 3.2 KB | Reply sent. Checks shared_driver_rectangle.tex (cost 0.68–0.90 against 1/eps − 0.19); narrows the open set to w < 0.0113, energy > 0.0064; requests R10, R11, R12. |
| `reply-wick-endpoint.txt` | 1.5 KB | Reply sent. Confirms the Wick-endpoint extension arithmetic (49/211) "with a 20x slack"; suggests the exact size-biased identity for the remaining region p > u/16. |
| `reply-wick-one-twelfth.txt` | 1.2 KB | Reply sent. Records the result and says the state moved past it (p <= u/5 with 9/40; R26 Hermitian at 0.23); asks to aim boxes at (*) for f in [1/16,4/5]. |
| `reply-wick-twenty-percent.txt` | 1.3 KB | Reply sent. Says the p <= u/5 extension checks out numerically (worst ratio 0.0864); asks for the interval certificate of (*) on [1/16,4/5] and the directional envelope for f < 1/16. |
| `subproblem-B-sector.txt` | 7.2 KB | Subproblem statement. "The B-shell cost and content lemma": wants (B-cost), (B-content), (joint) for z^2 conj(r_B)/sqrt 2; status kappa_B = 0.26/0.29/0.30 certified; S = 1.3739535; twin even-sector statement. |
| `subproblem-E2-uniform-odd-cost.txt` | 4.1 KB | Subproblem statement. "SUBPROBLEM E2": Lambda(H+O) <= Lambda(H) for core energy <= 0.072 minus odd energy, via directional majorant (D) and pointwise (E2'); known k_1 = 0.128/0.156/0.166, k_3 = 0.33/0.36/0.36. |
| `subproblem-J2-finite-amplitude-joint.txt` | 7.1 KB | Subproblem statement. "SUBPROBLEM J2": finite-amplitude signed A/B cost reduced to a Lipschitz bound on the B content along the A direction, delta <= 0.07, m = +0.118; route (c) and its caveat. |
| `subproblem-even-sectors-and-joint.txt` | 6.2 KB | Subproblem statement. "NEXT SUBPROBLEMS": E (z-odd sectors: pure cost, "THERE IS NO E-CONTENT", condition (6) ruled out) and J (signed joint A/B cost, m about 0.118, S + 5.5e-5). |

### `sources/received-2026-11-05/`: notes and proofs received from the external assistants (5 and 6 November 2026)

The top-level `.tex` and `.md` files are notes received directly; each subfolder holds the markdown documents of one certificate package (the proofs and reports only: the verifiers, kernel tables and result files stay in the zip listed in `INVENTORY.md`). `hermitian_content/proof.md` is shipped again by seven later packages as `kernel_proof.md` or `benchmark_kernel_proof.md` (byte-identical); those copies are not repeated here. Status of each result: `STATUS.md`.

44 files, 356 KB.

| file | size | contents |
|---|---:|---|
| `J3_audit/j3_audit/REPORT.md` | 12 KB | J3 audit: certified scalar obstructions and corrected finite-amplitude target |
| `all_shift_signed_ab/all_shift_certificate/PROOF.md` | 7.3 KB | All-shift signed infinitesimal A/B theorem — three rows |
| `all_shift_signed_ab_v2/all_shift_certificate/PROOF.md` | 8.0 KB | Signed A/B Hessian at every remote shift |
| `b_sector_content_and_cost/b_sector/PROOF.md` | 16 KB | B-shell content for Gaussian-factor cubics, and a stronger local cost |
| `b_sector_content_and_cost/b_sector/README.md` | 1.6 KB | B-sector progress certificate |
| `b_shell_global_cost/b_shell_result/PROOF.md` | 8.8 KB | B-shell: a certified global cost bound and a correction to the content pairing |
| `chatgpt-r26_sync_and_exact_matrix_duality.md` | 6.4 KB | Note received. "Does not prove R26 or Conjecture K": status of q=X[c(R−2)+P] (0.239, 49/211, 0.22; K(0.0463) in (0.166781,0.166783)) and proved duality L(A,D)=inf_s lambda_max((1+s)A+(1+1/s)D). |
| `chatgpt-shared_driver_rectangle.tex` | 23 KB | Note received. "Two shared-driver cubics on the remaining rectangle": for Q1=X(R−2)/sqrt2, Q2=X(R_Y−1), .00551<=u<=.0463, w<=.0223: F(q+(T−1)U) <= B(u+w) − 1e-6·l; content <= (19/100)(B(u)−F(q)) − 3e-6. |
| `chatgpt-thread1-remote-cubic-comparison.tex` | 23 KB | Note received. "Remote cubics and a visible-dependent Gaussian term": (19/11)h <= D/10+E/2 implies F(H+G0) <= M(v); theorem F(H+(T−1)U) <= F(H+sqrt(b)W) for independent H, b+h <= l^2; small-amplitude and sharing regions. |
| `chatgpt-thread2-gaussian_domination_note.tex` | 15 KB | Note received. "Gaussian domination in the charge-one cubic chaos": counterexample Lambda(G) > S outside the box (l−2beta = 1e-30); same-norm theorem for conditionally Gaussian G, a/beta <= 11/2; Stein-sign inequality for H_3(X). |
| `chatgpt-thread2-remote_cubic_and_linear_shell.tex` | 23 KB | Note received. "Remote cubics and a linear shell in Gaussian domination": for independent q and U on the box, Lambda(q+(T−1)U) <= Lambda(q) − (1/eps − 199/(200 l))u at every amplitude; items R4–R6. |
| `directional_odd_cost/directional_cost/PROOF.md` | 4.0 KB | Finite-amplitude directional cost at the inverse-norm obstruction |
| `gaussian_factor_content/vector_content/proof.md` | 6.9 KB | Shared-A content for arbitrary Gaussian-factor cubics |
| `gaussian_factor_extension/gaussian_factor_certificate/README.md` | 3.0 KB | Full Gaussian-factor content certificate |
| `gaussian_factor_extension/gaussian_factor_certificate/proof.md` | 11 KB | Conjecture K: the full Gaussian-factor class |
| `hermitian_content/README.md` | 1.7 KB | Hermitian-content certificate |
| `hermitian_content/proof.md` | 12 KB | A content theorem for an arbitrary Hermitian spectrum |
| `integrated_wick_envelope/wick_work/README.md` | 7.0 KB | Integrated Wick envelope: exact reduction, rigorous tail, numerical compact-region evidence |
| `joint_ab_uniform_reduction/joint_ab_uniform_reduction/REDUCTION.md` | 3.2 KB | Two scalar matrix kernels for the infinitesimal signed A/B bound |
| `odd_sector_certificate/odd_sector_certificate/PROOF.md` | 3.1 KB | Odd-sector baseline certificate and the exact nonzero-core target |
| `odd_sector_inverse_norm_obstruction/odd_obstruction/PROOF.md` | 3.3 KB | A certified obstruction to the inverse-norm sufficient condition (6) |
| `progress_2026-11-05/conjectureK_audit/README.md` | 3.7 KB | Conjecture K research results — 5 November 2026 |
| `progress_2026-11-05/conjectureK_audit/proof.md` | 18 KB | Conjecture K: a Gaussian-factor theorem and a counterexample to Conjecture E |
| `r23_r25_certificate/r23_r25_certificate/README.md` | 3.1 KB | R23 non-Hermitian content certificate |
| `r23_r25_certificate/r23_r25_certificate/proof.md` | 16 KB | R23–R25: non-Hermitian content, the size-biased self-interaction, and shell bookkeeping |
| `r26_envelope_audit/mixed_envelope/REPORT.md` | 7.2 KB | R26 envelope audit and an exact obstruction to the scalar phase envelope |
| `r26_fresh_reductions/direct_wick_support/research_note.md` | 7.2 KB | Fresh R26 analysis: directional size bias and a direct scalar support problem |
| `r26_reweighted/r26_reweighted_certificate/README.md` | 2.7 KB | R26 reweighted content certificate |
| `r26_reweighted/r26_reweighted_certificate/proof.md` | 11 KB | Reweighting the content inequality: a certified 0.22 endpoint and a nonsingular R26 target |
| `r26_reweighted/r26_reweighted_certificate/quadratic_moment_input.md` | 3.6 KB | Inherited R23 moment theorem |
| `r26_self_interaction/r26_certificate/README.md` | 3.7 KB | R26 self-interaction certificate |
| `r26_self_interaction/r26_certificate/proof.md` | 14 KB | R26: the full Hermitian self-interaction family |
| `r26_twenty_percent_extension/r26_extension/README.md` | 1.4 KB | R26 Wick endpoint extension: p <= u/5 |
| `r26_twenty_percent_extension/r26_extension/proof.md` | 12 KB | R26: a uniform twenty-percent coefficient neighborhood of the Wick endpoint |
| `r26_twenty_percent_extension/r26_extension/remaining_r26.md` | 5.8 KB | Exact integrated-deficit reduction for the remaining R26 region |
| `signed_joint_ab_hessian/joint_ab_hessian/PROOF.md` | 2.1 KB | Signed A/B Hessian certificate |
| `smooth_joint_kernel/smooth_joint_kernel/PROOF.md` | 3.4 KB | A regular integral for the joint A/B Hessian, with a nonzero-shift certificate |
| `wick_endpoint_extension/wick_extension/proof.md` | 6.6 KB | A uniform neighborhood of the Wick endpoint in R26 |
| `wick_endpoint_one_twelfth/wick_cert/README.md` | 3.5 KB | Wick endpoint 1/12 certificate |
| `wick_endpoint_one_twelfth/wick_cert/proof.md` | 11 KB | Certified deterministic-shift kernels and a larger Wick-endpoint neighborhood |
| `wick_r26_twenty_percent/wick_research/README.md` | 1.0 KB | Wick extension, 5 November 2026 |
| `wick_r26_twenty_percent/wick_research/integrate_first.md` | 2.6 KB | A stronger exact reduction; its proposed scalar envelope is not certified |
| `wick_r26_twenty_percent/wick_research/kernel_proof.md` | 6.0 KB | Scalar kernel background inherited from R23 |
| `wick_r26_twenty_percent/wick_research/proof.md` | 10 KB | Wick self-interaction: a certified 20% coefficient neighborhood |

### `sources/october-handoff/`: the October 2026 material (handoff, report, plans, prompts, pipeline notes, five notes of the weak-K package)

Dated documents. Their endpoints are stale (the repository then proved 1.40148809 and later 1.401674103); the statement of K and the negative results are still the ones in use. `weak-k-2026-10-15/` holds five notes of the weak-K package of 15 October. The manuscript chapter `ch25-weak-k.tex` reproduces parts of that package (the tied multiplier in `ch25-parts/20-stability-and-smoothing.tex`, the nine-point test in `ch25-parts/10-exact-duals-rotation-profiles.tex`); the notes say more about the tied profiles. They were added on 15 November because `STATUS.md` (item 19) cites them, and `sources/status-2026-11-15/STATUS_with_history.md` (section 11 (c)) for what the October record already had.

29 files, 384 KB.

| file | size | contents |
|---|---:|---|
| `PLAN_1402.md` | 30 KB | Programme for 1.402 (22 October): logical chain, K_η allowances per row, raw-K milestones M1 to M6, the even-sector statements and which of them are false, negative results, log. |
| `WHY_THE_GAP.md` | 11 KB | Why the lower bound stalls (22 October): the cubic-witness ceiling, Hermite duality, why degree ≥ 5 needs shared drivers; includes a withdrawn overclaim. |
| `conjecture-K-report/ATTACK_PLAN_20261022.md` | 30 KB | Plan of 22 October to bound actual bounded responses at ε = 1891/2500 (design cap 0.713260): regional certificates, routes to avoid. Response side, partly about K. |
| `conjecture-K-report/JUNTA_PROPOSAL_FOR_GPT.md` | 8.9 KB | Proposal of 15 October to certify the one-coordinate Wick junta with shared A/B and buffer; exact ring formula; measured margins. |
| `conjecture-K-report/WEIGHTED_CONTENT_FOR_GPT.md` | 13 KB | 15 October: Theorem W (weighted content, constant 3), reduction to (T), then the correction: (T) is false, the target reverts to (T₀). |
| `conjecture-K-report/conjecture_K_report.md` | 74 KB | Full status report of 20 October: sector table with labels, evidence, dead strategies, the L2 constant, replays of the packages of 15 October. Markdown conversion of the `.tex`. |
| `conjecture-K-report/conjecture_K_report.tex` | 60 KB | LaTeX source of the same report. |
| `conjecture_K_handoff.md` | 19 KB | Handoff of 12 October: the exact gate-free row, statement of K and K_η, the (K-a)/(K-b) structure, floating-point evidence, three updates (content inequality, proved bounds, L4 false). |
| `pipeline-gate/KSIDE.md` | 13 KB | Worker note of 11 and 12 October where K was first stated: the exact k-row, the Gaussian ideal D″(t) and its table by ε, where the gates lose, floating-point evidence, the degree-5 row. |
| `pipeline-kclt/PROGRESS.md` | 528 B | Progress log of worker K3. |
| `pipeline-kclt/RESULTS.md` | 7.5 KB | Worker K3, 12 October: the Gaussian-limit family (sup = S), the lemma L4 (monotonicity along the CLT) refuted with explicit numbers, what survives. |
| `pipeline-kconj/PROGRESS.md` | 1.6 KB | Progress log of worker K1. |
| `pipeline-kconj/RESULTS.md` | 9.0 KB | Worker K1, 12 October: attacks on K (no violation), the realistic cap under K, the content reduction on families, the degree-5 gate-free row. Floating point. |
| `pipeline-kproof/PROGRESS.md` | 1.0 KB | Progress log of worker K2. |
| `pipeline-kproof/PROOF_NOTES.md` | 17 KB | Worker K2, 12 October: smooth profiles, the content reduction, the resolvent identity, Theorems 4 to 6, which chains close and for which x, lemmas L1 to L5. |
| `prompts/PROMPT_GPT_CONJECTURE_K.md` | 4.7 KB | Prompt of 20 October: the crux is the self-interacting shared-driver case; proved list; methods that worked and failed. |
| `prompts/PROMPT_GPT_CONJECTURE_K_v1_unsent.md` | 16 KB | Long prompt of 20 October (marked unsent): setting, proved list, known failures, four targets, four addenda (K for every ε, PVD, BNC, Gaussian layer). |
| `prompts/PROMPT_GPT_K_MINIMAL.md` | 1.8 KB | Self-contained minimal statement of K at the peak row with exact rationals (22 October); weak form S + 1.3·10⁻⁴. |
| `prompts/PROMPT_GPT_LARGE_A_SMALL_BUFFER.md` | 6.8 KB | 21 October: two-driver family with shared A/B couplings and a small buffer; target Λ ≤ S + 9·10⁻⁵ on an open region. |
| `prompts/PROMPT_GPT_M1_TH.md` | 4.2 KB | 21 October: the even-sector inequality (TH) for milestone M1, its obstruction and the lemmas requested. |
| `prompts/PROMPT_GPT_MULTIGRADE_FIBRE.md` | 3.6 KB | 22 October: the degree-5 game, a multi-grade fibre architecture and a generalised Conjecture K. |
| `prompts/PROMPT_GPT_PVD.md` | 4.9 KB | 21 October: the L¹/L² problem on H₂,₁ (prove ρ* ≤ 0.9711, ideally √π/2) and the routes that fail. |
| `prompts/PROMPT_GPT_SHARED_A.md` | 5.0 KB | 21 October: restricted K for a cubic q coupled to a linear form r through (T−1)r; target Λ ≤ S + 10⁻⁴. |
| `prompts/PROMPT_REPLY_K_REFORMULATION.md` | 5.7 KB | 22 October: reply to an assistant's real-part reformulation of K, with the correction that the convex-order domination is false. |
| `weak-k-2026-10-15/GAUSSIAN_LOCALIZATION.md` | 5.1 KB | Gaussian event-cost lemma and a conditional localization theorem for a fibre majorant; states that for the tied multiplier the actual profiles are F_A + F₀/3 and F_B + F₀/6 and that Bessel alone was numerically insufficient. |
| `weak-k-2026-10-15/HANDOFF.md` | 9.7 KB | Handoff of the weak-K package of 15 October ("no new numerical lower bound is claimed"): rotation stationarity, the dual retaining both discarded squares, uniform certificates of the actual profiles, two refuted majorants, what remains. |
| `weak-k-2026-10-15/LOCAL_CHANNELS.md` | 6.1 KB | Pinned first-chaos channels: the exact local three-channel matrix, the tied multiplier k = α/3 + β/6 with its matrix M_AB, searches for global cost matrices, the conditional bound with the tied profiles F_A + F₀/3 and F_B + F₀/6, the certified counterexample to M_AB + I/10. |
| `weak-k-2026-10-15/RETAINED_H_SQUARE.md` | 8.5 KB | The weaker target retaining both discarded squares: row identity, full dual, clipped Gram certificate, the sufficient comparison (6), and the diagnostic on nine junta points (a joint dual trial at sectors optimised for the unpenalised functional, against the A/B gain). |
| `weak-k-2026-10-15/TIED_GRAM_AUDIT.md` | 6.6 KB | Audit of an exploratory Gram programme for the tied profiles T_A = F_A + F₀/3, T_B = F_B + F₀/6: normalisations, a corrected tail coefficient, the uniform bounds \|T_A\| < 347/500 and \|T_B\| < 377/500, a tail-certificate format. Its solver figures are "not a bound". |

### `sources/manuscript/`: the October manuscript (digest, map, and the chapters on K)

`MANUSCRIPT_DIGEST_K.md` is the digest to read; `README.md` is the manuscript's own map and `stale-annotations.md` lists its dated `\stale{…}` markers (claims whose endpoints or hypotheses were superseded by 25 October). The chapters under `legacy/` are dated records, not current statements: read them through the digest and `STATUS.md`. `new/` holds three files of the manuscript's later part that the digest cites (its status labels, the response replicas, the withdrawn claims). Paths in the digest are relative to this folder. The chapters that are not about K (problem statement, certified bounds, upper bound, certificate mechanisms, superseded certificates, appendices) were not copied.

107 files, 1.8 MB.

| file | size | contents |
|---|---:|---|
| `MANUSCRIPT_DIGEST_K.md` | 47 KB | Digest of the October manuscript (5 November): the response class and 25 proved constraints on it, the restricted forms of K (K_η, K′, K_rot, response-body target), negative results, everything known about the A shell, statements that could close the core. |
| `README.md` | 11 KB | The manuscript's own map (25 October): which source file is in which part, what is superseded, how the stale markers were generated. |
| `legacy/appD-K-register-archive.tex` | 10 KB | Archived K register (20 October, before consolidation) |
| `legacy/ch11-structure.tex` | 19 KB | The structure behind Conjecture K: visible sectors, the theorem of 15 October, and what remains |
| `legacy/ch12-L2.tex` | 16 KB | L2: the sharp cubic contraction constant |
| `legacy/ch13-attemptK.tex` | 14 KB | A direct attempt at Conjecture K (15 October, night) |
| `legacy/ch14-kjoint.tex` | 49 KB | Four afternoon packages on Conjecture K: joint shared-driver certificates (13:13), the global residual theorem with local K (13:53), quantitative slack with the diagonal (14:47), and exact… |
| `legacy/ch15-weighted-content.tex` | 38 KB | The weighted content inequality: a dimension-free reduction of the odd sectors (15 October, late) |
| `legacy/ch16-certificates.tex` | 23 KB | Towards a $K_\eta$ certificate: the fibre majorant L1 measured over the row box, and K-a from the Lean moment constraints alone |
| `legacy/ch17-crossbound.tex` | 43 KB | Sharper variational certificates and exact-profile constraints (GPT package `crossbound-progress`, 15 October 17:22) |
| `legacy/ch19-spectral-review.tex` | 15 KB | Spectral obstruction: audit, quantitative scope, and extra charges (GPT review package `spectral-handoff-review`, 15 October 18:27) |
| `legacy/ch20-pinned-gate.tex` | 17 KB | Pinned gate, $\delta$-free profile optimisation, a local common-law certificate, and a first-chaos dual for K$'$ (upper-side GPT, 15 October 18:36) |
| `legacy/ch22-residual-cubics.tex` | 18 KB | $K_\eta$ for all remote cubics and the diagonal at the peak profile (upper-side GPT, 15 October 20:01) |
| `legacy/ch23-ab-attack.tex` | 14 KB | The remaining $A/B$ inequality after the residual-cubics theorem: budget, deficit, and what is left (15 October, night) |
| `legacy/ch24-remote-diagonal.tex` | 40 KB | Remote cubics with sharper slack and a stronger diagonal theorem (lower-bound GPT, 15 October 20:37) |
| `legacy/ch25-parts/00-origin-and-notation.tex` | 3.4 KB | Origin and notation: the 15 October introduction |
| `legacy/ch25-parts/10-exact-duals-rotation-profiles.tex` | 21 KB | A weaker row target retaining both squares |
| `legacy/ch25-parts/20-stability-and-smoothing.tex` | 24 KB | Gaussian localization for a weakened pinned conjecture |
| `legacy/ch25-parts/30-response-feasibility.tex` | 68 KB | Keeping the fixed first moment: remote feasibility and a four-block response dual |
| `legacy/ch25-parts/40-regional-and-cumulant-caps.tex` | 37 KB | From a joint support budget to a complete regional row cap |
| `legacy/ch25-parts/50-weighted-complement.tex` | 12 KB | Covering a support-interior region of the original response problem |
| `legacy/ch25-parts/60-anisotropic-cap.tex` | 14 KB | A sharp two-disk majorant and a larger original-response region |
| `legacy/ch25-parts/70-canonical-ellipse.tex` | 13 KB | Canonical response geometry, a closed-form ellipse, and a retained phase defect |
| `legacy/ch25-parts/80-response-moment-compressions.tex` | 8.1 KB | Polynomial multiplication compressions: direct response certificates |
| `legacy/ch25-parts/85-weighted-full-energy.tex` | 12 KB | Visible support and a weighted full-energy response region |
| `legacy/ch25-parts/86-canonical-feasibility.tex` | 13 KB | A canonical one-function response certificate |
| `legacy/ch25-parts/87-joint-response-defect.tex` | 11 KB | The exact joint-response defect |
| `legacy/ch25-parts/87-phase-lift-screening.tex` | 5.8 KB | A screening theorem and a finite obstruction for phase cuts |
| `legacy/ch25-parts/88-joint-dual-descent.tex` | 9.1 KB | Recovering the full joint defect and descending the exact dual |
| `legacy/ch25-parts/89-contact-concentration.tex` | 9.7 KB | An exact contact certificate for a dominant Wick direction |
| `legacy/ch25-parts/89b-mixed-contact.tex` | 9.1 KB | Mixed cubic concentration: two integrals and four endpoints |
| `legacy/ch25-parts/89c-slice-contact.tex` | 13 KB | From individual monomials to whole tensor subspaces |
| `legacy/ch25-parts/89d-two-slice-contact.tex` | 11 KB | Two interacting slices and a canonical many-slice reduction |
| `legacy/ch25-parts/89e-phase-preserving-contact.tex` | 11 KB | A sharp tensor support that preserves the Gaussian phase |
| `legacy/ch25-parts/89f-spherical-core-contact.tex` | 9.3 KB | Whole cubic cores: a two-profile spherical reduction |
| `legacy/ch25-parts/89g-conditional-gaussian-contact.tex` | 11 KB | Radial unimodality and a rank-free response certificate |
| `legacy/ch25-parts/90-corrections-and-historical-audit.tex` | 8.6 KB | Correction to the fixed-shift identity in ch:rescub |
| `legacy/ch25-parts/91-gaussian-point-and-cone-reach.tex` | 28 KB | The Gaussian point, the sector Hessian, and the reach of support cones |
| `legacy/ch25-parts/91b-independent-stein.tex` | 7.8 KB | A spectral Stein certificate below the moment-only floor |
| `legacy/ch25-parts/91c-joint-structure.tex` | 10 KB | Joint drivers, cubic-phase tails, and a common certificate |
| `legacy/ch25-parts/92-joint-sixth-formal.tex` | 14 KB | A common contraction budget for the sixth moment and Stein cuts |
| `legacy/ch25-weak-k.tex` | 6.7 KB | Original-response geometry and weaker sufficient targets for the lower bound |
| `legacy/ch27-shared-sector-refinements.tex` | 37 KB | Shared-sector comparisons under symmetry, a common-shift diagonal, and a law-sensitive rotation cost (lower-bound GPT, 15 October 23:28) |
| `legacy/ch28-coherent-wick-a.tex` | 32 KB | Exact Conjecture K for coherent Wick A-couplings and a dimension-free finite-coupling extension |
| `legacy/ch29-forest.tex` | 10 KB | Stepping back: a structural reassessment of Conjecture K (IDE, 20 October) |
| `legacy/ch30-gpt-forest.tex` | 19 KB | Lower-bound GPT's reassessment: a diffuse theorem, the conditioning budget, and an adaptive-response saddle (20 October) |
| `legacy/ch31-gpt-averaged.tex` | 16 KB | Lower-bound GPT: averaged profile comparison, the corrected gluing step, and a visible-averaged Laplace window (20 October) |
| `legacy/ch32-stronger.tex` | 17 KB | Stronger versions of K: what survives, what fails, and a visible-free reduction of the remote part (IDE, 20 October) |
| `legacy/ch33-gpt-polarized.tex` | 27 KB | Lower-bound GPT: exact K for the whole Gaussian covariance class of the odd and even sectors (20 October) |
| `legacy/ch34-gpt-shared-nongaussian.tex` | 32 KB | Lower-bound GPT: shared non-Gaussian $A/B$ couplings and a quantitative weak form of K (20 October) |
| `legacy/ch35-gpt-gaussian-remainder.tex` | 48 KB | Lower-bound GPT: shared $A/B$ for arbitrary Gaussian-factor drivers, and a $15/16$ Gaussian Young remainder (20 October) |
| `legacy/ch36-K-state.tex` | 48 KB | Conjecture K: current statement, register and open obligations |
| `legacy/ch37-gpt-response-stability.tex` | 35 KB | Lower-bound GPT: response stability of near-maximizers, exact K for one-coordinate remote cubics, and complex orbit constraints (20 October) |
| `legacy/ch38-near-maximizer-cuts.tex` | 21 KB | Near-maximizer cuts in the shared-reduction certificate: rotation stationarity and the fresh second-chaos lift (IDE, 20 October) |
| `legacy/ch39-gpt-self-interacting-ab.tex` | 39 KB | Self-interacting shared drivers: finite-amplitude A/B and a phase-sensitive reduction |
| `legacy/ch4-ceilings.tex` | 12 KB | Witness ceilings: numerical and proved |
| `legacy/ch40-gpt-global-local-K.tex` | 37 KB | Conjecture K: global exclusion regions and the full coupled tangent space |
| `legacy/ch41-all-a-proof.tex` | 11 KB | Every complex A and B amplitude on the application Wick box |
| `legacy/ch41-gpt-all-A-matrix.tex` | 17 KB | All-amplitude A on the shared Wick box, and a smaller matrix problem |
| `legacy/ch42-buffered-cubic-complement.tex` | 19 KB | A buffered Wick core with all internal interactions and a coupled complement |
| `legacy/ch43-exact-buffered-halfline.tex` | 17 KB | Exact K on a buffered Wick half-line and a radial contraction for every cubic |
| `legacy/ch44-buffer-bootstrap.tex` | 26 KB | A retained deficit down to buffer $0.164$, and contraction in every chaos degree |
| `legacy/ch45-zero-buffer-bootstrap.tex` | 25 KB | Zero-buffer continuation and positive shared content |
| `legacy/ch46-radial-directional-bootstrap.tex` | 21 KB | Radial directional costs and shared-content transport |
| `legacy/ch47-complex-complement-section.tex` | 5.8 KB | Lifting the new complex-anchor cover to arbitrary dimension |
| `legacy/ch47-cylinder-lifting-section.tex` | 3.7 KB | A finite cylinder lifting in arbitrary dimension |
| `legacy/ch47-profile-planes-section.tex` | 5.1 KB | A dimension-free exclusion for large shared-sector energy |
| `legacy/ch47-uniform-shared-bootstrap.tex` | 9.2 KB | Uniform shared-driver bounds and coupled cubic complements |
| `legacy/ch48-closure-consequences.tex` | 6.7 KB | Consequences of the complete one-driver comparison |
| `legacy/ch48-complete-coherent-driver.tex` | 12 KB | The complete coherent one-driver A/B comparison |
| `legacy/ch48-strip-bootstrap-section.tex` | 4.2 KB | Wider global strips by retaining the directional A penalty |
| `legacy/ch49-milestone-map.tex` | 4.6 KB | Finite shared spans and weighted complements |
| `legacy/ch5-negatives.tex` | 15 KB | Negative results on the lower side (do not repeat) |
| `legacy/ch50-independent-block-gluing.tex` | 13 KB | Conjecture K: a coherent core with an internally coupled external block |
| `legacy/ch51-two-coordinate-slab-gluing.tex` | 16 KB | The all-sector two-coordinate slab and a coupled remainder |
| `legacy/ch52-signed-fourth-order-gluing.tex` | 18 KB | Signed fourth-order gluing and internally coupled cubic blocks |
| `legacy/ch53-two-driver-cold.tex` | 60 KB | Independent self-interacting drivers: current regions and a common envelope |
| `legacy/ch54-weighted-complement.tex` | 19 KB | A weighted certificate for cubic terms mixing the core and its complement |
| `legacy/ch55-buffered-drivers.tex` | 76 KB | Buffered drivers: two drivers at every buffer $g\ge0.164$, and any number of small drivers |
| `legacy/ch56-coupled-tensor.tex` | 18 KB | Arbitrary coupled cubic tensors with unrestricted shared $A/B$ |
| `legacy/ch57-small-buffer-tensors.tex` | 23 KB | Small and zero buffer for arbitrary coupled cubic tensors |
| `legacy/ch58-circular-mean-exclusion.tex` | 12 KB | A circular-mean exclusion for the full odd shared family |
| `legacy/ch59-all-sector-audit-extension.tex` | 18 KB | All-sector anchors and a coupled-cubic extension |
| `legacy/ch60-l1l2-chaos21.tex` | 14 KB | A dimension-free $L^1/L^2$ bound on $H₂,₁$ via a two-plane small-ball estimate |
| `legacy/ch61-shared-a-regions.tex` | 5.4 KB | Shared-$A$ coupled cubics: two explicit regions (cold-start AI) |
| `legacy/ch62-spherical-kernel.tex` | 16 KB | A spherical-kernel L¹/L² radius for Wick cubics (E\|q\| < 0.9695084‖q‖₂), its row corollary, and an obstruction to a proposed lemma on S⁵ (digest §1 item 19, §3). |
| `legacy/ch7-conjectureK.tex` | 24 KB | Conjecture K: a sufficient Gaussian comparison for the cubic witness |
| `legacy/global-response/binding-audit-20261023.tex` | 5.4 KB | Reconstructing the binding certificate configurations |
| `legacy/global-response/common-stein-kernel-20261023.tex` | 10 KB | Common Stein kernels and a genuine-cubic floor for the frozen tables |
| `legacy/global-response/joint-response-lift-20261023.tex` | 25 KB | A shared Gram lift before the fibre supremum (23 October) |
| `legacy/global-response/spherical-dual-transfer.tex` | 9.6 KB | An exact spherical dual with a uniformly priced operator tail |
| `legacy/lower-bound/05-targets-register.tex` | 626 B | Current targets, reductions and proved regions |
| `legacy/lower-bound/06-original-responses.tex` | 698 B | Original responses, feasibility and regional caps |
| `legacy/lower-bound/07-remote-spectral.tex` | 804 B | Remote cubics, spectral constraints and diagonal costs |
| `legacy/lower-bound/08-shared-structure.tex` | 739 B | Shared-driver structure and exact-profile tools |
| `legacy/lower-bound/09-one-driver.tex` | 885 B | The coherent one-driver comparison |
| `legacy/lower-bound/10-coupled-complements.tex` | 978 B | Multiple drivers, coupled tensors and complements |
| `legacy/lower-bound/averaged-curvature-transfer.tex` | 4.3 KB | A quantitative use of the incoming property-$\mathcal P$ certificate |
| `legacy/lower-bound/obstruction-1402.tex` | 18 KB | Exactly what still obstructs $1.402$ |
| `legacy/lower-bound/real-stein-radius.tex` | 6.4 KB | A uniform scalar--Stein radius improvement (21 October) |
| `legacy/lower-bound/sharp-circular.tex` | 6.6 KB | A nearly optimal circular-mean slope and a larger shared-A region |
| `legacy/lower-bound/sharp-influence.tex` | 5.2 KB | The sharp global influence coefficient: reconciliation and proof |
| `legacy/lower-bound/sixth-moment-bridge.tex` | 11 KB | The sixth-moment tensor bridge and the Gaussian vector witness |
| `new/legacy-reading-guide.tex` | 8.6 KB | How to read this document |
| `new/symmetric-response-replicas-20261023.tex` | 17 KB | A symmetry-closed response map and original-noise replicas |
| `new/withdrawn.tex` | 2.2 KB | Withdrawn and corrected claims (index) |
| `stale-annotations.md` | 13 KB | List of the 165 dated `\stale{…}` markers by file and line (endpoints and hypotheses superseded by 25 October). |

### `code/kscan-2026-11-13/`: scripts and results of the global search

13 files, 230 KB.

| file | size | contents |
|---|---:|---|
| `kscan.py` | 4.4 KB | Pass 1: full Wick basis of H₂,₁(ℂⁿ), L-BFGS with analytic gradient on a Monte Carlo sample, every end point re-evaluated on 8 × 2²⁰ fresh samples with a jackknife error. |
| `kscan2.py` | 4.5 KB | Pass 2: the same with restart 0 of every seed started next to the Wick monomial. |
| `out1-summary.json` | 15 KB | Summary of pass 1 generated on 15 November from the 180 output files (840 runs): per (n, u) the number of runs, best re-evaluated ratio with its error and fourth excess; all runs of pass 2 without their coefficient vectors. Reproduces the README tables. Generated by `out1_summary.py`. |
| `out1_summary.py` | 3.1 KB | Generator of `out1-summary.json` (written on 15 November): reads the pass-1 and pass-2 output folders and drops the coefficient vectors. Usage: `python3 out1_summary.py OUT1_DIR OUT2_DIR OUTPUT.json`. |
| `out2/n10-u0.0463-s0.jsonl` | 50 KB | Pass 2, n = 10, seed 0 (two runs; the second n = 10 process did not report). |
| `out2/n6-u0.0463-s0.jsonl` | 18 KB | Pass 2, n = 6, seed 0: one JSON line per run (re-evaluated ratio R, its error, deficit, fourth excess, coefficients). |
| `out2/n6-u0.0463-s1.jsonl` | 18 KB | Pass 2, n = 6, seed 1. |
| `out2/n6-u0.0463-s2.jsonl` | 18 KB | Pass 2, n = 6, seed 2. |
| `out2/n6-u0.0463-s3.jsonl` | 18 KB | Pass 2, n = 6, seed 3. |
| `out2/n8-u0.0463-s0.jsonl` | 26 KB | Pass 2, n = 8, seed 0. |
| `out2/n8-u0.0463-s1.jsonl` | 26 KB | Pass 2, n = 8, seed 1. |
| `out2/n8-u0.0463-s2.jsonl` | 26 KB | Pass 2, n = 8, seed 2. |
| `tables.py` | 1.7 KB | Tabulates φ(v) = 2E\|L + √v\| and the A-profile g by quadrature on a grid in √v (peak row). |

### `code/tailgames-2026-11-14/`: scripts of the identity-tail exploration

9 files, 22 KB.

| file | size | contents |
|---|---:|---|
| `cutplane.py` | 3.6 KB | claude-b9ee, 14 Nov 2026. min over games (1, l1..lD, nu, nu, ...) of the model norm, by cutting planes: |
| `hdecomp.py` | 2.0 KB | Decompose the best driver response pair of a game by degree in the driver w: |
| `hess.py` | 1.0 KB | Second-variation (sector) analysis of the plain phase response for the game (1,-eps,mu,mu,...). |
| `mellin2.py` | 1.2 KB | Test of the convexity of p ↦ log(E\|X\|^p / E\|N\|^p) for Hermite chaos He₂ … He₆ (refuted on p ∈ (−0.8, 0.4); README section 5). |
| `model3.py` | 3.3 KB | Extended graded model: z (grade 1), w (grade 3, complex), xi (real Gaussian of bidegree (1,1), correlation \|s\|^2). |
| `psidual.py` | 1.7 KB | Check: Psi_nu(A,B) = max_{\|u\|=\|v\|=1} Re(conj(u)A)+Re(conj(v)B)+nu Re(u conj(v)) equals (1/2) min{tr D : D diagonal, D - M >= 0} |
| `scan2.py` | 1.2 KB | map N(eps, mu) for the game (1, -eps, mu, mu, ...): driver (Krivine) branch vs visible branch, and the flip amplitude |
| `scan3.py` | 1.2 KB | map N(eps, mu) for the game (1, -eps, mu, mu, ...): driver (Krivine) branch vs visible branch, and the flip amplitude |
| `tailmodel.py` | 6.5 KB | claude-b9ee, 14 Nov 2026. Model norms of games lambda = (1, l1, ..., lD, nu, nu, ...) (finite head + identity tail) |

### `code/kprime-2026-11-15/`: scripts and logs of the follow-up of 15 November

Peak row; NumPy and SciPy; deterministic quadrature, no sampling. The logs are small and are kept because the write-up (`sources/numerics-kprime-2026-11-15/README.md`) cites them as its record; `tilt_restricted_67.log` is cited by the first review of the report on the tilted sector and by `STATUS.md`, 11.17. The records of the searches are in `search/` (two remote variables) and `search3/` (three). The one-sector script of the global remainder bound, `secant_curvature.py`, is in `code/tilted-sector-2026-11-15/`.

27 files, 71 KB.

| file | size | contents |
|---|---:|---|
| `cs_check.log` | 1.4 KB | Its output for u = 0.01, 0.0463, 0.09 and s = 0, 0.3434, 0.6, 0.75. |
| `cs_check.py` | 2.0 KB | The Cauchy–Schwarz bound on the tilted content of the Wick monomial against the true content. |
| `cs_gauss.log` | 701 B | Its output: the loss for u = 0.02 to 0.08 at six tilts and at the best tilt, against the slack 1.31·10⁻⁴ of the target 1.402. |
| `cs_gauss.py` | 2.1 KB | The Cauchy–Schwarz bound as a functional of the law of \|q\|², evaluated for the exponential law (Gaussian q, where the true content is 0 and the bound is pure loss). |
| `family.log` | 3.0 KB | Its output for m = 1, 2, 3, 5, 10, 30, 100 bath variables and the Gaussian limit at u = 0.02, 0.0463, 0.09: the largest K ratio and the largest retained ratio over the mixing angle, and the retained ratio at the K maximiser. |
| `family.py` | 3.7 KB | The family q = X[c₁(\|X\|²−2)/√2 + c₂S_m/√m] with m bath variables and its Gaussian limit: K and retained ratios maximised over the mixing angle. |
| `kprime2.py` | 8.6 KB | Sector gain with and without the retained element for all tensors of H₂,₁(ℂ²) of fixed energy: deterministic quadrature, exact gradients, L-BFGS over the tensor with the saddle in (α, γ) solved inside. Modes `k`, `kp`, `eval`, `recheck`. |
| `kprime2b.py` | 4.7 KB | The same functional with the B-sector added, evaluated at given tensors only (the visible phase is integrated numerically; the tensor is not re-optimised). |
| `kprime2s.py` | 5.7 KB | As `kprime2.py` with the retained element tied to the sector, u = −s·r, at a fixed tilt s. |
| `kprime3.py` | 5.9 KB | As `kprime2.py` for three remote variables (18 complex coefficients), on a coarser grid. Its records are in `search3/`. |
| `ratio_small_v.log` | 661 B | Its output for v = 10⁻⁶ to 3·10⁻²: j₀ − j, g − g₀ and their ratio (1.2909 at v = 10⁻⁶, 1.2908 at 10⁻⁴, 1.2902 at 10⁻³, 1.2837 at 10⁻², 1.2700 at 3·10⁻²). |
| `ratio_small_v.py` | 1.3 KB | The profile ratio (g(v) − g₀)/(j₀ − j(v)) at small v by adaptive quadrature, written to see whether the non-monotone first entry of `tilt_profiles.log` is real. |
| `retained_content.log` | 872 B | Its output for u = 0.00551 to 0.07: D, both gains with the optimal amplitudes, both ratios to D. |
| `retained_content.py` | 2.1 KB | The Wick monomial with the A-sector: exact K gain and retained gain (the minimum over the retained element inside the supremum over the sector), by quadrature. |
| `retained_joint.log` | 756 B | Its output for u = 0.01 to 0.0463: the table of section 4 of the write-up. |
| `retained_joint.py` | 2.5 KB | The Wick monomial with the A- and B-sectors jointly, with and without the retained element (real amplitudes). |
| `secant_all_sectors.py` | 5.6 KB | All five visible sectors of K at a remote base (A, B, z₁Q, z̄₁P and the one-coordinate cubic ν·z₁(T − 2)/√2): each sector alone on a grid, then all together by multistart local minimisation of p − Rem/\|r\|², each minimum rechecked on a finer quadrature; the option `--no-nu` leaves out the one-coordinate cubic (`STATUS.md`, 11.45). |
| `secant_all_sectors_no_nu.log` | 1.7 KB | Its output with `--no-nu`: one sector at a time (A 0.3206, B 0.7052, z₁Q 0.1286, z̄₁P 0.6229, ν 0.3305), then 400 starts: smallest margin 0.1284, in the pure z₁Q direction at the origin. |
| `secant_all_sectors_with_nu.log` | 1.7 KB | Its output with the one-coordinate cubic: the same single-sector values, then 60 starts: smallest margin −0.3871, with energy fractions about .58 in z₁Q and .42 in ν at the origin (not coefficient magnitudes; phases also matter), and the note on the cross term −0.608. |
| `secant_joint.log` | 1.4 KB | Its output at the tilts (0, 0), (0.6, 0), (0.5, 0), (0.3434, 0): the margin by angle fraction θ/(π/2), where B energy is sin²θ and the smallest margin with its place (0.2996 for K, 0.2524 at (0.6, 0), 0.3649 at (0.5, 0), 0.4672 at (0.3434, 0)). |
| `secant_joint.py` | 4.3 KB | The remainder of the A and B shells together at a remote base, for K and at the tilts (s_A, s_B): the smallest margin p − Rem/\|r\|² over directions (angle fraction θ/(π/2), not B-energy share), amplitudes, phases and base values, by grids (`STATUS.md`, 11.45; section 12 of the write-up). |
| `tilt_profiles.log` | 1.6 KB | Its output: j₀, g₀, k_A; (g − g₀)/(j₀ − j) for v from 10⁻⁴ to 10⁴ and its limit 0.58321; unrestricted second-derivative suprema for seven tilts, with the resulting global costs (all negative). Its ratio at v = 10⁻⁴ is a quadrature error of the fixed grid (see `ratio_small_v.log`). |
| `tilt_profiles.py` | 3.4 KB | The profiles j and g and their ratio, the local cost k(s), and a global bound on the second derivative along the tilted direction. |
| `tilt_restricted.log` | 579 B | Its output: Θ(R) for R = 0 to 0.5 at the tilts s = 0, 0.2, 0.3434, 0.5, with the budget p − s². |
| `tilt_restricted.py` | 2.3 KB | The second-derivative bound along the tilted direction restricted to base points with \|ρ\| ≤ R (grid search). |
| `tilt_restricted_67.log` | 351 B | Its output: Θ(R) for R = 0 to 0.5 at the tilts s = 0.6 and 0.7, with the budget p − s². The value 0.7086 at s = 0.6, R = 0.3 is the numerical counterpart of the curvature inequality of `STATUS.md`, 11.33. |
| `tilt_restricted_67.py` | 2.3 KB | `tilt_restricted.py` with the tilts s = 0.6 and 0.7 (the two scripts differ in one line). It was put in the archive after the first version of the report on the tilted sector had noted that no script there produced these values. Its file is dated after its log (03:31 against 03:07 on 15 November); a run made when this folder was updated reproduced the log exactly. |

### `code/kprime-2026-11-15/search/`: records of the searches over two-variable tensors

Each run has a `.log` (one line per record) and a `.jsonl` (the same records with the tensor: `c_re`, `c_im` are the six coefficients in the basis of `kprime2.py`). Fields of `k_*`, `kp_*` and `fine_*`: `D` the deficit, `gK`, `gP` the K gain and the retained gain, `RK`, `RP` their ratios to D, `C2D` the content ratio C²/D on the same grid, `mu2` = ‖μ‖², `d4` = E\|q\|⁴/u² − 2, `alk`, `alp`, `gap` the optimal amplitudes, `res` the residual of the inner saddle. In a file name the energy is written as a decimal or as four digits (`0463` = 0.0463); `s<n>` is the seed. The initial copy was made while the working folder was being written; #408 refreshed these records after the runs finished (INVENTORY, STATUS 11.20).

50 files, 65 KB.

| file | size | contents |
|---|---:|---|
| `b_0200.jsonl` | 1.1 KB | `kprime2b.py`: the B-sector added at the monomial and at the best tensors of the searches, u = 0.02 (JSON lines, one record per line with the tensor coefficients). |
| `b_0200.log` | 324 B | `kprime2b.py`: the B-sector added at the monomial and at the best tensors of the searches, u = 0.02 (log, one line per record). |
| `b_0463.jsonl` | 1.8 KB | `kprime2b.py`: the B-sector added at the monomial and at the best tensors of the searches, u = 0.0463 (JSON lines, one record per line with the tensor coefficients). |
| `b_0463.log` | 486 B | `kprime2b.py`: the B-sector added at the monomial and at the best tensors of the searches, u = 0.0463 (log, one line per record). |
| `b_0900.jsonl` | 1.1 KB | `kprime2b.py`: the B-sector added at the monomial and at the best tensors of the searches, u = 0.09 (JSON lines, one record per line with the tensor coefficients). |
| `b_0900.log` | 324 B | `kprime2b.py`: the B-sector added at the monomial and at the best tensors of the searches, u = 0.09 (log, one line per record). |
| `fine_0200.jsonl` | 1.4 KB | `kprime2.py`, mode `recheck` on the finer grid: the best records of the searches and the monomial re-evaluated, u = 0.02 (JSON lines, one record per line with the tensor coefficients). |
| `fine_0200.log` | 324 B | `kprime2.py`, mode `recheck` on the finer grid: the best records of the searches and the monomial re-evaluated, u = 0.02 (log, one line per record). |
| `fine_0463.jsonl` | 3.9 KB | `kprime2.py`, mode `recheck` on the finer grid: the best records of the searches and the monomial re-evaluated, u = 0.0463 (JSON lines, one record per line with the tensor coefficients). |
| `fine_0463.log` | 815 B | `kprime2.py`, mode `recheck` on the finer grid: the best records of the searches and the monomial re-evaluated, u = 0.0463 (log, one line per record). |
| `k_0.02_s0.jsonl` | 2.4 KB | `kprime2.py`, mode `k`: search maximising the K ratio gain/D over the two-variable tensors of energy u = 0.02, seed 0 (JSON lines, one record per line with the tensor coefficients). |
| `k_0.02_s0.log` | 480 B | `kprime2.py`, mode `k`: search maximising the K ratio gain/D over the two-variable tensors of energy u = 0.02, seed 0 (log, one line per record). |
| `k_0.09_s0.jsonl` | 2.4 KB | `kprime2.py`, mode `k`: search maximising the K ratio gain/D over the two-variable tensors of energy u = 0.09, seed 0 (JSON lines, one record per line with the tensor coefficients). |
| `k_0.09_s0.log` | 480 B | `kprime2.py`, mode `k`: search maximising the K ratio gain/D over the two-variable tensors of energy u = 0.09, seed 0 (log, one line per record). |
| `k_0463_s0.jsonl` | 2.4 KB | `kprime2.py`, mode `k`: search maximising the K ratio gain/D over the two-variable tensors of energy u = 0.0463, seed 0 (JSON lines, one record per line with the tensor coefficients). |
| `k_0463_s0.log` | 480 B | `kprime2.py`, mode `k`: search maximising the K ratio gain/D over the two-variable tensors of energy u = 0.0463, seed 0 (log, one line per record). |
| `kp_0.005_s0.jsonl` | 2.5 KB | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.005, seed 0 (JSON lines, one record per line with the tensor coefficients). |
| `kp_0.005_s0.log` | 480 B | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.005, seed 0 (log, one line per record). |
| `kp_0.01_s0.jsonl` | 2.4 KB | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.01, seed 0 (JSON lines, one record per line with the tensor coefficients). |
| `kp_0.01_s0.log` | 480 B | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.01, seed 0 (log, one line per record). |
| `kp_0.03_s0.jsonl` | 2.4 KB | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.03, seed 0 (JSON lines, one record per line with the tensor coefficients). |
| `kp_0.03_s0.log` | 480 B | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.03, seed 0 (log, one line per record). |
| `kp_0.065_s0.jsonl` | 2.4 KB | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.065, seed 0 (JSON lines, one record per line with the tensor coefficients). |
| `kp_0.065_s0.log` | 480 B | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.065, seed 0 (log, one line per record). |
| `kp_0.15_s0.jsonl` | 2.4 KB | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.15, seed 0 (JSON lines, one record per line with the tensor coefficients). |
| `kp_0.15_s0.log` | 480 B | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.15, seed 0 (log, one line per record). |
| `kp_0200_s0.jsonl` | 2.4 KB | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.02, seed 0 (JSON lines, one record per line with the tensor coefficients). |
| `kp_0200_s0.log` | 480 B | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.02, seed 0 (log, one line per record). |
| `kp_0463_s0.jsonl` | 2.4 KB | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.0463, seed 0 (JSON lines, one record per line with the tensor coefficients). |
| `kp_0463_s0.log` | 480 B | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.0463, seed 0 (log, one line per record). |
| `kp_0463_s1.jsonl` | 2.4 KB | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.0463, seed 1 (JSON lines, one record per line with the tensor coefficients). |
| `kp_0463_s1.log` | 480 B | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.0463, seed 1 (log, one line per record). |
| `kp_0463_s2.jsonl` | 2.4 KB | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.0463, seed 2 (JSON lines, one record per line with the tensor coefficients). |
| `kp_0463_s2.log` | 480 B | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.0463, seed 2 (log, one line per record). |
| `kp_0900_s0.jsonl` | 2.4 KB | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.09, seed 0 (JSON lines, one record per line with the tensor coefficients). |
| `kp_0900_s0.log` | 480 B | `kprime2.py`, mode `kp`: search maximising the retained ratio gain/D over the two-variable tensors of energy u = 0.09, seed 0 (log, one line per record). |
| `tilt_0.3434_0463.jsonl` | 1.9 KB | `kprime2s.py`: search with the retained element tied to the sector at the fixed tilt s = 0.3434, u = 0.0463 (JSON lines, one record per line with the tensor coefficients). |
| `tilt_0.3434_0463.log` | 468 B | `kprime2s.py`: search with the retained element tied to the sector at the fixed tilt s = 0.3434, u = 0.0463 (log, one line per record). |
| `tilt_0.5_0200.jsonl` | 1.9 KB | `kprime2s.py`: search with the retained element tied to the sector at the fixed tilt s = 0.5, u = 0.02 (JSON lines, one record per line with the tensor coefficients). |
| `tilt_0.5_0200.log` | 468 B | `kprime2s.py`: search with the retained element tied to the sector at the fixed tilt s = 0.5, u = 0.02 (log, one line per record). |
| `tilt_0.5_0463.jsonl` | 1.9 KB | `kprime2s.py`: search with the retained element tied to the sector at the fixed tilt s = 0.5, u = 0.0463 (JSON lines, one record per line with the tensor coefficients). |
| `tilt_0.5_0463.log` | 468 B | `kprime2s.py`: search with the retained element tied to the sector at the fixed tilt s = 0.5, u = 0.0463 (log, one line per record). |
| `tilt_0.6_0200.jsonl` | 1.9 KB | `kprime2s.py`: search with the retained element tied to the sector at the fixed tilt s = 0.6, u = 0.02 (JSON lines, one record per line with the tensor coefficients). |
| `tilt_0.6_0200.log` | 468 B | `kprime2s.py`: search with the retained element tied to the sector at the fixed tilt s = 0.6, u = 0.02 (log, one line per record). |
| `tilt_0.6_0463.jsonl` | 1.9 KB | `kprime2s.py`: search with the retained element tied to the sector at the fixed tilt s = 0.6, u = 0.0463 (JSON lines, one record per line with the tensor coefficients). |
| `tilt_0.6_0463.log` | 468 B | `kprime2s.py`: search with the retained element tied to the sector at the fixed tilt s = 0.6, u = 0.0463 (log, one line per record). |
| `tilt_0.7_0200.jsonl` | 1.9 KB | `kprime2s.py`: search with the retained element tied to the sector at the fixed tilt s = 0.7, u = 0.02 (JSON lines, one record per line with the tensor coefficients). |
| `tilt_0.7_0200.log` | 468 B | `kprime2s.py`: search with the retained element tied to the sector at the fixed tilt s = 0.7, u = 0.02 (log, one line per record). |
| `tilt_0.7_0463.jsonl` | 1.9 KB | `kprime2s.py`: search with the retained element tied to the sector at the fixed tilt s = 0.7, u = 0.0463 (JSON lines, one record per line with the tensor coefficients). |
| `tilt_0.7_0463.log` | 468 B | `kprime2s.py`: search with the retained element tied to the sector at the fixed tilt s = 0.7, u = 0.0463 (log, one line per record). |

### `code/kprime-2026-11-15/search3/`: records of the search over three-variable tensors

Written by `kprime3.py`; a `.log` (one line per record) and a `.jsonl` (the same records with the 18 tensor coefficients `c_re`, `c_im`) per run. Fields: `D`, `gK`, `gP`, `RK`, `RP`, `d4`, `res` as in `search/`, `grid` the grid parameters, and for the searches `opt`, `iters`, `secs`. Final state: every run has both restarts (files dated 15 November 04:14). The launcher of the runs and its empty log are not copied (`INVENTORY.md`, section 4).

18 files, 23 KB.

| file | size | contents |
|---|---:|---|
| `eval3.jsonl` | 2.5 KB | `kprime3.py`, mode `eval`, u = 0.0463: the monomial, the monomial in rotated coordinates and two structured tensors on the three-variable grid (JSON lines, one record per line with the tensor coefficients). |
| `eval3.log` | 731 B | `kprime3.py`, mode `eval`, u = 0.0463: the monomial, the monomial in rotated coordinates and two structured tensors on the three-variable grid (log, one line per record). |
| `k3_0463_s0.jsonl` | 2.2 KB | `kprime3.py`, mode `k`: search maximising the K ratio gain/D over the three-variable tensors of energy u = 0.0463, seed 0 (JSON lines, one record per line with the tensor coefficients). |
| `k3_0463_s0.log` | 308 B | `kprime3.py`, mode `k`: search maximising the K ratio gain/D over the three-variable tensors of energy u = 0.0463, seed 0 (log, one line per record). |
| `kp3_0200_s0.jsonl` | 2.2 KB | `kprime3.py`, mode `kp`: search maximising the retained ratio gain/D over the three-variable tensors of energy u = 0.02, seed 0 (JSON lines, one record per line with the tensor coefficients). |
| `kp3_0200_s0.log` | 308 B | `kprime3.py`, mode `kp`: search maximising the retained ratio gain/D over the three-variable tensors of energy u = 0.02, seed 0 (log, one line per record). |
| `kp3_0200_s1.jsonl` | 2.2 KB | `kprime3.py`, mode `kp`: search maximising the retained ratio gain/D over the three-variable tensors of energy u = 0.02, seed 1 (JSON lines, one record per line with the tensor coefficients). |
| `kp3_0200_s1.log` | 308 B | `kprime3.py`, mode `kp`: search maximising the retained ratio gain/D over the three-variable tensors of energy u = 0.02, seed 1 (log, one line per record). |
| `kp3_0300_s0.jsonl` | 2.2 KB | `kprime3.py`, mode `kp`: search maximising the retained ratio gain/D over the three-variable tensors of energy u = 0.03, seed 0 (JSON lines, one record per line with the tensor coefficients). |
| `kp3_0300_s0.log` | 308 B | `kprime3.py`, mode `kp`: search maximising the retained ratio gain/D over the three-variable tensors of energy u = 0.03, seed 0 (log, one line per record). |
| `kp3_0463_s0.jsonl` | 2.2 KB | `kprime3.py`, mode `kp`: search maximising the retained ratio gain/D over the three-variable tensors of energy u = 0.0463, seed 0 (JSON lines, one record per line with the tensor coefficients). |
| `kp3_0463_s0.log` | 308 B | `kprime3.py`, mode `kp`: search maximising the retained ratio gain/D over the three-variable tensors of energy u = 0.0463, seed 0 (log, one line per record). |
| `kp3_0463_s1.jsonl` | 2.2 KB | `kprime3.py`, mode `kp`: search maximising the retained ratio gain/D over the three-variable tensors of energy u = 0.0463, seed 1 (JSON lines, one record per line with the tensor coefficients). |
| `kp3_0463_s1.log` | 308 B | `kprime3.py`, mode `kp`: search maximising the retained ratio gain/D over the three-variable tensors of energy u = 0.0463, seed 1 (log, one line per record). |
| `kp3_0463_s2.jsonl` | 2.2 KB | `kprime3.py`, mode `kp`: search maximising the retained ratio gain/D over the three-variable tensors of energy u = 0.0463, seed 2 (JSON lines, one record per line with the tensor coefficients). |
| `kp3_0463_s2.log` | 308 B | `kprime3.py`, mode `kp`: search maximising the retained ratio gain/D over the three-variable tensors of energy u = 0.0463, seed 2 (log, one line per record). |
| `kp3_0463_s3.jsonl` | 2.2 KB | `kprime3.py`, mode `kp`: search maximising the retained ratio gain/D over the three-variable tensors of energy u = 0.0463, seed 3 (JSON lines, one record per line with the tensor coefficients). |
| `kp3_0463_s3.log` | 308 B | `kprime3.py`, mode `kp`: search maximising the retained ratio gain/D over the three-variable tensors of energy u = 0.0463, seed 3 (log, one line per record). |

### `code/tilted-sector-2026-11-15/`: the verifiers of the report on the tilted sector, their inputs, the probes, and the scripts and logs of its reviews

The verifiers and probes are by codex-6e2b; `check_tilt_report*`, `secant_curvature.*`, `deficit_vs_bound.*`, `tilt_choice.*` and `replay_version5.log` are by claude-b9ee (NumPy, SciPy and mpmath), and their logs are kept because the reviews cite them as their record. `review4/` holds the scripts and two logs of the fourth review, written by a reviewer agent of claude-b9ee's session in a scratch folder: they are not working files of the delivery, each script has one header line saying so, and they read the author's witnesses from the working folder by absolute path; their numerical tables (`tables.npz`, `m2.npz`) and the output `family_rows.json` are not kept (`INVENTORY.md`). `verify.py` is the verifier of the sixth version and `verify_secant_history.py` that of the fifth: `python3 -I verify.py` runs the exact comparisons and then, compiled in a temporary subfolder, the C++ checkers and the Arb certificates; it needs `clang++` with directed rounding and an interpreter with python-flint (environment variable `TILTED_FLINT_PYTHON`); `--algebra-only` needs neither. The SHA-256 of their files are printed in `sources/received-2026-11-15-tilted-sector/results.txt` and `results_secant_history.txt` and are those of the copies here. `first-version/verify.py` is the verifier that the first review covers (standard library only, with the option `--numerical` for NumPy and SciPy); it was replayed again when this folder was first updated, without and with that option, with outputs identical to `preliminary_results.txt`. `second-version/verify.py` is the verifier that the second review replayed, and `fourth-version/verify.py` the verifier of the fourth version; the working files of all three were overwritten by their author. Statuses: `STATUS.md`, section 11 (b).

90 files, 701 KB.

| file | size | contents |
|---|---:|---|
| `audit_curvature.py` | 4.0 KB | Floating-point diagnostic of the curvature inequality (`STATUS.md`, 11.33), delivered with the second version and without output. One run made when this folder was updated (Python 3.12.3, NumPy 2.3.5, SciPy 1.17.1) printed "rho=.3, w=0.640204417: eigen=0.709425575423, relaxed=0.759693013642" and "rho=.3, w=0.683589101: eigen=0.703877110285, relaxed=0.763469870441": the largest eigenvalue of the Hessian, and the integral of the pointwise largest eigenvalue, which is above 3/4. |
| `check_tilt_report.log` | 1.1 KB | Its output: the supremum 0.298834 of (C(t) − 1)/t², at t = 1.4525; the two constants of the global bound by quadrature; no violation of the global bound on the grid; and on the Wick monomial the content², δ and D at u = 0.0005, 0.005, 0.02, 0.0463. Its figures for sup m_h (244.39) and for the structural bound are an artefact of a spline (`sources/status-2026-11-15/STATUS_with_history.md`, section 14, item 42; the values of `STATUS.md` 11.29 are in `check_tilt_report_2_part2.log`). |
| `check_tilt_report.py` | 3.6 KB | The floating-point checks of the first review (claude-b9ee): the circular-mean inequality on t ∈ [0, 200]; the constants and the global bound on the Wick monomial; m_h and the structural bound against the true content and the deficit on the Wick monomial (see the remark on its log). |
| `check_tilt_report_2.py` | 5.9 KB | The floating-point checks of the second review (claude-b9ee; mpmath and NumPy): the Hessian entries of the tilted profile by two routes, the suprema of N_Φ and of m_h, the range of h_{3/5}, and the two structural bounds on the Wick monomial. |
| `check_tilt_report_2_part1.log` | 2.3 KB | Its output, first run: steps 1 and 2 (sup N_Φ = 0.295722 at R = 0.2320; sup m_h = 1.34998 at v = 0.0635); the run stops with an error in step 3. |
| `check_tilt_report_2_part2.log` | 1.3 KB | Its output, second run: sup N_Φ and sup m_h again, the range of h_{3/5} (maximum 0.251875 at v = 1.3456), and the corrected structural bound on the Wick monomial beside (2/25)·δ at six energies. |
| `check_tilt_report_3.log` | 1.8 KB | Its output: formula (8) agrees with the differences; on [0, 8] sup \|m″\| = 1.443, min m″ = −0.465 and max m″ ≈ 0 on [1, 8]; sup \|k_u\| = 0.6229, 0.5915, 0.5749 at u = 0.03, 0.0403, 0.0463 (claim ≤ 0.626); the content coefficient (2/3)·sup N_Ψ = 0.0369, 0.0333, 0.0314 (certified 0.0399); the angular identity holds. |
| `check_tilt_report_3.py` | 4.8 KB | The floating-point checks of the third review (claude-b9ee; NumPy): m′ and m″ by the density formula (8) of `secant_content_proof.md` against differences of m; sup \|k_u\| and sup N_Ψ at u = 0.03, 0.0403, 0.0463; the angular identity and the quartic of the angular bound; γ and k. |
| `check_tilt_report_3_rationals.log` | 1.5 KB | Exact recomputations of the third review: the exterior constant 3603551/5604000 < 13/20 with its pieces, the small-amplitude constants (γ > 49/100, the bound 0.268 < 0.27, row 161 of the candidates), M < 3/4, k = 59009/189100, the endpoints of the assembly table and κ, η of (5). Written by `check_tilt_report_3_rationals.py`. |
| `check_tilt_report_3_rationals.py` | 2.6 KB | The script that writes the log above (exact `Fraction` arithmetic, standard library only); added on 15 November because the third review had first run it inline. |
| `content_next_bound.py` | 5.8 KB | Arb certificate of the uniform bound ‖c_{3/5}(q)‖ ≤ 1/50 (third version): profile table and dual envelope; needs python-flint and the two scripts below. |
| `content_next_m3.py` | 5.8 KB | Arb certificate of sup \|m‴\| < 13 for m(x) = E[(T − 2/5)·sign(Re L + x)] (fourth version), behind the bound 3·δ^{3/2}; the fifth version also imports its moment formulas. |
| `content_profile.py` | 9.6 KB | Arb certificate of sup N_Φ < 1/3 for the Hessian norm of the tilted profile (second version), behind the bound (2/25)·δ; the fifth version imports its interval helpers. |
| `deficit_angular_prepare.py` | 1.4 KB | Script of the sixth version: serializes the certified absolute envelopes outward for the angular checker. |
| `deficit_angular_verify.cpp` | 4.7 KB | Script of the sixth version: checker in C++ with directed rounding of the angular one-switch bound on 400 radial intervals of [0, 2] with 4,096 angular cells each, and the tail R ≥ 2. |
| `deficit_audit_moments.py` | 3.4 KB | Script of the author's audit: an exact obstruction to a moment-only relaxation with separate envelopes (not a cubic counterexample). |
| `deficit_barriers_replay.py` | 2.1 KB | Script of the sixth version: recomputes the common source m″, the bound on m⁗ and the outer inequalities once, then checks every rational barrier of the ten coefficients. |
| `deficit_cover_union.py` | 2.5 KB | Script of the sixth version: the exact union of the moment and Stein boxes over [0, 463/10000] × [0, 42] (geometry only; the boxes are certified by their own checkers in the same chain). |
| `deficit_dual_cover_enrich.py` | 2.5 KB | Script of the sixth version: floating-point search of extra dual candidates at uncovered points (**N**). |
| `deficit_dual_cover_search.py` | 5.6 KB | Script of the sixth version: floating-point candidate search for the Stein cover (**N**). |
| `deficit_dual_cover_verify.py` | 8.1 KB | Script of the sixth version: exact and Arb acceptance of the Stein cover: fresh profile integration, exact global polynomial tests of the proposed duals, endpoint budgets and the energy interpolation allowance. |
| `deficit_dual_exact.py` | 7.3 KB | Script of the sixth version: exact global acceptance of dual candidates at single nodes, with the Gaussian benchmark integrated afresh. |
| `deficit_dual_profile_caps.py` | 2.0 KB | Script of the sixth version: certifies the ten additional Hermite caps on [2, 64] and the tangent beyond. |
| `deficit_dual_search.py` | 8.0 KB | Script of the sixth version: floating-point search of spectral Stein dual candidates (**N**). |
| `deficit_exact.py` | 1.3 KB | Script of the sixth version: the exact constants of the assembly (κ < 1, η < 2·10⁻⁵, the bound −3 < h″). |
| `deficit_gaussian.py` | 1.2 KB | Script of the sixth version: Arb enclosures of the Gaussian benchmark B(u) by the Rice formula. |
| `deficit_moment_mid.py` | 5.8 KB | Script of the sixth version: an exploratory moment cover of middle energies, left incomplete; not an input of the theorem. |
| `deficit_moment_prefix.py` | 5.8 KB | Script of the sixth version: the exact moment cover of [9/1000, 2/125] (every box must be accepted). |
| `deficit_moment_probe.py` | 2.1 KB | Script of the sixth version: a two-node moment relaxation of the comparison (**N**). |
| `deficit_moment_refine.py` | 5.8 KB | Script of the sixth version: refines certified moment boxes with stronger content bounds; not run for the final chain. |
| `deficit_moment_verify.py` | 7.5 KB | Script of the sixth version: the exact low-energy moment cover of [0, 9/1000] with fresh Hermite caps and benchmarks. |
| `deficit_structure_absolute_low_verify.py` | 3.6 KB | Script of the sixth version: Arb acceptance of the absolute envelopes from 0.03 and 0.035. |
| `deficit_structure_content_search.py` | 3.2 KB | Script of the sixth version: floating-point search of supersolutions (**N**). |
| `deficit_structure_content_verify.py` | 3.6 KB | Script of the sixth version: Arb acceptance of the energy-dependent content barriers. |
| `deficit_structure_content_witness_absolute.json` | 26 KB | Input of the verifier: the rational barrier of the coefficient that starts at 1/25, with its absolute envelope. |
| `deficit_structure_content_witness_absolute30.json` | 26 KB | Input of the verifier: the rational barrier of the coefficient that starts at 3/100, with its absolute envelope. |
| `deficit_structure_content_witness_absolute35.json` | 26 KB | Input of the verifier: the rational barrier of the coefficient that starts at 7/200, with its absolute envelope. |
| `deficit_structure_content_witness_absolute44.json` | 26 KB | Input of the verifier: the rational barrier of the coefficient that starts at 11/250, with its absolute envelope. |
| `deficit_structure_content_witness_medium25.json` | 26 KB | Input of the verifier: the rational barrier of the coefficient that starts at 1/40. |
| `deficit_structure_medium25_verify.py` | 3.6 KB | Script of the sixth version: Arb acceptance of the barrier from 1/40. |
| `deficit_structure_refine_search.py` | 2.9 KB | Script of the sixth version: floating-point optimisation of the scalar caps (**N**). |
| `deficit_structure_refine_verify.py` | 3.8 KB | Script of the sixth version: Arb acceptance of the five refined low-energy barriers. |
| `deficit_structure_refine_witness_009.json` | 26 KB | Input of the verifier: the rational barrier of the coefficient that starts at 9/1000 (exact decimal strings). |
| `deficit_structure_refine_witness_012.json` | 26 KB | Input of the verifier: the rational barrier of the coefficient that starts at 3/250 (exact decimal strings). |
| `deficit_structure_refine_witness_015.json` | 26 KB | Input of the verifier: the rational barrier of the coefficient that starts at 3/200 (exact decimal strings). |
| `deficit_structure_refine_witness_018.json` | 26 KB | Input of the verifier: the rational barrier of the coefficient that starts at 9/500 (exact decimal strings). |
| `deficit_structure_refine_witness_020.json` | 26 KB | Input of the verifier: the rational barrier of the coefficient that starts at 1/50 (exact decimal strings). |
| `deficit_structure_scan.py` | 5.0 KB | Script of the sixth version: a numerical primal Stein feasibility diagnostic (**N**). |
| `deficit_vs_bound.log` | 4.3 KB | Its output: D, the bound B and B/D for u = 0.0005 to 0.0463 and eight members of the family at each energy; the largest B/D is 0.991. |
| `deficit_vs_bound.py` | 2.8 KB | Second review: the certified content bounds over the numerical global cost, B(u, χ) = min{(2/25)χu², (19321/10⁶)u}/(P − Sec), against the deficit on the family from the Gaussian limit to the Wick monomial (row 11.38 of `sources/status-2026-11-15/STATUS_with_history.md`). |
| `first-version/verify.py` | 10.0 KB | **The verifier that the first review covers.** Exact rational interval arithmetic for C1 (Bernstein certificate of the circular-mean inequality), C2 (the integrals I₀, I₁, I₂, the constants j₀, g₀, J_s, the local cost k(3/5) and the two constants of the global bound), C3 (the corollaries), C4 (the constants of the conditional assembly and its tail bound) and C5 (the constant 848). SHA-256 `8d889c26e7e41d7da5ce12a1991799293d24b5c7f59b5d427ddc59c7e733620d`, the hash printed in `preliminary_results.txt` and quoted by the review. The working file was overwritten at 04:03. |
| `fourth-version/verify.py` | 21 KB | The verifier of the fourth version (04:38): the exact rational checks C1 to C10 and the replays of the other certificates, the localisation among them. SHA-256 `c2109f2f5f4e03a145f526e8ace8f560469fa5207e3ea232dd8e586982ffa625`, as printed in `results_localization_history.txt`. Copied from the working folder before the fifth version replaced it. Not replayed for this record. |
| `localization_alternative_majorant.py` | 2.8 KB | N only: floating-point search for the scalar majorant of `localization_alternative_proof.md` (third version); writes nothing. |
| `localization_circle.hpp` | 7.0 KB | Rigorous ranges for j(ν) = C′(ν)/ν, C the circular mean, by its series (directed rounding); a header of `localization_majorant.cpp` and, as a circle-series utility only, of `secant_verify.cpp`. |
| `localization_dual.py` | 3.4 KB | N only: a moment-dual diagnostic for the radial localisation (a finite-grid relaxation of the law of q); named by no version of the report; writes nothing. |
| `localization_majorant.cpp` | 4.8 KB | Checker in C++ with directed interval arithmetic for the scalar inequality behind the localisation (third version); it includes `theta_verify.cpp` for the interval primitives. Not part of the fifth version's replay. |
| `localization_radial_probe.py` | 3.3 KB | N only: tests the radial-derivative localisation of `localization_radial_proof.md` with the uniform curvature; its output is `localization_radial_probe_results.txt`. |
| `localization_verify.py` | 3.0 KB | Exact integer checker of c(463/10000) > 7/10 and of the radius 371/1000 (second version); standard library only. |
| `profile_range.py` | 6.4 KB | Arb certificate of −1/40 < h_{3/5}(v) < 253/1000 for all v ≥ 0, which also replays sup N_Φ < 1/3 (second version). |
| `replay_version5.log` | 25 KB | The replay of the verifier of the fifth version by the third review (claude-b9ee, started at 05:17 after the replay of its author had ended), in an isolated copy with the reviewer's python-flint 0.9.0 and compilation: the 14 source hashes, every certificate, "PASS FULL SECANT REPLAY", exit 0. |
| `review4/branches.py` | 4.5 KB | REVIEW_4 (reviewer agent of claude-b9ee's session): can the boxes that use the unreviewed content branches be re-certified with the reviewed ones (floating point; finding 1). |
| `review4/check_cert.log` | 1.3 KB | Its output: 1,298 family evaluations; the sixth-moment bound, the Stein duals at the nodes (2,618 checks), the moment caps (68,794 checks), the budgets in Stein and moment boxes and the claim itself, all without a violation; no row with D < 0. |
| `review4/check_cert.py` | 6.2 KB | REVIEW_4 (reviewer agent of claude-b9ee's session): tests the certificate's intermediate claims on 1,298 cubics of the Gaussian-to-Wick family (reads the author's witnesses from the working folder; writes `family_rows.json`, not kept). |
| `review4/dualgrid.py` | 2.0 KB | REVIEW_4 (reviewer agent of claude-b9ee's session): checks Q − h(u·) − G ≥ 0 for the 119 duals on a grid to 10⁴, with G rebuilt from the proof and the reviewer's own h. |
| `review4/fam.py` | 3.4 KB | REVIEW_4 (reviewer agent of claude-b9ee's session): module for the family q = √(u(1−λ))G + √(uλ)·y(\|y\|²−2)/√2 (content, F and D); needs `tables.npz` from `tables.py`. |
| `review4/fifty.py` | 1.3 KB | REVIEW_4 (reviewer agent of claude-b9ee's session): recomputes the uniform bound C ≤ 1/50 with the reviewer's own profile. |
| `review4/kcheck.py` | 1.9 KB | REVIEW_4 (reviewer agent of claude-b9ee's session): m″ and the scalar resolvent k_u from first principles; writes `m2.npz`. |
| `review4/kcheck2.py` | 4.6 KB | REVIEW_4 (reviewer agent of claude-b9ee's session): the true content coefficients (2/3)·sup N_Ψ at the ten row energies against the certified ones; needs `m2.npz`. |
| `review4/tables.py` | 2.5 KB | REVIEW_4 (reviewer agent of claude-b9ee's session): first-principles radial tables at the peak row; writes `tables.npz` (path as argument). |
| `review4/tensor_free.py` | 2.7 KB | REVIEW_4 (reviewer agent of claude-b9ee's session): exact Bernstein re-check of the 12 boxes that used the 3·δ^{3/2} branch, with (2/25)·δ instead (finding 1). |
| `review4/two_var.log` | 994 B | Its output: the smallest margins of the claim, the Stein duals, the content ratio and the sixth-moment bound over the random cubics. |
| `review4/two_var.py` | 3.1 KB | REVIEW_4 (reviewer agent of claude-b9ee's session): 288 random two-variable cubics tested against the claim, the content rows, the Stein duals and the sixth-moment bound. |
| `review4/union_area.py` | 1.5 KB | REVIEW_4 (reviewer agent of claude-b9ee's session): exact union of the 178 boxes over [0, 463/10000] × [0, 42] (disjoint interiors and total area), by its own method. |
| `review4/wcheck.py` | 1.2 KB | REVIEW_4 (reviewer agent of claude-b9ee's session): the envelopes W of the last four coefficients against \|k_u\| (runs the first part of `kcheck2.py`). |
| `secant_content_probe.py` | 2.7 KB | Floating-point search (linear programming) for the barrier of the central content bound; writes `secant_content_candidate.json`. Not part of the certificate. |
| `secant_content_verify.py` | 6.6 KB | Arb checker of the central content bound (`STATUS.md`, 11.41): the source bounds on m″ and m⁗, the rational Hermite barrier of `secant_content_witness.json` on 500 cells and its Bernstein residuals at both ends of the energy interval; imports helpers of `content_profile.py` and `content_next_m3.py`. |
| `secant_content_witness.json` | 26 KB | Input of `secant_content_verify.py`: the node values and derivatives of the barrier (501 nodes on [0, 1]) as exact decimal strings. |
| `secant_curvature.log` | 1.8 KB | Its output for the tilts 0.6, 0.5, 0.7, 0.3434 and 0: the supremum of Rem/ρ² (0.5997 at s = 0.6) with its place, and the supremum over w as a function of ρ. |
| `secant_curvature.py` | 4.1 KB | Second review: grid search of the supremum over w and ρ of the remainder Rem(w, ρ)/ρ² of the tilted sector at five tilts (`STATUS.md`, 11.37), the proposal that the fifth version proves at 13/20. |
| `secant_exact.py` | 2.4 KB | Exact rational comparisons of the secant route: the large-amplitude and exterior constants, the small-amplitude target and tails, the central content coefficient and the endpoints of the assembly. Standard library. |
| `secant_profile_dual.py` | 3.4 KB | The Gaussian-probe dual of `content_next_bound.py` (‖c_{3/5}‖ ≤ 1/50) recomputed from profile values reconstructed from the regenerated radial table. |
| `secant_profile_table.py` | 4.0 KB | Regenerates with Arb the 602 radial values of β₀ on [0, 6] (outward integer endpoints, scale 10⁸) that `secant_verify.cpp` interpolates; writes `secant_profile_table.txt` beside itself. |
| `secant_verify.cpp` | 8.5 KB | Checker in C++ with directed rounding for the compact part of the global remainder bound (`STATUS.md`, 11.39): boxes of 33/200 ≤ ρ ≤ 5, \|Re w\| ≤ 6, 0 ≤ Im w ≤ 6 accepted by corner values and the interpolation error, or by the exterior bounds; function values by Jensen and chord quadrature of the circular mean. It includes `theta_verify.cpp` and `localization_circle.hpp` and reads the radial table. |
| `second-version/verify.py` | 16 KB | The verifier of the second version (04:03), which the second review replayed whole. SHA-256 `8ce971c12983f6b27776a16aed66547bc6e9ee723bbef9a7ee3e6063d57e5175`; the copy comes from the reviewer's replay copy, with the hash recorded from the working file while the second version was there. |
| `theta_candidates.txt` | 12 KB | Input of `theta_verify.cpp`: 256 triples of candidate bounds, generated in floating point; the checker has to accept each of them. Row 161 is the target that the fifth version uses for small amplitudes. |
| `theta_verify.cpp` | 11 KB | Checker in C++ with directed interval arithmetic for the curvature inequality (second version): scalar envelopes on a covering by rectangles, then two matrix inequalities. |
| `tilt_choice.log` | 1015 B | Its output for s = 0.40 to 0.70: the range of h_s, sup N, the secant supremum, P − Sec and the two coefficients of the chain; s = 0.55 has the smallest. |
| `tilt_choice.py` | 1.9 KB | Second review: the constants of the chain "content bound over global cost" as a function of the tilt. |
| `verify.py` | 31 KB | The verifier of the sixth version. SHA-256 `7931e47c76703dc182409e90e710e1cebc116035718f9aa6530347ecce950b55`, as printed in its `results.txt`. The default command runs the secant chain of the fifth version and then the new deficit chain; `--deficit-only` runs the new chain and checks the 14 historical hashes; `--algebra-only` checks the scalar comparisons only. The deficit chain reads the October Stein package through a fixed path into the repository (`STATUS.md` 11.52) and needs `deficit_dual_cover_candidates.json` from the working folder (`INVENTORY.md`). |
| `verify_secant_history.py` | 25 KB | The verifier of the fifth version, kept by its author under this name; byte-identical to the earlier copy of `verify.py`. SHA-256 `7572574a7357e3dc4772b438fcc7a6b924f24244826e24ea281f6267e9285caf`, as printed in `results_secant_history.txt`. |

### `code/audit-2026-11-13/`: the audit's scripts and small result files

Run with a Python that has NumPy and SciPy (`python3 -I`); the certificate replays need python-flint. Commands, versions and seeds: `sources/audit-2026-11-13/RUNS.md`. The scripts read and write files next to themselves under their original names; the large outputs they refer to are listed in `INVENTORY.md`.

100 files, 967 KB.

| file | size | contents |
|---|---:|---|
| `audit_snapshot.py` | 5.5 KB | Lightweight post-hoc provenance and run-completeness snapshot. |
| `batch_optimise.py` | 7.5 KB | Independent multi-start L-BFGS, vectorized only across sample matrix products. |
| `budget_audit.py` | 1.7 KB | codex-a713: independent arithmetic for the conditional A+B budget. |
| `calibrate_kernels.py` | 1.7 KB | Deterministic calibration and interpolation convergence, codex-a713. |
| `check_benchmark.py` | 950 B | Independent Rice-kernel benchmark check, codex-a713. |
| `diffuse_buffer_scan.py` | 2.1 KB | Agent ID: codex-a713. Fresh deterministic Rice/Bessel integration, no project imports. |
| `diffuse_constants.py` | 1.1 KB | Agent ID: codex-a713. Independent heat/Bessel calculation; no project code imported. |
| `fast_eval.cpp` | 1.6 KB | Fused evaluation of a fixed-sample, control-variate objective. |
| `gaussian_factor_replay/flank_result.json` | 17 KB | The same, flank row. |
| `gaussian_factor_replay/peak_result.json` | 17 KB | Replay of the Gaussian-factor certificate (239/1000), peak row: PASS, boxes and caps per region. |
| `gaussian_factor_replay/upper_result.json` | 17 KB | The same, upper row. |
| `gaussian_factor_replay/verify.py` | 4.9 KB | Exact rational enclosure of the two-variable scalar envelope. |
| `holdout.py` | 6.9 KB | Fresh, rotation-conditioned polar Gaussian QMC for preselected candidates. |
| `improvement_boundaries.py` | 5.1 KB | codex-a713: local guillotine-boundary improvements, exact acceptance. |
| `improvement_content_constants.py` | 1.7 KB | Analytic rational bounds and independent scalar checks; codex-a713. |
| `improvement_cover.py` | 9.1 KB | codex-a713: exact cover improvement; writes only new audit artifacts. |
| `improvement_independent_check.py` | 9.5 KB | Independent serialized-cover replay, codex-a713. |
| `improvement_isolated_replay.py` | 2.0 KB | Read-only exact replay of the saved v6 cover; writes only a replay report. |
| `improvement_joint_probe.py` | 3.1 KB | Numerical discovery for finite joint A/B remainders. Agent-ID: codex-a713. |
| `improvement_joint_tail_verify.py` | 5.1 KB | Exact scalar checks for the joint A/B Gaussian-tail reduction. |
| `improvement_refine.py` | 5.7 KB | codex-a713: adaptive cover splitting/repricing from existing certified nodes. |
| `improvement_reweight.py` | 1.8 KB | codex-a713: exact accepted mixture reoptimization after boundary movement. |
| `independent_quadrature.py` | 5.4 KB | codex-a713. Independent deterministic quadrature; no research-code imports. |
| `kernels.py` | 7.2 KB | Conjecture K kernels, independently derived; agent codex-a713, 2026-11-13. |
| `moments.py` | 5.0 KB | Exact Wick-product fourth moment and tensor structure; agent codex-a713. |
| `opt_check_source.py` | 2.3 KB | codex-a713. Small, read-only source audit; generated data stays in this folder. |
| `opt_deterministic.py` | 4.9 KB | codex-a713. Independent deterministic full H_(2,1)(C^2) audit. |
| `opt_family_summary.py` | 2.9 KB | codex-a713. Independent Abel-based family checks and adapted-coordinate optimum. |
| `opt_refine.py` | 1.7 KB | codex-a713: refine two-real-parameter axisymmetric family and local Hessian. |
| `optimise.py` | 8.5 KB | Independent full Wick-chaos content experiment. Agent-ID: codex-a713. |
| `r23_replay/flank_result.json` | 2.0 KB | The same, flank row. |
| `r23_replay/peak_result.json` | 2.0 KB | Replay of the R23 certificate (239/1000), peak row: PASS, boxes and caps per region. |
| `r23_replay/upper_result.json` | 2.0 KB | The same, upper row. |
| `r23_replay/verify.py` | 5.1 KB | Exact rational enclosure of the two-variable scalar envelope. |
| `r26_kernel_recheck/check_kernels.py` | 2.7 KB | Recompute every inherited kernel enclosure at higher precision with Arb. |
| `r26_kernel_recheck/end_to_end_result.json` | 2.0 KB | End-to-end replay of the 0.22 certificate (11/50) at the three rows with freshly recomputed kernels: PASS, Arb balls of J(0). |
| `r26_kernel_recheck/inherited_node_subsets.json` | 600 B | Check that the kernel nodes of the R23 and Gaussian-factor certificates are identical subsets of the recomputed nodes. |
| `r26_kernel_recheck/kernel_enclosures.py` | 2.6 KB | Exact rational enclosure of the two-variable scalar envelope. |
| `r26_kernel_recheck/pure_flank_result.json` | 350 B | The same, flank row. |
| `r26_kernel_recheck/pure_peak_result.json` | 350 B | Rational continuum certificate of the 0.22 bound, peak row: PASS (5306 boxes). |
| `r26_kernel_recheck/pure_upper_result.json` | 348 B | The same, upper row. |
| `r26_kernel_recheck/result_flank_upper.json` | 488 B | The same for the flank and upper rows. |
| `r26_kernel_recheck/result_peak.json` | 386 B | Recomputation of the 147 peak kernel nodes with Arb at 160 bits: every ball inside the stored rational interval. |
| `r26_kernel_recheck/run_original_verifier.py` | 1.2 KB | Agent ID: codex-a713. Run unmodified local copies with local flint dependency. |
| `r26_kernel_recheck/run_serial.py` | 3.0 KB | Agent ID: codex-a713. Single-process resumable Arb recheck. |
| `r26_kernel_recheck/verify_pure.py` | 2.3 KB | Exact rational continuum certificate for a redistributed-deficit envelope. |
| `refine.py` | 12 KB | Intrinsic sphere L-BFGS polishing of saved full-tensor candidates. |
| `replay_family_certificates.py` | 1.2 KB | Agent ID: codex-a713. Sequential, original-code rational certificate replay. |
| `replay_r26_fraction.py` | 4.7 KB | Exact rational enclosure of the two-variable scalar envelope. |
| `results/EXPERIMENT_STATUS.json` | 4.1 KB | Completion counts per cell of the full-tensor experiment (15 cells, 50 starts and 50 refined continuations each). |
| `results/FINAL_CHECKS.json` | 355 B | Consistency checks of the main report (completed cells, counts, script syntax). Not a numerical or theorem check. |
| `results/IMPROVEMENT_FINAL_CHECKS.json` | 7.2 KB | Cover improvement: final consistency checks. |
| `results/RUN_INTEGRITY_SNAPSHOT.json` | 32 KB | Post-hoc snapshot of run completeness and integrity. |
| `results/SELECTED_TENSORS.json` | 139 KB | The 15 selected full-space candidates (n = 2…6, u = 0.02, 0.03, 0.0463): coefficients with basis indices, content vectors, direction shares, fourth excess, hashes. Source of the table in REPORT section 5. |
| `results/SOURCE_MANIFEST.json` | 15 KB | Post-hoc snapshot of the source and output files of the audit with SHA-256 (not a run-start attestation). |
| `results/STRUCTURED_BASELINE.json` | 4.8 KB | The two-variable baseline X[(\|X\|²−2) + z(\|Y\|²−1)]: optimum z = 0.05283531218 + 0.22122669064i, ratio 0.08760259435 at u = 0.0463, convergence data. |
| `results/benchmark_independent.json` | 739 B | Independent Rice/erfc benchmark of g(0), φ′(0) and B(u) against the table (agreement below 6·10⁻¹⁵). |
| `results/diffuse_buffer_160_256.json` | 3.9 KB | The same on a finer grid. |
| `results/diffuse_buffer_80_128.json` | 3.9 KB | Ratio C²/D for √e·Q + √(u−e)·W on a coarse grid; its `best` field is an exploratory optimum, not a validated maximum. |
| `results/diffuse_buffer_refined.json` | 1.5 KB | Refined checks at the structured shares 0.1, 0.5, 0.8. |
| `results/diffuse_constants.json` | 1.3 KB | B″(u) and A′(u) at u = 0.0463 and the boundary slope of C²/D for the Wick monomial with an independent Gaussian buffer. |
| `results/family_certificates_summary.json` | 1.1 KB | Replay of the R23 (0.239) and Gaussian-factor (0.239) certificates at the three rows: PASS, rectangle counts, maximal caps. |
| `results/family_replay_progress.json` | 711 B | Progress record of the same replay (status and time per family and row). |
| `results/fraction_pure_flank_result.json` | 402 B | The same, flank row. |
| `results/fraction_pure_peak_result.json` | 401 B | Replay of the 0.22 certificate in Python fractions, peak row: PASS conditional on the stored kernel enclosures (the later end-to-end replay removes the condition). |
| `results/fraction_pure_upper_result.json` | 400 B | The same, upper row. |
| `results/holdout_cv_peak_n2_summary.json` | 11 KB | Fresh holdout (8 scrambles of 2²¹ points, Wick control variate) of the selected n = 2 tensors. |
| `results/holdout_cv_peak_n3_summary.json` | 16 KB | The same for n = 3. |
| `results/holdout_cv_peak_n4_summary.json` | 23 KB | The same for n = 4. |
| `results/holdout_cv_peak_n5_summary.json` | 34 KB | The same for n = 5. |
| `results/holdout_cv_peak_n6_summary.json` | 50 KB | The same for n = 6 (0.0874917600 at u = 0.0463, the value in the report). |
| `results/holdout_peak_n6_summary.json` | 16 KB | The n = 6 holdout without the control variate, same tensor and seeds (0.0875215483); the two approximate intervals miss each other by about 3·10⁻⁷, which no report discusses. |
| `results/improvement_content_constants.json` | 635 B | Exact rational checks of the scalar constants of the content-extension lemma. |
| `results/improvement_independent_v6.json` | 5.1 KB | Cover improvement: output of the independent checker on the final certificate (PASS for all 11,107 boxes and the partition; source hashes). |
| `results/improvement_isolated_replay_v6.json` | 3.3 KB | Cover improvement: output of the isolated replay of the saved cover (serialisation and hashes). |
| `results/improvement_joint_tail_check.json` | 3.6 KB | Exact rational checks of the joint-tail reduction (density caps, tail matrices, shift bound, reserves). |
| `results/improvement_replay_v6.json` | 1.5 KB | Cover improvement: summary of the search-side exact replay. |
| `results/independent_complex_64.json` | 276 B | Second audit: the best two-dimensional local candidate (ratio 0.0876025944). |
| `results/independent_families_32.json` | 3.2 KB | Second audit (pushforward quadrature): family ratios at order 32. |
| `results/independent_families_64.json` | 3.4 KB | Second audit: family ratios at order 64 (Wick monomial 0.087565304234, X(\|Y\|²−1) 0.040995118921, imaginary family). |
| `results/kernel_calibration.json` | 6.3 KB | Calibration of the kernels φ and g: difference between the tables of 4097 and 8193 nodes, and the template ratios. |
| `results/kernel_checks_peak_4097.json` | 9.5 KB | Checks of the kernel table of 4097 nodes at the peak row (the table itself, a `.npz` file, is in the inventory). |
| `results/n2_n4_structure.json` | 6.7 KB | Structure data of the n = 2 and n = 4 selected tensors (shell weights, the XP coefficient matrix); see NUMERICAL_N2_N4.md. |
| `results/opt_family_summary.json` | 5.1 KB | Optimiser-audit sub-agent: family values, the scan in τ of the imaginary perturbation, the adapted-coordinate optimum. |
| `results/opt_results.json` | 3.5 KB | Optimiser-audit sub-agent: deterministic searches over the six coefficients of H₂,₁(ℂ²) at u = 0.0463. |
| `results/validation_peak_n2_polar_p19_r8_winners.json` | 8.3 KB | Selection for n = 2 from the validation of every end point (8 scrambles of 2¹⁹ points, rotated polar sampling). |
| `results/validation_peak_n3_polar_p19_r8_winners.json` | 12 KB | The same for n = 3. |
| `results/validation_peak_n4_polar_p19_r8_winners.json` | 20 KB | The same for n = 4. |
| `results/validation_peak_n5_p19_r8_summary.json` | 83 KB | Validation of n = 5 under the label `p19_r8`: all end points. |
| `results/validation_peak_n5_p19_r8_winners.json` | 10 KB | Validation of n = 5 under the label `p19_r8` (the run without the rotated-polar option): selection. |
| `results/validation_peak_n5_polar_p19_r8_winners.json` | 31 KB | The same for n = 5. |
| `results/validation_peak_n6_p19_r8_summary.json` | 87 KB | Validation of n = 6 under the label `p19_r8`: all end points. |
| `results/validation_peak_n6_p19_r8_winners.json` | 16 KB | Validation of n = 6 under the label `p19_r8`: selection. |
| `results/validation_peak_n6_polar_p19_r8_winners.json` | 47 KB | The same for n = 6. |
| `results/wick_control_check.json` | 319 B | Smoke check of the Wick control variate (cancellation to 3·10⁻¹⁷ on 1024 samples); no accuracy certificate. |
| `results/zero_tensor_moments.json` | 127 B | Exact moments of the zero-tensor example q₀: energy 9/2, leading content moment 0, fifth content moment −243. |
| `statistical_diagnostics.py` | 5.4 KB | Small saved-data integrity, bias and structural checks. Agent-ID: codex-a713. |
| `structured_baseline.py` | 3.1 KB | Independent deterministic check/search in X[(R-2)+z(S-1)]. |
| `summarize_results.py` | 3.3 KB | Collect completed numerical evidence without inventing missing results. |
| `validate.py` | 9.4 KB | Independent scrambled-Sobol validation of every trained tensor, codex-a713. |

### `code/d1/`: numerical checks behind the D₁ notes

8 files, 18 KB.

| file | size | contents |
|---|---:|---|
| `d1_num1.py` | 2.6 KB | Closed form of E\|χ²_d − d\| against the characteristic-function integral; two-eigenvalue Schur test; doubling; sign flips. |
| `d1_num2.py` | 3.2 KB | τ(0) = E\|X\|/(2p(0)) ≤ 1; Gamma-shape interpolation; pair monotonicity; Stein identity by Monte Carlo. |
| `d1_num3.py` | 1.8 KB | Whether p_X(0) ≤ 1/√(2π) for positive spectra (false: p(0) = 0.459 at the spectrum (1, ε×64); notes section 4). |
| `d1_num4.py` | 1.7 KB | The pair-lemma derivative formula against finite differences (the pairwise Schur lemma is false, notes section 4). |
| `d1_num5.py` | 2.4 KB | The Key Lemma E[X₂e^{−X²/2σ²}] ≤ 0 on 16 spectra and 11 scales; E\|X_c\| along the OU path; the derivative formula (1.2). |
| `d1_num6.py` | 1.8 KB | Conditional means E[ξ_i \| X_s = 0]: the sign of E[X₂ \| X_s = 0] (40 of 40) and the ordering in λ_i (fails 11 of 40). |
| `d1_num7.py` | 2.0 KB | Convexity of the Stein kernel by Fourier inversion (marginal; not used in the proof). |
| `d1_num8.py` | 2.5 KB | The identities (I1), (I2) and the single sign change of δ_s, δ_s⁻ for positive, mixed and mirrored spectra. |

### `code/experiments-2026-11-04/`: the exploratory scripts of 4 to 6 November (historical)

Kept because the monograph of 5 and 6 November and the log cite them by name. Several are superseded by the audit's experiment (see `STATUS.md`), and eleven `e11_*` scripts do not run as they stand: they `exec` helper files under older names (`scan_majorant.py`, `bcontent.py`, `betacheck.py`) and two data files are absent (`GB_table.npy`, `ksector_results.json`).

44 files, 124 KB.

| file | size | contents |
|---|---:|---|
| `e10_class.py` | 1.1 KB | E10: F(G) ≤ F(σW) for G = z₂[α(T − 1) + iλ(S₃ − 1)] at two rows and five norms. |
| `e11_ab_kernel_finite.py` | 2.1 KB | Peak row: smallest eigenvalue of the finite-amplitude A/B Hessian form over a grid of (x, \|α\|, \|β\|); negative on 18 of 125 grid rows (the pointwise finite-amplitude form fails). |
| `e11_ab_kernel_infinitesimal.py` | 1.4 KB | Peak row: the infinitesimal A/B Hessian kernels K_re(x), K_im(x) and the smallest eigenvalue over shifts x ≥ 0. |
| `e11_bcontent.py` | 2.8 KB | B-sector content: builds the g_B table; Monte Carlo of C_A²/D, C_B²/D and a joint A/B condition over cubic shells and mixtures. |
| `e11_bcontent_bound.py` | 779 B | Monte Carlo of C_A, C_B and of the bound ρ₀C_A + E\|q\|\|g\|(ρ − ρ₀) for two cubics. Needs a helper file under an older name. |
| `e11_bcontent_gaussian_factor.py` | 1.4 KB | Compares β(v) from the g_B table with the assistant's formula, then the maximum over v of v\|β(v) − β(u)\|²/d_u(v) for five energies. |
| `e11_bcontent_gaussian_factor_scan.py` | 706 B | The same maximum for u in {0.00551, 0.01, 0.02, 0.0463} (target at most 0.26). |
| `e11_bcontent_ratio.py` | 708 B | Ranges of ρ = g_B/g and of \|g\| over intervals of v; writes the table GB_table.npy (absent). |
| `e11_check_complex_moment.py` | 1.2 KB | Monte Carlo of the sixth moment of P = Y*AY − tr A for complex A against the R23 bound. |
| `e11_check_envelope_star.py` | 1.3 KB | Grid check of the envelope (★): smallest margin 0.38 % of H at u = 0.0463, share 15/16 (numerical; no interval certificate of (★) is in the record). |
| `e11_check_r23_moments.py` | 1.3 KB | Exact trace formulas for the fourth and sixth moments of P against Monte Carlo; the ratio to 37p·m₄ − 68p³. |
| `e11_check_sizebias_reduction.py` | 2.5 KB | The radius-integrated deficit identity and the weighted Cauchy–Schwarz target at u = 0.0463 (K(u) = 0.16669). |
| `e11_check_vector_moment.py` | 898 B | Monte Carlo of E V³ for vectors of centred complex quadratic forms against the vector moment bound. |
| `e11_check_wick_endpoint.py` | 1.0 KB | Quadrature: the changes of C and D and the ratio C²/D when λ(T − 1) with p = u/5 is added to the Wick monomial. |
| `e11_imag_perturbation.py` | 820 B | Monte Carlo: C²/D for the Wick monomial perturbed by real and imaginary multiples of X(\|Y\|² − 1). |
| `e11_ksector.py` | 5.5 KB | Peak row: Λ(G) − S for G in H₂,₁(ℂ²) with all six sectors (18 shells): core phases, added sectors, hill-climb, random mixtures (every value negative). The sector scan of the log, section 31. |
| `e11_oddform.py` | 3.4 KB | Peak row: largest eigenvalue of the form E[\|O\|²/\|L+H\|] on three z-odd directions against 1/ε, and the true second-order cost along it. |
| `e11_refined_target.py` | 879 B | Table over u for the Wick monomial: benchmark slack, D, C, r(u), Ψ_r(C) and the ratios of the refined target. |
| `e11_scan_majorant.py` | 3.7 KB | The scan of §3.5 of the monograph of 5 and 6 November: tables φ, g and Monte Carlo of C²/D over ten one-driver shells and twelve random mixtures. Superseded by the audit's experiment. |
| `e11_scan_opt.py` | 1.5 KB | The 12-shell hill-climb of §3.5 of the monograph of 5 and 6 November (6 restarts × 25 steps). Not reproducible as written (it runs `scan_majorant.py`); superseded by the audit's experiment. |
| `e11_second_variation.py` | 953 B | Deterministic quadrature of C²/D for q_τ = √(u/(2+τ²))·X[(\|X\|²−2) + iτ(\|Y\|²−1)] at u = 0.0463: the saddle. |
| `e1_maxfirstmoment.py` | 2.6 KB | E1: maximises E\|q\|/‖q‖₂ over the charge-one cubic chaos in d variables (best values 0.809 to 0.840 for d = 5, 6, 8; Gaussian 0.88623). |
| `e2_quadratic.py` | 1.6 KB | E2: E\|X\|/‖X‖₂ for real Gaussian quadratic forms by the characteristic-function integral, against √(2/π). |
| `e4_kattack.py` | 5.1 KB | E4: gradient ascent on Λ(G) over full cubic Wick tensors in d coordinates plus a diffuse part; top candidates re-evaluated on 2·10⁷ fresh samples (all below S). |
| `e5_oupath.py` | 3.0 KB | E5: Λ along the OU path G_c for several cubic adversaries; whether it is monotone. |
| `e5b_deriv.py` | 2.6 KB | E5b: finite-difference slopes of Λ along the OU path near c = 0 and on [0.8, 1]. |
| `e6_lawineq.py` | 2.4 KB | E6: Monte Carlo test of E[g(Y)] ≤ 2E[Y²]E[φ(Y)] over scales for Hermite and cubic chaos variables. |
| `e6b_class.py` | 1.6 KB | E6b: the same inequality on mixed-chaos polynomials and non-chaos laws. |
| `e7_small_norm.py` | 1.9 KB | E7: F(G) − F(σW) at small norm for G = ε·z₂(T − 1 + δ(S − 2)), several profiles including the peak row. |
| `e7b_asymp.py` | 1.5 KB | E7b: small-ε asymptotics of F(G) − F(σW) for the profiles a(T) = T and T + 0.01. |
| `e8_family.py` | 1.3 KB | E8: relative margin of the Key Lemma (k = 3) on the family a·H₃(g) + b·(g² − 1)h by Gauss–Hermite quadrature. |
| `e9_sublevel.py` | 2.2 KB | E9: the sublevel ratio E[\|DY\|²; \|Y\| < t]/(kσ²P(\|Y\| < t)) ≤ 1 for cubic and other Hermite chaos examples. |
| `k5/d5k_ref.py` | 3.5 KB | K₅: stand-alone copy of the quadrature of the degree-5 Gaussian ideal at fixed row points. |
| `k5/k5_attack.py` | 24 KB | K₅: the main attack. Λ₅ over full Wick tensors of H₂,₁ ⊕ H₃,₂ plus diffuse drivers, L-BFGS on common samples, re-evaluation on fresh samples. |
| `k5/k5_decomp.py` | 2.5 KB | K₅: decomposes a saved candidate by shells (restricted groups and leave-one-shell-out). |
| `k5/k5_eval.py` | 1.9 KB | K₅: re-evaluates saved candidates on fresh common samples. |
| `k5/k5_junta.py` | 3.9 KB | K₅: one-coordinate junta q = c·H₂,₁(z₂) against the diffuse Gaussian by quadrature. |
| `k5/k5_quad2.py` | 6.9 KB | K₅: deterministic quadrature optimisation of the d = 2 junta family (the "exact" one-spike excess +1.55·10⁻⁵ at t = 0.87). |
| `k5/k5_quad3.py` | 6.7 KB | K₅: the same for d = 3; too coarse to be useful (RESULTS.md). |
| `k5/k5_sigma.py` | 2.4 KB | K₅: σ-profile of the Gaussian ideal at a row, Monte Carlo against quadrature. |
| `k5/k5_verify.py` | 2.3 KB | K₅: Monte Carlo evaluator at d = 1 against the quadrature of the Gaussian ideal. |
| `k5/kmodel.py` | 3.5 KB | Quadrature model of the cubic row in the Gaussian ideal (the function D″(t) of the monograph of 5 and 6 November); supplies the Gauss–Legendre rule to the others. |
| `shell_content.py` | 2.8 KB | Monte Carlo: energy-normalised content of bounded functions of q in the diagonal-type shells (1,1), (2,2), (2,0), (3,1). |
| `spike_content.py` | 1.7 KB | Monte Carlo: first-chaos content of phase(q) and of a clipped cubic of q for q = c·H₂,₁(X₁) + diffuse part. |

### `code/ai-thread-verifiers-2026-11-05/`: stand-alone verifier scripts received from the assistants

Node scripts (`node file.mjs`), exact rational or interval arithmetic, no data files needed.

6 files, 67 KB.

| file | size | contents |
|---|---:|---|
| `chatgpt-fresh-verify_gaussian_factor_content.mjs` | 2.1 KB | Verifier received. "As posted by the fresh ChatGPT thread": BigInt interval check, peak row (a=699/1250, b=179/1250), that Q(0) > 167/50 and A'(0) < 108/25, so 2A'(0)^2/Q(0) < 56/5. |
| `chatgpt-fresh-verify_nonlinear_content.mjs` | 7.0 KB | Verifier received. Outward-rounded BigInt checks −D0 > 267/10, D1 < 691/20, Phi^(6)(0) < 2750, K < 50; "CERTIFIED SCALARS": C_X(q)^2 <= .19 D(q) for u <= 19/50000; says it does not certify u <= 0.0463. |
| `chatgpt-thread1-verify-content.mjs` | 26 KB | Verifier received. "Exact dyadic enclosures… Default: application rows and quartics. --box: uniform content; --box-direct: uniform matched-variance comparison"; limits 138/135, 551/100000 <= u <= 463/10000, w <= 0.0223. |
| `chatgpt-thread2-verify_content_extension.mjs` | 8.3 KB | Verifier received. BigInt checks printing "PASS: shell penalty 0.24" (w <= .0113, 2500/1891), "PASS: tensor constant .481", "tensor ratio > .4808 > .4775", "cubic tensor zero; fifth tensor -243". |
| `chatgpt-thread2-verify_core.mjs` | 10 KB | Verifier received. "All bounds and acceptance decisions use integer arithmetic": potential envelope, "Quartic signs certified" on profile intervals beta/a in [2/11,4/11], "Full-box potential" for the disjoint comparison. |
| `chatgpt-verify_shared.mjs` | 14 KB | Verifier received. "Exact enclosures for the two content inequalities and the A cost": two content bounds, two matched-variance bounds, projected envelope, "Gaussian-tail and 0.19 row-cost constants verified". |

### `code/record-checks-2026-11-15/`: checks written when this folder was assembled and updated

Not copies of working files. `tied_matrix_check.py` supports the tied matrix of `STATUS.md` 11.4. `localisation_check.py` supports `STATUS.md` 11.27, and `tilted_content_check.py` the Wick-monomial values of 11.29 and item 75; both also support passages of `sources/status-2026-11-15/STATUS_with_history.md` (the table "How far the content bounds are from 11.36" of its section 11 (e), and its section 14, items 41 and 42).

3 files, 18 KB.

| file | size | contents |
|---|---:|---|
| `localisation_check.py` | 5.1 KB | The lower bound F(q) − F(0) ≥ u·c(u) that follows from the fourth-moment cap E\|q\|⁴ ≤ 44u²: the constant c(0.0463) = 0.7036, the resulting radius 0.370 of a maximiser of the tilted sector gain (against 0.4812 without it), and the true value 0.0512 of the term on the Wick monomial. Standard library, floating point; its output is in its docstring. |
| `tied_matrix_check.py` | 4.0 KB | The local A/B matrix for the tied multiplier of October, for the optimal multiplier of the report of 15 November and without a multiplier, from the closed-form integrals of the peak row; the local cost k(s). Floating point; its output is in its docstring. |
| `tilted_content_check.py` | 9.4 KB | The Hessian norm m_h of the tilted profile without a spline (sup m_h = 1.35, not 244), and on the Wick monomial the content bounds of the report against the deficit: the structural bound of the first version and the four bounds of the later versions. NumPy and SciPy, floating point; its output is in its docstring. |

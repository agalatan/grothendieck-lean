# The identity-tail witness: status ledger

The labels **P**, **C**, **Lean**, **N**, **open** are those of [`../README.md`](../README.md). Rows keep their IDs; a
strengthened statement replaces the weaker text in its row.

## 0. Sources and authors

| tag | file |
|---|---|
| STUDY | `sources/study-2026-11-15/REPORT.md`: the feasibility study of a node-cap rebuild |
| S0M1 | `sources/study-2026-11-15/STAGE0_MILESTONE1.md`: stage 0, first milestone: go, gated on one lemma |
| LEM | `sources/lemma-2026-11-15/PROOF.tex`: the rank-one correction lemma |
| LEMREV | `sources/lemma-2026-11-15/LEMMA_REVIEW.md`: its referee report |
| S0C | `sources/stage0c-2026-11-16/STAGE0C.md`: the gate, the go/no-go numbers, the cost and the Lean plan |
| S0F | `sources/stage0-2026-11-16/STAGE0_FINAL.md`: stage 0, the integer certificate, at its first hand-back: summary, checkpoints, certified rows, formats of the final files |

**Authors and checks.** All sources were written by research workers of claude-b9ee on 15 and 16 November 2026. The
lemma was proved by one worker and refereed by another, who re-derived it and checked every identity with an
independent exact script. Every number of §1, §3 and §4 is a floating-point model value (**N**) produced by one
worker; claude-b9ee read the verdict and plan sections and replayed nothing. The certificates of §5 were computed and
verified by one worker and its sub-workers, with separate code for the exact replay; nobody else has replayed them.

## 1. The witness

| # | statement | scope | status | where |
|---|---|---|---|---|
| 1.1 | **The witness.** T = P₁,₀ − εP₂,₁ + ν(Id − P₁,₀ − P₂,₁) with (ε, ν) = (191/250, 47/2000). Its value on unit vectors still tends to 1, and the tail is positive semidefinite, so the vector side keeps the bound 1 − (1 + ε)/(n + 1) | every dimension | **P**, author only (the Lean form is step 1b of 6.2) | S0C §7.1 |
| 1.2 | **The tail must be pointwise.** For unimodular f, g the tail contributes ν̂·Re(f̄g) − ν̂ in the fibre, so the fibre potential \|A\| + \|B\| becomes Ψ_ν(A, B) = sup_{\|f\|=\|g\|=1} Re(f̄A) + Re(ḡB) + ν̂·Re(f̄g). Bounding the tail through projections instead (no kernel change) is worse than today's witness: 0.7147 to 0.7166 | — | the identity **P**, author only; the comparison **N** | STUDY §1; S0C §7.1 |
| 1.3 | **ε alone does not reach 1.4018.** With ν = 0 the best gated Gaussian value is 0.71326; after the law relaxation it is at least 0.71335, that is K ≤ 1.40185 | ν = 0 | **N** | STUDY §1 |
| 1.4 | **The choice of (ε, ν).** Against the relaxed law the chosen point has maximum 0.7131979. Its four axis neighbours and four corners are worse by 1.4·10⁻⁵ to 1.7·10⁻⁴; the neighbourhood is flat to 2·10⁻⁶ along one "valley" direction; ν = 0.030 is clearly bad | rows t = 0.84, 0.845, 0.85 | **N** | S0C §4; S0M1 |

## 2. The correction lemma

| # | statement | scope | status | where |
|---|---|---|---|---|
| 2.1 | **Theorem.** Let ν ≥ 0, d₂, d₃ > ν, R ≥ 0 and 0 ≤ γ ≤ γ*(R). For all L, p ∈ ℂ with \|L\| ≤ R: Φ_d(L + p, L − p) − (γ/16)·(4Re(pL̄) − c₀ − c₁\|L\|²)² ≥ Ψ_ν(L + p, L − p). Here Φ_d(A, B) = (d₂ + d₃)/2 + (d₃\|A\|² + d₂\|B\|² + 2ν·Re(AB̄))/(2Δ), γ*(R) = 8σ(e₂e₃)²/(Δ(Δ(σ² + 2R\|δ\|)² + 16R²(e₂e₃)²)), c₀ = d₂² − d₃² + ν(d₂ − d₃)(e₂² + e₃²)/(e₂e₃), c₁ = −4ν(d₂ − d₃)/(e₂e₃), with e_i = d_i − ν, σ = e₂ + e₃, δ = e₃ − e₂, Δ = d₂d₃ − ν². The coefficient is sharp and decreasing in R. At ν = 0 it is the anchored-pair majorant of Alon–Fürer, eq. (4) | every cell, with ν the hat value ν̂ in the application; pointwise in the phases | **P** (one worker; refereed line by line by a second, with every identity checked exactly by an independent sympy script; more than 20 million numerical tests without a violation). **Lean:** `Grothe.LowerAnalytic.anchored_pair_nu` in `Grothe/LowerAnalytic/CapMajorant.lean` | LEM; LEMREV; `code/lemma/`, `code/lemma-review/` |
| 2.2 | **What is left to a certificate.** One rational inequality per cell, without division (γ·D ≤ 8σ(e₂e₃)² with D the denominator above), and three rules for the generator: the centre (c₀, c₁) exact; γ rounded down from the exact ν̂; cells with e₂ ≤ 0 or e₃ ≤ 0 keep γ = 0 and are checked for d₂ > 0 and Δ > 0. The weights must be rounded so that the 2×2 form dominates the exact one | every cell | **P** (LEMREV §§1, 5) | LEM §5; LEMREV |
| 2.3 | **Effect on the caps.** With γ* in every cell the anchored caps are as tight as today's on the nine rows t = 0.83 to 0.88. Without the correction the caps are unusable | — | **N** | S0C §3.1; S0M1 |

## 3. Model values and margins

| # | statement | scope | status | where |
|---|---|---|---|---|
| 3.1 | **The certifiable cap.** The law relaxation, a model of the certified cap table built with γ*, and the calibration against master give B_ν ≈ 0.713198 to 0.713207, that is K ≈ 1.40212 to 1.40214 | the witness of 1.1 | **N** | S0C §3 |
| 3.2 | **Margins.** In the model of 3.1: 1.6 to 1.7·10⁻⁴ to 5000/7009 (K > 1.4018), and 6.0 to 6.9·10⁻⁵ to 500/701 (K > 1.402), each identified uncertainty being at most about 10⁻⁵. The certificate of §5 does not reach these: on its final cap tables the same model gives 0.713226 to 0.713232 at the binding rows, and the exact row certificates lie a further 5.4 to 5.7·10⁻⁵ above the model, the cost of the Stein layer. So the margin to 5000/7009 is 6 to 8·10⁻⁵ at the binding rows, and 500/701 is not reached with these tables | — | **N**; the offset between certificate and model from the exact rows of 5.1 | S0C §1; S0F (the checkpoints "first certified table" and "predictions of the improved binding tables") |
| 3.3 | **The plateau.** The relaxed row values are flat from t = 0.835 to 0.885, with maximum 0.7131983 at t ≈ 0.844; the plateau ends between 0.885 and 0.8875. A certificate needs the plateau rows 0.005 apart (11 rows; today 4 rows bind) | — | **N** | S0C §5 |
| 3.4 | **Localised caps are needed.** Price-variance caps cost 5·10⁻⁴ to 5·10⁻³ at u ≥ 0.4. The localised caps ("route M") work for ν > 0 in one and two odd directions: exact prototype boxes at the binding row close at 4.8 to 7.7·10⁻⁶. For 1.4018 the three-direction range and the block-0 region may use price-variance caps; the margin is then 1.3 to 1.4·10⁻⁴ | — | **N**; the prototype boxes **C**, author only | S0C §§3.4, 3.6 |
| 3.5 | **The sharp radius would not help here.** The bound E\|q\| ≤ (√π/2)‖q‖₂ of `../conjecture-K/STATUS.md` 3.6 gains nothing in the law layer at the plateau | — | **N** | S0C §3.3 |

## 4. Cost

| # | statement | scope | status | where |
|---|---|---|---|---|
| 4.1 | **1.4018 only.** Localise the one- and two-direction nodes, mid-range nodes at spacing 0.01: about 10,000 pieces and 150 to 250 CPU-hours for the integer certificate. For the Lean node caps the study assumed today's unit cost and found 90 to 110 CPU-hours; stage 0 finds about 160 s per piece in CI and estimates 490 vCPU-hours for its 22 final tables (368 for the 8 plateau rows; about 320 with two savings in the interpreted checker) | — | **N** (counts from a model; unit costs from timings) | S0C §6; S0F (the checkpoint "the real Lean cost of a cap" and "What I would change in the stage-2 plan") |
| 4.2 | **1.402.** Full quality: 11 plateau rows, spacing 0.005, localised caps also in three directions and the block-0 region: about 130,000 pieces, 550 to 1,600 CPU-hours for the certificate and about 700 to 750 CPU-hours of Lean node caps | — | **N** | S0C §6 |

## 5. The integer certificate (stage 0)

| # | statement | scope | status | where |
|---|---|---|---|---|
| 5.1 | **The integer certificate of B < 5000/7009 = 0.7133685 for the witness of 1.1: the plateau row by row.** Exact row certificates (a row gives B = (1 − ν)·B̂ + ν): 0.713210 at t = 0.74, 0.713251 at 0.88, 0.713248 at 0.885, and, on first cap tables that were then improved, 0.713302 at 0.845 and 0.713282 at 0.85. The improved tables of the binding rows 0.83, 0.845, 0.85 have model values 0.7132318, 0.7132310, 0.7132258, to which the Stein layer adds 5.4 to 5.7·10⁻⁵ (3.2). Rows that certify above the target: 0.713473 at t = 0.84, which mixtures of its neighbours are expected to cover (about 0.71332, **N**), 0.713853 at 0.78, 0.714949 at 0.6 and 0.731386 at 0.4 (5.2) | rows of the plateau t ∈ [0.73, 0.9]. **No envelope over t is assembled, and the rows below t ≈ 0.72 are not certified** | **C**, author only: exact rational row certificates accepted by the worker's verifier, and an exact integer replay by separate code of all 956 pieces of one binding table and of a 100-piece sample across the piece kinds. The replay's coverage check does not yet know the piece kinds of 5.3 | S0F (summary; the checkpoint "BLOCKER: the small-t rows"); issue #183 |
| 5.2 | **Small t: the fibre maximiser breaks the odd symmetry.** For t ≲ 0.7 the maximiser of the fibre potential has odd coefficients up to 0.53 (row 0.6, s = 0.1), and the true potential is up to 2.6·10⁻² above its symmetric maximum. Every cap construction of stage 0 (anchored, localised, global with price variance) is built around the symmetric anchor, so its caps are 1 to 3·10⁻² above the true potential there, which is the whole slack of those rows. A single quadrant piece anchored at the broken maximiser does not help (1.8 to 4·10⁻² too high). The rows below t = 0.73, and 0.78, have to be re-chosen so that their maximiser stays symmetric; their slack (2 to 3·10⁻² for t ≤ 0.6, 9·10⁻³ at 0.7) allows it | rows t ≤ 0.72 and 0.78; the study of S0C had looked at the plateau rows only | the row values **C**, author only; the diagnosis **N** | S0F (the checkpoint "BLOCKER: the small-t rows") |
| 5.3 | **Far-region pieces.** With the layouts of S0C the two-direction localised caps fail from s = 0.38 to 0.42 on. The final tables use ring splits, ring boxes that are bisected on failure, corner delegation with a completeness guard, and a price variance chosen per piece; on row 0.84 block 1 turns indefinite from s = 0.42 and needs its own base variance. Above s = 0.5 the caps stay at the global level, 3 to 5·10⁻³ | the plateau rows | **C**, author only (every final table accepted by the worker's table checker; a float scan found no cap below the true potential) | S0F (the checkpoints from "far-slab failures" to "row 0.84 at s = 0.40 closes") |
| 5.4 | **The radius constant is Lean's.** The certificate uses `Lower.ρ` = 973612157/10⁹ in every place (the first-moment cut of the Stein nodes, the crude row, the σ range of the covers); t ∈ [0, 0.12] is covered by the row 0.12 and not by the crude row; at the binding row 0.845 the law relaxation with ρ = 0.9387 gives the same value. So the sharper radii of `../conjecture-K/STATUS.md` 3.7 are not needed in Lean for this route. A crude row with ρ = 0.9387 would cover t ≤ 0.21 without node caps (V̂ ≤ t² + ε̂ρ² − 2ν̂); it is not used | — | read from the worker's verifier and report; the comparison at 0.845 **N** | S0F; `PROGRESS.md` of the same folder (INVENTORY) |

## 6. The Lean plan

| # | statement | scope | status | where |
|---|---|---|---|---|
| 6.1 | **What the node-cap closure contains.** `GrotheCapsKernel/`, the row data under `Grothe/Lower/` (with ε in `RowDataTypes.lean`), the cap data, tables and row modules under `Grothe/LowerAnalytic/`, and the lake files. Outside it, and changeable without a cap rebuild: `CapMajorant`, `CapCheckSound`, `CapGrid`, `CapPiece`, the witness and the fibre chain | master of 16 November 2026 | read from the registry | S0C §7.0 |
| 6.2 | **Stage 1: generalise in place.** Every statement takes the tail parameter and is instantiated at today's witness (ν = 0), so no bound changes. (1a) the lemma 2.1 in `CapMajorant`; (1b) the witness; (1c) the cap formula `VOf_eq` and the endpoint B = (1 − ν)·cap_hat + ν; (1d) the fibre chain with the pointwise tail and the frame identity, ending in a theorem `lower_bound_of_tail_nodes` that gives 1/((1 − ν)·B + ν) ≤ K from the checked law nodes, the cover and a node-cap hypothesis `TailNodeCaps ν̂`, which at ν = 0 is today's `NodeCaps` by definition; (1e) the kernel extension and its soundness, on a branch, because it edits closure files | — | 1a **Lean** (on master). 1b and 1c: pull request #477. 1d: written, on branches stacked on #477. Each module of 1b–1d builds, warning-free, in the hands of its author (a worker of claude-b9ee); none has passed the proof check yet. 1e: open | S0C §7.1; issue #183 |
| 6.3 | **Stage 2: one pull request with every invalidating change.** The witness constants ε̂ = 25/31, ν̂ = 47/1953; all rows; the cap data, tables and kernel; all cap modules and the registry; the law nodes and the refined cover, renamed out of `Grothe/Research/`; the axiom lists and the documents. Its check needs a heavy runner | — | plan | S0C §7.2 |

## 7. Open problems, in priority order

1. **Complete the integer certificate** (§5): the rows below t = 0.73 with a symmetric fibre maximiser (5.2), the
   mixtures that cover t ≈ 0.84, the envelope over all t with its exact margin, and a coverage check in the
   independent replay for the far-region pieces (5.3).
2. **The proof check of the Lean steps 1b–1d, and step 1e** (6.2).
3. **Stage 2 for the final tables** (6.3): coverage proofs in Lean for the piece layouts of 5.3, and a node-cap build of
   about 490 vCPU-hours (4.1).
4. **For 1.402** the binding rows would have to certify below 500/701 = 0.7132668; they are at about 0.71328. The Stein
   layer costs 5.4 to 5.7·10⁻⁵ and the cap tables 2 to 3·10⁻⁵ over the model of 3.1 (3.2). Both would have to be
   recovered, with localised caps also in three odd directions and in the block-0 region (4.2).

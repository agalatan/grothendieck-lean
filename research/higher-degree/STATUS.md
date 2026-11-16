# Higher-degree games: the ledger

*Every statement about complex Hermite projection games of degree ≥ 5: their values, the responses that bind them,
the dual side, and the degree-5 certificate programme. Labels as in [`../README.md`](../README.md). Notation in
[`README.md`](README.md).*

## 0. Sources and authors

| tag | file |
|---|---|
| PD1 | `sources/primal-dual-2026-11-16/REPORT.md`: first run of the complex primal/dual search (open problem 3 of `docs/overview.tex`) |
| PD2 | `sources/primal-dual-2026-11-16/REPORT_FOLLOWUP.md`: degree-7 robustness; degrees 9 and 11 with Z3, Z4 and grade-mixture oracles |
| PD3 | `sources/primal-dual-2026-11-16/REPORT_ROUND3.md`: identity tails; the upper-side test |
| DES | `sources/degree5-design-2026-11-16/DEGREE5_CERT_DESIGN.md`: design, loss budget and prototype of a degree-5 certificate |
| ROWGAP | `sources/literature-2026-11-16/DEGREE5_ROW_GAP.md`: the degree-5 row functional and its remote-law gap |
| MILES | `sources/literature-2026-11-16/DEGREE5_MILESTONES.md`: Stein cuts at the degree-5 peak row; the spike channel |
| HIGHER | `sources/literature-2026-11-16/HIGHER_DEGREE.md`: higher-degree games in the literature and in this repository |
| ROUTEB | `sources/literature-2026-11-16/ROUTE_B_EXPERIMENT.md`: the HJM primal/dual architecture in the complex case |
| PD45 | `sources/primal-dual-2026-11-16/REPORT_ROUNDS45.md`: degree-5 games with a cap on λ₁ |
| GATE | `sources/degree5-progress-2026-11-16/GATE.md`: the research gate of milestone M1 |
| SHARE | `sources/degree5-progress-2026-11-16/SHARING_LEMMA.md`: the order-2/4 sharing lemma (M2) |
| CERT1 | `sources/degree5-progress-2026-11-16/CERT_STAGE1.md`: the conditional certificate, stage 1 |
| SPIKE | `sources/degree5-progress-2026-11-16/SPIKE_LAYER.md`: the spike channel |

**Authors and checks.** All sources were written by research workers of claude-b9ee on 15 and 16 November 2026. Their
scripts are in `code/`. claude-b9ee read every report and checked the cutting-plane logs behind §1, but replayed no
search. Every statement below is therefore **N**, apart from those quoted from other ledgers.

## 1. Game values

| # | statement | scope | status | where |
|---|---|---|---|---|
| 1.1 | Degree 3: the cubic witness P₁,₀ − εP₂,₁ has model norm minimal at ε ≈ 0.7564, N = 0.7131355, 1/N = 1.402258 | the model | **N**; the ceiling 1.4022581233 for cubic witnesses is [`../conjecture-K/STATUS.md`](../conjecture-K/STATUS.md) 12.2 | PD1 §1 |
| 1.2 | Degree 5: λ = (1, −0.84896, 0.28180), N₅ = 0.7124294, 1/N₅ = 1.403648. Richardson extrapolation from grids with 96/128/160 radial nodes (0.71243056, 0.71242988, 0.71242971); cutting-plane gap 1·10⁻⁷. The game of the October manuscript, (1, −0.848926, 0.281576), recorded there at 1/N = 1.403641, differs only in the fourth decimals of its coefficients | W3, Z2, h∘ρ and the plain phase in the loop. Checked against W3+Z2, two independent cubic drivers, W3+(2,0), W3+(1,1), Z3 (3 seeds) and preprocessed two-variable pairs; none exceeds W3 | **N** | PD1 §1; `code/primal-dual/cutplane2.py`, `refine.py`; `code/primal-dual/results/cp2_K2.json` |
| 1.3 | Degree 5 with an identity tail: (1, −0.86328, 0.33459), ν = −0.01384, N = 0.7123827, 1/N = 1.40374 (gain 4.8·10⁻⁵). This exceeds the degree-≤5 ceiling 1.4036705 of `docs/overview.tex`, to which a tail game is not subject. Only W3 driver pairs bind; the negative tail charges symmetric responses for their mass above degree 5 | W3, Z2, h∘ρ and the plain phase (gap 3.6·10⁻⁷); the Z3 and W3+W5 checks at this optimum did not finish | **N** | PD3 §1; `code/primal-dual/round3/` |
| 1.4 | Degree 7: λ = (1, −0.906596, 0.541570, −0.242531), N₇ = 0.7121936, 1/N₇ = 1.404113 (gap 2·10⁻⁷). The value survives every family tried. W3+W5, W3+W7, a second cubic driver and W3+Z2 end within 1.3·10⁻⁶ of W3; W3+Z3 and W3+W5+W7 end below it. Z3 (6 seeds) gives 0.71138–0.71182 and Z4 (3 seeds) 0.7072–0.7080. h∘ρ gives at most 0.712107. The U(1)×U(n−1)-invariant family collapses to the plain phase for n = 1–8 | Z4 searches are weak evidence (their search grids are artefact-driven); Z5 not run | **N** | PD1 §1, PD2 §1; `code/primal-dual/results/cp3_K3.json` |
| 1.5 | Degree 7 with an identity tail: (1, −0.90861, 0.55426, −0.26737), ν = +0.00923, N = 0.7121878, 1/N = 1.40411 (gain 7·10⁻⁶) | gap 7.4·10⁻⁷ | **N** | PD3 §1 |
| 1.6 | Degree 9: λ₉ = (1, −0.93600, 0.72057, −0.59202, 0.23468), N₉ = 0.71209–0.71210, 1/N₉ = 1.40430–1.40431. Four families are balanced at the optimum: W3, Z3, h∘ρ and W3+W5. Fresh Z3 seeds (0.712021–0.712046) and Z3→Z4 warm starts (0.7119851, 0.7119012) stay below | Z3 scores carry about ±10⁻⁵ of quadrature noise | **N** | PD2 §2, with the correction in PD3 §1; `code/primal-dual/results/cp9.json` |
| 1.7 | Degree 11: the best game so far is (1, −0.93782, 0.71823, −0.57946, 0.24933, −0.016), with N₁₁ ∈ [0.712067, 0.712092] | five cutting-plane iterations; not converged | **N** | PD2 §3; `code/primal-dual/results/cp11.json` |
| 1.8 | Bracket: 1.40430 ≲ K_G^ℂ ≤ 1.404599395362. Haagerup's 1/γ† = 1.404575934663742 lies inside | left end: the model value of 1.6; right end: the Lean theorem `main_bounds` | left end **N**; right end **Lean** | 1.6 |
| 1.9 | Steps between degrees: N₃ − N₅ = 7.1·10⁻⁴, N₅ − N₇ = 2.4·10⁻⁴, N₇ − N₉ = 1.0·10⁻⁴, N₉ − N₁₁ ≤ 2.6·10⁻⁵. If they kept shrinking geometrically, the limit would be about 0.71205 (K ≈ 1.4044, below 1/γ†); slower convergence from tail effects is not excluded. The test of 3.3 gives no support to this | extrapolation only | **N** (a lead) | PD2 §4 |
| 1.10 | **Degree 5 with a cap on λ₁** (the cap set by a proved radius bound, 4.12): ε ≤ 0.75248 gives (1, −0.75248, +0.0020), 1/N = 1.402223, i.e. no gain over the cubic. ε ≤ 0.77 gives (1, −0.77, 0.0500), 1/N = 1.402595. ε ≤ 0.78 gives (1, −0.78, 0.0779), 1/N = 1.402785, a margin of 3.99·10⁻⁴ to 500/701. ε ≤ 0.7881 gives 1.402927. Identity tails add 0.4–1.9·10⁻⁵. Only visible W3 driver pairs bind; Z2, the plain phase, h∘ρ, Z3 (4 seeds) and W3+W5 stay below | gaps ≤ 8·10⁻⁷ | **N** | PD45 |

## 2. Responses

| # | statement | scope | status | where |
|---|---|---|---|---|
| 2.1 | The degree-9 games published before 16 November 2026 (1.40441–1.40444) lose to responses that the single-grade oracles missed. A grade mixture f = ph(√a·W₃ + √b·W₇), g = −f scores 0.7154289 against GPT's retuned game and 0.7138931 against the manuscript game. A genuine three-coordinate pair scores 0.712672 against the re-optimised (1, −0.95435, 0.82444, −0.78684, 0.38482), so 1/N ≤ 1.40318 there | explicit pairs on four grids | **N** | PD1 §1 |
| 2.2 | Degree 5: g = f(W → −W) exactly (the Krivine flip), and f = ph(z(1 + 0.267H₂₁ + 0.048H₃₂) + 0.290[W + 0.158(\|z\|² − 1)W + 0.096z²W̄]). One remote cubic W drives all three W-sectors (driver sharing). The dual mixture is 87% driver pairs and 13% a near-plain-phase pair in two coordinates | the model optimum | **N** | PD1 §2; `code/primal-dual/structure.py` |
| 2.3 | Degree 7: two branches tie, both with one shared W and the Krivine flip. Visible driver pairs carry 99.6% of the dual mixture; a W-dominated pair carries 0.4% (‖P₀f‖² = 0.077, ‖P₁f‖² = 0.708 in W) | the model optimum | **N** | PD1 §2 |
| 2.4 | Degree 9: the dual mixture is 60% a W3+W5 pair, 30% W3 driver pairs, 9.6% a Z3 pair (f ≈ g, cubic energy suppressed, c = (0.7588, 0.0661, 0.0289, 0.0125, 0.0077)) and 0.06% the remote-only pair ph(W₃), −ph(W₃). The Z3 pair is a finite-dimensional three-coordinate response, which no diffuse-driver fibre captures | the model optimum | **N** | PD2 §2 |
| 2.5 | Coarse polar grids flatter two- and three-coordinate pairs: up to 1.9·10⁻⁵ at 48×32, and up to 1.5·10⁻² in some Z3/Z4 searches. Every value in §1 is an explicit pair re-scored on fine grids | — | **N** | PD1, PD2 |

## 3. The dual side and roundings

| # | statement | scope | status | where |
|---|---|---|---|---|
| 3.1 | Within the model, truncated LP duals equal the primal values to 10⁻⁷. Their tails are uncontrolled, so they are not bounds on K_G^ℂ | — | **N** | PD1 §3 |
| 3.2 | An exact LP over preprocessed-phase roundings (degree 41, tail to degree 241 below 6·10⁻¹¹) stays at Haagerup's γ_H = 0.7117898067 (1/γ_H = 1.4049091), a degenerate vertex | the class h∘ρ | **N** | PD1 §3 |
| 3.3 | Krivine-type test V = c₀(μ) − Σ_{k≥1}\|c_k(μ)\| over mixtures μ of the degree-9 binding pairs, with exact model coefficients to k = 30 and the energy bound √((1 − E_f)(1 − E_g)) beyond: V_max = 0.7117798, attained by Haagerup's column alone. This is below γ_H, the repository's rounding 0.7119468 and γ† = 0.7119587. What limits it is first the pool (phases of degree-9 polynomials cancel c₁…c₄ and nothing above), then the tail bound (phases carry about 1% of their energy above degree 61) | the Z3 and W3+W5 pairs could only be bounded to k = 4, so they are not in the test | **N** | PD3 §2; `code/primal-dual/round3/krivine.py`, `code/primal-dual/results/krivine_out.json` |
| 3.4 | König's kernel e^{−\|X\|²/2−\|Y\|²/2}·sin⟨X,Y⟩ (the motivation of Jones–Malavolta, arXiv:2603.30039) has, in the complex case, a charge-one diagonal whose signs repeat with period 4: (1, +0.25, −0.125, −0.047, +0.023, …). No useful game comes from it; the optimised games already alternate with a taper | — | **N** | PD2 §5; `code/primal-dual/koenig2.py` |

## 4. The degree-5 certificate programme

| # | statement | scope | status | where |
|---|---|---|---|---|
| 4.1 | **Architecture.** The exact gate-free row of KSIDE §6 (the three-line argument of [`../conjecture-K/STATUS.md`](../conjecture-K/STATUS.md) 2.1, carried to T = P − ε₁Q + ηR): V ≤ t² − 2ℓt + 2β²/ε₁ + (c₅² + (b_A² + b_B²)‖q‖²)/η + Λ₅. Our multiplier C = b_A·q·A + b_B·q̄·B is tied to the adversary's own remote cubic q, so driver sharing is kept exactly. A certificate needs a lossy K₅, Λ₅ ≤ S₅ + η₅ at every row; the remaining potential Ψ₅(s; ν₅) is an explicit 2-D integral; the law of q uses the existing Lean inputs unchanged | design | the row: written proof in `../conjecture-K/sources/october-handoff/pipeline-gate/KSIDE.md` §6, **R** for degree 5; the rest **N** | DES §1 |
| 4.2 | **Rows.** Rows optimised for t ∈ [0.70, 0.886] give a flat envelope of 0.712430, within 2·10⁻⁶ of N₅. Room: 8.36·10⁻⁴ to 500/701 (1.402), 3.27·10⁻⁴ to 1/1.403; with the tail of 1.3, 4.8·10⁻⁵ more | the Gaussian ideal of the row; flank rows t ∈ [0.85, 0.87] being re-optimised after a fixed bug (their listed values are valid upper bounds) | **N** | DES §4.1 |
| 4.3 | **Law layer.** With the moment inputs only (E U = 1, E U² ∈ [2, 44], the sixth-moment bound), the remote-law gap is 1.5·10⁻⁵ at the peak, ≤ 5·10⁻⁶ on the flank, about 7·10⁻⁵ at t = 0.74–0.78 and 3.0·10⁻³ at t = 0.70 (Stein cuts needed there). With 300 Stein cuts the peak gap is 8.1·10⁻⁷. The constant-modulus law (+2.86·10⁻³) is excluded by κ₄ ≥ 0 | LP over discretised laws | **N** | DES §4; ROWGAP §3; MILES |
| 4.4 | **Sectors.** 18 sectors, 6 cubic and 12 quintic. A charge-parity rule leaves seven with a first-order term: the A and B shells, and quintic sectors in the remote chaoses H₂,₂, H₃,₁, H₁,₁, H₂,₀, H₀,₂, whose contents vanish for a Gaussian residual. All eight driver groups are strictly stable to second order; the H₁,₁ group (cubic z·Q sharing a driver with a quintic sector) has only a 3–4.5% margin, because the cubic cost is 1/ε₁ = 1.178. Bounding the quintic contents trivially, which is what gating amounts to, costs 1–11·10⁻³ | second-order and one-spike expansions | **N** | DES §2 |
| 4.5 | **Spike channel.** A one-spike expansion (content gain minus the q-only deficit) reproduces the K₅ flank excess: +1.8 to +2.0·10⁻⁵ against the exact +1.55 to +1.61·10⁻⁵. The channel is about 8·10⁻⁵ to 1.2·10⁻⁴ at the flank rows t ∈ [0.86, 0.886]; at the peak a signal of +6·10⁻⁷ to +1.6·10⁻⁶ is within the method's error | — | **N** | DES §2.4; MILES |
| 4.6 | **The gated architecture cannot be extended.** The gated rows of the current Lean certificate lose 3–4·10⁻³ on the degree-5 game (KSIDE §6); `docs/overview.tex` quotes about 2·10⁻² for gated rows and support functions. Both treat the degrees independently | — | **R** | KSIDE §6; `docs/overview.tex` |
| 4.7 | **The HJM primal/dual lift does not transfer.** Its rotated-copies step needs real ±1 values; in the complex case it collapses to Parseval, and the lift loses at least 2·10⁻³ | — | **N** | ROUTEB |
| 4.8 | **Verdict (16 November 2026).** GO for 1.402 as a lossy-K₅ programme. The plan is η₅ = 6·10⁻⁴ per binding row, of 7.8·10⁻⁴ available: cubic sectors 2.5·10⁻⁴, quintic content–deficit 1.5·10⁻⁴, spike layer 1.5·10⁻⁴, other 0.5·10⁻⁴; rows, law layer and caps cost ≤ 7·10⁻⁵ on top. NO-GO for 1.403 for now: about 2.9·10⁻⁴ would remain, including a spike channel of about 10⁻⁴. Risks, in order: the quintic content–deficit lemma; the H₁,₁ margin at finite amplitude; the mid-t rows; the size of the programme | design | **N** | DES §3, §7 |
| 4.9 | **The research gate (M1b): GO for 1.402.** With 14 corrected rows the envelope is 0.7124295 and the room to 500/701 is 8.37–8.60·10⁻⁴ from t = 0.82 to 0.886. The η₅ needed per binding row is 1.7–2.3·10⁻⁴, against 6·10⁻⁴. Exact K₅ fails at the peak row as well: many spikes give 7.1·10⁻⁵ there and 8.2·10⁻⁵ on the flank. H₁,₁ is stable at every amplitude in its averaged form; under arbitrary sharing it needs a sharing lemma | the uncapped game of 1.2 | **N** | GATE |
| 4.10 | **The sharing lemma (M2).** One inequality per row serves the quintic shells, the odd sector and the A/B shells: gain(q) + odd term(q) ≤ D(q) + θ·δ(q), where D is the deficit of the same law and δ the fourth cumulant. θ is 0.038–0.045 at the peak, about 0.02 at t = 0.82 and 0.022–0.026 on the flank; the law layer absorbs θδ. The cubic ledger's δ-only chain (11.49–11.50) does not transfer to orders 2 and 4: it loses 0.1–2 per row. The smallest certifiable core is the spike layer's per-coordinate telescoping (4.13) | the uncapped game | **N**; the reductions **P**, author only | SHARE |
| 4.11 | **The conditional certificate, stage 1 (M1a).** An interval enclosure of Ψ₅ (40 ms per node) and an exact law layer with the Lean moment inputs. Under the interface hypothesis K₅ (sector bound with allowance η₅), 19 rows are certified for t ≥ 0.703, with envelope B = 0.7124786 and 7.88·10⁻⁴ of room to 500/701; 48/48 replays pass. The mid-t law gaps are larger than the design estimated: 7.5·10⁻⁴ at t = 0.74. Small t is the obstruction: with moment inputs every row bound at t = 0 is at least λ₁ρ*² | the uncapped game | **C**, author only (replayed by its author); the reductions **P**, author only | CERT1 |
| 4.12 | **Small t: a proved radius bound caps λ₁.** At t = 0 the row bound is λ₁ρ*², with ρ* = sup E\|q\|/‖q‖₂ on H₂,₁. The uncapped game needs ρ* ≤ 0.916, which is open (`../conjecture-K/STATUS.md` 3.6, 3.21). With the verified ρ* ≤ 0.9513293 (`../conjecture-K/STATUS.md` 3.7, **P + C**), games with λ₁ ≤ 0.7881 pass. The chosen game is (1, −0.78, 0.0779), with 1/N = 1.402785, a margin of 3.99·10⁻⁴ and t = 0 slack 0.0073 (1.10) | the capped game | **P** (the reduction) + **N** (the margins) | CERT1, PD45 |
| 4.13 | **The spike channel.** It is "content minus deficit", additive over coordinates to 10⁻⁷. The worst configuration found is 8.21·10⁻⁵ (about 12 equal spikes, c ≈ 0.05) at t = 0.87 and about 9.2·10⁻⁵ at t = 0.86. The heavy-plus-Lindeberg split fails at every threshold. Telescoping by deletion, Σ_j Ψ(c_j; background) plus interactions, should certify a cap of 1.1–1.3·10⁻⁴, at an estimated 300–3000 CPU-hours; non-additive cross-coordinate clusters are open | the uncapped game; being re-sized for the capped game | **N**; the identities **P**, author only | SPIKE |
| 4.14 | **Phase symmetry as a content input.** The zero-content criterion of `../conjecture-K/STATUS.md` 11.31a holds for every row profile, so cubics with a diagonal symmetry without fixed coordinates have zero first-chaos (A/B) content on the degree-5 rows too, and perturbations pay only through resonant characters (11.56, given a second-derivative bound for the degree-5 profile). It says nothing on the quintic shells, whose contents lie in higher remote chaoses, and it does not cover a general cubic | the open content band t ∈ [0.80, 0.855] is unchanged | **P** (see the K ledger); no degree-5 constants are certified | `../conjecture-K/sources/phase-content-2026-11-16-codex-a786/PROOFS.md` §8 |

## 5. Open problems, in priority order

1. **Milestone M1 of the degree-5 programme** (issue #453), now for the capped game (1, −0.78, 0.0779) of 4.12. Stage 1 (4.11) and the gate (4.9) were done for the uncapped game; stage 2 of the certificate (all t, with the radius input 3.7) and the re-sizing of the spike channel (4.13) are running. The original parts:
   - (a) The conditional certificate "K₅(η₅) ⇒ K_G^ℂ > 1/(B₅ + η₅)", computed exactly: rows, Arb node caps for Ψ₅, the
     law layer and the (t, σ, x, ν₅) cover. With B₅ ≈ 0.71245, η₅ ≤ 7.7·10⁻⁴ suffices for 1.402.
   - (b) The research gate: content–deficit constants at t = 0.78–0.88, H₁,₁ at finite amplitude, and a direct quadrature
     of one spike at the peak.
2. **The lossy K₅ itself.**
   - The quintic content–deficit lemma, over five remote chaoses.
   - H₁,₁ at finite amplitude.
   - The spike layer.
   - The cubic-sector constants, recomputed at cost 1/ε₁ = 1.178. GPT's quintic leakage theorem (123π/512) is the
     template, about 3–4 times too weak if set against the law layer.
3. **1.404 at degree 9.**
   - The margin is about 1.5·10⁻⁴ in norm, comparable with the cubic certificate's loss of 1.3·10⁻⁴.
   - A certificate must also cover the three-coordinate response of 2.4.
4. **The numerical picture.**
   - Resolve degree 11 and above with Z3, Z4 and grade-mixture oracles in the loop.
   - Run a degree-9 tail search with every oracle.
   - Test the lead of 1.9 with smoothed, preprocessed multi-coordinate roundings, as in the repository's upper-bound
     construction.

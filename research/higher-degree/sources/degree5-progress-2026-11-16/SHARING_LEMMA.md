<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/SHARING_LEMMA.md, 16 November 2026; claude-b9ee research worker. -->
# M2: the order-2/4 content (sharing) lemma

Research worker for claude-b9ee (#453), 16 November 2026. Everything is **N** unless marked P (paper, author only).
Code: `share/code/`. Outputs: `share/out/` (`cs_*.json` content scans, `lawdef.json` law-layer deficits,
`analysis.json`). It builds on `GATE.md`. Costs p₁ = 1/ε₁ = 1.178 and p₂ = 1/η = 3.549.

## 0. Answer

1. **The lemma that serves all three uses is one inequality per row.** It compares the content gain of a cubic q with
   the **deficit of the same q**, plus an allowance proportional to the fourth cumulant δ(q) = E|q|⁴ − 2u²:

       (S)   Σ_j ‖Π_{H_j}Γ_j(q)‖² / (4μ_j)  +  odd sharing term(q)  ≤  D(q) + θ_row·δ(q),

   - j runs over the quintic shells H₂,₂, H₃,₁, H₁,₁, H₂,₀, H₀,₂ (orders 2 and 4) and the A/B shells H₁,₀, H₀,₁
     (order 1);
   - Γ_j are the row's first-order profiles;
   - μ_j are the certified second-order margins (cost minus curvature);
   - D is the same-variance deficit of q.

   The allowance θ·δ is a linear functional of the law of |q|, so the existing law layer (moments, Stein cuts) absorbs
   it: η_row = sup over admissible laws of [θδ − D_law].
2. **The δ-only route of the cubic ledger does not transfer.** That route (11.49 → 11.50) first bounds the content by
   γ·δ and then bounds the deficit below by δ. At degree 5 the contents per unit δ are 10–50 times the cubic A-content:
   Σ_j γ_j/(4μ_j) = 0.44–0.67, against a moment-LP deficit per unit δ of 0.02–0.13. Closing that chain would need an
   allowance of 0.1–2, which is useless. **(S) must compare content with the same law's deficit.**
3. **The true constants** are below.
   - θ_row ≈ 0.045 at the peak (one spike at small amplitude). The exact 30-spike optimum of the GATE gives 0.038.
   - The odd sector sharing the spike coordinate is stable at σ*: curvature/cost 0.967 → 0.773 as the spike grows.
     Sharing lowers the curvature, so the odd sharing term is ≤ 0 on these families.
4. **Proof.** The Stroock and chain-rule reduction is P. The order-1 part transfers from 11.49 with new kernels. Orders 2
   and 4 reduce to two contraction inequalities, still open. The coupling to the same-law deficit with κ ≈ 1 is too
   sharp to certify globally; **the certifiable core is per coordinate**: the spike layer's exact single-coordinate net
   gains, plus (S) only for the low-influence remainder (§3).

## 1. Statement and per-row constants

**Notation.** q ∈ H₂,₁(w), u = E|q|², δ = E|q|⁴ − 2u², D(q) = B₅(u) − E Ψ₅(|q|). R(q) = r(|q|)·ph(q)^χ is a radial
profile of charge χ, and H_{a,b} has a − b = χ but is not of the form (2i + j, i + 2j); the diffuse cubic never reaches
such chaoses.

**(S1) Content per unit cumulant**, ‖Π_H R(q)‖² ≤ γ_R·δ. True constants are the supremum over the one-spike family in
the bulk; contents and δ are additive over spikes, so they hold for N equal spikes too. The supremum is at small spike
amplitude:

| t | p₁₀ (H₂,₂) | p₂₁ (H₁,₁) | p₀₁ (H₃,₁) | p₁₂ (H₂,₀) | p₃₀ (H₀,₂) | r_A (H₁,₀) | r_B (H₀,₁) | G = Σγ/(4μ) |
|---|---|---|---|---|---|---|---|---|
| 0.70 | 2.30 | 0.75 | 0.63 | 0.18 | 0.046 | 0.045 | 0.020 | 0.67 |
| 0.78 | 1.88 | 0.71 | 0.54 | 0.17 | 0.044 | 0.038 | 0.017 | 0.58 |
| 0.84 | 1.61 | 0.67 | 0.49 | 0.17 | 0.043 | 0.031 | 0.015 | 0.48 |
| 0.88 | 1.49 | 0.65 | 0.46 | 0.17 | 0.044 | 0.024 | 0.012 | 0.44 |

- γ falls with the spike amplitude. At the peak p₁₀ goes 1.33 → 0.06 and p₂₁ 0.47 → 0.03 for c = 0.06 → 1, while D/δ
  falls only 0.134 → 0.065.
- The worst bounded profile with the same oscillation would have 10²–10⁵ times the content. So the lemma must use the
  actual smooth profiles; a statement "for every bounded R" is hopeless.

**(S2) Content against deficit, per row** (the allocation of the GATE, Σκ_g = 1, applied to the same-law deficit):
gain ≤ D + θ·δ, with true θ:
- peak 0.045 (small spikes) and 0.038 (exact 30-spike optimum);
- t = 0.82 about 0.02;
- t = 0.78 ≤ 0;
- flank 0.022 (one spike) to 0.026 (12 spikes).

Through the moment law layer the resulting allowance is η = sup_m [(θ − d_LP(u, m))₊·(m − 2)u²], where d_LP = D_LP/δ
from `lawdef.json`:
- d_LP is 0.021 at m = 2.05, 0.085–0.095 for m ∈ [2.2, 6], and 0.041 at m = 44 (peak, u = σ*²);
- so η ≈ 4·10⁻⁶ near m = 2 (removed by Stein cuts) and 0 for m ∈ [2.2, 20], but **up to 5·10⁻⁴ at m → 44**, where the
  LP's junta-like law has d_LP ≈ θ.

The many-spike channel itself (about 7–8·10⁻⁵) is allowed through θδ and needs no extra allowance.

**(S3) Odd sector (H₁,₁) under sharing.** For Q ∈ H₁,₁ with arbitrary dependence, the second-order odd increment is

    ½E[|Q|²α(|q|)] − ½Re E[Q²β(|q|)].

Its sharing part is the covariance of |Q|² and Q² with α(|q|), β(|q|) (P: |Q|² − E|Q|² and Q² − EQ² live in
H₁,₁ ⊕ H₂,₂), bounded by √8·‖Q‖²·‖Π_{11⊕22}(α, β)(|q|)‖ (P: E|Q|⁴ ≤ 9(E|Q|²)² on H₁,₁). Numerically, for Q = iλe₁₁(y)
sharing the spike coordinate, at σ* on the peak, the curvature/cost is 0.967, 0.962, 0.954, 0.944, 0.919, 0.869, 0.773
for c = 0.06, 0.1, 0.15, 0.2, 0.3, 0.5, 1. The covariance is negative.

What remains is the mean term ½E[α + β] < p₁ (0.969 at the peak). That is a law functional and goes into the law layer
like θδ. It fails only for laws massed near |q| = 0, which the variance slack pays for (GATE §3(f)).

## 2. Relation to Lemma CC (#315) and the ledger

- **#315 (CC)** asks θ_{(p,q)}(m) ≲ C(m − 2) for bounded G. (S1) is exactly CC for the actual profiles, with δ = (m − 2)u².
  The constants are large at orders 2 and 4, as #315 §3b warned (13–27 % at m − 2 ≈ 0.3–1), and small at order 1
  (r_A 0.03, matching the "benign" first shell).
- **Ledger 6.3/6.3.18** (C² ≤ κD for the A-content, open for a general cubic, numerically 0.0876) is the order-1 case of
  (S2) with κ ≪ 1. At degree 5 the quintic shells force κ ≈ 1, which is the source of the spike channel.
- **11.49/11.50** prove the order-1 analogue at the cubic peak: energy-dependent γ_i(u)·δ with γ ≈ 0.03–0.05, then
  ≤ 0.3D₊ + 6·10⁻⁶. The method (profile kernels k_u, moment caps, Stein duals) transfers to r_A, r_B unchanged; at
  degree 5 r_A has γ = 0.024–0.045, the same size. It does **not** close orders 2 and 4 (§0, item 2).

## 3. Proof: what is P, C, open; the certifiable core

- **P (standard).** Stroock: Π_{a,b}F = I_{a,b}(E[∂^a∂̄^bF]/(a!b!)). With the chain rule, the content of R(q) of order
  a + b ≤ 4 is a sum of ‖E[R^{(k)}(q)·T_k(q)]‖², where T_k are products of ∂q (second chaos), ∂²q (first chaos) and
  ∂³q (constant).
- **Open (two contraction inequalities).** ‖E[R''(q)(∂q⊗∂q − E∂q⊗∂q)]‖² ≲ ‖R''‖²·δ and ‖E∂q⊗∂q‖²_HS − (diagonal part)
  ≲ δ. Both are fourth-moment-theorem facts of the kind already in Lean (contraction-Gram budgets); expect a paper
  proof plus Lean checks similar to the sixth-moment facts.
- **C (per row, cheap).** The profile kernels of Γ_j, α, β and the moment-cap/Stein-dual bounds on (u, x) cells, as in
  11.49: about 10 energy cells × 7 profiles per row, minutes in Arb.
- **The coupling κ ≈ 1 is the hard part.** (S2) with θ near the true value needs content and deficit tracked jointly;
  δ alone loses (§0, item 2).
  - **Smallest certifiable core:** the spike layer's telescoping by deletion. Its exact single-coordinate net gains
    Ψ(c, u) on a (c, u) grid, extended from the flank to t ∈ [0.82, 0.886], cost 50–300 CPU-hours (Arb).
  - (S1) is then needed only for the low-influence remainder: coordinates with c² ≤ τ ≈ 5·10⁻⁴, where content ≤ γτ·u
    is tiny and the law layer pays.
  - The odd mean term and θδ enter the law LP as linear functionals, with Stein cuts against the m ≈ 2 floor and the
    m → 44 junta law.
- **Still open:** the two contraction inequalities, and the non-additive cross-coordinate clusters (+30 % at d = 3,
  spike-layer worker) inside the telescoping.

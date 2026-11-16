<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/literature/DEGREE5_MILESTONES.md, 16 November 2026; Agent-ID: claude-b9ee (research workers of this session). -->
# Degree-5 milestones: spike-channel saturation and L1₅ with Stein cuts

claude-b9ee research worker (literature, route B), 16 November 2026. All numbers are **N** (numerical). claude-b9ee saved this file from the worker's partial report; the two extra spike runs are collected separately below.

## 1. Spike-channel saturation (milestone 1)

**The many-spike trend** is already in the repository: `research/conjecture-K/sources/k5-2026-11-04/RESULTS.md` §4.4. These are fresh-sample excesses over the Gaussian at row t = 0.87, for the symmetric N-spike family:

| N | 1 | 2 | 3 | 5 | 6 | 8 | 10 | 14 | 20 | 40 |
|---|---|---|---|---|---|---|---|---|---|---|
| excess (10⁻⁵) | 1.55 | 2.9 | 4.6 | 5.1 | 7.1 | **8.1 ± 0.8** | 8.0 ± 1.0 | 7.7 | 7.2 | 4.3 |

- **The channel saturates.** It peaks at about 8·10⁻⁵ for 8–14 spikes of amplitude 0.05–0.06 each, then decays roughly like N^(−1/2) (8.0 → 4.3 from N = 10 to 40), as the CLT predicts: correlated companions become independent Gaussians.
- **The worst structure** is spikes c·H₂,₁(z_j) carrying the same-coordinate companions z₁:|z_j|⁴:, H₂,₁(z₁)(|z_j|² − 1) and z̄₁:z_j³z̄_j:, with ν₅ ≈ 0.05.
- **Cross-coordinate terms** (the full family at N = 2 gives 5.0 against 3.3) suggest a plateau over the full space of about 1.0–1.2·10⁻⁴.
- **Rows.** The channel is confined to t ∈ [0.86, 0.886]. The one-spike exact values are +1.77, +1.61 and +1.38·10⁻⁵ at t = 0.86, 0.87 and 0.88; there is none at t ≤ 0.85.
- **Budget.** The flank rows rise from about 0.71245 to 0.71253–0.71257, so the model gives K ≈ 1.4034. That leaves a certificate loss of about 1.9–2.3·10⁻⁴ for 1.403, against 3.2·10⁻⁴ without spikes.

## 2. L1₅ at the peak row with Stein cuts (milestone 2)

- **The cut family** is the repository's cut (11) of `remote_strong_PROOF.md` §4, (φ, β, t, λ, μ, ν), with E G(U) ≥ 0. It is now added to the degree-5 remote-law LP.
- **The 45 cubic Stein nodes do not help:** the gap stays at +1.445·10⁻⁵. Those nodes were tuned to the cubic potential.
- **Cuts generated for the current extremal law do help.** They come from a convex minimisation over φ on a 50-knot grid plus (β, t, ν), with λ and μ in closed form.
  - The gap falls to 6.7·10⁻⁶ after 10 cuts, 2.8·10⁻⁶ after 40, 1.5·10⁻⁶ after 100, 1.0·10⁻⁶ after 200 and **+8.1·10⁻⁷ after 300** (final run; global rescan at u = 0.0566, m = 2.002), still decreasing slowly.
  - The extremal law spreads over many atoms that approximate Exp(1), as expected: at χ = 0 the Stein identity forces the exponential law.
- **Validity of the cuts.** Every generated cut was checked by accurate quadrature to satisfy E_Exp G > 0 (+5·10⁻³ to +4·10⁻²). Early negative values were Gauss–Laguerre error on the kinked integrand.
- **Conclusion:** the moment-ambiguity floor drops from +1.4·10⁻⁵ to below 10⁻⁶, as in the cubic case, so the remote layer costs nothing in the budget.

## 3. Assessment

- **Go, with a thin margin.** The model gives about 1.4034 with spikes. A certificate for ≥ 1.403 may lose at most about 2·10⁻⁴; the cubic rows plus the law machinery currently lose about 1.3·10⁻⁴.
- **What a K₅ sector programme needs beyond cubic K:**
  1. The degree-5 row with coupling (b_A, b_B, c₅), and its t-cover.
  2. L1₅ with Ψ₅: done numerically here; certifying it reuses the cubic law inputs.
  3. The costs and contents of the companion sectors a·q(T − 1) and b·q̄z₁²/√2, plus ν₅H₃,₂ and the remote quintic.
  4. **A new spike layer:** an influence decomposition that treats high-influence coordinates and their same-coordinate companions exactly, capped at about 1·10⁻⁴.
  5. Analogues of (★) and (P), with the degree-5 shells in the base and a larger compact box.
  6. Node caps and Lean for Ψ₅, with more parameters.
  7. The consumer, whose envelope is set by the flank rows.

Scripts and logs are in `checks/degree5-milestones/`.

The 300-cut log is in `checks/degree5-milestones/cutgen_peak_300.log`; the full copy is at `/private/tmp/claude-501/-Users-alingalatan-workspaces-grothe/5cd9b705-6072-44d0-a4e1-13a1e3d002d0/scratchpad/m5/cutgen_peak_300.log`.

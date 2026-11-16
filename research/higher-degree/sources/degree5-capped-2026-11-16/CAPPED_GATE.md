<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/CAPPED_GATE.md (16 November 2026); a research worker of claude-b9ee. Only this line was added. -->
# Degree-5 certificate: the research gate for the capped game

Research worker for claude-b9ee (issue #453), 16 November 2026. This re-runs the sector analysis of `GATE.md` and
`SHARING_LEMMA.md` for the capped game λ = (1, −0.78, 0.0779). Everything is **N** (floating point, deterministic
quadrature) unless marked **P** (paper proof).

- **Game:** (ε₁, η) = (0.78, 0.0779), so the costs are p₁ = 1/ε₁ = 1.2821 and p₂ = 1/η = 12.837. The K5 game had 1.178
  and 3.549.
- **Rows:** the certificate worker's capped rows (`/root/claude-b9ee-d5cert2/ro_*.log` on `big`; the Gaussian rows of
  `CERT_STAGE2.md` §3), 18 rows from t = 0.70 to 0.886, copied to `capgate/rows5.lines`. For the small-t rows I use
  `cert2/out/rows_final.json`.
- **Rooms:** the decision table uses the stage-2 rooms (`CERT_STAGE2.md` §3: 500/701 minus the certified row's maximum
  on its active interval, law layer and rows included). §1 also gives the Gaussian-ideal rooms.
- **Code:** the GATE and sharing-lemma codes (`gate/code/`, `share/code/`) unchanged, with (ε₁, η) read from `D5_E1`,
  `D5_ETA` (`capgate/code_capped/d5eng.py`); new scripts in `capgate/`. Outputs: `capgate/out/`. §7 lists the files.

## 0. Answer

1. **θ ≤ 0 on every capped row from t = 0.70 to 0.886, so the spike layer is absorbed.**
   - **Exact coupled model** (the GATE's `spike2.py`: all 15 sectors and all couplings). Every one-spike point loses.
     θ = −0.037 (t = 0.70), −0.091 at the peak, −0.20 (t = 0.88).
   - Per-group constants close **without any allowance**: Σκ* = 0.30–0.42. One combined inequality needs only
     κ = 0.16–0.24. In the K5 game the same model gave Σκ* = 1.2–3.2 and θ = +0.045 at the peak.
   - Even the lossy decoupled chain closes on t ≥ 0.80: θ ≤ −0.016, κ* ≤ 0.86.
   - **The quintic shells now take little of the deficit** (≤ 0.11 per group, ≤ 0.16 together). The A/B shells
     (order 1) take 0.10–0.34, and their worst case is the one-coordinate junta. So on the capped rows (S) is essentially the order-1 A-content lemma.
2. **H₁,₁.**
   - The averaged form is stable at every amplitude: ratio 0.869–0.934, a margin of 6.6–13 % that grows with
     amplitude.
   - Zero core: ε₁E_z[|z|/|g|] = 0.994 (t = 0.81), 0.977 (0.82), 0.926 (peak), 0.869 (0.886). **It is below 1 on every
     row with t ≥ 0.81**, so there the arbitrary-sharing (7.2.10) form holds at every s with no allowance.
   - It exceeds 1 on t ≤ 0.80 (1.012–1.206). The Gaussian-core allowance there is ≤ 3.1·10⁻³ (moment LP: ≤ 4.5·10⁻⁵),
     at most a third of the stage-2 room.
3. **The other sectors are pure cost.**
   - A/B: on t ≥ 0.74, with margins of 15–26 % on t ≥ 0.80; the finite-amplitude ratio is within 0.3 % of the
     infinitesimal one.
   - Quintic first-order sectors: by the elementary majorant, ≤ 0.24 of the cost.
   - Odd sector sharing the spike coordinate: ≤ 0.978 on t ≥ 0.80.
4. **Decision: GO for 1.402 on t ∈ [0.70, 0.886].**
   - η₅ needed is 0 on the binding band. The whole stage-2 room (3.8·10⁻⁴ at t = 0.845–0.85) is therefore slack for
     certification losses.
   - The mid rows need ≤ 3.1·10⁻³ (odd Gaussian core) against rooms of 1.8–9.6·10⁻³.
   - **New open item: small t.** Stage 2's rows on t ≤ 0.6 also rest on K₅, and there the pure-cost premises fail: A/B
     1.05–387, odd zero core 1.28–827. The odd allowance alone reaches 1.0–1.6 times the room at t = 0.1–0.2.
   - 1.403 is out of reach of this game: its ceiling is 1.40279.
5. **To prove** (§6, with allowances):
   - the order-1 content lemma in the same-law form (any κ ≤ 1 will do; the true value is 0.30–0.42);
   - the zero-core scalar and its monotonicity in s;
   - A/B (P)-type pure cost;
   - the quintic majorant;
   - the Gaussian-core odd allowance on t ≤ 0.80;
   - an argument for small t, which is new.

---------------------------------------------------------------------------------------------------------------------

## 1. Rows, rooms and the law layer

The law column is the GATE's moment law layer (moments and the sixth-moment cap; no radius input, no Stein cuts;
`capgate/lp_rows.py`): the supremum over (u, m, ν₅) and over laws of X = |q|²/u with E X = 1, E X² = m,
E X³ ≤ 9m − 12 + C₆(m − 2)^{3/2}, minus the Gaussian S₅ of the same potential. The last column is the stage-2 room.

| t | row (Gaussian ideal) | room to 500/701 | σ* (ν₅*) | law layer: LP − S₅ (law at the LP optimum) | stage-2 room |
|---|---|---|---|---|---|
| 0.700 | 0.6999093 | 1.34e-02 | 0.423 (0.0037) | 8.4e-03 (m = 3.5, u = 0.240) | 9.61e-03 |
| 0.740 | 0.7054326 | 7.83e-03 | 0.379 (0.0052) | 4.1e-03 (m = 3.5, u = 0.200) | 5.90e-03 |
| 0.760 | 0.7077414 | 5.53e-03 | 0.355 (0.0062) | 2.4e-03 (m = 3.5, u = 0.170) | 4.20e-03 |
| 0.780 | 0.7096859 | 3.58e-03 | 0.327 (0.0072) | 1.2e-03 (m = 3, u = 0.135) | 3.17e-03 |
| 0.800 | 0.7112157 | 2.05e-03 | 0.296 (0.0084) | 4.0e-04 (m = 3, u = 0.110) | 1.79e-03 |
| 0.810 | 0.7118086 | 1.46e-03 | 0.280 (0.0090) | 1.4e-04 (m = 2.75, u = 0.090) | 1.23e-03 |
| 0.820 | 0.7122774 | 9.89e-04 | 0.261 (0.0096) | 2.2e-05 (m = 2, u = 0.068) | 7.52e-04 |
| 0.830 | 0.7126150 | 6.52e-04 | 0.241 (0.0103) | 1.3e-05 (m = 2, u = 0.058) | 4.84e-04 |
| 0.840 | 0.7128135 | 4.53e-04 | 0.219 (0.0111) | 6.3e-06 (m = 2, u = 0.048) | 4.10e-04 |
| 0.845 | 0.7128582 | 4.09e-04 | 0.207 (0.0114) | 4.1e-06 (m = 2, u = 0.043) | 3.82e-04 |
| 0.850 | 0.7128653 | 4.02e-04 | 0.195 (0.0118) | 2.5e-06 (m = 2, u = 0.038) | 3.82e-04 |
| 0.855 | 0.7128335 | 4.33e-04 | 0.181 (0.0122) | 1.4e-06 (m = 2, u = 0.033) | 3.94e-04 |
| 0.860 | 0.7127620 | 5.05e-04 | 0.166 (0.0126) | 8.3e-07 (m = 2, u = 0.028) | 4.47e-04 |
| 0.865 | 0.7126496 | 6.17e-04 | 0.150 (0.0131) | 5.7e-07 (m = 2, u = 0.022) | 5.42e-04 |
| 0.870 | 0.7124951 | 7.72e-04 | 0.131 (0.0135) | 5.3e-07 (m = 2, u = 0.017) | 6.76e-04 |
| 0.875 | 0.7122974 | 9.69e-04 | 0.109 (0.0139) | 6.3e-07 (m = 2, u = 0.012) | 8.51e-04 |
| 0.880 | 0.7120552 | 1.21e-03 | 0.081 (0.0144) | 6.6e-07 (m = 2, u = 0.007) | 1.08e-03 |
| 0.886 | 0.7117039 | 1.56e-03 | 0 (0.0149) | 5.3e-07 (m = 2, u = 0.002) | 1.34e-03 |

- **The binding band is narrow.** The stage-2 rooms are below 5.5·10⁻⁴ only on t ∈ [0.83, 0.865] (3.82·10⁻⁴ at
  t = 0.845–0.85). In the K5 game the whole band 0.82–0.886 lay within 2.6·10⁻⁵ of the minimum room.
- **1.403 is out of reach of this game.** The Gaussian-ideal peak row 0.7128653 already exceeds 1/1.403 = 0.7127584;
  the game's ceiling is 1/0.7128653 = 1.40279.
- **The law layer splits in two** (consistent with stage 2's certified law gaps).
  - On t ≥ 0.82 the moment LP finds only the m = 2 floor: 2.2·10⁻⁵ at t = 0.82 and ≤ 6.3·10⁻⁶ on t ≥ 0.84.
  - On t ≤ 0.81 it finds non-Gaussian laws (m ≈ 2.75–3.5, larger u) that beat the Gaussian by 1.4·10⁻⁴ (t = 0.81) up to
    8.4·10⁻³ (t = 0.70). In the K5 game this loss was ≤ 7.5·10⁻⁵ down to t = 0.74. Stage 2 has it inside its rooms
    (law gap 7.2·10⁻³ at t = 0.70, 1.0·10⁻³ at 0.78, with the radius input).

---------------------------------------------------------------------------------------------------------------------

## 2. The sharing-lemma constant θ (item 1)

**The statement** (`SHARING_LEMMA.md` §0, with the variance slack as in GATE §2). For q ∈ H₂,₁ with u = E|q|²,
δ = E|q|⁴ − 2u², D(q) = B₅(u) − EΨ₅(|q|) and V_sl(u) = S₅ − (B₅(u) − cost(u)) ≥ 0:

    (S)   Σ_j ‖Π_{H_j}Γ_j(q)‖² / (4μ_j)  +  odd sharing term(q)  ≤  D(q) + V_sl(u) + θ_row·δ(q).

- j runs over the quintic shells H₂,₂, H₃,₁, H₁,₁, H₂,₀, H₀,₂ (the h-side, orders 2 and 4) and the A/B shells H₁,₀,
  H₀,₁ (order 1).
- θ_row is the smallest constant that holds on the one-spike family q = σ(c·H₂,₁(y) + √(1 − c²)·W): c from 0.06 or
  0.1 up to 1, σ from 0.25σ* up to 1.1σ*, and up to 2σ* on t = 0.80–0.85 (grids in (a) and (b)).
- Contents and δ are additive over spikes, so N equal spikes give the same ratios.
- κ* is the no-allowance form: the largest gain/(D + V_sl) on the family. θ ≤ 0 exactly when κ* ≤ 1.

### (a) The exact coupled model (`gate/code/spike2.py`, `analyze2.py`)

All 15 non-residual sectors along their spike polynomials, plus ν₃ and the ν₅ shift, with all couplings. The excess is
Σ gains − D − V_sl, with the scalar ν₅/ν₃ shift left out as in the GATE. Grids:
- t ≥ 0.78: c ∈ {0.1, 0.15, 0.2, 0.3, 0.45, 0.6, 0.8, 1} and σ ∈ {0.25, 0.5, 0.75, 0.9, 1, 1.1}·σ*, plus σ = 0.03, 0.06;
- t = 0.70, 0.74: c ∈ {0.1, 0.2, 0.3, 0.6, 1} and σ ∈ {0.5, 0.75, 1, 1.1}·σ*;
- t = 0.80 and 0.84 also at σ = 1.25, 1.5, 2σ* for c ≥ 0.6 (`sp2big_*`).

| t | largest one-spike excess (c, σ/σ*) | θ = max excess/δ (c, σ/σ*) | κ*_g: H₂,₂ / H₁,₁ / H₃,₁ / H₁,₀-H₀,₁ / H₂,₀-H₀,₂ | Σκ* | one inequality: max gain/(D + V_sl) | η with Σκ_g = 1 | non-concave points |
|---|---|---|---|---|---|---|---|
| 0.700 | −3.7e-05 (0.1, 1.00) | −0.037 (1, 1.10) | 0.05 / 0.01 / 0.01 / 0.34 / 0.00 | 0.42 | 0.24 | 0 | 4 |
| 0.740 | −2.5e-05 (0.1, 1.00) | −0.042 (1, 1.10) | 0.07 / 0.02 / 0.02 / 0.29 / 0.01 | 0.41 | 0.23 | 0 | 3 |
| 0.760 | −1.9e-05 (0.1, 1.00) | −0.045 (1, 1.10) | 0.07 / 0.03 / 0.02 / 0.27 / 0.01 | 0.40 | 0.23 | 0 | 2 |
| 0.780 | −1.4e-05 (0.1, 1.00) | −0.050 (1, 1.10) | 0.09 / 0.04 / 0.02 / 0.24 / 0.01 | 0.40 | 0.23 | 0 | 19 |
| 0.800 | −9.9e-06 (0.1, 1.00) | −0.056 (1, 1.10) | 0.10 / 0.05 / 0.03 / 0.22 / 0.01 | 0.40 | 0.23 | 0 | 11 |
| 0.820 | −6.2e-06 (0.1, 1.00) | −0.065 (1, 1.10) | 0.11 / 0.05 / 0.03 / 0.20 / 0.01 | 0.41 | 0.22 | 0 | 0 |
| 0.830 | −4.6e-06 (0.1, 1.00) | −0.072 (1, 1.10) | 0.11 / 0.05 / 0.03 / 0.19 / 0.01 | 0.40 | 0.21 | 0 | 0 |
| 0.840 | −3.2e-06 (0.1, 1.00) | −0.080 (1, 1.10) | 0.11 / 0.05 / 0.03 / 0.19 / 0.01 | 0.39 | 0.21 | 0 | 0 |
| 0.850 | −2.0e-06 (0.1, 1.00) | −0.091 (1, 1.10) | 0.10 / 0.05 / 0.03 / 0.19 / 0.01 | 0.38 | 0.21 | 0 | 0 |
| 0.860 | −1.1e-06 (0.1, 1.00) | −0.108 (1, 1.10) | 0.10 / 0.05 / 0.03 / 0.17 / 0.01 | 0.36 | 0.20 | 0 | 0 |
| 0.870 | −4.4e-07 (0.1, 1.00) | −0.137 (1, 1.10) | 0.10 / 0.05 / 0.03 / 0.15 / 0.01 | 0.33 | 0.19 | 0 | 0 |
| 0.880 | −6.8e-08 (0.1, 1.00) | −0.203 (1, 1.10) | 0.10 / 0.05 / 0.03 / 0.10 / 0.01 | 0.30 | 0.18 | 0 | 0 |
| 0.886 | −7.4e-08 (0.1, σ = 0.03) | −0.136 (1, σ = 0.16) | 0.09 / 0.04 / 0.03 / 0.15 / 0.01 | 0.32 | 0.16 | 0 | 0 |

- **Every finite point loses.** The least negative point is always the small spike at the bulk optimum (c = 0.1,
  σ = σ*): −3.7·10⁻⁵ at t = 0.70, −2.0·10⁻⁶ at the peak, −6.8·10⁻⁸ at t = 0.88. In the K5 game the same point won
  +1.7·10⁻⁶ at the peak, and the flank won +1.5–1.8·10⁻⁵.
- **θ is attained on the junta** (c = 1, σ = 1.1σ*). At larger σ, θ creeps towards 0 while κ falls:
  - t = 0.80, σ up to 2σ*: θ ≤ −0.028, κ ≤ 0.19;
  - t = 0.84, σ up to 2σ*: θ ≤ −0.041, κ ≤ 0.20.

  So the ratio form "gain ≤ κ(D + V_sl)" is the one that holds uniformly in σ.
- **The allocation has changed.** A/B carries 0.10–0.34 and H₂,₂ (z₁·:|z_j|⁴:) 0.05–0.11; every other group carries
  ≤ 0.05. In the K5 game the order was the reverse: H₂,₂ 0.5–1.5, A/B 0.2–0.3.
- **Non-concave points occur only on t ≤ 0.80**, at small σ (≤ 0.75σ* at t = 0.70, ≤ 0.25σ* at t = 0.80) and small c.
  This is the zero-core instability of the H₁,₁ block, met by the spike's own polynomial, as in the K5 GATE. These
  points carry V_sl ≥ 4.8·10⁻³, and §3 prices them.

### (b) The decoupled chain (`share/code/content_scan.py`, `capgate/analyze_cs_capped.py`)

The gain is bounded by Σ_j content_j/(4μ_j) with the pointwise margins of §4: μ_h = (1 − ρ_h)p₂ with ρ_h = 0.125–0.168,
and μ_AB = (1 − ρ_AB)p₁ with ρ_AB = 0.743–0.939. κ*_h and κ*_AB are the no-allowance constants of the two groups taken
separately (each at its own worst point).

| t | θ (chain) at (c, σ/σ*) | κ*_h (quintic shells) | κ*_AB (A/B shells) | κ*_h + κ*_AB | odd ratio sharing the spike | D/δ (c ≥ 0.1) |
|---|---|---|---|---|---|---|
| 0.700 | +0.697 (1, 0.50) | 0.10 | 6.04 | 6.13 | 1.107 | 0.04–0.63 |
| 0.740 | +0.077 (1, 0.75) | 0.11 | 1.86 | 1.97 | 1.055 | 0.05–0.59 |
| 0.780 | −0.005 (1, 1.10) | 0.13 | 0.92 | 1.05 | 1.003 | 0.06–0.55 |
| 0.800 | −0.016 (1, 2.00) | 0.14 | 0.72 | 0.86 | 0.978 | 0.07–0.53 |
| 0.820 | −0.021 (1, 2.00) | 0.15 | 0.58 | 0.73 | 0.952 | 0.08–0.52 |
| 0.840 | −0.028 (1, 2.00) | 0.16 | 0.47 | 0.63 | 0.927 | 0.10–0.49 |
| 0.850 | −0.034 (1, 2.00) | 0.17 | 0.42 | 0.59 | 0.914 | 0.11–0.48 |
| 0.860 | −0.083 (1, 1.10) | 0.17 | 0.35 | 0.52 | 0.901 | 0.13–0.48 |
| 0.880 | −0.185 (1, 1.10) | 0.18 | 0.17 | 0.35 | 0.875 | 0.25–0.45 |
| 0.886 | −0.181 (1, σ = 0.10) | 0.17 | 0.17 | 0.34 | 0.868 | 0.22–0.46 |

- **The chain alone closes on t ≥ 0.80**, with κ*_h + κ*_AB = 0.34–0.86 and no allowance. With the same chain the K5
  peak had θ = +0.20.
- **The chain overstates the A/B gain**, 2–4 times on t ∈ [0.78, 0.86] and up to 18 times at t = 0.70. It charges the worst pointwise curvature at s = 0 (ρ_AB) where the
  coupled model uses the curvature along the family's own law. On t ≤ 0.74 the A/B margin 1 − ρ_AB is small (0.06 at
  t = 0.74; 0.019 at t = 0.70, taken at s = 0.1), so content/(4μ_AB) explodes. The positive θ there is an artefact: the
  exact model of (a) gives θ = −0.042 and −0.037.
- **Beyond σ*** the chain behaves like the exact model: at the peak θ goes from −0.065 (1.1σ*) to −0.034 (2σ*) while κ
  falls from 0.44 to 0.40.

### (c) Why θ changed sign, and where it now sits

- **The quintic price.** μ_h is 6.3 times the K5 value (11.1 against 1.77), so the h-side gain per unit content falls
  sixfold. The quintic shells now take only 0.10–0.18 of the deficit (chain; ≤ 0.11 for H₂,₂ in the exact model). In
  the K5 game H₂,₂ alone took 40 % of a budget that summed to 1.2–3.2.
- **A more concave potential.** At the peak D/δ is 0.11–0.48 on the family, against 0.065–0.134 in the K5 game.
- **The worst point moved.** In the K5 game θ peaked on small spikes (c ≈ 0.06–0.2), where the quintic content per
  unit δ is largest. Here it peaks at c = 1, the one-coordinate junta, where the order-1 A/B content carries most of
  the gain (exact, at the peak: 0.18 of the 0.21). **On the capped rows (S) is essentially the order-1 A-content
  lemma.**
- **The spike layer is absorbed.** With θ ≤ 0 the many-spike channel needs no allowance. This matches the direct
  evidence of `spike-layer/SPIKE_CERT.md` §5: in this game one spike in the bulk loses 9–12·c⁴, many spikes lose
  additively, and the optimiser switches the cross-coordinate clusters off.

### (d) Which proof forms close

- **Same-law form (S): closes with a wide margin.** With the exact constants a per-group proof may lose up to
  1 − Σκ* = 58–70 % of D + V_sl; even the lossy chain leaves 27–48 % on t ∈ [0.82, 0.86].
- **δ-only form: fails.** Content ≤ γ·δ with γ the family supremum, against the moment-LP deficit, needs an allowance
  of 8.8·10⁻³ at the peak (G = Σγ/(4μ) = 0.157 against d_LP = D_LP/δ = 0.068 at m = 44).
- **m-dependent contents with the moment LP: closes only from the peak outward.** The family's own content at each m
  against D_LP(u, m) leaves 4.7·10⁻⁶ at t = 0.85 and ≤ 1.3·10⁻⁶ on t ≥ 0.86, but 3.7·10⁻⁴ at t = 0.84 and 4.5·10⁻³ at
  t = 0.82. The moment LP's junta-like laws have far less deficit than the true junta, whose A/B content they would
  have to pay for.
- So (S) must compare the content with **the same law's deficit**, at least for spiky laws; or the spikes are treated
  per coordinate (the sign certificate (SC) of `SPIKE_CERT.md` §5.4) and (S) is used only for the low-influence
  remainder.

---------------------------------------------------------------------------------------------------------------------

## 3. H₁,₁ at finite amplitude (item 2)

The k-side odd shell z·Q (Q ∈ H₁,₁) with z̄·P (P ∈ H₂,₀) alongside; cost p₁ = 1.2821. Codes `gate/code/h11c.py`,
`gate/code/lawlp_odd.py`, `capgate/zero_core.py`. The columns s = 0.1, 0.2 are the pointwise worst ratio at |q| = s.

| t | ε₁E_z[|z|/|g|] (s = 0) | s = 0.1 | s = 0.2 | Emax(0) | arbitrary-sharing allowance: Gaussian law / moment LP | averaged: τ → 0 / 0.3 / 1 | stage-2 room |
|---|---|---|---|---|---|---|---|
| 0.700 | **1.2062** | 1.1823 | 1.1162 | 1.7e-02 | 3.1e-03 / 4.5e-05 | 0.934 / 0.884 / 0.678 | 9.61e-03 |
| 0.740 | **1.1244** | 1.1043 | 1.0488 | 7.1e-03 | 1.1e-03 / 0 | 0.921 / 0.873 / 0.671 | 5.90e-03 |
| 0.760 | **1.0857** | 1.0665 | 1.0180 | 3.6e-03 | 4.5e-04 / 0 | 0.915 / 0.867 / 0.668 | 4.20e-03 |
| 0.780 | **1.0483** | 1.0314 | 0.9860 | 1.2e-03 | 1.1e-04 / 0 | 0.909 / 0.861 / 0.664 | 3.17e-03 |
| 0.800 | **1.0121** | 0.9966 | 0.9542 | 8.0e-05 | 2.8e-06 / 0 | 0.902 / 0.854 / 0.660 | 1.79e-03 |
| 0.810 | **0.9944** | 0.9796 | 0.9396 | 0 | 0 / 0 | — | 1.23e-03 |
| 0.820 | **0.9770** | 0.9628 | 0.9232 | 0 | 0 / 0 | 0.895 / 0.847 / 0.655 | 7.52e-04 |
| 0.830 | **0.9598** | 0.9463 | 0.9095 | 0 | 0 / 0 | — | 4.84e-04 |
| 0.840 | **0.9429** | 0.9299 | 0.8948 | 0 | 0 / 0 | 0.887 / 0.839 / 0.650 | 4.10e-04 |
| 0.845 | **0.9345** | 0.9216 | 0.8874 | 0 | 0 / 0 | — | 3.82e-04 |
| 0.850 | **0.9262** | 0.9134 | 0.8794 | 0 | 0 / 0 | 0.883 / 0.835 / 0.648 | 3.82e-04 |
| 0.855 | **0.9180** | 0.9058 | 0.8715 | 0 | 0 / 0 | — | 3.94e-04 |
| 0.860 | **0.9098** | 0.8980 | 0.8655 | 0 | 0 / 0 | 0.879 / 0.832 / 0.645 | 4.47e-04 |
| 0.865 | **0.9016** | 0.8901 | 0.8585 | 0 | 0 / 0 | — | 5.42e-04 |
| 0.870 | **0.8935** | 0.8822 | 0.8514 | 0 | 0 / 0 | 0.875 / 0.827 / 0.642 | 6.76e-04 |
| 0.875 | **0.8854** | 0.8744 | 0.8443 | 0 | 0 / 0 | — | 8.51e-04 |
| 0.880 | **0.8774** | 0.8666 | 0.8372 | 0 | 0 / 0 | 0.870 / 0.823 / 0.639 | 1.08e-03 |
| 0.886 | **0.8688** | 0.8584 | 0.8297 | 0 | 0 / 0 | 0.869 / 0.822 / 0.638 | 1.34e-03 |

- **(a) Averaged form (independent driver, worst fixed phase, the row's Gaussian law of q): stable at every
  amplitude.** The ratio is 0.869–0.934 at τ → 0 and falls to 0.82–0.88 at τ = 0.3 and 0.64–0.68 at τ = 1. The margin
  is 6.6–13 %; in the K5 game it was 3.0–4.3 %.
- **(b) Arbitrary sharing near the zero core: ε₁E_z[|z|/|g|] < 1 on every row with t ≥ 0.81.**
  - **P at s = 0:** the base is z·g(|z|²) with g real, the worst direction is an imaginary Q, and the second variation
    over the cost is exactly that integral. The closed form and the numerical eigenvalue agree to 4 digits on all
    18 rows.
  - It crosses 1 at t ≈ 0.807. On the binding band it is 0.960 (t = 0.83) to 0.902 (t = 0.865), 0.926 at the peak, and
    the pointwise ratio falls with s. So the 7.2.10 (arbitrary-sharing) form holds at every s and every amplitude there.
    In the K5 game the same number was 0.992–1.037 on the binding band.
  - On t ≤ 0.80 it fails near the zero core: 1.012 (t = 0.80) up to 1.206 (t = 0.70), for s up to 0.05 (t = 0.80) to 0.35 (t = 0.70). The
    arbitrary-sharing allowance is 2.8·10⁻⁶ to 3.1·10⁻³ with the Gaussian law of |q|, and 0 to 4.5·10⁻⁵ through the
    moment LP (whose optimum does not move). That is at most a third of the stage-2 room (t = 0.70).
  - At t = 0.80, odd excess against deficit on the one-spike family (`odd_vs_deficit.py`): the Gaussian core nets
    +2.8·10⁻⁶; every spiky core (c ≥ 0.3) nets −6·10⁻⁴ to −2.7·10⁻².
- **So on t ∈ [0.70, 0.886] the odd sector needs no sharing lemma**: the pointwise statement on t ≥ 0.81, the
  Gaussian-core allowance on t ≤ 0.80. In the K5 game this was the critical item (it could not close below t ≈ 0.76).
  Small t is another matter (§5(c)).

---------------------------------------------------------------------------------------------------------------------

## 4. The A/B shells, the quintic sectors and the odd sector (item 3)

Worst pointwise second variation over cost under arbitrary sharing (`gate/code/hab.py`, `gate/code/abfin.py`). The
finite-amplitude column is the worst ratio over directions and amplitudes τ ≤ 1 at s = 0. The last column is the
design note's elementary block majorant |a + g| ≤ |a| + Re(ḡ·ph a) + |g|²/(2|a|) (no phase averaging), maximised over
s ∈ [0, 1.2] (`capgate/crude_h.py`).

| t | A/B pair: s = 0 / 0.2 / 0.5 | A/B, finite amplitude | quintic first-order sectors, s = 0 | quintic, elementary majorant |
|---|---|---|---|---|
| 0.700 | 1.001 / 0.923 / 0.822 | — | 0.168 | 0.241 |
| 0.740 | 0.939 / 0.869 / 0.766 | — | 0.157 | 0.229 |
| 0.760 | 0.909 / 0.850 / 0.740 | — | 0.153 | 0.221 |
| 0.780 | 0.881 / 0.824 / 0.715 | 0.882 | 0.148 | 0.211 |
| 0.800 | 0.853 / 0.796 / 0.691 | — | 0.143 | 0.205 |
| 0.820 | 0.826 / 0.769 / 0.668 | 0.828 | 0.139 | 0.197 |
| 0.840 | 0.800 / 0.753 / 0.646 | 0.801 | 0.134 | 0.192 |
| 0.850 | 0.787 / 0.736 / 0.636 | — | 0.132 | 0.188 |
| 0.860 | 0.774 / 0.729 / 0.626 | — | 0.130 | 0.185 |
| 0.880 | 0.749 / 0.708 / 0.606 | 0.751 | 0.126 | 0.178 |
| 0.886 | 0.743 / 0.702 / 0.601 | — | 0.125 | 0.177 |

- **A/B (the analogue of the cubic's (P)) is pure cost on t ≥ 0.74.** The margins are 15 % (t = 0.80) to 26 %
  (t = 0.886), 21 % at the peak, 12 % at 0.78 and 6 % at 0.74; in the K5 game they were 11–16 %. The finite-amplitude
  ratio equals the infinitesimal one to 0.3 %. At t = 0.70 the zero core fails by 0.1 %, and only for s ≲ 0.03
  (0.981 at s = 0.1).
- **The quintic first-order sectors are pure cost by the elementary majorant**: ≤ 0.241 of the cost on every row (in
  the K5 game the same majorant gave 1.36–1.53 and failed). So they need only an enclosure of that 5×5 integral, no
  phase averaging and no content statement of their own.
- **The odd sector sharing the spike coordinate** (Q = iλe₁₁(y), `content_scan.py`): curvature over cost ≤ 0.978
  (t = 0.80), 0.952 (0.82), 0.914 (peak), 0.875 (0.88). It exceeds 1 only for t ≤ 0.78 (1.003 at 0.78, 1.107 at 0.70),
  where §3(b) already prices the zero core.

---------------------------------------------------------------------------------------------------------------------

## 5. Decision table (item 4)

**What η₅ must cover.** Stage 2 reduces K_G^ℂ > 1.402 to K₅(η₅(r)) with η₅(r) ≤ room(r) at each of its 32 rows. The
room already contains the law layer, the rows, the caps and the t-cover. η₅ is what the sector layer (R4 of the design
note) costs under provable lemma forms:
- (S) in the same-law form with per-group constants (§2);
- the spike layer;
- the z·Q odd sector: arbitrary-sharing form, plus the Gaussian-core allowance where the zero-core ratio exceeds 1;
  the bracket is the moment-LP version;
- A/B and the quintic sectors, pure cost.

The last column is the cruder route for (S): the family's own contents at each m against the moment LP's deficit,
with no same-law coupling.

**(a) Binding band and flank.**

| t | stage-2 room | (S): Σκ* (exact) | spikes | odd z·Q (zero-core ratio) | A/B / quintic | **η₅ needed** | cruder (S) |
|---|---|---|---|---|---|---|---|
| 0.820 | 7.52e-4 | 0.41 | 0 | 0 (0.977) | 0 / 0 | **0** | 4.5e-3: fails |
| 0.830 | 4.84e-4 | 0.40 | 0 | 0 (0.960) | 0 / 0 | **0** | — |
| 0.840 | 4.10e-4 | 0.39 | 0 | 0 (0.943) | 0 / 0 | **0** | 3.7e-4: 90 % of the room |
| 0.845 | 3.82e-4 | 0.38–0.39 (interpolated) | 0 | 0 (0.935) | 0 / 0 | **0** | — |
| 0.850 | 3.82e-4 | 0.38 | 0 | 0 (0.926) | 0 / 0 | **0** | 4.7e-6 |
| 0.855 | 3.94e-4 | 0.36–0.38 (interpolated) | 0 | 0 (0.918) | 0 / 0 | **0** | — |
| 0.860 | 4.47e-4 | 0.36 | 0 | 0 (0.910) | 0 / 0 | **0** | 1.3e-6 |
| 0.865 | 5.42e-4 | 0.33–0.36 (interpolated) | 0 | 0 (0.902) | 0 / 0 | **0** | — |
| 0.870 | 6.76e-4 | 0.33 | 0 | 0 (0.894) | 0 / 0 | **0** | — |
| 0.875 | 8.51e-4 | 0.30–0.33 (interpolated) | 0 | 0 (0.885) | 0 / 0 | **0** | — |
| 0.880 | 1.08e-3 | 0.30 | 0 | 0 (0.877) | 0 / 0 | **0** | 1.0e-6 |
| 0.886 | 1.34e-3 | 0.32 | 0 | 0 (0.869) | 0 / 0 | **0** | 1.0e-6 |

**(b) Mid rows.**

| t | stage-2 room | (S): Σκ* (exact) | spikes | odd z·Q: Gaussian core [moment LP] | A/B / quintic | **η₅ needed** |
|---|---|---|---|---|---|---|
| 0.810 | 1.23e-3 | ≈ 0.40 | 0 | 0 (ratio 0.994) | 0 / 0 | **0** |
| 0.800 | 1.79e-3 | 0.40 | 0 | 2.8e-6 [0] | 0 / 0 | **2.8e-6** |
| 0.780 | 3.17e-3 | 0.40 | 0 | 1.1e-4 [0] | 0 / 0 | **1.1e-4** |
| 0.760 | 4.20e-3 | 0.40 | 0 | 4.5e-4 [0] | 0 / 0 | **4.5e-4** |
| 0.740 | 5.90e-3 | 0.41 | 0 | 1.1e-3 [0] | 0 (0.939) / 0 | **1.1e-3** |
| 0.700 | 9.61e-3 | 0.42 | 0 | 3.1e-3 [4.5e-5] | ≈ 0 (zero core 1.001, s ≲ 0.03) / 0 | **3.1e-3** |

**(c) Small t (stage 2's law-aware rows and t = 0): the sector tools do not apply.** These rows were never part of the
gate: the K5 design started at t = 0.70. Their (ℓ, β) are small, so the base L ≈ 0 and the visible shells lose their
margins. Numbers from `capgate/small_t_odd.py`, `hab_stage2.py`, `small_t_law2.py`; the odd allowance is the moment-LP
one without the radius input, and its percentage is of the stage-2 room.

| t | stage-2 room | A/B ratio (s = 0 / 0.4) | quintic first-order | odd: ε₁E_z[|z|/|g|], Emax(0) | odd allowance, moment LP |
|---|---|---|---|---|---|
| 0 | 5.75e-3 | 387 / 1.95 | 99 | 827, 0.61 | 1.7e-3 (30 %) |
| 0.1 | 2.19e-3 | 6.4 / 1.84 | 1.05 | 7.9, 0.47 | **2.3e-3 (103 %)** |
| 0.2 | 3.00e-3 | 2.5 / 1.60 | 0.41 | 3.1, 0.28 | **4.8e-3 (162 %)** |
| 0.3 | 1.00e-2 | 1.6 / 1.46 | 0.26 | 2.0, 0.15 | 7.7e-3 (77 %) |
| 0.4 | 1.55e-2 | 1.33 / 1.26 | 0.21 | 1.6, 0.089 | — |
| 0.5 | 2.01e-2 | 1.14 / 1.08 | 0.18 | 1.4, 0.050 | — |
| 0.6 | 1.13e-2 | 1.05 / 0.95 | 0.17 | 1.28, 0.029 | 2.6e-3 (23 %) |

**Verdict.**
- **GO for 1.402 on t ∈ [0.70, 0.886].**
  - On the binding band η₅ = 0 under the lemma forms above. The whole stage-2 room (3.82·10⁻⁴ at t = 0.845–0.85) is
    left for certification losses.
  - On the mid rows the only charge is the Gaussian-core odd allowance, at most 33 % of the room (t = 0.70).
- **The cruder route for (S)** (m-dependent contents against the moment LP, no same-law coupling) works only from the
  peak outward. It fails at t ≤ 0.84, where the moment LP's junta-like laws carry less deficit than the true junta.
- **Small t (t ≤ 0.6) is open.** There A/B is not pure cost, even at s = 0.4, for t ≤ 0.5. The quintic sectors fail at
  t ≤ 0.1, and the arbitrary-sharing odd allowance alone exceeds the room at t = 0.1–0.2. Stage 2 needs K₅ on these
  rows too, so they need an argument of their own (§6, item 10).
- **1.403 is excluded for this game:** its Gaussian-ideal peak row (0.7128653) is above 1/1.403.

---------------------------------------------------------------------------------------------------------------------

## 6. What must still be proved for the capped game (item 5)

**Frame.** Stage 2 is done (C, conditional): K₅(η₅(r)) with η₅(r) ≤ room(r) at its 32 rows gives K_G^ℂ > 1.402. K₅ is
the design note's R4, which splits into (S1)–(S5) (`DEGREE5_CERT_DESIGN.md` §1). For the capped game the plan is the
following list.
- "N" is what this gate measured.
- "Allowance" is the part of η₅ the statement needs; 0 means it closes with a margin, so only its certification losses
  count.

| # | statement | rows | form and tools | N | allowance |
|---|---|---|---|---|---|
| 1 | **(S1)–(S2)** pointwise expansion \|a + u\| ≤ \|a\| + Re(ū·ph a) + \|u\|²/(2\|a\|), and the averaging over w that splits the second variation into driver groups | all | P, standard (design note §1) | — | 0 |
| 2 | **(S3-AB) order-1 content lemma, same-law form:** the A/B (H₁,₀/H₀,₁) gain ≤ κ_AB·(D(q) + V_sl(u)) for every remote cubic q | 0.70–0.886 | P: Stroock + chain rule reduce it to ‖E[R′(q)∂q]‖²-type contents. Template: the cubic ledger's order-1 proof (11.49/11.50: profile kernels, moment caps, Stein duals). **New:** it must use the same law's deficit for spiky laws, because the moment LP alone fails at t ≤ 0.84 (§2(d)). Fallback for spikes: (SC) per coordinate (item 9). | κ*_AB = 0.10–0.34 (exact); chain ≤ 0.72 on t ≥ 0.80 | 0, if κ_AB + κ_h ≤ 1 |
| 3 | **(S3-h) orders 2 and 4:** the quintic shells' gain ≤ κ_h·(D + V_sl) | 0.70–0.886 | P: the two contraction inequalities of `SHARING_LEMMA.md` §3 (open), or any lossy bound with κ_h ≤ 0.5; with the capped price these shells are small | κ* ≤ 0.11 per group (exact), all non-A/B groups together ≤ 0.16; chain ≤ 0.18 | 0 |
| 4 | **(S4-odd) the zero-core scalar:** ε₁E_z[\|z\|/\|g(\|z\|²)\|] < 1, the pointwise ratio(s) ≤ ratio(0) for all s, and the finite-amplitude form | 0.81–0.886 | P at s = 0 (closed form, §3(b)). C per row: one Gaussian integral, plus the 4×4 pointwise eigenvalue on s-cells. Finite amplitude: the increment is concave in \|Q\|² (P) | 0.869–0.994; 0.960 at t = 0.83, 0.926 at the peak | 0 |
| 5 | **(S4-odd, low t) the Gaussian-core allowance:** Emax(s) (pointwise best odd excess) added to the law layer | 0.70–0.80 | C: Emax on s-cells, then stage 2's law layer with the extra term | ≤ 3.1·10⁻³ (Gaussian law), ≤ 4.5·10⁻⁵ (moment LP) | ≤ 33 % of the room |
| 6 | **(S4-AB) A/B pure cost** under arbitrary sharing at finite amplitude (the analogue of the cubic's (P)) | 0.74–0.886 | C per row: the 4×4 pointwise second variation on s-cells, plus the finite-amplitude remainder of `abfin.py` | ratio ≤ 0.939; margin 15–26 % on t ≥ 0.80 | 0 (t = 0.70: zero core 1.001 for s ≲ 0.03; negligible, < 10⁻⁶ by estimate) |
| 7 | **(S4-h) quintic first-order sectors pure cost** | 0.70–0.886 | C: the elementary 5×5 block majorant on s-cells. Its integrand has integrable 1/\|A\| singularities, so the enclosure needs care | ≤ 0.241 | 0 |
| 8 | **(S4) the second-order-only sectors** (H₂,₁/H₁,₂ independent, H₃,₀, H₃,₂, the companions) **and the cross-group couplings** | 0.70–0.886 | P + C. The design note's ratios (≤ 0.38 at p₂ = 3.549) rescale to ≤ 0.11. The couplings change the gain by ≤ 2 % (GATE §2) | the exact model is concave at every point except the zero-core ones of item 5 | 0 |
| 9 | **(S5) the spike layer** | binding band | Absorbed by items 2–3 (θ < 0). Fallback: the sign certificate (SC) of `spike-layer/SPIKE_CERT.md` §5.4 (Taylor for c ≤ 0.03, about 100–200 cells for c ∈ [0.03, 0.15], the crude bound beyond, the relative cluster bound; 30–60 CPU-hours), with (S3) only for the low-influence remainder | no channel (exact; `SPIKE_CERT.md` §5) | 0 |
| 10 | **K₅ at small t** (stage 2's 11 law-aware rows on [0.05, 0.6], and t = 0) | 0–0.6 | **Open, and new.** Items 4–7 fail there (§5(c)). At L ≈ 0 the visible coordinate is no longer special, so the visible shells are interchangeable with remote ones and the margins vanish by symmetry, not by accident. Candidate routes: (i) a symmetrisation argument comparing z₁·Q with a remote z₂·Q inside the q-only potential; (ii) a small-t crude row (stage 2 §2 misses 500/701 by only 5.2·10⁻⁵ at t = 0); (iii) small-t rows with larger ℓ, traded against the law layer | §5(c) | rooms 2.2·10⁻³–2.0·10⁻² |

**Budget on the binding band** (stage-2 room 3.82·10⁻⁴ at t = 0.845–0.85; 4.1–4.8·10⁻⁴ at 0.83–0.84; 3.9–5.4·10⁻⁴ at
0.855–0.865).
- Items 1–9 need nothing beyond their certification losses, so the room is the budget for those losses.
- A proof of (S) with a positive constant θ_cert, instead of κ ≤ 1, costs about 42·θ_cert·u*² (the junta at the optimal
  energy): 6·10⁻⁵ per 10⁻³ of θ at the peak.
- A workable split:
  - (S3) proof losses ≤ 2·10⁻⁴ (equivalently θ_cert ≤ +0.003);
  - the enclosures of items 4, 6, 7 ≤ 0.5·10⁻⁴;
  - the spike layer and clusters, if the fallback of item 9 is used: ≤ 0.5·10⁻⁴;
  - reserve ≈ 0.8·10⁻⁴.

**Order of work.**
1. Item 2, the order-1 content lemma in the same-law form. It is the only real lemma left on t ≥ 0.70; with the
   capped price items 3 and 8 come almost free.
2. Items 4, 6, 7: per-row C computations of the cubic kind, cheap.
3. Item 10, the small-t argument. It is a new research item and may need its own gate.
4. Item 9's fallback, only if item 2 cannot be proved for spiky laws.

---------------------------------------------------------------------------------------------------------------------

## 7. Files

Paths are relative to `degree5-cert/`.

**Code reused unchanged**, run with `D5_E1=0.78 D5_ETA=0.0779`:
- `gate/code/`: `spike2.py`, `run_sp2_line.py`, `analyze2.py`, `h11c.py`, `hab.py`, `abfin.py`, `lawlp_odd.py`,
  `odd_vs_deficit.py`;
- `share/code/`: `content_scan.py`, `lawdef.py`.

**New** (`capgate/`):
- `code_capped/d5eng.py`: `code/d5eng.py` with (ε₁, η) read from the environment (default: the K5 game);
- `rows5.lines`: the 18 capped rows;
- `run_by_k.py`: runs a gate script on row k of `rows5.lines`;
- `lp_rows.py`: the law-layer loss per row (§1);
- `analyze_cs_capped.py`: the decoupled chain with the capped margins (§2(b));
- `zero_core.py`: the zero-core odd ratio, closed form against the eigenvalue (§3);
- `crude_h.py`: the elementary quintic majorant (§4);
- `run_hab_local.py`: `hab.py` on a capped row (§4);
- `small_t_odd.py`, `small_t_law.py`, `small_t_law2.py`, `hab_stage2.py`: the stage-2 small-t rows (§5(c));
- `collect_capgate.py`: prints the tables of §§1–4.

**Outputs** (`capgate/out/`):
- `gate/out/`: `sp2_k.json` and `sp2big_k.json` (exact model), `h11c_k.json`, `hab_k.json`, `abfin_k.json`,
  `lawodd_k.json`, `lp_k.json`, `ovd_k.txt`;
- `share/out/`: `cs_k.json` and `csbig_k.json` (contents), `lawdef.json`;
- `zero_core.json`, `crude_h.json`, `small_t_odd.json`, `small_t_law_*.json`, `hab_stage2_*.json`,
  `stage2_rooms.json`.

Here k is the line of `rows5.lines`: k = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 is t = 0.70, 0.74,
0.76, 0.78, 0.80, 0.81, 0.82, 0.83, 0.84, 0.845, 0.85, 0.855, 0.86, 0.865, 0.87, 0.875, 0.88, 0.886.

**Compute.** On `big`, in `/root/claude-b9ee-capgate`, single-threaded. Up to 16 processes at first, then ≤ 8 (≤ 12
when the 5-minute load fell below 36) after the coordinator's request. About 14 CPU-hours in all, most of it the
exact-model scans (13 rows, up to an hour each). The folder has been deleted.

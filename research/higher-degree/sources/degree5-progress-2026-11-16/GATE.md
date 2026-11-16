<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/GATE.md, 16 November 2026; claude-b9ee research worker. -->
# Degree-5 certificate, milestone M1 part (b): the research gate

Research worker for claude-b9ee (issue #453), 16 November 2026. Companion to `DEGREE5_CERT_DESIGN.md` in this folder.
Everything is **N** (floating point; deterministic quadrature unless stated). Code: `gate/code/`; outputs: `gate/out/`;
corrected rows for part (a): `out/rows_fixed.json`.

Game (ε₁, η) = (0.84896, 0.28180) unless a line says "K5 row" (ε₁, η) = (0.848926, 0.281576). Costs p₁ = 1/ε₁ = 1.1779,
p₂ = 1/η = 3.5486.


## 0. Answer

**GO for 1.402. The kill criterion is not triggered.**
- On the binding band t ∈ [0.82, 0.886] every row needs η₅ ≤ 2.3·10⁻⁴ (≤ 5·10⁻⁴ with a cruder law layer), against
  a threshold of 6·10⁻⁴ and rooms of 8.4–8.6·10⁻⁴.
- H₁,₁ keeps its stability at every amplitude in the averaged (chaos-respecting) form, with a margin of 3.0–4.3 %
  growing with amplitude.
- **1.403: keep NO-GO.** Under optimistic lemma forms the binding rows need 1.7–2.3·10⁻⁴ against 2.9–3.0·10⁻⁴, so it is
  not excluded. But those forms already assume the odd sector at its Gaussian-core allowance (Stein cuts or the
  sharing lemma; with moments only t = 0.82 needs 5·10⁻⁴), and no slack remains for certification losses.

**The five items:**
1. **Rows.** `out/rows_fixed.json`: 14 rows, all re-evaluated with the two-branch supremum. t = 0.85–0.87 were
   re-optimised. The envelope is 0.7124295, at the peak t = 0.84; the re-optimised flank rows lie 4–14·10⁻⁶ below it,
   with their two branches balanced to 10⁻⁷.
2. **Content against deficit.**
   - On the one-spike family, with all couplings, no "content ≤ c·deficit" lemma closes without an allowance (Σκ* =
     1.2–3.2).
   - Per-group constants summing to 1 close it with allowances of ≤ 2.6·10⁻⁵ per row. The allocation is H22 0.4,
     A/B 0.2–0.3, H11 0.17, H31 0.1, H20/H02 0.05; H22 (z₁·:|z_j|⁴:) carries 40 %.
   - Many spikes dominate: 8.2·10⁻⁵ on the flank (spike-layer worker) and, **new, 7.1·10⁻⁵ at the peak (exact)**.
3. **H₁,₁ / z·Q.**
   - The literal 7.2.10 form (arbitrary sharing) **fails at degree 5** near the zero core for t ≤ 0.86. The worst
     ratio there is E_z[|z|/|g|]·ε₁ = 1.20 / 1.14 / 1.08 / 1.04 / 1.02 / 1.00 at t = 0.70 / 0.74 / 0.78 / 0.82 / 0.84 /
     0.86.
   - Moving the rows does not fix it: that costs 2–6·10⁻³.
   - Its Gaussian-core allowance exceeds the room below t ≈ 0.76.
   - It needs a sharing lemma, which is **Lemma CC of orders 2 and 4 again**. A/B (the analogue of the cubic's (P))
     and the quintic sectors are pure cost pointwise under arbitrary sharing, with 11–16 % and about 50 % margins.
4. **Direct quadrature at the peak.** The design note's §2.4 signal is real: one small spike in the exact Gaussian
   bulk wins +1.66·10⁻⁶ (r96; +1.62·10⁻⁶ at r48), and the coupled expansion predicted +1.63–1.65·10⁻⁶. **Exact K₅
   fails at the peak row too.** With 20–44 spikes the excess is +6.4–7.1·10⁻⁵ (exact).
5. **Decision:** GO for 1.402, with the order-2/4 content (sharing) lemma as the first research item: one statement
   for the quintic shells, the odd sector and (at order 1) the A/B shells. The spike layer must cover every binding
   row, not only the flank.

---------------------------------------------------------------------------------------------------------------------

## 1. Corrected rows (item 1): `out/rows_fixed.json`

Every row is the Gaussian ideal of the gate-free row with (ℓ, β, b_A, b_B) optimised (c₅ = 0), evaluated on the fine
grid with the **fixed two-branch supremum** (the larger of the plain branch σ = 0 and the driver branch σ ≥ 0.05). The
file records both branches, the row constant C (V ≤ t² − 2ℓt + C) and the rooms. t = 0.85–0.87 were re-optimised on
`big` (`code/rowsfix.py`, Nelder–Mead on the coarse grid, final value on the fine grid); t = 0.875–0.886 come from
`flankquick.py`; t ≤ 0.84 from the first optimisation (the driver branch dominates there, so the bug did not bite).

| t | ℓ | β | b_A | b_B | row | plain / driver branch (σ) | room to 500/701 | room to 1/1.403 |
|---|---|---|---|---|---|---|---|---|
| 0.700 | 0.6799 | 0.0903 | -0.1086 | -0.0644 | 0.7100051 | 0.6928074 / 0.7100051 (0.461) | 3.26e-03 | 2.75e-03 |
| 0.740 | 0.7269 | 0.1073 | -0.1218 | -0.0725 | 0.7113335 | 0.7026094 / 0.7113335 (0.414) | 1.93e-03 | 1.42e-03 |
| 0.780 | 0.7735 | 0.1263 | -0.1359 | -0.0814 | 0.7121097 | 0.7087618 / 0.7121097 (0.357) | 1.16e-03 | 6.49e-04 |
| 0.820 | 0.8186 | 0.1476 | -0.1509 | -0.0913 | 0.7124069 | 0.7117252 / 0.7124069 (0.285) | 8.60e-04 | 3.51e-04 |
| 0.830 | 0.8295 | 0.1533 | -0.1547 | -0.0939 | 0.7124254 | 0.7120623 / 0.7124254 (0.263) | 8.41e-04 | 3.33e-04 |
| 0.840 | 0.8401 | 0.1591 | -0.1586 | -0.0965 | 0.7124295 | 0.7122757 / 0.7124295 (0.240) | 8.37e-04 | 3.29e-04 |
| 0.850 | 0.8504 | 0.1651 | -0.1626 | -0.0993 | 0.7124243 | 0.7123885 / 0.7124243 (0.213) | 8.42e-04 | 3.34e-04 |
| 0.855 | 0.8554 | 0.1681 | -0.1646 | -0.1007 | 0.7124200 | 0.7124161 / 0.7124200 (0.198) | 8.47e-04 | 3.38e-04 |
| 0.860 | 0.8602 | 0.1713 | -0.1656 | -0.1011 | 0.7124165 | 0.7124165 / 0.7124164 (0.191) | 8.50e-04 | 3.42e-04 |
| 0.865 | 0.8650 | 0.1744 | -0.1665 | -0.1012 | 0.7124152 | 0.7124152 / 0.7124151 (0.187) | 8.52e-04 | 3.43e-04 |
| 0.870 | 0.8701 | 0.1778 | -0.1673 | -0.1013 | 0.7124160 | 0.7124160 / 0.7124158 (0.182) | 8.51e-04 | 3.42e-04 |
| 0.875 | 0.8744 | 0.1806 | -0.1677 | -0.1007 | 0.7124182 | 0.7124182 / 0.7124181 (0.175) | 8.49e-04 | 3.40e-04 |
| 0.880 | 0.8788 | 0.1835 | -0.1697 | -0.1010 | 0.7124221 | 0.7124221 / 0.7124220 (0.174) | 8.45e-04 | 3.36e-04 |
| 0.886 | 0.8856 | 0.1879 | -0.1691 | -0.1066 | 0.7124262 | 0.7124262 / 0.7124260 (0.177) | 8.41e-04 | 3.32e-04 |

- **The envelope is set by the peak row: max = 0.7124295 at t = 0.84**, i.e. N₅ to 10⁻⁷. Every flank row, now
  re-optimised, lies 4–14·10⁻⁶ below it, and on t ≥ 0.86 the optimiser balances the two branches to ≤ 1.1·10⁻⁷ (the
  87/13 two-branch optimum, seen from the row side).
- Rooms: 8.37·10⁻⁴ (t = 0.84) to 8.52·10⁻⁴ (t = 0.865) for 1.402; 3.29–3.43·10⁻⁴ for 1.403. The rows between 0.82 and
  0.886 are all within 2.6·10⁻⁵ of the minimum room: the whole band is binding.

---------------------------------------------------------------------------------------------------------------------

## 2. Content against deficit (item 2)

**Method** (`gate/code/spike2.py`, `analyze2.py`). The coupled second-order sector expansion of the design note, now
with all 15 non-residual sectors along their spike polynomials and **all couplings** (within and across groups), plus
ν₃ and a ν₅ shift. The family is one spike in the Gaussian bulk, q = σ(c·H₂,₁(y) + √(1 − c²)W), on a (c, σ) grid per
row. For each point: D = same-variance deficit B₅(σ²) − F₅(q); V_sl = S₅ − (B₅(σ²) − cost(σ)) ≥ 0 (the variance slack,
which the law layer already has); gain_g = the group's optimum of the quadratic model; excess = Σ gains − D − V_sl.
ν₅ is a scalar of the potential and is left out of the content accounting.

- **Convergence (peak, c = 0.1 / 0.15 / 0.2):** excess +6.06 / +18.51 / +16.32 ·10⁻⁷ on the base grids, +6.15 /
  +18.62 / +16.45 ·10⁻⁷ with every grid refined (s-grid ×2, z-grid ×2.7, y and W grids ×2): converged to 2·10⁻⁸.
- **Cross-group couplings** change the total gain by ≤ 2 % (c = 0.3 at the peak: coupled 1.016·10⁻⁴, sum of groups
  1.017·10⁻⁴, sum of single sectors 1.039·10⁻⁴).
- **Agreement with exact quadrature:** flank one-spike excess +1.78·10⁻⁵ (t = 0.86) and +1.46·10⁻⁵ (0.88) against the
  spike-layer worker's converged exact +1.95·10⁻⁵ and +1.50·10⁻⁵ (`spike-layer/SPIKE_LAYER.md` §2.1); peak, see §4.

**Lemma forms**, per row (one-spike family; groups as in the design note; 'κ*' is the no-allowance constant):

| row | true one-spike excess | κ*_g (no allowance): H22 / H11 / H31 / H10-01 / H20-02 | Σκ* | per-group lemma, Σκ_g = 1: η (uniform in σ) / η (σ-dependent) | allocation κ_g: H22 / H10-01 / H11 / H31 / H20-02 | non-concave points |
|---|---|---|---|---|---|---|
| 0.78 | -3.3e-06 | 0.52 / 0.16 / 0.16 / 0.30 / 0.05 | 1.18 | 5.6e-06 / 7.1e-07 | 0.39 / 0.30 / 0.16 / 0.10 / 0.05 | 12 |
| 0.82 | +2.1e-07 | 0.78 / 0.29 / 0.26 / 0.28 / 0.10 | 1.71 | 2.4e-05 / 3.9e-06 | 0.37 / 0.29 / 0.17 / 0.11 / 0.06 | 9 |
| 0.84 | +1.7e-06 | 0.93 / 0.38 / 0.33 / 0.27 / 0.13 | 2.03 | 2.5e-05 / 7.0e-06 | 0.41 / 0.27 / 0.17 / 0.10 / 0.05 | 11 |
| 0.86 (plain, σ ≤ 0.1) | +1.8e-05 | 1.54 / 0.66 / 0.56 / 0.20 / 0.24 | 3.21 | 2.6e-05 / 2.1e-05 | 0.43 / 0.21 / 0.19 / 0.11 / 0.06 | 0 |
| 0.88 (plain, σ ≤ 0.1) | +1.5e-05 | 1.52 / 0.66 / 0.55 / 0.20 / 0.24 | 3.17 | 2.5e-05 / 1.8e-05 | 0.43 / 0.21 / 0.19 / 0.11 / 0.06 | 0 |

Reading the table:
- **Without an additive allowance no lemma of the form "content ≤ c·deficit" closes**: Σκ* = 1.18 (t = 0.78) up to 3.2
  (flank). The maxima sit at small amplitudes, where both sides are tiny.
- **With the allowance it closes cheaply.** Per-group constants summing to 1, allocated as in the last-but-one column
  (H22 ≈ 0.4, A/B ≈ 0.2–0.3, H11 ≈ 0.17–0.19, H31 ≈ 0.1, H20/H02 ≈ 0.05), need an allowance of ≤ 2.6·10⁻⁵ uniform in σ,
  or ≤ 2.1·10⁻⁵ when it may depend on σ (the cover has σ-boxes). Splitting by group costs about 20 % over one combined
  inequality.
- The visible-z quintic shell H22 (p₁₀: z₁·:|z_j|⁴:) carries 40 % of every content budget, as in the spike channel.
- The 'non-concave' points are small-σ points of the peak and mid rows whose H₁,₁ block is unstable at second order.
  That is the zero-core z·Q instability of §3, met here by the spike's own (|y|² − 1) polynomial. They have a large
  variance slack (V_sl ≥ 4·10⁻⁴) and are dominated, but the quadratic model cannot score them; §3 bounds them.

**Many spikes.**
- **Flank:** the spike-layer worker's exact values (its §2.3–2.5; coordinator's summary): 8.21·10⁻⁵ at t = 0.87
  (12 spikes) and ≈ 9.2·10⁻⁵ at t = 0.86. Its realistic certified cap is 1.1–1.3·10⁻⁴; I use that cap as the flank's
  content-plus-spike allowance.
- **Peak, new:** the per-spike excess of one spike in the bulk (coupled expansion, σ re-optimised, `code/peak_curve.py`):

  | c | 0.06 | 0.08 | 0.10 | 0.12 | 0.15 | 0.18 | 0.22 | 0.26 |
  |---|---|---|---|---|---|---|---|---|
  | e(c) (10⁻⁷) | 0.82 | 2.71 | 6.06 | 10.8 | 18.4 | 21.2 | 0.06 | −75.8 |

  Spike gains are additive (spike-layer §2.3: interaction ≤ 3·10⁻⁶), so N = 1/c² spikes that take the whole bulk give
  **up to 8.2·10⁻⁵ (c = 0.15, 44 spikes)**. The exact many-spike runs of §4 confirm it: 7.1·10⁻⁵ at about 30 spikes.
  At t = 0.82 the same estimate gives 2.9·10⁻⁵ (c = 0.08); at t = 0.78 the per-spike excess is ≤ 0.
- **K5 tensor families:** at the peak and on t ≤ 0.84 the K5 attacks (d = 2–4) returned the Gaussian point. Their
  resolution (≈ 1–2·10⁻⁵ per configuration) cannot see a 10⁻⁶ per-spike effect. On the flank their optima are the spike
  configurations above, re-evaluated exactly by the spike-layer worker (d = 3 cross cluster 3.88·10⁻⁵).


---------------------------------------------------------------------------------------------------------------------

## 4. Direct quadrature of one small spike in the bulk at the peak (item 4)

**Method.** The spike-layer worker's exact Fourier evaluator `FFTEv` (`spike-layer/fftev.py`, copied unchanged to
`gate/code/`). The bulk W is integrated **exactly**, through the Gaussian characteristic function, and the spike
coordinate and |z₁| by quadrature. My driver `gate/code/peak_fft.py` fixes the spike amplitude c and optimises the 15
same-coordinate companions, ν₃, ν₅ and the bulk (σ, m_A, m_B) by L-BFGS. The benchmark S optimises ν₃, ν₅ and the bulk
with no spike. The K5 peak row (K5 game constants) is used; it is the same row to 4 digits.

(An earlier attempt with the one-coordinate evaluator `k1.py` and a polar W-grid had a W-quadrature error of 1.2·10⁻⁴ in
S itself, far above the signal, and was stopped.)

**Results** (`gate/out/pf*.json`; K5 peak row; benchmark S = 1.35873115 at r96, 1.35873119 at r48; accurate S₅ =
1.35873125):

| configuration | grid (r-nodes; FFT n, h) | excess over S | iterations, ‖g‖ | coupled expansion (§2) |
|---|---|---|---|---|
| 1 spike, c = 0.048 (relative 0.204) | r48; 512, 0.008 | **+1.62·10⁻⁶** | 30, 1·10⁻⁴ | +1.63·10⁻⁶ (base grids), +1.65·10⁻⁶ (fine) |
| 1 spike, c = 0.048 | r96; 512, 0.008 | **+1.66·10⁻⁶** | 44, 2·10⁻⁶ | |
| 10 spikes, c = 0.048 each (spike share 0.75 of the cubic energy, σ = 0.134, ν₅ = 0.0447) | r96; 512, 0.008 | **+3.43·10⁻⁵** | 45, 3·10⁻⁵ | additive estimate 10 × 1.6·10⁻⁶ = 1.6·10⁻⁵ |
| 4 spikes, c = 0.060 each (relative 0.25 each) | r96; 512, 0.008 | −1.07·10⁻⁵ | 33, 1·10⁻⁴ | (per-spike excess < 0 above c ≈ 0.22) |
| 20 spikes, c = 0.040 each (share 0.89) | r96; 512, 0.008 | **+6.39·10⁻⁵** | 61, 7·10⁻⁵ | |
| 30 spikes, c = 0.035 each (share 0.93) | r96; 512, 0.008 | **+7.06·10⁻⁵** | 66, 9·10⁻⁵ | |
| 44 spikes, c = 0.030 each (share 0.93) | r96; 512, 0.008 | **+6.54·10⁻⁵** | 78, 2·10⁻⁵ | additive estimate up to 8.2·10⁻⁵ (§2) |

- **The §2.4 signal of the design note is real.** One small spike in the Gaussian bulk beats the Gaussian at the peak by
  +1.66·10⁻⁶. The exact-bulk quadrature and the coupled second-order expansion agree to 2 %, so the expansion is
  validated at the 10⁻⁷ level. **Exact K₅ fails at the peak row, not only on the flank.**
- **The collective peak channel matches the flank's.** It reaches **+7.1·10⁻⁵ at about 30 spikes of c ≈ 0.035**,
  which carry 93 % of the cubic energy (bulk σ ≈ 0.07, ν₅ ≈ 0.044). The flank plateau is 8.2·10⁻⁵ at t = 0.87
  (spike-layer worker). Two remarks:
  - The runs stop at ‖g‖ ≤ 9·10⁻⁵, so the supremum is probably a little higher (≈ 7.5–8·10⁻⁵).
  - Ten spikes already give twice the naive additive estimate, because the bulk and ν₅ re-optimise.
- The best spikes carry the same companions as on the flank (z₁:|z_j|⁴:, (|z₁|² − 1)z_j, H₂,₁(z₁)(|z_j|² − 1), …) at
  |d|/c ≈ 0.05.


---------------------------------------------------------------------------------------------------------------------

## 3. H₁,₁ at finite amplitude: the 7.2.10 analogue with p₁ = 1.178 (item 3)

Sector: the k-side odd shell z·Q (Q ∈ H₁,₁, remote charge 0), with z̄·P (P ∈ H₂,₀) and the constant ν₃·H₂₁ alongside.
It has no first-order term at any core (parity rule), so the question is pure cost. Codes `gate/code/h11c.py`,
`h11b.py`, `hab.py`, `lawlp_odd.py`; outputs `gate/out/h11c_*.json`, `hab_*.json`, `lawodd_*.json`.

**(a) Averaged form (independent second-chaos driver, worst fixed phase, the row's Gaussian law of q): stable at every
amplitude.** Ratio = (E_q E_ξ increment)/(p₁‖O‖²) along the worst infinitesimal direction, at amplitude τ
(Q = τξ·d, ξ ~ N(0, 1/2)):

| t | τ → 0 | τ = 0.03 | τ = 0.1 | τ = 0.3 | τ = 1 |
|---|---|---|---|---|---|
| 0.70 | 0.957 | 0.958 | 0.953 | 0.910 | 0.708 |
| 0.74 | 0.957 | 0.958 | 0.953 | 0.909 | 0.707 |
| 0.78 | 0.959 | 0.960 | 0.955 | 0.910 | 0.706 |
| 0.82 | 0.965 | 0.965 | 0.959 | 0.913 | 0.707 |
| 0.84 | 0.969 | 0.969 | 0.963 | 0.916 | 0.708 |
| 0.86 | 0.970 | 0.970 | 0.964 | 0.916 | 0.707 |
| 0.88 | 0.967 | 0.966 | 0.960 | 0.913 | 0.705 |

The ratio never rises above its infinitesimal value: **stability survives beyond second order, with margin 3.0–4.3 %
at small amplitude, 8.4–9.0 % at τ = 0.3 and about 29 % at τ = 1.** (This direction alone carries the whole infinitesimal
H₁,₁ group ratio of the design note, 0.96–0.97; the h-side partner p₂₁ adds nothing at second order.)

**(b) Pointwise form (arbitrary sharing between Q and the core q: the literal 7.2.10 statement): fails near the zero
core on the mid and peak rows.** Worst-phase pointwise second variation over cost, as a function of s = |q(w)|:

| t | s = 0 | s = 0.1 | s = 0.2 | s = 0.4 | ratio < 1 for | Emax(0): best pointwise excess | arbitrary-sharing allowance: Gaussian law / moment LP |
|---|---|---|---|---|---|---|---|
| 0.70 | **1.204** | 1.189 | 1.143 | 0.982 | s ≥ 0.40 | 1.8e-02 | 4.0e-03 / — |
| 0.74 | **1.139** | 1.126 | 1.088 | 0.947 | s ≥ 0.35 | 9.4e-03 | 2.0e-03 / — |
| 0.78 | **1.083** | 1.072 | 1.039 | 0.921 | s ≥ 0.30 | 3.7·10⁻³ (at τ ≈ 0.28) | 7.0·10⁻⁴ / **1.79·10⁻³** |
| 0.82 | **1.037** | 1.027 | 1.000 | 0.893 | s ≥ 0.25 | 7.8·10⁻⁴ (τ ≈ 0.19) | 1.2·10⁻⁴ / 3.9·10⁻⁴ |
| 0.84 | **1.018** | 1.009 | 0.983 | 0.884 | s ≥ 0.15 | 1.8·10⁻⁴ (τ ≈ 0.13) | 2.1·10⁻⁵ / 9.1·10⁻⁵ |
| 0.86 | 1.002 | 0.994 | 0.967 | 0.873 | s ≥ 0.05 | 2·10⁻⁶ | 4·10⁻⁸ / 1·10⁻⁶ |
| 0.88 | 0.992 | 0.983 | 0.957 | 0.864 | all s | 0 | 0 / 0 |

- At s = 0 the base is z·g(|z|²) and the worst direction is an imaginary Q: curvature E_z[|z|/|g|] against p₁. The
  cubic witness has p = 1.322 there; the degree-5 rows have only 1.178.
- The allowance column adds Emax(s) to the fibre potential and redoes the law layer: "Gaussian law" weights it by
  the row's Gaussian |q|, "moment LP" lets the law move mass to small s (moments only, no Stein cuts).
- The excess needs a near-constant-modulus imaginary Q(w) ≈ ±iτ* placed exactly where |q(w)| is small. A genuine
  Q ∈ H₁,₁ is a quadratic form: its modulus cannot be concentrated, and with an independent driver the margin is
  3–4 % (part (a)). So the failure is of the arbitrary-sharing proof form, not of stability.

**(c) Comparison: the other sectors are pointwise stable.** Worst pointwise second variation over cost at s = 0
(it decreases with s): k-side A/B pair 0.829–0.892; the five h-side first-order quintic sectors together 0.471–0.504.
The crude elementary majorant of the design note (1.6–1.9 for r_A, 1.36–1.53 for the h-block) is far from these exact
values: the A/B and quintic directions are nearly aligned with the base phase. **So z·Q is the only sector whose
arbitrary-sharing (7.2.10-type) form fails, and only near the zero core at t ≤ 0.84.**

**(d) The A/B shells at finite amplitude (the analogue of the cubic's open (P)).** The pointwise remainder
R(s, u) = Σ_± E_z[|A_± ± u| − |A_±| − Re(conj(±u)·ph A_±)], u = r_A·A + r_B·B, with arbitrary complex r_A, r_B at each w
(arbitrary sharing), against p₁|u|²: the worst ratio over directions and amplitudes τ ≤ 1 equals its infinitesimal value
to 1.5 % (`gate/code/abfin.py`):

| s | 0 | 0.1 | 0.2 | 0.3 | 0.5 | 0.8 |
|---|---|---|---|---|---|---|
| t = 0.78 | 0.893 | 0.883 | 0.858 | 0.828 | 0.793 | 0.718 |
| t = 0.84 | 0.843 | 0.833 | 0.812 | 0.784 | 0.745 | 0.688 |

So the degree-5 version of (P) holds numerically under arbitrary sharing with a margin of 11 % (t = 0.78) to 16 % (peak)
per unit shell energy, at every amplitude tested. The cubic (P) asks for a margin of 0.24 out of p = 1.322 (18 %) plus
7.5·10⁻⁵, which is what makes it hard; here the content side (§2) needs about κ_AB ≈ 0.2–0.27 of the deficit, not a
fixed cost reservation.

**Verdict for item 3.** Stability survives beyond second order in every form that respects the chaos structure
(averaged: 3–4 % margin, growing with amplitude) and, for A/B and the quintic sectors, even under arbitrary sharing.
The only failure is the arbitrary-sharing form of the z·Q odd sector near the zero core, governed by the single scalar
**E_z[|z|/|g(|z|²)|] against 1/ε₁** (g = the radial profile of L + ν₅e₃₂): 1.083, 1.037, 1.018, 1.002, 0.992 times
1/ε₁ at t = 0.78, 0.82, 0.84, 0.86, 0.88 (P at s = 0: the worst direction is an imaginary Q and the second variation is
exactly that integral; it matches the numerical pointwise value to 4 digits).

**(e) Can the rows be moved to restore the zero-core odd margin? No.** Minimising the row value under the constraint
E_z[|z|/|g|]·ε₁ ≤ 0.98 (penalty method, `code/rescue2.py`) costs **+5.9·10⁻³ at t = 0.78** (row 0.71800, ratio reached
only 0.996) and **+2.2·10⁻³ at t = 0.82** (row 0.71462, ratio 0.990), against rooms of 1.16·10⁻³ and 8.6·10⁻⁴. Lowering β
alone makes it worse (t = 0.78, β − 0.01: ratio 1.089, row +2.5·10⁻⁴). The zero-core odd curvature is a property of the
degree-5 rows, not of a bad row choice.

**(f) Does the deficit pay for the odd excess? Only for spiky cores.** The odd pointwise excess E[Emax(|q|)] against the
q-only deficit D and the variance slack V_sl, on the one-spike family (`code/odd_vs_deficit.py`):

| t | Gaussian core (c = 0) at σ*: excess / D | spiky cores (c ≥ 0.6), every σ: net = excess − D − V_sl |
|---|---|---|
| 0.78 | 7.0·10⁻⁴ / 0 → **net +7.0·10⁻⁴** | −2.0·10⁻³ to −3.1·10⁻² |
| 0.82 | 1.2·10⁻⁴ / 0 → **net +1.2·10⁻⁴** | −9.8·10⁻⁴ to −1.8·10⁻² |

So the arbitrary-sharing odd excess is a real loss exactly where the core is Gaussian. There a genuine Q ∈ H₁,₁ has no
way to concentrate on {|q| small} (the averaged margin of (a) applies), so the loss is an artefact of the
arbitrary-sharing form. Closing it needs a sharing lemma of content type for the odd sector, of the same kind as §2:
"E_w[|Q|²·(K(|q|) − K̄)] ≤ content of K(|q|) in the chaos of |Q|²". If it is not proved, the mid rows carry the
Gaussian-core allowance: 7.0·10⁻⁴ (t = 0.78), 1.2·10⁻⁴ (0.82), 2.1·10⁻⁵ (0.84).

**(g) Low t, and what the needed lemma is.**
- **The allowance blows past the room at low t.** The arbitrary-sharing Gaussian-core allowance grows quickly as t
  decreases: 4.0·10⁻³ at t = 0.70 against a room of 3.26·10⁻³; 2.0·10⁻³ at 0.74 against 1.93·10⁻³; 7.0·10⁻⁴ at 0.78
  against 1.16·10⁻³. **Below t ≈ 0.76 the arbitrary-sharing odd form cannot close the row at all**, whatever the law
  layer does.
- **The instability itself is real but harmless.** At the zero core it is genuine: with q ≡ 0, an imaginary-valued
  Q ∈ H₁,₁ of small norm raises Λ₅ by (E_z[|z|/|g|] − p₁)‖Q‖² > 0 (P: the increment is concave in |Q|², with slope
  E_z[|z|/|g|] at 0). It never threatens the bound, because that configuration lives on the plain branch:
  - the plain branch lies 1.7·10⁻² below S₅ at t = 0.70 and 1.5·10⁻⁴ at t = 0.84;
  - a Gaussian-distributed Q gains only about a third of Emax(0).
- **What the certificate needs is the sharing lemma.**
  - For q ∈ H₂,₁ and Q ∈ H₁,₁ on one Gaussian space,
    E[|Q|²·(K(|q|) − EK)] ≤ ‖Π_{(1,1)⊕(2,2)}K(|q|)‖·‖|Q|² − E|Q|²‖.
  - That is the order-2 and order-4 content of the radial curvature profile K, i.e. **Lemma CC of orders 2 and 4 once
    more**, the same inequality the quintic shells need (§2).
  - It vanishes for a diffuse core (margin 3–4.3 %, part (a)). For spiky cores the deficit pays, as in (f).

---------------------------------------------------------------------------------------------------------------------

## 5. Decision (item 5)

**Kill criterion** (§7 of the design): any binding row needing η₅ > 6·10⁻⁴ under candidate provable lemma forms, or
H₁,₁ losing stability at finite amplitude.

**η₅ needed per row for 1.402** (N). The lemma forms:
- content–deficit with per-group constants (§2, σ-dependent allowance);
- the spike allowance: on the flank the spike-layer worker's realistic cap; at the peak and t = 0.82 the exact
  many-spike excess of §4 or the additive estimate of §2;
- the z·Q odd sector in arbitrary-sharing form with the Gaussian-core allowance (§3(f)); in brackets, the moment-LP
  version without Stein cuts;
- A/B and quintic pure cost (pointwise margins of 11–16 % and about 50 %, no allowance);
- the moment law layer;
- 4·10⁻⁵ for rows, t-cover, caps and chords.

| t | room | content–deficit | many spikes | odd z·Q | law | rows + caps | **η₅ needed** | verdict |
|---|---|---|---|---|---|---|---|---|
| 0.82 | 8.60·10⁻⁴ | 3.9·10⁻⁶ | ≈ 3·10⁻⁵ | 1.2·10⁻⁴ [3.9·10⁻⁴] | 3.3·10⁻⁵ | 4·10⁻⁵ | **2.3·10⁻⁴ [5.0·10⁻⁴]** | passes |
| 0.84 | 8.37·10⁻⁴ | 7.0·10⁻⁶ | 7.1·10⁻⁵ exact (≈ 30 spikes) → cap ≈ 1.2·10⁻⁴ | 2.1·10⁻⁵ [9.1·10⁻⁵] | 1.5·10⁻⁵ | 4·10⁻⁵ | **2.0·10⁻⁴ [2.7·10⁻⁴]** | passes |
| 0.86 | 8.50·10⁻⁴ | included in the spike cap | 1.1–1.3·10⁻⁴ (cap) | 4·10⁻⁸ | 5·10⁻⁶ | 4·10⁻⁵ | **1.8·10⁻⁴** | passes |
| 0.88 | 8.45·10⁻⁴ | included in the spike cap | 1.1–1.3·10⁻⁴ (cap) | 0 | 1·10⁻⁶ | 4·10⁻⁵ | **1.7·10⁻⁴** | passes |
| 0.78 (not binding) | 1.16·10⁻³ | 7·10⁻⁷ | ≤ 0 | 7.0·10⁻⁴ [1.79·10⁻³] | 7.5·10⁻⁵ | 4·10⁻⁵ | **8.2·10⁻⁴ [1.9·10⁻³]** | passes only with the Gaussian-core allowance |
| 0.74 (not binding) | 1.93·10⁻³ | — | — | 2.0·10⁻³ | 6.6·10⁻⁵ | 4·10⁻⁵ | **≥ 2.1·10⁻³** | **fails** in arbitrary-sharing form |
| 0.70 (not binding) | 3.26·10⁻³ | — | — | 4.0·10⁻³ | 3.0·10⁻³ | 4·10⁻⁵ | **≥ 7·10⁻³** | **fails** in arbitrary-sharing form |

**Verdict: GO for 1.402.** The kill criterion is not triggered.
- On the binding band t ∈ [0.82, 0.886] every row needs at most 2.3·10⁻⁴ (5.0·10⁻⁴ with the cruder law layer), below
  6·10⁻⁴.
- H₁,₁ keeps its averaged stability at every amplitude, with a margin of 3.0–4.3 % growing to 29 % at large amplitude.

**Three findings change the plan.**
1. **The z·Q odd sector is the new critical item.**
   - The cubic proof form (7.2.10, arbitrary sharing) fails at degree 5 near the zero core for t ≤ 0.86.
   - The rows cannot be moved to fix it: that costs 2–6·10⁻³.
   - Below t ≈ 0.76 the arbitrary-sharing allowance exceeds the room.
   - What closes it is the sharing lemma, which is Lemma CC of orders 2 and 4 for radial functions of the cubic: the
     same inequality the quintic shells need (§2, §3(g)). So the h-side content lemma moves onto the critical path of
     every row, low t included.
2. **The spike channel is not confined to the flank.**
   - At the peak, one small spike in the bulk wins +1.66·10⁻⁶ (exact) and about 30 spikes +7.1·10⁻⁵ (exact), as
     much as the flank plateau (8.2·10⁻⁵).
   - Every binding row therefore needs a spike allowance of order 10⁻⁴, and the spike layer's telescoping certificate
     must cover the peak rows too, not only t ∈ [0.86, 0.886].
3. **The rest is in good shape.**
   - The k-side A/B shells (the analogue of the cubic's open (P)) are pure cost pointwise, under arbitrary sharing and
     at finite amplitude, with an 11–16 % margin.
   - The quintic sectors have about a 50 % margin.
   - The content–deficit lemma closes with allowances of 2·10⁻⁵ per row on the one-spike family, once per-group
     constants (summing to 1) are allowed.

**1.403.** Not excluded by these numbers, but not reachable without near-sharp versions of everything.
- The binding rows need η₅ ≤ 2.9–3.0·10⁻⁴.
- The optimistic forms give about 1.8·10⁻⁴ at the flank and about 2.0·10⁻⁴ at the peak, plus 2.3·10⁻⁴ at t = 0.82.
- They require the sharing lemma, Stein cuts at the binding rows, the spike layer at ≤ 1.3·10⁻⁴ on every binding row, and
  σ-dependent per-group content constants.
- **Keep NO-GO** for planning; revisit when the sharing lemma exists.

**First research item after this gate:** Lemma CC of orders 2 and 4 for bounded radial functions of a cubic chaos, in
the content-against-deficit form. One statement serves three places: the quintic shells H22/H11/H31/H20/H02, the A/B
first-order content (order 1), and the odd-sector sharing term.

---------------------------------------------------------------------------------------------------------------------

## 6. Files

Paths are relative to `degree5-cert/`.

**Code** (`gate/code/`):
- `rowsfix.py`, `assemble_rows.py`: rows;
- `spike2.py`, `run_sp2_line.py`, `analyze2.py`, `conv_spike2.py`, `peak_curve.py`: item 2;
- `h11c.py`, `h11b.py`, `hab.py`, `abfin.py`, `lawlp_odd.py`, `odd_vs_deficit.py`, `rescue.py`, `rescue2.py`: item 3;
- `peak_fft.py` (driver) with the spike-layer worker's `fftev.py`, `spk.py`, `k1.py` (copied unchanged), and the
  superseded `gate4.py` / `gate4b.py`: item 4.

**Outputs** (`gate/out/`): `sp2_*.json`, `h11c_*.json`, `hab_*.json`, `lawodd_*.json`, `curve_*.json`,
`conv_spike2.log`, and `big/` (everything computed on `big`: rf_*, sp2_078/082, pf*, rescue*).
The rows for part (a) are `out/rows_fixed.json`.

`/root/claude-b9ee-d5gate` on `big` has been deleted.

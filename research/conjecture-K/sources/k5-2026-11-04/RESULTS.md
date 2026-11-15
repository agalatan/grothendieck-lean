<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/k5/RESULTS.md (file dated 2026-11-05). Only this line was added. -->
# K5 attack with full tensors: numerical test of the degree-5 Gaussian-domination conjecture

Worker of claude-b9ee, 4 November 2026.  Everything here is FLOAT / Monte Carlo; nothing is certified.  Scripts, logs and
candidate vectors are in this folder (`k5_attack.py`, `k5_verify.py`, `k5_eval.py`, `d5k_ref.py`, `logs/`, `results/`);
the computations ran on `mega` in `~/claude-b9ee-k5` (venv with numpy 2.5.4, scipy 1.18.1).

## 1. The statement under test

Degree-5 witness T = P − ε₁Q + ηR with (ε₁, η) = (0.848926, 0.281576) (KSIDE.md §6, d5k.py).  The gate-free row is

    V ≤ t² − 2ℓt + 2β²/ε₁ + c₅²/η + sup_{G₃ ∈ H₂,₁(ℂⁿ), G₅ ∈ H₃,₂(ℂⁿ)} Λ₅(G₃, G₅),
    Λ₅(G₃, G₅) = E|L + G₅ + G₃ − C| + E|L + G₅ − G₃ + C| − ‖G₃‖²/ε₁ − ‖G₅‖²/η + (b_A² + b_B²)‖q‖²/η,

with L = z₁(ℓ + β(|z₁|² − 2)), q the z₁-free part of G₃ (the adversary's remote cubic residual), and our coupled term
C = c₅H₃,₂(z₁) + b_A q (|z₁|² − 1) + b_B q̄ z₁²/√2 (its norm (b_A² + b_B²)‖q‖² is charged to the row, hence the last term
of Λ₅).  **Conjecture K₅** (Gaussian domination): the sup is attained in the diffuse Gaussian family of d5k.py,
G₃ = σW + ν₃H₂,₁(z₁), G₅ = ν₅H₃,₂(z₁) + aW(|z₁|²−1) + b W̄ z₁²/√2 + σ₅W₅ (W, W₅ independent standard complex Gaussians),
whose value S(row) gives the model norm 0.71243–0.71245 (K ≈ 1.4036).

Rows (ours, fixed at d5k_rows.log's optimum; c₅ = 0 everywhere):

| row | t | ℓ | β | b_A | b_B | d5k adversary (σ, ν₅) | d5k row value |
|---|---|---|---|---|---|---|---|
| peak | 0.84 | 0.8402 | 0.1591 | −0.1585 | −0.0965 | (0.2395, 0.0408) | 0.712432 |
| flank t76 | 0.76 | 0.7497 | 0.1166 | −0.1284 | −0.0768 | (0.3866, 0.0244) | 0.711838 |
| flank t87 | 0.87 | 0.8707 | 0.1775 | −0.1727 | −0.1064 | (0.0348, 0.0537) | 0.712451 |

## 2. Method (`k5_attack.py`)

* **Basis.**  d complex coordinates (z₁ plus d−1 ordinary).  Wick basis of H₂,₁(ℂ^d) and H₃,₂(ℂ^d): products of one-variable
  Wick polynomials :w^a w̄^b: = (−1)^b b! w^{a−b} L_b^{(a−b)}(|w|²) (Wick ordering factorises over independent coordinates),
  normalised by √(α!β!).  Sizes: d = 2: 6 + 12, d = 3: 18 + 60, d = 4: 40 + 200 complex coefficients.  Exact orthonormality of
  the one-variable polynomials checked by Gauss–Laguerre quadrature (error 2e-14).
* **Diffuse elements** (the n → ∞ limit of the remote coordinates): W (remote (2,1)), W₅ (remote (3,2)), and the shared-driver
  companions W(|z₁|²−1), W̄z₁²/√2 of d5k's family (`--diffuse core`, 4 columns).  `--diffuse ext` adds independent drivers for
  every other remote chaos type (real Gaussians for the self-conjugate types (1,1), (2,2); circular ones for (2,0), (3,1), (3,0),
  (1,0); a second (2,1) driver), each multiplied by the z₁-local Wick polynomial of the complementary degree (29 more columns).
* **Objective.**  Λ₅ as above, with q = the z₁-free cubic columns (junta tensors without z₁, and W); C is antilinear in q, so the
  Wirtinger gradient has an extra conjugate term (checked against finite differences to 2e-10).
* **Optimiser.**  L-BFGS (scipy) on the real parametrisation, common random numbers (one sample of 10⁶ points per run), 12 starts
  of 15 kinds (Gaussian point + small random tensors; pure random tensors; the L4-counterexample structure i·z₁(|z_j|²−1) + W;
  juntas in one or two ordinary coordinates (cubic + quintic) + W; comparable influence in all coordinates; quintic L4-analogue
  i·z₁:|z_j|⁴:; the (|z₁|²−1)H₂,₁(z_j) junta analogue of W(|z₁|²−1); Gaussian point with the W-coupled companions a, b on;
  pure quintic tensors; near zero; rescaled Gaussian point; mixed cubic shells z₁²z̄_j, (|z₁|²−1)z_j; …).
* **Baselines.**  S = sup of Λ₅ over d5k's six-dimensional Gaussian family on the same sample (fitted; with and without W₅), and
  G = d5k's exact Gaussian argmax (sample-independent).  **The number that counts is the fresh-sample excess Λ₅(candidate) − Λ₅(G)
  on ≥ 2·10⁷ common fresh samples**, with the standard error of the chunk-level differences (20 chunks of 10⁶).  The in-sample
  excess is biased upwards (the optimiser fits the sample noise; the bias grows with the basis size) and is reported only for
  information.  The best candidates are also "polished" (re-optimised from the candidate on a second sample of 2·10⁶) before the
  fresh evaluation.

## 3. Verification of the evaluator against d5k's quadrature (peak row)

`d5k_ref.py` (a standalone copy of d5k.py's grid, 10×6 radial panels × 48 angles; the W₅ average by the Rice mean) reproduces
d5k_rows.log: inner value 1.3587334 at (σ, ν₅) = (0.2395, 0.0408), row 0.7124323.  Re-optimising the adversary with the diffuse
quintic W₅ **on** (untested in d5k_rows.log) returns σ₅ = 0 at all three rows: W₅ does not help the adversary (σ₅ = 0.01 costs
2.2e-4, σ₅ = 0.1 costs 2.2e-2 at the peak row).

`k5_verify.py` (d = 1: z₁ and the diffuse drivers, i.e. exactly d5k's family; 2·10⁷ common samples) against the quadrature:

| point | MC value | s.e. | quadrature | MC − quad | MC diff to P0 | s.e. | quad diff | MC − quad |
|---|---|---|---|---|---|---|---|---|
| P0 d5k argmax (σ₀, ν₅) | 1.3588093 | 1.8e-4 | 1.3587334 | +7.6e-5 | 0 | | 0 | |
| P1 ν₅ = 0 | 1.3531997 | 1.9e-4 | 1.3531223 | +7.7e-5 | −5.610e-3 | 1.8e-5 | −5.611e-3 | +1.6e-6 |
| P2 σ = 0.20 | 1.3587300 | 1.8e-4 | 1.3586601 | +7.0e-5 | −7.93e-5 | 5.2e-6 | −7.33e-5 | −6.0e-6 |
| P3 σ = 0.30 | 1.3585539 | 1.7e-4 | 1.3584640 | +9.0e-5 | −2.554e-4 | 7.9e-6 | −2.695e-4 | +1.4e-5 |
| P4 σ₅ = 0.10 | 1.3363868 | 1.8e-4 | 1.3363128 | +7.4e-5 | −2.242e-2 | 2.0e-5 | −2.242e-2 | −1.9e-6 |
| P5 a = 0.10 | 1.3299052 | 1.7e-4 | 1.3298271 | +7.8e-5 | −2.890e-2 | 2.6e-5 | −2.891e-2 | +2.3e-6 |
| P6 b = 0.10 | 1.3266292 | 1.7e-4 | 1.3265789 | +5.0e-5 | −3.218e-2 | 1.8e-5 | −3.215e-2 | −2.6e-5 |
| P7 ν₃ = 0.05 | 1.3562719 | 1.8e-4 | 1.3561948 | +7.7e-5 | −2.537e-3 | 2.5e-6 | −2.539e-3 | +1.2e-6 |
| P8 G = 0 | 1.3482648 | 1.9e-4 | 1.3482170 | +4.8e-5 | −1.054e-2 | 3.1e-5 | −1.052e-2 | −2.8e-5 |
| P9 σ₅ = 0.20 only | 1.2637481 | 2.1e-4 | 1.2637127 | +3.5e-5 | −9.506e-2 | 4.8e-5 | −9.502e-2 | −4.0e-5 |

The absolute level agrees to +7.6e-5 ± 1.8e-4 (also 1.3588584 ± 8.9e-5 on 10⁸ samples, `verify_d1.log`), and every
difference (ν₅, σ, σ₅, the couplings a, b through C, ν₃) agrees within its standard error: the evaluator computes d5k's
functional, couplings included.

## 4. Results

### 4.1 Full-tensor attacks: fresh-sample excess over the Gaussian ideal

Every run: 12 starts (15 kinds), 10⁶ optimisation samples, 3 best candidates (all starts that reach the top value converge to the
same point), polish on 2·10⁶, fresh evaluation on 2·10⁷ common samples.  "Excess" = Λ₅(candidate) − Λ₅(G) on the fresh samples, G =
d5k's exact Gaussian argmax (for the peak d = 2 and d = 3 runs, which pre-date the pairwise reporting, the numbers come from the
post-hoc `k5_eval.py` / from the logged differences to the sample-fitted S corrected by G − S).  Row values in parentheses are
row_const + Λ₅.  Logs: `logs/<run>.log`; candidates: `results/k5_<run>_cands.npz`.

| row | d | diffuse | M | in-sample excess (biased) | best candidate (fresh) | fresh excess over G, raw | fresh excess over G, polished | structure of the candidate |
|---|---|---|---|---|---|---|---|---|
| peak t=0.84 | 2 | core | 22 | +5.7e-6 | Gaussian point (|W| 0.243, ν₅ 0.040) | −4.0e-5 ± 1.2e-5 | −1.1e-5 ± 1.2e-5 | no tensor component (junta |a|² < 1e-5) |
| peak | 2 | ext | 51 | +1.25e-4 | Gaussian point | −3.3e-5 ± 1.6e-5 | −3.6e-5 ± 2.3e-5 | noise in the r_z shell z₁ξ₁₁ (|a|² 1.9e-4) fitted in-sample, lost on fresh samples |
| peak | 3 | core | 82 | +1.79e-4 | Gaussian point | −3.3e-5 ± 1.8e-5 | −3.7e-5 ± 1.3e-5 | in-sample cubic junta of norm 0.11 is pure noise fitting (|W| 0.215 → 0.239 after polish) |
| peak | 4 | core | 244 | +5.3e-4 | Gaussian point after polish (|W| 0.197, ν₅ 0.041) | −1.66e-4 ± 2.9e-5 | −8.2e-5 ± 2.1e-5 | in-sample |W| 0.03–0.11 with cubic junta 0.15 and quintic junta 0.05 (488 real parameters fitted to the sample noise); all 12 starts end at the same in-sample point |
| t=0.76 | 2 | core | 22 | +2.6e-5 | Gaussian point (|W| 0.389, ν₅ 0.024) | −1.9e-5 ± 1.7e-5 | −3.4e-6 ± 2.1e-5 | none |
| t=0.86 | 2 | core | 22 | +1.36e-4 | Gaussian point (|W| 0.186 after polish) | −1.5e-5 ± 1.3e-5 | +2.3e-6 ± 1.0e-5 | none |
| t=0.87 | 2 | core | 22 | +5.0e-5 | junta q = 0.065·H₂,₁(z₂) + ν₅ 0.053 + companions | **+1.9e-5 ± 0.45e-5** (4.3 s.e.) | −4.6e-5 ± 1.1e-5 (polish jumped to the other branch, |W| 0.16) | see §4.2 |
| t=0.88 | 2 | core | 22 | +5.4e-5 | junta q = 0.088·H₂,₁(z₂) + ν₅ 0.053 + companions | +4.0e-6 ± 8.3e-6 | **+1.8e-5 ± 0.6e-5** (2.8 s.e.; polished: |W| 0.021, junta kept) | same structure |
| t=0.87, 10⁷ opt. samples, polish 10⁷, fresh 4·10⁷ | 2 | core | 22 | +2.7e-5 | junta q = 0.067·H₂,₁(z₂) + ν₅ 0.053 + companions (|W| 0.009) | **+1.83e-5 ± 0.37e-5** (5.0 s.e.) | **+1.80e-5 ± 0.37e-5** (4.8 s.e.) | the high-precision MC reproduces the exact quadrature value +1.61e-5 of §4.3 |
| t=0.87, full family, 4·10⁶ opt. samples, polish 10⁷, fresh 6·10⁷ (lean re-run of the 10⁷-sample run, whose 3 starts gave in-sample +6.4…7.7e-5) | 3 | core | 82 | +1.4e-4 | two spikes (cubic junta 0.118) + companions + cross-coordinate terms, ν₅ 0.051 | **+3.62e-5 ± 0.80e-5** (4.5 s.e.) | **+5.04e-5 ± 0.76e-5** (6.6 s.e.) | the full family adds ≈ 1.7e-5 to the restricted two-spike value |
| t=0.87, family `spikes`, 10⁷ opt. samples, polish 10⁷, fresh 10⁸ | 4 | core | 54 | +6.1e-5 | three spikes 3 × 0.063 + companions, ν₅ 0.051, |W| 0.028 | **+4.30e-5 ± 0.48e-5** (9.0 s.e.) | **+4.08e-5 ± 0.42e-5** (9.7 s.e.) | |
| t=0.87, family `spikes` (columns on z₁ + one ordinary coordinate), 10⁷ opt. samples, polish 10⁷, fresh 10⁸ | 3 | core | 38 | +4.3e-5 | two spikes: junta 0.090 = 2 × 0.064 in H₂,₁(z₂), H₂,₁(z₃) + companions, ν₅ 0.052, |W| 0.024 (3 starts, same point) | **+3.35e-5 ± 0.51e-5** (6.6 s.e.) | **+3.27e-5 ± 0.45e-5** (7.2 s.e.) | two spikes give about twice the one-spike excess |
| t=0.87 | 3 | core | 82 | +2.45e-4 | junta in both coordinates (cubic junta 0.12, |W| 0.036 → 0.077 after polish, ν₅ 0.050) | +0.8e-6 ± 1.6e-5 | +1.2e-5 ± 1.5e-5 | the 10⁶-sample fit is too noisy at d = 3 to resolve a 2e-5 effect (see the 10⁷-sample run and the exact quadrature below) |

The σ-profile of the Gaussian family itself is very flat (peak row: ±0.04 in σ costs 2e-5; quadrature and 4·10⁷-sample MC agree
to 1e-5), so the in-sample Gaussian argmax wanders (σ = 0.21–0.25 at the peak, 0 vs 0.035 at t = 0.87) and polishing on 2·10⁶
samples can jump between the two branches at t ≥ 0.86 (σ ≈ 0 and σ ≈ 0.16–0.19, which are within 1e-4 of each other).

### 4.2 The t ≥ 0.87 candidates: a spiky residual with correlated degree-5 companions (d = 2)

At t = 0.87 the Gaussian residual is useless (Λ₅(σ) is flat near σ = 0: −1.3e-5 at σ = 0.065, maximum ≈ +3e-7 at σ ≈ 0.01, MC
on 10⁸ samples and quadrature at three angular resolutions agree, `logs/sigma_t87.log`), and the optimiser finds instead a junta
residual q = c·H₂,₁(z₂) (c ≈ 0.065, fourth moment m = 44) together with small quintic terms in the SAME coordinate.  Decomposition of
that candidate on 2·10⁷ common fresh samples (`k5_decomp.py`, differences to G):

| part of the candidate | Λ₅ − Λ₅(G) |
|---|---|
| full candidate | **+1.92e-5 ± 0.45e-5** |
| ideal-6 part only (|W| 0.0024, ν₅ 0.053) | −3.6e-6 ± 1.0e-6 |
| ideal-6 + the junta q alone | −7.5e-5 ± 0.5e-5 |
| ideal-6 + all cubic (q + cubic mixed shells) | −6.5e-5 ± 0.5e-5 |
| ideal-6 + q + all quintic shells | +1.17e-5 ± 0.44e-5 |
| full minus shell 5:(1,0) = z₁·:|z₂|⁴:/2 (|a|² 1.6e-5) | −3.2e-5 (the shell is worth +5.1e-5) |
| full minus shell 5:(2,1) = H₂,₁(z₁)(|z₂|²−1) (|a|² 5.5e-6) | +0.3e-6 (worth +1.9e-5) |
| full minus shell 5:(0,1) = z̄₁·:z₂³z̄₂:/√6 (|a|² 4.9e-6) | +5.1e-6 (worth +1.4e-5) |
| full minus shell 3:(1,1) = (|z₁|²−1)z₂ (|a|² 1.5e-5) | +1.33e-5 (worth +0.6e-5) |
| clean junta c = 0.065·H₂,₁(z₂) + ν₅ (no companions) | −6.5e-5 ± 0.55e-5 (quadrature: −8.0e-5) |

So a one-coordinate junta residual **by itself never beats the Gaussian** (quadrature `k5_junta.py`: its sup over c is at c = 0 at
t = 0.86, 0.87, 0.88, and it loses 1.5e-4 at the peak, 7.5e-4 at t = 0.82, 5.7e-3 at t = 0.76), in line with (K-a).  What beats
the Gaussian by ≈ 2e-5 is the junta together with degree-5 companions z₁·:|z₂|⁴:, H₂,₁(z₁)(|z₂|²−1), z̄₁·:z₂³z̄₂: that are
*correlated with q because they are functions of the same coordinate*.  In the diffuse limit these companions (local polynomial
times a remote (2,2), (1,1), (3,1) chaos) become Gaussians independent of W (different chaos types are uncorrelated, hence
independent in the Gaussian limit), and then they cannot help: this is the "driver sharing" of the assessment note, on the
adversary's side.  d5k's Gaussian family only shares the driver through W(|z₁|²−1) and W̄z₁²/√2 (its a, b), which are optimal at 0.

### 4.3 Exact confirmation by quadrature (d = 2 junta family, no sampling noise)

`k5_quad2.py` optimises Λ₅ over the 18 Wick columns of H₂,₁(ℂ²) ⊕ H₃,₂(ℂ²) (no diffuse drivers) on a tensor Gauss–Legendre grid
60×48 (z₁) × 60×48 (z₂) = 8.3·10⁶ points (deterministic objective; its q = 0 baseline agrees with d5k's (z₁, W) grid to 1e-7).
Starts: junta 0.065/0.10/0.20 + ν₅ (+ noise), ν₅ + random, random, and the MC candidate; three or more starts reach the same
maximum, the "ν₅ + small random" start stays at the trivial local maximum q = 0.  The Gaussian ideal's gain over (q = 0, ν₅*) is
computed on d5k_ref's grid 16×10×768.

| row | Λ₅(q=0, ν₅*) | best junta-family Λ₅ | gain over q = 0 | Gaussian gain over q = 0 | **exact excess over the Gaussian ideal** | row value: Gaussian → junta | maximiser |
|---|---|---|---|---|---|---|---|
| t = 0.87 | 1.39633666 | 1.39635273 | +1.607e-5 | +0.0 (σ* = 0) | **+1.61e-5** | 0.7124448 → 0.7124609 | q = 0.0593·H₂,₁(z₂), ν₅ = 0.0532; companions z₁:z₂²z̄₂²: 0.0034, z₁z₂z̄₁ 0.0024, :z₁²z₂z̄₁z̄₂: 0.0021, :z₂³z̄₁z̄₂: 0.0020, z₁z₂²z̄₁² 0.0011, z₁²z̄₂ 0.0010 |
| t = 0.88 | — | — | +1.389e-5 | ≈ 0 | **+1.38e-5** | 0.7124367 → 0.7124505 | same structure (|q| = 0.058, ν₅ = 0.0533) |
| t = 0.86 | — | — | +1.767e-5 | ≈ 0 | **+1.77e-5** | 0.7124318 → 0.7124495 | same structure |
| t = 0.82 | — | — | — | (σ* = 0.285) | **−6.89e-4** | 0.7124092 → 0.7117200 | junta family without W far below the Gaussian |
| t = 0.76 | — | — | — | (σ* = 0.387) | **−5.12e-3** | 0.7117913 → 0.7066745 | idem |
| peak t = 0.84 | — | — | — | +1.6e-3 (σ* = 0.239) | **−1.16e-4** | 0.7124303 → 0.7123141 (junta family without W cannot reach the Gaussian) | the Gaussian wins where σ* > 0 |

Grid dependence of the quadrature optimum (t = 0.87, one-spike family): 30 radial nodes × 24 angles per coordinate gives a gain of
+5.17e-5, 60 × 48 gives +1.607e-5, 84 × 72 gives +1.547e-5 (four starts; the optimiser exploits the quadrature error of a coarse
grid exactly as it exploits sample noise, and the value is converged to ≈ 1e-6 at 60 × 48); the 10⁷-sample Monte-Carlo attack
with 4·10⁷ fresh samples gives +1.80e-5 ± 0.37e-5, in agreement.  **Exact one-spike excess at t = 0.87: +1.55e-5.**
(The two-coordinate quadrature `k5_quad3.py` could only be afforded at 24 × 16 per coordinate: it reports +6.5e-5 for the
one-spike sub-family and +9.0e-5 for two coordinates, which is grid error, not a result; the two-coordinate question is answered by
the 10⁷-sample d = 3 Monte-Carlo run below.)

### 4.4 How the flank excess grows with the number of spikes (t = 0.87)

Two restricted families, both sub-families of the full tensor space (so their excess is a lower bound for the full sup):
`--family spikes` keeps the Wick columns supported on z₁ and at most ONE ordinary coordinate (16 per coordinate: the spike
H₂,₁(z_j) and all its cubic and quintic companions), 10⁷ optimisation samples, polish 10⁷, fresh 10⁸; `--family symspikes` is the
symmetric N-spike ansatz (the 16 patterns summed over the N = d−1 ordinary coordinates, 18 complex parameters for any N),
4·10⁶ optimisation samples, polish 10⁷, fresh 6·10⁷.  Excess = Λ₅(candidate) − Λ₅(G) on fresh common samples (polished candidate;
the raw one in parentheses), G = d5k's exact Gaussian argmax.  Per-spike amplitude c = |q|/√N.

| spikes N | family | in-sample excess (biased) | **fresh excess over G** | c per spike | ν₅ | |W| |
|---|---|---|---|---|---|---|
| 1 | exact quadrature (§4.3) | — | **+1.55e-5** (exact) | 0.070 | 0.0529 | 0 |
| 1 | full d = 2, 10⁷ samples | +2.7e-5 | +1.80e-5 ± 0.37e-5 (+1.83e-5) | 0.067 | 0.053 | 0.009 |
| 1 | symspikes | +2.9e-5 | +2.17e-5 ± 0.35e-5 (+1.88e-5) | 0.072 | 0.053 | 0.007 |
| 2 | spikes, d = 3 | +4.3e-5 | +3.27e-5 ± 0.45e-5 (+3.35e-5) | 0.064 | 0.052 | 0.024 |
| 2 | symspikes | +4.2e-5 | +2.85e-5 ± 0.46e-5 (+3.55e-5) | 0.064 | 0.052 | 0.024 |
| 3 | spikes, d = 4 | +6.1e-5 | +4.08e-5 ± 0.42e-5 (+4.30e-5) | 0.063 | 0.051 | 0.028 |
| 3 | symspikes | +5.0e-5 | +4.64e-5 ± 0.54e-5 (+3.55e-5) | 0.061 | 0.052 | 0.033 |
| 5 | symspikes | +1.69e-4 | +5.09e-5 ± 1.0e-5 (+4.32e-5) | 0.065 | 0.049 | 0.017 |
| 6 | symspikes | +1.15e-4 | +7.05e-5 ± 0.83e-5 (+6.79e-5) | 0.059 | 0.049 | 0.020 |
| 8 | symspikes | +1.36e-4 | **+8.07e-5 ± 0.82e-5** (+7.06e-5) | 0.056 | 0.048 | 0.038 |
| 10 | symspikes | +1.37e-4 | **+7.97e-5 ± 1.0e-5** (+7.89e-5) | 0.054 | 0.048 | 0.022 |
| 14 | symspikes | +1.23e-4 | +7.74e-5 ± 0.87e-5 (+7.36e-5) | 0.048 | 0.047 | 0.051 |
| 20 | symspikes | +9.4e-5 | +7.20e-5 ± 1.2e-5 (+8.39e-5) | 0.043 | 0.046 | 0.012 |
| 40 | symspikes | +4.7e-5 | +4.32e-5 ± 1.3e-5 (+2.98e-5) | 0.032 | 0.044 | 0.071 |

The excess rises from 1.6e-5 (one spike) to a broad plateau of about **8e-5 for 8–20 spikes of amplitude 0.04–0.055 each**, and
falls again for many small spikes (N = 40: 4.3e-5; the law of q approaches the Gaussian, for which the excess is zero).  The
in-sample excess of the symmetric runs carries a bias of 3–10e-5 at 4·10⁶ samples (large because the symmetrised columns are
heavy-tailed): only the fresh column is meaningful.  Three starts per run; the Gaussian-point start sometimes stays at the trivial
local maximum q = 0, the others always reach the spike configuration.  The FULL family at d = 3 (all 78 junta columns, including the
cross-coordinate ones such as z₂z₃z̄₁, `logs/hp_t87_d3b.log`) gives +5.0e-5 ± 0.8e-5 for two spikes against +3.3e-5 ± 0.5e-5 in the
restricted family: cross-coordinate terms add ≈ 1.7e-5 at N = 2, so the plateau of the full tensor space is plausibly ≈ 1e-4 rather
than the 8e-5 of the symmetric ansatz (not measured beyond d = 4).

## 5. Conclusion

1. **At the peak row (t = 0.84) and at every row with a substantial Gaussian residual (σ* ≥ 0.2: t ≤ 0.84), Conjecture K₅ holds in
   every family tested**, to the accuracy of the method: the fresh-sample excess over the exact Gaussian argmax is negative or zero
   within 1–2 standard errors for d = 2, 3, 4 (core diffuse set), for the extended diffuse set (d = 2), and the exact quadrature puts
   the whole d = 2 junta family 1.2e-4 (t = 0.84), 6.9e-4 (t = 0.82) and 5.1e-3 (t = 0.76) below the Gaussian ideal.  The in-sample
   excesses (+1.8e-4 at d = 3, +5.3e-4 at d = 4) are the optimiser fitting the noise of 10⁶ samples with 164 and 488 real
   parameters: they turn negative on fresh samples, as the task anticipated.  The diffuse quintic direction W₅ never helps (optimal
   weight 0 at every row, by quadrature and by MC).

2. **At the flank rows t ∈ [0.86, 0.88], where the Gaussian residual is useless (σ* ≈ 0, Λ₅(σ) flat), exact K₅ is false.**  The
   maximisers are spiky cubic residuals, q = Σ_j c·H₂,₁(z_j) over N comparable ordinary coordinates (c ≈ 0.06), each spike carrying
   its degree-5 companions in the same coordinate (z₁·:|z_j|⁴:, H₂,₁(z₁)(|z_j|²−1), z̄₁·:z_j³z̄_j:, (|z₁|²−1)z_j, z₁²z̄_j, …).  A spike
   alone loses (its sup is at c = 0, in line with (K-a)); the companions, correlated with q because they are functions of the same
   coordinate, pay for it; in the diffuse limit they become Gaussians independent of W and cannot help, which is why the Gaussian
   family misses this point (the adversary's version of the "driver sharing" that makes our coupled C essential).
   Size (t = 0.87; the rows t = 0.86 and 0.88 behave the same): one spike +1.55e-5 (exact quadrature, confirmed by MC at 5 s.e.);
   the fresh-sample excess grows with the number of spikes to a **plateau of ≈ 8e-5 ± 1e-5 for 8–20 spikes** (+8.1e-5 ± 0.8e-5 at
   N = 8, 9.8 s.e.; +8.0e-5 ± 1.0e-5 at N = 10; +7.7e-5 ± 0.9e-5 at N = 14; +7.2e-5 ± 1.2e-5 at N = 20) and decays towards the Gaussian value for many small
   spikes (+4.3e-5 at N = 40).  These are lower bounds for the sup over the full tensor space (symmetric ansatz): the full family at
   d = 3 gives +5.0e-5 ± 0.8e-5 against +3.3e-5 for two restricted spikes, so cross-coordinate terms add ≈ 1.7e-5 there and the
   full-space plateau is plausibly ≈ 1e-4.

3. **Against the parent's criterion** (an excess above +1e-4 with ≥ 3 s.e. kills the degree-5 route): the largest fresh-sample
   excess found is 8.1e-5 ± 0.8e-5 (symmetric 8-spike family; the full space plausibly reaches ≈ 1e-4), i.e. the violation is real
   (10 s.e.) but of size ≈ 1e-4, right at the criterion, and only on the flank rows t ≥ 0.86.  Consequence for the gate-free degree-5 row: the row values 0.712432 / 0.712445 / 0.712437 at
   t = 0.86 / 0.87 / 0.88 become ≈ 0.71251–0.71253, so the envelope rises from the Gaussian ideal 0.712451 to about **0.71253**, i.e.
   the route's model value moves from K ≈ 1.40360 to **K ≈ 1.40344** (with ℓ, β, b_A, b_B still optimised against the Gaussian
   adversary; re-optimising them against the spiky one can only lower this).  So **K₅ fails as an exact statement; K₅_η holds for
   η ≈ 1e-4 on everything tested**, and the margin to the 1.402 cap shrinks from 8.2e-4 to ≈ 7e-4.  A certificate built on the
   gate-free row must handle spiky residuals with correlated companions on the flank rows (an influence decomposition: finitely many
   high-influence coordinates treated exactly, as in the assessment's step 3), while at t ≤ 0.85 the Gaussian ideal is attained to
   ≈ 1e-5.

4. **For the cubic Conjecture K** the same phenomenon should be looked for at rows where σ* → 0 (large t), with the mixed components
   r_z, r_A, r_B of the spike's coordinate as companions; at the cubic peak rows σ* ≈ 0.2 and the earlier n = 2, 3 attacks found
   nothing, consistent with item 1.  The exact d = 2 quadrature optimiser (`k5_quad2.py`, ≈ 20 min per row) is the right tool.

## 6. Files

`k5_attack.py` (attack; `--family full|spikes|symspikes`, `--diffuse core|ext|ext2`), `k5_verify.py` (evaluator vs quadrature),
`k5_sigma.py` (σ-profiles), `k5_junta.py` (one-coordinate junta vs Gaussian by quadrature), `k5_quad2.py` (exact d = 2 optimisation),
`k5_quad3.py` (d = 3 quadrature; too coarse to be useful), `k5_eval.py`, `k5_decomp.py` (post-hoc fresh evaluation and shell
decomposition of saved candidates), `d5k_ref.py` + `kmodel.py` (d5k's quadrature), `run.sh` (process-group launcher), `sync.sh`;
`logs/*.log` (every run), `results/*.json`, `results/*_cands.npz` (candidate coefficient vectors with column labels).

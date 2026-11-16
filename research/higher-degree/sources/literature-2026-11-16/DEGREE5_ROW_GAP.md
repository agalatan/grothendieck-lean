<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/literature/DEGREE5_ROW_GAP.md, 16 November 2026; Agent-ID: claude-b9ee (research workers of this session). -->
# The degree-5 row functional: remote-law gap at the peak of the degree-5 game

Literature worker for claude-b9ee, 16 November 2026. Labels:
- **N**: floating point, scripts in `checks/degree5-row/`, run with `/usr/local/bin/python3 -I`.
- **P (here)**: a short derivation in this file.
- **Repo**: an existing repository statement, cited with its file.

No certificate is claimed. All numbers are on the laptop, with small computations.

## 0. Answer

At the peak row of the degree-5 game (1, −0.848926, +0.281576), the **remote-law gap is +1.4·10⁻⁵ to +1.5·10⁻⁵**.
That is the supremum over remote laws satisfying our cubic-law moment constraints, minus the Gaussian benchmark. It is
an order of magnitude below the 2·10⁻⁴ threshold.

- **Where it comes from.** It is attained only at χ = 0, by a discrete law with the Gaussian's first three moments.
  This is the same moment-ambiguity floor as in the cubic case (1.05·10⁻⁵ there with C₆ = 49.425), and there the
  Stein cuts reduce it to 3.6·10⁻⁷ (STATUS 3.3).
- **Away from χ = 0, non-Gaussian laws lose.** For χ ≥ 0.05 every admissible law loses to the Gaussian: −3.7·10⁻⁶ at
  m = 2.05, and down to −1.9·10⁻³ at m = 44.
- **The constant-modulus driver is the law that killed the HJM-PD lift.** Here it would gain +2.86·10⁻³, but it is
  excluded, because E U² = 1 < 2 violates κ₄ ≥ 0.
- **Decision.** On the remote axis a degree-5 certificate near 1.4033 is plausible. The obstacles are elsewhere: the
  visible and coupled sectors, a known K₅ violation of up to +5·10⁻⁵ at flank rows from spikes with correlated
  companions, and the size of the certificate (§4).

---------------------------------------------------------------------------------------------------------------------

## 1. The functional (Repo: `sources/october-handoff/pipeline-gate/KSIDE.md` §6; `sources/k5-2026-11-04/RESULTS.md` §1)

**Witness and row.** The witness is T = P − ε₁Q + ηR, with P = P₁,₀, Q = P₂,₁, R = P₃,₂ and
(ε₁, η) = (0.848926, 0.281576). This is the degree-5 game (−0.849, +0.2816) up to rounding. The gate-free row is

    V ≤ t² − 2ℓt + 2β²/ε₁ + c₅²/η + sup_{G₃ ∈ H₂,₁, G₅ ∈ H₃,₂} Λ₅(G₃, G₅),

    Λ₅ = E|L + G₅ + G₃ − C| + E|L + G₅ − G₃ + C| − ‖G₃‖²/ε₁ − ‖G₅‖²/η + (b_A² + b_B²)‖q‖²/η.

- L = z₁(ℓ + β(|z₁|² − 2)), and q is the z₁-free (remote) part of G₃.
- **Our coupled term** is C = c₅H₃,₂(z₁) + b_A·q·(|z₁|² − 1) + b_B·q̄·z₁²/√2, with c₅ = 0. Here one remote cubic q feeds
  the cubic sector and the two degree-5 mixed sectors: this is the multi-grade fibre of `docs/overview.tex` open
  problem 2.

**Peak row** (Repo, `d5k_rows.log` as quoted in k5 RESULTS): t = 0.84, ℓ = 0.8402, β = 0.1591, b_A = −0.1585,
b_B = −0.0965.

**The remote-law version** (P here).
- Take G₃ = q + ν₃H₂,₁(z₁) and G₅ = ν₅H₃,₂(z₁) + a·q(|z₁|² − 1) + b·q̄z₁²/√2. Here a and b are the adversary's own
  companions driven by q; the remote quintic is never used (Repo).
- Then the integrand is |A + B| + |A − B|, with
  - A = L + ν₅H₃,₂ + q(a(T − 1)) + b·q̄z₁²/√2, and
  - B = q(1 − b_A(T − 1)) − b_B·q̄z₁²/√2 + ν₃H₂,₁.
- Every term is charge one jointly in (z₁, q). So E_{z₁}[·] depends only on s = |q|: write it Ψ(s; ν₃, ν₅, a, b).
- With u = E|q|², U = |q|²/u and cost(u) = (u + ν₃²)/ε₁ + (ν₅² + (a² + b²)u)/η − (b_A² + b_B²)u/η:

      Λ₅^rem = E Ψ(√(uU)) − cost(u).

- **Gaussian benchmark:** U ~ Exp(1), with the supremum over (u, ν₃, ν₅, a, b).

**Remote laws admitted** (STATUS 3.4, Lean inputs):
- E U = 1;
- E U² = m ∈ [2, 44];
- E U³ ≤ 9m − 12 + 40.45313·(m − 2)^(3/2).

**Not imposed:** the Stein cuts and the Lean spectral-cut family. So the computed supremum over-estimates the
supremum over genuine chaos laws, and **the gaps below are upper estimates**.

## 2. Validation (N)

- Ψ is computed on a polar z₁-grid (60 radial panels × 8 nodes × 256 angles) and a spline in s. The Exp(1) expectation
  uses Gauss–Laguerre with 80 nodes.
- **Grid convergence:** Λ₅ at the quoted adversary (σ, ν₅) = (0.2395, 0.0408) is 1.35873119, 1.35873113 and 1.35873114
  on three grids.
- **Against the repo:** 1.3587334 in `d5k_ref`. The 2.2·10⁻⁶ difference is consistent with the row parameters being
  quoted to 4 decimals.
- **Gaussian benchmark re-optimised:** S₅ = 1.35873125 at σ = 0.2380 (u = 0.05663), ν₅ = 0.0409, ν₃ = 0, a = b = 0.
  The row value is 0.7124302 against the repo's 0.712432. The companions are optimal at 0, as the repo found.

## 3. The gap (N)

### 3.1 Moment LP over discretised laws of U (`lp_gap.py`, `lp_refine.py`)

- **LP.** 901 atoms on U ∈ [0, 440] with quadratic spacing; maximise E Ψ(√(uU)) under the three moment constraints;
  then a grid in u and m. The visible parameters are held at the Gaussian optimum. Each LP takes milliseconds; a full
  scan, about 2 s.

| m = E U² | sup over admissible laws minus S₅ (peak row) |
|---|---|
| 2.000 | **+1.44·10⁻⁵** (u = 0.0583) |
| 2.010 | +1.07·10⁻⁵ |
| 2.030 | +3.4·10⁻⁶ |
| 2.05 | −3.7·10⁻⁶ |
| 2.2 | −5.2·10⁻⁵ |
| 3 | −2.26·10⁻⁴ |
| 6 | −4.83·10⁻⁴ |
| 14 | −8.59·10⁻⁴ |
| 44 | −1.94·10⁻³ |

- **The maximising law** has atoms U = 0.0005 (mass 0.4955), 1.891 (0.1551), 2.021 (0.3494) and 115.9 (1.3·10⁻⁶).
  It matches the Exp(1) moments 1, 2, 6 and is far from any chaos law. Re-optimising the visible parameters for it
  gives +1.51·10⁻⁵.

### 3.2 Explicit laws (`testlaws2.py`)

For each law, u and (ν₅, a, b) are re-optimised; ν₃ = 0.

| law | E U² | minus Gaussian |
|---|---|---|
| Gaussian Exp(1) | 2 | 0 |
| **constant modulus U ≡ 1 (excluded: m < 2)** | 1 | **+2.86·10⁻³** (u at the search bound 0.2) |
| one-variable H(w): U = T(T−2)²/2 | 44 | −1.475·10⁻⁴ (optimum switches the remote off: u → 3·10⁻⁴) |
| X(\|Y\|² − 1): U = T₁(T₂ − 1)² | 18 | −1.471·10⁻⁴ (u → 7·10⁻⁴) |
| XYV̄: U = T₁T₂T₃ | 8 | −1.460·10⁻⁴ (u → 2·10⁻³) |
| Gaussian scale mixture, M ∈ {0.5, 1.5} | 2.5 | −1.02·10⁻⁴ |
| moment-LP extremal law | 2.000 | +1.51·10⁻⁵ |

The junta loss of 1.5·10⁻⁴ at the peak agrees with the repo's quadrature (`k5_junta.py`: "loses 1.5e-4 at the peak").

### 3.3 Flank row t = 0.87, where K₅ fails numerically (Repo k5 RESULTS §4.2–4.3)

Row t = 0.87, ℓ = 0.8707, β = 0.1775, b_A = −0.1727, b_B = −0.1064.

- **Gaussian benchmark.** S₅ = 1.39633669, at σ → 0 (u ≈ 0) and ν₅ = 0.0540; row value 0.71244483. Repo:
  Λ₅(q = 0, ν₅*) = 1.39633666, row 0.7124448. **The Gaussian residual is useless at this row**, as the repo found.
- **Moment-LP gap:** ≤ 2.6·10⁻⁹. Every admissible law of U is optimal with u → 0.
- **Constant modulus:** +1.7·10⁻⁸, also with u → 0.
- So at the flank row the remote-law axis has **no** gap. The repo's K₅ violation there (+1.6·10⁻⁵ for one spike, up
  to +5·10⁻⁵ for two or three spikes) lives entirely in the channel of **correlated companions**.
  - That channel consists of degree-5 terms driven by other functions of the spike coordinate, such as z₁·:|z₂|⁴:,
    H₂,₁(z₁)(|z₂|² − 1) and z̄₁·:z₂³z̄₂:.
  - These are not functions of q, so they are outside any law-of-|q| model. A certificate must cap this channel
    separately, through the sector analysis, not through the law of U.

**Explicit laws at t = 0.87** (`testlaws2.py t87`).
- Every law switches the remote off: the optimum is at u ≈ 10⁻⁴, with ν₅ = 0.0540 and a = b = 0.
- Its difference to the Gaussian is ≤ 4·10⁻⁸ in absolute value:
  - constant modulus +1.7·10⁻⁸;
  - H-law −3.9·10⁻⁸;
  - X(|Y|² − 1) −3.6·10⁻⁸;
  - XYV̄ −2.8·10⁻⁸;
  - scale mixture −4.5·10⁻⁹;
  - LP law +6.9·10⁻⁹.

---------------------------------------------------------------------------------------------------------------------

## 4. Decision and certificate pipeline

**The gap is ≤ 2·10⁻⁴ on the remote axis.**
- The moment relaxation alone gives at most 1.5·10⁻⁵ at the peak.
- The excess sits at χ ≈ 0, which is exactly what the existing Stein cuts remove in the cubic case.
- Constant-modulus-like laws do **not** get through, because κ₄ ≥ 0 (E U² ≥ 2) already excludes them, and
  heavy-tailed chaos laws lose.

So a degree-5 certificate near 1.4033 is plausible: model norm 0.712430, so 1/N = 1.40364, minus a certificate loss of
about 10⁻⁴.

**Pipeline**, reusing the cubic infrastructure wherever possible:
1. **Rows.** The degree-5 gate-free row above (paper, KSIDE §6), with a t-cover. The cubic cover used 19 profiles;
   here each row also carries (b_A, b_B, c₅).
2. **Remote layer (L1₅).** The law-of-U certificate with the new potential Ψ₅. Every law input is a property of cubic
   chaos alone (moments, Stein variables, the Lean cut family) and is reused unchanged. Only the potential changes: a
   one-parameter family in s for each row, with the nodes enclosed by interval quadrature in z₁.
   - *Cost:* low to moderate, about one cubic-L1 package per row.
   - *Expected loss:* ≤ 1.5·10⁻⁵ (moment-only) and much less with the Stein cuts.
3. **Visible and coupled sectors (L2₅–L5₅).**
   - The cubic sectors of K: A, B, odd, and the joint (P). Their analysis carries over, with the degree-5 visible
     pieces added to the base L + ν₅H₃,₂.
   - New degree-5 sectors, which are pure cost or have content: the companions driven by q (optimal at 0 here); the
     visible H₃,₂; and **companions driven by other remote chaos types correlated with q**. The last are the junta
     spikes of the repo's K₅ test: +1.6·10⁻⁵ with one spike, +4.1·10⁻⁵ with three spikes, at t ≥ 0.86.
   - *Cost:* high. This is where the cubic programme still has open problems ((★), (P)).
   - *Budget:* the 8.2·10⁻⁴ margin to 1.402 (KSIDE §6), or 3.3·10⁻⁴ to 1.403.
4. **Node caps and Lean.** The degree-5 potential has more parameters (ν₅, b_A, b_B, c₅), so the node-cap tables grow.
   - *Cost:* CPU-heavy, of the order of the current 21 CPU-hours per full cubic cap set or more.
5. **Consumer.** The t-regions and the response energy caps for degree-5 responses.

**Main risks.**
- The K₅ flank violation grows with the number of spikes: +1.6, +3.3 and +4.1·10⁻⁵ for 1, 2 and 3 spikes in the
  repo's runs. Whether it saturates is unknown. A certificate must cap it, for example by a degree-5 analogue of the
  odd-sector costs over cores.
- The cubic programme's own open pieces recur at degree 5.

**Recommendation.**
- **Route A stays the near-term plan** (weeks).
- **Route B is not blocked by the remote laws.** Its first decisive milestone would be the remote layer L1₅ at the
  peak row with the Stein cuts (expected certified gap ≤ 10⁻⁵), plus a numerical cap on the spike channel at the flank
  rows.

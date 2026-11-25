# Reproduction scripts

These Python scripts recompute the numbers of the article from the certificate data, and say how each number is
obtained. They are a reader's aid and an independent cross-check.

**They are not part of the proof.** The Lean package in the parent folder never reads, runs or imports anything in
this folder, and deleting the folder changes nothing in `lake build`. In the other direction the scripts read the
Lean sources only as text: the certificate data are Lean literals in `../Haagerup/Parameters.lean` and
`../Haagerup/Data/*.lean`, and `common.py` parses them into Python integers and fractions. Lean does not have to be
installed.

Each result is labelled with the arithmetic that produced it:

- **exact**: integers and `fractions.Fraction`; the printed statement holds exactly for the data read;
- **interval**: exact rational arithmetic on the endpoints of the certified intervals of the Lean data; the
  statement holds for every choice of values inside those intervals. That the true values lie in the intervals is
  proved in Lean, not here;
- **floating point**: `mpmath` or `numpy`, without a proved error bound. These are numerical confirmations.

No script proves anything; a line `[ok]` means that the recomputation agrees.

The article lists eight finite computations used in the proof. The scripts follow that list:

| computation of the article | script | Lean |
|---|---|---|
| Sums of squares | `03_cell_maps.py` | `tig_sos_ok`, `tcell_sos_ok` |
| Overlaps of f_tig | `04_overlaps.py` | `tig_mu_ok`; `mem_muTigOf` |
| Energies of f_sm | `04_overlaps.py` | `tcell_rows_ok`; `smoothedRowsCheck_table_sound` |
| Head | `05_head.py` | `head_sum_ok`; `head_residual_of_fastHeadOK` |
| Positivity on the outer circles | `06_tails.py` | `reg0_ok` … `reg5_ok` |
| Circle means | `06_tails.py` | `mean0_ok` … `mean5_ok` |
| Rational arithmetic of the certificate | `01_certificate_arithmetic.py` | inside `isBound_cert`, `certificate_value`, `isBound` |
| Rational arithmetic for γ† | `02_gamma_dagger.py` | inside `gammaDagger_bounds`, `inv_gammaDagger_gt` |

`07_alternating_sums.py` reproduces the alternating sums that the article quotes for orientation (they are not
used in the proof), and `make_figures.py` the figure.

Names: the article's c_cert, η_cert (head cap), δ_cert, ϱ_p, r_reg,p, β_p, B_p, τ_p are `cCertQ`, `headCapCertQ`,
`deltaCertQ`, `rhoQ`, `regRQ`, `jCertQ`, `budgetQ`, `tailQ` in `Parameters.lean`; the matrices Γ_p(t) and the Schur
denominator Λ_β are `RtGen` and `gaussDenominator` in `SchurHardy.lean`. The scripts print `c`, `head cap`, `delta`,
`rho`, `beta`, `B`, `tau`.

## Requirements

Python 3.10 or later. No network access; nothing is written outside this folder (and, for `make_figures.py`, the
two figure files).

| script | third-party packages |
|---|---|
| `common.py`, `01_certificate_arithmetic.py`, `05_head.py`, `07_alternating_sums.py` | none (standard library) |
| `02_gamma_dagger.py` | `mpmath` (part (a) only; part (b) is standard library) |
| `03_cell_maps.py` | `numpy` (sampled maximum only; the sum-of-squares check is standard library) |
| `04_overlaps.py` | `mpmath` |
| `06_tails.py` | `numpy` |
| `make_figures.py` | `numpy`, `matplotlib` |

```sh
python3 -m venv ~/haagerup-venv && ~/haagerup-venv/bin/pip install mpmath numpy matplotlib
PYTHON=~/haagerup-venv/bin/python ./run_all.sh
```

The reference outputs were produced with Python 3.12 and 3.14, mpmath 1.4.1, numpy 2.5.5 and matplotlib 3.11.2.

## Running

```sh
./run_all.sh            # 01-07 in order, 04 with --all; stops at the first failure
./run_all.sh --quick    # 04 with its default (short) options
./run_all.sh --jobs 4   # worker processes for 04
python3 05_head.py      # any script alone; exit status 0 iff every check passed
```

`run_all.sh` prints one `PASS`/`FAIL` line per script and the total time.

| script | arithmetic | time on a laptop |
|---|---|---|
| `01_certificate_arithmetic.py` | exact | under 1 s |
| `02_gamma_dagger.py` | floating point (a), exact (b) | 1 s |
| `03_cell_maps.py` | exact, and floating point for the samples | 5 s |
| `04_overlaps.py` | floating point, high precision | 15 s |
| `04_overlaps.py --all` | the same, all 251 + 21,168 values | about 12 minutes on one core; 4 minutes with `--jobs 3` (measured on a cloud VM) |
| `05_head.py` | interval, exact endpoints | 40 s |
| `06_tails.py` | floating point; one interval check | 30 s |
| `07_alternating_sums.py` | interval, exact endpoints | 30 s |
| `make_figures.py` | floating point (plots) | 5 s |

### Comparing with the reference outputs

`expected_output/` holds the output of each script from the author's run (`04_overlaps.txt` for the default
options, `04_overlaps_all.txt` for `--all`). `run_all.sh` says whether a new run reproduces them byte for byte.
The outputs of 01, 05 and 07 are exact and must be identical. In 02, 03, 04 and 06 the floating-point figures are
printed with fewer digits than they are computed with, so they are normally identical too, but a last digit may
differ with another version of numpy or mpmath; the `[ok]` lines must not change.

## What is read from the Lean files

| file | definitions | meaning |
|---|---|---|
| `Haagerup/Parameters.lean` | `wQ`; `p0Q`, `q0Q`, `p1Q`, `q1Q`, `p2Q`, `r3Q`, `r4Q`, `p5Q`, `q5Q`; `rhoQ`, `regRQ`, `jCertQ`, `budgetQ`, `tailQ`; `cCertQ`, `headCapCertQ`, `deltaCertQ`; `ctQ`, `stQ`, `seQ`, `ceQ` | the article's table of the six channels: weights w_p, preprocessors, radii ρ_p and r_reg,p, Schur parameter j_p, budgets B_p, tail allowances τ_p; the centre c, the head cap and δ; the two rotations of the smoothing |
| `Haagerup/Data/TigerData.lean` | `tigCreStrs`, `tigCimStrs`, `tigQreStrs`, `tigQimStrs` | the cell map f_tig and its sum-of-squares witness |
| `Haagerup/Data/TCellData.lean` | `tcellCreStrs`, `tcellCimStrs`, `tcellQreStrs`, `tcellQimStrs` | the cell map T_cell and its witness |
| `Haagerup/Data/OverlapData.lean` | `tigMuList`; `tcellRow_0` … `tcellRow_167`, `tcellRows` | certified intervals for μ_0 … μ_250 of the reflected pair and for the 21,168 energies E(d₁, d₂) of the smoothed map |

A table is 36 strings (Fourier index l = 0…35, harmonic m = l − 17) of 20,480 characters: 4,096 cells of five
characters, each character a base-64 digit (`c − 49` if `c > 92`, else `c − 48`), least significant first, minus
2²⁵. Cell `64·i + j` is |z₁| ∈ [3i/32, 3(i+1)/32), |z₂| ∈ [3j/32, 3(j+1)/32). An interval `⟨lo, hi⟩` is
[lo/2¹²⁸, hi/2¹²⁸]. `common.py` checks the shape of everything it reads and stops with `DATA ERROR` (exit status 2)
if a definition is missing.

The only numbers in the scripts that do not come from these files are the bound of the main theorem (`HEADLINE` in
`common.py`, 1.40456), the decimal bounds 0.711958633 and 0.711958683 of the enclosure of γ† in
`02_gamma_dagger.py`, and, in `07_alternating_sums.py`, the bounds quoted in the article's text (`QUOTED`); the
quantities compared with them are computed.

## The scripts

### `01_certificate_arithmetic.py`: the rational arithmetic of the certificate

*Computes* (exact): the weights are positive and sum to 1; each polynomial P_p, Q_p, R_p has coefficient ℓ¹ norm
at most 1 (all equal 1); the rotations satisfy c² + s² = 1; 1 < ϱ_p < r_reg,p and 0 < β_p < 1; the six tail
inequalities of the Hardy tail lemma in the square-root-free form

    B_p · ρ_p^(−1006) ≤ τ_p² · (1 − ρ_p^(−4)),        1006 = 4K + 6 with K = 250

(in `CertCheck.lean` the exponent is written `2 * (2 * 251 + 1)`: the tail starts at k = 251); the assembly at the
end of the proof of the six-channel certificate, head cap + Σ_p w_p τ_p = δ exactly; c − δ and 1/(c − δ) as
rationals and to 30 digits.

*Should print*: `sum_p w_p tau_p = 4.746484e-08`, `delta = 6.20531484e-06`,
`c - delta = 711968053274152967940951/10^24`, `1 / (c - delta) = 1.404557403104344654205304924616`, and that this
is at most 1.40456.

*Lean*: `Haagerup.isBound_cert` (`Haagerup/CertCheck.lean`; inside it `tails_rat_ok`, the ℓ¹ checks and the
comparison with `deltaCertQ`), `Haagerup.certificate_value` and `Haagerup.isBound` (`Haagerup.lean`).

### `02_gamma_dagger.py`: Haagerup's constant

*Computes*: (a) floating point, 50 digits: γ† by quadrature of cos²t/√(1 + sin²t) over [0, π/2], as
(π/4)·₂F₁(½, ½; 2; −1), and as the alternating series Σ (−1)^k r_k with r_k = (π/4)·C(2k,k)²/(16^k (k+1)) (summed
with convergence acceleration, and bracketed by two consecutive partial sums); 1/γ†.
(b) exact: the steps of the lemma "Enclosure of γ†", recomputed rather than copied: the Taylor polynomial P₁₄ of
(1 − x)^(−1/2); the identity (1 − x)·P₁₄(x)² = 1 − Σ_{m=15}^{29} d_m x^m with d_m > 0 and Σ d_m = 1; the constant
q₀ = (2/π)∫₀^{π/2} cos²t·P₁₄(cos(2t)/3) dt from the means of cosⁿ; the best prefactors with denominator 5·10¹⁰
below √(2/(3(1 + 3⁻¹⁵))) and above √(2/(3(1 − 3⁻¹⁵))); the enclosure of π to 20 decimals, from Machin's formula
in exact arithmetic.

*Should print*: `0.7119586597782638015124585488054` three times, `1 / gamma-dagger = 1.4045759346637420327739584715481`,
`q_0 = 40545758045051663/73040694872113152`, the prefactors `40824827623` and `40824830469` over 5·10¹⁰, the
bounds `0.711958633093928…` and `0.711958682726330…` (so 0.711958633 < γ† < 0.711958683), and
`140456 * 711958683 = 99998868779448` < 10¹⁴.

*Lean*: `Haagerup.gammaDagger_bounds` (`Haagerup/GammaDagger.lean`), `Haagerup.inv_gammaDagger_gt` (`Haagerup.lean`).

### `03_cell_maps.py`: the two cell maps are bounded by 1 and have charge one

*Computes*: decodes f_tig and T_cell. Exact: for each of the 4,096 cells of each map, the sum-of-squares bound
of the article with the committed witness S: with κ_m = Σ_d (C_{d+m}·conj(C_d) + S_{d+m}·conj(S_d)),

    |C(w)|² ≤ κ₀ + 2·Σ_{m=1}^{35} (|Re κ_m| + |Im κ_m|) ≤ 2⁴⁸      on |w| = 1,

so |F| = |C|/2²⁴ ≤ 1. Floating point: the maximum of |F| over 4,096 points of the circle in every cell (by FFT);
F(u z₁, u z₂) = u·F(z₁, z₂) at random points; the reflected map f_tig(−z₁, z₂) has the coefficients (−1)^m c_m.

*Should print*: the largest bound, `2^48 - 3991486461` for f_tig and `2^48 - 3222094` for T_cell; sampled maxima
`0.999980344` and `0.999995209`.

*Lean*: `Haagerup.Data.tig_sos_ok`, `Haagerup.Data.tcell_sos_ok` (the same integer inequality, `sosAllOK` in
`HaagerupKernel/CellKernel.lean`); `Haagerup.norm_cellFn_le`, `Haagerup.cellFn_rot2` (`Haagerup/CellMap.lean`).

### `04_overlaps.py`: the overlap tables, recomputed from the cell maps

*Computes* (floating point at several hundred digits; `mpmath` for the incomplete gamma functions, Python integers
in fixed point for the sums): from the decoded tables,

- the overlaps of the reflected pair by the article's Laguerre formula (the proposition "Overlaps of a cell map"),
  μ_n = Σ_{m=−17}^{18} (−1)^m Σ_{k₀(m)+n₁+n₂=n} |Σ_{i,j} c_{m,i,j}/2²⁴ · J_{n₁,|m|,i} · J_{n₂,|1−m|,j}|², with
  J_{n,α,i} = √(n!/(n+α)!)·∫ over the cell of s^(α/2) L_n^(α)(s) e^(−s) ds, for n = 0…N (default N = 40; `--all`: 250);
- the energies E(d₁, d₂) of the smoothed map f_sm for d₁ + 3d₂ ≤ E (default E = 41, 161 values; `--all`: 501, all
  21,168 values), by the article's formula for the energies of f_sm (its appendix on the computations; the
  coefficients χ of the rotation, called `beta` in the script, and the Hermite coefficients of T_cell), in the form of
  `Haagerup.smoothed_energy_eq`, where the factorials are distributed as binomial coefficients.

Each value is compared with its certified interval in `OverlapData.lean`. The method differs from the algorithm
of the article, which Lean runs: there the cell integrals are propagated by three-term recurrences in the Laguerre
index, in interval arithmetic at scale 2⁻¹⁰²⁴; the script expands each Laguerre polynomial in monomials and
integrates them in closed form (incomplete gamma functions, by a series at the top order and a downward
recurrence), checking the result at the lowest order against 1 − e^(−s) and the error function. Unless `--all` is
given (or with `--precision-check`), everything is computed a second time with 192 more bits and the two results
are compared.

Options: `--all`, `--n-mu N`, `--e-max E`, `--jobs J`, `--precision-check`.

*Should print*: `41 of 41` and `161 of 161` values inside their intervals (with `--all`: `251 of 251` and
`21168 of 21168`), the largest interval widths (`8730 / 2^128` for μ and `126 / 2^128` for E with `--all`), and
for instance `mu_0 = 0.770168709770562472651062547744228817`, `E(1, 0) = 0.718322044213912553426076056910239414`.

*Lean*: `Haagerup.Data.tig_mu_ok`, `Haagerup.Data.tcell_rows_ok` (`Haagerup/Data/OverlapData.lean`);
`Haagerup.mem_muTigOf` (`CellOverlapCore.lean`), `Haagerup.smoothedRowsCheck_table_sound` (`CellOverlap.lean`),
`Haagerup.smoothed_energy_eq` (`CellHermite.lean`).

### `05_head.py`: the head of the mixture

*Computes* (interval arithmetic with exact endpoints, from the certified intervals): the six channel series

    h_k = Σ_{d₁+d₂ odd} E(d₁, d₂) · [X^k] ( X^((d₁+d₂−1)/2) · P(X)^d₁ · Q(X)^d₂ ),      k = 0…250,

in the three finite forms of the proposition "Head formulas": channels 0, 1, 5 with the energies of f_sm and
Q = −X, h_k = Σ_{d₁+3d₂≤2k+1} (−1)^d₂ E(d₁, d₂) [X^(k−(d₁+3d₂−1)/2)] P^d₁; channels 3, 4 as
h_k = Σ_n μ_n [X^(k−n)] R^(2n+1); channel 2 as h_k = Σ_m r_m [X^(k−m)] P₂^(2m+1) with r_m = (π/4)·C(2m,m)²/(16^m (m+1))
and 3.14159265358979323846 < π < 3.14159265358979323847. Then H_k = Σ_p w_p h_k^(p), and the quantity of the
computation "Head", |H₀ − c| + Σ_{k=1}^{250} |H_k|, for all values in the intervals, against the head cap. Also, at
the midpoints of the intervals: D₂₅₀ = h₀ − Σ_{k=1}^{250} |h_k| and 1/D₂₅₀ for each channel (the remark
"Cancellation across channels"), and the largest |H_k|.

*Should print*: `1/D_250` = `1.407500`, `1.411619`, `1.566964`, `1.445990`, `1.526136` for channels 0, 1, 3, 4, 5
and `D_250 = -0.760480358130` for channel 2; `H_0 = 0.711974258589983158243587861128`;
`|H_0 - c| <= 9.831582435878e-13`; `sum |H_k| = 6.1578477290589133e-06`;
`|H_0 - c| + sum |H_k| <= 6.1578487122171569e-06`, below the head cap `6.157850e-06` by `1.287782e-12`; the largest
coefficient `H_10 = 2.0117960057e-06`.

*Lean*: `Haagerup.head_sum_ok` (`Haagerup/HeadCheck.lean`), `Haagerup.head_residual_of_fastHeadOK`
(`Haagerup/FastHeadSound.lean`). Lean evaluates the same sums in fixed point at scale 2⁻⁸⁰ with a bound for the
rounding error, so its internal enclosure is slightly wider than the exact one printed here; both leave the
margin of about 1.3·10⁻¹² that the article mentions.

### `06_tails.py`: the Hardy tails (numerical illustration)

*Computes* (floating point, double precision, except where noted). In the article's notation, Γ_p(t) is the
correlation matrix of channel p (M·diag(t·P_p(t²), −t³)·M for p = 0, 1, 5; diag(t·P₂(t²), 0) for p = 2;
diag(−t·R_p(t²), t·R_p(t²)) for p = 3, 4) and Λ_β(Γ) the Schur denominator; the channel function
f_p(t) = Σ_k h_k^(p) t^(2k+1) is holomorphic on |t| < r_reg,p if I ± Re Γ_p(t) are positive definite on the circle
|t| = r_reg,p, and |f_p(t)|² ≤ 1/Λ_{β_p}(Γ_p(t)) where the pair is admissible, whatever the rounding map. The script

1. samples the positivity of I ± Re Γ_p(t) on the disk |t| ≤ r_reg,p (60 radii × 1,440 angles; the smallest
   eigenvalue is found on the boundary circle, as the maximum principle says);
2. computes the mean of 1/Λ over the circle |t| = ϱ_p by the trapezoidal rule (4,096 and 8,192 points) and as the
   article's integral (4/π)∫₀¹ dσ/((1 + σ²)·Λ) over the first-quadrant arc, and compares it with the budget B_p; Λ
   is evaluated from its definition, in the second form through (I ∓ Γ)⁻¹ that the Lean checker uses, and for the
   diagonal matrices of channels 2, 3, 4 from the closed form 16β²·λ_β(γ₁)·λ_β(γ₂); the three agree;
3. compares the partial Parseval sum Σ_{k≤250} (h_k^(p))² ϱ_p^(4k+2), from the certified tables (interval), with
   the mean and with B_p: the full sum is the circle mean of |f_p|²;
4. prints the tail bound √(B_p ϱ_p^(−1006)/(1 − ϱ_p^(−4))) next to τ_p.

The circle mean of |f_p|² itself is not computed directly (it would need the Gaussian integral of the cell maps at
complex correlations); step 3 gives it from below, step 2 bounds it from above.

*Should print*: means of 1/Λ `2.3163625`, `2.2861955`, `2.6601267`, `1.2758698`, `1.2377288`, `3.0931913` for
p = 0…5, between 8% and 34% below the budgets B_p; Parseval sums over the head between `0.32` and `0.62`; tail
bounds from B_p `5.002159e-08`, `4.981372e-08`, `1.785794e-06`, `1.108324e-07`, `3.563738e-19`, `5.761670e-08`,
each at most τ_p.

*Lean*: `Haagerup.reg0_ok` … `reg5_ok` and `Haagerup.mean0_ok` … `mean5_ok` (`Haagerup/ContourChecks/`, Taylor
models, checked by the kernel); `Haagerup.hardy_smoothed_channel_tm`, `hardy_phase_channel_tm`,
`hardy_anti_channel_tm` (`TaylorHardySound.lean`); `Haagerup.hardy_tail` (`Transfer.lean`). The exact comparison
of B_p with τ_p is in 01.

### `07_alternating_sums.py`: the alternating sums and the ceiling

*Computes* (interval arithmetic with exact endpoints): W(h) = Σ_k (−1)^k h_k for each channel as the head sum over
k ≤ 250 (from `common.channel_head`) plus or minus the tail allowance τ_p; the partial sum
S₂₅₀ = Σ_{n≤250} (−1)^n μ_n of the reflected pair and its distance to γ†; the ceiling W(H) = Σ_p w_p W(h^(p)) of
the mixture, both from these enclosures and from the article's three rounded bounds.
These numbers explain the construction; the proof of the main theorem does not use them, and the Lean package
does not state them.

*Should print*: `S_250 = 0.712901574109461445113829`, `S_250 - gamma-dagger = 9.42914331e-04`;
`D_250 = 0.60093809`, `1/D_250 = 1.664064`; W of channels 0, 1, 5 in `[0.711919829934, 0.711919929566]`, below
0.7119200; W of channels 3, 4 in `[0.712901282238531, 0.712901282244531]`; `W(H) < 0.711975480275655`, below the
article's 0.711975481; `c - delta = 0.711968053274152`; `1 / 0.712901282245 = 1.402718756`.

*Lean*: none of these statements; they rest on `Haagerup.Data.tig_mu_ok`, `Haagerup.Data.tcell_rows_ok` and the
tail bounds inside `Haagerup.isBound_cert`.

### `make_figures.py`: the figures

Writes `../../figures/tiger_mu.pdf` (the article's figure: the overlaps μ_n and the alternating partial sums minus
γ†) and `../../figures/tiger_phase.pdf` from the decoded f_tig and the midpoints of `tigMuList`.
`python3 make_figures.py --out DIR` writes elsewhere. Not run by `run_all.sh`.

### `common.py`

The reader of the Lean files (see above), exact enclosures of π (Machin's formula), the exact channel series
(`channel_head`, `mixture_head`; Horner's scheme on integers with a common denominator), and the exact enclosure
of γ† (`gamma_dagger_enclosure`).

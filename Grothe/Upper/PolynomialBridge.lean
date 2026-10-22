import Grothe.Transfer
import Grothe.Upper.Residual
import Grothe.Upper.Final

/-!
# `K_G^ℂ ≤ 500000000000000000/355973576656604491 < 1.404598635371`

**The rounding.**  `F₀` is the two-coordinate Gaussian rounding and `φ` the damped polynomial phase
of `Data.lean` (`|φ| < 1` everywhere).  The rounding is the bounded function

  `T = F₀ · P₃(φ)`,  `P₃(x) = 1 + ix − x²/2 − ix³/6`,

smoothed as `G(x) = 𝔼 T(M x + √(I − M²) Z)`.  The identity `|P₃(x)|² = 1 − x⁴(3 − x²)/36` gives
`|T| ≤ 1` for `|φ| < 1`; `T` keeps charge one and the conjugation symmetry, and a disk-valued
rounding is an average of unit-modulus ones, so its correlation kernel is dominated.

Two energy tables occur, each giving a kernel `Σ_{n,m} E[n,m] p(t)^n (−τ(t))^m =
Σ_j kernelCoeff E j · t^{2j+1}`: `E` of the rounding `T` and `EX` of the truncation `X = F₀ + v`,
`v` the fixed polynomial of degree `≤ 181` of `Data.lean`.  The kernel of `E` is compared with the
linear kernel `c·t`, `c = 1779870886481/(25·10¹¹)`:

* `‖H − H_X‖_𝒜 ≤ Σ |E − E_X| ≤ compareQ = 1065637497/10¹⁵` (hypothesis `compare` and the `ℓ¹`
  contraction of the composition);
* the residual of `H_X` up to degree `501` is at most `headCapQ + energyErrQ`: the interval checker
  certifies (`head_check`, by `native_decide`) that the head of the kernel of the stored energies
  `Ê` is within `headCapQ = 98880/10¹²` of `c·t`, and `E_X` is within `energyErrQ` of `Ê` in `ℓ¹`
  (hypothesis `energy_close`);
* the coefficients of `H` itself beyond degree `501` total at most `tailQ = 36748/10¹²`, by
  Cauchy–Schwarz from the weighted square-sum bound at radius `4149/4000` (hypothesis `hardy`);
* hence `‖H − c·t‖_𝒜 ≤ 600639595509/(5·10¹⁷)` and `K_G^ℂ ≤ 1/(c − 600639595509/(5·10¹⁷))`
  (`transfer`).
-/

namespace Grothe

open Upper GrotheKernel Finset

namespace Upper

/-- The `ℓ¹` distance of the energies of the rounding `T` and of the truncation `X`. -/
def compareQ : ℚ := 1065637497 / 1000000000000000

/-- The bound for the kernel coefficients of the rounding beyond degree `501`. -/
def tailQ : ℚ := 36748 / 1000000000000

/-- The analytic and numerical inputs of the upper bound, for the energy tables `E` of the
rounding `T = F₀ P₃(φ)` and `EX` of its truncation `X = F₀ + v` (`E (n, m)` is the energy of
primary degree `n` and auxiliary degree `m`). -/
structure DirectHyps (E EX : ℕ × ℕ → ℝ) : Prop where
  /-- The kernel `z ↦ Σ_j kernelCoeff E j · z|z|^{2j}` is dominated (it is the correlation kernel
  of the rounding). -/
  valid : DominatedKernel (radialKernel (kernelCoeff E))
  /-- The energies of the rounding are summable. -/
  summable : Summable fun p => |E p|
  /-- The energies of the truncation are summable. -/
  summableX : Summable fun p => |EX p|
  /-- Only odd total degrees occur in the truncation. -/
  parityX : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → EX p = 0
  /-- The energies of the rounding and of its truncation are within `compareQ` in `ℓ¹`. -/
  compare : ∑' p, |E p - EX p| ≤ (compareQ : ℝ)
  /-- The energies of the truncation with `n + 3m ≤ 501` are within `energyErrQ` of the stored
  ones, in `ℓ¹`. -/
  energy_close : ∑ p ∈ headIdx 501, |EX p - (energyTable p : ℝ)| ≤ (energyErrQ : ℝ)
  /-- The weighted square sum of the kernel coefficients of the rounding at radius `4149/4000`
  is at most `7/4`. -/
  hardy : ∀ J, ∑ n ∈ range J, kernelCoeff E n ^ 2 * (4149 / 4000 : ℝ) ^ (2 * (2 * n + 1)) ≤ 7 / 4

end Upper

/-- The residual of the kernel of the truncation up to degree `501`: the head of the kernel of
the stored energies (`head_check`) plus the distance of the energies (`energy_close`). -/
theorem head_le {E EX : ℕ × ℕ → ℝ} (hE : DirectHyps E EX) :
    ∑ j ∈ range 251, |kernelCoeff EX j - if j = 0 then (slopeQ : ℝ) else 0|
      ≤ (headCapQ : ℝ) + energyErrQ := by
  have h1 := head_residual_le primaryPoly auxPoly l1_primaryPoly l1_auxPoly auxPoly_coeff_zero EX
    (fun p => (energyTable p : ℝ)) hE.parityX (N := 501) (K := 251) (by norm_num) (slopeQ : ℝ)
  have h2 : ∑ j ∈ range 251, |∑ p ∈ headIdx 501,
      (energyTable p : ℝ) * (termOf primaryPoly auxPoly p).coeff j
        - if j = 0 then (slopeQ : ℝ) else 0| ≤ headCapQ := head_le_of_check head_check
  have := hE.energy_close
  unfold kernelCoeff
  linarith

/-- The exact comparison `(7/4) · (4000/4149)^{1006} ≤ tailQ² (1 − (4000/4149)⁴)` of the tail. -/
theorem tail_numeric :
    (7 / 4 : ℝ) * (4149 / 4000 : ℝ)⁻¹ ^ (2 * (2 * 251 + 1))
      ≤ (tailQ : ℝ) ^ 2 * (1 - (4149 / 4000 : ℝ)⁻¹ ^ 4) := by
  have hN : (32410953319981359375000000000000000000 * 4000 ^ 1006 : ℕ)
      ≤ 3403782714698914680569 * 4149 ^ 1006 := by
    decide +kernel
  have hR : (32410953319981359375000000000000000000 * 4000 ^ 1006 : ℝ)
      ≤ 3403782714698914680569 * 4149 ^ 1006 := by
    exact_mod_cast hN
  have hb : (0 : ℝ) < 4149 ^ 1006 := by positivity
  rw [show 2 * (2 * 251 + 1) = 1006 by norm_num,
    show (4149 / 4000 : ℝ)⁻¹ = 4000 / 4149 by norm_num, div_pow]
  generalize (4000 : ℝ) ^ 1006 = a at hR ⊢
  generalize (4149 : ℝ) ^ 1006 = b at hR hb ⊢
  rw [show (7 / 4 : ℝ) * (a / b) = 7 * a / (4 * b) by ring, div_le_iff₀ (by positivity)]
  norm_num [tailQ]
  linarith

/-- The kernel of the rounding beyond degree `501`. -/
theorem tail_le {E EX : ℕ × ℕ → ℝ} (hE : DirectHyps E EX) :
    ∑' n, |kernelCoeff E (n + 251)| ≤ (tailQ : ℝ) :=
  hardy_tail _ _ (by norm_num) _ hE.hardy 251 _ (by norm_num [tailQ]) tail_numeric

/-- **Main theorem.**  `K_G^ℂ ≤ 500000000000000000/355973576656604491 < 1.404598635371`.

Hypotheses (`hE : DirectHyps E EX`), for the tables `E` of the rounding `T = F₀ P₃(φ)` and `EX`
of the truncation `X = F₀ + v`:

* `valid` (mathematical lemma): `z ↦ Σ_j kernelCoeff E j · z|z|^{2j}` is a dominated kernel, i.e.
  it is the correlation kernel of the smoothed rounding (`|T| ≤ 1` from
  `|P₃(x)|² = 1 − x⁴(3 − x²)/36` and `|φ| < 1`), the correlations `p` and `−τ` of `Data.lean` being realised by
  tensor powers (any two odd preprocessors of Wiener norm `≤ 1` are admissible, `Realise.lean`;
  they are independent of the rounding and its energies).  The index shift `⌊n/2⌋ + ⌊m/2⌋` of `kernelCoeff` is the true kernel only when
  `E` vanishes on even `n + m` (charge one); this parity of `E` is part of what `valid` asserts;
* `summable`, `summableX`, `parityX` (mathematical lemmas): the two tables are summable
  (Parseval) and `EX (n, m) = 0` for `n + m` even;
* `compare`: `Σ |E − EX| ≤ 1065637497/10¹⁵`; the source proves `1.06563749615·10⁻⁶`.  The
  energy-difference inequality (Cauchy–Schwarz within each total degree, contraction of the
  smoothing, the mixed-cutoff lemma applied to `T − X`) with *numerical enclosures*: the
  coefficients of `F₀` (directed Arb quadrature), those of `(iφ)^j F₀`, `j = 1, 2, 3`, through the
  Hermite cutoffs `181`, `91`, `51`, their omitted tails, the exact norm `‖v‖ < 1/100` of the
  frozen correction and the cover certifying `|φ| < 1`.  No exponential comparison occurs: the
  rounding is `T` itself;
* `energy_close`: `Σ_{n+3m ≤ 501} |EX (n, m) − Ê (n, m)| ≤ energyErrQ ≈ 1.3694·10⁻¹¹`, where `Ê` is
  the stored table (`energyTable`, binary64 numbers read as exact rationals).  A *numerical
  enclosure*: the error budget of the source computation of the coefficients of `F₀` and of the
  binary64 addition of `v`;
* `hardy`: `Σ_j (kernelCoeff E j)² (4149/4000)^{2(2j+1)} ≤ 7/4`.  The Parseval form of a
  mean-square bound for the kernel of the rounding on the circle `|t| = 4149/4000`: a
  *mathematical lemma* (the Gaussian Schur estimate, valid for any bounded measurable rounding,
  and the holomorphic continuation of the Gaussian correlation) and a *numerical enclosure*: the
  contour certificate (65 596 arcs, Arb ball arithmetic), giving the mean `1.69818 < 7/4`.

What is proved here: the kernel of the stored table is within `headCapQ` of `c·t` up to degree
`501` (`head_check`, the interval computation); the passage from tables to kernels (`ℓ¹`
contraction, locality of the head, Cauchy–Schwarz tail); and the assembly

  `1065637497/10¹⁵ + 98880/10¹² + 6847009/(5·10¹⁷) + 36748/10¹² = 600639595509/(5·10¹⁷)`.

Of the total residual, the assumed comparison bound is 88.71 %, the computation verified here
8.23 %, the tail bound from `hardy` 3.06 %, and the assumed energy-table error 0.001 %.  The
transfer inequality gives the constant. -/
theorem fresh_upper (E EX : ℕ × ℕ → ℝ) (hE : DirectHyps E EX) :
    IsGrothendieckBound (500000000000000000 / 355973576656604491) := by
  have hs := summable_kernelCoeff hE.summable
  have hd := summable_abs_sub hE.summable hE.summableX
  have e : ∀ n, kernelCoeff E n - kernelCoeff EX n = kernelCoeff (fun p => E p - EX p) n :=
    fun n => (kernelCoeff_sub hE.summable hE.summableX n).symm
  have hsd : Summable fun n => |kernelCoeff E n - kernelCoeff EX n| := by
    simpa only [e] using summable_kernelCoeff hd
  have hc : ∑' n, |kernelCoeff E n - kernelCoeff EX n| ≤ (compareQ : ℝ) := by
    simp only [e]
    exact (tsum_abs_bivarKernel_le _ _ l1_primaryPoly l1_auxPoly _ hd).trans hE.compare
  have hcf : ∑ n ∈ range 251, |kernelCoeff E n - kernelCoeff EX n| ≤ (compareQ : ℝ) :=
    (hsd.sum_le_tsum (range 251) fun n _ => abs_nonneg _).trans hc
  have hh : ∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0|
      ≤ (compareQ : ℝ) + ((headCapQ : ℝ) + energyErrQ) := by
    calc _ ≤ ∑ j ∈ range 251, (|kernelCoeff E j - kernelCoeff EX j| +
        |kernelCoeff EX j - if j = 0 then (slopeQ : ℝ) else 0|) :=
          sum_le_sum fun j _ => abs_sub_le _ _ _
      _ = _ := sum_add_distrib
      _ ≤ _ := add_le_add hcf (head_le hE)
  have hr : |kernelCoeff E 0 - (slopeQ : ℝ)| + ∑' n, |kernelCoeff E (n + 1)|
      ≤ 600639595509 / 500000000000000000 := by
    rw [residual_split (kernelCoeff E) hs (slopeQ : ℝ) 250]
    have h := add_le_add hh (tail_le hE)
    have e2 : (compareQ : ℝ) + ((headCapQ : ℝ) + energyErrQ) + tailQ
        = 600639595509 / 500000000000000000 := by
      norm_num [compareQ, headCapQ, energyErrQ, tailQ]
    linarith
  refine (transfer (kernelCoeff E) hs hE.valid (by norm_num [slopeQ]) hr).mono (le_of_eq ?_)
  norm_num [slopeQ]

/-- The certified bound is below `1.404598635371`. -/
theorem upper_value_lt :
    (500000000000000000 / 355973576656604491 : ℝ) < 1.404598635371 := by norm_num

end Grothe

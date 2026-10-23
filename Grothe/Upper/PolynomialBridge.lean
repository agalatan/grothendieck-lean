import Grothe.Transfer
import Grothe.Upper.Residual
import Grothe.Upper.Final

/-!
# `K_G^ℂ ≤ 500000000000000000/355973579786182891 < 1.404598623023`

**The rounding.**  `F₀` is the two-coordinate Gaussian rounding and `φ` the damped polynomial phase
of `Data.lean` (`φ² ≤ 3` everywhere).  The rounding is the bounded function

  `T = F₀ · P₃(φ)`,  `P₃(x) = 1 + ix − x²/2 − ix³/6`,

smoothed as `G(x) = 𝔼 T(M x + √(I − M²) Z)`.  The identity `|P₃(x)|² = 1 − x⁴(3 − x²)/36` gives
`|T| ≤ 1` for `φ² ≤ 3`; `T` keeps charge one and the conjugation symmetry, and a disk-valued
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
* the same finite-head bound forces `h₀ ≥ slopeQ − headResidualQ`. Deducting `h₀²r²` from
  the weighted square budget `7/4` at radius `r = 4149/4000` bounds the coefficients beyond
  degree `501` by `tailQ = 19055527/625000000000000`; no stronger Hardy hypothesis is used;
* hence `‖H − c·t‖_𝒜 ≤ 597510017109/(5·10¹⁷)` and `K_G^ℂ ≤ 1/(c − 597510017109/(5·10¹⁷))`
  (`transfer`).
-/

namespace Grothe

open Upper GrotheKernel Finset

namespace Upper

/-- The `ℓ¹` distance of the energies of the rounding `T` and of the truncation `X`. -/
def compareQ : ℚ := 1065637497 / 1000000000000000

/-- The existing comparison and head errors, before the infinite tail. -/
def headResidualQ : ℚ := compareQ + headCapQ + energyErrQ

/-- The positive linear lower bound derived from the existing head residual. -/
def linearLowerQ : ℚ := slopeQ - headResidualQ

/-- The Hardy budget after removing the linear coefficient and shifting the radial index. -/
def shiftedBudgetQ : ℚ :=
  (7 / 4 - linearLowerQ ^ 2 * (4149 / 4000) ^ 2) / (4149 / 4000) ^ 4

/-- The refined bound for the kernel coefficients beyond degree `501`. -/
def tailQ : ℚ := 19055527 / 625000000000000

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

/-- The same hypotheses used by `fresh_upper` bound the complete finite head. -/
theorem head_residual_le {E EX : ℕ × ℕ → ℝ} (hE : DirectHyps E EX) :
    ∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0|
      ≤ (headResidualQ : ℝ) := by
  have hd := summable_abs_sub hE.summable hE.summableX
  have e : ∀ n, kernelCoeff E n - kernelCoeff EX n =
      kernelCoeff (fun p => E p - EX p) n :=
    fun n => (kernelCoeff_sub hE.summable hE.summableX n).symm
  have hsd : Summable fun n => |kernelCoeff E n - kernelCoeff EX n| := by
    simpa only [e] using summable_kernelCoeff hd
  have hc : ∑' n, |kernelCoeff E n - kernelCoeff EX n| ≤ (compareQ : ℝ) := by
    simp only [e]
    exact (tsum_abs_bivarKernel_le _ _ l1_primaryPoly l1_auxPoly _ hd).trans hE.compare
  have hcf : ∑ n ∈ range 251, |kernelCoeff E n - kernelCoeff EX n| ≤ (compareQ : ℝ) :=
    (hsd.sum_le_tsum (range 251) fun n _ => abs_nonneg _).trans hc
  calc _ ≤ ∑ j ∈ range 251, (|kernelCoeff E j - kernelCoeff EX j| +
        |kernelCoeff EX j - if j = 0 then (slopeQ : ℝ) else 0|) :=
          sum_le_sum fun j _ => abs_sub_le _ _ _
    _ = _ := sum_add_distrib
    _ ≤ (compareQ : ℝ) + ((headCapQ : ℝ) + energyErrQ) :=
      add_le_add hcf (Grothe.head_le hE)
    _ = (headResidualQ : ℝ) := by norm_num [headResidualQ]; ring

/-- In particular, the linear coefficient already consumes part of the Hardy budget. -/
theorem linear_lower {E EX : ℕ × ℕ → ℝ} (hE : DirectHyps E EX) :
    (linearLowerQ : ℝ) ≤ kernelCoeff E 0 := by
  have hh := head_residual_le hE
  have hz : |kernelCoeff E 0 - (slopeQ : ℝ)| ≤
      ∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0| := by
    simpa using (single_le_sum (fun j (_ : j ∈ range 251) =>
      abs_nonneg (kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0))
      (show 0 ∈ range 251 by simp))
  have ha := (abs_le.mp (hz.trans hh)).1
  norm_num [linearLowerQ] at ⊢
  linarith

/-- An exact integer check, elaborated into a kernel proof, gives the improved tail cap. -/
theorem tail_numeric :
    (shiftedBudgetQ : ℝ) * (4149 / 4000 : ℝ)⁻¹ ^ (2 * (2 * 250 + 1))
      ≤ (tailQ : ℝ) ^ 2 * (1 - (4149 / 4000 : ℝ)⁻¹ ^ 4) := by
  have hN : (120466616071567034739418795803669547412017975 * 4000 ^ 1002 : ℕ)
      ≤ 14643885483565936271617911329 * 4149 ^ 1002 := by
    decide +kernel
  have hR : (120466616071567034739418795803669547412017975 * 4000 ^ 1002 : ℝ)
      ≤ 14643885483565936271617911329 * 4149 ^ 1002 := by
    exact_mod_cast hN
  have hb : (0 : ℝ) < 4149 ^ 1002 := by positivity
  rw [show 2 * (2 * 250 + 1) = 1002 by norm_num,
    show (4149 / 4000 : ℝ)⁻¹ = 4000 / 4149 by norm_num, div_pow]
  generalize (4000 : ℝ) ^ 1002 = a at hR ⊢
  generalize (4149 : ℝ) ^ 1002 = b at hR hb ⊢
  norm_num [shiftedBudgetQ, linearLowerQ, headResidualQ, compareQ, headCapQ,
    energyErrQ, slopeQ, tailQ]
  rw [← mul_div_assoc, div_le_iff₀ hb]
  linarith

/-- The sharper tail follows from the original Hardy and head hypotheses together. -/
theorem tail_le {E EX : ℕ × ℕ → ℝ} (hE : DirectHyps E EX) :
    ∑' n, |kernelCoeff E (n + 251)| ≤ (tailQ : ℝ) := by
  have hs := hardy_budget_after_linear (kernelCoeff E) (4149 / 4000 : ℝ) (7 / 4)
    (linearLowerQ : ℝ) (by norm_num)
    (by norm_num [linearLowerQ, headResidualQ, compareQ, headCapQ, energyErrQ, slopeQ])
    (linear_lower hE) hE.hardy
  have hb : ∀ J, ∑ n ∈ range J, kernelCoeff E (n + 1) ^ 2 *
      (4149 / 4000 : ℝ) ^ (2 * (2 * n + 1)) ≤ (shiftedBudgetQ : ℝ) := by
    intro J
    simpa only [shiftedBudgetQ, Rat.cast_div, Rat.cast_sub, Rat.cast_pow, Rat.cast_ofNat,
      Rat.cast_mul] using hs J
  have ht := hardy_tail (fun n => kernelCoeff E (n + 1)) (4149 / 4000 : ℝ)
    (by norm_num) (shiftedBudgetQ : ℝ) hb 250 (tailQ : ℝ)
    (by norm_num [tailQ]) tail_numeric
  simpa only [Nat.add_assoc, show 250 + 1 = 251 by norm_num] using ht

/-- **Main theorem.**  `K_G^ℂ ≤ 500000000000000000/355973579786182891 < 1.404598623023`.

Hypotheses (`hE : DirectHyps E EX`), for the tables `E` of the rounding `T = F₀ P₃(φ)` and `EX`
of the truncation `X = F₀ + v`:

* `valid` (mathematical lemma): `z ↦ Σ_j kernelCoeff E j · z|z|^{2j}` is a dominated kernel, i.e.
  it is the correlation kernel of the smoothed rounding (`|T| ≤ 1` from
  `|P₃(x)|² = 1 − x⁴(3 − x²)/36` and `φ² ≤ 3`), the correlations `p` and `−τ` of `Data.lean` being realised by
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
  frozen correction and the cover certifying `φ² ≤ 3`.  No exponential comparison occurs: the
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

  `1065637497/10¹⁵ + 98880/10¹² + 6847009/(5·10¹⁷) + 19055527/625000000000000 = 597510017109/(5·10¹⁷)`.

The tail calculation deducts the linear energy already forced by the same head inputs.
The three numerical premises and the rounding remain unchanged; the transfer inequality gives
the smaller constant. -/
theorem fresh_upper (E EX : ℕ × ℕ → ℝ) (hE : DirectHyps E EX) :
    IsGrothendieckBound (500000000000000000 / 355973579786182891) := by
  have hs := summable_kernelCoeff hE.summable
  have hr : |kernelCoeff E 0 - (slopeQ : ℝ)| + ∑' n, |kernelCoeff E (n + 1)|
      ≤ 597510017109 / 500000000000000000 := by
    rw [residual_split (kernelCoeff E) hs (slopeQ : ℝ) 250]
    have h := add_le_add (head_residual_le hE) (tail_le hE)
    have e : (headResidualQ : ℝ) + tailQ =
        597510017109 / 500000000000000000 := by
      norm_num [headResidualQ, compareQ, headCapQ, energyErrQ, tailQ]
    linarith
  refine (transfer (kernelCoeff E) hs hE.valid (by norm_num [slopeQ]) hr).mono (le_of_eq ?_)
  norm_num [slopeQ]

/-- The new exact upper endpoint is below the stated decimal. -/
theorem upper_value_lt :
    (500000000000000000 / 355973579786182891 : ℝ) < 1.404598623023 := by norm_num

/-- This endpoint is strictly smaller than the previous one. -/
theorem upper_value_improves :
    (500000000000000000 / 355973579786182891 : ℝ) <
      500000000000000000 / 355973576656604491 := by norm_num

end Grothe

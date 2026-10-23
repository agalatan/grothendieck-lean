import Grothe.Transfer
import Grothe.Upper.Residual
import Grothe.Upper.HeadWeight
import Grothe.Upper.ComparisonData

/-!
# Weighted selected-spectrum upper certificate

Under the explicit Gaussian inputs,
`K_G^ℂ ≤ 500000000000000000/355973696735190991 < 1.404598161566`.

Only the blocks `headIdx 501` can enter the kernel head, and each is priced
by its retained coefficient cost. Their comparison
allowance is `compareQ = 13311891/15625000000000`; the concrete theorem
obtains it from spectrally supported error pieces in `LocalizedComparison`.
The finite table head remains checked by `head_check` against the same slope
and `headCapQ`. Table accuracy and the actual rounding's Hardy tail then give
residual `458437859009/(5·10¹⁷)`. No comparison of the infinite table tails is
used in this assembly. The raw rounding and its polynomial preprocessors are
unchanged. All coefficient costs are proved from the preprocessors. The unchanged inherited
Gaussian component-error and Hardy inputs are
identified in `data/localized-comparison/PROOF.md`.
-/

namespace Grothe

open Upper GrotheKernel Finset

namespace Upper

/-- The bound for the kernel coefficients of the rounding beyond degree `501`. -/
def tailQ : ℚ := 36748 / 1000000000000

/-- The upper inputs for the energy tables of the smoothed rounding and
the correspondingly smoothed truncation of `F₀ + v`. -/
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
  /-- Even total degrees vanish in the actual rounding. -/
  parity : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → E p = 0
  /-- Only the selected blocks of the head need to be compared. -/
  compare : ∑ p ∈ headIdx 501, comparisonWeight p * |E p - EX p| ≤ (compareQ : ℝ)
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

/-- The complete upper bound from a weighted finite selected-block comparison. Its
concrete Gaussian wrapper derives this comparison from the component-error
inputs and native band-mass check. The other numerical inputs are the stored
energy-table accuracy and the actual kernel's Hardy bound. The finite head
is checked natively; all transfer and endpoint arithmetic are proved here. -/
theorem fresh_upper (E EX : ℕ × ℕ → ℝ) (hE : DirectHyps E EX) :
    IsGrothendieckBound (500000000000000000 / 355973696735190991) := by
  have hs := summable_kernelCoeff hE.summable
  have hloc := head_residual_le_weighted primaryPoly auxPoly auxPoly_coeff_zero
    E EX hE.parity (N := 501) (K := 251) (by norm_num) (slopeQ : ℝ) comparisonWeight
    (fun p _ => comparisonWeight_sound p)
  have heq : (∑ j ∈ range 251,
      |∑ p ∈ headIdx 501, EX p * (termOf primaryPoly auxPoly p).coeff j -
        if j = 0 then (slopeQ : ℝ) else 0|) =
      ∑ j ∈ range 251, |kernelCoeff EX j - if j = 0 then (slopeQ : ℝ) else 0| := by
    refine sum_congr rfl fun j hj => ?_
    rw [show kernelCoeff EX j = ∑ p ∈ headIdx 501,
      EX p * (termOf primaryPoly auxPoly p).coeff j from
      bivarKernel_eq_head primaryPoly auxPoly auxPoly_coeff_zero EX hE.parityX
        (by have := mem_range.1 hj; omega)]
  rw [heq] at hloc
  have hh : ∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0|
      ≤ (compareQ : ℝ) + ((headCapQ : ℝ) + energyErrQ) := by
    have h := hloc.trans (add_le_add (head_le hE) hE.compare)
    change (∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0|)
      ≤ (headCapQ : ℝ) + energyErrQ + compareQ at h
    linarith
  have hr : |kernelCoeff E 0 - (slopeQ : ℝ)| + ∑' n, |kernelCoeff E (n + 1)|
      ≤ 458437859009 / 500000000000000000 := by
    rw [residual_split (kernelCoeff E) hs (slopeQ : ℝ) 250]
    have h := add_le_add hh (tail_le hE)
    have e2 : (compareQ : ℝ) + ((headCapQ : ℝ) + energyErrQ) + tailQ
        = 458437859009 / 500000000000000000 := by
      norm_num [compareQ, headCapQ, energyErrQ, tailQ]
    linarith
  refine (transfer (kernelCoeff E) hs hE.valid (by norm_num [slopeQ]) hr).mono (le_of_eq ?_)
  norm_num [slopeQ]

/-- The certified bound is below `1.404598161566`. -/
theorem upper_value_lt :
    (500000000000000000 / 355973696735190991 : ℝ) < 1.404598161566 := by norm_num

end Grothe

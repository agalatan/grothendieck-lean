import Grothe.Transfer
import Grothe.Upper.Residual
import Grothe.Upper.HeadWeight
import Grothe.Upper.ComparisonData

/-!
# Weighted selected-spectrum upper bound with a linear Hardy-budget deduction

The head residual and the tail of the sharp upper bound under the explicit Gaussian inputs (the bound itself, with
the grouped comparison, is `fresh_upper` in `GroupedBridge.lean`).

Only the blocks `headIdx 501` can enter the kernel head. Each block retains
its proved coefficient cost. The resulting comparison
allowance is `compareQ = 106490963/125000000000000`; the concrete theorem
obtains it from the component-error inputs in `LocalizedComparison`.
The checked finite head and table accuracy force the linear coefficient to
be at least `linearLowerQ`. Its weighted square is deducted from the same
Hardy budget `7/4`, giving tail `30488839/10¹⁵` and total residual
`455291618509/(5·10¹⁷)`. No comparison of infinite table tails or stronger
Hardy hypothesis is used. The raw rounding and preprocessors are unchanged.
The remaining Gaussian inputs are explicit in `DirectHyps` and in the
concrete `ComparisonInputs` wrapper.
-/

namespace Grothe

open Upper GrotheKernel Finset

namespace Upper

/-- The existing comparison and head errors, before the infinite tail. -/
def headResidualQ : ℚ := compareQ + headCapQ + energyErrQ

/-- The positive linear lower bound derived from the existing head residual. -/
def linearLowerQ : ℚ := slopeQ - headResidualQ

/-- The Hardy budget after removing the linear coefficient and shifting the radial index. -/
def shiftedBudgetQ : ℚ :=
  (7 / 4 - linearLowerQ ^ 2 * (4149 / 4000) ^ 2) / (4149 / 4000) ^ 4

/-- The refined bound for the kernel coefficients beyond degree `501`. -/
def tailQ : ℚ := 30488839 / 1000000000000000

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

/-- The same hypotheses used by `fresh_upper` bound the complete finite head. -/
theorem head_residual_le {E EX : ℕ × ℕ → ℝ} (hE : DirectHyps E EX) :
    ∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0|
      ≤ (headResidualQ : ℝ) := by
  have hloc := Upper.head_residual_le_weighted primaryPoly auxPoly auxPoly_coeff_zero
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
  have h := hloc.trans (add_le_add (Grothe.head_le hE) hE.compare)
  change (∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0|)
    ≤ (headCapQ : ℝ) + energyErrQ + compareQ at h
  calc _ ≤ (headCapQ : ℝ) + energyErrQ + compareQ := h
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
  have hN : (308394442958532133083118700595891757420014016 * 4000 ^ 1002 : ℕ)
      ≤ 37488336509491942652785364321 * 4149 ^ 1002 := by
    decide +kernel
  have hR : (308394442958532133083118700595891757420014016 * 4000 ^ 1002 : ℝ)
      ≤ 37488336509491942652785364321 * 4149 ^ 1002 := by
    exact_mod_cast hN
  have ha : (0 : ℝ) ≤ 4000 ^ 1002 := by positivity
  have hb : (0 : ℝ) < 4149 ^ 1002 := by positivity
  rw [show 2 * (2 * 250 + 1) = 1002 by norm_num,
    show (4149 / 4000 : ℝ)⁻¹ = 4000 / 4149 by norm_num, div_pow]
  generalize (4000 : ℝ) ^ 1002 = a at hR ha ⊢
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


end Grothe

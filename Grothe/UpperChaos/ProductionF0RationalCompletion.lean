import Grothe.UpperChaos.ProductionF0Reconstruction
import Grothe.UpperChaos.RationalSqrtFloor
import Grothe.Upper.CompositeComparisonData

/-! A constructive rational reference for the retained F0 coefficients.
Only the canonical input is numerical. Reflection uses integer square-root
rounding and exact rational multiplication. Its error follows uniformly from
the actual source norm; no IEEE square-root, multiplication, or separately
computed saved-mass premise is required. The output table must still be
certified for THIS reference family. Agent-ID: codex-7c2e. -/

set_option warningAsError true
open MeasureTheory Finset

namespace Grothe.UpperChaos.FixedChaosSmoothing
noncomputable section

private def canonicalVector (a : ℕ → ℕ × ℕ → ℂ) : EuclideanSpace ℂ (GradedIdx 251) :=
  tensorVector fun q i => if i.1 ≤ i.2 + 1 then a q i else 0

private theorem norm_canonicalVector_sq (a : ℕ → ℕ × ℕ → ℂ) :
    ‖canonicalVector a‖ ^ 2 =
      ∑ q ∈ range 251, ∑ i ∈ CanonicalReconstructionNorm.canonical q, ‖a q i‖ ^ 2 := by
  rw [canonicalVector, norm_tensorVector_sq]
  simp only [CanonicalReconstructionNorm.canonical, sum_filter]
  apply sum_congr rfl
  intro q _
  apply sum_congr rfl
  intro i _
  by_cases hi : i.1 ≤ i.2 + 1 <;> simp [hi]

private theorem norm_canonicalVector_le (a : ℕ → ℕ × ℕ → ℂ) :
    ‖canonicalVector a‖ ≤ ‖tensorVector a‖ := by
  apply (sq_le_sq₀ (norm_nonneg _) (norm_nonneg _)).mp
  rw [norm_canonicalVector_sq, norm_tensorVector_sq]
  apply sum_le_sum
  intro q _
  apply sum_le_sum_of_subset_of_nonneg
  · exact filter_subset _ _
  · intro i _ _
    exact sq_nonneg _

private theorem norm_actual_tensor_le_one :
    ‖tensorVector (fun q i => baseGradedCoefficient q i.1 i.2)‖ ≤ 1 := by
  have hz : gradedHermite 251 (fun _ _ _ => (0 : ℚ)) = 0 := by
    simp [gradedHermite, gradedHermiteCoeff, hermiteFinite]
  have hs := norm_productionF0Head_sub_sq (fun _ _ _ => (0 : ℚ))
  rw [hz, sub_zero] at hs
  simp only [Rat.cast_zero, sub_zero] at hs
  have hv : ‖tensorVector (fun q i => baseGradedCoefficient q i.1 i.2)‖ =
      ‖productionF0Head‖ := by
    apply (sq_eq_sq₀ (norm_nonneg _) (norm_nonneg _)).mp
    rw [norm_tensorVector_sq, hs]
    simp only [CanonicalReconstructionNorm.grade, sum_product]
  exact hv.trans_le productionF0Head_norm

/-- The coupled norm of canonical rational centers follows from their actual
Gaussian error and the norm of F0. No independent saved-mass check is needed. -/
private theorem canonical_center_norm_le (g : ℕ → ℕ → ℕ → ℚ) :
    ‖canonicalVector (fun q i => (g q i.1 i.2 : ℂ))‖ ≤
      1 + canonicalTensorErrorNorm g := by
  let t : ℕ → ℕ × ℕ → ℂ := fun q i => baseGradedCoefficient q i.1 i.2
  let a : ℕ → ℕ × ℕ → ℂ := fun q i => (g q i.1 i.2 : ℂ)
  have ht : ‖canonicalVector t‖ ≤ 1 :=
    (norm_canonicalVector_le t).trans norm_actual_tensor_le_one
  have he : ‖canonicalVector (fun q i => t q i - a q i)‖ =
      canonicalTensorErrorNorm g := by
    have hsq : ‖canonicalVector (fun q i => t q i - a q i)‖ ^ 2 =
        canonicalTensorErrorNorm g ^ 2 := by
      rw [norm_canonicalVector_sq, canonicalTensorErrorNorm, Real.sq_sqrt (by positivity)]
    have hcan : 0 ≤ canonicalTensorErrorNorm g := Real.sqrt_nonneg _
    exact (sq_eq_sq₀ (norm_nonneg _) hcan).mp hsq
  have hsplit : canonicalVector a =
      canonicalVector t - canonicalVector (fun q i => t q i - a q i) := by
    ext i
    change (if i.2.1.val ≤ i.2.2.val + 1 then a i.1 (i.2.1, i.2.2) else 0) = _
    by_cases hi : i.2.1.val ≤ i.2.2.val + 1
    · simp [canonicalVector, tensorVector, hi]
    · simp [canonicalVector, tensorVector, hi]
  rw [hsplit]
  exact (norm_sub_le _ _).trans (add_le_add ht he.le)

/-- Exact rational reference completion; it does not reproduce an archived
floating multiplication. The original floating family remains separate. -/
def rationalTensorCompletion (S : ℕ) (g : ℕ → ℕ → ℕ → ℚ) (q c d : ℕ) : ℚ :=
  if c ≤ d + 1 then g q c d else
    RationalSqrtFloor.sqrtFloor (d + 1) c S * g q (d + 1) (c - 1)

theorem canonical_error_rationalTensorCompletion (S : ℕ) (g : ℕ → ℕ → ℕ → ℚ) :
    canonicalTensorErrorNorm (rationalTensorCompletion S g) = canonicalTensorErrorNorm g := by
  unfold canonicalTensorErrorNorm
  apply congrArg Real.sqrt
  apply sum_congr rfl
  intro q _
  apply sum_congr rfl
  intro i hi
  have hc := (CanonicalReconstructionNorm.mem_canonical.mp hi).2.2
  simp only [rationalTensorCompletion, ite_eq_left hc]

private theorem factor_floor_error_le (S : ℕ) (hS : 0 < S)
    {q : ℕ} {i : ℕ × ℕ} (hi : i ∈ CanonicalReconstructionNorm.reflected q) :
    ‖CanonicalReconstructionNorm.factor i -
      (RationalSqrtFloor.sqrtFloor (i.2 + 1) i.1 S : ℝ)‖ ≤ 1 / (S : ℝ) := by
  have hc : 0 < i.1 := by
    have := (CanonicalReconstructionNorm.mem_reflected.mp hi).2.2
    omega
  apply RationalSqrtFloor.norm_sub_sqrtFloor_le (i.2 + 1) i.1 S hc hS
    (CanonicalReconstructionNorm.factor i) (Real.sqrt_nonneg _)
  simp only [CanonicalReconstructionNorm.factor, Nat.cast_add, Nat.cast_one]
  rw [Real.sq_sqrt (by positivity)]

private theorem partner_center_energy_le (g : ℕ → ℕ → ℕ → ℚ) (q : ℕ) :
    (∑ i ∈ CanonicalReconstructionNorm.reflected q,
      (g q (i.2 + 1) (i.1 - 1) : ℝ) ^ 2) ≤
        ∑ i ∈ CanonicalReconstructionNorm.canonical q, (g q i.1 i.2 : ℝ) ^ 2 := by
  calc
    _ = ∑ i ∈ (CanonicalReconstructionNorm.reflected q).image
        CanonicalReconstructionNorm.partner, (g q i.1 i.2 : ℝ) ^ 2 := by
      rw [sum_image (CanonicalReconstructionNorm.partner_injective_on_reflected q)]
      simp only [CanonicalReconstructionNorm.partner]
    _ ≤ _ := by
      apply sum_le_sum_of_subset_of_nonneg
      · intro i hi
        obtain ⟨j, hj, rfl⟩ := mem_image.mp hi
        exact CanonicalReconstructionNorm.partner_mem_canonical hj
      · intro i _ _
        exact sq_nonneg _

/-- A uniform, count-free rounding bound for the constructive completion. -/
theorem rationalTensorCompletion_defect_le (S : ℕ) (hS : 0 < S)
    (g : ℕ → ℕ → ℕ → ℚ) :
    tensorCompletionDefectNorm (rationalTensorCompletion S g) ≤
      (1 / (S : ℝ)) * (1 + canonicalTensorErrorNorm g) := by
  let η : ℝ := 1 / (S : ℝ)
  have hη : 0 ≤ η := by dsimp [η]; positivity
  have hsum : tensorCompletionDefectNorm (rationalTensorCompletion S g) ^ 2 ≤
      η ^ 2 * ‖canonicalVector (fun q i => (g q i.1 i.2 : ℂ))‖ ^ 2 := by
    rw [tensorCompletionDefectNorm_sq, norm_canonicalVector_sq]
    simp only [Complex.norm_ratCast, sq_abs]
    rw [mul_sum]
    apply sum_le_sum
    intro q _
    calc
      _ ≤ ∑ i ∈ CanonicalReconstructionNorm.reflected q,
          η ^ 2 * (g q (i.2 + 1) (i.1 - 1) : ℝ) ^ 2 := by
        apply sum_le_sum
        intro i hi
        have hr := (CanonicalReconstructionNorm.mem_reflected.mp hi).2.2
        have hp : i.2 + 1 ≤ i.1 - 1 + 1 := by omega
        have hn : ¬ i.1 ≤ i.2 + 1 := by omega
        have he := factor_floor_error_le S hS hi
        have hs : (CanonicalReconstructionNorm.factor i -
            (RationalSqrtFloor.sqrtFloor (i.2 + 1) i.1 S : ℝ)) ^ 2 ≤ η ^ 2 := by
          simpa only [Real.norm_eq_abs, sq_abs] using
            pow_le_pow_left₀ (norm_nonneg _) he 2
        simp only [rationalTensorCompletion, ite_eq_left hp, ite_eq_right hn, Rat.cast_mul]
        have halgebra : CanonicalReconstructionNorm.factor i *
            (g q (i.2 + 1) (i.1 - 1) : ℝ) -
              (RationalSqrtFloor.sqrtFloor (i.2 + 1) i.1 S : ℝ) *
                (g q (i.2 + 1) (i.1 - 1) : ℝ) =
            (CanonicalReconstructionNorm.factor i -
              (RationalSqrtFloor.sqrtFloor (i.2 + 1) i.1 S : ℝ)) *
                (g q (i.2 + 1) (i.1 - 1) : ℝ) := by ring
        rw [halgebra, mul_pow]
        exact mul_le_mul_of_nonneg_right hs (sq_nonneg _)
      _ = η ^ 2 * ∑ i ∈ CanonicalReconstructionNorm.reflected q,
          (g q (i.2 + 1) (i.1 - 1) : ℝ) ^ 2 := (mul_sum _ _ _).symm
      _ ≤ _ := mul_le_mul_of_nonneg_left (partner_center_energy_le g q) (sq_nonneg η)
  have hn : tensorCompletionDefectNorm (rationalTensorCompletion S g) ≤
      η * ‖canonicalVector (fun q i => (g q i.1 i.2 : ℂ))‖ := by
    have hsq : tensorCompletionDefectNorm (rationalTensorCompletion S g) ^ 2 ≤
        (η * ‖canonicalVector (fun q i => (g q i.1 i.2 : ℂ))‖) ^ 2 := by
      simpa only [mul_pow] using hsum
    have hdef : 0 ≤ tensorCompletionDefectNorm (rationalTensorCompletion S g) :=
      norm_nonneg _
    exact (sq_le_sq₀ hdef (mul_nonneg hη (norm_nonneg _))).mp hsq
  exact hn.trans (mul_le_mul_of_nonneg_left (canonical_center_norm_le g) hη)

/-- A fixed computable reference, with universal square-root error 2^-54. -/
def dyadicTensorReference (g : ℕ → ℕ → ℕ → ℚ) : ℕ → ℕ → ℕ → ℚ :=
  rationalTensorCompletion (2 ^ 54) g

/-- A 6.6e-9 actual canonical TENSOR certificate suffices for the 9.5e-9
raw-source contract. This is not the conditional-node, pre-primary error. -/
theorem raw_error_of_dyadicTensorReference (g : ℕ → ℕ → ℕ → ℚ)
    (hcanonical : canonicalTensorErrorNorm g ≤ (66 / 10 ^ 10 : ℝ)) :
    ‖productionF0Head - gradedHermite 251 (dyadicTensorReference g)‖ ≤
      (Grothe.Upper.CompositeComparisonData.rawCapQ : ℝ) := by
  have hc : canonicalTensorErrorNorm (dyadicTensorReference g) =
      canonicalTensorErrorNorm g := canonical_error_rationalTensorCompletion (2 ^ 54) g
  have h := norm_productionF0Head_sub_le_canonical (dyadicTensorReference g)
  rw [hc] at h
  have hd : tensorCompletionDefectNorm (dyadicTensorReference g) ≤
      (1 / ((2 : ℝ) ^ 54)) * (1 + canonicalTensorErrorNorm g) := by
    simpa only [dyadicTensorReference, Nat.cast_pow, Nat.cast_ofNat] using
      rationalTensorCompletion_defect_le (2 ^ 54) (by positivity) g
  have hb : (10 / 7 : ℝ) * (66 / 10 ^ 10 : ℝ) +
      (1 / ((2 : ℝ) ^ 54)) * (1 + (66 / 10 ^ 10 : ℝ)) ≤
        (Grothe.Upper.CompositeComparisonData.rawCapQ : ℝ) := by
    norm_num [Grothe.Upper.CompositeComparisonData.rawCapQ]
  have hcan : (10 / 7 : ℝ) * canonicalTensorErrorNorm g ≤
      (10 / 7 : ℝ) * (66 / 10 ^ 10 : ℝ) :=
    mul_le_mul_of_nonneg_left hcanonical (by norm_num)
  have hone : 1 + canonicalTensorErrorNorm g ≤ 1 + (66 / 10 ^ 10 : ℝ) :=
    add_le_add le_rfl hcanonical
  have hdBound : tensorCompletionDefectNorm (dyadicTensorReference g) ≤
      (1 / ((2 : ℝ) ^ 54)) * (1 + (66 / 10 ^ 10 : ℝ)) :=
    hd.trans (mul_le_mul_of_nonneg_left hone (by positivity))
  exact h.trans ((add_le_add hcan hdBound).trans hb)

end
end Grothe.UpperChaos.FixedChaosSmoothing

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.FixedChaosSmoothing.rationalTensorCompletion_defect_le,
      ``Grothe.UpperChaos.FixedChaosSmoothing.raw_error_of_dyadicTensorReference] do
    let dependencies ← Lean.collectAxioms target
    let unexpected := dependencies.filter fun n => !allowed.contains n
    unless unexpected.isEmpty do throwError m!"Unexpected rational reference axioms: {unexpected}"

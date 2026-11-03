import Grothe.UpperChaos.ConditionalCoefficientReflection
import Grothe.UpperChaos.CanonicalReconstructionNorm
import Lean.Util.CollectAxioms

/-! Exact reconstruction of the actual conditional coefficient vector.
A zero radial profile makes the phase slice constant, so reflection extends
across profile zeros. The finite canonical/reflected split below is applied
to actual Gaussian coefficients, before any floating-point reconstruction.
Numerical centers, quadrature and floating-point costs remain separate.
Agent-ID: codex-7c2e. -/

set_option warningAsError true
open MeasureTheory Finset Grothe.LowerAnalytic
open scoped InnerProductSpace ComplexConjugate

namespace Grothe.UpperChaos.F0ConditionalEvaluator
noncomputable section

/-- At a profile zero only the constant conditional Hermite mode can remain. -/
theorem coefficient_zero_of_profile_zero (s : ℝ) (hs : 0 ≤ s)
    (hv : vprof s = 0) (i : ℕ × ℕ) (hi : i ≠ (0, 0)) :
    F0ConditionalNode.coefficient s i = 0 := by
  have hone (w : ℂ) : hfun (0, 0) w = 1 := by
    norm_num [hfun, nrm, H_zero_zero, ev]
  have hmean : (∫ w, conj (hfun i w) ∂gaussC) = 0 := by
    have h := inner_hvec i (0, 0)
    rw [hvec, hvec, inner_toLp] at h
    simp only [if_neg hi] at h
    simpa only [hone, mul_one] using h
  rw [F0ConditionalNode.coefficient_eq_integral]
  simp_rw [F0ConditionalNode.phaseSlice_eq s hs, hv]
  simp only [mul_zero, Complex.ofReal_zero, zero_mul, add_zero]
  rw [integral_mul_const, hmean, zero_mul]

/-- Actual normalized reflection needs no nonzero-profile assumption. -/
theorem coefficient_reflection_all_profiles (s : ℝ) (hs : 0 ≤ s) (p q : ℕ) :
    F0ConditionalNode.coefficient s (q + 1, p) =
      (Real.sqrt (((p + 1 : ℕ) : ℝ) / (q + 1 : ℕ)) : ℂ) *
        F0ConditionalNode.coefficient s (p + 1, q) := by
  by_cases hv : vprof s = 0
  · rw [coefficient_zero_of_profile_zero s hs hv (q + 1, p) (by simp),
      coefficient_zero_of_profile_zero s hs hv (p + 1, q) (by simp), mul_zero]
  · exact coefficient_reflection s hs hv p q

/-- The exact production partner relation also extends across profile zeros. -/
theorem production_reflected_coefficient_all_profiles (s : ℝ) (hs : 0 ≤ s)
    (c d : ℕ) (h : d + 1 < c) :
    F0ConditionalNode.coefficient s (c, d) =
      (Real.sqrt (((d + 1 : ℕ) : ℝ) / (c : ℝ)) : ℂ) *
        F0ConditionalNode.coefficient s (d + 1, c - 1) := by
  have hc : 1 ≤ c := by omega
  simpa only [Nat.sub_add_cancel hc] using
    coefficient_reflection_all_profiles s hs d (c - 1)

end
end Grothe.UpperChaos.F0ConditionalEvaluator

namespace Grothe.UpperChaos.ConditionalReconstruction
noncomputable section

/-- Exact completion from the canonical half; every square root is a real
mathematical value, with numerical rounding excluded from this operator. -/
def reconstruct (a : ℕ × ℕ → ℂ) (i : ℕ × ℕ) : ℂ :=
  if i.1 ≤ i.2 + 1 then a i else
    (CanonicalReconstructionNorm.factor i : ℂ) * a (CanonicalReconstructionNorm.partner i)

theorem reconstruct_sub (a b : ℕ × ℕ → ℂ) (i : ℕ × ℕ) :
    reconstruct (fun k => a k - b k) i = reconstruct a i - reconstruct b i := by
  by_cases hi : i.1 ≤ i.2 + 1 <;> simp [reconstruct, hi, mul_sub]

/-- This reconstruction is an identity on the actual conditional Gaussian
coefficients, including zero profiles. It is not a premise on a stored table. -/
theorem reconstruct_actual (s : ℝ) (hs : 0 ≤ s) (i : ℕ × ℕ) :
    reconstruct (F0ConditionalNode.coefficient s) i = F0ConditionalNode.coefficient s i := by
  by_cases hi : i.1 ≤ i.2 + 1
  · simp [reconstruct, hi]
  · rw [reconstruct, if_neg hi]
    have hgt : i.2 + 1 < i.1 := by omega
    simpa [CanonicalReconstructionNorm.factor, CanonicalReconstructionNorm.partner] using
      (F0ConditionalEvaluator.production_reflected_coefficient_all_profiles s hs i.1 i.2 hgt).symm

private theorem split_union (q : ℕ) :
    CanonicalReconstructionNorm.grade q = CanonicalReconstructionNorm.canonical q ∪
      CanonicalReconstructionNorm.reflected q := by
  ext i
  simp only [CanonicalReconstructionNorm.grade, CanonicalReconstructionNorm.canonical,
    CanonicalReconstructionNorm.reflected, mem_union, mem_filter, mem_product, mem_range]
  omega

private theorem split_disjoint (q : ℕ) :
    Disjoint (CanonicalReconstructionNorm.canonical q) (CanonicalReconstructionNorm.reflected q) := by
  apply disjoint_left.mpr
  intro i hc hr
  have hc' := (CanonicalReconstructionNorm.mem_canonical.mp hc).2.2
  have hr' := (CanonicalReconstructionNorm.mem_reflected.mp hr).2.2
  omega

/-- Attach the finite split to the actual Gaussian coefficient error.
The input is one coupled canonical vector, with no entry-count factor. -/
theorem actual_error_energy_le (s : ℝ) (hs : 0 ≤ s) (q : ℕ) (a : ℕ × ℕ → ℂ) :
    (∑ i ∈ CanonicalReconstructionNorm.grade q,
      ‖F0ConditionalNode.coefficient s i - reconstruct a i‖ ^ 2) ≤
      2 * ∑ i ∈ CanonicalReconstructionNorm.canonical q,
        ‖F0ConditionalNode.coefficient s i - a i‖ ^ 2 := by
  let e : ℕ × ℕ → ℂ := fun i => F0ConditionalNode.coefficient s i - a i
  have he (i : ℕ × ℕ) :
      F0ConditionalNode.coefficient s i - reconstruct a i = reconstruct e i := by
    rw [show reconstruct e i = reconstruct (F0ConditionalNode.coefficient s) i - reconstruct a i from
      reconstruct_sub (F0ConditionalNode.coefficient s) a i, reconstruct_actual s hs i]
  calc
    _ = (∑ i ∈ CanonicalReconstructionNorm.canonical q, ‖e i‖ ^ 2) +
        ∑ i ∈ CanonicalReconstructionNorm.reflected q,
          ‖(CanonicalReconstructionNorm.factor i : ℂ) * e (CanonicalReconstructionNorm.partner i)‖ ^ 2 := by
      rw [split_union, sum_union (split_disjoint q)]
      congr 1
      · apply sum_congr rfl
        intro i hi
        have hc := (CanonicalReconstructionNorm.mem_canonical.mp hi).2.2
        simp only [he, reconstruct, if_pos hc]
      · apply sum_congr rfl
        intro i hi
        have hr := (CanonicalReconstructionNorm.mem_reflected.mp hi).2.2
        have hc : ¬ i.1 ≤ i.2 + 1 := by omega
        simp only [he, reconstruct, if_neg hc]
    _ ≤ _ := CanonicalReconstructionNorm.reconstruction_energy_le q e

/-- Positive physical weights preserve the coupled-vector reconstruction
bound. Node locations and weights are explicit, with no quadrature claim. -/
theorem weighted_error_energy_le {ι : Type*} (nodes : Finset ι)
    (s w : ι → ℝ) (q : ℕ) (a : ι → ℕ × ℕ → ℂ)
    (hs : ∀ j ∈ nodes, 0 ≤ s j) (hw : ∀ j ∈ nodes, 0 ≤ w j) :
    (∑ j ∈ nodes, w j * (∑ i ∈ CanonicalReconstructionNorm.grade q,
      ‖F0ConditionalNode.coefficient (s j) i - reconstruct (a j) i‖ ^ 2)) ≤
      2 * ∑ j ∈ nodes, w j * (∑ i ∈ CanonicalReconstructionNorm.canonical q,
        ‖F0ConditionalNode.coefficient (s j) i - a j i‖ ^ 2) := by
  calc
    _ ≤ ∑ j ∈ nodes, w j * (2 * ∑ i ∈ CanonicalReconstructionNorm.canonical q,
        ‖F0ConditionalNode.coefficient (s j) i - a j i‖ ^ 2) := by
      apply sum_le_sum
      intro j hj
      exact mul_le_mul_of_nonneg_left (actual_error_energy_le (s j) (hs j hj) q (a j)) (hw j hj)
    _ = _ := by
      conv_rhs => rw [mul_sum]
      apply sum_congr rfl
      intro j hj
      ring

/-- The 10/7 norm allowance now refers to actual conditional coefficients.
Floating reflection/rotation/grouping errors still require separate bounds. -/
theorem weighted_error_norm_le {ι : Type*} (nodes : Finset ι)
    (s w : ι → ℝ) (q : ℕ) (a : ι → ℕ × ℕ → ℂ)
    (hs : ∀ j ∈ nodes, 0 ≤ s j) (hw : ∀ j ∈ nodes, 0 ≤ w j) :
    Real.sqrt (∑ j ∈ nodes, w j * (∑ i ∈ CanonicalReconstructionNorm.grade q,
      ‖F0ConditionalNode.coefficient (s j) i - reconstruct (a j) i‖ ^ 2)) ≤
      (10 / 7 : ℝ) * Real.sqrt (∑ j ∈ nodes, w j *
        (∑ i ∈ CanonicalReconstructionNorm.canonical q,
          ‖F0ConditionalNode.coefficient (s j) i - a j i‖ ^ 2)) := by
  have hc : 0 ≤ ∑ j ∈ nodes, w j *
      (∑ i ∈ CanonicalReconstructionNorm.canonical q,
        ‖F0ConditionalNode.coefficient (s j) i - a j i‖ ^ 2) := by
    exact sum_nonneg fun j hj => mul_nonneg (hw j hj) (sum_nonneg fun _ _ => sq_nonneg _)
  have hf : 0 ≤ ∑ j ∈ nodes, w j * (∑ i ∈ CanonicalReconstructionNorm.grade q,
      ‖F0ConditionalNode.coefficient (s j) i - reconstruct (a j) i‖ ^ 2) := by
    exact sum_nonneg fun j hj => mul_nonneg (hw j hj) (sum_nonneg fun _ _ => sq_nonneg _)
  apply (sq_le_sq₀ (Real.sqrt_nonneg _) (mul_nonneg (by norm_num) (Real.sqrt_nonneg _))).mp
  rw [mul_pow, Real.sq_sqrt hf, Real.sq_sqrt hc]
  nlinarith [weighted_error_energy_le nodes s w q a hs hw]

/-- The top conditional rectangle's canonical half is precisely the existing
31,877-mode selection, rather than a prefix of the larger storage table. -/
theorem canonical_top_eq_modes :
    CanonicalReconstructionNorm.canonical 250 = ConditionalNodeIndices.modes := by
  ext ⟨c, d⟩
  rw [CanonicalReconstructionNorm.mem_canonical, ConditionalNodeIndices.mem_modes]
  omega

/-- Consume a bound on the actual selected canonical coefficient error at the
same nodes and weights. Physical applications must use the complete Gaussian
quadrature weights, including their density factor exactly once.
This is the exact reconstruction stage; primary
contraction, floating operations and the final table fit remain separate. -/
theorem weighted_top_norm_le_of_canonical_error {ι : Type*} (nodes : Finset ι)
    (s w : ι → ℝ) (a : ι → ℕ × ℕ → ℂ) {δ : ℝ}
    (hs : ∀ j ∈ nodes, 0 ≤ s j) (hw : ∀ j ∈ nodes, 0 ≤ w j)
    (he : Real.sqrt (∑ j ∈ nodes, w j * (∑ i ∈ ConditionalNodeIndices.modes,
      ‖F0ConditionalNode.coefficient (s j) i - a j i‖ ^ 2)) ≤ δ) :
    Real.sqrt (∑ j ∈ nodes, w j * (∑ i ∈ CanonicalReconstructionNorm.grade 250,
      ‖F0ConditionalNode.coefficient (s j) i - reconstruct (a j) i‖ ^ 2)) ≤
        (10 / 7 : ℝ) * δ := by
  have h := weighted_error_norm_le nodes s w 250 a hs hw
  rw [canonical_top_eq_modes] at h
  exact h.trans (mul_le_mul_of_nonneg_left he (by norm_num))

end
end Grothe.UpperChaos.ConditionalReconstruction

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.F0ConditionalEvaluator.coefficient_zero_of_profile_zero,
      ``Grothe.UpperChaos.F0ConditionalEvaluator.coefficient_reflection_all_profiles,
      ``Grothe.UpperChaos.ConditionalReconstruction.reconstruct_actual,
      ``Grothe.UpperChaos.ConditionalReconstruction.weighted_error_norm_le,
      ``Grothe.UpperChaos.ConditionalReconstruction.canonical_top_eq_modes,
      ``Grothe.UpperChaos.ConditionalReconstruction.weighted_top_norm_le_of_canonical_error] do
    let dependencies ← Lean.collectAxioms target
    let unexpected := dependencies.filter fun n => !allowed.contains n
    unless unexpected.isEmpty do throwError m!"Unexpected actual reconstruction axioms: {unexpected}"

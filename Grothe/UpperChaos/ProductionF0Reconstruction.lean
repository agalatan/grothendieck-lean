import Grothe.UpperChaos.ProductionF0Radial
import Grothe.UpperChaos.ConditionalReconstruction
import Mathlib.Analysis.InnerProductSpace.PiL2

/-! Reconstruction after the actual first-coordinate contraction.
The real-radius Hermite factor has the same index-swap symmetry as the
conditional coefficient. Thus exact triangular completion applies to actual
full tensor coefficients. The discrepancy between that exact completion and
the stored rational output is paid as its own coupled norm; no exact floating
reflection identity is assumed. Agent-ID: codex-7c2e. -/

set_option warningAsError true
open MeasureTheory Finset MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.FixedChaosSmoothing
noncomputable section

private theorem add_right_real (x y z : ℝ) (h : x ≤ y) : x + z ≤ y + z := by
  simpa only [add_comm] using (add_le_add_right h z)

private theorem ev_swap_ofReal (r : ℝ) (P : CPoly) :
    ev (r : ℂ) (ConditionalMomentReflection.swap P) = ev (r : ℂ) P := by
  induction P using MvPolynomial.induction_on with
  | C a => simp [ev]
  | add P Q hP hQ =>
      simp only [map_add, ev] at *
      rw [hP, hQ]
  | mul_X P i hP =>
      rw [map_mul, ConditionalMomentReflection.swap_X]
      simp only [ev, map_mul, eval_X] at *
      rw [hP]
      fin_cases i <;> simp [zv, Complex.conj_ofReal]

/-- At the physical real radius, swapping Hermite indices preserves the
normalized primary factor, including radius zero. -/
theorem hfun_ofReal_swap (r : ℝ) (p q : ℕ) :
    hfun (p, q) (r : ℂ) = hfun (q, p) (r : ℂ) := by
  have h := congrArg (ev (r : ℂ)) (ConditionalMomentReflection.swap_H p q)
  rw [ev_swap_ofReal] at h
  have hn : nrm p q = nrm q p := by simp only [nrm, Nat.mul_comm]
  change (nrm p q : ℂ) * ev (r : ℂ) (H p q) =
    (nrm q p : ℂ) * ev (r : ℂ) (H q p)
  rw [hn, h]

/-- The production reflection survives the full actual radial integral.
Both the conditional coefficient and the primary factor refer to sqrt(s). -/
theorem radialBaseCoefficient_reflection (q c d : ℕ) (href : d + 1 < c) :
    radialBaseCoefficient q c d =
      (Real.sqrt (((d + 1 : ℕ) : ℝ) / (c : ℝ)) : ℂ) *
        radialBaseCoefficient q (d + 1) (c - 1) := by
  have hfirst : q + 1 - (d + 1) = q - d := by omega
  have hsecond : q - (c - 1) = q + 1 - c := by omega
  have hp (s : ℝ) :
      hfun (q + 1 - c, q - d) (Real.sqrt s : ℂ) =
        hfun (q + 1 - (d + 1), q - (c - 1)) (Real.sqrt s : ℂ) := by
    simpa only [hfirst, hsecond] using
      hfun_ofReal_swap (Real.sqrt s) (q + 1 - c) (q - d)
  unfold radialBaseCoefficient
  rw [← integral_const_mul]
  apply setIntegral_congr_fun measurableSet_Ioi
  intro s hs
  change (Real.exp (-s) : ℂ) *
      (conj (hfun (q + 1 - c, q - d) (Real.sqrt s : ℂ)) *
        F0ConditionalNode.coefficient s (c, d)) =
    (Real.sqrt (((d + 1 : ℕ) : ℝ) / (c : ℝ)) : ℂ) *
      ((Real.exp (-s) : ℂ) *
        (conj (hfun (q + 1 - (d + 1), q - (c - 1)) (Real.sqrt s : ℂ)) *
          F0ConditionalNode.coefficient s (d + 1, c - 1)))
  rw [hp s, F0ConditionalEvaluator.production_reflected_coefficient_all_profiles
    s (le_of_lt hs) c d href]
  ring

private theorem baseGradedCoefficient_eq_radial_nat (q c d : ℕ)
    (hc : c ≤ q + 1) (hd : d ≤ q) :
    baseGradedCoefficient q c d = radialBaseCoefficient q c d := by
  have hc' : c < q + 2 := by omega
  have hd' : d < q + 1 := by omega
  exact baseGradedCoefficient_eq_radial
    (⟨q, Nat.lt_succ_self q⟩ : Fin (q + 1)) ⟨c, hc'⟩ ⟨d, hd'⟩

/-- Completion is an identity on each actual full Gaussian tensor grade.
This is stronger than a pointwise conditional-node reflection. -/
theorem reconstruct_actual_tensor (q : ℕ) (i : ℕ × ℕ)
    (hi : i ∈ CanonicalReconstructionNorm.grade q) :
    ConditionalReconstruction.reconstruct
      (fun k => baseGradedCoefficient q k.1 k.2) i =
        baseGradedCoefficient q i.1 i.2 := by
  have hib := hi
  simp only [CanonicalReconstructionNorm.grade, mem_product, mem_range] at hib
  by_cases hcanon : i.1 ≤ i.2 + 1
  · simp [ConditionalReconstruction.reconstruct, hcanon]
  · have hgt : i.2 + 1 < i.1 := by omega
    have hc : i.1 ≤ q + 1 := by omega
    have hd : i.2 ≤ q := by omega
    have hcp : i.2 + 1 ≤ q + 1 := by omega
    have hdp : i.1 - 1 ≤ q := by omega
    rw [ConditionalReconstruction.reconstruct, ite_eq_right hcanon]
    change (CanonicalReconstructionNorm.factor i : ℂ) *
      baseGradedCoefficient q (i.2 + 1) (i.1 - 1) = baseGradedCoefficient q i.1 i.2
    rw [baseGradedCoefficient_eq_radial_nat q i.1 i.2 hc hd,
      baseGradedCoefficient_eq_radial_nat q (i.2 + 1) (i.1 - 1) hcp hdp]
    simpa only [CanonicalReconstructionNorm.factor, Nat.cast_add, Nat.cast_one] using
      (radialBaseCoefficient_reflection q i.1 i.2 hgt).symm

private theorem grade_eq_union (q : ℕ) : CanonicalReconstructionNorm.grade q =
    CanonicalReconstructionNorm.canonical q ∪ CanonicalReconstructionNorm.reflected q := by
  ext i
  simp only [CanonicalReconstructionNorm.grade, CanonicalReconstructionNorm.canonical,
    CanonicalReconstructionNorm.reflected, mem_union, mem_filter, mem_product, mem_range]
  omega

private theorem canonical_disjoint_reflected (q : ℕ) : Disjoint (CanonicalReconstructionNorm.canonical q)
    (CanonicalReconstructionNorm.reflected q) := by
  apply disjoint_left.mpr
  intro i hc hr
  have := (CanonicalReconstructionNorm.mem_canonical.mp hc).2.2
  have := (CanonicalReconstructionNorm.mem_reflected.mp hr).2.2
  omega

/-- One coupled canonical tensor error controls its exact completed grade.
The numerical completion defect is deliberately absent from this stage. -/
theorem actual_tensor_error_energy_le (q : ℕ) (a : ℕ × ℕ → ℂ) :
    (∑ i ∈ CanonicalReconstructionNorm.grade q,
      ‖baseGradedCoefficient q i.1 i.2 - ConditionalReconstruction.reconstruct a i‖ ^ 2) ≤
      2 * ∑ i ∈ CanonicalReconstructionNorm.canonical q,
        ‖baseGradedCoefficient q i.1 i.2 - a i‖ ^ 2 := by
  let e : ℕ × ℕ → ℂ := fun i => baseGradedCoefficient q i.1 i.2 - a i
  have he (i : ℕ × ℕ) (hi : i ∈ CanonicalReconstructionNorm.grade q) :
      baseGradedCoefficient q i.1 i.2 - ConditionalReconstruction.reconstruct a i =
        ConditionalReconstruction.reconstruct e i := by
    rw [show ConditionalReconstruction.reconstruct e i =
        ConditionalReconstruction.reconstruct (fun k => baseGradedCoefficient q k.1 k.2) i -
          ConditionalReconstruction.reconstruct a i from
      ConditionalReconstruction.reconstruct_sub _ _ i, reconstruct_actual_tensor q i hi]
  calc
    _ = (∑ i ∈ CanonicalReconstructionNorm.canonical q, ‖e i‖ ^ 2) +
        ∑ i ∈ CanonicalReconstructionNorm.reflected q,
          ‖(CanonicalReconstructionNorm.factor i : ℂ) *
            e (CanonicalReconstructionNorm.partner i)‖ ^ 2 := by
      rw [grade_eq_union, sum_union (canonical_disjoint_reflected q)]
      congr 1
      · refine sum_congr rfl fun i hi => ?_
        have hb := (mem_filter.mp hi).1
        have hc := (CanonicalReconstructionNorm.mem_canonical.mp hi).2.2
        rw [he i hb, ConditionalReconstruction.reconstruct, ite_eq_left hc]
      · refine sum_congr rfl fun i hi => ?_
        have hb := (mem_filter.mp hi).1
        have hr := (CanonicalReconstructionNorm.mem_reflected.mp hi).2.2
        rw [he i hb, ConditionalReconstruction.reconstruct, ite_eq_right (by omega)]
    _ ≤ _ := CanonicalReconstructionNorm.reconstruction_energy_le q e

/-- The complete coefficient vector, with every one of the 251 grades. -/
def tensorVector (a : ℕ → ℕ × ℕ → ℂ) : EuclideanSpace ℂ (GradedIdx 251) :=
  WithLp.toLp 2 fun i => a i.1 (i.2.1, i.2.2)

theorem norm_tensorVector_sq (a : ℕ → ℕ × ℕ → ℂ) :
    ‖tensorVector a‖ ^ 2 = ∑ q ∈ range 251,
      ∑ i ∈ CanonicalReconstructionNorm.grade q, ‖a q i‖ ^ 2 := by
  rw [EuclideanSpace.norm_sq_eq]
  change (∑ i : GradedIdx 251, ‖a i.1 (i.2.1, i.2.2)‖ ^ 2) = _
  simp only [Fintype.sum_sigma, Fintype.sum_prod_type,
    CanonicalReconstructionNorm.grade, sum_product]
  exact sum_bounded_graded_eq_range 251 (fun q c d => ‖a q (c, d)‖ ^ 2)

/-- The coupled error in the canonical tensor entries after primary contraction. -/
def canonicalTensorErrorNorm (a0 : ℕ → ℕ → ℕ → ℚ) : ℝ :=
  Real.sqrt (∑ q ∈ range 251, ∑ i ∈ CanonicalReconstructionNorm.canonical q,
    ‖baseGradedCoefficient q i.1 i.2 - (a0 q i.1 i.2 : ℂ)‖ ^ 2)

/-- Observable difference between the mathematical square-root completion and
all actual stored rational entries. Its bound must certify floating operations. -/
def tensorCompletionDefectNorm (a0 : ℕ → ℕ → ℕ → ℚ) : ℝ :=
  ‖tensorVector (fun q i => ConditionalReconstruction.reconstruct
    (fun k => (a0 q k.1 k.2 : ℂ)) i - (a0 q i.1 i.2 : ℂ))‖

/-- The completion defect is a finite sum of real scalar errors in the
ACTUAL rational output, on the reflected half only. This is a precise target
for square-root/multiplication enclosures, with no entrywise accuracy assumed. -/
theorem tensorCompletionDefectNorm_sq (a0 : ℕ → ℕ → ℕ → ℚ) :
    tensorCompletionDefectNorm a0 ^ 2 =
      ∑ q ∈ range 251, ∑ i ∈ CanonicalReconstructionNorm.reflected q,
        (CanonicalReconstructionNorm.factor i *
          (a0 q (i.2 + 1) (i.1 - 1) : ℝ) - (a0 q i.1 i.2 : ℝ)) ^ 2 := by
  rw [tensorCompletionDefectNorm, norm_tensorVector_sq]
  refine sum_congr rfl fun q _ => ?_
  rw [grade_eq_union, sum_union (canonical_disjoint_reflected q)]
  have hzero : (∑ i ∈ CanonicalReconstructionNorm.canonical q,
      ‖ConditionalReconstruction.reconstruct (fun k => (a0 q k.1 k.2 : ℂ)) i -
        (a0 q i.1 i.2 : ℂ)‖ ^ 2) = 0 := by
    refine sum_eq_zero fun i hi => ?_
    have hc := (CanonicalReconstructionNorm.mem_canonical.mp hi).2.2
    simp only [ConditionalReconstruction.reconstruct, ite_eq_left hc,
      sub_self, norm_zero, zero_pow (by omega : 2 ≠ 0)]
  rw [hzero, zero_add]
  refine sum_congr rfl fun i hi => ?_
  have hr := (CanonicalReconstructionNorm.mem_reflected.mp hi).2.2
  rw [ConditionalReconstruction.reconstruct, ite_eq_right (by omega)]
  change ‖(CanonicalReconstructionNorm.factor i : ℂ) *
    (a0 q (i.2 + 1) (i.1 - 1) : ℂ) - (a0 q i.1 i.2 : ℂ)‖ ^ 2 = _
  rw [← Complex.ofReal_ratCast (a0 q (i.2 + 1) (i.1 - 1)),
    ← Complex.ofReal_ratCast (a0 q i.1 i.2), ← Complex.ofReal_mul,
    ← Complex.ofReal_sub, Complex.norm_real, Real.norm_eq_abs, sq_abs]

/-- Consume an actual coupled reflected-output error certificate. -/
theorem tensorCompletionDefectNorm_le (a0 : ℕ → ℕ → ℕ → ℚ) {η : ℝ}
    (hη : 0 ≤ η)
    (herror : (∑ q ∈ range 251, ∑ i ∈ CanonicalReconstructionNorm.reflected q,
      (CanonicalReconstructionNorm.factor i *
        (a0 q (i.2 + 1) (i.1 - 1) : ℝ) - (a0 q i.1 i.2 : ℝ)) ^ 2) ≤ η ^ 2) :
    tensorCompletionDefectNorm a0 ≤ η := by
  have hsq : tensorCompletionDefectNorm a0 ^ 2 ≤ η ^ 2 :=
    (tensorCompletionDefectNorm_sq a0).trans_le herror
  exact (sq_le_sq₀
    (show 0 ≤ tensorCompletionDefectNorm a0 from norm_nonneg _) hη).mp hsq

/-- The full actual source error needs only its canonical tensor error and a
separate completion defect. No irrational identity is imposed on rational data. -/
theorem norm_productionF0Head_sub_le_canonical (a0 : ℕ → ℕ → ℕ → ℚ) :
    ‖productionF0Head - gradedHermite 251 a0‖ ≤
      (10 / 7 : ℝ) * canonicalTensorErrorNorm a0 + tensorCompletionDefectNorm a0 := by
  let a : ℕ → ℕ × ℕ → ℂ := fun q i => (a0 q i.1 i.2 : ℂ)
  let trueA : ℕ → ℕ × ℕ → ℂ := fun q i => baseGradedCoefficient q i.1 i.2
  let exactA : ℕ → ℕ × ℕ → ℂ := fun q => ConditionalReconstruction.reconstruct (a q)
  have hnorm : ‖productionF0Head - gradedHermite 251 a0‖ =
      ‖tensorVector (fun q i => trueA q i - a q i)‖ := by
    apply (sq_eq_sq₀ (norm_nonneg _) (norm_nonneg _)).mp
    rw [norm_productionF0Head_sub_sq, norm_tensorVector_sq]
    simp only [CanonicalReconstructionNorm.grade, sum_product, trueA, a]
  have hrec : ‖tensorVector (fun q i => trueA q i - exactA q i)‖ ≤
      (10 / 7 : ℝ) * canonicalTensorErrorNorm a0 := by
    have hs : ‖tensorVector (fun q i => trueA q i - exactA q i)‖ ^ 2 ≤
        2 * ∑ q ∈ range 251, ∑ i ∈ CanonicalReconstructionNorm.canonical q,
          ‖trueA q i - a q i‖ ^ 2 := by
      rw [norm_tensorVector_sq, mul_sum]
      exact sum_le_sum fun q _ => actual_tensor_error_energy_le q (a q)
    have hnonneg : 0 ≤ ∑ q ∈ range 251,
        ∑ i ∈ CanonicalReconstructionNorm.canonical q, ‖trueA q i - a q i‖ ^ 2 :=
      sum_nonneg fun _ _ => sum_nonneg fun _ _ => sq_nonneg _
    have hsqrt : canonicalTensorErrorNorm a0 ^ 2 = ∑ q ∈ range 251,
        ∑ i ∈ CanonicalReconstructionNorm.canonical q, ‖trueA q i - a q i‖ ^ 2 :=
      Real.sq_sqrt hnonneg
    have hsq : ‖tensorVector (fun q i => trueA q i - exactA q i)‖ ^ 2 ≤
        ((10 / 7 : ℝ) * canonicalTensorErrorNorm a0) ^ 2 := by
      rw [mul_pow, hsqrt]
      exact hs.trans (mul_le_mul_of_nonneg_right (by norm_num) hnonneg)
    exact (sq_le_sq₀ (norm_nonneg _) (mul_nonneg (by norm_num) (Real.sqrt_nonneg _))).mp hsq
  have hsplit : tensorVector (fun q i => trueA q i - a q i) =
      tensorVector (fun q i => trueA q i - exactA q i) +
        tensorVector (fun q i => exactA q i - a q i) := by
    ext i
    change trueA i.1 (i.2.1, i.2.2) - a i.1 (i.2.1, i.2.2) = _
    change _ = (trueA i.1 (i.2.1, i.2.2) - exactA i.1 (i.2.1, i.2.2)) +
      (exactA i.1 (i.2.1, i.2.2) - a i.1 (i.2.1, i.2.2))
    ring
  have hdefect : tensorCompletionDefectNorm a0 =
      ‖tensorVector (fun q i => exactA q i - a q i)‖ := rfl
  rw [hnorm, hsplit, hdefect]
  exact (norm_add_le _ _).trans (add_right_real _ _ _ hrec)

end
end Grothe.UpperChaos.FixedChaosSmoothing

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.FixedChaosSmoothing.radialBaseCoefficient_reflection,
      ``Grothe.UpperChaos.FixedChaosSmoothing.reconstruct_actual_tensor,
      ``Grothe.UpperChaos.FixedChaosSmoothing.tensorCompletionDefectNorm_sq,
      ``Grothe.UpperChaos.FixedChaosSmoothing.norm_productionF0Head_sub_le_canonical] do
    let dependencies ← Lean.collectAxioms target
    let unexpected := dependencies.filter fun n => !allowed.contains n
    unless unexpected.isEmpty do throwError m!"Unexpected full tensor reconstruction axioms: {unexpected}"

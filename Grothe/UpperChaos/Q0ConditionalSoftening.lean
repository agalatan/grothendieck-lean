import Grothe.UpperChaos.Q0ConditionalFiniteLaplace
import Grothe.UpperChaos.ProductionSoftPhase
import Mathlib.MeasureTheory.Integral.Layercake
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Uniform softening at an actual conditional Gaussian fibre

The small-ball estimate is proved for every fixed first Gaussian coordinate;
no almost-everywhere statement on the two-coordinate product is specialized to
an isolated quadrature node. This concerns the F0 base phase only. The finite
auxiliary quadrature and saved coefficient error remain separate.
Agent-ID: codex-aa04.
-/

open MeasureTheory Set Grothe.LowerAnalytic
open scoped InnerProductSpace ComplexConjugate

namespace Grothe.UpperChaos.Q0ConditionalSoftening

open F0ConditionalNode Q0ConditionalFiniteLaplace

noncomputable section

/-- The existing production softening error, restricted to one actual fibre. -/
def fibreError (η : ℝ) (z w : ℂ) : ℂ := softPhaseError η (z, w)

lemma measurable_fibreError (η : ℝ) (z : ℂ) : Measurable (fibreError η z) := by
  unfold fibreError
  exact (measurable_softPhaseError η).comp (measurable_const.prodMk measurable_id)

lemma fibreError_bounds (η : ℝ) (hη : 0 < η) (z w : ℂ) :
    ‖fibreError η z w‖ ≤ 1 ∧
      ‖fibreError η z w‖ * ‖basePhaseArg (z, w)‖ ^ 2 ≤ η ^ 2 / 2 := by
  exact norm_softPhaseError_bounds η hη (z, w)

lemma fibreError_memLp (η : ℝ) (hη : 0 < η) (z : ℂ) :
    MemLp (fibreError η z) 2 gaussC :=
  MemLp.of_bound (measurable_fibreError η z).aestronglyMeasurable 1
    (Filter.Eventually.of_forall fun w => (fibreError_bounds η hη z w).1)

lemma integrable_fibreError_sq (η : ℝ) (hη : 0 < η) (z : ℂ) :
    Integrable (fun w => ‖fibreError η z w‖ ^ 2) gaussC := by
  refine (integrable_const (1 : ℝ)).mono'
    ((measurable_fibreError η z).norm.pow_const 2).aestronglyMeasurable
    (Filter.Eventually.of_forall fun w => ?_)
  rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _)]
  exact pow_le_one₀ (norm_nonneg _) (fibreError_bounds η hη z w).1

/-- The bound is for every fixed fibre, including zero-profile fibres. -/
theorem fibreError_tail (η : ℝ) (hη : 0 < η) (z : ℂ) (t : ℝ) (ht : 0 < t) :
    gaussC.real {w : ℂ | t ≤ ‖fibreError η z w‖ ^ 2} ≤
      (50 / 9 : ℝ) * η ^ 2 * t ^ (-(1 / 2 : ℝ)) := by
  let q : ℝ := Real.sqrt t
  let r : ℝ := Real.sqrt (η ^ 2 / (2 * q))
  have hq : 0 < q := Real.sqrt_pos.mpr ht
  have hq2 : q ^ 2 = t := Real.sq_sqrt ht.le
  have hfrac : 0 ≤ η ^ 2 / (2 * q) := by positivity
  have hr : 0 ≤ r := Real.sqrt_nonneg _
  have hr2 : r ^ 2 = η ^ 2 / (2 * q) := Real.sq_sqrt hfrac
  have hsub : {w : ℂ | t ≤ ‖fibreError η z w‖ ^ 2} ⊆
      {w : ℂ | ‖basePhaseArg (z, w)‖ ≤ r} := by
    intro w hw
    have hδ : q ≤ ‖fibreError η z w‖ := by
      change t ≤ ‖fibreError η z w‖ ^ 2 at hw
      apply (sq_le_sq₀ hq.le (norm_nonneg _)).mp
      simpa only [hq2] using hw
    have hmul := mul_le_mul_of_nonneg_right hδ (sq_nonneg ‖basePhaseArg (z, w)‖)
    have hb := (fibreError_bounds η hη z w).2
    apply Real.le_sqrt_of_sq_le
    apply (le_div_iff₀ (show 0 < 2 * q by positivity)).2
    nlinarith
  calc
    _ ≤ gaussC.real {w : ℂ | ‖basePhaseArg (z, w)‖ ≤ r} := measureReal_mono hsub
    _ ≤ (100 / 9 : ℝ) * r ^ 2 := basePhaseArg_fibre_smallBall z r hr
    _ = (50 / 9 : ℝ) * η ^ 2 * t ^ (-(1 / 2 : ℝ)) := by
      rw [hr2, Real.rpow_neg ht.le, ← Real.sqrt_eq_rpow]
      dsimp [q]
      ring

/-- Layer cake integrates the actual fixed-fibre softening error. -/
theorem integral_fibreError_sq_le (η : ℝ) (hη : 0 < η) (z : ℂ) :
    (∫ w, ‖fibreError η z w‖ ^ 2 ∂gaussC) ≤ (100 / 9 : ℝ) * η ^ 2 := by
  have hi := integrable_fibreError_sq η hη z
  have hn : ∀ᵐ w ∂gaussC, 0 ≤ ‖fibreError η z w‖ ^ 2 :=
    Filter.Eventually.of_forall fun _ => sq_nonneg _
  have hb : ∀ᵐ w ∂gaussC, ‖fibreError η z w‖ ^ 2 ≤ 1 :=
    Filter.Eventually.of_forall fun w =>
      pow_le_one₀ (norm_nonneg _) (fibreError_bounds η hη z w).1
  rw [hi.integral_eq_integral_Ioc_meas_le hn hb]
  have hg : IntervalIntegrable
      (fun t : ℝ => (50 / 9 : ℝ) * η ^ 2 * t ^ (-(1 / 2 : ℝ))) volume 0 1 :=
    (intervalIntegral.intervalIntegrable_rpow' (by norm_num : (-1 : ℝ) < -(1 / 2 : ℝ))).const_mul _
  calc
    _ ≤ ∫ t in Ioc (0 : ℝ) 1, (50 / 9 : ℝ) * η ^ 2 * t ^ (-(1 / 2 : ℝ)) := by
      apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => measureReal_nonneg) hg.1
      filter_upwards [ae_restrict_mem measurableSet_Ioc] with t ht
      exact fibreError_tail η hη z t ht.1
    _ = (100 / 9 : ℝ) * η ^ 2 := by
      rw [← intervalIntegral.integral_of_le (by norm_num : (0 : ℝ) ≤ 1),
        intervalIntegral.integral_const_mul,
        integral_rpow (Or.inl (by norm_num : (-1 : ℝ) < -(1 / 2 : ℝ)))]
      norm_num
      ring

private theorem norm_fibre_toLp_sq (η : ℝ) (hη : 0 < η) (z : ℂ) :
    ‖(fibreError_memLp η hη z).toLp (fibreError η z)‖ ^ 2 =
      ∫ w, ‖fibreError η z w‖ ^ 2 ∂gaussC := by
  let f := fibreError η z
  let hf := fibreError_memLp η hη z
  change ‖hf.toLp f‖ ^ 2 = ∫ w, ‖f w‖ ^ 2 ∂gaussC
  calc
    _ = RCLike.re ⟪hf.toLp f, hf.toLp f⟫_ℂ := norm_sq_eq_re_inner (𝕜 := ℂ) _
    _ = ∫ w, RCLike.re ⟪hf.toLp f w, hf.toLp f w⟫_ℂ ∂gaussC := by
      rw [L2.inner_def]
      exact (integral_re (L2.integrable_inner (𝕜 := ℂ) _ _)).symm
    _ = _ := by
      refine integral_congr_ae ?_
      filter_upwards [hf.coeFn_toLp] with w hw
      rw [hw, ← norm_sq_eq_re_inner]

/-- Uniform Gaussian L² error of softening on every fixed actual fibre. -/
theorem norm_fibreError_le (η : ℝ) (hη : 0 < η) (z : ℂ) :
    ‖(fibreError_memLp η hη z).toLp (fibreError η z)‖ ≤ (10 / 3 : ℝ) * η := by
  have h : ‖(fibreError_memLp η hη z).toLp (fibreError η z)‖ ^ 2 ≤
      (100 / 9 : ℝ) * η ^ 2 := by
    rw [norm_fibre_toLp_sq η hη z]
    exact integral_fibreError_sq_le η hη z
  apply (sq_le_sq₀ (norm_nonneg _) (by positivity : 0 ≤ (10 / 3 : ℝ) * η)).mp
  convert h using 1
  ring

/-- The fixed actual F0 slice and the finite-Laplace core use this same
physical fibre. -/
theorem phaseSliceLp_sub_softSliceLp_le
    (s η : ℝ) (hs : 0 ≤ s) (hη : 0 < η) :
    ‖phaseSliceLp s - softSliceLp s η‖ ≤ (10 / 3 : ℝ) * η := by
  have heq : phaseSliceLp s - softSliceLp s η =
      (fibreError_memLp η hη (Real.sqrt s : ℂ)).toLp
        (fibreError η (Real.sqrt s : ℂ)) := by
    apply Lp.ext
    filter_upwards [Lp.coeFn_sub (phaseSliceLp s) (softSliceLp s η),
      (phaseSlice_memLp s).coeFn_toLp, (softSlice_memLp s η).coeFn_toLp,
      (fibreError_memLp η hη (Real.sqrt s : ℂ)).coeFn_toLp] with w hsub hp hsft hf
    rw [hsub]
    change ((phaseSlice_memLp s).toLp (phaseSlice s)) w -
      ((softSlice_memLp s η).toLp (softSlice s η)) w =
        ((fibreError_memLp η hη (Real.sqrt s : ℂ)).toLp
          (fibreError η (Real.sqrt s : ℂ))) w
    rw [hp, hsft, hf]
    rw [phaseSlice_eq_affineArgument s hs]
    simp [fibreError, softPhaseError, F0_eq_ph_basePhaseArg, softF0,
      softSlice, affineArgument, basePhaseArg, Real.sq_sqrt hs,
      abs_of_nonneg (Real.sqrt_nonneg s)]
  rw [heq]
  exact norm_fibreError_le η hη (Real.sqrt s : ℂ)

/-- Parameter-uniform fixed-fibre softening bound for the finite-Laplace API. -/
theorem norm_phaseSliceLp_sub_softSliceLp_le
    (s η : ℝ) (hs : 0 ≤ s) (hη : 0 < η) :
    ‖phaseSliceLp s - softSliceLp s η‖ ≤ (10 / 3 : ℝ) * η :=
  phaseSliceLp_sub_softSliceLp_le s η hs hη

/-- Bessel charges the actual-to-finite slice discrepancy once on any
finite Hermite family, with no mode-count multiplier. -/
theorem coefficient_finiteLaplace_error_sq_le
    (s η T : ℝ) (hs : 0 ≤ s) (hη : 0 < η) (hT : 0 ≤ T)
    (S : Finset (ℕ × ℕ)) :
    (∑ i ∈ S, ‖coefficient s i - finiteLaplaceCoefficient s η T hT i‖ ^ 2) ≤
      ((10 / 3 : ℝ) * η + Real.exp (-(η ^ 2 * T))) ^ 2 :=
  Q0ConditionalFiniteLaplace.coefficient_finiteLaplace_error_sq_le s η T
    ((10 / 3 : ℝ) * η) hη hT S (norm_phaseSliceLp_sub_softSliceLp_le s η hs hη)

/-- The fixed-node actual response differs from saved centers by the
softening/tail radius plus the explicitly supplied coupled finite-integral error. -/
theorem actual_saved_error_sq_le
    (s η T : ℝ) (hs : 0 ≤ s) (hη : 0 < η) (hT : 0 ≤ T)
    (S : Finset (ℕ × ℕ)) (center : ℕ × ℕ → ℂ) (ε : ℝ) (hε : 0 ≤ ε)
    (hcenter : (∑ i ∈ S, ‖finiteLaplaceCoefficient s η T hT i - center i‖ ^ 2) ≤ ε ^ 2) :
    (∑ i ∈ S, ‖coefficient s i - center i‖ ^ 2) ≤
      ((10 / 3 : ℝ) * η + Real.exp (-(η ^ 2 * T)) + ε) ^ 2 :=
  Q0ConditionalFiniteLaplace.actual_saved_error_sq_le s η T
    ((10 / 3 : ℝ) * η) ε hη hT S center hε
    (norm_phaseSliceLp_sub_softSliceLp_le s η hs hη) hcenter

/-- All selected coefficients of the actual slice, at any nonnegative source
node, versus the finite auxiliary-integral slice. -/
theorem coefficient_finiteLaplace_error_sq_le_fixed
    (s : ℝ) (hs : 0 ≤ s) (S : Finset (ℕ × ℕ)) :
    (∑ i ∈ S, ‖coefficient s i -
      finiteLaplaceCoefficient s finiteLaplaceEta finiteLaplaceCutoff
        finiteLaplaceCutoff_nonneg i‖ ^ 2) ≤ (5 / 10 ^ 15 : ℝ) ^ 2 := by
  have hηpos : 0 < finiteLaplaceEta := finiteLaplaceEta_pos
  have h := coefficient_finiteLaplace_error_sq_le s finiteLaplaceEta
    finiteLaplaceCutoff hs finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg S
  have htail := exp_neg_scaled_finiteLaplaceCutoff_le
  have hnum : (10 / 3 : ℝ) * finiteLaplaceEta +
      Real.exp (-(finiteLaplaceEta ^ 2 * finiteLaplaceCutoff)) ≤ 5 / 10 ^ 15 := by
    exact (add_le_add le_rfl htail).trans (by norm_num [finiteLaplaceEta])
  exact h.trans ((sq_le_sq₀ (by positivity) (by norm_num)).2 hnum)

/-- The fixed-node finite-integral discrepancy to saved centers remains one
explicit coupled input; the true phase/softening/auxiliary tail is discharged. -/
theorem actual_saved_error_sq_le_fixed
    (s : ℝ) (hs : 0 ≤ s) (S : Finset (ℕ × ℕ))
    (center : ℕ × ℕ → ℂ) (ε : ℝ) (hε : 0 ≤ ε)
    (hcenter : (∑ i ∈ S,
      ‖finiteLaplaceCoefficient s finiteLaplaceEta finiteLaplaceCutoff
        finiteLaplaceCutoff_nonneg i - center i‖ ^ 2) ≤ ε ^ 2) :
    (∑ i ∈ S, ‖coefficient s i - center i‖ ^ 2) ≤
      ((5 / 10 ^ 15 : ℝ) + ε) ^ 2 := by
  have hηpos : 0 < finiteLaplaceEta := finiteLaplaceEta_pos
  have h := actual_saved_error_sq_le s finiteLaplaceEta finiteLaplaceCutoff
    hs finiteLaplaceEta_pos finiteLaplaceCutoff_nonneg S center ε hε hcenter
  have htail := exp_neg_scaled_finiteLaplaceCutoff_le
  have hnum : (10 / 3 : ℝ) * finiteLaplaceEta +
      Real.exp (-(finiteLaplaceEta ^ 2 * finiteLaplaceCutoff)) ≤ 5 / 10 ^ 15 := by
    exact (add_le_add le_rfl htail).trans (by norm_num [finiteLaplaceEta])
  exact h.trans ((sq_le_sq₀ (by positivity) (by positivity)).2
    (add_le_add hnum (le_refl ε)))

end
end Grothe.UpperChaos.Q0ConditionalSoftening

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0ConditionalSoftening.fibreError_tail,
      ``Grothe.UpperChaos.Q0ConditionalSoftening.integral_fibreError_sq_le,
      ``Grothe.UpperChaos.Q0ConditionalSoftening.norm_fibreError_le,
      ``Grothe.UpperChaos.Q0ConditionalSoftening.phaseSliceLp_sub_softSliceLp_le,
      ``Grothe.UpperChaos.Q0ConditionalSoftening.norm_phaseSliceLp_sub_softSliceLp_le,
      ``Grothe.UpperChaos.Q0ConditionalSoftening.coefficient_finiteLaplace_error_sq_le,
      ``Grothe.UpperChaos.Q0ConditionalSoftening.actual_saved_error_sq_le,
      ``Grothe.UpperChaos.Q0ConditionalSoftening.coefficient_finiteLaplace_error_sq_le_fixed,
      ``Grothe.UpperChaos.Q0ConditionalSoftening.actual_saved_error_sq_le_fixed] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

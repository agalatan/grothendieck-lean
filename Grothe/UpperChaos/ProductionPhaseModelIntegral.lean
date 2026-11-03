import Grothe.UpperChaos.ProductionPhaseL2Error
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Exact phase selection and the remaining saved-model Gaussian integral.
The conditional Gaussian measure appears once. Outer radial weights and
their source bindings are separate. Agent-ID: codex-8c4d. -/

open MeasureTheory Grothe.LowerAnalytic
open scoped InnerProductSpace ComplexConjugate
namespace Grothe.UpperChaos.ProductionPhaseModelIntegral
open ProductionPhaseL2Error ZeroProfilePhaseStability
noncomputable section

/-- Choosing the actual phase removes phase approximation error exactly. -/
theorem phaseDifferenceLp_self (s : ℝ) (hphase : ∀ w, |slicePhase s w| ≤ 1) :
    phaseDifferenceLp s (slicePhase s) (measurable_slicePhase s) hphase hphase = 0 := by
  apply Lp.ext
  filter_upwards [(phaseDifference_memLp s (slicePhase s) (measurable_slicePhase s)
      hphase hphase).coeFn_toLp, Lp.coeFn_zero ℂ 2 gaussC] with w hw hzero
  change ((phaseDifference_memLp s (slicePhase s) (measurable_slicePhase s)
    hphase hphase).toLp _) w = (0 : Lp ℂ 2 gaussC) w
  rw [hw, hzero]
  simp [phaseDifference]

/-- The actual phase is kept inside the explicit base model. -/
def exactModel (s : ℝ) (w : ℂ) : ℂ := linearSlice s w * P3 (slicePhase s w)

def exactModelLp (s : ℝ) (hphase : ∀ w, |slicePhase s w| ≤ 1) : Lp ℂ 2 gaussC :=
  modelSliceLp s (slicePhase s) (measurable_slicePhase s) hphase

/-- The linear Gaussian base has an explicit nonconstant squared modulus. -/
theorem norm_linearSlice_sq (s : ℝ) (w : ℂ) :
    ‖linearSlice s w‖ ^ 2 = 1 + signedProfileRatio s ^ 2 * w.im ^ 2 := by
  have hre : (linearSlice s w).re = 1 := by simp [linearSlice]
  have him : (linearSlice s w).im = signedProfileRatio s * w.im := by
    unfold linearSlice
    simp only [Complex.add_im, Complex.one_im, Complex.mul_im, Complex.ofReal_re,
      Complex.ofReal_im, Complex.sub_im, Complex.conj_im, zero_mul, mul_zero,
      zero_add, add_zero]
    ring
  rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply, hre, him]
  ring

/-- A finite phase-moment expression for the exact model's squared modulus. -/
theorem norm_exactModel_sq (s : ℝ) (w : ℂ) :
    ‖exactModel s w‖ ^ 2 =
      (1 + signedProfileRatio s ^ 2 * w.im ^ 2) *
        (1 - slicePhase s w ^ 4 * (3 - slicePhase s w ^ 2) / 36) := by
  rw [exactModel, norm_mul, mul_pow, norm_linearSlice_sq,
    ← Complex.normSq_eq_norm_sq, normSq_P3]

/-- No separate phase-approximation budget remains in this choice of model. -/
theorem norm_roundingSliceLp_sub_saved (s : ℝ) (hs : 0 < s)
    (hphase : ∀ w, |slicePhase s w| ≤ 1) (saved : Lp ℂ 2 gaussC) :
    ‖roundingSliceLp s hphase - saved‖ ≤
      5 * signedProfileRatio s ^ 2 + ‖exactModelLp s hphase - saved‖ := by
  have h := ProductionPhaseL2Error.norm_roundingSliceLp_sub_saved s hs (slicePhase s)
    (measurable_slicePhase s) hphase hphase saved
  simpa only [phaseDifferenceLp_self, norm_zero, mul_zero, add_zero, exactModelLp] using h

private theorem norm_sq_integral (f : Lp ℂ 2 gaussC) :
    ‖f‖ ^ 2 = ∫ w, ‖f w‖ ^ 2 ∂gaussC := by
  calc
    _ = RCLike.re ⟪f, f⟫_ℂ := norm_sq_eq_re_inner (𝕜 := ℂ) f
    _ = ∫ w, RCLike.re ⟪f w, f w⟫_ℂ ∂gaussC := by
      rw [L2.inner_def]
      exact (integral_re (L2.integrable_inner (𝕜 := ℂ) f f)).symm
    _ = _ := integral_congr_ae (Filter.Eventually.of_forall fun w =>
      (norm_sq_eq_re_inner (𝕜 := ℂ) (f w)).symm)

/-- The remaining discrepancy is an explicit integral with the actual
normalized conditional Gaussian measure, without an extra density factor. -/
theorem saved_model_norm_sq (s : ℝ) (hphase : ∀ w, |slicePhase s w| ≤ 1)
    (saved : Lp ℂ 2 gaussC) :
    ‖exactModelLp s hphase - saved‖ ^ 2 =
      ∫ w, ‖exactModel s w - saved w‖ ^ 2 ∂gaussC := by
  rw [norm_sq_integral]
  apply integral_congr_ae
  filter_upwards [Lp.coeFn_sub (exactModelLp s hphase) saved,
    (modelSlice_memLp s (slicePhase s) (measurable_slicePhase s) hphase).coeFn_toLp]
    with w hsub hmodel
  simp only [Pi.sub_apply] at hsub
  rw [hsub]
  change ‖((modelSlice_memLp s (slicePhase s) (measurable_slicePhase s) hphase).toLp _) w -
      saved w‖ ^ 2 = _
  rw [hmodel]

/-- Concrete squared model energy, saved energy and the actual cross term.
This is one integral against gaussC; no radial density is inserted here. -/
theorem saved_model_norm_sq_expanded (s : ℝ)
    (hphase : ∀ w, |slicePhase s w| ≤ 1) (saved : Lp ℂ 2 gaussC) :
    ‖exactModelLp s hphase - saved‖ ^ 2 = ∫ w,
      ((1 + signedProfileRatio s ^ 2 * w.im ^ 2) *
        (1 - slicePhase s w ^ 4 * (3 - slicePhase s w ^ 2) / 36) +
        ‖saved w‖ ^ 2 - 2 * (conj (exactModel s w) * saved w).re) ∂gaussC := by
  rw [saved_model_norm_sq]
  apply integral_congr_ae
  filter_upwards [] with w
  have hsub : ‖exactModel s w - saved w‖ ^ 2 =
      ‖exactModel s w‖ ^ 2 + ‖saved w‖ ^ 2 -
        2 * (conj (exactModel s w) * saved w).re := by
    simp only [← Complex.normSq_eq_norm_sq, Complex.normSq_apply,
      Complex.sub_re, Complex.sub_im, Complex.mul_re, Complex.conj_re, Complex.conj_im]
    ring
  rw [hsub, norm_exactModel_sq]

/-- An eventual integral certificate controls the actual source vector.
This theorem does not supply that certificate or identify saved table bytes. -/
theorem norm_roundingSliceLp_sub_saved_of_integral (s : ℝ) (hs : 0 < s)
    (hphase : ∀ w, |slicePhase s w| ≤ 1) (saved : Lp ℂ 2 gaussC)
    (epsilon : ℝ) (hepsilon : 0 ≤ epsilon)
    (hintegral : (∫ w, ‖exactModel s w - saved w‖ ^ 2 ∂gaussC) ≤ epsilon ^ 2) :
    ‖roundingSliceLp s hphase - saved‖ ≤ 5 * signedProfileRatio s ^ 2 + epsilon := by
  have hsq : ‖exactModelLp s hphase - saved‖ ^ 2 ≤ epsilon ^ 2 := by
    rw [saved_model_norm_sq]
    exact hintegral
  have herr : ‖exactModelLp s hphase - saved‖ ≤ epsilon :=
    (sq_le_sq₀ (norm_nonneg _) hepsilon).mp hsq
  exact (norm_roundingSliceLp_sub_saved s hs hphase saved).trans (add_le_add le_rfl herr)

end
open Lean Elab Command
run_cmd do
  for target in #[``phaseDifferenceLp_self, ``norm_linearSlice_sq, ``norm_exactModel_sq,
      ``norm_roundingSliceLp_sub_saved, ``saved_model_norm_sq,
      ``saved_model_norm_sq_expanded, ``norm_roundingSliceLp_sub_saved_of_integral] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains dependency do
        throwError m!"{target} depends on nonstandard axiom {dependency}"
end Grothe.UpperChaos.ProductionPhaseModelIntegral

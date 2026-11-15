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

/-- The Hilbert-space model represents the explicit production-phase function. -/
theorem exactModelLp_coe (s : ℝ) (hphase : ∀ w, |slicePhase s w| ≤ 1) :
    ∀ᵐ w ∂gaussC, exactModelLp s hphase w = exactModel s w :=
  (modelSlice_memLp s (slicePhase s) (measurable_slicePhase s) hphase).coeFn_toLp

/-- Model energy under the normalized conditional Gaussian measure. -/
def modelEnergy (s : ℝ) : ℝ := ∫ w, ‖exactModel s w‖ ^ 2 ∂gaussC

/-- Energy of the actual saved Gaussian function supplied to the consumer. -/
def savedEnergy (saved : Lp ℂ 2 gaussC) : ℝ := ∫ w, ‖saved w‖ ^ 2 ∂gaussC

/-- The complex cross integral retains the order of its two source functions. -/
def modelSavedCross (s : ℝ) (saved : Lp ℂ 2 gaussC) : ℂ :=
  ∫ w, conj (exactModel s w) * saved w ∂gaussC

/-- The model-energy integral is an ordinary integrable Gaussian quantity. -/
theorem integrable_modelEnergy (s : ℝ) (hphase : ∀ w, |slicePhase s w| ≤ 1) :
    Integrable (fun w => ‖exactModel s w‖ ^ 2) gaussC := by
  have h : Integrable (fun w => ‖exactModelLp s hphase w‖ ^ 2) gaussC := by
    simpa only [← norm_sq_eq_re_inner (𝕜 := ℂ)] using
      (L2.integrable_inner (𝕜 := ℂ) (exactModelLp s hphase) (exactModelLp s hphase)).re
  apply h.congr
  filter_upwards [exactModelLp_coe s hphase] with w hw
  rw [hw]

/-- Integrability of the actual cross term follows from its two L2 functions. -/
theorem integrable_modelSavedCross (s : ℝ) (hphase : ∀ w, |slicePhase s w| ≤ 1)
    (saved : Lp ℂ 2 gaussC) :
    Integrable (fun w => conj (exactModel s w) * saved w) gaussC := by
  have h : Integrable (fun w => conj (exactModelLp s hphase w) * saved w) gaussC := by
    simpa only [RCLike.inner_apply'] using
      L2.integrable_inner (𝕜 := ℂ) (exactModelLp s hphase) saved
  apply h.congr
  filter_upwards [exactModelLp_coe s hphase] with w hw
  rw [hw]

/-- The linear Gaussian base has an explicit nonconstant squared modulus. -/
theorem norm_linearSlice_sq (s : ℝ) (w : ℂ) :
    ‖linearSlice s w‖ ^ 2 = 1 + signedProfileRatio s ^ 2 * w.im ^ 2 := by
  have hre : (linearSlice s w).re = 1 := by simp [linearSlice]
  have him : (linearSlice s w).im = signedProfileRatio s * w.im := by
    unfold linearSlice
    simp only [Complex.add_im, Complex.one_im, Complex.mul_im, Complex.ofReal_re,
      Complex.ofReal_im, Complex.sub_im, Complex.conj_im, zero_mul,
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
    exactModelLp_coe s hphase]
    with w hsub hmodel
  simp only [Pi.sub_apply] at hsub
  rw [hsub, hmodel]

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

/-- Separate model-energy, saved-energy and complex cross receipts can be
combined without assuming integrability of a formal expanded expression. -/
theorem saved_model_norm_sq_decomposed (s : ℝ)
    (hphase : ∀ w, |slicePhase s w| ≤ 1) (saved : Lp ℂ 2 gaussC) :
    ‖exactModelLp s hphase - saved‖ ^ 2 =
      modelEnergy s + savedEnergy saved - 2 * (modelSavedCross s saved).re := by
  have hmodel : (∫ w, ‖exactModelLp s hphase w‖ ^ 2 ∂gaussC) = modelEnergy s := by
    apply integral_congr_ae
    filter_upwards [exactModelLp_coe s hphase] with w hw
    rw [hw]
  have hcross : (∫ w, ⟪exactModelLp s hphase w, saved w⟫_ℂ ∂gaussC) =
      modelSavedCross s saved := by
    apply integral_congr_ae
    filter_upwards [exactModelLp_coe s hphase] with w hw
    rw [RCLike.inner_apply', hw]
  rw [norm_sub_sq (𝕜 := ℂ), norm_sq_integral (exactModelLp s hphase),
    norm_sq_integral saved, L2.inner_def, hmodel, hcross]
  change modelEnergy s - 2 * (modelSavedCross s saved).re + savedEnergy saved = _
  ring

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

/-- Upper bounds on the two energies and a lower bound on the actual real
cross term give the complete conditional source-error estimate. -/
theorem norm_roundingSliceLp_sub_saved_of_energy_cross_bounds (s : ℝ) (hs : 0 < s)
    (hphase : ∀ w, |slicePhase s w| ≤ 1) (saved : Lp ℂ 2 gaussC)
    (modelUpper savedUpper crossLower epsilon : ℝ) (hepsilon : 0 ≤ epsilon)
    (hmodel : modelEnergy s ≤ modelUpper) (hsaved : savedEnergy saved ≤ savedUpper)
    (hcross : crossLower ≤ (modelSavedCross s saved).re)
    (hbudget : modelUpper + savedUpper - 2 * crossLower ≤ epsilon ^ 2) :
    ‖roundingSliceLp s hphase - saved‖ ≤ 5 * signedProfileRatio s ^ 2 + epsilon := by
  have hsq : ‖exactModelLp s hphase - saved‖ ^ 2 ≤ epsilon ^ 2 := by
    rw [saved_model_norm_sq_decomposed]
    linarith
  have herr : ‖exactModelLp s hphase - saved‖ ≤ epsilon :=
    (sq_le_sq₀ (norm_nonneg _) hepsilon).mp hsq
  exact (norm_roundingSliceLp_sub_saved s hs hphase saved).trans (add_le_add le_rfl herr)

/-- A norm enclosure for the complex cross integral costs twice its radius
in the squared-discrepancy budget. No coefficient-count factor is introduced. -/
theorem norm_roundingSliceLp_sub_saved_of_complex_cross_enclosure (s : ℝ) (hs : 0 < s)
    (hphase : ∀ w, |slicePhase s w| ≤ 1) (saved : Lp ℂ 2 gaussC)
    (modelUpper savedUpper : ℝ) (crossCenter : ℂ) (crossRadius epsilon : ℝ)
    (hepsilon : 0 ≤ epsilon) (hmodel : modelEnergy s ≤ modelUpper)
    (hsaved : savedEnergy saved ≤ savedUpper)
    (hcross : ‖modelSavedCross s saved - crossCenter‖ ≤ crossRadius)
    (hbudget : modelUpper + savedUpper - 2 * crossCenter.re +
      2 * crossRadius ≤ epsilon ^ 2) :
    ‖roundingSliceLp s hphase - saved‖ ≤ 5 * signedProfileRatio s ^ 2 + epsilon := by
  apply norm_roundingSliceLp_sub_saved_of_energy_cross_bounds s hs hphase saved
    modelUpper savedUpper (crossCenter.re - crossRadius) epsilon hepsilon hmodel hsaved
  · have hreal := (Complex.abs_re_le_norm (modelSavedCross s saved - crossCenter)).trans hcross
    rw [Complex.sub_re] at hreal
    have hlower := (abs_le.mp hreal).1
    linarith
  · linarith

end
open Lean Elab Command
run_cmd do
  for target in #[``phaseDifferenceLp_self, ``exactModelLp_coe,
      ``integrable_modelEnergy, ``integrable_modelSavedCross,
      ``norm_linearSlice_sq, ``norm_exactModel_sq,
      ``norm_roundingSliceLp_sub_saved, ``saved_model_norm_sq,
      ``saved_model_norm_sq_expanded, ``saved_model_norm_sq_decomposed,
      ``norm_roundingSliceLp_sub_saved_of_integral,
      ``norm_roundingSliceLp_sub_saved_of_energy_cross_bounds,
      ``norm_roundingSliceLp_sub_saved_of_complex_cross_enclosure] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains dependency do
        throwError m!"{target} depends on nonstandard axiom {dependency}"
end Grothe.UpperChaos.ProductionPhaseModelIntegral

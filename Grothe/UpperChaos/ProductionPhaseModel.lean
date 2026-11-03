import Grothe.UpperChaos.ProductionPhaseLeaf
import Grothe.UpperChaos.PhasePolynomialStability
import Grothe.UpperChaos.ZeroProfilePhaseStability
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Actual rounding-source error from the Gaussian base and a phase certificate.
The phase model and saved center are explicit comparison values. No actual
source-node or saved-byte enclosure is supplied here. Agent-ID: codex-8c4d. -/

open GrotheKernel
open scoped ComplexConjugate
namespace Grothe.UpperChaos.ProductionPhaseModel
open ZeroProfilePhaseStability
noncomputable section

/-- Propagate the proved Gaussian base remainder and a real phase error. -/
theorem norm_roundingSlice_sub_model (s : ℝ) (hs : 0 < s) (w : ℂ) (p : ℝ)
    (hphase : |phiT ((Real.sqrt s : ℂ), w)| ≤ 1) (hp : |p| ≤ 1) :
    ‖Tround ((Real.sqrt s : ℂ), w) - linearSlice s w * P3 p‖ ≤
      (5 / 2 : ℝ) * signedProfileRatio s ^ 2 * ‖w‖ ^ 2 +
        (5 / 2 : ℝ) * |phiT ((Real.sqrt s : ℂ), w) - p| := by
  change ‖F0ConditionalNode.phaseSlice s w * P3 (phiT ((Real.sqrt s : ℂ), w)) -
      linearSlice s w * P3 p‖ ≤ _
  exact (PhasePolynomialStability.norm_base_mul_P3_sub
    (F0ConditionalNode.norm_phaseSlice_le_one s w) hphase hp).trans
      (add_le_add (phaseSlice_sub_linear_bound s hs w) le_rfl)

/-- Instantiate the phase premise with a checker on the original source. -/
theorem norm_roundingSlice_sub_model_of_leaf (s : ℝ) (hs : 0 < s) (w : ℂ)
    (p : ℝ) (hp : |p| ≤ 1) (hts : termsOK phaseTerms = true) {b : Box}
    (hleaf : leafOK (commonDen phaseTerms) (denseA0 phaseTerms) b = true)
    (hb : InBox b (‖(Real.sqrt s : ℂ)‖ ^ 2) (‖w‖ ^ 2)
      (conj (Real.sqrt s : ℂ) * w).re) :
    ‖Tround ((Real.sqrt s : ℂ), w) - linearSlice s w * P3 p‖ ≤
      (5 / 2 : ℝ) * signedProfileRatio s ^ 2 * ‖w‖ ^ 2 +
        (5 / 2 : ℝ) * |phiT ((Real.sqrt s : ℂ), w) - p| :=
  norm_roundingSlice_sub_model s hs w p
    (ProductionPhaseLeaf.abs_phase_lt_one_of_leaf hts hleaf _ hb).le hp

/-- Keep the saved-center comparison separate from the actual source error. -/
theorem norm_roundingSlice_sub_saved_of_leaf (s : ℝ) (hs : 0 < s) (w : ℂ)
    (p : ℝ) (hp : |p| ≤ 1) (saved : ℂ)
    (hts : termsOK phaseTerms = true) {b : Box}
    (hleaf : leafOK (commonDen phaseTerms) (denseA0 phaseTerms) b = true)
    (hb : InBox b (‖(Real.sqrt s : ℂ)‖ ^ 2) (‖w‖ ^ 2)
      (conj (Real.sqrt s : ℂ) * w).re) :
    ‖Tround ((Real.sqrt s : ℂ), w) - saved‖ ≤
      ((5 / 2 : ℝ) * signedProfileRatio s ^ 2 * ‖w‖ ^ 2 +
        (5 / 2 : ℝ) * |phiT ((Real.sqrt s : ℂ), w) - p|) +
          ‖linearSlice s w * P3 p - saved‖ := by
  calc
    _ ≤ ‖Tround ((Real.sqrt s : ℂ), w) - linearSlice s w * P3 p‖ +
        ‖linearSlice s w * P3 p - saved‖ := by
      simpa only [dist_eq_norm] using dist_triangle (Tround ((Real.sqrt s : ℂ), w))
        (linearSlice s w * P3 p) saved
    _ ≤ _ := add_le_add (norm_roundingSlice_sub_model_of_leaf s hs w p hp hts hleaf hb) le_rfl

/-- At an exact profile zero, the positive-radius actual base is exactly one.
The case s=0 is deliberately not included in this unit-base identity. -/
theorem roundingSlice_at_profile_zero (s : ℝ) (hs : 0 < s) (hv : vprof s = 0) (w : ℂ) :
    Tround ((Real.sqrt s : ℂ), w) = P3 (phiT ((Real.sqrt s : ℂ), w)) := by
  have hrho : signedProfileRatio s = 0 := by simp [signedProfileRatio, hv]
  have h := phaseSlice_sub_linear_bound s hs w
  have hn : ‖F0ConditionalNode.phaseSlice s w - 1‖ ≤ 0 := by
    simpa [linearSlice, hrho] using h
  have hbase : F0ConditionalNode.phaseSlice s w = 1 :=
    sub_eq_zero.mp (norm_eq_zero.mp (le_antisymm hn (norm_nonneg _)))
  change F0ConditionalNode.phaseSlice s w * P3 (phiT ((Real.sqrt s : ℂ), w)) = _
  rw [hbase, one_mul]

end
open Lean Elab Command
run_cmd do
  for target in #[``norm_roundingSlice_sub_model, ``norm_roundingSlice_sub_model_of_leaf,
      ``norm_roundingSlice_sub_saved_of_leaf, ``roundingSlice_at_profile_zero] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains dependency do
        throwError m!"{target} depends on nonstandard axiom {dependency}"
end Grothe.UpperChaos.ProductionPhaseModel

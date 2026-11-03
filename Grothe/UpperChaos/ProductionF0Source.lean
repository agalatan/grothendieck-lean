import Grothe.UpperChaos.Rounder
import Grothe.UpperChaos.GradedHermite
import Lean.Util.CollectAxioms

/-! The actual F0 Gaussian source, independent of finite smoothing matrices.
Public definitions and norm statements are unchanged; only their dependency
boundary is smaller. Agent-ID: codex-7c2e. -/
set_option warningAsError true
open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace
namespace Grothe.UpperChaos.FixedChaosSmoothing
noncomputable section

/-- Actual Gaussian F0 coefficients at charge-one graded coordinates. -/
def baseGradedCoefficient (q c d : ℕ) : ℂ :=
  ∫ u, conj (hfun2 (gradedMode q c d) u) * F0 u ∂mu2

/-- The base phase belongs to L² without a phase-cover certificate. -/
theorem memLp_baseF0 : MemLp F0 2 mu2 :=
  MemLp.of_bound measurable_F0.aestronglyMeasurable 1
    (Filter.Eventually.of_forall fun u => Grothe.Haag.norm_ph_le _)

/-- The actual base vector has norm at most one independently of any
phase-cover calculation or quadrature node mass. -/
theorem norm_baseF0_le_one : ‖memLp_baseF0.toLp F0‖ ≤ 1 := by
  have ha : ∀ᵐ u ∂mu2, ‖(memLp_baseF0.toLp F0) u‖ ≤ 1 := by
    filter_upwards [memLp_baseF0.coeFn_toLp] with u hu
    rw [hu]
    exact Grothe.Haag.norm_ph_le _
  have h := Lp.norm_le_of_ae_bound (f := memLp_baseF0.toLp F0)
    (by norm_num : (0 : ℝ) ≤ 1) ha
  simpa [measureUnivNNReal] using h

end
end Grothe.UpperChaos.FixedChaosSmoothing

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.FixedChaosSmoothing.memLp_baseF0,
      ``Grothe.UpperChaos.FixedChaosSmoothing.norm_baseF0_le_one] do
    let dependencies ← Lean.collectAxioms target
    let unexpected := dependencies.filter fun n => !allowed.contains n
    unless unexpected.isEmpty do throwError m!"Unexpected base-source axioms: {unexpected}"

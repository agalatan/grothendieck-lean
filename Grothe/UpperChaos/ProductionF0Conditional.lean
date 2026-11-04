import Grothe.UpperChaos.ProductionF0Source
import Grothe.UpperChaos.F0ConditionalNode
import Mathlib.MeasureTheory.Integral.Prod
import Lean.Util.CollectAxioms

/-! Attach every actual full F0 coefficient to the conditional Gaussian
coefficient evaluated by the physical quadrature source. This is a Fubini
identity with the original Hermite normalization and original F0 retained.
No numerical approximation, node error or omitted-mode estimate is assumed.
Agent-ID: codex-7c2e. -/

set_option warningAsError true
open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace
namespace Grothe.UpperChaos.FixedChaosSmoothing
noncomputable section

/-- Tensor normalization is the product of the two coordinate normalizations. -/
theorem nrm2_eq_coordinate_product (i : Idx2) :
    nrm2 i = nrm i.1.1 i.1.2 * nrm i.2.1 i.2.2 := by
  unfold nrm2 nrm fac2
  rw [Nat.cast_mul, Real.sqrt_mul (by positivity), mul_inv]

/-- The actual normalized tensor basis factors pointwise. -/
theorem hfun2_eq_coordinate_product (i : Idx2) (z w : ℂ) :
    hfun2 i (z, w) = hfun i.1 z * hfun i.2 w := by
  rw [hfun2, nrm2_eq_coordinate_product]
  simp only [H2, hfun, Complex.ofReal_mul]
  ring

/-- Conditional source at an arbitrary first-coordinate point. -/
def baseConditionalCoefficient (z : ℂ) (c d : ℕ) : ℂ :=
  ∫ w, conj (hfun (c, d) w) * F0 (z, w) ∂gaussC

/-- The tensor coefficient is integrable without a phase-cover certificate. -/
theorem integrable_baseCoefficient (i : Idx2) :
    Integrable (fun u => conj (hfun2 i u) * F0 u) mu2 := by
  exact (memLp_hfun2 i).star.integrable_mul memLp_baseF0

/-- Every complete production grade is the iterated conditional coefficient
against the actual first-coordinate Hermite function. -/
theorem baseGradedCoefficient_iterated (q c d : ℕ) :
    baseGradedCoefficient q c d =
      ∫ z, conj (hfun (q + 1 - c, q - d) z) *
        baseConditionalCoefficient z c d ∂gaussC := by
  rw [baseGradedCoefficient, integral_prod _ (integrable_baseCoefficient (gradedMode q c d))]
  apply integral_congr_ae
  filter_upwards [] with z
  simp_rw [hfun2_eq_coordinate_product, map_mul]
  simp only [gradedMode]
  simp_rw [mul_assoc]
  rw [integral_const_mul]
  rfl

/-- At the physical squared-radius node, this is exactly aa04's actual
conditional coefficient, with no approximation to a stored entry. -/
theorem baseConditionalCoefficient_at_node (s : ℝ) (c d : ℕ) :
    baseConditionalCoefficient (Real.sqrt s : ℂ) c d =
      F0ConditionalNode.coefficient s (c, d) := by
  rw [F0ConditionalNode.coefficient_eq_integral]
  rfl

end
end Grothe.UpperChaos.FixedChaosSmoothing

run_cmd do
  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.FixedChaosSmoothing.norm_baseF0_le_one,
      ``Grothe.UpperChaos.FixedChaosSmoothing.baseGradedCoefficient_iterated,
      ``Grothe.UpperChaos.FixedChaosSmoothing.baseConditionalCoefficient_at_node] do
    let dependencies ← Lean.collectAxioms target
    Lean.logInfo m!"Actual F0 conditional audit {target}: {dependencies}"
    let unexpected := dependencies.filter fun n => !allowed.contains n
    unless unexpected.isEmpty do
      throwError m!"Unexpected source axioms: {unexpected}"

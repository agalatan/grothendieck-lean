import Grothe.UpperChaos.F0ConditionalNode
import Grothe.UpperChaos.ProductionFiniteLaplace
import Grothe.UpperChaos.Q0FiniteVectorError
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Finite auxiliary integrals for a fixed-node base-phase coefficient vector.

This module treats only the actual F0 conditional slice. It does not include
phiT, the P3 rounding multiplier, radial quadrature, or saved production bytes.
The fixed-node softening error is an explicit L2(gaussC) premise: the global
mu2 softening estimate cannot be specialized to an arbitrary radial node.
Bessel and the finite-vector triangle inequality avoid a mode-count loss.
Agent-ID: codex-aa04. -/

open MeasureTheory Grothe.LowerAnalytic
open scoped InnerProductSpace ComplexConjugate

namespace Grothe.UpperChaos.Q0ConditionalFiniteLaplace

open F0ConditionalNode

noncomputable section

/-- The physical affine phase argument at a nonnegative squared radial node. -/
def affineArgument (s : ℝ) (w : ℂ) : ℂ :=
  (Real.sqrt s : ℂ) +
    ((Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof s : ℝ) : ℂ) * w

/-- This is the actual base phase, including nodes with zero profile. -/
theorem phaseSlice_eq_affineArgument (s : ℝ) (hs : 0 ≤ s) (w : ℂ) :
    phaseSlice s w = Haag.ph (affineArgument s w) := by
  exact phaseSlice_eq s hs w

theorem measurable_affineArgument (s : ℝ) : Measurable (affineArgument s) := by
  unfold affineArgument
  fun_prop

/-- Softening only the physical affine argument at the fixed radial node. -/
def softSlice (s η : ℝ) (w : ℂ) : ℂ := softPhase η (affineArgument s w)

/-- The same conditional response with its auxiliary integral truncated. -/
def finiteLaplaceSlice (s η T : ℝ) (w : ℂ) : ℂ :=
  finiteLaplacePhase η T (affineArgument s w)

theorem measurable_softSlice (s η : ℝ) : Measurable (softSlice s η) := by
  have hm := measurable_affineArgument s
  unfold softSlice softPhase
  fun_prop

theorem measurable_finiteLaplaceSlice (s η T : ℝ) :
    Measurable (finiteLaplaceSlice s η T) :=
  (measurable_finiteLaplacePhase η T).comp (measurable_affineArgument s)

/-- The softened slice is disk-valued even at a zero argument. -/
theorem norm_softSlice_le_one (s η : ℝ) (w : ℂ) : ‖softSlice s η w‖ ≤ 1 := by
  rw [softSlice, softPhase, norm_div, Complex.norm_real,
    Real.norm_of_nonneg (Real.sqrt_nonneg _)]
  apply div_le_one_of_le₀ _ (Real.sqrt_nonneg _)
  exact Real.le_sqrt_of_sq_le (by nlinarith [sq_nonneg η])

/-- The finite auxiliary integral remains disk-valued at every Gaussian point. -/
theorem norm_finiteLaplaceSlice_le_one (s η T : ℝ) (hT : 0 ≤ T) (w : ℂ) :
    ‖finiteLaplaceSlice s η T w‖ ≤ 1 :=
  norm_finiteLaplacePhase_le_one η T hT (affineArgument s w)

theorem softSlice_memLp (s η : ℝ) : MemLp (softSlice s η) 2 gaussC :=
  MemLp.of_bound (measurable_softSlice s η).aestronglyMeasurable 1
    (Filter.Eventually.of_forall (norm_softSlice_le_one s η))

theorem finiteLaplaceSlice_memLp (s η T : ℝ) (hT : 0 ≤ T) :
    MemLp (finiteLaplaceSlice s η T) 2 gaussC :=
  MemLp.of_bound (measurable_finiteLaplaceSlice s η T).aestronglyMeasurable 1
    (Filter.Eventually.of_forall (norm_finiteLaplaceSlice_le_one s η T hT))

def softSliceLp (s η : ℝ) : Lp ℂ 2 gaussC :=
  (softSlice_memLp s η).toLp (softSlice s η)

def finiteLaplaceSliceLp (s η T : ℝ) (hT : 0 ≤ T) : Lp ℂ 2 gaussC :=
  (finiteLaplaceSlice_memLp s η T hT).toLp (finiteLaplaceSlice s η T)

/-- A coefficient of one actual finite-integral Gaussian response. -/
def finiteLaplaceCoefficient (s η T : ℝ) (hT : 0 ≤ T) (i : ℕ × ℕ) : ℂ :=
  ⟪hvec i, finiteLaplaceSliceLp s η T hT⟫_ℂ

/-- The coefficient is the normalized Hermite Gaussian integral. -/
theorem finiteLaplaceCoefficient_eq_integral
    (s η T : ℝ) (hT : 0 ≤ T) (i : ℕ × ℕ) :
    finiteLaplaceCoefficient s η T hT i =
      ∫ w, conj (hfun i w) * finiteLaplaceSlice s η T w ∂gaussC := by
  exact inner_toLp (memLp_hfun i) (finiteLaplaceSlice_memLp s η T hT)

/-- Absolute Fubini moves the finite auxiliary interval outside the conditional
Gaussian integral. The Hermite factor is proved integrable, not assumed. -/
theorem finiteLaplaceCoefficient_eq_auxiliary_integral
    (s η T : ℝ) (hT : 0 ≤ T) (i : ℕ × ℕ) :
    finiteLaplaceCoefficient s η T hT i =
      (Real.sqrt Real.pi : ℂ)⁻¹ * ∫ t in (0 : ℝ)..T,
        ∫ w, conj (hfun i w) * softPhaseLaplaceKernel η (affineArgument s w) t
          ∂gaussC := by
  have hc : Continuous (hfun i) := by
    unfold hfun
    exact continuous_const.mul (continuous_ev _)
  have hm : Measurable (fun w => conj (hfun i w)) :=
    Complex.continuous_conj.measurable.comp hc.measurable
  have hp : MemLp (fun w => conj (hfun i w)) 2 gaussC :=
    (memLp_hfun i).congr_norm hm.aestronglyMeasurable
      (Filter.Eventually.of_forall fun w => by simp only [Complex.norm_conj])
  rw [finiteLaplaceCoefficient_eq_integral]
  exact integral_mul_finiteLaplacePhase gaussC η T hT hm
    (measurable_affineArgument s) (hp.integrable (by norm_num))

/-- The auxiliary tail is uniformly small on this fixed-node probability space.
No global two-Gaussian softening estimate is used. -/
theorem norm_softSliceLp_sub_finiteLaplaceSliceLp_le
    (s η T : ℝ) (hη : 0 < η) (hT : 0 ≤ T) :
    ‖softSliceLp s η - finiteLaplaceSliceLp s η T hT‖ ≤
      Real.exp (-(η ^ 2 * T)) := by
  have ha : ∀ᵐ w ∂gaussC,
      ‖(softSliceLp s η - finiteLaplaceSliceLp s η T hT) w‖ ≤
        Real.exp (-(η ^ 2 * T)) := by
    filter_upwards [Lp.coeFn_sub (softSliceLp s η) (finiteLaplaceSliceLp s η T hT),
      (softSlice_memLp s η).coeFn_toLp,
      (finiteLaplaceSlice_memLp s η T hT).coeFn_toLp] with w hsub hs hf
    rw [hsub]
    change ‖((softSlice_memLp s η).toLp (softSlice s η)) w -
      ((finiteLaplaceSlice_memLp s η T hT).toLp (finiteLaplaceSlice s η T)) w‖ ≤ _
    rw [hs, hf]
    exact norm_softPhase_sub_finiteLaplacePhase_le η T hη hT (affineArgument s w)
  have hb := Lp.norm_le_of_ae_bound
    (f := softSliceLp s η - finiteLaplaceSliceLp s η T hT) (Real.exp_pos _).le ha
  simpa [measureUnivNNReal] using hb

/-- Actual-to-finite L2 error at one node, keeping its softening cost explicit. -/
theorem norm_phaseSliceLp_sub_finiteLaplaceSliceLp_le
    (s η T δsoft : ℝ) (hη : 0 < η) (hT : 0 ≤ T)
    (hsoft : ‖phaseSliceLp s - softSliceLp s η‖ ≤ δsoft) :
    ‖phaseSliceLp s - finiteLaplaceSliceLp s η T hT‖ ≤
      δsoft + Real.exp (-(η ^ 2 * T)) := by
  calc
    _ = ‖(phaseSliceLp s - softSliceLp s η) +
        (softSliceLp s η - finiteLaplaceSliceLp s η T hT)‖ := by
      congr 1
      abel
    _ ≤ ‖phaseSliceLp s - softSliceLp s η‖ +
        ‖softSliceLp s η - finiteLaplaceSliceLp s η T hT‖ := norm_add_le _ _
    _ ≤ δsoft + Real.exp (-(η ^ 2 * T)) :=
      add_le_add hsoft (norm_softSliceLp_sub_finiteLaplaceSliceLp_le s η T hη hT)

/-- Bessel charges the whole response error once over any finite mode family. -/
theorem coefficient_finiteLaplace_error_sq_le
    (s η T δsoft : ℝ) (hη : 0 < η) (hT : 0 ≤ T)
    (S : Finset (ℕ × ℕ))
    (hsoft : ‖phaseSliceLp s - softSliceLp s η‖ ≤ δsoft) :
    (∑ i ∈ S, ‖coefficient s i - finiteLaplaceCoefficient s η T hT i‖ ^ 2) ≤
      (δsoft + Real.exp (-(η ^ 2 * T))) ^ 2 := by
  have hδ : 0 ≤ δsoft := (norm_nonneg _).trans hsoft
  apply Q0FiniteVectorError.finite_orthonormal_sample_error hvec orthonormal_hvec
    (phaseSliceLp s - finiteLaplaceSliceLp s η T hT) S
    (fun i => coefficient s i - finiteLaplaceCoefficient s η T hT i)
    (δsoft + Real.exp (-(η ^ 2 * T))) (by positivity)
    (norm_phaseSliceLp_sub_finiteLaplaceSliceLp_le s η T δsoft hη hT hsoft)
  intro i _
  rw [inner_sub_right]
  rfl

/-- A certified coupled finite-integral-to-saved discrepancy combines with the
actual response error. A per-entry tolerance cannot replace this vector premise. -/
theorem actual_saved_error_sq_le
    (s η T δsoft ε : ℝ) (hη : 0 < η) (hT : 0 ≤ T)
    (S : Finset (ℕ × ℕ)) (center : ℕ × ℕ → ℂ) (hε : 0 ≤ ε)
    (hsoft : ‖phaseSliceLp s - softSliceLp s η‖ ≤ δsoft)
    (hcenter : (∑ i ∈ S,
      ‖finiteLaplaceCoefficient s η T hT i - center i‖ ^ 2) ≤ ε ^ 2) :
    (∑ i ∈ S, ‖coefficient s i - center i‖ ^ 2) ≤
      (δsoft + Real.exp (-(η ^ 2 * T)) + ε) ^ 2 := by
  have hδ : 0 ≤ δsoft := (norm_nonneg _).trans hsoft
  have hcenter' : (∑ i ∈ S,
      ‖center i - finiteLaplaceCoefficient s η T hT i‖ ^ 2) ≤ ε ^ 2 := by
    simpa only [norm_sub_rev] using hcenter
  have h := Q0FiniteVectorError.sum_norm_sub_sq_le S
    (fun i => coefficient s i - finiteLaplaceCoefficient s η T hT i)
    (fun i => center i - finiteLaplaceCoefficient s η T hT i)
    (δsoft + Real.exp (-(η ^ 2 * T))) ε (by positivity) hε
    (coefficient_finiteLaplace_error_sq_le s η T δsoft hη hT S hsoft) hcenter'
  simpa only [sub_sub_sub_cancel_right] using h

end
end Grothe.UpperChaos.Q0ConditionalFiniteLaplace

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0ConditionalFiniteLaplace.phaseSlice_eq_affineArgument,
      ``Grothe.UpperChaos.Q0ConditionalFiniteLaplace.norm_softSlice_le_one,
      ``Grothe.UpperChaos.Q0ConditionalFiniteLaplace.norm_finiteLaplaceSlice_le_one,
      ``Grothe.UpperChaos.Q0ConditionalFiniteLaplace.finiteLaplaceCoefficient_eq_integral,
      ``Grothe.UpperChaos.Q0ConditionalFiniteLaplace.finiteLaplaceCoefficient_eq_auxiliary_integral,
      ``Grothe.UpperChaos.Q0ConditionalFiniteLaplace.norm_softSliceLp_sub_finiteLaplaceSliceLp_le,
      ``Grothe.UpperChaos.Q0ConditionalFiniteLaplace.norm_phaseSliceLp_sub_finiteLaplaceSliceLp_le,
      ``Grothe.UpperChaos.Q0ConditionalFiniteLaplace.coefficient_finiteLaplace_error_sq_le,
      ``Grothe.UpperChaos.Q0ConditionalFiniteLaplace.actual_saved_error_sq_le] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

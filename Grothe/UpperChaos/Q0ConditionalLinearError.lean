import Grothe.UpperChaos.ZeroProfileSavedCenter
import Grothe.UpperChaos.Q0FiniteVectorError
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Coupled conditional coefficient errors near a profile zero

The whole Gaussian phase remainder is projected onto a finite Hermite family
before any error aggregation. The analytic and parameter errors therefore
have no mode-count factor. The saved-center comparison is one squared-vector
budget, not a bound for a single coordinate. Actual source-node and saved-byte
bindings remain the responsibility of callers. Agent-ID: codex-aa04.
-/

open MeasureTheory
open scoped InnerProductSpace

namespace Grothe.UpperChaos.Q0ConditionalLinearError

open F0ConditionalNode ZeroProfilePhaseStability

noncomputable section

/-- Bessel bounds the actual selected coefficient remainder by the whole
Gaussian phase remainder, uniformly over every finite mode set. The signed
profile ratio may be zero. -/
theorem coefficient_linear_error_sq_le
    (s : ℝ) (hs : 0 < s) (S : Finset (ℕ × ℕ)) :
    (∑ i ∈ S, ‖coefficient s i - linearCoefficient s i‖ ^ 2) ≤
      (5 * signedProfileRatio s ^ 2) ^ 2 := by
  apply Q0FiniteVectorError.finite_orthonormal_sample_error hvec orthonormal_hvec
    (phaseSliceLp s - linearSliceLp s) S
    (fun i => coefficient s i - linearCoefficient s i)
    (5 * signedProfileRatio s ^ 2) (by positivity)
    (norm_phaseSliceLp_sub_linear s hs)
  intro i _
  rw [inner_sub_right, ← linearCoefficient_eq_inner]
  rfl

/-- Changing the scalar model parameter affects only its two linear Hermite
coordinates. Their coupled radius is at most the parameter error, independent
of the number of selected modes. -/
theorem linear_parameter_error_sq_le
    (s r : ℝ) (S : Finset (ℕ × ℕ)) :
    (∑ i ∈ S, ‖linearCoefficient s i - linearCenter r i‖ ^ 2) ≤
      |signedProfileRatio s - r| ^ 2 := by
  let x := ((((signedProfileRatio s - r) / 2 : ℝ) : ℂ)) •
    (hvec (1, 0) - hvec (0, 1))
  have hx : ‖x‖ ≤ |signedProfileRatio s - r| := by
    calc
      ‖x‖ = (|signedProfileRatio s - r| / 2) *
          ‖hvec (1, 0) - hvec (0, 1)‖ := by
        dsimp only [x]
        rw [norm_smul, Complex.norm_real, Real.norm_eq_abs, abs_div]
        norm_num
      _ ≤ (|signedProfileRatio s - r| / 2) *
          (‖hvec (1, 0)‖ + ‖hvec (0, 1)‖) :=
        mul_le_mul_of_nonneg_left (norm_sub_le _ _) (by positivity)
      _ = |signedProfileRatio s - r| := by
        rw [orthonormal_hvec.norm_eq_one (1, 0), orthonormal_hvec.norm_eq_one (0, 1)]
        ring
  apply Q0FiniteVectorError.finite_orthonormal_sample_error hvec orthonormal_hvec x S
    (fun i => linearCoefficient s i - linearCenter r i)
    |signedProfileRatio s - r| (abs_nonneg _) hx
  intro i _
  dsimp only [x]
  rw [inner_smul_right, inner_sub_right]
  simp only [linearCoefficient, linearCenter, inner_hvec]
  push_cast
  ring

private theorem coefficient_model_error_sq_le
    (s : ℝ) (hs : 0 < s) (r : ℝ) (S : Finset (ℕ × ℕ)) :
    (∑ i ∈ S, ‖coefficient s i - linearCenter r i‖ ^ 2) ≤
      (5 * signedProfileRatio s ^ 2 + |signedProfileRatio s - r|) ^ 2 := by
  have hparameter :
      (∑ i ∈ S, ‖linearCenter r i - linearCoefficient s i‖ ^ 2) ≤
        |signedProfileRatio s - r| ^ 2 := by
    simpa only [norm_sub_rev] using linear_parameter_error_sq_le s r S
  have h := Q0FiniteVectorError.sum_norm_sub_sq_le S
    (fun i => coefficient s i - linearCoefficient s i)
    (fun i => linearCenter r i - linearCoefficient s i)
    (5 * signedProfileRatio s ^ 2) |signedProfileRatio s - r|
    (by positivity) (abs_nonneg _)
    (coefficient_linear_error_sq_le s hs S) hparameter
  simpa only [sub_sub_sub_cancel_right] using h

/-- Compare the actual Gaussian coefficient vector with supplied saved centers.
The last premise is the total squared discrepancy from the explicit sparse
model over the same finite set. It must include every selected stored or
zero-completed coordinate; it is not a per-entry tolerance. -/
theorem actual_saved_error_sq_le
    (s : ℝ) (hs : 0 < s) (r : ℝ) (S : Finset (ℕ × ℕ))
    (center : ℕ × ℕ → ℂ) (ε : ℝ) (hε : 0 ≤ ε)
    (hcenter : (∑ i ∈ S, ‖linearCenter r i - center i‖ ^ 2) ≤ ε ^ 2) :
    (∑ i ∈ S, ‖coefficient s i - center i‖ ^ 2) ≤
      (5 * signedProfileRatio s ^ 2 + |signedProfileRatio s - r| + ε) ^ 2 := by
  have hcenter' : (∑ i ∈ S, ‖center i - linearCenter r i‖ ^ 2) ≤ ε ^ 2 := by
    simpa only [norm_sub_rev] using hcenter
  have h := Q0FiniteVectorError.sum_norm_sub_sq_le S
    (fun i => coefficient s i - linearCenter r i)
    (fun i => center i - linearCenter r i)
    (5 * signedProfileRatio s ^ 2 + |signedProfileRatio s - r|) ε
    (by positivity) hε (coefficient_model_error_sq_le s hs r S) hcenter'
  simpa only [sub_sub_sub_cancel_right] using h

end
end Grothe.UpperChaos.Q0ConditionalLinearError

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0ConditionalLinearError.coefficient_linear_error_sq_le,
      ``Grothe.UpperChaos.Q0ConditionalLinearError.linear_parameter_error_sq_le,
      ``Grothe.UpperChaos.Q0ConditionalLinearError.actual_saved_error_sq_le] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"

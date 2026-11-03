import Grothe.UpperChaos.ZeroProfilePhaseLinearization
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Concrete certificate interface for the original saved coefficients near a
profile zero. All numerical input premises concern the physical profile ratio
and saved scalar bytes, not the unknown true coefficient error.
Agent-ID: codex-8c4d. -/
open scoped ComplexConjugate
namespace Grothe.UpperChaos.ZeroProfilePhaseStability
noncomputable section

/-- Model center at a chosen real parameter, suitable for a rational certificate. -/
def linearCenter (r : ℝ) (i : ℕ × ℕ) : ℂ :=
  (if i = (0, 0) then 1 else 0) + ((r / 2 : ℝ) : ℂ) *
    ((if i = (1, 0) then 1 else 0) - (if i = (0, 1) then 1 else 0))

/-- Only the two linear coordinates vary with the model parameter. -/
theorem linearCoefficient_parameter_error (s r : ℝ) (i : ℕ × ℕ) :
    ‖linearCoefficient s i - linearCenter r i‖ ≤ |signedProfileRatio s - r| / 2 := by
  let D : ℂ := (if i = (1, 0) then 1 else 0) - (if i = (0, 1) then 1 else 0)
  have hD : ‖D‖ ≤ 1 := by
    dsimp only [D]
    split_ifs <;> norm_num
  have heq : linearCoefficient s i - linearCenter r i =
      (((signedProfileRatio s - r) / 2 : ℝ) : ℂ) * D := by
    dsimp only [linearCoefficient, linearCenter, D]
    push_cast
    ring
  calc
    _ = |(signedProfileRatio s - r) / 2| * ‖D‖ := by
      rw [heq, norm_mul, Complex.norm_real, Real.norm_eq_abs]
    _ ≤ |(signedProfileRatio s - r) / 2| * 1 :=
      mul_le_mul_of_nonneg_left hD (abs_nonneg _)
    _ = _ := by rw [mul_one, abs_div]; norm_num

/-- Separate the actual Gaussian remainder, parameter interval, and the
comparison of a stored scalar with the explicit three-mode model. -/
theorem actual_saved_error_bound (s : ℝ) (hs : 0 < s) (r saved : ℝ)
    (i : ℕ × ℕ) :
    ‖F0ConditionalNode.coefficient s i - (saved : ℂ)‖ ≤
      5 * signedProfileRatio s ^ 2 + |signedProfileRatio s - r| / 2 +
        ‖linearCenter r i - (saved : ℂ)‖ := by
  have htri : ‖linearCoefficient s i - (saved : ℂ)‖ ≤
      ‖linearCoefficient s i - linearCenter r i‖ + ‖linearCenter r i - (saved : ℂ)‖ := by
    simpa only [dist_eq_norm] using dist_triangle (linearCoefficient s i)
      (linearCenter r i) (saved : ℂ)
  calc
    _ ≤ ‖F0ConditionalNode.coefficient s i - linearCoefficient s i‖ +
        ‖linearCoefficient s i - (saved : ℂ)‖ := by
      simpa only [dist_eq_norm] using dist_triangle (F0ConditionalNode.coefficient s i)
        (linearCoefficient s i) (saved : ℂ)
    _ ≤ 5 * signedProfileRatio s ^ 2 +
        (‖linearCoefficient s i - linearCenter r i‖ + ‖linearCenter r i - (saved : ℂ)‖) :=
      add_le_add (norm_coefficient_sub_linear s hs i) htri
    _ ≤ 5 * signedProfileRatio s ^ 2 +
        (|signedProfileRatio s - r| / 2 + ‖linearCenter r i - (saved : ℂ)‖) :=
      add_le_add le_rfl (add_le_add (linearCoefficient_parameter_error s r i) le_rfl)
    _ = _ := by ring

/-- A closed exact scalar budget; this is not an actual-node certificate. -/
theorem saved_error_budget :
    (5 : ℚ) * (1 / 4000000) ^ 2 + (1 / 10 ^ 13) / 2 + 1 / (2 * 10 ^ 12) <
      1 / 10 ^ 12 := by
  decide +kernel

/-- The resulting actual error is strict and uniform over every true mode.
For absent stored modes, use saved=0 and prove the same explicit model check.
Actual source-node, profile, and saved-byte bindings must instantiate the inputs. -/
theorem actual_saved_error_lt (s : ℝ) (hs : 0 < s) (r saved : ℝ) (i : ℕ × ℕ)
    (hρ : |signedProfileRatio s| ≤ 1 / 4000000)
    (hparameter : |signedProfileRatio s - r| ≤ 1 / 10 ^ 13)
    (hsaved : ‖linearCenter r i - (saved : ℂ)‖ ≤ 1 / (2 * 10 ^ 12)) :
    ‖F0ConditionalNode.coefficient s i - (saved : ℂ)‖ < 1 / 10 ^ 12 := by
  have hsq : signedProfileRatio s ^ 2 ≤ (1 / 4000000 : ℝ) ^ 2 := by
    calc
      _ = |signedProfileRatio s| ^ 2 := by rw [sq_abs]
      _ ≤ _ := pow_le_pow_left₀ (abs_nonneg _) hρ 2
  have hquad : 5 * signedProfileRatio s ^ 2 ≤ 5 * (1 / 4000000 : ℝ) ^ 2 :=
    mul_le_mul_of_nonneg_left hsq (by norm_num)
  have hparameter' : |signedProfileRatio s - r| / 2 ≤ (1 / 10 ^ 13 : ℝ) / 2 :=
    div_le_div_of_nonneg_right hparameter (by norm_num)
  have hbudget : (5 : ℝ) * (1 / 4000000) ^ 2 + (1 / 10 ^ 13) / 2 +
      1 / (2 * 10 ^ 12) < 1 / 10 ^ 12 := by
    exact_mod_cast saved_error_budget
  exact (actual_saved_error_bound s hs r saved i).trans_lt
    ((add_le_add (add_le_add hquad hparameter') hsaved).trans_lt hbudget)

open Lean Elab Command
run_cmd do
  for target in #[``linearCoefficient_parameter_error, ``actual_saved_error_bound,
      ``saved_error_budget, ``actual_saved_error_lt] do
    for dependency in (← Lean.collectAxioms target) do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains dependency do
        throwError m!"{target} depends on nonstandard axiom {dependency}"
end
end Grothe.UpperChaos.ZeroProfilePhaseStability

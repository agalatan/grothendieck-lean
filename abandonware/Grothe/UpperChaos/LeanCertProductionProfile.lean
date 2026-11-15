import Grothe.UpperChaos.ProfileRootSound

/-!
# Actual q0-panel profile and conditional denominator

These bounds use the production profile coefficients and exact normalized
Laguerre factors through the existing centered-Horner soundness theorem. They
bound one component of the q0 Wick evaluator; no panel integral or coefficient
is enclosed here.

Agent-ID: codex-8c4d
-/

namespace Grothe.UpperChaos.LeanCertProductionProfile

open GrotheKernel Grothe.UpperChaos.ProfileRootScreen

noncomputable section

/-- The actual affine profile coefficient used by the Gaussian response. -/
def q0Kappa (s : ℝ) : ℝ :=
  Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s

/-- Conditional Gaussian rate for the first source at the scale `t = 1`. -/
def q0Beta (s : ℝ) : ℝ := 1 + (Grothe.Upper.phaseEpsQ : ℝ) + q0Kappa s ^ 2

private def q0Row : Row := ⟨1, 1001 / 1000, false⟩

set_option maxRecDepth 65536 in
set_option maxHeartbeats 0 in
private theorem q0Row_check :
    (30065 : ℤ) * D ≤ 100000 * (evalRow q0Row).lo ∧
      100000 * (evalRow q0Row).hi ≤ 30068 * D := by
  decide +kernel

/-- Source-bound enclosure of the actual normalized profile across the exact
q0 radial panel. -/
theorem q0_profile_panel_bounds (s : ℝ) (hlo : 1 ≤ s)
    (hhi : s ≤ 1001 / 1000) :
    (30065 / 100000 : ℝ) ≤ q0Kappa s ∧ q0Kappa s ≤ 30068 / 100000 := by
  have hm : Grothe.Upper.mem (q0Kappa s) (evalRow q0Row) := by
    have h := row_horner_mem q0Row s (by simpa [q0Row] using hlo)
      (by simpa [q0Row] using hhi)
    simpa only [centered_horner_profile, q0Kappa] using h
  have hL : (30065 : ℝ) * D ≤ 100000 * ((evalRow q0Row).lo : ℝ) := by
    exact_mod_cast q0Row_check.1
  have hU : (100000 : ℝ) * ((evalRow q0Row).hi : ℝ) ≤ 30068 * D := by
    exact_mod_cast q0Row_check.2
  have hD : 0 < (D : ℝ) := Grothe.Upper.D_pos
  unfold Grothe.Upper.mem at hm
  constructor
  · apply le_of_mul_le_mul_right _ hD
    linarith [hm.1]
  · apply le_of_mul_le_mul_right _ hD
    linarith [hm.2]

/-- The profile bound applies to the literal first-coordinate profile inside
`taylorConditionalWick` after the squared-radius substitution. -/
theorem q0Kappa_eq_wick_profile (s : ℝ) (hs : 0 ≤ s) :
    q0Kappa s = Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) *
      vprof (‖(Real.sqrt s : ℂ)‖ ^ 2) := by
  have hz : ‖(Real.sqrt s : ℂ)‖ ^ 2 = s := by
    rw [← Complex.normSq_eq_norm_sq, Complex.normSq_ofReal]
    exact Real.mul_self_sqrt hs
  unfold q0Kappa
  rw [hz]

/-- The rate bounded below is exactly the first-source, unit-scale rate in
the conditional Wick evaluator. -/
theorem q0Beta_eq_wick_rate (s : ℝ) (hs : 0 ≤ s) :
    q0Beta s = 1 + (1 : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ) +
      (Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) *
        vprof (‖(Real.sqrt s : ℂ)‖ ^ 2)) ^ 2 * 1 := by
  rw [← q0Kappa_eq_wick_profile s hs]
  simp [q0Beta]

/-- The actual conditional rate is strictly positive and bounded on the
same panel. This is useful for safely evaluating its reciprocal powers. -/
theorem q0_beta_panel_bounds (s : ℝ) (hlo : 1 ≤ s)
    (hhi : s ≤ 1001 / 1000) :
    (214039 / 100000 : ℝ) ≤ q0Beta s ∧ q0Beta s ≤ 214041 / 100000 := by
  obtain ⟨hL, hU⟩ := q0_profile_panel_bounds s hlo hhi
  have hnonneg : 0 ≤ q0Kappa s := by linarith
  have hupper := mul_nonneg (sub_nonneg.mpr hU)
    (add_nonneg hnonneg (by norm_num : (0 : ℝ) ≤ 30068 / 100000))
  constructor <;> dsimp [q0Beta] <;>
    norm_num [Grothe.Upper.phaseEpsQ] <;>
    nlinarith [sq_nonneg (q0Kappa s - (30065 / 100000 : ℝ)), hupper]

end
end Grothe.UpperChaos.LeanCertProductionProfile

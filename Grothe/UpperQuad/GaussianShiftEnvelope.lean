import Grothe.UpperQuad.GaussianShiftVector

/-!
# Closed-form majorants for the translated Gaussian coefficients

Bounds on the imaginary squares of the radial variable and the signed shift replace those
variables in the coefficient-energy estimate. This analytic layer uses no interval checker
and introduces no scaling of the phase or factor for the number of retained modes.

Agent-ID: codex-2f3d. Refs #334, #343.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.GaussianShift

noncomputable section

/-- The phase envelope with an upper bound for the sum of imaginary squares. -/
def phaseBoundSq (j : ℕ) (eta S : ℝ) : ℝ :=
  (eta ^ (35 * j))⁻¹ * ((1 - eta) ^ 2)⁻¹ *
    Real.exp (4 * ((j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ)) / (1 - eta) * S)

/-- The coefficient-energy envelope for squared imaginary bounds `Y` and `B2`. -/
def coefficientBoundSq (j D : ℕ) (eta Y B2 : ℝ) : ℝ :=
  phaseBoundSq j eta (Y + B2) *
    Real.exp (2 * B2 + 2 * Real.sqrt (2 * (D : ℝ)) * Real.sqrt B2)

/-- The phase envelope in inverse-power and quotient form, with the production epsilon. -/
theorem phaseBoundSq_eq (j : ℕ) (eta S : ℝ) :
    phaseBoundSq j eta S = eta⁻¹ ^ (35 * j) / (1 - eta) ^ 2 *
      Real.exp (4 * (j : ℝ) * (21 / 20 : ℝ) * S / (1 - eta)) := by
  have he : 4 * ((j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ)) / (1 - eta) * S =
      4 * (j : ℝ) * (21 / 20 : ℝ) * S / (1 - eta) := by
    norm_num [Grothe.Upper.phaseEpsQ]
    ring
  rw [phaseBoundSq, he]
  simp only [inv_pow, div_eq_mul_inv]

theorem phaseBoundSq_nonneg (j : ℕ) {eta : ℝ} (heta : 0 ≤ eta) (S : ℝ) :
    0 ≤ phaseBoundSq j eta S := by
  unfold phaseBoundSq
  positivity

theorem coefficientBoundSq_nonneg (j D : ℕ) {eta : ℝ} (heta : 0 ≤ eta)
    (Y B2 : ℝ) : 0 ≤ coefficientBoundSq j D eta Y B2 :=
  mul_nonneg (phaseBoundSq_nonneg j heta _) (Real.exp_pos _).le

/-- Increasing both imaginary squares gives a larger phase envelope. -/
theorem phaseEnvelopeSq_le_phaseBoundSq (j : ℕ) {eta : ℝ}
    (heta0 : 0 < eta) (heta1 : eta < 1) (r : ℂ) (b : ℝ)
    {Y B2 : ℝ} (hY : r.im ^ 2 ≤ Y) (hB2 : b ^ 2 ≤ B2) :
    phaseEnvelopeSq j eta r b ≤ phaseBoundSq j eta (Y + B2) := by
  have hden : 0 < 1 - eta := sub_pos.mpr heta1
  have heps : 0 ≤ (Grothe.Upper.phaseEpsQ : ℝ) := by
    norm_num [Grothe.Upper.phaseEpsQ]
  have hweight : 0 ≤ 4 * ((j : ℝ) * (Grothe.Upper.phaseEpsQ : ℝ)) / (1 - eta) := by
    positivity
  unfold phaseEnvelopeSq phaseBoundSq
  apply mul_le_mul_of_nonneg_left
    (Real.exp_le_exp.mpr
      (mul_le_mul_of_nonneg_left (add_le_add hY hB2) hweight))
  positivity

/-- The translation factor increases with its squared imaginary bound. -/
theorem translationFactor_le (D : ℕ) (b : ℝ) {B2 : ℝ} (hB2 : b ^ 2 ≤ B2) :
    Real.exp (2 * b ^ 2 + 2 * |b| * Real.sqrt (2 * (D : ℝ))) ≤
      Real.exp (2 * B2 + 2 * Real.sqrt (2 * (D : ℝ)) * Real.sqrt B2) := by
  have habs : |b| ≤ Real.sqrt B2 := by
    simpa only [Real.sqrt_sq_eq_abs] using Real.sqrt_le_sqrt hB2
  have hcross := mul_le_mul_of_nonneg_right habs (Real.sqrt_nonneg (2 * (D : ℝ)))
  apply Real.exp_le_exp.mpr
  nlinarith only [hB2, hcross]

/-- The exact phase and translation expression is bounded by the closed-form envelope. -/
theorem translation_phase_le_coefficientBoundSq (j D : ℕ) {eta : ℝ}
    (heta0 : 0 < eta) (heta1 : eta < 1) (r : ℂ) (b : ℝ)
    {Y B2 : ℝ} (hY : r.im ^ 2 ≤ Y) (hB2 : b ^ 2 ≤ B2) :
    Real.exp (2 * b ^ 2 + 2 * |b| * Real.sqrt (2 * (D : ℝ))) *
      phaseEnvelopeSq j eta r b ≤ coefficientBoundSq j D eta Y B2 := by
  rw [coefficientBoundSq, mul_comm (phaseBoundSq j eta (Y + B2))]
  exact mul_le_mul (translationFactor_le D b hB2)
    (phaseEnvelopeSq_le_phaseBoundSq j heta0 heta1 r b hY hB2)
    (phaseEnvelopeSq_pos j heta0 heta1 r b).le (Real.exp_pos _).le

/-- Any retained finite coefficient vector satisfies the same envelope without multiplicity. -/
theorem sum_coefficient_sq_le_coefficientBoundSq (j : ℕ) (hj : 0 < j) {eta : ℝ}
    (heta0 : 0 < eta) (heta1 : eta < 1) (r : ℂ) (a b : ℝ)
    (D : ℕ) (S : Finset (ℕ × ℕ)) (hD : ∀ i ∈ S, i.1 + i.2 ≤ D)
    {Y B2 : ℝ} (hY : r.im ^ 2 ≤ Y) (hB2 : b ^ 2 ≤ B2) :
    ∑ i ∈ S, ‖coefficient j r a b i‖ ^ 2 ≤ coefficientBoundSq j D eta Y B2 :=
  (sum_coefficient_sq_le j hj heta0 heta1 r a b D S hD).trans
    (translation_phase_le_coefficientBoundSq j D heta0 heta1 r b hY hB2)

end

end Grothe.UpperQuad.GaussianShift

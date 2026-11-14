import Grothe.UpperQuad.GaussianShiftEnvelope
import Grothe.UpperQuad.TwistRadialVector

/-!
# An explicit Y bound for the actual descended twisted vector

Real coordinate bounds on an arbitrary complex square root control the production vector.
The result separates the radial Gaussian, finite Mehler, phase, and translation factors in
the form used by the numerical certificate. No branch choice, interval arithmetic, or
profile nonvanishing is needed for this pointwise norm inequality.

Agent-ID: codex-2f3d. Refs #334, #343.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistRadialExt

open GrotheQuad Grothe.UpperChaos.F0ConditionalEvaluator

noncomputable section

/-- The radial Gaussian and primary Hermite energy envelope. -/
def primaryBoundSq (D : ℕ) (t Slo X Y : ℝ) : ℝ :=
  Real.exp (-2 * Slo) * (t ^ D)⁻¹ * (1 - t ^ 2)⁻¹ *
    Real.exp (2 * t * X / (1 + t) + 2 * t * Y / (1 - t))

/-- The full Y envelope for the production output degree. -/
def yBoundSq (j : ℕ) (t eta Slo X Y B2 : ℝ) : ℝ :=
  primaryBoundSq (twistParams j).Dout t Slo X Y *
    GaussianShift.coefficientBoundSq j (twistParams j).Dout eta Y B2

/-- The complete closed form, grouped as radial, primary, phase, and translation factors. -/
theorem yBoundSq_eq (j : ℕ) (t eta Slo X Y B2 : ℝ) :
    yBoundSq j t eta Slo X Y B2 =
      Real.exp (-2 * Slo) *
        (t⁻¹ ^ (twistParams j).Dout / (1 - t ^ 2) *
          Real.exp (2 * t * X / (1 + t) + 2 * t * Y / (1 - t)) *
          (eta⁻¹ ^ (35 * j) / (1 - eta) ^ 2 *
            Real.exp (4 * (j : ℝ) * (21 / 20 : ℝ) * (Y + B2) / (1 - eta))) *
          Real.exp (2 * B2 +
            2 * Real.sqrt (2 * ((twistParams j).Dout : ℝ)) * Real.sqrt B2)) := by
  unfold yBoundSq primaryBoundSq GaussianShift.coefficientBoundSq
  rw [GaussianShift.phaseBoundSq_eq]
  simp only [inv_pow, div_eq_mul_inv]
  ring

theorem primaryBoundSq_nonneg (D : ℕ) {t : ℝ} (ht0 : 0 < t) (ht1 : t < 1)
    (Slo X Y : ℝ) : 0 ≤ primaryBoundSq D t Slo X Y := by
  have ht2 : 0 < 1 - t ^ 2 := by
    nlinarith [mul_pos (sub_pos.mpr ht1) (show 0 < 1 + t by linarith)]
  unfold primaryBoundSq
  positivity

theorem yBoundSq_nonneg (j : ℕ) {t eta : ℝ} (ht0 : 0 < t) (ht1 : t < 1)
    (heta : 0 ≤ eta) (Slo X Y B2 : ℝ) : 0 ≤ yBoundSq j t eta Slo X Y B2 :=
  mul_nonneg (primaryBoundSq_nonneg _ ht0 ht1 _ _ _)
    (GaussianShift.coefficientBoundSq_nonneg _ _ heta _ _)

/-- Independent coordinate bounds majorize the radial and primary Hermite factors. -/
theorem radial_primary_le_primaryBoundSq (D : ℕ) {t : ℝ}
    (ht0 : 0 < t) (ht1 : t < 1) (s r : ℂ) {Slo X Y : ℝ}
    (hSlo : Slo ≤ s.re) (hX : r.re ^ 2 ≤ X) (hY : r.im ^ 2 ≤ Y) :
    Real.exp (-2 * s.re) * (t ^ D)⁻¹ * (1 - t ^ 2)⁻¹ *
      Real.exp (2 * t * r.re ^ 2 / (1 + t) + 2 * t * r.im ^ 2 / (1 - t)) ≤
        primaryBoundSq D t Slo X Y := by
  have hplus : 0 < 1 + t := by linarith
  have hminus : 0 < 1 - t := sub_pos.mpr ht1
  have ht2 : 0 < 1 - t ^ 2 := by nlinarith [mul_pos hminus hplus]
  have hradial : Real.exp (-2 * s.re) ≤ Real.exp (-2 * Slo) :=
    Real.exp_le_exp.mpr (by linarith only [hSlo])
  have hprimary :
      Real.exp (2 * t * r.re ^ 2 / (1 + t) + 2 * t * r.im ^ 2 / (1 - t)) ≤
        Real.exp (2 * t * X / (1 + t) + 2 * t * Y / (1 - t)) :=
    Real.exp_le_exp.mpr <| add_le_add
      (div_le_div_of_nonneg_right
        (mul_le_mul_of_nonneg_left hX (by positivity)) hplus.le)
      (div_le_div_of_nonneg_right
        (mul_le_mul_of_nonneg_left hY (by positivity)) hminus.le)
  unfold primaryBoundSq
  apply mul_le_mul _ hprimary (Real.exp_pos _).le (by positivity)
  exact mul_le_mul_of_nonneg_right
    (mul_le_mul_of_nonneg_right hradial (by positivity)) (by positivity)

/-- The actual vector satisfies the explicit Y expression at any chosen square root. -/
theorem norm_descendedVector_sq_le_yBoundSq (j : ℕ) (hj : 0 < j)
    (σ : ℝ) (hσ : |σ| = 1) {s r : ℂ} (hr : r ^ 2 = s)
    {t eta : ℝ} (ht0 : 0 < t) (ht1 : t < 1) (heta0 : 0 < eta) (heta1 : eta < 1)
    {Slo X Y B2 : ℝ} (hSlo : Slo ≤ s.re) (hX : r.re ^ 2 ≤ X)
    (hY : r.im ^ 2 ≤ Y) (hB2 : (shift r).im ^ 2 ≤ B2) :
    ‖descendedVector j σ s‖ ^ 2 ≤ yBoundSq j t eta Slo X Y B2 := by
  have hactual := norm_descendedVector_sq_le_y j hj σ hσ r t eta ht0 ht1 heta0 heta1
  rw [hr] at hactual
  refine hactual.trans ?_
  unfold yBoundSq
  exact mul_le_mul
    (radial_primary_le_primaryBoundSq _ ht0 ht1 s r hSlo hX hY)
    (GaussianShift.translation_phase_le_coefficientBoundSq j _ heta0 heta1
      r (shift r).im hY hB2)
    (mul_nonneg (Real.exp_pos _).le (GaussianShift.phaseEnvelopeSq_pos j heta0 heta1 _ _).le)
    (primaryBoundSq_nonneg _ ht0 ht1 _ _ _)

/-- A nonnegative norm cap follows from a certified upper bound on the squared Y expression. -/
theorem norm_descendedVector_le_of_yBoundSq_le_sq (j : ℕ) (hj : 0 < j)
    (σ : ℝ) (hσ : |σ| = 1) {s r : ℂ} (hr : r ^ 2 = s)
    {t eta : ℝ} (ht0 : 0 < t) (ht1 : t < 1) (heta0 : 0 < eta) (heta1 : eta < 1)
    {Slo X Y B2 M : ℝ} (hSlo : Slo ≤ s.re) (hX : r.re ^ 2 ≤ X)
    (hY : r.im ^ 2 ≤ Y) (hB2 : (shift r).im ^ 2 ≤ B2) (hM : 0 ≤ M)
    (hcap : yBoundSq j t eta Slo X Y B2 ≤ M ^ 2) :
    ‖descendedVector j σ s‖ ≤ M :=
  (sq_le_sq₀ (norm_nonneg _) hM).mp
    ((norm_descendedVector_sq_le_yBoundSq j hj σ hσ hr ht0 ht1 heta0 heta1
      hSlo hX hY hB2).trans hcap)

/-- Taking the nonnegative square root gives a norm bound in the panel theorem's units. -/
theorem norm_descendedVector_le_sqrt_yBoundSq (j : ℕ) (hj : 0 < j)
    (σ : ℝ) (hσ : |σ| = 1) {s r : ℂ} (hr : r ^ 2 = s)
    {t eta : ℝ} (ht0 : 0 < t) (ht1 : t < 1) (heta0 : 0 < eta) (heta1 : eta < 1)
    {Slo X Y B2 : ℝ} (hSlo : Slo ≤ s.re) (hX : r.re ^ 2 ≤ X)
    (hY : r.im ^ 2 ≤ Y) (hB2 : (shift r).im ^ 2 ≤ B2) :
    ‖descendedVector j σ s‖ ≤ Real.sqrt (yBoundSq j t eta Slo X Y B2) :=
  Real.le_sqrt_of_sq_le
    (norm_descendedVector_sq_le_yBoundSq j hj σ hσ hr ht0 ht1 heta0 heta1 hSlo hX hY hB2)

end

end Grothe.UpperQuad.TwistRadialExt

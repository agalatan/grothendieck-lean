import Grothe.UpperChaos.Q0BasePairKernel
import Grothe.UpperChaos.GaussianDenominatorEnvelope

/-! Bind the analytic Gaussian envelopes to the actual base-pair kernels.
These are rectangle transfer rules. The bounds on the actual profile and the
scalar exponential must still be supplied by checked numerical certificates.
Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.Q0BasePairEnvelope

open Q0BasePairKernel GaussianDenominatorEnvelope

theorem direct_first (η s k u s₀ s₁ E : ℝ)
    (hs : 0 ≤ s) (hlo : s₀ ≤ s) (hhi : s ≤ s₁) (hE : Real.exp (-s₀) ≤ E) :
    0 ≤ first η s k u ∧ first η s k u ≤ 2*s₁*E := by
  have hcore : common η s k u ≤ E :=
    (direct_core (η^2*u^2) s (u^2*s/(1+k^2*u^2)) (1+k^2*u^2)
      (by positivity) (by positivity) (by nlinarith [mul_nonneg (sq_nonneg k) (sq_nonneg u)])).trans
      ((Real.exp_le_exp.mpr (neg_le_neg hlo)).trans hE)
  have hnonneg : 0 ≤ common η s k u := by unfold common; positivity
  constructor
  · unfold first; positivity
  · exact mul_le_mul (by linarith : 2*s ≤ 2*s₁) hcore hnonneg (by linarith)

theorem direct_companion (η s k u s₀ K E : ℝ)
    (hs : 0 ≤ s) (hlo : s₀ ≤ s) (hk : |k| ≤ K) (hE : Real.exp (-s₀) ≤ E) :
    |companion η s k u| ≤ 4*K*E := by
  have hc : |1-u^2*s/(1+k^2*u^2)| * common η s k u ≤ 2*E :=
    (GaussianDenominatorEnvelope.direct_companion (η^2*u^2) s
      (u^2*s/(1+k^2*u^2)) (1+k^2*u^2) (by positivity) (by positivity)
      (by nlinarith [mul_nonneg (sq_nonneg k) (sq_nonneg u)])).trans
      (mul_le_mul_of_nonneg_left
        ((Real.exp_le_exp.mpr (neg_le_neg hlo)).trans hE) (by norm_num))
  have hnonneg : 0 ≤ common η s k u := by unfold common; positivity
  have hK : 0 ≤ K := (abs_nonneg k).trans hk
  calc
    _ = 2*|k| * (|1-u^2*s/(1+k^2*u^2)| * common η s k u) := by
      simp only [companion, abs_mul, abs_of_nonneg hnonneg, abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 2)]
      ring
    _ ≤ (2*K)*(2*E) := mul_le_mul (by gcongr) hc (by positivity) (by positivity)
    _ = _ := by ring

theorem reciprocal_first (n : ℕ) (η s k x s₀ s₁ X D₁ E : ℝ)
    (hs₀ : 0 < s₀) (hlo : s₀ ≤ s) (hhi : s ≤ s₁) (hx : |x| ≤ X)
    (hD : x^2+k^2 ≤ D₁) (hE : Real.exp (-s₀) ≤ E) :
    0 ≤ reciprocalFirst η s k x ∧
      reciprocalFirst η s k x ≤
        2*s₁*X^2 * (E*((n+2).factorial : ℝ)*D₁^n/s₀^(n+2)) := by
  have hs : 0 ≤ s := (hs₀.trans_le hlo).le
  have hs₁ : 0 ≤ s₁ := hs.trans hhi
  have hX : 0 ≤ X := (abs_nonneg x).trans hx
  have hx2 : x^2 ≤ X^2 := by
    simpa only [sq_abs] using pow_le_pow_left₀ (abs_nonneg x) hx 2
  have hcore := inverse_sq_box n (η^2/x^2) s (x^2+k^2) s₀ D₁ E
    (by positivity) hs₀ hlo (by positivity) hD hE
  have hraw : 0 ≤ Real.exp (-(η^2/x^2)-s-s/(x^2+k^2)) / (x^2+k^2)^2 := by positivity
  constructor
  · unfold reciprocalFirst reciprocalCommon; positivity
  · calc
      _ = (2*s*x^2) * (Real.exp (-(η^2/x^2)-s-s/(x^2+k^2)) / (x^2+k^2)^2) := by
        unfold reciprocalFirst reciprocalCommon
        ring
      _ ≤ _ := mul_le_mul (by gcongr) hcore hraw (by positivity)

theorem reciprocal_companion (n : ℕ) (η s k x s₀ X K D₁ E : ℝ)
    (hs₀ : 0 < s₀) (hlo : s₀ ≤ s) (hx : |x| ≤ X) (hk : |k| ≤ K)
    (hD : x^2+k^2 ≤ D₁) (hE : Real.exp (-s₀) ≤ E) :
    |reciprocalCompanion η s k x| ≤
      2*K*X^2 * (E*((n+2).factorial+(n+3).factorial : ℝ)*D₁^n/s₀^(n+2)) := by
  have hX : 0 ≤ X := (abs_nonneg x).trans hx
  have hK : 0 ≤ K := (abs_nonneg k).trans hk
  have hx2 : x^2 ≤ X^2 := by
    simpa only [sq_abs] using pow_le_pow_left₀ (abs_nonneg x) hx 2
  have hcore := companion_inverse_sq_box n (η^2/x^2) s (x^2+k^2) s₀ D₁ E
    (by positivity) hs₀ hlo (by positivity) hD hE
  have hraw : 0 ≤ Real.exp (-(η^2/x^2)-s-s/(x^2+k^2)) / (x^2+k^2)^2 := by positivity
  calc
    _ = (2 * |k| * x^2) * (|1-s/(x^2+k^2)| *
        (Real.exp (-(η^2/x^2)-s-s/(x^2+k^2)) / (x^2+k^2)^2)) := by
      simp only [reciprocalCompanion, reciprocalCommon, abs_mul, abs_div,
        abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 2), abs_pow, abs_of_pos (Real.exp_pos _), sq_abs]
      ring
    _ ≤ _ := mul_le_mul (by gcongr) hcore (by positivity) (by positivity)

end Grothe.UpperChaos.Q0BasePairEnvelope

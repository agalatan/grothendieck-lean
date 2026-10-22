import Grothe.Lower.Reserve
import Grothe.LowerAnalytic.JointSixth

/-!
# A common budget for Stein fluctuations and the sixth moment

This is an analytic application of `reserveCert`, rather than an extra law assumption.
For every genuine circular cubic, the accepted finite certificate pays for the same
contraction invariants in both the Stein term and the moment correction. Its range
hypothesis is the checked upper bound on `sqrt(E U² - 2)`.
-/

open MvPolynomial Grothe.Lower

namespace Grothe.LowerAnalytic

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- The Young-form joint sixth-moment reserve gives a strengthened Stein budget for
every circular cubic. `X2,C2,P,Q` are the actual four spectral formulas, not independent
law variables. No extra Gaussian or tensor hypothesis is introduced. -/
theorem joint_sixth_budget {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hc : Circular J a b) (haa : E (a * a) = 1 / 2)
    (lam mu weight xmax alpha : ℚ) (g : GramData)
    (hw : 0 ≤ weight) (ha0 : 0 < alpha)
    (hrange : Real.sqrt (E (radU a b ^ 2) - 2) ≤ (xmax : ℝ))
    (hcert : reserveCert lam mu g (Reserve.joint weight xmax
      (135 * alpha / 2) (11781 / 32 + 135 / (2 * alpha))) = true) :
    (lam : ℝ) * ((4 * specU2 E a b + specU4 E a b) / 9)
      + (mu : ℝ) * ((4 * specV2 E a b + specV4 E a b) / 9)
      + (weight : ℝ) * (E (radU a b ^ 3) - 9 * E (radU a b ^ 2) + 12)
    ≤ (g.A : ℝ) * ((2 * specU2 E a b + specU4 E a b) / 3)
      + (g.B : ℝ) * ((2 * specV2 E a b + specV4 E a b) / 3) := by
  have u2 := hc.specU2_eq hE ha haa
  have u4 := hc.specU4_eq hE ha haa
  have v2 := hc.specV2_eq hE ha haa
  have v4 := hc.specV4_eq hE ha haa
  let t := gramT J a b
  let momentJ := 135 * (alpha : ℝ) / 2 * JointSixth.s0 t
    + (11781 / 32 + 135 / (2 * (alpha : ℝ))) * JointSixth.h0 t
  have hα : (0 : ℝ) < alpha := by exact_mod_cast ha0
  have hwR : (0 : ℝ) ≤ weight := by exact_mod_cast hw
  have hJ : 0 ≤ momentJ := by
    obtain ⟨hs, hh, _⟩ := JointSixth.gram_j1 hE ha hc haa
    dsimp [momentJ, t]
    positivity
  have hm := joint_moment_range hrange hJ (JointSixth.gram_j3 hE ha hc haa hα)
  have hm' : E (radU a b ^ 3) - 9 * E (radU a b ^ 2) + 12 ≤ (xmax : ℝ) * momentJ := by
    linarith
  have key := reserved_gram_budget lam mu g _ hcert
    (gramN t) (gramH t) (gramB t) (gramY t) (gramZ t)
    ((2 * specU2 E a b + specU4 E a b) / 3)
    ((2 * specV2 E a b + specV4 E a b) / 3)
    ((4 * specU2 E a b + specU4 E a b) / 9)
    ((4 * specV2 E a b + specV4 E a b) / 9)
    (gramN_nonneg _) (gramH_nonneg _) (gramB_nonneg _) (gramY_nonneg _)
    ((gramY_nonneg _).trans (gramT_symm J a b)) (gramT_schatten J a b)
    (gramT_symm J a b) (gramZ_sq_le _) (gramT_gram1a J a b) (gramT_gram1b J a b)
    (by rw [u2, u4]; ring) (by rw [v2, v4]; ring)
    (by rw [u2, u4]; ring) (by rw [v2, v4]; ring)
  have he : (Reserve.joint weight xmax (135 * alpha / 2)
      (11781 / 32 + 135 / (2 * alpha))).value (gramN t) (gramH t) (gramB t) (gramY t) (gramZ t)
      = (weight : ℝ) * xmax * momentJ := by
    rw [joint_reserve_value]
    dsimp [momentJ, JointSixth.s0, JointSixth.h0]
    push_cast
    ring
  rw [he] at key
  have hwm := mul_le_mul_of_nonneg_left hm' hwR
  calc
    _ ≤ (lam : ℝ) * ((4 * specU2 E a b + specU4 E a b) / 9)
      + (mu : ℝ) * ((4 * specV2 E a b + specV4 E a b) / 9)
      + (weight : ℝ) * xmax * momentJ := by nlinarith [hwm]
    _ ≤ _ := key

end

end Grothe.LowerAnalytic

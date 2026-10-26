import Grothe.UpperChaos.HardyArcCover

/-!
# The circle mean of the continued correlation

From the four checked parts of the arc cover (two charts, two halves each) and holomorphy near the circle
(`KerPos` on a ball of radius `r > 4149/4000`), the mean of `‖HholPair F G (R(ρ e^{iθ}))‖²` over the circle
`ρ = 4149/4000` is at most `7/4` (`hmean_of_parts`): the input `hmean` of `hardy_of_pair_inputs`.
Step 4 of the `hardy` plan.
-/

open MeasureTheory Real

namespace Grothe.UpperChaos.HardyArcMean

open GrotheKernel GrotheKernel.HardyArc Grothe.Upper HardyArcSound HardyArcCircle HardyArcCover

/-- The kernel parameters of the four parts: leaf width `D/1024`, tolerance `D/10`, depth `26`, `1024` pieces per
half, budget `2.73` each (scaled). -/
def partsOK (neg : Bool) (k₀ : ℕ) : Bool :=
  partOK (ofRatI jQ) (ofRatI rhoQ) hardyData neg (D / 1024) (D / 10) 26 1024 k₀ 1024 (273 * D / 100)

/-- What a passed part means (all arguments abstract, so nothing is evaluated during elaboration). -/
lemma partOK_spec {j rho : Ival} {dat : RData} {neg : Bool} {w tol : ℤ} {depth n k₀ m : ℕ} {cap : ℤ}
    (h : partOK j rho dat neg w tol depth n k₀ m cap = true) :
    ∃ x, chartSum j rho dat neg w tol depth n k₀ m = some x ∧ x ≤ cap := by
  unfold partOK at h
  split at h
  · rename_i x hx; exact ⟨x, hx, by simpa using h⟩
  · exact absurd h (by simp)

lemma pieceLo_0 : pieceLo 1024 0 = -D := by simp [pieceLo]
lemma pieceLo_1024 : pieceLo 1024 1024 = 0 := by simp [pieceLo, D, K]
lemma pieceLo_2048 : pieceLo 1024 2048 = D := by simp [pieceLo, D, K]

variable {F G : ℂ × ℂ → ℂ} (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1)
  (hG : ∀ u, ‖G u‖ ≤ 1)
include hFm hGm hF hG

/-- Holomorphy near the circle makes every chart function integrable. -/
lemma gF_intervalIntegrable {r : ℝ} (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (Rt t) l) (neg : Bool) (a b : ℝ) :
    IntervalIntegrable (gF F G neg) volume a b := by
  have hd := differentiableOn_HholPair_Rt hFm hGm hF hG Metric.isOpen_ball hU
  have hc : Continuous (gF F G neg) := by
    unfold gF
    have hmaps : ∀ θ : ℝ, HardyArcSound.sig neg * ((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I) ∈
        Metric.ball (0 : ℂ) r := by
      intro θ
      rw [Metric.mem_ball, dist_zero_right, norm_mul, norm_mul, Complex.norm_exp_ofReal_mul_I, mul_one]
      have hs : ‖HardyArcSound.sig neg‖ = 1 := by cases neg <;> simp [HardyArcSound.sig]
      rw [hs, one_mul, Complex.norm_of_nonneg (by norm_num [rhoQ])]
      exact hr
    have hcont : Continuous fun θ : ℝ => HardyArcSound.sig neg * ((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I) := by
      fun_prop
    exact (continuous_norm.comp (hd.continuousOn.comp_continuous hcont hmaps)).pow 2
  exact hc.intervalIntegrable a b

/-- One chart: the integral over `[−π/2, π/2]` is at most `2 × 2.73`. -/
lemma chart_integral_le {r : ℝ} (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (Rt t) l) (neg : Bool)
    (h0 : partsOK neg 0 = true) (h1 : partsOK neg 1024 = true) :
    ∫ θ in (-(π / 2))..(π / 2), gF F G neg θ ≤ 2 * (273 / 100) := by
  have hint := gF_intervalIntegrable hFm hGm hF hG hr hU neg
  have hD := D_pos
  have bound : ∀ k₀ : ℕ, (k₀ + 1024 ≤ 1024 ∨ 1024 ≤ k₀) → partsOK neg k₀ = true →
      ∫ θ in (2 * arctan ((pieceLo 1024 k₀ : ℝ) / D))..(2 * arctan ((pieceLo 1024 (k₀ + 1024) : ℝ) / D)),
        gF F G neg θ ≤ 273 / 100 := by
    intro k₀ hk hok
    obtain ⟨x, hx, hle⟩ := partOK_spec hok
    · have i := chartSum_integral hFm hGm hF hG hint 1024 k₀ x hk hx
      refine i.trans ?_
      rw [div_le_iff₀ hD]
      have : ((273 * D / 100 : ℤ) : ℝ) ≤ 273 / 100 * D := by
        have := Int.ediv_mul_le (273 * D) (by norm_num : (100 : ℤ) ≠ 0)
        have h' : (((273 * D / 100 : ℤ) : ℝ)) * 100 ≤ 273 * D := by exact_mod_cast this
        linarith
      exact (by exact_mod_cast hle : (x : ℝ) ≤ ((273 * D / 100 : ℤ) : ℝ)).trans this
  have b0 := bound 0 (by norm_num) h0
  have b1 := bound 1024 (by norm_num) h1
  rw [pieceLo_0, zero_add, pieceLo_1024] at b0
  rw [pieceLo_1024, show 1024 + 1024 = 2048 by norm_num, pieceLo_2048] at b1
  push_cast at b0 b1
  simp only [neg_div, div_self hD.ne', zero_div, arctan_neg, arctan_one, arctan_zero, mul_zero] at b0 b1
  rw [← intervalIntegral.integral_add_adjacent_intervals (hint _ _) (hint _ _) (b := 0)]
  have e1 : 2 * -(π / 4) = -(π / 2) := by ring
  have e2 : 2 * (π / 4) = π / 2 := by ring
  rw [e1] at b0
  rw [e2] at b1
  linarith

/-- **The circle mean** (the input `hmean` of `hardy_of_pair_inputs`), from the four checked parts and holomorphy
near the circle. -/
theorem hmean_of_parts {r : ℝ} (hr : (4149 / 4000 : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (Rt t) l)
    (h1 : partsOK false 0 = true) (h2 : partsOK false 1024 = true)
    (h3 : partsOK true 0 = true) (h4 : partsOK true 1024 = true) :
    (2 * π)⁻¹ * ∫ θ in (0 : ℝ)..2 * π,
      ‖HholPair F G (Rt (((4149 / 4000 : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2 ≤ 7 / 4 := by
  have hρ : ((rhoQ : ℚ) : ℝ) = 4149 / 4000 := by norm_num [rhoQ]
  have hr' : (rhoQ : ℝ) < r := by rw [hρ]; exact hr
  have hint := gF_intervalIntegrable hFm hGm hF hG hr' hU
  -- the integrand is the chart function `gF false`
  have hf : (fun θ : ℝ => ‖HholPair F G (Rt (((4149 / 4000 : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2) =
      gF F G false := by
    funext θ; simp only [gF, HardyArcSound.sig, Bool.false_eq_true, ↓reduceIte, one_mul, hρ]
  rw [hf]
  -- periodicity: shift the window to [−π/2, 3π/2], then split at π/2
  have hper : Function.Periodic (gF F G false) (2 * π) := by
    intro θ
    simp only [gF]
    congr 4
    push_cast
    rw [add_mul, Complex.exp_add, Complex.exp_two_pi_mul_I, mul_one]
  have hshift : ∫ θ in (0 : ℝ)..2 * π, gF F G false θ = ∫ θ in (-(π / 2))..(-(π / 2) + 2 * π), gF F G false θ := by
    have := hper.intervalIntegral_add_eq 0 (-(π / 2))
    simpa using this
  rw [hshift, ← intervalIntegral.integral_add_adjacent_intervals (hint false _ _) (hint false _ _) (b := π / 2)]
  -- the second half is the other chart: e^{i(θ+π)} = −e^{iθ}
  have hsecond : ∫ θ in (π / 2)..(-(π / 2) + 2 * π), gF F G false θ = ∫ θ in (-(π / 2))..(π / 2), gF F G true θ := by
    have e : ∀ θ : ℝ, gF F G false (θ + π) = gF F G true θ := by
      intro θ
      simp only [gF, HardyArcSound.sig, Bool.false_eq_true, ↓reduceIte, one_mul]
      congr 4
      push_cast
      rw [add_mul, Complex.exp_add, Complex.exp_pi_mul_I]
      ring
    calc ∫ θ in (π / 2)..(-(π / 2) + 2 * π), gF F G false θ
        = ∫ θ in (-(π / 2) + π)..(π / 2 + π), gF F G false θ := by congr 1 <;> ring
      _ = ∫ θ in (-(π / 2))..(π / 2), gF F G false (θ + π) :=
          (intervalIntegral.integral_comp_add_right (gF F G false) π).symm
      _ = ∫ θ in (-(π / 2))..(π / 2), gF F G true θ := by simp only [e]
  rw [hsecond]
  have c1 := chart_integral_le hFm hGm hF hG hr' hU false h1 h2
  have c2 := chart_integral_le hFm hGm hF hG hr' hU true h3 h4
  have hπ := Real.pi_gt_d2
  rw [inv_mul_le_iff₀ (by positivity)]
  nlinarith

end Grothe.UpperChaos.HardyArcMean

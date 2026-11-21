import Grothe.UpperReplacement.Channels
import Grothe.UpperReplacement.CircleWide
import Grothe.Upper.Residual

set_option warningAsError true

/-!
# Soundness of the adaptive contours with explicit tolerance

Agent-ID: codex-a7c4. The tolerance controls subdivision only. The proved whole-box bounds
are integrated over all four half-charts and compared with the full rational circle budget.
-/

namespace Grothe.UpperReplacement.CircleWideSound

open MeasureTheory Finset Polynomial Upper UpperChaos GrotheKernel GrotheKernel.HardyArc
open UpperChaos.HardyArcSound CircleCheck CircleSound

noncomputable section

theorem hmean_of_check {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {m00 m01 m11 : ℝ} {pl ql : List ℚ} {dat : RData}
    (hm00 : mem m00 dat.m00) (hm01 : mem m01 dat.m01) (hm11 : mem m11 dat.m11)
    (hP : dat.P = pl.map ofRatI) (hQ : dat.Q = ql.map ofRatI)
    {rhoQ jQ budgetQ : ℚ} {r : ℝ} {depth : ℕ} {tolerance : ℤ}
    (hρ0 : 0 ≤ (rhoQ : ℝ)) (hj0 : 0 < (jQ : ℝ)) (hB0 : 0 ≤ (budgetQ : ℝ))
    (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r,
      ∃ l > 0, KerPos (covarianceCurve ⟨m00, m01, m11⟩ pl ql t) l)
    (hc : CircleWide.meanOK dat rhoQ jQ budgetQ depth tolerance = true) :
    (2 * Real.pi)⁻¹ * ∫ θ in (0 : ℝ)..2 * Real.pi,
      ‖HholSymPair F G (covarianceCurve ⟨m00, m01, m11⟩ pl ql
        (((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2 ≤ (budgetQ : ℝ) := by
  have hD := D_pos
  have hD0 : (0 : ℤ) ≤ D := by exact_mod_cast hD.le
  rw [CircleWide.meanOK_eq_raw] at hc
  dsimp only at hc
  cases ha : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat false (D / 64) tolerance depth (-D) 0 with
  | none => rw [ha] at hc; simp at hc
  | some a =>
  rw [ha] at hc
  cases hb : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat false (D / 64) tolerance depth 0 D with
  | none => rw [hb] at hc; simp at hc
  | some b =>
  rw [hb] at hc
  cases hc' : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat true (D / 64) tolerance depth (-D) 0 with
  | none => rw [hc'] at hc; simp at hc
  | some c =>
  rw [hc'] at hc
  cases hd : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat true (D / 64) tolerance depth 0 D with
  | none => rw [hd] at hc; simp at hc
  | some d =>
  rw [hd, decide_eq_true_eq] at hc
  have ia := coverGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU false (D / 64) tolerance
    depth (-D) 0 a (by omega) (Or.inr le_rfl) ha
  have ib := coverGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU false (D / 64) tolerance
    depth 0 D b hD0 (Or.inl le_rfl) hb
  have ic := coverGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU true (D / 64) tolerance
    depth (-D) 0 c (by omega) (Or.inr le_rfl) hc'
  have id' := coverGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU true (D / 64) tolerance
    depth 0 D d hD0 (Or.inl le_rfl) hd
  have e_neg : 2 * Real.arctan (((-D : ℤ) : ℝ) / D) = -(Real.pi / 2) := by
    rw [Int.cast_neg, neg_div_self hD.ne', Real.arctan_neg, Real.arctan_one]; ring
  have e_zero : 2 * Real.arctan (((0 : ℤ) : ℝ) / D) = 0 := by simp
  have e_pos : 2 * Real.arctan ((D : ℝ) / D) = Real.pi / 2 := by
    rw [div_self hD.ne', Real.arctan_one]; ring
  rw [e_neg, e_zero] at ia ic
  rw [e_zero, e_pos] at ib id'
  set R := covarianceCurve ⟨m00, m01, m11⟩ pl ql
  have hint := pairCircleValue_intervalIntegrable hFm hGm hF hG hρ0 hr hU
  have hfalse : ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) false θ ≤
      ((a + b : ℤ) : ℝ) / D := by
    rw [← intervalIntegral.integral_add_adjacent_intervals (hint false _ _) (hint false _ _) (b := 0)]
    calc _ ≤ (a : ℝ) / D + (b : ℝ) / D := add_le_add ia ib
      _ = ((a + b : ℤ) : ℝ) / D := by push_cast; ring
  have htrue : ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) true θ ≤
      ((c + d : ℤ) : ℝ) / D := by
    rw [← intervalIntegral.integral_add_adjacent_intervals (hint true _ _) (hint true _ _) (b := 0)]
    calc _ ≤ (c : ℝ) / D + (d : ℝ) / D := add_le_add ic id'
      _ = ((c + d : ℤ) : ℝ) / D := by push_cast; ring
  have hf : (fun θ : ℝ => ‖HholSymPair F G (R (((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2) =
      pairCircleValue F G R (rhoQ : ℝ) false := by
    funext θ; simp [pairCircleValue, HardyArcSound.sig]
  rw [hf]
  have hper : Function.Periodic (pairCircleValue F G R (rhoQ : ℝ) false) (2 * Real.pi) := fun θ => by
    simp only [pairCircleValue]; congr 4; push_cast
    rw [add_mul, Complex.exp_add, Complex.exp_two_pi_mul_I, mul_one]
  have hshift : ∫ θ in (0 : ℝ)..2 * Real.pi, pairCircleValue F G R (rhoQ : ℝ) false θ =
      ∫ θ in (-(Real.pi / 2))..(-(Real.pi / 2) + 2 * Real.pi), pairCircleValue F G R (rhoQ : ℝ) false θ := by
    simpa using hper.intervalIntegral_add_eq 0 (-(Real.pi / 2))
  rw [hshift, ← intervalIntegral.integral_add_adjacent_intervals
    (hint false _ _) (hint false _ _) (b := Real.pi / 2)]
  have hsecond : ∫ θ in (Real.pi / 2)..(-(Real.pi / 2) + 2 * Real.pi), pairCircleValue F G R (rhoQ : ℝ) false θ =
      ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) true θ := by
    have e : ∀ θ : ℝ, pairCircleValue F G R (rhoQ : ℝ) false (θ + Real.pi) = pairCircleValue F G R (rhoQ : ℝ) true θ := by
      intro θ
      simp only [pairCircleValue, HardyArcSound.sig, Bool.false_eq_true, ↓reduceIte, one_mul]
      congr 4; push_cast
      rw [add_mul, Complex.exp_add, Complex.exp_pi_mul_I]; ring
    calc ∫ θ in (Real.pi / 2)..(-(Real.pi / 2) + 2 * Real.pi), pairCircleValue F G R (rhoQ : ℝ) false θ
        = ∫ θ in (-(Real.pi / 2) + Real.pi)..(Real.pi / 2 + Real.pi), pairCircleValue F G R (rhoQ : ℝ) false θ := by
          congr 1 <;> ring
      _ = ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) false (θ + Real.pi) :=
          (intervalIntegral.integral_comp_add_right (pairCircleValue F G R (rhoQ : ℝ) false) Real.pi).symm
      _ = ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) true θ := by simp only [e]
  rw [hsecond, inv_mul_le_iff₀ (by positivity)]
  have hsum : ((a + b + c + d : ℤ) : ℝ) / D ≤ 2 * (piLo20Q : ℝ) * (budgetQ : ℝ) := by
    rw [div_le_iff₀ hD]
    have h1 : ((a + b + c + d : ℤ) : ℝ) ≤ (ofRatLo (2 * piLo20Q * budgetQ) : ℝ) := by exact_mod_cast hc
    have h2 := ofRatLo_le (2 * piLo20Q * budgetQ)
    push_cast at h2
    linarith
  have hpi : (piLo20Q : ℝ) ≤ Real.pi := by
    have hp := Real.pi_gt_d20
    have heq : (piLo20Q : ℝ) = 3.14159265358979323846 := by norm_num [piLo20Q]
    linarith
  have h2pi : 2 * (piLo20Q : ℝ) * (budgetQ : ℝ) ≤ 2 * Real.pi * (budgetQ : ℝ) :=
    mul_le_mul_of_nonneg_right (by linarith) hB0
  have habcd : ((a + b : ℤ) : ℝ) / D + ((c + d : ℤ) : ℝ) / D = ((a + b + c + d : ℤ) : ℝ) / D := by
    push_cast; ring
  linarith

theorem pairEnergy_self (F : Lp ℂ 2 mu2) (nm : ℕ × ℕ) : pairEnergy F F nm = energy F nm := by
  rw [pairEnergy_eq_overlap]
  unfold energy
  apply tsum_congr
  intro i
  rw [← Complex.normSq_eq_norm_sq]
  simp only [Complex.mul_re, Complex.conj_re, Complex.conj_im, Complex.normSq_apply]
  ring

theorem HholSymPair_self (F : ℂ × ℂ → ℂ) (R : Sym2C) :
    HholSymPair F F R = HholPair F F R := by
  unfold HholSymPair
  ring

theorem hardy_of_checks {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G)
    (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {M : Sym2R} {MI : SR} (hM : memSR M MI) (pl ql : List ℚ)
    {rho region j budget : ℚ} {depth : ℕ} {tolerance : ℤ}
    (hrho : 1 < rho) (hr : rho < region) (hr2 : region ≤ 2)
    (hj : 0 < j) (hB : 0 ≤ budget)
    (hregion : CircleCheck.regionOK (covarianceData MI pl ql) region = true)
    (hcircle : CircleWide.meanOK (covarianceData MI pl ql) rho j budget depth tolerance = true)
    {h : ℕ → ℝ} (hs : Summable fun k ↦ |h k|)
    (hreal : ∀ t : ℝ, 0 < t → t < 1 →
      HasSum (fun k ↦ (h k : ℂ) * (t : ℂ) ^ (2 * k + 1))
        (HholSymPair F G (covarianceCurve M pl ql t))) (J : ℕ) :
    ∑ k ∈ range J, h k ^ 2 * (rho : ℝ) ^ (2 * (2 * k + 1)) ≤ (budget : ℝ) := by
  have hr0 : 0 < region := (zero_lt_one.trans hrho).trans hr
  have hpos := covariance_kerPos_on_ball hM pl ql hr0 hr2 hregion
  have hdiff := covarianceCurve_differentiable M pl ql
  have hm := hmean_of_check hFm hGm hF hG hM.1 hM.2.1 hM.2.2
    (dat := covarianceData MI pl ql) rfl rfl
    (by exact_mod_cast (zero_lt_one.trans hrho).le) (by exact_mod_cast hj)
    (by exact_mod_cast hB) (by exact_mod_cast hr) hpos hcircle
  exact hardy_of_symmetric_pair_curve hFm hGm hF hG
    (by exact_mod_cast zero_lt_one.trans hrho) (by exact_mod_cast hr)
    (by exact_mod_cast hrho.trans hr)
    hdiff.1.differentiableOn hdiff.2.1.differentiableOn hdiff.2.2.differentiableOn
    hpos hs hreal hm J

/-- Direct tail estimate from a full Hardy budget, with no linear-subtraction premise. -/
theorem tail_of_budget {h : ℕ → ℝ} {rho B T : ℚ} {N : ℕ}
    (hrho : 1 < rho)
    (hB : ∀ J, ∑ k ∈ range J, h k ^ 2 * (rho : ℝ) ^ (2 * (2 * k + 1)) ≤ (B : ℝ))
    (hT : 0 ≤ T)
    (hnum : B * rho⁻¹ ^ (2 * (2 * N + 1)) ≤ T ^ 2 * (1 - rho⁻¹ ^ 4)) :
    ∑' n, |h (n + N)| ≤ (T : ℝ) :=
  hardy_tail h rho (by exact_mod_cast hrho) B hB N T
    (by exact_mod_cast hT) (by exact_mod_cast hnum)

end

end Grothe.UpperReplacement.CircleWideSound

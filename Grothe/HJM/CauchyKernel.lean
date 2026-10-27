import Mathlib
import Grothe.Upper.Haagerup

/-!
# Haagerup's kernel continued to the slit plane (HJM 6.22)

`hOm w = (w/2) ∫₀^π cos²θ (1 − w² sin²θ)^{−1/2} dθ` is HJM's `h_Ω` (the integral over `[0, π]` is twice the one
over `[0, π/2]`).

* `hasSum_hOm`: for `‖w‖ < 1` it is Haagerup's series `Σ_k haagCoeff k w^{2k+1}` (binomial series of
  `(1 − x)^{−1/2}` and Wallis' integrals `∫₀^π cos²θ sin^{2k}θ dθ`);
* `differentiableOn_Iom_comp`: `z ↦ Iom (g z)` is holomorphic on an open set where every `1 − s g(z)²`,
  `s ∈ [0, 1]`, lies in the slit plane (differentiation under the integral sign);
* `norm_hOm_le_of_gate`: on the region `Gate` (checked by interval arithmetic in `CauchyGate.lean`)
  `‖hOm w‖ ≤ 10`.
-/

namespace Grothe.HJM.Cauchy

open Complex intervalIntegral Metric Filter Topology Set MeasureTheory

noncomputable section

/-! ### The binomial series of `(1 − x)^{−1/2}` -/

/-- The coefficients of `(1 − x)^{−1/2} = Σ bin n xⁿ`. -/
def bin : ℕ → ℝ
  | 0 => 1
  | n + 1 => bin n * (2 * n + 1) / (2 * n + 2)

lemma bin_pos : ∀ n, 0 < bin n
  | 0 => by simp [bin]
  | n + 1 => by rw [bin]; have := bin_pos n; positivity

lemma bin_le_one : ∀ n, bin n ≤ 1
  | 0 => by simp [bin]
  | n + 1 => by
      rw [bin, div_le_one (by positivity)]
      have h1 := bin_le_one n
      have h0 := (bin_pos n).le
      have hn : (0 : ℝ) ≤ n := n.cast_nonneg
      nlinarith

lemma ascPochhammer_half (n : ℕ) :
    (ascPochhammer ℂ n).eval (1 / 2 : ℂ) = (n.factorial : ℂ) * (bin n : ℂ) := by
  induction n with
  | zero => simp [bin]
  | succ n ih =>
    rw [ascPochhammer_succ_eval, ih, Nat.factorial_succ, bin]
    push_cast
    field_simp
    ring

lemma choose_eq_bin (n : ℕ) : Ring.choose ((1 / 2 : ℂ) + n - 1) n = (bin n : ℂ) := by
  rw [← Ring.multichoose_eq]
  have h := Ring.factorial_nsmul_multichoose_eq_ascPochhammer (1 / 2 : ℂ) n
  rw [ascPochhammer_smeval_eq_eval, ascPochhammer_half, nsmul_eq_mul] at h
  exact mul_left_cancel₀ (by exact_mod_cast n.factorial_ne_zero) h

lemma hasSum_inv_sqrt {x : ℂ} (hx : ‖x‖ < 1) :
    HasSum (fun n => (bin n : ℂ) * x ^ n) ((1 - x) ^ (-(1 / 2 : ℂ))) := by
  have hmem : x ∈ Metric.eball (0 : ℂ) 1 := by
    rw [Metric.mem_eball, edist_zero_right, ← ofReal_norm, ENNReal.ofReal_lt_one]
    exact hx
  have h := (Complex.one_div_one_sub_cpow_hasFPowerSeriesOnBall_zero (1 / 2 : ℂ)).hasSum hmem
  simp only [zero_add, FormalMultilinearSeries.ofScalars_apply_eq, smul_eq_mul, choose_eq_bin] at h
  rw [Complex.cpow_neg, inv_eq_one_div]
  exact h

/-! ### Wallis' integrals -/

/-- `J m = ∫₀^π sin^m`. -/
def J (m : ℕ) : ℝ := ∫ θ in (0 : ℝ)..Real.pi, Real.sin θ ^ m

lemma J_zero : J 0 = Real.pi := by simp [J]

lemma J_succ_succ (m : ℕ) : J (m + 2) = (m + 1) / (m + 2) * J m := by
  simp [J, integral_sin_pow]

lemma integral_cos_sq_sin_pow (n : ℕ) :
    ∫ θ in (0 : ℝ)..Real.pi, Real.cos θ ^ 2 * Real.sin θ ^ (2 * n) = J (2 * n) / (2 * n + 2) := by
  have e : ∀ θ : ℝ, Real.cos θ ^ 2 * Real.sin θ ^ (2 * n) =
      Real.sin θ ^ (2 * n) - Real.sin θ ^ (2 * n + 2) := fun θ => by
    rw [Real.cos_sq']; ring
  simp_rw [e]
  rw [intervalIntegral.integral_sub (by fun_prop : Continuous fun θ => Real.sin θ ^ (2 * n)).intervalIntegrable
    (by fun_prop : Continuous fun θ => Real.sin θ ^ (2 * n + 2)).intervalIntegrable]
  change J (2 * n) - J (2 * n + 2) = _
  rw [J_succ_succ]
  push_cast
  field_simp
  ring

lemma haagCoeff_succ (n : ℕ) :
    haagCoeff (n + 1) = haagCoeff n * ((2 * n + 1) ^ 2 / (4 * (n + 1) * (n + 2))) := by
  simp only [haagCoeff, haagR]
  push_cast
  ring

/-- Haagerup's coefficients as binomial coefficients times Wallis integrals. -/
lemma bin_mul_wallis (n : ℕ) : bin n * (J (2 * n) / (2 * n + 2)) / 2 = haagCoeff n := by
  induction n with
  | zero => simp [bin, J_zero, haagCoeff, haagR]; ring
  | succ n ih =>
    rw [haagCoeff_succ, ← ih, bin, show 2 * (n + 1) = 2 * n + 2 by ring, J_succ_succ]
    push_cast
    field_simp
    ring

/-! ### The integral and its series on the unit disc -/

/-- The integral part of `h_Ω`. -/
def Iom (w : ℂ) : ℂ :=
  ∫ θ in (0 : ℝ)..Real.pi,
    ((Real.cos θ ^ 2 : ℝ) : ℂ) * (1 - w ^ 2 * ((Real.sin θ ^ 2 : ℝ) : ℂ)) ^ (-(1 / 2 : ℂ))

/-- HJM's `h_Ω`. -/
def hOm (w : ℂ) : ℂ := w / 2 * Iom w

/-- **On the unit disc `h_Ω` is Haagerup's series.** -/
theorem hasSum_hOm {w : ℂ} (hw : ‖w‖ < 1) :
    HasSum (fun k => (haagCoeff k : ℂ) * w ^ (2 * k + 1)) (hOm w) := by
  set F : ℕ → ℝ → ℂ := fun n θ =>
    ((Real.cos θ ^ 2 : ℝ) : ℂ) * ((bin n : ℂ) * (w ^ 2 * ((Real.sin θ ^ 2 : ℝ) : ℂ)) ^ n) with hF
  have hs1 : ∀ θ : ℝ, ‖w ^ 2 * ((Real.sin θ ^ 2 : ℝ) : ℂ)‖ ≤ ‖w‖ ^ 2 := fun θ => by
    rw [norm_mul, norm_pow, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _)]
    exact mul_le_of_le_one_right (by positivity) (Real.sin_sq_le_one θ)
  have hw2 : ‖w‖ ^ 2 < 1 := by nlinarith [norm_nonneg w]
  have hlim : ∀ θ : ℝ, HasSum (fun n => F n θ) (((Real.cos θ ^ 2 : ℝ) : ℂ) *
      (1 - w ^ 2 * ((Real.sin θ ^ 2 : ℝ) : ℂ)) ^ (-(1 / 2 : ℂ))) := fun θ =>
    (hasSum_inv_sqrt ((hs1 θ).trans_lt hw2)).mul_left _
  have hbound : ∀ n θ, ‖F n θ‖ ≤ (‖w‖ ^ 2) ^ n := fun n θ => by
    simp only [hF, norm_mul, norm_pow, Complex.norm_real, Real.norm_eq_abs]
    rw [abs_of_nonneg (sq_nonneg _), abs_of_pos (bin_pos n)]
    have h1 : Real.cos θ ^ 2 ≤ 1 := Real.cos_sq_le_one θ
    have h2 := bin_le_one n
    have h3 : ‖w ^ 2 * ((Real.sin θ ^ 2 : ℝ) : ℂ)‖ ^ n ≤ (‖w‖ ^ 2) ^ n :=
      pow_le_pow_left₀ (norm_nonneg _) (hs1 θ) n
    rw [norm_mul, norm_pow, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _)] at h3
    calc Real.cos θ ^ 2 * (bin n * (‖w‖ ^ 2 * Real.sin θ ^ 2) ^ n)
        ≤ 1 * (1 * (‖w‖ ^ 2) ^ n) := by
          gcongr
          · exact (bin_pos n).le
      _ = (‖w‖ ^ 2) ^ n := by ring
  have hint := intervalIntegral.hasSum_integral_of_dominated_convergence (μ := MeasureTheory.volume)
    (a := 0) (b := Real.pi) (F := F) (fun n _ => (‖w‖ ^ 2) ^ n)
    (fun n => (by fun_prop : Continuous (F n)).aestronglyMeasurable)
    (fun n => ae_of_all _ fun θ _ => hbound n θ)
    (ae_of_all _ fun _ _ => summable_geometric_of_lt_one (by positivity) hw2)
    intervalIntegrable_const (ae_of_all _ fun θ _ => hlim θ)
  have hFn : ∀ n, ∫ θ in (0 : ℝ)..Real.pi, F n θ =
      (bin n : ℂ) * w ^ (2 * n) * ((J (2 * n) / (2 * n + 2) : ℝ) : ℂ) := fun n => by
    have e : ∀ θ, F n θ =
        (bin n : ℂ) * w ^ (2 * n) * ((Real.cos θ ^ 2 * Real.sin θ ^ (2 * n) : ℝ) : ℂ) := fun θ => by
      simp only [hF]; push_cast; ring
    simp_rw [e]
    rw [intervalIntegral.integral_const_mul, intervalIntegral.integral_ofReal,
      integral_cos_sq_sin_pow]
  rw [funext hFn] at hint
  have := hint.mul_left (w / 2)
  unfold hOm Iom
  convert this using 1
  funext k
  rw [← bin_mul_wallis k]
  push_cast
  ring

/-! ### Holomorphy under the slit-plane condition -/

/-- The slit-plane condition along `s ∈ [0, 1]`. -/
def Good (w : ℂ) : Prop := ∀ s : ℝ, 0 ≤ s → s ≤ 1 → 1 - w ^ 2 * (s : ℂ) ∈ slitPlane

lemma good_sin {w : ℂ} (h : Good w) (θ : ℝ) :
    1 - w ^ 2 * ((Real.sin θ ^ 2 : ℝ) : ℂ) ∈ slitPlane :=
  h _ (sq_nonneg _) (Real.sin_sq_le_one θ)

/-- **Holomorphy of `z ↦ Iom (g z)`** on an open set where `g z` is `Good`. -/
theorem differentiableOn_Iom_comp {g : ℂ → ℂ} (hg : Differentiable ℂ g) {U : Set ℂ} (hU : IsOpen U)
    (hgood : ∀ z ∈ U, Good (g z)) : DifferentiableOn ℂ (fun z => Iom (g z)) U := by
  intro z₀ hz₀
  apply DifferentiableAt.differentiableWithinAt
  obtain ⟨ε, hε, hball⟩ := Metric.isOpen_iff.1 hU z₀ hz₀
  have hK : closedBall z₀ (ε / 2) ⊆ U := (closedBall_subset_ball (by linarith)).trans hball
  have hg' : Continuous (deriv g) := hg.contDiff.continuous_deriv (by simp)
  set c : ℝ → ℂ := fun θ => ((Real.cos θ ^ 2 : ℝ) : ℂ) with hc
  set s : ℝ → ℂ := fun θ => ((Real.sin θ ^ 2 : ℝ) : ℂ) with hs
  set F : ℂ → ℝ → ℂ := fun z θ => c θ * (1 - g z ^ 2 * s θ) ^ (-(1 / 2 : ℂ)) with hF
  set F' : ℂ → ℝ → ℂ := fun z θ => c θ * ((-(1 / 2 : ℂ)) * (1 - g z ^ 2 * s θ) ^ (-(1 / 2 : ℂ) - 1) *
    (-(2 * g z * deriv g z * s θ))) with hF'
  have hcc : Continuous c := by fun_prop
  have hsc : Continuous s := by fun_prop
  -- continuity in `θ` for a good point
  have hFc : ∀ z ∈ U, Continuous (F z) := fun z hz => by
    refine continuous_iff_continuousAt.2 fun θ => ?_
    exact hcc.continuousAt.mul (ContinuousAt.cpow (by fun_prop) continuousAt_const
      (good_sin (hgood z hz) θ))
  have hF'c : ∀ z ∈ U, Continuous (F' z) := fun z hz => by
    refine continuous_iff_continuousAt.2 fun θ => ?_
    refine hcc.continuousAt.mul (ContinuousAt.mul (ContinuousAt.mul continuousAt_const
      (ContinuousAt.cpow (by fun_prop) continuousAt_const (good_sin (hgood z hz) θ))) (by fun_prop))
  -- joint continuity of `F'` on the compact `closedBall × [0, π]`
  have hF'joint : ContinuousOn (fun p : ℂ × ℝ => F' p.1 p.2) (closedBall z₀ (ε / 2) ×ˢ Icc 0 Real.pi) := by
    intro p hp
    have hgp : Good (g p.1) := hgood p.1 (hK hp.1)
    refine ContinuousAt.continuousWithinAt ?_
    have h1 : ContinuousAt (fun p : ℂ × ℝ => 1 - g p.1 ^ 2 * s p.2) p := by
      have : Continuous fun p : ℂ × ℝ => 1 - g p.1 ^ 2 * s p.2 :=
        continuous_const.sub (((hg.continuous.comp continuous_fst).pow 2).mul (hsc.comp continuous_snd))
      exact this.continuousAt
    have h2 : ContinuousAt (fun p : ℂ × ℝ => (1 - g p.1 ^ 2 * s p.2) ^ (-(1 / 2 : ℂ) - 1)) p :=
      h1.cpow continuousAt_const (good_sin hgp p.2)
    have h3 : Continuous fun p : ℂ × ℝ => -(2 * g p.1 * deriv g p.1 * s p.2) :=
      ((continuous_const.mul (hg.continuous.comp continuous_fst)).mul
        (hg'.comp continuous_fst)).mul (hsc.comp continuous_snd) |>.neg
    exact ((hcc.comp continuous_snd).continuousAt.mul ((continuousAt_const.mul h2).mul h3.continuousAt))
  obtain ⟨C, hC⟩ := (isCompact_closedBall z₀ (ε / 2)).prod isCompact_Icc |>.exists_bound_of_continuousOn
    hF'joint
  have hderiv : ∀ z ∈ U, ∀ θ : ℝ, HasDerivAt (fun x => F x θ) (F' z θ) z := fun z hz θ => by
    have hin : HasDerivAt (fun x => 1 - g x ^ 2 * s θ) (-(2 * g z * deriv g z * s θ)) z := by
      have := (((hg z).hasDerivAt.pow 2).mul_const (s θ)).const_sub 1
      convert this using 1
      push_cast; ring
    exact (hin.cpow_const (good_sin (hgood z hz) θ)).const_mul (c θ)
  have hball' : ball z₀ (ε / 2) ⊆ U := ball_subset_closedBall.trans hK
  have key := intervalIntegral.hasDerivAt_integral_of_dominated_loc_of_deriv_le (μ := volume)
    (a := 0) (b := Real.pi) (F := F) (F' := F') (x₀ := z₀) (bound := fun _ => C)
    (ball_mem_nhds z₀ (by linarith))
    (eventually_of_mem (hU.mem_nhds hz₀) fun z hz => (hFc z hz).aestronglyMeasurable)
    ((hFc z₀ hz₀).intervalIntegrable _ _)
    ((hF'c z₀ hz₀).aestronglyMeasurable)
    (ae_of_all _ fun θ hθ x hx => by
      have hθ' : θ ∈ Icc 0 Real.pi := by
        rw [uIoc_of_le Real.pi_pos.le] at hθ; exact Ioc_subset_Icc_self hθ
      exact hC (x, θ) ⟨ball_subset_closedBall hx, hθ'⟩)
    intervalIntegrable_const
    (ae_of_all _ fun θ _ x hx => hderiv x (hball' hx) θ)
  exact key.2.differentiableAt

/-! ### The bound on the gate region -/

/-- The region checked by interval arithmetic: `|w|² ≤ 9/4`, and `Re w² ≤ 39/40` or `(Re w²)² ≤ 1500 (Im w²)²`. -/
def Gate (w : ℂ) : Prop :=
  Complex.normSq w ≤ 9 / 4 ∧ ((w ^ 2).re ≤ 39 / 40 ∨ (w ^ 2).re ^ 2 ≤ 1500 * (w ^ 2).im ^ 2)

lemma good_and_norm_of_gate {w : ℂ} (h : Gate w) (s : ℝ) (hs0 : 0 ≤ s) (hs1 : s ≤ 1) :
    1 - w ^ 2 * (s : ℂ) ∈ slitPlane ∧ 1 / 40 ≤ ‖1 - w ^ 2 * (s : ℂ)‖ := by
  set a := (w ^ 2).re
  set b := (w ^ 2).im
  have hre : (1 - w ^ 2 * (s : ℂ)).re = 1 - s * a := by
    simp [a, Complex.mul_re]; ring
  have him : (1 - w ^ 2 * (s : ℂ)).im = -(s * b) := by
    simp [b, Complex.mul_im]
  rcases h.2 with h1 | h2
  · have hpos : 1 / 40 ≤ 1 - s * a := by nlinarith [mul_nonneg hs0 (sub_nonneg.2 h1)]
    refine ⟨Complex.mem_slitPlane_iff.2 (Or.inl (by rw [hre]; linarith)), ?_⟩
    exact hpos.trans (hre ▸ Complex.re_le_norm _)
  · have hns : Complex.normSq (1 - w ^ 2 * (s : ℂ)) = (1 - s * a) ^ 2 + (s * b) ^ 2 := by
      rw [Complex.normSq_apply, hre, him]; ring
    have hsb : (s * a) ^ 2 ≤ 1500 * (s * b) ^ 2 := by
      have := mul_le_mul_of_nonneg_left h2 (sq_nonneg s); nlinarith
    have hq : 1 / 1600 ≤ Complex.normSq (1 - w ^ 2 * (s : ℂ)) := by
      rw [hns]
      nlinarith [sq_nonneg ((1501 / 1500) * (s * a) - 1)]
    refine ⟨Complex.mem_slitPlane_iff.2 ?_, ?_⟩
    · by_cases hp : 0 < 1 - s * a
      · exact Or.inl (by rw [hre]; exact hp)
      · refine Or.inr ?_
        rw [him]
        intro h0
        have hsb0 : s * b = 0 := by linarith
        have : (s * a) ^ 2 ≤ 0 := by rw [hsb0] at hsb; simpa using hsb
        have : s * a = 0 := by nlinarith [sq_nonneg (s * a)]
        exact hp (by rw [this]; norm_num)
    · rw [Complex.normSq_eq_norm_sq] at hq
      nlinarith [norm_nonneg (1 - w ^ 2 * (s : ℂ))]

lemma good_of_gate {w : ℂ} (h : Gate w) : Good w := fun s hs0 hs1 =>
  (good_and_norm_of_gate h s hs0 hs1).1

lemma norm_cpow_neg_half_le {z : ℂ} (hz : 1 / 40 ≤ ‖z‖) : ‖z ^ (-(1 / 2 : ℂ))‖ ≤ 32 / 5 := by
  have hz0 : z ≠ 0 := by
    intro h; rw [h, norm_zero] at hz; norm_num at hz
  have hpos : 0 < ‖z‖ := norm_pos_iff.2 hz0
  rw [Complex.norm_cpow_of_ne_zero hz0]
  have e1 : (-(1 / 2 : ℂ)).re = -(1 / 2) := by norm_num
  have e2 : (-(1 / 2 : ℂ)).im = 0 := by norm_num
  rw [e1, e2, mul_zero, Real.exp_zero, div_one, Real.rpow_neg hpos.le, ← Real.sqrt_eq_rpow]
  have hs : 0 < √‖z‖ := Real.sqrt_pos.2 hpos
  rw [inv_le_comm₀ hs (by norm_num)]
  rw [Real.le_sqrt (by norm_num) hpos.le]
  linarith

/-- `‖Iom w‖ ≤ (π/2)(32/5)` on the gate region. -/
lemma norm_Iom_le_of_gate {w : ℂ} (h : Gate w) : ‖Iom w‖ ≤ Real.pi / 2 * (32 / 5) := by
  unfold Iom
  have hb : ∀ θ : ℝ, ‖((Real.cos θ ^ 2 : ℝ) : ℂ) * (1 - w ^ 2 * ((Real.sin θ ^ 2 : ℝ) : ℂ)) ^ (-(1 / 2 : ℂ))‖
      ≤ Real.cos θ ^ 2 * (32 / 5) := fun θ => by
    rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _)]
    exact mul_le_mul_of_nonneg_left (norm_cpow_neg_half_le
      (good_and_norm_of_gate h _ (sq_nonneg _) (Real.sin_sq_le_one θ)).2) (sq_nonneg _)
  refine (intervalIntegral.norm_integral_le_of_norm_le Real.pi_pos.le (ae_of_all _ fun θ _ => hb θ)
    ((by fun_prop : Continuous fun θ => Real.cos θ ^ 2 * (32 / 5 : ℝ)).intervalIntegrable _ _)).trans ?_
  rw [intervalIntegral.integral_mul_const, integral_cos_sq]
  simp

/-- **`‖h_Ω(w)‖ ≤ 10` on the gate region.** -/
theorem norm_hOm_le_of_gate {w : ℂ} (h : Gate w) : ‖hOm w‖ ≤ 10 := by
  unfold hOm
  have hw : ‖w‖ ≤ 3 / 2 := by
    have := h.1
    rw [Complex.normSq_eq_norm_sq] at this
    nlinarith [norm_nonneg w]
  rw [norm_mul, norm_div, Complex.norm_ofNat]
  have hI := norm_Iom_le_of_gate h
  calc ‖w‖ / 2 * ‖Iom w‖ ≤ (3 / 2) / 2 * (Real.pi / 2 * (32 / 5)) := by gcongr
    _ ≤ 10 := by nlinarith [Real.pi_lt_d2]

end

end Grothe.HJM.Cauchy

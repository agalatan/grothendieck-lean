import Mathlib

/-!
# Holomorphic dependence of Gaussian-type parametric integrals

`∫ c(q) g(t) exp(∑ₖ αₖ(t) mₖ(q)) dμ(q)` is holomorphic in `t` on an open set `U` when `g` and the `αₖ`
are holomorphic on `U`, `c` is bounded by `1`, the real weights satisfy `|mₖ| ≤ N`, and at every
`t ∈ U` the exponent has real part `≤ −λ N` for some `λ > 0` (pointwise; local uniformity follows
from continuity of the `αₖ`). Used for the analytic continuation of the rounding kernel (step 1 of
the `hardy` plan, `HardyHolo.lean`).
-/

open MeasureTheory Metric Complex Filter Topology

namespace Grothe.UpperChaos

variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} {n : ℕ}

omit [MeasurableSpace Ω] in
/-- Pointwise strict decay plus continuity of the coefficients gives decay on a ball. -/
lemma exists_ball_re_le {α : Fin n → ℂ → ℂ} {t₀ : ℂ} (hα : ∀ k, ContinuousAt (α k) t₀)
    {m : Fin n → Ω → ℝ} {N : Ω → ℝ} (hN : ∀ q, 0 ≤ N q) (hmN : ∀ k q, |m k q| ≤ N q) {l : ℝ}
    (hl : 0 < l) (h : ∀ q, (∑ k, α k t₀ * (m k q : ℂ)).re ≤ -(l * N q)) :
    ∃ ε > 0, ∀ s ∈ ball t₀ ε, ∀ q, (∑ k, α k s * (m k q : ℂ)).re ≤ -(l / 2 * N q) := by
  set δ : ℝ := l / (2 * (n + 1)) with hδ
  have hδ0 : 0 < δ := by positivity
  have hcont : ContinuousAt (fun s k => α k s) t₀ := continuousAt_pi.2 hα
  obtain ⟨ε, hε, hball⟩ := Metric.continuousAt_iff.1 hcont δ hδ0
  refine ⟨ε, hε, fun s hs q => ?_⟩
  have hk : ∀ k, ‖α k s - α k t₀‖ < δ := fun k => by
    have h1 := hball (mem_ball.1 hs)
    rw [dist_eq_norm] at h1
    exact lt_of_le_of_lt (norm_le_pi_norm ((fun k => α k s) - fun k => α k t₀) k) h1
  have hsplit : (∑ k, α k s * (m k q : ℂ)).re
      = (∑ k, α k t₀ * (m k q : ℂ)).re + (∑ k, (α k s - α k t₀) * (m k q : ℂ)).re := by
    rw [← Complex.add_re, ← Finset.sum_add_distrib]; congr 2; ext k; ring
  have herr : (∑ k, (α k s - α k t₀) * (m k q : ℂ)).re ≤ n * δ * N q := by
    calc (∑ k, (α k s - α k t₀) * (m k q : ℂ)).re ≤ ‖∑ k, (α k s - α k t₀) * (m k q : ℂ)‖ :=
          Complex.re_le_norm _
      _ ≤ ∑ k, ‖(α k s - α k t₀) * (m k q : ℂ)‖ := norm_sum_le _ _
      _ ≤ ∑ _k : Fin n, δ * N q := by
          refine Finset.sum_le_sum fun k _ => ?_
          rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]
          exact mul_le_mul (hk k).le (hmN k q) (abs_nonneg _) hδ0.le
      _ = n * δ * N q := by simp; ring
  have hnδ : n * δ ≤ l / 2 := by
    rw [hδ]; rw [mul_div_assoc']; rw [div_le_div_iff₀ (by positivity) (by norm_num)]; nlinarith
  rw [hsplit]
  nlinarith [h q, hN q, mul_le_mul_of_nonneg_right hnδ (hN q)]

/-- **Holomorphy of Gaussian-type parametric integrals.** -/
theorem differentiableOn_integral_exp {U : Set ℂ} (hU : IsOpen U) {α : Fin n → ℂ → ℂ}
    (hα : ∀ k, DifferentiableOn ℂ (α k) U) {g : ℂ → ℂ} (hg : DifferentiableOn ℂ g U)
    {m : Fin n → Ω → ℝ} (hm : ∀ k, Measurable (m k)) {c : Ω → ℂ}
    (hc : AEStronglyMeasurable c μ) (hcb : ∀ q, ‖c q‖ ≤ 1) {N : Ω → ℝ} (hN : ∀ q, 0 ≤ N q)
    (hmN : ∀ k q, |m k q| ≤ N q)
    (hpos : ∀ t ∈ U, ∃ l > 0, ∀ q, (∑ k, α k t * (m k q : ℂ)).re ≤ -(l * N q))
    (hint : ∀ l > 0, Integrable (fun q => Real.exp (-(l * N q))) μ)
    (hintN : ∀ l > 0, Integrable (fun q => N q * Real.exp (-(l * N q))) μ) :
    DifferentiableOn ℂ
      (fun t => ∫ q, c q * (g t * Complex.exp (∑ k, α k t * (m k q : ℂ))) ∂μ) U := by
  intro t₀ ht₀
  refine DifferentiableAt.differentiableWithinAt ?_
  -- a closed ball inside `U` on which the exponent decays uniformly
  obtain ⟨r, hr, hrU⟩ := Metric.isOpen_iff.1 hU t₀ ht₀
  obtain ⟨l, hl, hlt⟩ := hpos t₀ ht₀
  have hαc : ∀ k, ContinuousAt (α k) t₀ := fun k =>
    ((hα k).differentiableAt (hU.mem_nhds ht₀)).continuousAt
  obtain ⟨ε, hε, hdec⟩ := exists_ball_re_le hαc hN hmN hl hlt
  set ρ : ℝ := min ε r / 2 with hρ
  have hρ0 : 0 < ρ := by positivity
  have hρε : ρ < ε := by rw [hρ]; linarith [min_le_left ε r, half_lt_self (lt_min hε hr)]
  have hρr : ρ < r := by rw [hρ]; linarith [min_le_right ε r, half_lt_self (lt_min hε hr)]
  have hcbU : closedBall t₀ ρ ⊆ U := fun s hs => hrU (lt_of_le_of_lt (mem_closedBall.1 hs) hρr)
  have hballU : ball t₀ ρ ⊆ U := ball_subset_closedBall.trans hcbU
  -- bounds on the compact ball
  have han_g := hg.analyticOnNhd hU
  have hcg : ContinuousOn g (closedBall t₀ ρ) := (hg.continuousOn).mono hcbU
  have hcdg : ContinuousOn (deriv g) (closedBall t₀ ρ) :=
    (han_g.deriv.continuousOn).mono hcbU
  have hcdα : ∀ k, ContinuousOn (deriv (α k)) (closedBall t₀ ρ) := fun k =>
    (((hα k).analyticOnNhd hU).deriv.continuousOn).mono hcbU
  obtain ⟨G, hG⟩ := (isCompact_closedBall t₀ ρ).exists_bound_of_continuousOn hcg
  obtain ⟨G', hG'⟩ := (isCompact_closedBall t₀ ρ).exists_bound_of_continuousOn hcdg
  have hA : ∃ A, ∀ k, ∀ s ∈ closedBall t₀ ρ, ‖deriv (α k) s‖ ≤ A := by
    choose A hA using fun k => (isCompact_closedBall t₀ ρ).exists_bound_of_continuousOn (hcdα k)
    exact ⟨∑ k, |A k|, fun k s hs => (hA k s hs).trans ((le_abs_self _).trans
      (Finset.single_le_sum (f := fun k => |A k|) (fun _ _ => abs_nonneg _) (Finset.mem_univ k)))⟩
  obtain ⟨A, hA⟩ := hA
  -- the integrand, its derivative, and the dominating function
  set E : ℂ → Ω → ℂ := fun t q => ∑ k, α k t * (m k q : ℂ) with hE
  set F' : ℂ → Ω → ℂ := fun t q =>
    c q * (deriv g t * Complex.exp (E t q) + g t * (Complex.exp (E t q) *
      ∑ k, deriv (α k) t * (m k q : ℂ))) with hF'
  set L : ℝ := l / 2 with hL
  have hL0 : 0 < L := by positivity
  set bound : Ω → ℝ := fun q => |G'| * Real.exp (-(L * N q)) +
    |G| * (n * |A|) * (N q * Real.exp (-(L * N q))) with hbound
  have hEmeas : ∀ t, Measurable (E t) := fun t => by
    refine Finset.measurable_sum _ fun k _ => ?_
    exact measurable_const.mul (Complex.measurable_ofReal.comp (hm k))
  have hexp_le : ∀ s ∈ ball t₀ ρ, ∀ q, ‖Complex.exp (E s q)‖ ≤ Real.exp (-(L * N q)) := by
    intro s hs q
    rw [Complex.norm_exp]
    exact Real.exp_le_exp.2 (hdec s (ball_subset_ball hρε.le hs) q)
  have hsum_le : ∀ s ∈ closedBall t₀ ρ, ∀ q,
      ‖∑ k, deriv (α k) s * (m k q : ℂ)‖ ≤ n * |A| * N q := by
    intro s hs q
    calc ‖∑ k, deriv (α k) s * (m k q : ℂ)‖ ≤ ∑ k, ‖deriv (α k) s * (m k q : ℂ)‖ :=
          norm_sum_le _ _
      _ ≤ ∑ _k : Fin n, |A| * N q := by
          refine Finset.sum_le_sum fun k _ => ?_
          rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]
          exact mul_le_mul ((hA k s hs).trans (le_abs_self _)) (hmN k q) (abs_nonneg _)
            (abs_nonneg _)
      _ = n * |A| * N q := by simp; ring
  have hderiv := hasDerivAt_integral_of_dominated_loc_of_deriv_le (μ := μ)
    (F := fun t q => c q * (g t * Complex.exp (E t q))) (F' := F') (x₀ := t₀)
    (bound := bound) (s := ball t₀ ρ) (ball_mem_nhds t₀ hρ0)
    (Eventually.of_forall fun t => hc.mul
      ((measurable_const.mul (Complex.measurable_exp.comp (hEmeas t))).aestronglyMeasurable))
    (by
      refine Integrable.mono' ((hint L hL0).const_mul |G|) (hc.mul
        ((measurable_const.mul (Complex.measurable_exp.comp (hEmeas t₀))).aestronglyMeasurable))
        (Eventually.of_forall fun q => ?_)
      rw [norm_mul, norm_mul]
      have h1 := hcb q
      have h2 : ‖g t₀‖ ≤ |G| := (hG t₀ (mem_closedBall_self hρ0.le)).trans (le_abs_self _)
      have h3 := hexp_le t₀ (mem_ball_self hρ0) q
      calc ‖c q‖ * (‖g t₀‖ * ‖Complex.exp (E t₀ q)‖) ≤ 1 * (|G| * Real.exp (-(L * N q))) := by
            gcongr
        _ = |G| * Real.exp (-(L * N q)) := one_mul _)
    (by
      refine hc.mul ?_
      refine ((measurable_const.mul (Complex.measurable_exp.comp (hEmeas t₀))).add
        (measurable_const.mul ((Complex.measurable_exp.comp (hEmeas t₀)).mul
          (Finset.measurable_sum _ fun k _ =>
            measurable_const.mul (Complex.measurable_ofReal.comp (hm k)))))).aestronglyMeasurable)
    (Eventually.of_forall fun q s hs => by
      have hsc : s ∈ closedBall t₀ ρ := ball_subset_closedBall hs
      have he := hexp_le s hs q
      have hg1 : ‖g s‖ ≤ |G| := (hG s hsc).trans (le_abs_self _)
      have hg2 : ‖deriv g s‖ ≤ |G'| := (hG' s hsc).trans (le_abs_self _)
      have hs3 := hsum_le s hsc q
      simp only [hF', hbound]
      rw [norm_mul]
      calc ‖c q‖ * ‖deriv g s * Complex.exp (E s q) + g s * (Complex.exp (E s q) *
            ∑ k, deriv (α k) s * (m k q : ℂ))‖
          ≤ 1 * (‖deriv g s‖ * ‖Complex.exp (E s q)‖ + ‖g s‖ * (‖Complex.exp (E s q)‖ *
            ‖∑ k, deriv (α k) s * (m k q : ℂ)‖)) := by
            gcongr
            · exact hcb q
            · refine (norm_add_le _ _).trans ?_
              rw [norm_mul, norm_mul, norm_mul]
        _ ≤ 1 * (|G'| * Real.exp (-(L * N q)) + |G| * (Real.exp (-(L * N q)) *
            (n * |A| * N q))) := by gcongr
        _ = |G'| * Real.exp (-(L * N q)) + |G| * (n * |A|) * (N q * Real.exp (-(L * N q))) := by
            ring)
    (((hint L hL0).const_mul |G'|).add ((hintN L hL0).const_mul (|G| * (n * |A|))))
    (Eventually.of_forall fun q s hs => by
      have hsU := hballU hs
      have hdg : HasDerivAt g (deriv g s) s := ((hg.differentiableAt (hU.mem_nhds hsU))).hasDerivAt
      have hdE : HasDerivAt (fun t => E t q) (∑ k, deriv (α k) s * (m k q : ℂ)) s := by
        simp only [hE]
        exact HasDerivAt.fun_sum fun k _ =>
          (((hα k).differentiableAt (hU.mem_nhds hsU)).hasDerivAt).mul_const _
      have h2 : HasDerivAt (fun t => g t * Complex.exp (E t q))
          (deriv g s * Complex.exp (E s q) + g s * (Complex.exp (E s q) *
            ∑ k, deriv (α k) s * (m k q : ℂ))) s := hdg.mul hdE.cexp
      have h3 := h2.const_mul (c q)
      convert h3 using 1)
  exact hderiv.2.differentiableAt

end Grothe.UpperChaos

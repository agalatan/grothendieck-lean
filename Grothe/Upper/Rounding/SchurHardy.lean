import Grothe.Upper.Kernel.Hardy
import Grothe.Upper.Rounding.SchurGaussian
import Grothe.Upper.Rounding.ChaosRealise
import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.Complex.CauchyIntegral
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.ArctanDeriv
import Mathlib.Analysis.Real.Pi.Bounds
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Periodic
import Mathlib.MeasureTheory.Measure.Lebesgue.EqHaar

set_option warningAsError true

/-!
# Holomorphic Hardy continuation, Gaussian-amplitude circle cover, and real Mehler identification

Connects the precompiled interval checkers `circleMeanOK` and `regionOK` (`Grothe.Upper.Kernel.Hardy`)
to the weighted square-sum Hardy tail hypothesis `∀ J, ∑_{n < J} h_n² ρ^{2(2n+1)} ≤ B` of
`hardy_tail` (`Transfer.lean`):
1. Holomorphy of Gaussian-type parametric integrals (`differentiableOn_integral_exp`);
2. Analytic continuation and circle Parseval inequality for odd power series
   (`hasSum_odd_of_eqOn_real`, `sum_sq_le_of_mean_le`);
3. Soundness of the half-angle circle chart, `boxOK`, `coverGauss`, `circleMeanOK`, and `regionOK`;
4. Real cross-covariance Gaussian law identification (`integral_pair_eq_kHol`, `law_swap_gen`) and
   master Hardy channel theorems `hardy_smoothed_channel` and `hardy_unsmoothed_channel`.
-/

namespace Grothe.Upper

open MeasureTheory ProbabilityTheory Complex Real Metric Filter Topology
open FormalMultilinearSeries intervalIntegral Finset
open Grothe.Upper.Kernel Grothe.Upper.Kernel.Hardy
open Sym2R SchurKernel SchurMain GaussianAmplitude
open scoped ComplexConjugate InnerProductSpace Polynomial

noncomputable section

/-! ### 1. Holomorphy of Gaussian-type parametric integrals -/

section HolIntegral

variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} {n : ℕ}

omit [MeasurableSpace Ω] in
private lemma exists_ball_re_le {α : Fin n → ℂ → ℂ} {t₀ : ℂ} (hα : ∀ k, ContinuousAt (α k) t₀)
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
    rw [hδ, mul_div_assoc', div_le_div_iff₀ (by positivity) (by norm_num)]; nlinarith
  rw [hsplit]
  nlinarith [h q, hN q, mul_le_mul_of_nonneg_right hnδ (hN q)]

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
  have han_g := hg.analyticOnNhd hU
  have hcg : ContinuousOn g (closedBall t₀ ρ) := hg.continuousOn.mono hcbU
  have hcdg : ContinuousOn (deriv g) (closedBall t₀ ρ) := han_g.deriv.continuousOn.mono hcbU
  have hcdα : ∀ k, ContinuousOn (deriv (α k)) (closedBall t₀ ρ) := fun k =>
    (((hα k).analyticOnNhd hU).deriv.continuousOn).mono hcbU
  obtain ⟨G, hG⟩ := (isCompact_closedBall t₀ ρ).exists_bound_of_continuousOn hcg
  obtain ⟨G', hG'⟩ := (isCompact_closedBall t₀ ρ).exists_bound_of_continuousOn hcdg
  have hA : ∃ A, ∀ k, ∀ s ∈ closedBall t₀ ρ, ‖deriv (α k) s‖ ≤ A := by
    choose A hA using fun k => (isCompact_closedBall t₀ ρ).exists_bound_of_continuousOn (hcdα k)
    exact ⟨∑ k, |A k|, fun k s hs => (hA k s hs).trans ((le_abs_self _).trans
      (Finset.single_le_sum (f := fun k => |A k|) (fun _ _ => abs_nonneg _) (Finset.mem_univ k)))⟩
  obtain ⟨A, hA⟩ := hA
  set E : ℂ → Ω → ℂ := fun t q => ∑ k, α k t * (m k q : ℂ) with hE
  set F' : ℂ → Ω → ℂ := fun t q =>
    c q * (deriv g t * Complex.exp (E t q) + g t * (Complex.exp (E t q) *
      ∑ k, deriv (α k) t * (m k q : ℂ))) with hF'
  set L : ℝ := l / 2
  have hL0 : 0 < L := by positivity
  set bound : Ω → ℝ := fun q => |G'| * Real.exp (-(L * N q)) +
    |G| * (n * |A|) * (N q * Real.exp (-(L * N q))) with hbound
  have hEmeas : ∀ t, Measurable (E t) := fun t =>
    Finset.measurable_sum _ fun k _ => measurable_const.mul (Complex.measurable_ofReal.comp (hm k))
  have hexp_le : ∀ s ∈ ball t₀ ρ, ∀ q, ‖Complex.exp (E s q)‖ ≤ Real.exp (-(L * N q)) := by
    intro s hs q
    rw [Complex.norm_exp]
    exact Real.exp_le_exp.2 (hdec s (ball_subset_ball hρε.le hs) q)
  have hsum_le : ∀ s ∈ closedBall t₀ ρ, ∀ q,
      ‖∑ k, deriv (α k) s * (m k q : ℂ)‖ ≤ n * |A| * N q := by
    intro s hs q
    calc ‖∑ k, deriv (α k) s * (m k q : ℂ)‖ ≤ ∑ k, ‖deriv (α k) s * (m k q : ℂ)‖ := norm_sum_le _ _
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
      have hdg : HasDerivAt g (deriv g s) s := (hg.differentiableAt (hU.mem_nhds hsU)).hasDerivAt
      have hdE : HasDerivAt (fun t => E t q) (∑ k, deriv (α k) s * (m k q : ℂ)) s := by
        simp only [hE]
        exact HasDerivAt.fun_sum fun k _ =>
          (((hα k).differentiableAt (hU.mem_nhds hsU)).hasDerivAt).mul_const _
      have h2 : HasDerivAt (fun t => g t * Complex.exp (E t q))
          (deriv g s * Complex.exp (E s q) + g s * (Complex.exp (E s q) *
            ∑ k, deriv (α k) s * (m k q : ℂ))) s := hdg.mul hdE.cexp
      convert h2.const_mul (c q) using 1)
  exact hderiv.2.differentiableAt

end HolIntegral

/-! ### 2. Analytic continuation & Parseval for odd power series -/

private def oddCoeff (h : ℕ → ℝ) (n : ℕ) : ℂ := if Odd n then (h (n / 2) : ℂ) else 0

private lemma oddCoeff_odd (h : ℕ → ℝ) (j : ℕ) : oddCoeff h (2 * j + 1) = h j := by
  simp [oddCoeff]; congr 2; omega

private lemma hasSum_oddCoeff_iff (h : ℕ → ℝ) (z S : ℂ) :
    HasSum (fun n => oddCoeff h n • z ^ n) S ↔
      HasSum (fun j => (h j : ℂ) * z ^ (2 * j + 1)) S := by
  have hinj : Function.Injective fun j : ℕ => 2 * j + 1 := fun _ _ hab => by simpa using hab
  have hcomp : ((fun n => oddCoeff h n • z ^ n) ∘ fun j => 2 * j + 1) =
      fun j => (h j : ℂ) * z ^ (2 * j + 1) := by
    funext j; simp only [Function.comp, oddCoeff_odd, smul_eq_mul]
  rw [← hinj.hasSum_iff, hcomp]
  intro n hn
  have : ¬ Odd n := fun ho => hn ⟨n / 2, by obtain ⟨k, rfl⟩ := ho; simp only; omega⟩
  simp [oddCoeff, this]

private def oddSeries (h : ℕ → ℝ) : FormalMultilinearSeries ℂ ℂ ℂ := ofScalars ℂ (oddCoeff h)

private lemma one_le_radius_oddSeries {h : ℕ → ℝ} (hs : Summable fun j => |h j|) :
    1 ≤ (oddSeries h).radius := by
  have hb : ∀ n, ‖oddCoeff h n‖ ≤ ∑' j, |h j| := fun n => by
    unfold oddCoeff; split_ifs
    · rw [Complex.norm_real, Real.norm_eq_abs]; exact hs.le_tsum (n / 2) fun _ _ => abs_nonneg _
    · simp only [norm_zero]; exact tsum_nonneg fun _ => abs_nonneg _
  have : ((1 : NNReal) : ENNReal) ≤ (oddSeries h).radius := by
    refine (oddSeries h).le_radius_of_bound (C := ∑' j, |h j|) fun n => ?_
    simp only [NNReal.coe_one, one_pow, mul_one, oddSeries]
    exact le_trans (by rw [ofScalars_norm]) (hb n)
  simpa using this

theorem hasSum_odd_of_eqOn_real {f : ℂ → ℂ} {r : ℝ} (hr : 1 < r)
    (hf : DifferentiableOn ℂ f (ball 0 r)) {h : ℕ → ℝ} (hs : Summable fun j => |h j|)
    (heq : ∀ t : ℝ, 0 < t → t < 1 → HasSum (fun j => (h j : ℂ) * (t : ℂ) ^ (2 * j + 1)) (f t)) :
    ∀ z ∈ ball (0 : ℂ) r, HasSum (fun j => (h j : ℂ) * z ^ (2 * j + 1)) (f z) := by
  set p := oddSeries h with hp
  have hrad : (1 : ENNReal) ≤ p.radius := one_le_radius_oddSeries hs
  have hg : HasFPowerSeriesOnBall p.sum p 0 1 :=
    (p.hasFPowerSeriesOnBall (lt_of_lt_of_le zero_lt_one hrad)).mono zero_lt_one hrad
  have hreal : ∀ t : ℝ, 0 < t → t < 1 → f t = p.sum t := fun t ht0 ht1 => by
    have hmem : (t : ℂ) ∈ Metric.eball (0 : ℂ) 1 := by
      rw [Metric.mem_eball, edist_zero_right, ← ofReal_norm, ENNReal.ofReal_lt_one,
        Complex.norm_real, Real.norm_eq_abs, abs_of_pos ht0]
      exact ht1
    have h1 := hg.hasSum hmem
    simp only [zero_add, hp, oddSeries, ofScalars_apply_eq] at h1
    exact (heq t ht0 ht1).unique ((hasSum_oddCoeff_iff h _ _).1 h1)
  have hfa : AnalyticOnNhd ℂ f (ball 0 1) :=
    (hf.mono (ball_subset_ball hr.le)).analyticOnNhd isOpen_ball
  have hga : AnalyticOnNhd ℂ p.sum (ball 0 1) := fun z hz =>
    hg.analyticAt_of_mem (by simpa [Metric.mem_eball, edist_dist, ← ENNReal.ofReal_one] using hz)
  have hfreq : ∃ᶠ z in 𝓝[≠] ((1 / 2 : ℝ) : ℂ), f z = p.sum z := by
    rw [Filter.frequently_iff]
    intro U hU
    obtain ⟨ε, hε, hεU⟩ := Metric.mem_nhdsWithin_iff.1 hU
    set d : ℝ := min (ε / 2) (1 / 4)
    have hd0 : 0 < d := by positivity
    refine ⟨((1 / 2 + d : ℝ) : ℂ), hεU ⟨?_, ?_⟩, hreal _ (by positivity) ?_⟩
    · rw [mem_ball, dist_eq_norm, ← ofReal_sub, Complex.norm_real, Real.norm_eq_abs,
        show (1 / 2 + d : ℝ) - 1 / 2 = d by ring, abs_of_pos hd0]
      exact lt_of_le_of_lt (min_le_left _ _) (half_lt_self hε)
    · simp only [Set.mem_compl_iff, Set.mem_singleton_iff, ofReal_inj]; linarith
    · linarith [min_le_right (ε / 2) (1 / 4 : ℝ)]
  have h12 : ((1 / 2 : ℝ) : ℂ) ∈ ball (0 : ℂ) 1 := by
    rw [mem_ball, dist_zero_right, Complex.norm_real, Real.norm_eq_abs]; norm_num
  have hEq : Set.EqOn f p.sum (ball 0 1) :=
    hfa.eqOn_of_preconnected_of_frequently_eq hga (convex_ball _ _).isPreconnected h12 hfreq
  intro z hz
  have hzr : ‖z‖ < r := by simpa using hz
  set r' : ℝ := max ((‖z‖ + r) / 2) ((1 + r) / 2)
  have hr'r : r' < r := max_lt (by linarith) (by linarith)
  have hzr' : ‖z‖ < r' := lt_of_lt_of_le (by linarith) (le_max_left _ _)
  have hr'0 : 0 < r' := lt_of_lt_of_le (by linarith) (le_max_right _ _)
  set R' : NNReal := ⟨r', hr'0.le⟩
  have hfc : HasFPowerSeriesOnBall f (cauchyPowerSeries f 0 R') 0 R' :=
    (hf.mono (closedBall_subset_ball hr'r)).hasFPowerSeriesOnBall (by exact_mod_cast hr'0)
  have hfp : HasFPowerSeriesAt f p 0 := by
    refine hg.hasFPowerSeriesAt.congr ?_
    filter_upwards [isOpen_ball.mem_nhds (mem_ball_self zero_lt_one)] with w hw
    exact (hEq hw).symm
  rw [hfc.hasFPowerSeriesAt.eq_formalMultilinearSeries hfp] at hfc
  have hmem : z ∈ Metric.eball (0 : ℂ) R' := by
    rw [Metric.mem_eball, edist_zero_right, eNorm_eq_nnNorm, ENNReal.coe_lt_coe,
      ← NNReal.coe_lt_coe]
    exact hzr'
  have h1 := hfc.hasSum hmem
  simp only [zero_add, hp, oddSeries, ofScalars_apply_eq] at h1
  exact (hasSum_oddCoeff_iff h _ _).1 h1

theorem summable_abs_of_hasSum_ball {f : ℂ → ℂ} {h : ℕ → ℝ} {r ρ : ℝ} (hρ0 : 0 ≤ ρ) (hρ : ρ < r)
    (hsum : ∀ z ∈ ball (0 : ℂ) r, HasSum (fun j => (h j : ℂ) * z ^ (2 * j + 1)) (f z)) :
    Summable fun j => |h j * ρ ^ (2 * j + 1)| := by
  set ρ' : ℝ := (ρ + r) / 2 with hρ'
  have hρ'0 : 0 < ρ' := by rw [hρ']; linarith
  have hρρ' : ρ < ρ' := by rw [hρ']; linarith
  have hmem : (ρ' : ℂ) ∈ ball (0 : ℂ) r := by
    rw [mem_ball, dist_zero_right, Complex.norm_real, Real.norm_eq_abs, abs_of_pos hρ'0, hρ']
    linarith
  have ht := (hsum _ hmem).summable.tendsto_atTop_zero
  obtain ⟨C, hC⟩ := (Metric.isBounded_range_of_tendsto _ ht).exists_norm_le
  set q : ℝ := ρ / ρ' with hq
  have hq0 : 0 ≤ q := div_nonneg hρ0 hρ'0.le
  have hq1 : q < 1 := (div_lt_one hρ'0).2 hρρ'
  have hgeo : Summable fun j : ℕ => C * q * (q ^ 2) ^ j :=
    (summable_geometric_of_lt_one (by positivity) (by nlinarith)).mul_left _
  refine hgeo.of_nonneg_of_le (fun _ => abs_nonneg _) fun j => ?_
  have hb := hC _ ⟨j, rfl⟩
  simp only [norm_mul, Complex.norm_real, Real.norm_eq_abs, norm_pow, abs_of_pos hρ'0] at hb
  rw [abs_mul, abs_pow, abs_of_nonneg hρ0, show ρ = q * ρ' by rw [hq]; field_simp, mul_pow]
  calc |h j| * (q ^ (2 * j + 1) * ρ' ^ (2 * j + 1))
      = (|h j| * ρ' ^ (2 * j + 1)) * q ^ (2 * j + 1) := by ring
    _ ≤ C * q ^ (2 * j + 1) := by gcongr
    _ = C * q * (q ^ 2) ^ j := by ring

private def parsevalTerm (a : ℕ → ℝ) (i : ℕ × ℕ) : C(ℝ, ℂ) :=
  ⟨fun θ => ((a i.1 * a i.2 : ℝ) : ℂ) * Complex.exp (2 * ((i.1 : ℂ) - i.2) * (θ * I)), by fun_prop⟩

private lemma integral_parsevalTerm (a : ℕ → ℝ) (i : ℕ × ℕ) :
    ∫ θ in (0 : ℝ)..2 * Real.pi, parsevalTerm a i θ =
      if i.1 = i.2 then ((2 * Real.pi * a i.1 ^ 2 : ℝ) : ℂ) else 0 := by
  simp only [parsevalTerm, ContinuousMap.coe_mk]
  rw [intervalIntegral.integral_const_mul]
  split_ifs with h
  · simp only [h, sub_self, mul_zero, zero_mul, Complex.exp_zero,
      intervalIntegral.integral_const, sub_zero, Complex.real_smul, mul_one]
    push_cast; ring
  · have hc : (2 * ((i.1 : ℂ) - i.2) * I) ≠ 0 :=
      mul_ne_zero (mul_ne_zero two_ne_zero (sub_ne_zero.2 (by exact_mod_cast h))) I_ne_zero
    have e : ∀ θ : ℝ, Complex.exp (2 * ((i.1 : ℂ) - i.2) * (θ * I)) =
        Complex.exp ((2 * ((i.1 : ℂ) - i.2) * I) * θ) := fun _ => by ring_nf
    simp_rw [e]
    rw [integral_exp_mul_complex hc]
    have h1 : Complex.exp (2 * ((i.1 : ℂ) - i.2) * I * (2 * (Real.pi : ℂ))) = 1 := by
      have : 2 * ((i.1 : ℂ) - i.2) * I * (2 * (Real.pi : ℂ)) =
          ((2 * ((i.1 : ℤ) - i.2) : ℤ) : ℂ) * (2 * Real.pi * I) := by push_cast; ring
      rw [this, Complex.exp_int_mul_two_pi_mul_I]
    push_cast; simp [h1]

theorem hasSum_parseval_odd {f : ℂ → ℂ} {h : ℕ → ℝ} {ρ : ℝ}
    (hsum : ∀ θ : ℝ, HasSum (fun j => (h j : ℂ) * ((ρ : ℂ) * Complex.exp (θ * I)) ^ (2 * j + 1))
      (f ((ρ : ℂ) * Complex.exp (θ * I))))
    (habs : Summable fun j => |h j * ρ ^ (2 * j + 1)|) :
    HasSum (fun j => 2 * Real.pi * (h j * ρ ^ (2 * j + 1)) ^ 2)
      (∫ θ in (0 : ℝ)..2 * Real.pi, ‖f ((ρ : ℂ) * Complex.exp (θ * I))‖ ^ 2) := by
  set a : ℕ → ℝ := fun j => h j * ρ ^ (2 * j + 1) with ha
  have hterm : ∀ (θ : ℝ) (j : ℕ), (h j : ℂ) * ((ρ : ℂ) * Complex.exp (θ * I)) ^ (2 * j + 1) =
      (a j : ℂ) * Complex.exp ((2 * j + 1 : ℂ) * (θ * I)) := fun θ j => by
    rw [mul_pow, ← Complex.exp_nat_mul]; simp only [ha]; push_cast; ring_nf
  have habs' : Summable fun j => ‖a j‖ := by simp only [Real.norm_eq_abs, ha]; exact habs
  have hprod : Summable fun i : ℕ × ℕ => |a i.1| * |a i.2| := by
    simpa [Real.norm_eq_abs, abs_mul] using Summable.mul_norm habs' habs'
  have hnt : ∀ (i : ℕ × ℕ) (θ : ℝ), ‖parsevalTerm a i θ‖ = |a i.1| * |a i.2| := fun i θ => by
    simp only [parsevalTerm, ContinuousMap.coe_mk, norm_mul, Complex.norm_real, Real.norm_eq_abs]
    have e : 2 * ((i.1 : ℂ) - i.2) * (θ * I) = ((2 * ((i.1 : ℝ) - i.2) * θ : ℝ) : ℂ) * I := by
      push_cast; ring
    rw [e, Complex.norm_exp_ofReal_mul_I, mul_one]
  have hsumR : Summable fun i : ℕ × ℕ =>
      ‖(parsevalTerm a i).restrict
        (⟨Set.uIcc 0 (2 * Real.pi), isCompact_uIcc⟩ : TopologicalSpace.Compacts ℝ)‖ := by
    refine hprod.of_nonneg_of_le (fun _ => norm_nonneg _) fun i => ?_
    refine (ContinuousMap.norm_le _ (by positivity)).2 fun x => ?_
    rw [ContinuousMap.restrict_apply, hnt]
  have hint := hasSum_intervalIntegral_of_summable_norm (a := 0) (b := 2 * Real.pi) hsumR
  have hpt : ∀ θ : ℝ, ∑' i : ℕ × ℕ, parsevalTerm a i θ =
      ((‖f ((ρ : ℂ) * Complex.exp (θ * I))‖ ^ 2 : ℝ) : ℂ) := fun θ => by
    have h1 : HasSum (fun j => (a j : ℂ) * Complex.exp ((2 * j + 1 : ℂ) * (θ * I)))
        (f ((ρ : ℂ) * Complex.exp (θ * I))) := by simpa only [hterm] using hsum θ
    have h2 := Complex.hasSum_conj'.2 h1
    have hmul := h1.mul h2 (by
      refine Summable.of_norm (hprod.congr fun i => ?_)
      simp only [norm_mul, map_mul, Complex.conj_ofReal, Complex.norm_conj, Complex.norm_real,
        Real.norm_eq_abs]
      have e1 : ∀ m : ℕ, ‖Complex.exp ((2 * m + 1 : ℂ) * (θ * I))‖ = 1 := fun m => by
        have : (2 * m + 1 : ℂ) * (θ * I) = (((2 * m + 1) * θ : ℝ) : ℂ) * I := by push_cast; ring
        rw [this, Complex.norm_exp_ofReal_mul_I]
      rw [e1, e1]; ring)
    have hc : ∀ m : ℕ, (starRingEnd ℂ) (Complex.exp ((2 * m + 1 : ℂ) * (θ * I))) =
        Complex.exp (-((2 * m + 1 : ℂ) * (θ * I))) := fun m => by
      rw [← Complex.exp_conj]; congr 1
      simp only [map_mul, map_add, map_ofNat, map_one, Complex.conj_natCast, Complex.conj_ofReal,
        Complex.conj_I]
      ring
    rw [Complex.ofReal_pow, ← Complex.mul_conj', ← hmul.tsum_eq]
    refine tsum_congr fun i => ?_
    simp only [parsevalTerm, ContinuousMap.coe_mk, map_mul, Complex.conj_ofReal, hc]
    rw [show ∀ (u v x y : ℂ), u * Complex.exp x * (v * Complex.exp y) =
        u * v * Complex.exp (x + y) from fun u v x y => by rw [Complex.exp_add]; ring]
    simp only [ha]; push_cast; ring_nf
  simp_rw [hpt] at hint
  rw [intervalIntegral.integral_ofReal] at hint
  simp_rw [integral_parsevalTerm] at hint
  have hdiag : HasSum (fun j => ((2 * Real.pi * a j ^ 2 : ℝ) : ℂ))
      (((∫ θ in (0 : ℝ)..2 * Real.pi, ‖f ((ρ : ℂ) * Complex.exp (θ * I))‖ ^ 2 : ℝ) : ℂ)) := by
    have hinj : Function.Injective fun j : ℕ => (j, j) := fun _ _ hab => (Prod.mk.inj hab).1
    rw [← hinj.hasSum_iff] at hint
    · convert hint using 1; funext j; simp [Function.comp]
    · intro i hi
      have : i.1 ≠ i.2 := fun he => hi ⟨i.1, by ext <;> simp [he]⟩
      simp [this]
  exact_mod_cast hdiag

theorem sum_sq_le_of_mean_le {f : ℂ → ℂ} {h : ℕ → ℝ} {ρ B : ℝ}
    (hsum : ∀ θ : ℝ, HasSum (fun j => (h j : ℂ) * ((ρ : ℂ) * Complex.exp (θ * I)) ^ (2 * j + 1))
      (f ((ρ : ℂ) * Complex.exp (θ * I))))
    (habs : Summable fun j => |h j * ρ ^ (2 * j + 1)|)
    (hmean : (2 * Real.pi)⁻¹ * ∫ θ in (0 : ℝ)..2 * Real.pi, ‖f ((ρ : ℂ) * Complex.exp (θ * I))‖ ^ 2 ≤ B)
    (J : ℕ) : ∑ j ∈ range J, h j ^ 2 * ρ ^ (2 * (2 * j + 1)) ≤ B := by
  have hP := hasSum_parseval_odd hsum habs
  have hle := sum_le_hasSum (range J) (fun _ _ => by positivity) hP
  have hpi : 0 < 2 * Real.pi := by positivity
  have e : ∑ j ∈ range J, 2 * Real.pi * (h j * ρ ^ (2 * j + 1)) ^ 2 =
      2 * Real.pi * ∑ j ∈ range J, h j ^ 2 * ρ ^ (2 * (2 * j + 1)) := by
    rw [Finset.mul_sum]; exact Finset.sum_congr rfl fun _ _ => by ring
  rw [e] at hle
  have := mul_le_mul_of_nonneg_left hle (inv_nonneg.2 hpi.le)
  rw [← mul_assoc, inv_mul_cancel₀ hpi.ne', one_mul] at this
  linarith

/-! ### 3. Half-angle circle chart -/

private lemma exp_eq_chart {θ : ℝ} (h1 : -Real.pi < θ) (h2 : θ < Real.pi) :
    Complex.exp (θ * Complex.I) =
      (((1 - Real.tan (θ / 2) ^ 2) / (1 + Real.tan (θ / 2) ^ 2) : ℝ) : ℂ) +
        ((2 * Real.tan (θ / 2) / (1 + Real.tan (θ / 2) ^ 2) : ℝ) : ℂ) * Complex.I := by
  have hc : 0 < Real.cos (θ / 2) := Real.cos_pos_of_mem_Ioo ⟨by linarith, by linarith⟩
  have hc0 : Real.cos (θ / 2) ≠ 0 := hc.ne'
  have hsec : 1 + Real.tan (θ / 2) ^ 2 = 1 / Real.cos (θ / 2) ^ 2 := by
    rw [Real.tan_eq_sin_div_cos]; field_simp; rw [Real.cos_sq_add_sin_sq]
  have hcos : Real.cos θ = (1 - Real.tan (θ / 2) ^ 2) / (1 + Real.tan (θ / 2) ^ 2) := by
    rw [hsec, Real.tan_eq_sin_div_cos, show θ = 2 * (θ / 2) by ring, Real.cos_two_mul]
    field_simp; nlinarith [Real.sin_sq_add_cos_sq (θ / 2)]
  have hsin : Real.sin θ = 2 * Real.tan (θ / 2) / (1 + Real.tan (θ / 2) ^ 2) := by
    rw [hsec, Real.tan_eq_sin_div_cos, show θ = 2 * (θ / 2) by ring, Real.sin_two_mul]; field_simp
  rw [← hcos, ← hsin, Complex.ofReal_cos, Complex.ofReal_sin, Complex.exp_mul_I]

private lemma tan_half_mem {a b θ : ℝ} (h1 : 2 * Real.arctan a ≤ θ) (h2 : θ ≤ 2 * Real.arctan b) :
    a ≤ Real.tan (θ / 2) ∧ Real.tan (θ / 2) ≤ b := by
  have ha := Real.arctan_lt_pi_div_two a; have ha' := Real.neg_pi_div_two_lt_arctan a
  have hb := Real.arctan_lt_pi_div_two b; have hb' := Real.neg_pi_div_two_lt_arctan b
  constructor
  · calc a = Real.tan (Real.arctan a) := (Real.tan_arctan a).symm
      _ ≤ Real.tan (θ / 2) :=
        Real.strictMonoOn_tan.monotoneOn ⟨by linarith, by linarith⟩ ⟨by linarith, by linarith⟩ (by linarith)
  · calc Real.tan (θ / 2) ≤ Real.tan (Real.arctan b) :=
        Real.strictMonoOn_tan.monotoneOn ⟨by linarith, by linarith⟩ ⟨by linarith, by linarith⟩ (by linarith)
      _ = b := Real.tan_arctan b

private lemma arctan_sub_le {a b : ℝ} (hab : a ≤ b) (hs : 0 ≤ a ∨ b ≤ 0) :
    Real.arctan b - Real.arctan a ≤ (b - a) / (1 + min (a ^ 2) (b ^ 2)) := by
  have hbound : ∀ x ∈ Set.Icc a b, ‖deriv Real.arctan x‖ ≤ 1 / (1 + min (a ^ 2) (b ^ 2)) := by
    intro x hx
    rw [Real.deriv_arctan, Real.norm_eq_abs, abs_of_pos (by positivity)]
    apply one_div_le_one_div_of_le (by positivity)
    have : min (a ^ 2) (b ^ 2) ≤ x ^ 2 := by
      rcases hs with hs | hs
      · exact (min_le_left _ _).trans (pow_le_pow_left₀ hs hx.1 2)
      · exact (min_le_right _ _).trans (by nlinarith [hx.2, hx.1])
    linarith
  have hd : ∀ x ∈ Set.Icc a b, HasDerivWithinAt arctan (deriv arctan x) (Set.Icc a b) x :=
    fun x _ => (Real.hasDerivAt_arctan x).hasDerivWithinAt.congr_deriv (by rw [Real.deriv_arctan])
  have := (convex_Icc a b).norm_image_sub_le_of_norm_hasDerivWithin_le hd hbound
    (Set.left_mem_Icc.2 hab) (Set.right_mem_Icc.2 hab)
  rw [Real.norm_eq_abs, Real.norm_eq_abs, abs_of_nonneg (by linarith : (0 : ℝ) ≤ b - a)] at this
  calc arctan b - arctan a ≤ |arctan b - arctan a| := le_abs_self _
    _ ≤ 1 / (1 + min (a ^ 2) (b ^ 2)) * (b - a) := this
    _ = (b - a) / (1 + min (a ^ 2) (b ^ 2)) := by ring

/-! ### 4. Interval & matrix soundness (`Grothe.Upper.Kernel.Hardy`) -/

lemma mem_sub {x y : ℝ} {a b : Ival} (hx : mem x a) (hy : mem y b) : mem (x - y) (subI a b) := by
  simpa [subI, sub_eq_add_neg] using mem_add hx (mem_neg hy)

lemma mem_intI (n : ℤ) : mem (n : ℝ) (intI n) := by constructor <;> simp [intI]

lemma pos_of_posI {x : ℝ} {a : Ival} (hx : mem x a) (hp : posI a = true) : 0 < x := by
  have hlo : (0 : ℤ) < a.lo := by simpa [posI] using hp
  have h1 : (0 : ℝ) < a.lo := by exact_mod_cast hlo
  nlinarith [hx.1, D_pos]

lemma mem_invPosI {x : ℝ} {a : Ival} (hx : mem x a) (hp : posI a = true) : mem x⁻¹ (invPosI a) := by
  have hxpos := pos_of_posI hx hp
  have hlo : (0 : ℤ) < a.lo := by simpa [posI] using hp
  have hhi : (0 : ℤ) < a.hi := by
    have : (a.lo : ℝ) ≤ a.hi := hx.1.trans hx.2
    exact_mod_cast (lt_of_lt_of_le (by exact_mod_cast hlo : (0 : ℝ) < a.lo) this)
  have hD := D_pos
  have hloR : (0 : ℝ) < a.lo := by exact_mod_cast hlo
  have hhiR : (0 : ℝ) < a.hi := by exact_mod_cast hhi
  obtain ⟨h1, h2⟩ := hx
  have key : x⁻¹ * D = (D : ℝ) * D / (x * D) := by field_simp
  constructor
  · have hfl : (((D * D) / a.hi : ℤ) : ℝ) ≤ (D : ℝ) * D / a.hi := by
      rw [le_div_iff₀ hhiR]; exact_mod_cast Int.ediv_mul_le (D * D) hhi.ne'
    exact hfl.trans (by rw [key]; exact div_le_div_of_nonneg_left (by positivity) (by positivity) h2)
  · rw [key]
    refine (div_le_div_of_nonneg_left (by positivity) hloR h1).trans ?_
    show (D : ℝ) * D / a.lo ≤ ((-((-(D * D)) / a.lo) : ℤ) : ℝ)
    rw [div_le_iff₀ hloR]
    set q : ℤ := (-(D * D)) / a.lo
    have h4 : (q : ℝ) * a.lo ≤ -((D : ℝ) * D) := by
      exact_mod_cast Int.ediv_mul_le (-(D * D)) hlo.ne'
    have : (((-q : ℤ) : ℝ)) = -(q : ℝ) := by push_cast; ring
    rw [this]; nlinarith

def memC (z : ℂ) (I : CI) : Prop := mem z.re I.re ∧ mem z.im I.im

lemma memC_ofR {x : ℝ} {a : Ival} (hx : mem x a) : memC (x : ℂ) (CI.ofR a) :=
  ⟨by simpa [CI.ofR] using hx, by simpa [CI.ofR] using mem_zero⟩

lemma memC_one : memC 1 CI.one := by simpa [CI.one] using memC_ofR (mem_intI 1)

lemma memC_add {z w : ℂ} {I J : CI} (hz : memC z I) (hw : memC w J) : memC (z + w) (CI.add I J) :=
  ⟨by simpa [CI.add] using mem_add hz.1 hw.1, by simpa [CI.add] using mem_add hz.2 hw.2⟩

lemma memC_neg {z : ℂ} {I : CI} (hz : memC z I) : memC (-z) (CI.neg I) :=
  ⟨by simpa [CI.neg] using mem_neg hz.1, by simpa [CI.neg] using mem_neg hz.2⟩

lemma memC_sub {z w : ℂ} {I J : CI} (hz : memC z I) (hw : memC w J) : memC (z - w) (CI.sub I J) :=
  ⟨by simpa [CI.sub] using mem_sub hz.1 hw.1, by simpa [CI.sub] using mem_sub hz.2 hw.2⟩

lemma memC_mul {z w : ℂ} {I J : CI} (hz : memC z I) (hw : memC w J) : memC (z * w) (CI.mul I J) :=
  ⟨by simpa [CI.mul] using mem_sub (mem_mul hz.1 hw.1) (mem_mul hz.2 hw.2),
   by simpa [CI.mul] using mem_add (mem_mul hz.1 hw.2) (mem_mul hz.2 hw.1)⟩

lemma mem_normSq {z : ℂ} {I : CI} (hz : memC z I) : mem (Complex.normSq z) (CI.normSq I) := by
  simpa [CI.normSq, Complex.normSq_apply] using mem_add (mem_mul hz.1 hz.1) (mem_mul hz.2 hz.2)

lemma memC_inv {z : ℂ} {I : CI} (hz : memC z I) (hp : posI (CI.normSq I) = true) :
    memC z⁻¹ (CI.inv I) := by
  have hn := mem_invPosI (mem_normSq hz) hp
  exact ⟨by simpa [CI.inv, Complex.inv_re, div_eq_mul_inv] using mem_mul hz.1 hn,
    by simpa [CI.inv, Complex.inv_im, div_eq_mul_inv, neg_mul] using mem_neg (mem_mul hz.2 hn)⟩

def hornerR (x : ℂ) : List ℝ → ℂ
  | [] => 0
  | c :: cs => (c : ℂ) + x * hornerR x cs

lemma memC_horner {x : ℂ} {X : CI} (hx : memC x X) :
    ∀ {cs : List ℝ} {L : List Ival}, List.Forall₂ mem cs L → memC (hornerR x cs) (CI.horner X L)
  | [], [], _ => by simpa [hornerR, CI.horner] using memC_ofR mem_zero
  | _ :: _, _ :: _, List.Forall₂.cons hc hcs =>
      memC_add (memC_ofR hc) (memC_mul hx (memC_horner hx hcs))

lemma aeval_ofListQ (x : ℂ) : ∀ l : List ℚ,
    Polynomial.aeval x (ofListQ l) = hornerR x (l.map fun q : ℚ => (q : ℝ))
  | [] => by simp [ofListQ, hornerR]
  | a :: l => by simp [ofListQ, hornerR, aeval_ofListQ x l]

lemma forall2_ofRatI : ∀ l : List ℚ, List.Forall₂ mem (l.map fun q : ℚ => (q : ℝ)) (l.map ofRatI)
  | [] => List.Forall₂.nil
  | a :: l => List.Forall₂.cons (mem_ofRatI a) (forall2_ofRatI l)

private def dpm (R : Sym2C) (σ : ℂ) : ℂ := (1 - σ * R.a) * (1 - σ * R.c) - (σ * R.b) ^ 2

private def invImC (R : Sym2C) (σ : ℂ) : Sym2C :=
  ⟨(1 - σ * R.c) / dpm R σ, σ * R.b / dpm R σ, (1 - σ * R.a) / dpm R σ⟩

private lemma detIm_eq (R : Sym2C) : R.detIm = dpm R 1 * dpm R (-1) := by
  simp only [Sym2C.detIm, Sym2C.sq, dpm]; ring

private lemma Amat_eq (R : Sym2C) (hp : dpm R 1 ≠ 0) (hm : dpm R (-1) ≠ 0) :
    R.Amat = ⟨((invImC R 1).a + (invImC R (-1)).a) / 2,
      ((invImC R 1).b + (invImC R (-1)).b) / 2,
      ((invImC R 1).c + (invImC R (-1)).c) / 2⟩ := by
  have e : (1 - (R.a * R.a + R.b * R.b)) * (1 - (R.b * R.b + R.c * R.c)) -
      (R.a * R.b + R.b * R.c) * (R.b * R.a + R.c * R.b) = dpm R 1 * dpm R (-1) := by
    simp only [dpm]; ring
  simp only [Sym2C.Amat, Sym2C.detIm, Sym2C.sq, invImC]
  rw [e]
  congr 1 <;> field_simp <;> simp only [dpm] <;> ring

private lemma Cmat_eq (R : Sym2C) (hp : dpm R 1 ≠ 0) (hm : dpm R (-1) ≠ 0) :
    R.Cmat = ⟨((invImC R 1).a - (invImC R (-1)).a) / 2,
      ((invImC R 1).b - (invImC R (-1)).b) / 2,
      ((invImC R 1).c - (invImC R (-1)).c) / 2⟩ := by
  simp only [Sym2C.Cmat]; rw [Amat_eq R hp hm]; simp only [invImC]
  congr 1 <;> field_simp <;> simp only [dpm] <;> ring

private structure M2 where
  a : ℝ
  b : ℝ
  c : ℝ
  d : ℝ

private def M2.ofS (S : Sym2R) : M2 := ⟨S.a, S.b, S.b, S.c⟩
private def M2.mul (M N : M2) : M2 :=
  ⟨M.a * N.a + M.b * N.c, M.a * N.b + M.b * N.d, M.c * N.a + M.d * N.c, M.c * N.b + M.d * N.d⟩

private lemma sand_smul (S N : Sym2R) (r : ℝ) : sand S (smul r N) = smul r (sand S N) := by
  simp only [sand, smul]; congr 1 <;> ring

private lemma prod_eq_T (Zm Cr : Sym2R) (hd : Zm.det ≠ 0) :
    let P := M2.mul (M2.mul (M2.ofS (add Zm (smul (-1) Cr))) (M2.ofS (smul Zm.det⁻¹ Zm.adj)))
      (M2.ofS (add Zm Cr))
    let Tr := add Zm (smul (-1) (smul Zm.det⁻¹ (sand Cr Zm.adj)))
    P.a = Tr.a ∧ P.b = Tr.b ∧ P.d = Tr.c := by
  intro P Tr
  simp only [P, Tr, M2.mul, M2.ofS, add, smul, sand, adj, det] at hd ⊢
  refine ⟨?_, ?_, ?_⟩ <;> field_simp <;> ring

def memSR (S : Sym2R) (I : SR) : Prop := mem S.a I.a ∧ mem S.b I.b ∧ mem S.c I.c
def memSC (S : Sym2C) (I : SC) : Prop := memC S.a I.a ∧ memC S.b I.b ∧ memC S.c I.c
private def memM2 (M : M2) (I : GR) : Prop :=
  mem M.a I.a ∧ mem M.b I.b ∧ mem M.c I.c ∧ mem M.d I.d

private lemma memSR_add {S Tr : Sym2R} {I J : SR} (hS : memSR S I) (hT : memSR Tr J) :
    memSR (add S Tr) (SR.add I J) :=
  ⟨by simpa [add, SR.add] using mem_add hS.1 hT.1,
   by simpa [add, SR.add] using mem_add hS.2.1 hT.2.1,
   by simpa [add, SR.add] using mem_add hS.2.2 hT.2.2⟩

private lemma memSR_smul {r : ℝ} {S : Sym2R} {i : Ival} {I : SR} (hr : mem r i) (hS : memSR S I) :
    memSR (smul r S) (SR.smul i I) :=
  ⟨by simpa [smul, SR.smul] using mem_mul hr hS.1,
   by simpa [smul, SR.smul] using mem_mul hr hS.2.1,
   by simpa [smul, SR.smul] using mem_mul hr hS.2.2⟩

private lemma mem_det {S : Sym2R} {I : SR} (hS : memSR S I) : mem S.det I.det := by
  simpa [det, SR.det, sq] using mem_sub (mem_mul hS.1 hS.2.2) (mem_mul hS.2.1 hS.2.1)

private lemma memSR_adj {S : Sym2R} {I : SR} (hS : memSR S I) : memSR S.adj I.adj :=
  ⟨by simpa [adj, SR.adj] using hS.2.2, by simpa [adj, SR.adj] using mem_neg hS.2.1,
   by simpa [adj, SR.adj] using hS.1⟩

private lemma memSR_sand {S N : Sym2R} {I J : SR} (hS : memSR S I) (hN : memSR N J) :
    memSR (sand S N) (SR.sand I J) := by
  obtain ⟨ha, hb, hc⟩ := hS; obtain ⟨na, nb, nc⟩ := hN
  have two := mem_intI 2
  refine ⟨?_, ?_, ?_⟩
  · convert mem_add (mem_add (mem_mul na (mem_mul ha ha))
      (mem_mul two (mem_mul nb (mem_mul ha hb)))) (mem_mul nc (mem_mul hb hb)) using 1
      <;> first | rfl | (simp only [sand]; push_cast; ring)
  · convert mem_add (mem_add (mem_mul na (mem_mul ha hb))
      (mem_mul nb (mem_add (mem_mul ha hc) (mem_mul hb hb)))) (mem_mul nc (mem_mul hb hc)) using 1
      <;> first | rfl | (simp only [sand]; ring)
  · convert mem_add (mem_add (mem_mul na (mem_mul hb hb))
      (mem_mul two (mem_mul nb (mem_mul hb hc)))) (mem_mul nc (mem_mul hc hc)) using 1
      <;> first | rfl | (simp only [sand]; push_cast; ring)

private lemma memM2_ofS {S : Sym2R} {I : SR} (hS : memSR S I) : memM2 (M2.ofS S) (GR.ofSR I) :=
  ⟨hS.1, hS.2.1, hS.2.1, hS.2.2⟩

private lemma memM2_mul {M N : M2} {I J : GR} (hM : memM2 M I) (hN : memM2 N J) :
    memM2 (M2.mul M N) (GR.mul I J) :=
  ⟨by simpa [M2.mul, GR.mul] using mem_add (mem_mul hM.1 hN.1) (mem_mul hM.2.1 hN.2.2.1),
   by simpa [M2.mul, GR.mul] using mem_add (mem_mul hM.1 hN.2.1) (mem_mul hM.2.1 hN.2.2.2),
   by simpa [M2.mul, GR.mul] using mem_add (mem_mul hM.2.2.1 hN.1) (mem_mul hM.2.2.2 hN.2.2.1),
   by simpa [M2.mul, GR.mul] using mem_add (mem_mul hM.2.2.1 hN.2.1) (mem_mul hM.2.2.2 hN.2.2.2)⟩

private lemma PD_of_gate {S : Sym2R} {I : SR} (hS : memSR S I) (hg : I.PD = true) : S.PD := by
  simp only [SR.PD, Bool.and_eq_true] at hg
  exact ⟨pos_of_posI hS.1 hg.1, pos_of_posI (mem_det hS) hg.2⟩

private def gpmR (R : Sym2C) (j : ℝ) (σ : ℂ) : Sym2R :=
  add (SchurKernel.re (invImC R σ)) (smul (-1) ⟨j, 0, j⟩)
private def zR (R : Sym2C) (j : ℝ) : Sym2R := smul (1 / 2) (add (gpmR R j 1) (gpmR R j (-1)))
private def crR (R : Sym2C) (j : ℝ) : Sym2R :=
  smul (1 / 2) (add (gpmR R j 1) (smul (-1) (gpmR R j (-1))))
private def ciR (R : Sym2C) : Sym2R :=
  smul (1 / 2) (add (SchurKernel.im (invImC R 1)) (smul (-1) (SchurKernel.im (invImC R (-1)))))

private lemma Z_Bj_eq {R : Sym2C} {j : ℝ} (hp : dpm R 1 ≠ 0) (hm : dpm R (-1) ≠ 0) :
    Z (Bj R j) = zR R j := by
  simp only [Z, SchurKernel.re, Bj, zR, gpmR, add, smul]
  rw [Amat_eq R hp hm]
  simp only [Complex.sub_re, Complex.div_re, Complex.add_re, Complex.ofReal_re]
  congr 1 <;> norm_num <;> ring

private lemma re_Cmat_eq {R : Sym2C} {j : ℝ} (hp : dpm R 1 ≠ 0) (hm : dpm R (-1) ≠ 0) :
    SchurKernel.re R.Cmat = crR R j := by
  simp only [SchurKernel.re, crR, gpmR, add, smul]
  rw [Cmat_eq R hp hm]; simp only [Complex.sub_re, Complex.div_re]
  congr 1 <;> norm_num <;> ring

private lemma im_Cmat_eq {R : Sym2C} (hp : dpm R 1 ≠ 0) (hm : dpm R (-1) ≠ 0) :
    SchurKernel.im R.Cmat = ciR R := by
  simp only [SchurKernel.im, ciR, add, smul]
  rw [Cmat_eq R hp hm]; simp only [Complex.sub_im, Complex.div_im]
  congr 1 <;> norm_num <;> ring

private lemma gpm_plus (R : Sym2C) (j : ℝ) : gpmR R j 1 = add (zR R j) (crR R j) := by
  simp only [zR, crR, gpmR, add, smul]; congr 1 <;> ring

private lemma gpm_minus (R : Sym2C) (j : ℝ) : gpmR R j (-1) = add (zR R j) (smul (-1) (crR R j)) := by
  simp only [zR, crR, gpmR, add, smul]; congr 1 <;> ring

private lemma normSq_detIm (R : Sym2C) :
    ‖R.detIm‖ ^ 2 = Complex.normSq (dpm R 1) * Complex.normSq (dpm R (-1)) := by
  rw [detIm_eq, ← Complex.normSq_mul, Complex.normSq_eq_norm_sq]

def sigB (neg : Bool) : ℂ := if neg then -1 else 1

private lemma sigB_false : sigB false = 1 := by simp [sigB]
private lemma sigB_true : sigB true = -1 := by simp [sigB]

private lemma memC_dpm {R : Sym2C} {RI : SC} (hR : memSC R RI) (neg : Bool) :
    memC (dpm R (sigB neg)) (Grothe.Upper.Kernel.Hardy.invIm RI neg).2 := by
  obtain ⟨ha, hb, hc⟩ := hR
  cases neg
  · convert memC_sub (memC_mul (memC_sub memC_one ha) (memC_sub memC_one hc))
      (memC_mul (memC_neg hb) (memC_neg hb)) using 1
      <;> first | rfl | (simp only [dpm, sigB, Bool.false_eq_true, ↓reduceIte]; ring)
  · convert memC_sub (memC_mul (memC_sub memC_one (memC_neg ha))
      (memC_sub memC_one (memC_neg hc)))
      (memC_mul (memC_neg (memC_neg hb)) (memC_neg (memC_neg hb))) using 1
      <;> first | rfl | (simp only [dpm, sigB, ↓reduceIte]; ring)

private lemma memSC_invIm {R : Sym2C} {RI : SC} (hR : memSC R RI) (neg : Bool)
    (hpos : posI (CI.normSq (Grothe.Upper.Kernel.Hardy.invIm RI neg).2) = true) :
    memSC (invImC R (sigB neg)) (Grothe.Upper.Kernel.Hardy.invIm RI neg).1 := by
  have hi := memC_inv (memC_dpm hR neg) hpos
  obtain ⟨ha, hb, hc⟩ := hR
  cases neg
  · refine ⟨?_, ?_, ?_⟩
    · convert memC_mul (memC_sub memC_one hc) hi using 1
        <;> first | rfl | (simp only [invImC, sigB, div_eq_mul_inv, Bool.false_eq_true, ↓reduceIte]; ring)
    · convert memC_neg (memC_mul (memC_neg hb) hi) using 1
        <;> first | rfl | (simp only [invImC, sigB, div_eq_mul_inv, Bool.false_eq_true, ↓reduceIte]; ring)
    · convert memC_mul (memC_sub memC_one ha) hi using 1
        <;> first | rfl | (simp only [invImC, sigB, div_eq_mul_inv, Bool.false_eq_true, ↓reduceIte]; ring)
  · refine ⟨?_, ?_, ?_⟩
    · convert memC_mul (memC_sub memC_one (memC_neg hc)) hi using 1
        <;> first | rfl | (simp only [invImC, sigB, div_eq_mul_inv, ↓reduceIte]; ring)
    · convert memC_neg (memC_mul (memC_neg (memC_neg hb)) hi) using 1
        <;> first | rfl | (simp only [invImC, sigB, div_eq_mul_inv, ↓reduceIte]; ring)
    · convert memC_mul (memC_sub memC_one (memC_neg ha)) hi using 1
        <;> first | rfl | (simp only [invImC, sigB, div_eq_mul_inv, ↓reduceIte]; ring)

private lemma mem_half : mem (1 / 2 : ℝ) half := by
  simpa [half, one_div] using mem_invPosI (mem_intI 2) (by decide)

private lemma mem_neg_one : mem (-1 : ℝ) (negI (intI 1)) := by simpa using mem_neg (mem_intI 1)

private lemma memSR_re {S : Sym2C} {I : SC} (h : memSC S I) : memSR (SchurKernel.re S) (SC.re I) :=
  ⟨h.1.1, h.2.1.1, h.2.2.1⟩

private lemma memSR_im {S : Sym2C} {I : SC} (h : memSC S I) : memSR (SchurKernel.im S) (SC.im I) :=
  ⟨h.1.2, h.2.1.2, h.2.2.2⟩

private lemma memSR_gpm {R : Sym2C} {RI : SC} {j : ℝ} {jI : Ival}
    (hR : memSC R RI) (hj : mem j jI) (neg : Bool)
    (hpos : posI (CI.normSq (Grothe.Upper.Kernel.Hardy.invIm RI neg).2) = true) :
    memSR (gpmR R j (sigB neg)) (gpm jI RI neg) :=
  memSR_add (memSR_re (memSC_invIm hR neg hpos)) (memSR_smul mem_neg_one ⟨hj, mem_zero, hj⟩)

def chartPt (rho : ℝ) (neg : Bool) (s : ℝ) : ℂ :=
  sigB neg * (((rho * (1 - s ^ 2) / (1 + s ^ 2) : ℝ) : ℂ) +
    ((rho * (2 * s) / (1 + s ^ 2) : ℝ) : ℂ) * Complex.I)

private lemma memC_circleBox {rho s : ℝ} {rI : Ival} {lo hi : ℤ}
    (hr : mem rho rI) (hs : mem s ⟨lo, hi⟩)
    (hpos : posI (addI (intI 1) (mulI ⟨lo, hi⟩ ⟨lo, hi⟩)) = true) (neg : Bool) :
    memC (chartPt rho neg s) (circleBox rI neg ⟨lo, hi⟩) := by
  have hden := mem_invPosI (mem_add (mem_intI 1) (mem_mul hs hs)) hpos
  have hre := mem_mul (mem_mul hr (mem_sub (mem_intI 1) (mem_mul hs hs))) hden
  have him := mem_mul (mem_mul hr (mem_mul (mem_intI 2) hs)) hden
  have hz : memC (((rho * (1 - s ^ 2) / (1 + s ^ 2) : ℝ) : ℂ) +
      ((rho * (2 * s) / (1 + s ^ 2) : ℝ) : ℂ) * Complex.I)
      ⟨mulI (mulI rI (subI (intI 1) (mulI ⟨lo, hi⟩ ⟨lo, hi⟩)))
        (invPosI (addI (intI 1) (mulI ⟨lo, hi⟩ ⟨lo, hi⟩))),
       mulI (mulI rI (mulI (intI 2) ⟨lo, hi⟩))
        (invPosI (addI (intI 1) (mulI ⟨lo, hi⟩ ⟨lo, hi⟩)))⟩ := by
    refine ⟨?_, ?_⟩
    · have e : ((((rho * (1 - s ^ 2) / (1 + s ^ 2) : ℝ) : ℂ) +
          ((rho * (2 * s) / (1 + s ^ 2) : ℝ) : ℂ) * Complex.I)).re =
          rho * (1 - s ^ 2) / (1 + s ^ 2) := by
        simp only [Complex.add_re, Complex.ofReal_re, Complex.mul_re, Complex.I_re, Complex.I_im,
          Complex.ofReal_im]
        ring
      rw [e]; convert hre using 1; push_cast; ring
    · have e : ((((rho * (1 - s ^ 2) / (1 + s ^ 2) : ℝ) : ℂ) +
          ((rho * (2 * s) / (1 + s ^ 2) : ℝ) : ℂ) * Complex.I)).im =
          rho * (2 * s) / (1 + s ^ 2) := by
        simp only [Complex.add_im, Complex.ofReal_re, Complex.mul_im, Complex.I_re, Complex.I_im,
          Complex.ofReal_im]
        ring
      rw [e]; convert him using 1; push_cast; ring
  cases neg
  · simpa [chartPt, sigB, circleBox] using hz
  · simpa [chartPt, sigB, circleBox] using memC_neg hz

def KerPos (R : Sym2C) (l : ℝ) : Prop :=
  ∀ x y : ℝ × ℝ, l * (x.1 ^ 2 + x.2 ^ 2 + y.1 ^ 2 + y.2 ^ 2) ≤
    (R.Amat.form x x + R.Amat.form y y - 2 * R.Cmat.form x y).re

private lemma q_ge_of_PD {S : Sym2R} (h : S.PD) (v : ℝ × ℝ) :
    S.det / (S.a + S.c) * (v.1 ^ 2 + v.2 ^ 2) ≤ S.q v := by
  obtain ⟨ha, hd⟩ := h
  have hc : 0 < S.c := by simp only [det] at hd; nlinarith [sq_nonneg S.b]
  have hid : (S.a + S.c) * S.q v - S.det * (v.1 ^ 2 + v.2 ^ 2) =
      (S.a * v.1 + S.b * v.2) ^ 2 + (S.b * v.1 + S.c * v.2) ^ 2 := by
    simp only [q, bil, det]; ring
  rw [div_mul_eq_mul_div, div_le_iff₀ (by linarith)]
  nlinarith [sq_nonneg (S.a * v.1 + S.b * v.2), sq_nonneg (S.b * v.1 + S.c * v.2)]

private lemma re_form (S : Sym2C) (v : ℝ × ℝ) : (S.form v v).re = (SchurKernel.re S).q v := by
  simp only [Sym2C.form, SchurKernel.re, q, bil, Complex.add_re, Complex.mul_re, Complex.ofReal_re,
    Complex.ofReal_im, Complex.mul_im, Complex.add_im, mul_zero, zero_mul, add_zero, sub_zero]

private lemma kerPos_of_gates {R : Sym2C} (hp : dpm R 1 ≠ 0) (hm : dpm R (-1) ≠ 0)
    (hP : (SchurKernel.re (invImC R 1)).PD) (hM : (SchurKernel.re (invImC R (-1))).PD) :
    ∃ l > 0, KerPos R l := by
  set Sp := SchurKernel.re (invImC R 1)
  set Sm := SchurKernel.re (invImC R (-1))
  have hμp : 0 < Sp.det / (Sp.a + Sp.c) := by
    have hc : 0 < Sp.c := by have := hP.2; simp only [det] at this; nlinarith [sq_nonneg Sp.b, hP.1]
    exact div_pos hP.2 (by linarith [hP.1])
  have hμm : 0 < Sm.det / (Sm.a + Sm.c) := by
    have hc : 0 < Sm.c := by have := hM.2; simp only [det] at this; nlinarith [sq_nonneg Sm.b, hM.1]
    exact div_pos hM.2 (by linarith [hM.1])
  refine ⟨min (Sp.det / (Sp.a + Sp.c)) (Sm.det / (Sm.a + Sm.c)), lt_min hμp hμm, fun x y => ?_⟩
  have hid : R.Amat.form x x + R.Amat.form y y - 2 * R.Cmat.form x y =
      ((invImC R 1).form (x.1 - y.1, x.2 - y.2) (x.1 - y.1, x.2 - y.2) +
        (invImC R (-1)).form (x.1 + y.1, x.2 + y.2) (x.1 + y.1, x.2 + y.2)) / 2 := by
    rw [Amat_eq R hp hm, Cmat_eq R hp hm]; simp only [Sym2C.form]; push_cast; ring
  rw [hid, Complex.div_ofNat_re, Complex.add_re, re_form, re_form]
  have h1 := q_ge_of_PD hP (x.1 - y.1, x.2 - y.2)
  have h2 := q_ge_of_PD hM (x.1 + y.1, x.2 + y.2)
  have m1 := min_le_left (Sp.det / (Sp.a + Sp.c)) (Sm.det / (Sm.a + Sm.c))
  have m2 := min_le_right (Sp.det / (Sp.a + Sp.c)) (Sm.det / (Sm.a + Sm.c))
  simp only at h1 h2
  nlinarith [sq_nonneg (x.1 - y.1), sq_nonneg (x.2 - y.2), sq_nonneg (x.1 + y.1), sq_nonneg (x.2 + y.2)]

private lemma outside_sound {r2 : ℤ} {x y : Ival} (h : outsideDisc r2 x y = true)
    {t : ℂ} (hx : mem t.re x) (hy : mem t.im y) :
    (r2 : ℝ) / D ≤ Complex.normSq t := by
  have hlo := (mem_add (mem_mul hx hx) (mem_mul hy hy)).1
  have h2 : r2 ≤ (addI (mulI x x) (mulI y y)).lo := by simpa [outsideDisc] using h
  have h3 : (r2 : ℝ) ≤ (addI (mulI x x) (mulI y y)).lo := by exact_mod_cast h2
  rw [div_le_iff₀ D_pos, Complex.normSq_apply]; linarith

def gaussDenominator (R : Sym2C) (j : ℝ) : ℝ :=
  16 * j ^ 2 * ‖R.detIm‖ ^ 2 * (Z (Bj R j)).det *
    (shifted (T (Bj R j) R.Cmat) j).det *
    (shifted (add (T (Bj R j) R.Cmat) (smul 2 (E (Bj R j) R.Cmat))) j).det

private lemma box_sound {R : Sym2C} {RI : SC} {j cap : ℝ} {jI capI : Ival}
    (hR : memSC R RI) (hj : mem j jI) (hv : mem cap capI)
    (hc : boxOK jI RI capI = true) :
    (Z (Bj R j)).PD ∧ (T (Bj R j) R.Cmat).PD ∧ 1 / gaussDenominator R j ≤ cap := by
  rw [boxOK_eq_spec] at hc
  simp only [Bool.and_eq_true, decide_eq_true_eq] at hc
  obtain ⟨⟨⟨⟨⟨hp1, hp2⟩, hZg⟩, hTg⟩, hdenpos⟩, hcap⟩ := hc
  have hdp := memC_dpm hR false; have hdm := memC_dpm hR true
  rw [sigB_false] at hdp; rw [sigB_true] at hdm
  have hdp0 : dpm R 1 ≠ 0 := fun h0 => by
    have := pos_of_posI (mem_normSq hdp) hp1; simp [h0] at this
  have hdm0 : dpm R (-1) ≠ 0 := fun h0 => by
    have := pos_of_posI (mem_normSq hdm) hp2; simp [h0] at this
  have hGp := memSR_gpm hR hj false hp1; have hGm := memSR_gpm hR hj true hp2
  rw [sigB_false] at hGp; rw [sigB_true] at hGm
  have hZ : memSR (zR R j) (zOf jI RI) := memSR_smul mem_half (memSR_add hGp hGm)
  have hCr : memSR (crR R j) (crOf jI RI) :=
    memSR_smul mem_half (memSR_add hGp (memSR_smul mem_neg_one hGm))
  have hIp := memSC_invIm hR false hp1; have hIm := memSC_invIm hR true hp2
  rw [sigB_false] at hIp; rw [sigB_true] at hIm
  have hCi : memSR (ciR R) (ciOf RI) :=
    memSR_smul mem_half (memSR_add (memSR_im hIp) (memSR_smul mem_neg_one (memSR_im hIm)))
  have hZPD : (zR R j).PD := PD_of_gate hZ hZg
  have hZd : posI (zOf jI RI).det = true := by
    simp only [SR.PD, Bool.and_eq_true] at hZg; exact hZg.2
  have hZi : memSR (smul (zR R j).det⁻¹ (zR R j).adj) (ziOf jI RI) :=
    memSR_smul (mem_invPosI (mem_det hZ) hZd) (memSR_adj hZ)
  have hP := memM2_mul (memM2_mul (memM2_ofS hGm) (memM2_ofS hZi)) (memM2_ofS hGp)
  rw [gpm_minus, gpm_plus] at hP
  obtain ⟨eA, eB, eD⟩ := prod_eq_T (zR R j) (crR R j) hZPD.2.ne'
  set Tr := add (zR R j) (smul (-1) (smul (zR R j).det⁻¹ (sand (crR R j) (zR R j).adj)))
  have hT : memSR Tr (tOf jI RI) := ⟨by rw [← eA]; exact hP.1,
    by rw [← eB]; exact hP.2.1, by rw [← eD]; exact hP.2.2.2⟩
  have hTeq : T (Bj R j) R.Cmat = Tr := by
    simp only [T, Kr]; rw [Z_Bj_eq hdp0 hdm0, re_Cmat_eq (j := j) hdp0 hdm0]
  set Er := smul (1 / 2)
    (add (sand (crR R j) (smul (zR R j).det⁻¹ (zR R j).adj))
      (sand (ciR R) (smul (zR R j).det⁻¹ (zR R j).adj))) with hEr
  have hE : memSR Er (eOf jI RI) :=
    memSR_smul mem_half (memSR_add (memSR_sand hCr hZi) (memSR_sand hCi hZi))
  have hEeq : E (Bj R j) R.Cmat = Er := by
    simp only [E, Kr, Ki, hEr, sand_smul]
    rw [Z_Bj_eq hdp0 hdm0, re_Cmat_eq (j := j) hdp0 hdm0, im_Cmat_eq hdp0 hdm0]
  have hJ : memSR (⟨j, 0, j⟩ : Sym2R) (⟨jI, zeroI, jI⟩ : SR) := ⟨hj, mem_zero, hj⟩
  have hTJ := memSR_add hT hJ
  have hTEJ := memSR_add (memSR_add hT (memSR_smul (mem_intI 2) hE)) hJ
  have hsh : ∀ A : Sym2R, shifted A j = add A ⟨j, 0, j⟩ := fun A => by simp [shifted, add]
  have hden : mem (gaussDenominator R j) (gaussDenOf jI RI) := by
    have hm := mem_mul
      (mem_mul (mem_mul (mem_mul (mem_intI 16) (mem_mul hj hj))
        (mem_mul (mem_normSq hdp) (mem_normSq hdm))) (mem_det hZ))
      (mem_mul (mem_det hTJ) (mem_det hTEJ))
    rw [gaussDenominator, normSq_detIm]
    simpa only [gaussDenOf, ndOf, hsh, hTeq, hEeq, Z_Bj_eq hdp0 hdm0, sq, Int.cast_ofNat,
      mul_assoc] using hm
  -- an opaque name for the denominator keeps `0 < _` cheap to normalise
  generalize gaussDenominator R j = g at hden ⊢
  have hdenPos : 0 < g := pos_of_posI hden hdenpos
  have hcapR : (D : ℝ) ≤ ((mulI capI (gaussDenOf jI RI)).lo : ℝ) := by exact_mod_cast hcap
  have hmul := (mem_mul hv hden).1
  refine ⟨by rw [Z_Bj_eq hdp0 hdm0]; exact hZPD, by rw [hTeq]; exact PD_of_gate hT hTg,
    (div_le_iff₀ hdenPos).2 (le_of_mul_le_mul_right (by rw [one_mul]; exact hcapR.trans hmul) D_pos)⟩

/-! ### 5. Holomorphic kernel `RtGen` and circle/disc soundness -/

private lemma detIm_ne_zero_of_kerPos {R : Sym2C} {l : ℝ} (hl : 0 < l) (h : KerPos R l) :
    R.detIm ≠ 0 := by
  intro h0
  have := h (1, 0) (0, 0)
  simp [Sym2C.Amat, Sym2C.Cmat, Sym2C.form, h0] at this; linarith

private def coefK (R : Sym2C) : Fin 6 → ℂ :=
  ![R.Amat.a, R.Amat.b, R.Amat.c, R.Cmat.a, R.Cmat.b, R.Cmat.c]

private def monoK (x y : ℝ × ℝ) : Fin 6 → ℝ :=
  ![-(x.1 ^ 2 + y.1 ^ 2) / 2, -(x.1 * x.2 + y.1 * y.2), -(x.2 ^ 2 + y.2 ^ 2) / 2,
    x.1 * y.1, x.1 * y.2 + x.2 * y.1, x.2 * y.2]

private def mK (k : Fin 6) (q : Pt8) : ℝ := monoK q.1.1 q.2.1 k + monoK q.1.2 q.2.2 k

private def N8 (q : Pt8) : ℝ :=
  q.1.1.1 ^ 2 + q.1.1.2 ^ 2 + q.1.2.1 ^ 2 + q.1.2.2 ^ 2 +
    q.2.1.1 ^ 2 + q.2.1.2 ^ 2 + q.2.2.1 ^ 2 + q.2.2.2 ^ 2

private lemma kExp_eq_sum (R : Sym2C) (x y : ℝ × ℝ) :
    kExp R x y = ∑ k, coefK R k * (monoK x y k : ℂ) := by
  simp only [Fin.sum_univ_six]; simp [kExp, Sym2C.form, coefK, monoK]; ring

private lemma kExp_add_eq_sum (R : Sym2C) (q : Pt8) :
    kExp R q.1.1 q.2.1 + kExp R q.1.2 q.2.2 = ∑ k, coefK R k * (mK k q : ℂ) := by
  rw [kExp_eq_sum, kExp_eq_sum, ← Finset.sum_add_distrib]
  exact Finset.sum_congr rfl fun k _ => by simp only [mK]; push_cast; ring

private lemma abs_monoK_le (x y : ℝ × ℝ) (k : Fin 6) :
    |monoK x y k| ≤ x.1 ^ 2 + x.2 ^ 2 + y.1 ^ 2 + y.2 ^ 2 := by
  obtain ⟨a, b⟩ := x; obtain ⟨c, d⟩ := y
  fin_cases k <;> simp only [monoK, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val] <;>
    rw [abs_le] <;> constructor <;>
    nlinarith [sq_nonneg (a - c), sq_nonneg (a + c), sq_nonneg (a - d), sq_nonneg (a + d),
      sq_nonneg (b - c), sq_nonneg (b + c), sq_nonneg (b - d), sq_nonneg (b + d),
      sq_nonneg (a - b), sq_nonneg (a + b), sq_nonneg (c - d), sq_nonneg (c + d),
      sq_nonneg a, sq_nonneg b, sq_nonneg c, sq_nonneg d]

private lemma abs_mK_le (k : Fin 6) (q : Pt8) : |mK k q| ≤ N8 q := by
  have h1 := abs_monoK_le q.1.1 q.2.1 k; have h2 := abs_monoK_le q.1.2 q.2.2 k
  have := abs_add_le (monoK q.1.1 q.2.1 k) (monoK q.1.2 q.2.2 k)
  simp only [mK, N8]; linarith

private lemma continuous_mK (k : Fin 6) : Continuous (mK k) := by
  unfold mK monoK; fin_cases k <;> simp <;> fun_prop

private lemma N8_nonneg (q : Pt8) : 0 ≤ N8 q := by unfold N8; positivity

private lemma re_kExp_le {R : Sym2C} {l : ℝ} (h : KerPos R l) (x y : ℝ × ℝ) :
    (kExp R x y).re ≤ -(l / 2 * (x.1 ^ 2 + x.2 ^ 2 + y.1 ^ 2 + y.2 ^ 2)) := by
  have := h x y
  have hre : (kExp R x y).re = -((R.Amat.form x x + R.Amat.form y y - 2 * R.Cmat.form x y).re) / 2 := by
    simp only [kExp, Complex.sub_re, Complex.neg_re, Complex.div_re, Complex.add_re,
      Complex.mul_re]
    norm_num; ring
  rw [hre]; linarith

private lemma re_sum_le {R : Sym2C} {l : ℝ} (h : KerPos R l) (q : Pt8) :
    (∑ k, coefK R k * (mK k q : ℂ)).re ≤ -(l / 2 * N8 q) := by
  rw [← kExp_add_eq_sum, Complex.add_re]
  have h1 := re_kExp_le h q.1.1 q.2.1; have h2 := re_kExp_le h q.1.2 q.2.2
  simp only [N8]; linarith

private lemma differentiable_odd (P : ℝ[X]) :
    Differentiable ℂ fun t : ℂ => t * Polynomial.aeval (t ^ 2) P := by
  have : (fun t : ℂ => Polynomial.aeval (t ^ 2) P) =
      fun t : ℂ => (P.map (algebraMap ℝ ℂ)).eval (t ^ 2) := by
    funext t; rw [Polynomial.aeval_def, Polynomial.eval₂_eq_eval_map]
  have h2 : Differentiable ℂ fun t : ℂ => Polynomial.aeval (t ^ 2) P := by
    rw [this]
    simp_rw [Polynomial.eval_eq_sum_range]
    fun_prop
  exact differentiable_id.mul h2

private lemma differentiableAt_detIm {R : ℂ → Sym2C} {t : ℂ}
    (ha : DifferentiableAt ℂ (fun s => (R s).a) t) (hb : DifferentiableAt ℂ (fun s => (R s).b) t)
    (hc : DifferentiableAt ℂ (fun s => (R s).c) t) :
    DifferentiableAt ℂ (fun s => (R s).detIm) t := by
  simp only [Sym2C.detIm, Sym2C.sq]; fun_prop

private lemma differentiableAt_coefK {R : ℂ → Sym2C} {t : ℂ}
    (ha : DifferentiableAt ℂ (fun s => (R s).a) t) (hb : DifferentiableAt ℂ (fun s => (R s).b) t)
    (hc : DifferentiableAt ℂ (fun s => (R s).c) t) (hne : (R t).detIm ≠ 0) (k : Fin 6) :
    DifferentiableAt ℂ (fun s => coefK (R s) k) t := by
  have hi : DifferentiableAt ℂ (fun s => ((R s).detIm)⁻¹) t :=
    (differentiableAt_detIm ha hb hc).inv hne
  have hAa : DifferentiableAt ℂ (fun s => (R s).Amat.a) t := by
    have e : (fun s => (R s).Amat.a) = fun s =>
        (1 - ((R s).b * (R s).b + (R s).c * (R s).c)) * ((R s).detIm)⁻¹ := by
      funext s; simp [Sym2C.Amat, Sym2C.sq, div_eq_mul_inv]
    rw [e]; fun_prop
  have hAb : DifferentiableAt ℂ (fun s => (R s).Amat.b) t := by
    have e : (fun s => (R s).Amat.b) = fun s =>
        ((R s).a * (R s).b + (R s).b * (R s).c) * ((R s).detIm)⁻¹ := by
      funext s; simp [Sym2C.Amat, Sym2C.sq, div_eq_mul_inv]
    rw [e]; fun_prop
  have hAc : DifferentiableAt ℂ (fun s => (R s).Amat.c) t := by
    have e : (fun s => (R s).Amat.c) = fun s =>
        (1 - ((R s).a * (R s).a + (R s).b * (R s).b)) * ((R s).detIm)⁻¹ := by
      funext s; simp [Sym2C.Amat, Sym2C.sq, div_eq_mul_inv]
    rw [e]; fun_prop
  fin_cases k
  · exact hAa
  · exact hAb
  · exact hAc
  · show DifferentiableAt ℂ (fun s => (R s).a * (R s).Amat.a + (R s).b * (R s).Amat.b) t; fun_prop
  · show DifferentiableAt ℂ (fun s => (R s).a * (R s).Amat.b + (R s).b * (R s).Amat.c) t; fun_prop
  · show DifferentiableAt ℂ (fun s => (R s).b * (R s).Amat.b + (R s).c * (R s).Amat.c) t; fun_prop

private lemma integrable_exp_neg_N8 {l : ℝ} (hl : 0 < l) :
    Integrable (fun q : Pt8 => Real.exp (-(l * N8 q))) := by
  have g1 : Integrable (fun x : ℝ => Real.exp (-l * x ^ 2)) := integrable_exp_neg_mul_sq hl
  have g2 := g1.mul_prod g1
  have g4 := g2.mul_prod g2
  have g8 := g4.mul_prod g4
  refine g8.congr (Filter.Eventually.of_forall fun q => ?_)
  simp only [N8]
  rw [← Real.exp_add, ← Real.exp_add, ← Real.exp_add, ← Real.exp_add, ← Real.exp_add,
    ← Real.exp_add, ← Real.exp_add]
  congr 1; ring

private lemma integrable_N8_mul_exp {l : ℝ} (hl : 0 < l) :
    Integrable (fun q : Pt8 => N8 q * Real.exp (-(l * N8 q))) := by
  refine Integrable.mono' ((integrable_exp_neg_N8 (half_pos hl)).const_mul (2 / l))
    ((by unfold N8; fun_prop : Continuous fun q : Pt8 => N8 q * Real.exp (-(l * N8 q))).aestronglyMeasurable)
    (Filter.Eventually.of_forall fun q => ?_)
  have hN := N8_nonneg q
  rw [Real.norm_eq_abs, abs_of_nonneg (by positivity)]
  have hu : l / 2 * N8 q * Real.exp (-(l / 2 * N8 q)) ≤ 1 := by
    have := Real.add_one_le_exp (l / 2 * N8 q)
    rw [Real.exp_neg, mul_inv_le_iff₀ (Real.exp_pos _)]; linarith
  have hsplit : Real.exp (-(l * N8 q)) =
      Real.exp (-(l / 2 * N8 q)) * Real.exp (-(l / 2 * N8 q)) := by
    rw [← Real.exp_add]; congr 1; ring
  rw [hsplit]
  calc N8 q * (Real.exp (-(l / 2 * N8 q)) * Real.exp (-(l / 2 * N8 q)))
      = (2 / l) * (l / 2 * N8 q * Real.exp (-(l / 2 * N8 q))) * Real.exp (-(l / 2 * N8 q)) := by
        field_simp
    _ ≤ (2 / l) * 1 * Real.exp (-(l / 2 * N8 q)) := by gcongr
    _ = 2 / l * Real.exp (-(l / 2 * N8 q)) := by ring

private lemma measurable_toC2 : Measurable fun p : (ℝ × ℝ) × (ℝ × ℝ) => toC2 p.1 p.2 := by
  unfold toC2; fun_prop

private lemma HholPair_eq (F G : ℂ × ℂ → ℂ) (R : Sym2C) :
    HholPair F G R = ∫ q : Pt8, (conj (F (toC2 q.1.1 q.1.2)) * G (toC2 q.2.1 q.2.2)) *
      (((((2 * Real.pi) ^ 4 : ℝ) : ℂ)⁻¹ * R.detIm⁻¹) *
        Complex.exp (∑ k, coefK R k * (mK k q : ℂ))) := by
  unfold HholPair
  exact integral_congr_ae (Filter.Eventually.of_forall fun _ => by simp only [kHol, ← kExp_add_eq_sum])

def RtGen (m00 m01 m11 : ℝ) (P Q : ℝ[X]) (t : ℂ) : Sym2C :=
  let p : ℂ := t * Polynomial.aeval (t ^ 2) P
  let q : ℂ := t * Polynomial.aeval (t ^ 2) Q
  ⟨(m00 : ℂ) ^ 2 * p + (m01 : ℂ) ^ 2 * q,
   (m00 : ℂ) * m01 * p + (m01 : ℂ) * m11 * q,
   (m01 : ℂ) ^ 2 * p + (m11 : ℂ) ^ 2 * q⟩

private lemma memSC_Rbox_gen {m00 m01 m11 : ℝ} {pl ql : List ℚ} {dat : RData}
    (hm00 : mem m00 dat.m00) (hm01 : mem m01 dat.m01) (hm11 : mem m11 dat.m11)
    (hP : dat.P = pl.map ofRatI) (hQ : dat.Q = ql.map ofRatI)
    {t : ℂ} {T : CI} (ht : memC t T) :
    memSC (RtGen m00 m01 m11 (ofListQ pl) (ofListQ ql) t) (Rbox dat T) := by
  have ht2 := memC_mul ht ht
  have hp : memC (t * Polynomial.aeval (t ^ 2) (ofListQ pl))
      (CI.mul T (CI.horner (CI.mul T T) dat.P)) := by
    rw [aeval_ofListQ, sq, hP]; exact memC_mul ht (memC_horner ht2 (forall2_ofRatI pl))
  have hq : memC (t * Polynomial.aeval (t ^ 2) (ofListQ ql))
      (CI.mul T (CI.horner (CI.mul T T) dat.Q)) := by
    rw [aeval_ofListQ, sq, hQ]; exact memC_mul ht (memC_horner ht2 (forall2_ofRatI ql))
  have h00 := memC_ofR hm00; have h01 := memC_ofR hm01; have h11 := memC_ofR hm11
  refine ⟨?_, ?_, ?_⟩
  · convert memC_add (memC_mul (memC_mul h00 h00) hp) (memC_mul (memC_mul h01 h01) hq) using 1
    <;> first | rfl | (simp only [RtGen]; ring)
  · convert memC_add (memC_mul (memC_mul h00 h01) hp) (memC_mul (memC_mul h01 h11) hq) using 1
    <;> rfl
  · convert memC_add (memC_mul (memC_mul h01 h01) hp) (memC_mul (memC_mul h11 h11) hq) using 1
    <;> first | rfl | (simp only [RtGen]; ring)

private lemma kerPos_of_kerGates_gen {m00 m01 m11 : ℝ} {pl ql : List ℚ} {dat : RData}
    (hm00 : mem m00 dat.m00) (hm01 : mem m01 dat.m01) (hm11 : mem m11 dat.m11)
    (hP : dat.P = pl.map ofRatI) (hQ : dat.Q = ql.map ofRatI)
    {t : ℂ} {T : CI} (ht : memC t T) (hg : kerGates (Rbox dat T) = true) :
    ∃ l > 0, KerPos (RtGen m00 m01 m11 (ofListQ pl) (ofListQ ql) t) l := by
  simp only [kerGates, Bool.and_eq_true] at hg
  obtain ⟨⟨⟨hp1, hp2⟩, hP_pd⟩, hM_pd⟩ := hg
  have hR := memSC_Rbox_gen hm00 hm01 hm11 hP hQ ht
  have hdp := memC_dpm hR false; have hdm := memC_dpm hR true
  rw [sigB_false] at hdp; rw [sigB_true] at hdm
  have hdp0 : dpm (RtGen m00 m01 m11 (ofListQ pl) (ofListQ ql) t) 1 ≠ 0 := fun h0 => by
    have := pos_of_posI (mem_normSq hdp) hp1; simp [h0] at this
  have hdm0 : dpm (RtGen m00 m01 m11 (ofListQ pl) (ofListQ ql) t) (-1) ≠ 0 := fun h0 => by
    have := pos_of_posI (mem_normSq hdm) hp2; simp [h0] at this
  have hIp := memSC_invIm hR false hp1; have hIm := memSC_invIm hR true hp2
  rw [sigB_false] at hIp; rw [sigB_true] at hIm
  exact kerPos_of_gates hdp0 hdm0 (PD_of_gate (memSR_re hIp) hP_pd) (PD_of_gate (memSR_re hIm) hM_pd)

theorem discCover_sound_gen {m00 m01 m11 : ℝ} {pl ql : List ℚ} {dat : RData}
    (hm00 : mem m00 dat.m00) (hm01 : mem m01 dat.m01) (hm11 : mem m11 dat.m11)
    (hP : dat.P = pl.map ofRatI) (hQ : dat.Q = ql.map ofRatI) {r2 : ℤ} :
    ∀ (depth : ℕ) (xlo xhi ylo yhi : ℤ), discCover dat r2 depth xlo xhi ylo yhi = true →
      ∀ t : ℂ, mem t.re ⟨xlo, xhi⟩ → mem t.im ⟨ylo, yhi⟩ → Complex.normSq t < (r2 : ℝ) / D →
        ∃ l > 0, KerPos (RtGen m00 m01 m11 (ofListQ pl) (ofListQ ql) t) l := by
  intro depth
  induction depth with
  | zero =>
    intro xlo xhi ylo yhi h t hx hy hr
    simp only [discCover, Bool.or_eq_true, Bool.or_false] at h
    rcases h with h | h
    · exact absurd (outside_sound h hx hy) (not_le.2 hr)
    · exact kerPos_of_kerGates_gen hm00 hm01 hm11 hP hQ (T := ⟨⟨xlo, xhi⟩, ⟨ylo, yhi⟩⟩) ⟨hx, hy⟩ h
  | succ d ih =>
    intro xlo xhi ylo yhi h t hx hy hr
    simp only [discCover, Bool.or_eq_true, Bool.and_eq_true] at h
    rcases h with (h | h) | ⟨⟨⟨h1, h2⟩, h3⟩, h4⟩
    · exact absurd (outside_sound h hx hy) (not_le.2 hr)
    · exact kerPos_of_kerGates_gen hm00 hm01 hm11 hP hQ (T := ⟨⟨xlo, xhi⟩, ⟨ylo, yhi⟩⟩) ⟨hx, hy⟩ h
    · set xm := (xlo + xhi) / 2; set ym := (ylo + yhi) / 2
      rcases le_total (t.re * D) xm with hxl | hxl <;> rcases le_total (t.im * D) ym with hyl | hyl
      · exact ih _ _ _ _ h1 t ⟨hx.1, hxl⟩ ⟨hy.1, hyl⟩ hr
      · exact ih _ _ _ _ h3 t ⟨hx.1, hxl⟩ ⟨hyl, hy.2⟩ hr
      · exact ih _ _ _ _ h2 t ⟨hxl, hx.2⟩ ⟨hy.1, hyl⟩ hr
      · exact ih _ _ _ _ h4 t ⟨hxl, hx.2⟩ ⟨hyl, hy.2⟩ hr

theorem kerPos_on_ball_gen {m00 m01 m11 : ℝ} {pl ql : List ℚ} {dat : RData} {regionRQ : ℚ}
    (hr2 : (regionRQ : ℝ) < 2)
    (hm00 : mem m00 dat.m00) (hm01 : mem m01 dat.m01) (hm11 : mem m11 dat.m11)
    (hP : dat.P = pl.map ofRatI) (hQ : dat.Q = ql.map ofRatI)
    (hreg : regionOK dat regionRQ = true) :
    ∀ t ∈ Metric.ball (0 : ℂ) (regionRQ : ℝ),
      ∃ l > 0, KerPos (RtGen m00 m01 m11 (ofListQ pl) (ofListQ ql) t) l := by
  intro t ht
  have hD := D_pos
  rw [Metric.mem_ball, dist_zero_right] at ht
  have hnorm : ‖t‖ < 2 := ht.trans hr2
  have hre : |t.re| < 2 := (Complex.abs_re_le_norm t).trans_lt hnorm
  have him : |t.im| < 2 := (Complex.abs_im_le_norm t).trans_lt hnorm
  have hx : mem t.re ⟨-2 * D, 2 * D⟩ := by
    obtain ⟨a, b⟩ := abs_lt.1 hre; constructor <;> push_cast <;> nlinarith
  have hy : mem t.im ⟨-2 * D, 2 * D⟩ := by
    obtain ⟨a, b⟩ := abs_lt.1 him; constructor <;> push_cast <;> nlinarith
  refine discCover_sound_gen hm00 hm01 hm11 hP hQ 30 _ _ _ _ hreg t hx hy ?_
  have h1 : Complex.normSq t < (regionRQ : ℝ) ^ 2 := by
    rw [Complex.normSq_eq_norm_sq]; exact pow_lt_pow_left₀ ht (norm_nonneg _) (by norm_num)
  have h2 : ((regionRQ * regionRQ : ℚ) : ℝ) * D ≤ (ofRatHi (regionRQ * regionRQ) : ℝ) :=
    le_ofRatHi _
  rw [lt_div_iff₀ hD]; push_cast at h2; nlinarith

private lemma differentiable_RtGen_entries (m00 m01 m11 : ℝ) (P Q : ℝ[X]) :
    (Differentiable ℂ fun t => (RtGen m00 m01 m11 P Q t).a) ∧
    (Differentiable ℂ fun t => (RtGen m00 m01 m11 P Q t).b) ∧
    (Differentiable ℂ fun t => (RtGen m00 m01 m11 P Q t).c) :=
  ⟨((differentiable_const _).mul (differentiable_odd P)).add
    ((differentiable_const _).mul (differentiable_odd Q)),
   ((differentiable_const _).mul (differentiable_odd P)).add
    ((differentiable_const _).mul (differentiable_odd Q)),
   ((differentiable_const _).mul (differentiable_odd P)).add
    ((differentiable_const _).mul (differentiable_odd Q))⟩

theorem differentiableOn_HholPair_RtGen {F G : ℂ × ℂ → ℂ}
    (hF : Measurable F) (hG : Measurable G)
    (hFb : ∀ u, ‖F u‖ ≤ 1) (hGb : ∀ u, ‖G u‖ ≤ 1)
    {m00 m01 m11 : ℝ} {P Q : ℝ[X]} {U : Set ℂ} (hU : IsOpen U)
    (hpos : ∀ t ∈ U, ∃ l > 0, KerPos (RtGen m00 m01 m11 P Q t) l) :
    DifferentiableOn ℂ (fun t => HholPair F G (RtGen m00 m01 m11 P Q t)) U := by
  set R := RtGen m00 m01 m11 P Q
  obtain ⟨hRa, hRb, hRc⟩ := differentiable_RtGen_entries m00 m01 m11 P Q
  have hdet : ∀ t ∈ U, (R t).detIm ≠ 0 := fun t ht => by
    obtain ⟨l, hl, h⟩ := hpos t ht; exact detIm_ne_zero_of_kerPos hl h
  have hfun : (fun t => HholPair F G (R t)) = fun t => ∫ q : Pt8,
      (conj (F (toC2 q.1.1 q.1.2)) * G (toC2 q.2.1 q.2.2)) *
        (((((2 * Real.pi) ^ 4 : ℝ) : ℂ)⁻¹ * (R t).detIm⁻¹) *
          Complex.exp (∑ k, coefK (R t) k * (mK k q : ℂ))) := by
    funext t; exact HholPair_eq F G _
  rw [hfun]
  refine differentiableOn_integral_exp (n := 6) hU
    (fun k t ht => (differentiableAt_coefK (hRa t) (hRb t) (hRc t) (hdet t ht) k).differentiableWithinAt)
    (fun t ht => ((differentiableAt_const _).mul
      ((differentiableAt_detIm (hRa t) (hRb t) (hRc t)).inv (hdet t ht))).differentiableWithinAt)
    (fun k => (continuous_mK k).measurable)
    (((Complex.continuous_conj.measurable.comp
      (hF.comp (measurable_toC2.comp measurable_fst)))).mul
      (hG.comp (measurable_toC2.comp measurable_snd))).aestronglyMeasurable
    (fun _ => by
      rw [norm_mul, Complex.norm_conj]
      exact (mul_le_mul (hFb _) (hGb _) (norm_nonneg _) zero_le_one).trans_eq (one_mul 1))
    N8_nonneg abs_mK_le
    (fun t ht => by obtain ⟨l, hl, h⟩ := hpos t ht; exact ⟨l / 2, half_pos hl, fun q => re_sum_le h q⟩)
    (fun _ hl => integrable_exp_neg_N8 hl)
    (fun _ hl => integrable_N8_mul_exp hl)

private def gFGen (F G : ℂ × ℂ → ℂ) (R : ℂ → Sym2C) (rho : ℝ) (neg : Bool) (θ : ℝ) : ℝ :=
  ‖HholPair F G (R (sigB neg * (rho : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2

private lemma gFGen_intervalIntegrable {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {m00 m01 m11 rho r : ℝ} {P Q : ℝ[X]} (hρ0 : 0 ≤ rho) (hr : rho < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (RtGen m00 m01 m11 P Q t) l)
    (neg : Bool) (a b : ℝ) :
    IntervalIntegrable (gFGen F G (RtGen m00 m01 m11 P Q) rho neg) volume a b := by
  have hd := differentiableOn_HholPair_RtGen hFm hGm hF hG Metric.isOpen_ball hU
  have hmaps : ∀ θ : ℝ, sigB neg * (rho : ℂ) * Complex.exp (θ * Complex.I) ∈
      Metric.ball (0 : ℂ) r := fun θ => by
    rw [Metric.mem_ball, dist_zero_right, norm_mul, norm_mul, Complex.norm_exp_ofReal_mul_I, mul_one]
    have hs : ‖sigB neg‖ = 1 := by cases neg <;> simp [sigB]
    rw [hs, one_mul, Complex.norm_of_nonneg hρ0]; exact hr
  have hcont : Continuous fun θ : ℝ => sigB neg * (rho : ℂ) * Complex.exp (θ * Complex.I) := by
    fun_prop
  exact ((continuous_norm.comp (hd.continuousOn.comp_continuous hcont hmaps)).pow 2).intervalIntegrable a b

private lemma ceilDiv_sound (a b : ℤ) (hb : 0 < b) : (a : ℝ) / (b : ℝ) ≤ (ceilDiv a b : ℝ) := by
  have hbR : (0 : ℝ) < (b : ℝ) := by exact_mod_cast hb
  rw [div_le_iff₀ hbR]
  set q : ℤ := (-a) / b
  have hqR : (q : ℝ) * (b : ℝ) ≤ -(a : ℝ) := by exact_mod_cast Int.ediv_mul_le (-a) hb.ne'
  have hc : (ceilDiv a b : ℝ) = -(q : ℝ) := by simp [ceilDiv, q]
  rw [hc]; linarith

private lemma shUp_sound (x : ℤ) : (x : ℝ) / (D : ℝ) ≤ (shUp x : ℝ) := by
  simpa only [shUp, ceilDiv] using ceilDiv_sound x D D_pos_int

private lemma arcLenUp_sound {lo hi : ℤ} (h : lo ≤ hi) (hs : 0 ≤ lo ∨ hi ≤ 0) :
    2 * Real.arctan ((hi : ℝ) / D) - 2 * Real.arctan ((lo : ℝ) / D) ≤ (arcLenUp lo hi : ℝ) / D := by
  have hD := D_pos
  have hab : (lo : ℝ) / D ≤ (hi : ℝ) / D := div_le_div_of_nonneg_right (by exact_mod_cast h) hD.le
  have hsR : 0 ≤ (lo : ℝ) / D ∨ (hi : ℝ) / D ≤ 0 := by
    rcases hs with h0 | h0
    · exact Or.inl (div_nonneg (by exact_mod_cast h0) hD.le)
    · exact Or.inr (div_nonpos_of_nonpos_of_nonneg (by exact_mod_cast h0) hD.le)
  have harc := arctan_sub_le hab hsR
  have hmin : min (((lo : ℝ) / D) ^ 2) (((hi : ℝ) / D) ^ 2) =
      ((min (lo * lo) (hi * hi) : ℤ) : ℝ) / (D : ℝ) ^ 2 := by
    have e1 : ((lo : ℝ) / D) ^ 2 = ((lo * lo : ℤ) : ℝ) / (D : ℝ) ^ 2 := by push_cast; ring
    have e2 : ((hi : ℝ) / D) ^ 2 = ((hi * hi : ℤ) : ℝ) / (D : ℝ) ^ 2 := by push_cast; ring
    rw [e1, e2]
    rcases le_total (lo * lo) (hi * hi) with hle | hle
    · have hleR : ((lo * lo : ℤ) : ℝ) / (D : ℝ) ^ 2 ≤ ((hi * hi : ℤ) : ℝ) / (D : ℝ) ^ 2 :=
        div_le_div_of_nonneg_right (by exact_mod_cast hle) (sq_nonneg _)
      rw [min_eq_left hle, min_eq_left hleR]
    · have hleR : ((hi * hi : ℤ) : ℝ) / (D : ℝ) ^ 2 ≤ ((lo * lo : ℤ) : ℝ) / (D : ℝ) ^ 2 :=
        div_le_div_of_nonneg_right (by exact_mod_cast hle) (sq_nonneg _)
      rw [min_eq_right hle, min_eq_right hleR]
  have hden0 : (0 : ℤ) < D * D + min (lo * lo) (hi * hi) := by
    have hD2 : (0 : ℤ) < D * D := mul_pos D_pos_int D_pos_int
    have hm : 0 ≤ min (lo * lo) (hi * hi) := le_min (mul_self_nonneg _) (mul_self_nonneg _)
    omega
  have hdenR : (0 : ℝ) < (D : ℝ) ^ 2 + ((min (lo * lo) (hi * hi) : ℤ) : ℝ) := by
    have h1 : (0 : ℝ) < ((D * D + min (lo * lo) (hi * hi) : ℤ) : ℝ) := by exact_mod_cast hden0
    have h2 : ((D * D + min (lo * lo) (hi * hi) : ℤ) : ℝ) =
        (D : ℝ) ^ 2 + ((min (lo * lo) (hi * hi) : ℤ) : ℝ) := by push_cast; ring
    linarith
  have halg : 2 * (((hi : ℝ) / D - (lo : ℝ) / D) /
      (1 + ((min (lo * lo) (hi * hi) : ℤ) : ℝ) / (D : ℝ) ^ 2)) =
      (((2 * (hi - lo) * D * D : ℤ) : ℝ) /
        ((D * D + min (lo * lo) (hi * hi) : ℤ) : ℝ)) / D := by
    push_cast; field_simp
  calc 2 * Real.arctan ((hi : ℝ) / D) - 2 * Real.arctan ((lo : ℝ) / D)
      = 2 * (Real.arctan ((hi : ℝ) / D) - Real.arctan ((lo : ℝ) / D)) := by ring
    _ ≤ 2 * (((hi : ℝ) / D - (lo : ℝ) / D) /
        (1 + min (((lo : ℝ) / D) ^ 2) (((hi : ℝ) / D) ^ 2))) := by linarith
    _ = (((2 * (hi - lo) * D * D : ℤ) : ℝ) /
        ((D * D + min (lo * lo) (hi * hi) : ℤ) : ℝ)) / D := by rw [hmin, halg]
    _ ≤ (arcLenUp lo hi : ℝ) / D :=
        div_le_div_of_nonneg_right (ceilDiv_sound _ _ hden0) hD.le

private lemma gaussVal_sound {R : Sym2C} {RI : SC} {j : ℝ} {jI : Ival} {vOut : ℤ}
    (hR : memSC R RI) (hj : mem j jI) (hg : gaussVal jI RI = some vOut) :
    (Z (Bj R j)).PD ∧ (T (Bj R j) R.Cmat).PD ∧ 1 / gaussDenominator R j ≤ (vOut : ℝ) / D := by
  unfold gaussVal at hg
  dsimp only at hg
  split_ifs at hg with hp hb
  injection hg with hv; subst hv
  have hmem : mem (((invPosI (gaussDenOf jI RI)).hi : ℝ) / D)
      ⟨(invPosI (gaussDenOf jI RI)).hi, (invPosI (gaussDenOf jI RI)).hi⟩ := by
    have hD := D_pos.ne'; exact ⟨by field_simp; rfl, by field_simp; rfl⟩
  exact box_sound hR hj hmem hb

private lemma leafGauss_sound {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {m00 m01 m11 : ℝ} {pl ql : List ℚ} {dat : RData}
    (hm00 : mem m00 dat.m00) (hm01 : mem m01 dat.m01) (hm11 : mem m11 dat.m11)
    (hP : dat.P = pl.map ofRatI) (hQ : dat.Q = ql.map ofRatI)
    {rhoQ jQ : ℚ} {r : ℝ} (hρ0 : 0 ≤ (rhoQ : ℝ)) (hj0 : 0 < (jQ : ℝ)) (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r,
      ∃ l > 0, KerPos (RtGen m00 m01 m11 (ofListQ pl) (ofListQ ql) t) l)
    {neg : Bool} {w tol : ℤ} {last : Bool} {lo hi out : ℤ}
    (hlo_hi : lo ≤ hi) (hsign : 0 ≤ lo ∨ hi ≤ 0)
    (hl : leafGauss (ofRatI jQ) (ofRatI rhoQ) dat neg w tol last lo hi = some out) :
    ∫ θ in (2 * Real.arctan ((lo : ℝ) / D))..(2 * Real.arctan ((hi : ℝ) / D)),
      gFGen F G (RtGen m00 m01 m11 (ofListQ pl) (ofListQ ql)) (rhoQ : ℝ) neg θ ≤ (out : ℝ) / D := by
  have hD := D_pos
  unfold leafGauss at hl
  split_ifs at hl with hcond
  simp only [Bool.and_eq_true] at hcond
  obtain ⟨_, hpos_s⟩ := hcond
  cases hgv : gaussVal (ofRatI jQ) (Rbox dat (circleBox (ofRatI rhoQ) neg ⟨lo, hi⟩)) with
  | none => rw [hgv] at hl; simp at hl
  | some v =>
    rw [hgv] at hl; dsimp only at hl
    split_ifs at hl with hacc
    injection hl with hout; subst hout
    set a := 2 * Real.arctan ((lo : ℝ) / D)
    set b := 2 * Real.arctan ((hi : ℝ) / D)
    have hab : a ≤ b := by
      dsimp only [a, b]
      have : (lo : ℝ) / D ≤ (hi : ℝ) / D :=
        div_le_div_of_nonneg_right (by exact_mod_cast hlo_hi) hD.le
      linarith [Real.arctan_mono this]
    have hpt : ∀ θ ∈ Set.Icc a b,
        gFGen F G (RtGen m00 m01 m11 (ofListQ pl) (ofListQ ql)) (rhoQ : ℝ) neg θ ≤ (v : ℝ) / D := by
      intro θ hθ
      have htan := tan_half_mem hθ.1 hθ.2
      have hs_mem : mem (Real.tan (θ / 2)) ⟨lo, hi⟩ :=
        ⟨(div_le_iff₀ hD).1 htan.1, (le_div_iff₀ hD).1 htan.2⟩
      have hcb := memC_circleBox (mem_ofRatI rhoQ) hs_mem hpos_s neg
      have hR := memSC_Rbox_gen hm00 hm01 hm11 hP hQ hcb
      obtain ⟨hZ, hT, hden⟩ := gaussVal_sound hR (mem_ofRatI jQ) hgv
      have hexp := exp_eq_chart
        (by linarith [hθ.1, Real.neg_pi_div_two_lt_arctan ((lo : ℝ) / D)] : -Real.pi < θ)
        (by linarith [hθ.2, Real.arctan_lt_pi_div_two ((hi : ℝ) / D)] : θ < Real.pi)
      have hchart : sigB neg * ((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I) =
          chartPt (rhoQ : ℝ) neg (Real.tan (θ / 2)) := by
        rw [hexp, chartPt]; push_cast; ring
      unfold gFGen; rw [hchart]
      exact (SchurMainGaussian.norm_HholPair_sq_le _ _ hj0 hZ hT hFm hGm hF hG).trans hden
    have hv0 : 0 ≤ (v : ℝ) / D := (sq_nonneg _).trans (hpt a ⟨le_rfl, hab⟩)
    have hint := gFGen_intervalIntegrable hFm hGm hF hG hρ0 hr hU neg a b
    calc ∫ θ in a..b, gFGen F G (RtGen m00 m01 m11 (ofListQ pl) (ofListQ ql)) (rhoQ : ℝ) neg θ
        ≤ ∫ _ in a..b, ((v : ℝ) / D) :=
          intervalIntegral.integral_mono_on hab hint intervalIntegrable_const hpt
      _ = (b - a) * ((v : ℝ) / D) := by rw [intervalIntegral.integral_const, smul_eq_mul]
      _ ≤ ((arcLenUp lo hi : ℝ) / D) * ((v : ℝ) / D) :=
          mul_le_mul_of_nonneg_right (arcLenUp_sound hlo_hi hsign) hv0
      _ = (((v * arcLenUp lo hi : ℤ) : ℝ) / D) / D := by push_cast; ring
      _ ≤ (shUp (v * arcLenUp lo hi) : ℝ) / D :=
          div_le_div_of_nonneg_right (shUp_sound _) hD.le

private theorem coverGauss_sound {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {m00 m01 m11 : ℝ} {pl ql : List ℚ} {dat : RData}
    (hm00 : mem m00 dat.m00) (hm01 : mem m01 dat.m01) (hm11 : mem m11 dat.m11)
    (hP : dat.P = pl.map ofRatI) (hQ : dat.Q = ql.map ofRatI)
    {rhoQ jQ : ℚ} {r : ℝ} (hρ0 : 0 ≤ (rhoQ : ℝ)) (hj0 : 0 < (jQ : ℝ)) (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r,
      ∃ l > 0, KerPos (RtGen m00 m01 m11 (ofListQ pl) (ofListQ ql) t) l)
    (neg : Bool) (w tol : ℤ) :
    ∀ (depth : ℕ) (lo hi out : ℤ), lo ≤ hi → (0 ≤ lo ∨ hi ≤ 0) →
      coverGauss (ofRatI jQ) (ofRatI rhoQ) dat neg w tol depth lo hi = some out →
      ∫ θ in (2 * Real.arctan ((lo : ℝ) / D))..(2 * Real.arctan ((hi : ℝ) / D)),
        gFGen F G (RtGen m00 m01 m11 (ofListQ pl) (ofListQ ql)) (rhoQ : ℝ) neg θ ≤ (out : ℝ) / D := by
  intro depth
  induction depth with
  | zero =>
    intro lo hi out hlo_hi hsign hc
    unfold coverGauss at hc
    cases hl : leafGauss (ofRatI jQ) (ofRatI rhoQ) dat neg w tol (0 == 0) lo hi with
    | none => rw [hl] at hc; simp at hc
    | some x =>
      rw [hl] at hc; injection hc with hx; subst hx
      exact leafGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU hlo_hi hsign hl
  | succ d ih =>
    intro lo hi out hlo_hi hsign hc
    unfold coverGauss at hc
    cases hl : leafGauss (ofRatI jQ) (ofRatI rhoQ) dat neg w tol (d + 1 == 0) lo hi with
    | some x =>
      rw [hl] at hc; injection hc with hx; subst hx
      exact leafGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU hlo_hi hsign hl
    | none =>
      rw [hl] at hc; dsimp only at hc
      set mid := (lo + hi) / 2
      cases hc1 : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat neg w tol d lo mid with
      | none => rw [hc1] at hc; simp at hc
      | some x =>
        rw [hc1] at hc
        cases hc2 : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat neg w tol d mid hi with
        | none => rw [hc2] at hc; simp at hc
        | some y =>
          rw [hc2] at hc; injection hc with hxy; subst hxy
          have hi1 := ih lo mid x (by omega) (by rcases hsign with h0 | h0 <;> omega) hc1
          have hi2 := ih mid hi y (by omega) (by rcases hsign with h0 | h0 <;> omega) hc2
          rw [← intervalIntegral.integral_add_adjacent_intervals
            (gFGen_intervalIntegrable hFm hGm hF hG hρ0 hr hU neg _ _)
            (gFGen_intervalIntegrable hFm hGm hF hG hρ0 hr hU neg _ _)
            (b := 2 * Real.arctan ((mid : ℝ) / D))]
          calc _ ≤ (x : ℝ) / D + (y : ℝ) / D := add_le_add hi1 hi2
            _ = ((x + y : ℤ) : ℝ) / D := by push_cast; ring

theorem hmean_of_circleMeanOK {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {m00 m01 m11 : ℝ} {pl ql : List ℚ} {dat : RData}
    (hm00 : mem m00 dat.m00) (hm01 : mem m01 dat.m01) (hm11 : mem m11 dat.m11)
    (hP : dat.P = pl.map ofRatI) (hQ : dat.Q = ql.map ofRatI)
    {rhoQ jQ budgetQ : ℚ} {r : ℝ} {depth : ℕ}
    (hρ0 : 0 ≤ (rhoQ : ℝ)) (hj0 : 0 < (jQ : ℝ)) (hB0 : 0 ≤ (budgetQ : ℝ))
    (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r,
      ∃ l > 0, KerPos (RtGen m00 m01 m11 (ofListQ pl) (ofListQ ql) t) l)
    (hc : circleMeanOK dat rhoQ jQ budgetQ depth = true) :
    (2 * Real.pi)⁻¹ * ∫ θ in (0 : ℝ)..2 * Real.pi,
      ‖HholPair F G (RtGen m00 m01 m11 (ofListQ pl) (ofListQ ql)
        (((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2 ≤ (budgetQ : ℝ) := by
  have hD := D_pos
  have hD0 : (0 : ℤ) ≤ D := D_pos_int.le
  unfold circleMeanOK at hc; dsimp only at hc
  cases ha : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat false (D / 64) (D * D / 50000) depth (-D) 0 with
  | none => rw [ha] at hc; simp at hc
  | some a =>
  rw [ha] at hc
  cases hb : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat false (D / 64) (D * D / 50000) depth 0 D with
  | none => rw [hb] at hc; simp at hc
  | some b =>
  rw [hb] at hc
  cases hc' : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat true (D / 64) (D * D / 50000) depth (-D) 0 with
  | none => rw [hc'] at hc; simp at hc
  | some c =>
  rw [hc'] at hc
  cases hd : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat true (D / 64) (D * D / 50000) depth 0 D with
  | none => rw [hd] at hc; simp at hc
  | some d =>
  rw [hd, decide_eq_true_eq] at hc
  have ia := coverGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU false (D / 64)
    (D * D / 50000) depth (-D) 0 a (by omega) (Or.inr le_rfl) ha
  have ib := coverGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU false (D / 64)
    (D * D / 50000) depth 0 D b hD0 (Or.inl le_rfl) hb
  have ic := coverGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU true (D / 64)
    (D * D / 50000) depth (-D) 0 c (by omega) (Or.inr le_rfl) hc'
  have id' := coverGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU true (D / 64)
    (D * D / 50000) depth 0 D d hD0 (Or.inl le_rfl) hd
  have e_neg : 2 * Real.arctan (((-D : ℤ) : ℝ) / D) = -(Real.pi / 2) := by
    rw [Int.cast_neg, neg_div_self hD.ne', Real.arctan_neg, Real.arctan_one]; ring
  have e_zero : 2 * Real.arctan (((0 : ℤ) : ℝ) / D) = 0 := by simp
  have e_pos : 2 * Real.arctan ((D : ℝ) / D) = Real.pi / 2 := by
    rw [div_self hD.ne', Real.arctan_one]; ring
  rw [e_neg, e_zero] at ia ic; rw [e_zero, e_pos] at ib id'
  set R := RtGen m00 m01 m11 (ofListQ pl) (ofListQ ql)
  have hint := gFGen_intervalIntegrable hFm hGm hF hG hρ0 hr hU
  have hfalse : ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), gFGen F G R (rhoQ : ℝ) false θ ≤
      ((a + b : ℤ) : ℝ) / D := by
    rw [← intervalIntegral.integral_add_adjacent_intervals (hint false _ _) (hint false _ _) (b := 0)]
    calc _ ≤ (a : ℝ) / D + (b : ℝ) / D := add_le_add ia ib
      _ = ((a + b : ℤ) : ℝ) / D := by push_cast; ring
  have htrue : ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), gFGen F G R (rhoQ : ℝ) true θ ≤
      ((c + d : ℤ) : ℝ) / D := by
    rw [← intervalIntegral.integral_add_adjacent_intervals (hint true _ _) (hint true _ _) (b := 0)]
    calc _ ≤ (c : ℝ) / D + (d : ℝ) / D := add_le_add ic id'
      _ = ((c + d : ℤ) : ℝ) / D := by push_cast; ring
  have hf : (fun θ : ℝ => ‖HholPair F G (R (((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2) =
      gFGen F G R (rhoQ : ℝ) false := by funext θ; simp [gFGen, sigB]
  rw [hf]
  have hper : Function.Periodic (gFGen F G R (rhoQ : ℝ) false) (2 * Real.pi) := fun θ => by
    simp only [gFGen]; congr 4; push_cast
    rw [add_mul, Complex.exp_add, Complex.exp_two_pi_mul_I, mul_one]
  have hshift : ∫ θ in (0 : ℝ)..2 * Real.pi, gFGen F G R (rhoQ : ℝ) false θ =
      ∫ θ in (-(Real.pi / 2))..(-(Real.pi / 2) + 2 * Real.pi), gFGen F G R (rhoQ : ℝ) false θ := by
    simpa using hper.intervalIntegral_add_eq 0 (-(Real.pi / 2))
  rw [hshift, ← intervalIntegral.integral_add_adjacent_intervals
    (hint false _ _) (hint false _ _) (b := Real.pi / 2)]
  have hsecond : ∫ θ in (Real.pi / 2)..(-(Real.pi / 2) + 2 * Real.pi), gFGen F G R (rhoQ : ℝ) false θ =
      ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), gFGen F G R (rhoQ : ℝ) true θ := by
    have e : ∀ θ : ℝ, gFGen F G R (rhoQ : ℝ) false (θ + Real.pi) = gFGen F G R (rhoQ : ℝ) true θ := by
      intro θ
      simp only [gFGen, sigB, Bool.false_eq_true, ↓reduceIte, one_mul]
      congr 4; push_cast; rw [add_mul, Complex.exp_add, Complex.exp_pi_mul_I]; ring
    calc ∫ θ in (Real.pi / 2)..(-(Real.pi / 2) + 2 * Real.pi), gFGen F G R (rhoQ : ℝ) false θ
        = ∫ θ in (-(Real.pi / 2) + Real.pi)..(Real.pi / 2 + Real.pi), gFGen F G R (rhoQ : ℝ) false θ := by
          congr 1 <;> ring
      _ = ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), gFGen F G R (rhoQ : ℝ) false (θ + Real.pi) :=
          (intervalIntegral.integral_comp_add_right (gFGen F G R (rhoQ : ℝ) false) Real.pi).symm
      _ = ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), gFGen F G R (rhoQ : ℝ) true θ := by simp only [e]
  rw [hsecond, inv_mul_le_iff₀ (by positivity)]
  have hsum : ((a + b + c + d : ℤ) : ℝ) / D ≤ 2 * (piLo20Q : ℝ) * (budgetQ : ℝ) := by
    rw [div_le_iff₀ hD]
    have h1 : ((a + b + c + d : ℤ) : ℝ) ≤ (ofRatLo (2 * piLo20Q * budgetQ) : ℝ) := by exact_mod_cast hc
    have h2 := ofRatLo_le (2 * piLo20Q * budgetQ)
    push_cast at h2; linarith
  have hpi : (piLo20Q : ℝ) ≤ Real.pi := by
    have hp := Real.pi_gt_d20
    have heq : (piLo20Q : ℝ) = 3.14159265358979323846 := by norm_num [piLo20Q]
    linarith
  have h2pi : 2 * (piLo20Q : ℝ) * (budgetQ : ℝ) ≤ 2 * Real.pi * (budgetQ : ℝ) :=
    mul_le_mul_of_nonneg_right (by linarith) hB0
  have habcd : ((a + b : ℤ) : ℝ) / D + ((c + d : ℤ) : ℝ) / D = ((a + b + c + d : ℤ) : ℝ) / D := by
    push_cast; ring
  linarith

/-! ### 6. Real cross-covariance Gaussian law & `law_swap_gen` -/

namespace HardyReal

def k11 (a b : ℝ) : ℝ := 1 - a ^ 2 - b ^ 2
def k12 (a b c : ℝ) : ℝ := -(a * b + b * c)
def k22 (b c : ℝ) : ℝ := 1 - b ^ 2 - c ^ 2
def kdet (a b c : ℝ) : ℝ := k11 a b * k22 b c - k12 a b c ^ 2

def s11 (a b : ℝ) : ℝ := √(k11 a b)
def s21 (a b c : ℝ) : ℝ := k12 a b c / s11 a b
def s22 (a b c : ℝ) : ℝ := √(kdet a b c / k11 a b)

def solveS (a b c : ℝ) (d : ℝ × ℝ) : ℝ × ℝ :=
  (d.1 / s11 a b, (d.2 - s21 a b c * (d.1 / s11 a b)) / s22 a b c)
def mulS (a b c : ℝ) (w : ℝ × ℝ) : ℝ × ℝ :=
  (s11 a b * w.1, s21 a b c * w.1 + s22 a b c * w.2)
def mulR (a b c : ℝ) (x : ℝ × ℝ) : ℝ × ℝ := (a * x.1 + b * x.2, b * x.1 + c * x.2)
def qf (p q r : ℝ) (u v : ℝ × ℝ) : ℝ := p * u.1 * v.1 + q * (u.1 * v.2 + u.2 * v.1) + r * u.2 * v.2

section Alg
variable {a b c : ℝ}

lemma s11_sq (h : 0 < k11 a b) : s11 a b ^ 2 = k11 a b := Real.sq_sqrt h.le
lemma s22_sq (h : 0 < k11 a b) (hd : 0 < kdet a b c) : s22 a b c ^ 2 = kdet a b c / k11 a b :=
  Real.sq_sqrt (div_pos hd h).le
lemma s11_pos (h : 0 < k11 a b) : 0 < s11 a b := Real.sqrt_pos.2 h
lemma s22_pos (h : 0 < k11 a b) (hd : 0 < kdet a b c) : 0 < s22 a b c :=
  Real.sqrt_pos.2 (div_pos hd h)

lemma detS_sq (h : 0 < k11 a b) (hd : 0 < kdet a b c) : (s11 a b * s22 a b c) ^ 2 = kdet a b c := by
  rw [mul_pow, s11_sq h, s22_sq h hd]; field_simp

lemma solveS_mulS (h : 0 < k11 a b) (hd : 0 < kdet a b c) (w : ℝ × ℝ) :
    solveS a b c (mulS a b c w) = w := by
  have h1 := (s11_pos h).ne'; have h2 := (s22_pos h hd).ne'
  ext <;> simp [mulS, solveS] <;> field_simp; ring

lemma solveS_fst_sq (h : 0 < k11 a b) (d : ℝ × ℝ) : (solveS a b c d).1 ^ 2 = d.1 ^ 2 / k11 a b := by
  simp only [solveS, div_pow, s11_sq h]

lemma solveS_snd_sq (h : 0 < k11 a b) (hd : 0 < kdet a b c) (d : ℝ × ℝ) :
    (solveS a b c d).2 ^ 2 = (d.2 - k12 a b c * d.1 / k11 a b) ^ 2 * k11 a b / kdet a b c := by
  have h1 := (s11_pos h).ne'
  have e : s21 a b c * (d.1 / s11 a b) = k12 a b c * d.1 / k11 a b := by
    rw [s21, ← s11_sq h]; field_simp
  simp only [solveS, e, div_pow, s22_sq h hd]; field_simp

theorem chol_quad (h : 0 < k11 a b) (hd : 0 < kdet a b c) (x y : ℝ × ℝ) :
    x.1 ^ 2 + x.2 ^ 2 + (solveS a b c (y - mulR a b c x)).1 ^ 2 +
        (solveS a b c (y - mulR a b c x)).2 ^ 2 =
      (qf (k22 b c) (-k12 a b c) (k11 a b) x x + qf (k22 b c) (-k12 a b c) (k11 a b) y y -
        2 * qf (a * k22 b c - b * k12 a b c) (-(a * k12 a b c) + b * k11 a b)
          (-(b * k12 a b c) + c * k11 a b) x y) / kdet a b c := by
  rw [solveS_fst_sq h, solveS_snd_sq h hd]
  have hk := h.ne'; have hdk := hd.ne'
  rw [eq_div_iff hdk]; field_simp
  simp only [qf, mulR, kdet, k11, k12, k22, Prod.fst_sub, Prod.snd_sub]; ring

end Alg

def Rre (a b c : ℝ) : Sym2C := ⟨a, b, c⟩

lemma detIm_real {a b c : ℝ} : (Rre a b c).detIm = (kdet a b c : ℂ) := by
  simp only [Sym2C.detIm, Sym2C.sq, Rre, kdet, k11, k12, k22]; push_cast; ring

theorem kExp_real {a b c : ℝ} (h : 0 < k11 a b) (hd : 0 < kdet a b c) (x y : ℝ × ℝ) :
    kExp (Rre a b c) x y = ((-(x.1 ^ 2 + x.2 ^ 2 + (solveS a b c (y - mulR a b c x)).1 ^ 2 +
      (solveS a b c (y - mulR a b c x)).2 ^ 2) / 2 : ℝ) : ℂ) := by
  rw [chol_quad h hd]
  have hdc : (kdet a b c : ℂ) ≠ 0 := by exact_mod_cast hd.ne'
  have e : (Rre a b c).detIm = (kdet a b c : ℂ) := detIm_real
  simp only [kExp, Sym2C.Amat, Sym2C.Cmat, Sym2C.form, e]
  simp only [Sym2C.sq, Rre, qf, kdet, k11, k12, k22] at hdc ⊢
  push_cast; field_simp; ring

def phi2 (x : ℝ × ℝ) : ℝ := gaussianPDFReal 0 1 x.1 * gaussianPDFReal 0 1 x.2

lemma phi2_nonneg (x : ℝ × ℝ) : 0 ≤ phi2 x :=
  mul_nonneg (gaussianPDFReal_nonneg _ _ _) (gaussianPDFReal_nonneg _ _ _)

@[fun_prop] lemma measurable_phi2 : Measurable phi2 := by unfold phi2; fun_prop

def shuffle {α : Type*} (q : (α × α) × (α × α)) : (α × α) × (α × α) :=
  ((q.1.1, q.2.1), (q.1.2, q.2.2))

lemma measurePreserving_shuffle_prod {α : Type*} [MeasurableSpace α] (μ : Measure α) [SigmaFinite μ] :
    MeasurePreserving (shuffle : (α × α) × (α × α) → _)
      ((μ.prod μ).prod (μ.prod μ)) ((μ.prod μ).prod (μ.prod μ)) := by
  have h1 := measurePreserving_prodAssoc μ μ (μ.prod μ)
  have h2 := measurePreserving_prodAssoc μ μ μ
  have hsw := (Measure.measurePreserving_swap (μ := μ) (ν := μ)).prod (MeasurePreserving.id μ)
  have inner := (h2.comp hsw).comp h2.symm
  have h3 := (MeasurePreserving.id μ).prod inner
  have h4 := measurePreserving_prodAssoc μ μ (μ.prod μ)
  convert (h4.symm.comp h3).comp h1 using 1; ext _ <;> rfl

lemma gauss2_eq_withDensity : gauss2 = volume.withDensity fun p => ENNReal.ofReal (phi2 p) := by
  rw [gauss2, gaussianReal_of_var_ne_zero 0 one_ne_zero,
    MeasureTheory.prod_withDensity (measurable_gaussianPDF 0 1) (measurable_gaussianPDF 0 1),
    ← Measure.volume_eq_prod]
  congr 1; ext p
  simp only [phi2, gaussianPDF, ENNReal.ofReal_mul (gaussianPDFReal_nonneg _ _ _)]

lemma mu2_eq_map : mu2 = (gauss2.prod gauss2).map fun q => toC2 q.1 q.2 := by
  have hm : Measurable (Prod.map toC' toC') := measurable_toC'.prodMap measurable_toC'
  have hs := measurePreserving_shuffle_prod (gaussianReal 0 1)
  rw [mu2, gaussC_eq_map_gauss2, Measure.map_prod_map _ _ measurable_toC' measurable_toC']
  have e : gauss2.prod gauss2 = (gauss2.prod gauss2).map shuffle := hs.map_eq.symm
  conv_lhs => rw [e]
  rw [Measure.map_map hm hs.measurable]; rfl

theorem integral_mu2_eq {g : ℂ × ℂ → ℂ} (hg : AEStronglyMeasurable g mu2) :
    ∫ u, g u ∂mu2 = ∫ q : (ℝ × ℝ) × (ℝ × ℝ), ((phi2 q.1 * phi2 q.2 : ℝ) : ℂ) * g (toC2 q.1 q.2) := by
  have hmeas : Measurable fun q : (ℝ × ℝ) × (ℝ × ℝ) => toC2 q.1 q.2 := by unfold toC2; fun_prop
  rw [mu2_eq_map] at hg ⊢
  rw [integral_map hmeas.aemeasurable hg, gauss2_eq_withDensity,
    MeasureTheory.prod_withDensity (by unfold phi2; fun_prop) (by unfold phi2; fun_prop),
    integral_withDensity_eq_integral_toReal_smul (by fun_prop)
      (Filter.Eventually.of_forall fun _ => ENNReal.mul_lt_top ENNReal.ofReal_lt_top ENNReal.ofReal_lt_top),
    ← Measure.volume_eq_prod]
  congr 1; ext q
  rw [ENNReal.toReal_mul, ENNReal.toReal_ofReal (phi2_nonneg _), ENNReal.toReal_ofReal (phi2_nonneg _),
    Complex.real_smul]

def linS (a b c : ℝ) : (ℝ × ℝ) →ₗ[ℝ] (ℝ × ℝ) where
  toFun := mulS a b c
  map_add' u v := by ext <;> simp [mulS] <;> ring
  map_smul' r u := by ext <;> simp [mulS] <;> ring

lemma det_linS {a b c : ℝ} : LinearMap.det (linS a b c) = s11 a b * s22 a b c := by
  rw [← LinearMap.det_toMatrix (Module.Basis.finTwoProd ℝ), Matrix.det_fin_two]
  simp [LinearMap.toMatrix_apply, linS, mulS, Module.Basis.finTwoProd, LinearEquiv.finTwoArrow]

lemma measurable_solveS {a b c : ℝ} : Measurable (solveS a b c) := by unfold solveS; fun_prop
lemma measurable_mulR {a b c : ℝ} : Measurable (mulR a b c) := by unfold mulR; fun_prop

abbrev Pt4 := (ℝ × ℝ) × (ℝ × ℝ)

def psi (q : Pt4) : ℝ := phi2 q.1 * phi2 q.2
lemma psi_nonneg (q : Pt4) : 0 ≤ psi q := mul_nonneg (phi2_nonneg _) (phi2_nonneg _)
@[fun_prop] lemma measurable_psi : Measurable psi := by unfold psi; fun_prop

instance : (volume : Measure Pt4).IsAddHaarMeasure := by
  rw [Measure.volume_eq_prod]; infer_instance

def mulS4 (a b c : ℝ) (r : Pt4) : Pt4 := (mulS a b c r.1, mulS a b c r.2)
def mulR4 (a b c : ℝ) (p : Pt4) : Pt4 := (mulR a b c p.1, mulR a b c p.2)
def solve4 (a b c : ℝ) (s : Pt4) : Pt4 := (solveS a b c s.1, solveS a b c s.2)

@[fun_prop] lemma measurable_solve4 {a b c : ℝ} : Measurable (solve4 a b c) := by
  unfold solve4
  exact (measurable_solveS.comp measurable_fst).prodMk (measurable_solveS.comp measurable_snd)

@[fun_prop] lemma measurable_mulR4 {a b c : ℝ} : Measurable (mulR4 a b c) := by
  unfold mulR4
  exact (measurable_mulR.comp measurable_fst).prodMk (measurable_mulR.comp measurable_snd)

def linS4 (a b c : ℝ) : Pt4 →ₗ[ℝ] Pt4 := (linS a b c).prodMap (linS a b c)

lemma det_linS4 {a b c : ℝ} : LinearMap.det (linS4 a b c) = (s11 a b * s22 a b c) ^ 2 := by
  rw [linS4, LinearMap.det_prodMap, det_linS, sq]

theorem integral_subst4 {a b c : ℝ} (h : 0 < k11 a b) (hd : 0 < kdet a b c) (p : Pt4)
    {g : Pt4 → ℂ} (hg : Measurable g) :
    ∫ r : Pt4, (psi r : ℂ) * g (mulR4 a b c p + mulS4 a b c r) =
      (((s11 a b * s22 a b c) ^ 2)⁻¹ : ℝ) *
        ∫ s : Pt4, (psi (solve4 a b c (s - mulR4 a b c p)) : ℂ) * g s := by
  have hpos : 0 < (s11 a b * s22 a b c) ^ 2 := pow_pos (mul_pos (s11_pos h) (s22_pos h hd)) 2
  have hdet : LinearMap.det (linS4 a b c) ≠ 0 := by rw [det_linS4]; exact hpos.ne'
  set G : Pt4 → ℂ := fun v => (psi (solve4 a b c v) : ℂ) * g (mulR4 a b c p + v) with hG
  have e1 : (fun r => (psi r : ℂ) * g (mulR4 a b c p + mulS4 a b c r)) =
      fun r => G (linS4 a b c r) := by
    ext r
    simp only [hG, linS4, LinearMap.prodMap_apply, linS, LinearMap.coe_mk, AddHom.coe_mk, solve4,
      solveS_mulS h hd, mulS4]
  have hmap := Measure.map_linearMap_addHaar_eq_smul_addHaar (volume : Measure Pt4) hdet
  have e2 : ∫ r, G (linS4 a b c r) = (((s11 a b * s22 a b c) ^ 2)⁻¹ : ℝ) * ∫ v, G v := by
    have hm : Measurable (linS4 a b c) := (linS4 a b c).continuous_of_finiteDimensional.measurable
    have hGm : AEStronglyMeasurable G (Measure.map (linS4 a b c) volume) :=
      ((measurable_psi.comp measurable_solve4).complex_ofReal.mul
        (hg.comp (measurable_const_add _))).aestronglyMeasurable
    rw [← integral_map hm.aemeasurable hGm, hmap, MeasureTheory.integral_smul_measure, det_linS4,
      ENNReal.toReal_ofReal (abs_nonneg _), abs_of_pos (inv_pos.2 hpos), Complex.real_smul]
  rw [e1, e2]; refine congrArg (_ * ·) ?_
  rw [← integral_add_right_eq_self (μ := volume)
    (fun s => (psi (solve4 a b c (s - mulR4 a b c p)) : ℂ) * g s) (mulR4 a b c p)]
  refine congrArg (integral _) ?_; ext v; rw [add_sub_cancel_right, add_comm v (mulR4 a b c p)]

lemma integral_psi : ∫ q : Pt4, (psi q : ℂ) = 1 := by
  have h := integral_mu2_eq (g := fun _ => (1 : ℂ)) aestronglyMeasurable_const
  rw [MeasureTheory.integral_const, probReal_univ, one_smul] at h
  simpa [psi] using h.symm

def mulRc (a b c : ℝ) (u : ℂ × ℂ) : ℂ × ℂ := ((a : ℂ) * u.1 + b * u.2, (b : ℂ) * u.1 + c * u.2)
def mulSc (a b c : ℝ) (w : ℂ × ℂ) : ℂ × ℂ :=
  ((s11 a b : ℂ) * w.1, (s21 a b c : ℂ) * w.1 + (s22 a b c : ℂ) * w.2)

lemma toC2_affine {a b c : ℝ} (p r : Pt4) :
    mulRc a b c (toC2 p.1 p.2) + mulSc a b c (toC2 r.1 r.2) =
      toC2 (mulR4 a b c p + mulS4 a b c r).1 (mulR4 a b c p + mulS4 a b c r).2 := by
  simp only [toC2, mulRc, mulSc, mulR4, mulS4, mulR, mulS, Prod.mk_add_mk]
  ext <;> push_cast <;> ring

lemma phi2_eq (u : ℝ × ℝ) : phi2 u = (2 * Real.pi)⁻¹ * Real.exp (-(u.1 ^ 2 + u.2 ^ 2) / 2) :=
  gaussianPDFReal_mul u.1 u.2

theorem kHol_real {a b c : ℝ} (h : 0 < k11 a b) (hd : 0 < kdet a b c) (p s : Pt4) :
    kHol (Rre a b c) p.1 p.2 s.1 s.2 =
      ((psi p * psi (solve4 a b c (s - mulR4 a b c p)) / (s11 a b * s22 a b c) ^ 2 : ℝ) : ℂ) := by
  have key : ((2 * Real.pi) ^ 4)⁻¹ * (kdet a b c)⁻¹ *
      Real.exp (-(p.1.1 ^ 2 + p.1.2 ^ 2 + (solveS a b c (s.1 - mulR a b c p.1)).1 ^ 2
          + (solveS a b c (s.1 - mulR a b c p.1)).2 ^ 2) / 2
        + -(p.2.1 ^ 2 + p.2.2 ^ 2 + (solveS a b c (s.2 - mulR a b c p.2)).1 ^ 2
          + (solveS a b c (s.2 - mulR a b c p.2)).2 ^ 2) / 2) =
      psi p * psi (solve4 a b c (s - mulR4 a b c p)) / (s11 a b * s22 a b c) ^ 2 := by
    rw [detS_sq h hd]
    simp only [psi, phi2_eq, solve4, mulR4, Prod.fst_sub, Prod.snd_sub]
    rw [div_eq_mul_inv]
    have e : ∀ u v w z : ℝ, Real.exp u * Real.exp v * (Real.exp w * Real.exp z) =
        Real.exp (u + v + (w + z)) := fun _ _ _ _ => by rw [Real.exp_add, Real.exp_add, Real.exp_add]
    calc _ = ((2 * Real.pi) ^ 4)⁻¹ * (kdet a b c)⁻¹ * Real.exp (-(p.1.1 ^ 2 + p.1.2 ^ 2) / 2
            + -(p.2.1 ^ 2 + p.2.2 ^ 2) / 2 + (-((solveS a b c (s.1 - mulR a b c p.1)).1 ^ 2
            + (solveS a b c (s.1 - mulR a b c p.1)).2 ^ 2) / 2 + -((solveS a b c (s.2 - mulR a b c p.2)).1 ^ 2
            + (solveS a b c (s.2 - mulR a b c p.2)).2 ^ 2) / 2)) := by congr 2; ring
      _ = _ := by rw [← e]; ring
  rw [kHol, detIm_real, kExp_real h hd, kExp_real h hd, ← key]; push_cast; ring

lemma integrable_phi2 : Integrable phi2 := by
  have h := (ProbabilityTheory.integrable_gaussianPDFReal 0 1).mul_prod
    (ProbabilityTheory.integrable_gaussianPDFReal 0 1)
  rwa [← Measure.volume_eq_prod] at h

lemma integrable_psi : Integrable psi := by
  have h := integrable_phi2.mul_prod integrable_phi2
  rwa [← Measure.volume_eq_prod] at h

lemma solve4_linS4 {a b c : ℝ} (h : 0 < k11 a b) (hd : 0 < kdet a b c) (r : Pt4) :
    solve4 a b c (linS4 a b c r) = r := by
  simp only [linS4, LinearMap.prodMap_apply, linS, LinearMap.coe_mk, AddHom.coe_mk, solve4,
    solveS_mulS h hd]

lemma integrable_psi_solve4 {a b c : ℝ} (h : 0 < k11 a b) (hd : 0 < kdet a b c) :
    Integrable fun v => psi (solve4 a b c v) := by
  have hpos : 0 < (s11 a b * s22 a b c) ^ 2 := pow_pos (mul_pos (s11_pos h) (s22_pos h hd)) 2
  have hdet : LinearMap.det (linS4 a b c) ≠ 0 := by rw [det_linS4]; exact hpos.ne'
  have hm : Measurable (linS4 a b c) := (linS4 a b c).continuous_of_finiteDimensional.measurable
  have h1 : Integrable (fun r => psi (solve4 a b c (linS4 a b c r))) := by
    simpa only [solve4_linS4 h hd] using integrable_psi
  have h2 : Integrable (fun v => psi (solve4 a b c v)) (Measure.map (linS4 a b c) volume) :=
    (integrable_map_measure (g := fun v => psi (solve4 a b c v))
      (measurable_psi.comp measurable_solve4).aestronglyMeasurable hm.aemeasurable).2 h1
  rw [Measure.map_linearMap_addHaar_eq_smul_addHaar (volume : Measure Pt4) hdet] at h2
  have hκ : ENNReal.ofReal |(LinearMap.det (linS4 a b c))⁻¹| ≠ 0 := by
    rw [ne_eq, ENNReal.ofReal_eq_zero, not_le]; exact abs_pos.2 (inv_ne_zero hdet)
  have := h2.smul_measure (c := (ENNReal.ofReal |(LinearMap.det (linS4 a b c))⁻¹|)⁻¹)
    (ENNReal.inv_ne_top.2 hκ)
  rwa [smul_smul, ENNReal.inv_mul_cancel hκ ENNReal.ofReal_ne_top, one_smul] at this

lemma integral_psi_solve4 {a b c : ℝ} (h : 0 < k11 a b) (hd : 0 < kdet a b c) (p : Pt4) :
    ∫ s : Pt4, psi (solve4 a b c (s - mulR4 a b c p)) = (s11 a b * s22 a b c) ^ 2 := by
  have hpos : 0 < (s11 a b * s22 a b c) ^ 2 := pow_pos (mul_pos (s11_pos h) (s22_pos h hd)) 2
  have e := integral_subst4 h hd p (g := fun _ => (1 : ℂ)) measurable_const
  simp only [mul_one] at e
  rw [integral_psi, integral_complex_ofReal] at e
  have e2 : (1 : ℂ) =
      ((((s11 a b * s22 a b c) ^ 2)⁻¹ * ∫ s : Pt4, psi (solve4 a b c (s - mulR4 a b c p)) : ℝ) : ℂ) := by
    rw [e]; push_cast; ring
  have e3 : ((s11 a b * s22 a b c) ^ 2)⁻¹ *
      ∫ s : Pt4, psi (solve4 a b c (s - mulR4 a b c p)) = 1 := by exact_mod_cast e2.symm
  exact ((inv_mul_eq_one₀ hpos.ne').1 e3).symm

def dens (a b c : ℝ) (q : Pt4 × Pt4) : ℝ :=
  psi q.1 * psi (solve4 a b c (q.2 - mulR4 a b c q.1)) / (s11 a b * s22 a b c) ^ 2

lemma dens_nonneg {a b c : ℝ} (q : Pt4 × Pt4) : 0 ≤ dens a b c q :=
  div_nonneg (mul_nonneg (psi_nonneg _) (psi_nonneg _)) (sq_nonneg _)

@[fun_prop] lemma measurable_dens {a b c : ℝ} : Measurable (dens a b c) := by
  unfold dens
  exact ((measurable_psi.comp measurable_fst).mul (measurable_psi.comp (measurable_solve4.comp
    (measurable_snd.sub (measurable_mulR4.comp measurable_fst))))).div_const _

lemma integrable_dens {a b c : ℝ} (h : 0 < k11 a b) (hd : 0 < kdet a b c) :
    Integrable (dens a b c) ((volume : Measure Pt4).prod (volume : Measure Pt4)) := by
  have hpos : 0 < (s11 a b * s22 a b c) ^ 2 := pow_pos (mul_pos (s11_pos h) (s22_pos h hd)) 2
  rw [integrable_prod_iff measurable_dens.aestronglyMeasurable]
  refine ⟨Filter.Eventually.of_forall fun p => ?_, ?_⟩
  · exact (((integrable_psi_solve4 h hd).comp_sub_right (mulR4 a b c p)).const_mul
      (psi p / (s11 a b * s22 a b c) ^ 2)).congr (Filter.Eventually.of_forall fun _ => by
        simp only [dens]; ring)
  · refine integrable_psi.congr (Filter.Eventually.of_forall fun p => ?_)
    have e : (fun s : Pt4 => ‖dens a b c (p, s)‖) =
        fun s => psi p / (s11 a b * s22 a b c) ^ 2 * psi (solve4 a b c (s - mulR4 a b c p)) := by
      ext s; rw [Real.norm_eq_abs, abs_of_nonneg (dens_nonneg _)]; simp only [dens]; ring
    show psi p = ∫ s, ‖dens a b c (p, s)‖
    rw [e, MeasureTheory.integral_const_mul, integral_psi_solve4 h hd p, div_mul_cancel₀ _ hpos.ne']

theorem integral_pair_eq_kHol {a b c : ℝ} (h : 0 < k11 a b) (hd : 0 < kdet a b c)
    {f : (ℂ × ℂ) × (ℂ × ℂ) → ℂ} (hf : Measurable f) {C : ℝ} (hC : ∀ z, ‖f z‖ ≤ C) :
    ∫ u, (∫ w, f (u, mulRc a b c u + mulSc a b c w) ∂mu2) ∂mu2 =
      ∫ q : Pt8, f (toC2 q.1.1 q.1.2, toC2 q.2.1 q.2.2) * kHol (Rre a b c) q.1.1 q.1.2 q.2.1 q.2.2 := by
  have hRc : Measurable (mulRc a b c) := by unfold mulRc; fun_prop
  have hSc : Measurable (mulSc a b c) := by unfold mulSc; fun_prop
  have hF2 : Measurable fun z : (ℂ × ℂ) × (ℂ × ℂ) => f (z.1, mulRc a b c z.1 + mulSc a b c z.2) :=
    hf.comp (measurable_fst.prodMk ((hRc.comp measurable_fst).add (hSc.comp measurable_snd)))
  have inner : ∀ p : Pt4, ∫ w, f (toC2 p.1 p.2, mulRc a b c (toC2 p.1 p.2) + mulSc a b c w) ∂mu2 =
      (((s11 a b * s22 a b c) ^ 2)⁻¹ : ℝ) *
        ∫ s : Pt4, (psi (solve4 a b c (s - mulR4 a b c p)) : ℂ) * f (toC2 p.1 p.2, toC2 s.1 s.2) := by
    intro p
    rw [integral_mu2_eq (g := fun w => f (toC2 p.1 p.2, mulRc a b c (toC2 p.1 p.2) + mulSc a b c w))
      ((hf.comp (measurable_const.prodMk (measurable_const.add hSc))).aestronglyMeasurable)]
    simp only [toC2_affine]
    exact integral_subst4 h hd p (g := fun s => f (toC2 p.1 p.2, toC2 s.1 s.2))
      (hf.comp (measurable_const.prodMk (by unfold toC2; fun_prop)))
  have houter : AEStronglyMeasurable (fun u => ∫ w, f (u, mulRc a b c u + mulSc a b c w) ∂mu2) mu2 :=
    (StronglyMeasurable.integral_prod_right' hF2.stronglyMeasurable).aestronglyMeasurable
  rw [integral_mu2_eq houter]
  have hmeasF : Measurable fun q : Pt4 × Pt4 => f (toC2 q.1.1 q.1.2, toC2 q.2.1 q.2.2) :=
    hf.comp (by unfold toC2; fun_prop)
  have hint : Integrable (fun q : Pt4 × Pt4 => (dens a b c q : ℂ) * f (toC2 q.1.1 q.1.2, toC2 q.2.1 q.2.2))
      ((volume : Measure Pt4).prod volume) := by
    refine ((integrable_dens h hd).mul_const C).mono'
      ((measurable_dens.complex_ofReal.mul hmeasF).aestronglyMeasurable)
      (Filter.Eventually.of_forall fun q => ?_)
    rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (dens_nonneg q)]
    exact mul_le_mul_of_nonneg_left (hC _) (dens_nonneg q)
  have hR : ∫ q : Pt8, f (toC2 q.1.1 q.1.2, toC2 q.2.1 q.2.2) * kHol (Rre a b c) q.1.1 q.1.2 q.2.1 q.2.2 =
      ∫ q : Pt4 × Pt4, (dens a b c q : ℂ) * f (toC2 q.1.1 q.1.2, toC2 q.2.1 q.2.2) ∂(volume.prod volume) := by
    rw [← Measure.volume_eq_prod]; congr 1; ext q
    rw [kHol_real h hd q.1 q.2, dens, mul_comm]
  rw [hR, integral_prod _ hint]; congr 1; ext p
  rw [inner p, ← mul_assoc, ← MeasureTheory.integral_const_mul]; congr 1; ext s
  simp only [dens, psi]; push_cast; ring

def covMehler (m00 m01 m11 n00 n01 n11 p q σ₁ σ₂ : ℝ) (α : Fin 4 → ℝ) : ℝ :=
  (m00 * α 0 + m01 * α 1 + m00 * p * α 2 + m01 * p * α 3) ^ 2 +
  (m01 * α 0 + m11 * α 1 + m01 * q * α 2 + m11 * q * α 3) ^ 2 +
  (m00 * σ₁ * α 2 + m01 * σ₁ * α 3) ^ 2 +
  (m01 * σ₂ * α 2 + m11 * σ₂ * α 3) ^ 2 +
  (n00 * α 0 + n01 * α 1) ^ 2 + (n01 * α 0 + n11 * α 1) ^ 2 +
  (n00 * α 2 + n01 * α 3) ^ 2 + (n01 * α 2 + n11 * α 3) ^ 2

def covPair (a b c : ℝ) (α : Fin 4 → ℝ) : ℝ :=
  (α 0 + a * α 2 + b * α 3) ^ 2 + (α 1 + b * α 2 + c * α 3) ^ 2 +
  (s11 a b * α 2 + s21 a b c * α 3) ^ 2 + (s22 a b c * α 3) ^ 2

theorem cov_eq {m00 m01 m11 n00 n01 n11 p q σ₁ σ₂ : ℝ}
    (hM00 : m00 ^ 2 + m01 ^ 2 + n00 ^ 2 + n01 ^ 2 = 1)
    (hM01 : m00 * m01 + m01 * m11 + n00 * n01 + n01 * n11 = 0)
    (hM11 : m01 ^ 2 + m11 ^ 2 + n01 ^ 2 + n11 ^ 2 = 1)
    (hσ₁ : σ₁ ^ 2 = 1 - p ^ 2) (hσ₂ : σ₂ ^ 2 = 1 - q ^ 2)
    {a b c : ℝ} (ha : a = m00 ^ 2 * p + m01 ^ 2 * q) (hb : b = m00 * m01 * p + m01 * m11 * q)
    (hc : c = m01 ^ 2 * p + m11 ^ 2 * q) (h : 0 < k11 a b) (hd : 0 < kdet a b c) (α : Fin 4 → ℝ) :
    covMehler m00 m01 m11 n00 n01 n11 p q σ₁ σ₂ α = covPair a b c α := by
  have e11 := s11_sq h; have e22 := s22_sq h hd; have h1 := (s11_pos h).ne'
  have e21 : s11 a b * s21 a b c = k12 a b c := by rw [s21]; field_simp
  have e2122 : s21 a b c ^ 2 + s22 a b c ^ 2 = k22 b c := by
    rw [e22, s21, div_pow, e11]; field_simp; simp only [kdet]; ring
  simp only [covMehler, covPair]
  have key : (s11 a b * α 2 + s21 a b c * α 3) ^ 2 + (s22 a b c * α 3) ^ 2 =
      k11 a b * α 2 ^ 2 + 2 * k12 a b c * α 2 * α 3 + k22 b c * α 3 ^ 2 := by
    linear_combination α 2 ^ 2 * e11 + 2 * α 2 * α 3 * e21 + α 3 ^ 2 * e2122
  simp only [k11, k12, k22] at key
  subst ha hb hc
  linear_combination -key + (α 0 ^ 2 + α 2 ^ 2) * hM00 + 2 * (α 0 * α 1 + α 2 * α 3) * hM01 +
    (α 1 ^ 2 + α 3 ^ 2) * hM11 + (m00 * α 2 + m01 * α 3) ^ 2 * hσ₁ +
    (m01 * α 2 + m11 * α 3) ^ 2 * hσ₂

def Qform (ℓ : StrongDual ℝ ℂ) : ℝ := ℓ 1 ^ 2 + ℓ I ^ 2

lemma charFunDual_mu2 (L : StrongDual ℝ (ℂ × ℂ)) :
    charFunDual mu2 L =
      Complex.exp (-((Qform (L.comp (.inl ℝ ℂ ℂ)) + Qform (L.comp (.inr ℝ ℂ ℂ)) : ℝ) : ℂ) / 4) := by
  rw [show mu2 = gaussC.prod gaussC from rfl, charFunDual_prod, charFunDual_gaussC, charFunDual_gaussC,
    ← Complex.exp_add, Qform, Qform]
  congr 1; push_cast; ring

lemma charFunDual_mu2prod (L : StrongDual ℝ ((ℂ × ℂ) × (ℂ × ℂ))) :
    charFunDual (mu2.prod mu2) L = Complex.exp (-((
      Qform ((L.comp (.inl ℝ (ℂ × ℂ) (ℂ × ℂ))).comp (.inl ℝ ℂ ℂ)) +
      Qform ((L.comp (.inl ℝ (ℂ × ℂ) (ℂ × ℂ))).comp (.inr ℝ ℂ ℂ)) +
      Qform ((L.comp (.inr ℝ (ℂ × ℂ) (ℂ × ℂ))).comp (.inl ℝ ℂ ℂ)) +
      Qform ((L.comp (.inr ℝ (ℂ × ℂ) (ℂ × ℂ))).comp (.inr ℝ ℂ ℂ)) : ℝ) : ℂ) / 4) := by
  rw [charFunDual_prod (μ := mu2) (ν := mu2), charFunDual_mu2, charFunDual_mu2, ← Complex.exp_add]
  congr 1; push_cast; ring

lemma dual_ofReal_mul (ℓ : StrongDual ℝ ℂ) (r : ℝ) (z : ℂ) : ℓ ((r : ℂ) * z) = r * ℓ z := by
  rw [show (r : ℂ) * z = r • z by simp, map_smul, smul_eq_mul]

lemma dual_ofReal (ℓ : StrongDual ℝ ℂ) (r : ℝ) : ℓ (r : ℂ) = r * ℓ 1 := by
  rw [← dual_ofReal_mul, mul_one]

def Lc (L : StrongDual ℝ ((ℂ × ℂ) × (ℂ × ℂ))) (j : Fin 4) : StrongDual ℝ ℂ :=
  match j with
  | 0 => (L.comp (.inl ℝ (ℂ × ℂ) (ℂ × ℂ))).comp (.inl ℝ ℂ ℂ)
  | 1 => (L.comp (.inl ℝ (ℂ × ℂ) (ℂ × ℂ))).comp (.inr ℝ ℂ ℂ)
  | 2 => (L.comp (.inr ℝ (ℂ × ℂ) (ℂ × ℂ))).comp (.inl ℝ ℂ ℂ)
  | 3 => (L.comp (.inr ℝ (ℂ × ℂ) (ℂ × ℂ))).comp (.inr ℝ ℂ ℂ)

lemma L_apply (L : StrongDual ℝ ((ℂ × ℂ) × (ℂ × ℂ))) (z : (ℂ × ℂ) × (ℂ × ℂ)) :
    L z = Lc L 0 z.1.1 + Lc L 1 z.1.2 + Lc L 2 z.2.1 + Lc L 3 z.2.2 := by
  have : z = ((z.1.1, 0), (0, 0)) + ((0, z.1.2), (0, 0)) +
      ((0, 0), (z.2.1, 0)) + ((0, 0), (0, z.2.2)) := by ext <;> simp
  conv_lhs => rw [this]
  simp only [map_add, Lc, ContinuousLinearMap.comp_apply, ContinuousLinearMap.inl_apply,
    ContinuousLinearMap.inr_apply]
  rfl

def mehlerPairGen (m00 m01 m11 n00 n01 n11 p q : ℝ) :
    ((ℂ × ℂ) × (ℂ × ℂ)) × ((ℂ × ℂ) × (ℂ × ℂ)) →L[ℝ] (ℂ × ℂ) × (ℂ × ℂ) :=
  LinearMap.toContinuousLinearMap
    { toFun := fun v => (smoothSym m00 m01 m11 n00 n01 n11 (Xof v.1) v.2.1,
                         smoothSym m00 m01 m11 n00 n01 n11 (Yof p q v.1) v.2.2)
      map_add' := fun u v => by
        simp only [smoothSym, Xof, Yof, mY, Prod.fst_add, Prod.snd_add, Prod.mk_add_mk]
        ext <;> simp <;> ring
      map_smul' := fun r v => by
        simp only [smoothSym, Xof, Yof, mY, Prod.smul_fst, Prod.smul_snd, Prod.smul_mk,
          RingHom.id_apply]
        ext <;> simp <;> ring }

def pairMap (a b c : ℝ) : (ℂ × ℂ) × (ℂ × ℂ) →L[ℝ] (ℂ × ℂ) × (ℂ × ℂ) :=
  LinearMap.toContinuousLinearMap
    { toFun := fun v => (v.1, mulRc a b c v.1 + mulSc a b c v.2)
      map_add' := fun _ _ => by
        simp only [mulRc, mulSc, Prod.fst_add, Prod.snd_add, Prod.mk_add_mk]; ext <;> simp <;> ring
      map_smul' := fun _ _ => by
        simp only [mulRc, mulSc, Prod.smul_fst, Prod.smul_snd, Prod.smul_mk, RingHom.id_apply]
        ext <;> simp <;> ring }

theorem law_swap_gen {m00 m01 m11 n00 n01 n11 p q : ℝ}
    (hM00 : m00 ^ 2 + m01 ^ 2 + n00 ^ 2 + n01 ^ 2 = 1)
    (hM01 : m00 * m01 + m01 * m11 + n00 * n01 + n01 * n11 = 0)
    (hM11 : m01 ^ 2 + m11 ^ 2 + n01 ^ 2 + n11 ^ 2 = 1)
    (hp : |p| ≤ 1) (hq : |q| ≤ 1) {a b c : ℝ}
    (ha : a = m00 ^ 2 * p + m01 ^ 2 * q) (hb : b = m00 * m01 * p + m01 * m11 * q)
    (hc : c = m01 ^ 2 * p + m11 ^ 2 * q) (h : 0 < k11 a b) (hd : 0 < kdet a b c) :
    (mu4.prod (mu2.prod mu2)).map (mehlerPairGen m00 m01 m11 n00 n01 n11 p q) =
      (mu2.prod mu2).map (pairMap a b c) := by
  have hσ₁ : √(1 - p ^ 2) ^ 2 = 1 - p ^ 2 := Real.sq_sqrt (by nlinarith [abs_le.1 hp, sq_abs p])
  have hσ₂ : √(1 - q ^ 2) ^ 2 = 1 - q ^ 2 := Real.sq_sqrt (by nlinarith [abs_le.1 hq, sq_abs q])
  have hs₁ : Grothe.Upper.sig (p : ℂ) = ((√(1 - p ^ 2) : ℝ) : ℂ) := by
    simp [Grothe.Upper.sig, Complex.norm_real, sq_abs]
  have hs₂ : Grothe.Upper.sig (q : ℂ) = ((√(1 - q ^ 2) : ℝ) : ℂ) := by
    simp [Grothe.Upper.sig, Complex.norm_real, sq_abs]
  apply Measure.ext_of_charFunDual
  ext L
  rw [charFunDual_map, charFunDual_map, charFunDual_mu2prod (L.comp (pairMap a b c)),
    charFunDual_prod (μ := mu4) (ν := mu2.prod mu2), show mu4 = mu2.prod mu2 from rfl,
    charFunDual_mu2prod, charFunDual_mu2prod, ← Complex.exp_add]
  have e1 := cov_eq hM00 hM01 hM11 hσ₁ hσ₂ ha hb hc h hd ![Lc L 0 1, Lc L 1 1, Lc L 2 1, Lc L 3 1]
  have e2 := cov_eq hM00 hM01 hM11 hσ₁ hσ₂ ha hb hc h hd ![Lc L 0 I, Lc L 1 I, Lc L 2 I, Lc L 3 I]
  simp only [covMehler, covPair, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two,
    Matrix.cons_val_three, Matrix.head_cons, Matrix.tail_cons] at e1 e2
  congr 1
  simp only [Qform, ContinuousLinearMap.comp_apply, ContinuousLinearMap.inl_apply,
    ContinuousLinearMap.inr_apply, mehlerPairGen, pairMap, LinearMap.coe_toContinuousLinearMap',
    LinearMap.coe_mk, AddHom.coe_mk, smoothSym, Xof, Yof, mY, mulRc, mulSc, hs₁, hs₂]
  simp only [L_apply]
  simp only [Prod.fst_zero, Prod.snd_zero, Prod.mk_add_mk, mul_one, mul_zero, add_zero, zero_add,
    map_zero, dual_ofReal_mul, dual_ofReal]
  rw [← add_div, ← neg_add, ← Complex.ofReal_add, div_left_inj₀ (show (4 : ℂ) ≠ 0 by norm_num),
    neg_inj, Complex.ofReal_inj]
  linear_combination e1 + e2

lemma polyKernel_real (P : ℝ[X]) {t : ℝ} (ht : 0 ≤ t) :
    polyKernel P (t : ℂ) = ((t * P.eval (t ^ 2) : ℝ) : ℂ) := by
  rw [polyKernel, Complex.norm_real, Real.norm_of_nonneg ht]; push_cast; ring

lemma abs_eval_le_l1 (P : ℝ[X]) {x : ℝ} (hx0 : 0 ≤ x) (hx1 : x ≤ 1) :
    |P.eval x| ≤ l1 P := by
  rw [Polynomial.eval_eq_sum_range, l1_eq_sum_range P (Nat.lt_succ_self _)]
  refine (abs_sum_le_sum_abs _ _).trans (sum_le_sum fun n _ => ?_)
  rw [abs_mul, abs_of_nonneg (pow_nonneg hx0 n)]
  exact mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ hx0 hx1)

lemma abs_mul_eval_le {P : ℝ[X]} (hP : l1 P ≤ 1) {t : ℝ} (ht0 : 0 ≤ t) (ht1 : t ≤ 1) :
    |t * P.eval (t ^ 2)| ≤ t := by
  rw [abs_mul, abs_of_nonneg ht0]
  have := (abs_eval_le_l1 P (sq_nonneg t) (by nlinarith)).trans hP
  nlinarith

lemma normM_le_gen {m00 m01 m11 n00 n01 n11 : ℝ}
    (hM00 : m00 ^ 2 + m01 ^ 2 + n00 ^ 2 + n01 ^ 2 = 1)
    (hM01 : m00 * m01 + m01 * m11 + n00 * n01 + n01 * n11 = 0)
    (hM11 : m01 ^ 2 + m11 ^ 2 + n01 ^ 2 + n11 ^ 2 = 1) (y₁ y₂ : ℝ) :
    (m00 * y₁ + m01 * y₂) ^ 2 + (m01 * y₁ + m11 * y₂) ^ 2 ≤ y₁ ^ 2 + y₂ ^ 2 := by
  have e : (m00 * y₁ + m01 * y₂) ^ 2 + (m01 * y₁ + m11 * y₂) ^ 2 + (n00 * y₁ + n01 * y₂) ^ 2 +
      (n01 * y₁ + n11 * y₂) ^ 2 = y₁ ^ 2 + y₂ ^ 2 := by
    linear_combination y₁ ^ 2 * hM00 + 2 * y₁ * y₂ * hM01 + y₂ ^ 2 * hM11
  nlinarith [sq_nonneg (n00 * y₁ + n01 * y₂), sq_nonneg (n01 * y₁ + n11 * y₂)]

lemma normR_le_gen {m00 m01 m11 n00 n01 n11 p q t : ℝ}
    (hM00 : m00 ^ 2 + m01 ^ 2 + n00 ^ 2 + n01 ^ 2 = 1)
    (hM01 : m00 * m01 + m01 * m11 + n00 * n01 + n01 * n11 = 0)
    (hM11 : m01 ^ 2 + m11 ^ 2 + n01 ^ 2 + n11 ^ 2 = 1)
    (hp : |p| ≤ t) (hq : |q| ≤ t) (x₁ x₂ : ℝ) :
    ((m00 ^ 2 * p + m01 ^ 2 * q) * x₁ + (m00 * m01 * p + m01 * m11 * q) * x₂) ^ 2 +
      ((m00 * m01 * p + m01 * m11 * q) * x₁ + (m01 ^ 2 * p + m11 ^ 2 * q) * x₂) ^ 2 ≤
      t ^ 2 * (x₁ ^ 2 + x₂ ^ 2) := by
  set y₁ := m00 * x₁ + m01 * x₂; set y₂ := m01 * x₁ + m11 * x₂
  have e1 : (m00 ^ 2 * p + m01 ^ 2 * q) * x₁ + (m00 * m01 * p + m01 * m11 * q) * x₂ =
      m00 * (p * y₁) + m01 * (q * y₂) := by ring
  have e2 : (m00 * m01 * p + m01 * m11 * q) * x₁ + (m01 ^ 2 * p + m11 ^ 2 * q) * x₂ =
      m01 * (p * y₁) + m11 * (q * y₂) := by ring
  rw [e1, e2]
  have h1 := normM_le_gen hM00 hM01 hM11 (p * y₁) (q * y₂)
  have h2 := normM_le_gen hM00 hM01 hM11 x₁ x₂
  have hp2 : p ^ 2 ≤ t ^ 2 := sq_le_sq' (abs_le.mp hp).1 (abs_le.mp hp).2
  have hq2 : q ^ 2 ≤ t ^ 2 := sq_le_sq' (abs_le.mp hq).1 (abs_le.mp hq).2
  have h3 : (p * y₁) ^ 2 + (q * y₂) ^ 2 ≤ t ^ 2 * (y₁ ^ 2 + y₂ ^ 2) := by
    rw [mul_pow, mul_pow]; nlinarith [sq_nonneg y₁, sq_nonneg y₂]
  have h4 : t ^ 2 * (y₁ ^ 2 + y₂ ^ 2) ≤ t ^ 2 * (x₁ ^ 2 + x₂ ^ 2) :=
    mul_le_mul_of_nonneg_left h2 (sq_nonneg t)
  linarith

lemma integrable_of_le_one {α : Type*} [MeasurableSpace α] {μ : Measure α} [IsFiniteMeasure μ]
    {f : α → ℂ} (hf : Measurable f) (h : ∀ x, ‖f x‖ ≤ 1) : Integrable f μ :=
  (integrable_const (1 : ℝ)).mono' hf.aestronglyMeasurable (Filter.Eventually.of_forall h)

end HardyReal

/-! ### 7. Master Hardy theorems `hardy_smoothed_channel` and `hardy_unsmoothed_channel` -/

lemma RtGen_real (m00 m01 m11 : ℝ) (P Q : ℝ[X]) (t : ℝ) :
    RtGen m00 m01 m11 P Q (t : ℂ) =
      HardyReal.Rre (m00 ^ 2 * (t * P.eval (t ^ 2)) + m01 ^ 2 * (t * Q.eval (t ^ 2)))
          (m00 * m01 * (t * P.eval (t ^ 2)) + m01 * m11 * (t * Q.eval (t ^ 2)))
          (m01 ^ 2 * (t * P.eval (t ^ 2)) + m11 ^ 2 * (t * Q.eval (t ^ 2))) := by
  have e1 : Polynomial.aeval ((t : ℂ) ^ 2) P = ((P.eval (t ^ 2) : ℝ) : ℂ) := by
    rw [← Complex.ofReal_pow]; exact (Polynomial.ofReal_eval (K := ℂ) _ _).symm
  have e2 : Polynomial.aeval ((t : ℂ) ^ 2) Q = ((Q.eval (t ^ 2) : ℝ) : ℂ) := by
    rw [← Complex.ofReal_pow]; exact (Polynomial.ofReal_eval (K := ℂ) _ _).symm
  simp only [RtGen, HardyReal.Rre, e1, e2]; push_cast; ring_nf

def smoothedRData (ctQ stQ seQ : ℚ) (pl ql : List ℚ) : RData where
  m00 := ofRatI (ctQ ^ 2 + seQ * stQ ^ 2)
  m01 := ofRatI (ctQ * stQ * (1 - seQ))
  m11 := ofRatI (stQ ^ 2 + seQ * ctQ ^ 2)
  P := pl.map ofRatI
  Q := ql.map ofRatI

def unsmoothedRData (pl ql : List ℚ) : RData where
  m00 := intI 1
  m01 := zeroI
  m11 := intI 1
  P := pl.map ofRatI
  Q := ql.map ofRatI

theorem hreal_smoothed {ct st se ce : ℝ} (hd : ct ^ 2 + st ^ 2 = 1) (he : se ^ 2 + ce ^ 2 = 1)
    {F : ℂ × ℂ → ℂ} (hFm : Measurable F) (hF1 : ∀ v, ‖F v‖ ≤ 1)
    (hFch : ∀ c v, ‖c‖ = 1 → F (rot2 c v) = c * F v)
    {P Q : ℝ[X]} (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1)
    (t : ℝ) (ht0 : 0 < t) (ht1 : t < 1) :
    HasSum (fun j => (bivarKernel P Q
        (energy ((memLp_smoothMap ct st se ce hFm hF1).toLp (smoothMap ct st se ce F))) j : ℂ) *
        (t : ℂ) ^ (2 * j + 1))
      (HholPair (fun u => F (uRot ct st u)) (fun u => F (uRot ct st u))
        (RtGen (m00Sym ct st se) (m01Sym ct st se) (m11Sym ct st se) P Q t)) := by
  set G := smoothMap ct st se ce F
  have hGL := memLp_smoothMap ct st se ce hFm hF1
  have hGch : ∀ c x, ‖c‖ = 1 → G (rot2 c x) = c * G x := fun c x hc =>
    smoothMap_rot2 ct st se ce hFch hc x
  set p := t * P.eval (t ^ 2); set q := t * Q.eval (t ^ 2)
  have hp_t : |p| ≤ t := HardyReal.abs_mul_eval_le hP ht0.le ht1.le
  have hq_t : |q| ≤ t := HardyReal.abs_mul_eval_le hQ ht0.le ht1.le
  have hp1 : |p| ≤ 1 := hp_t.trans ht1.le; have hq1 : |q| ≤ 1 := hq_t.trans ht1.le
  have hP_norm : ‖polyKernel P (t : ℂ)‖ ≤ 1 := by
    rw [HardyReal.polyKernel_real P ht0.le, Complex.norm_real, Real.norm_eq_abs]; exact hp1
  have hQ_norm : ‖polyKernel Q (t : ℂ)‖ ≤ 1 := by
    rw [HardyReal.polyKernel_real Q ht0.le, Complex.norm_real, Real.norm_eq_abs]; exact hq1
  have hz : ‖(t : ℂ)‖ ≤ 1 := by rw [Complex.norm_real, Real.norm_of_nonneg ht0.le]; exact ht1.le
  have hB := Bm_polyKernel (chargeOne_toLp hGL hGch) hP hQ hz hP_norm hQ_norm
  rw [Bm_toLp hGL hP_norm hQ_norm, HardyReal.polyKernel_real P ht0.le,
    HardyReal.polyKernel_real Q ht0.le] at hB
  change ∫ ω, conj (G (Xof ω)) * G (Yof p q ω) ∂mu4 = _ at hB
  set m00 := m00Sym ct st se; set m01 := m01Sym ct st se; set m11 := m11Sym ct st se
  set n00 := n00Sym st ce; set n01 := n01Sym ct st ce; set n11 := n11Sym ct ce
  obtain ⟨hM00, hM01, hM11⟩ := sym_mn_identities hd he
  set a := m00 ^ 2 * p + m01 ^ 2 * q
  set b := m00 * m01 * p + m01 * m11 * q
  set c := m01 ^ 2 * p + m11 ^ 2 * q
  have hK : ∀ x₁ x₂ : ℝ, (1 - t ^ 2) * (x₁ ^ 2 + x₂ ^ 2) ≤
      HardyReal.k11 a b * x₁ ^ 2 + 2 * HardyReal.k12 a b c * x₁ * x₂ +
        HardyReal.k22 b c * x₂ ^ 2 := fun x₁ x₂ => by
    have := HardyReal.normR_le_gen hM00 hM01 hM11 hp_t hq_t x₁ x₂
    simp only [HardyReal.k11, HardyReal.k12, HardyReal.k22, a, b, c] at *; nlinarith
  have hk11 : 0 < HardyReal.k11 a b := by have := hK 1 0; nlinarith
  have hkdet : 0 < HardyReal.kdet a b c := by
    have h := hK (-HardyReal.k12 a b c) (HardyReal.k11 a b)
    have e : HardyReal.k11 a b * (-HardyReal.k12 a b c) ^ 2 +
        2 * HardyReal.k12 a b c * (-HardyReal.k12 a b c) * HardyReal.k11 a b +
        HardyReal.k22 b c * HardyReal.k11 a b ^ 2 =
        HardyReal.k11 a b * HardyReal.kdet a b c := by simp only [HardyReal.kdet]; ring
    rw [e] at h
    have hpos : 0 < (1 - t ^ 2) * ((-HardyReal.k12 a b c) ^ 2 + HardyReal.k11 a b ^ 2) := by
      have : 0 < 1 - t ^ 2 := by nlinarith
      positivity
    exact (pos_iff_pos_of_mul_pos (hpos.trans_le h)).1 hk11
  set Frot : ℂ × ℂ → ℂ := fun u => F (uRot ct st u)
  have hFrot_m : Measurable Frot := hFm.comp (by unfold uRot; fun_prop)
  have hFrot_1 : ∀ u, ‖Frot u‖ ≤ 1 := fun _ => hF1 _
  set hPair : (ℂ × ℂ) × (ℂ × ℂ) → ℂ := fun z => conj (Frot z.1) * Frot z.2
  have hm_pair : Measurable hPair :=
    (Complex.continuous_conj.measurable.comp (hFrot_m.comp measurable_fst)).mul
      (hFrot_m.comp measurable_snd)
  have hn_pair : ∀ z, ‖hPair z‖ ≤ 1 := fun z => by
    dsimp only [hPair]; rw [norm_mul, Complex.norm_conj]
    exact (mul_le_mul (hFrot_1 z.1) (hFrot_1 z.2) (norm_nonneg _) zero_le_one).trans_eq (one_mul 1)
  have hsm_unfold : ∫ ω, conj (G (Xof ω)) * G (Yof p q ω) ∂mu4 =
      ∫ v, hPair (HardyReal.mehlerPairGen m00 m01 m11 n00 n01 n11 p q v)
        ∂(mu4.prod (mu2.prod mu2)) := by
    have hm_comp : Measurable fun v =>
        hPair (HardyReal.mehlerPairGen m00 m01 m11 n00 n01 n11 p q v) :=
      hm_pair.comp (HardyReal.mehlerPairGen m00 m01 m11 n00 n01 n11 p q).continuous.measurable
    rw [integral_prod _ (HardyReal.integrable_of_le_one hm_comp fun _ => hn_pair _)]
    congr 1; ext ω; symm
    simp only [hPair, Frot, HardyReal.mehlerPairGen, LinearMap.coe_toContinuousLinearMap',
      LinearMap.coe_mk, AddHom.coe_mk]
    rw [integral_prod_mul
      (fun Z => conj (F (uRot ct st (smoothSym m00 m01 m11 n00 n01 n11 (Xof ω) Z))))
      (fun Z => F (uRot ct st (smoothSym m00 m01 m11 n00 n01 n11 (Yof p q ω) Z))),
      integral_conj, ← smoothMap_eq_sym hd hFm (Xof ω), ← smoothMap_eq_sym hd hFm (Yof p q ω)]
  have hmeh : ∫ ω, conj (G (Xof ω)) * G (Yof p q ω) ∂mu4 =
      HholPair Frot Frot (RtGen m00 m01 m11 P Q t) := by
    rw [hsm_unfold,
      ← integral_map (HardyReal.mehlerPairGen m00 m01 m11 n00 n01 n11 p q).continuous.measurable.aemeasurable
        hm_pair.aestronglyMeasurable,
      HardyReal.law_swap_gen hM00 hM01 hM11 hp1 hq1 rfl rfl rfl hk11 hkdet,
      integral_map (HardyReal.pairMap a b c).continuous.measurable.aemeasurable
        hm_pair.aestronglyMeasurable,
      integral_prod (fun v => hPair (HardyReal.pairMap a b c v))
        (HardyReal.integrable_of_le_one
          (hm_pair.comp (HardyReal.pairMap a b c).continuous.measurable) fun _ => hn_pair _)]
    simp only [HardyReal.pairMap, LinearMap.coe_toContinuousLinearMap', LinearMap.coe_mk, AddHom.coe_mk]
    rw [HardyReal.integral_pair_eq_kHol hk11 hkdet hm_pair hn_pair, RtGen_real]; rfl
  rw [hmeh] at hB
  rw [hB, radialKernel]
  have e : ∀ n : ℕ, ((bivarKernel P Q (energy (hGL.toLp G)) n : ℝ) : ℂ) *
      ((t : ℂ) * ((‖(t : ℂ)‖ : ℝ) : ℂ) ^ (2 * n)) =
      (bivarKernel P Q (energy (hGL.toLp G)) n : ℂ) * (t : ℂ) ^ (2 * n + 1) := fun n => by
    rw [Complex.norm_real, Real.norm_of_nonneg ht0.le]; ring
  rw [tsum_congr e]
  refine (Summable.of_norm_bounded
    (summable_abs_bivarKernel P Q hP hQ _ (summable_abs_energy (hGL.toLp G))) fun n => ?_).hasSum
  rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, norm_pow, Complex.norm_real,
    Real.norm_of_nonneg ht0.le]
  exact mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ ht0.le ht1.le)

theorem hreal_unsmoothed {G : ℂ × ℂ → ℂ} (hGm : Measurable G) (hG1 : ∀ u, ‖G u‖ ≤ 1)
    (hGch : ∀ c u, ‖c‖ = 1 → G (rot2 c u) = c * G u) (hGL : MemLp G 2 mu2)
    {P Q : ℝ[X]} (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1)
    (t : ℝ) (ht0 : 0 < t) (ht1 : t < 1) :
    HasSum (fun j => (bivarKernel P Q (energy (hGL.toLp G)) j : ℂ) * (t : ℂ) ^ (2 * j + 1))
      (HholPair G G (RtGen 1 0 1 P Q t)) := by
  have hd : (1 : ℝ) ^ 2 + 0 ^ 2 = 1 := by norm_num
  have he : (1 : ℝ) ^ 2 + 0 ^ 2 = 1 := by norm_num
  have hsm : smoothMap 1 0 1 0 G = G := by
    funext x; unfold smoothMap
    have hz : ∀ z : ℂ × ℂ, G (smoothEff 1 0 1 0 x z) = G x := fun z => by
      congr 1; ext <;> simp [smoothEff]
    simp_rw [hz]
    rw [MeasureTheory.integral_const, probReal_univ, one_smul]
  have hu : (fun u : ℂ × ℂ => G (uRot 1 0 u)) = G := by
    funext u; congr 1; ext <;> simp [uRot]
  have hLp : ∀ (F' : ℂ × ℂ → ℂ) (hF' : MemLp F' 2 mu2), F' = G → hF'.toLp F' = hGL.toLp G := by
    rintro _ _ rfl; rfl
  have h0 := hreal_smoothed hd he hGm hG1 hGch hP hQ t ht0 ht1
  rw [hLp _ _ hsm, hu] at h0
  simpa only [m00Sym, m01Sym, m11Sym, one_pow, zero_pow two_ne_zero,
    mul_zero, add_zero, zero_add, sub_self, mul_one] using h0

/-- Master Hardy budget theorem for any smoothed channel `smoothMap ctQ stQ seQ ceQ F` certified
by `circleMeanOK` and `regionOK`. -/
theorem hardy_smoothed_channel {ctQ stQ seQ ceQ : ℚ}
    (hd : ctQ ^ 2 + stQ ^ 2 = 1) (he : seQ ^ 2 + ceQ ^ 2 = 1)
    {F : ℂ × ℂ → ℂ} (hFm : Measurable F) (hF1 : ∀ v, ‖F v‖ ≤ 1)
    (hFch : ∀ c v, ‖c‖ = 1 → F (rot2 c v) = c * F v)
    {pl ql : List ℚ} {rhoQ jQ regionRQ budgetQ : ℚ} {depth : ℕ}
    (hP : l1 (ofListQ pl) ≤ 1) (hQ : l1 (ofListQ ql) ≤ 1)
    (hρ1 : 1 < (rhoQ : ℝ)) (hrr : (rhoQ : ℝ) < (regionRQ : ℝ)) (hr2 : (regionRQ : ℝ) < 2)
    (hj0 : 0 < (jQ : ℝ)) (hB0 : 0 ≤ (budgetQ : ℝ))
    (hreg : regionOK (smoothedRData ctQ stQ seQ pl ql) regionRQ = true)
    (hmean_ok : circleMeanOK (smoothedRData ctQ stQ seQ pl ql) rhoQ jQ budgetQ depth = true)
    (J : ℕ) :
    ∑ n ∈ range J, bivarKernel (ofListQ pl) (ofListQ ql)
        (energy ((memLp_smoothMap (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ) hFm hF1).toLp
          (smoothMap (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ) F))) n ^ 2 *
      (rhoQ : ℝ) ^ (2 * (2 * n + 1)) ≤ (budgetQ : ℝ) := by
  have hdR : (ctQ : ℝ) ^ 2 + (stQ : ℝ) ^ 2 = 1 := by exact_mod_cast hd
  have heR : (seQ : ℝ) ^ 2 + (ceQ : ℝ) ^ 2 = 1 := by exact_mod_cast he
  have hm00 : mem (m00Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (smoothedRData ctQ stQ seQ pl ql).m00 := by
    rw [show (smoothedRData ctQ stQ seQ pl ql).m00 = ofRatI (ctQ ^ 2 + seQ * stQ ^ 2) from rfl]
    convert mem_ofRatI (ctQ ^ 2 + seQ * stQ ^ 2) using 2; simp [m00Sym]
  have hm01 : mem (m01Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (smoothedRData ctQ stQ seQ pl ql).m01 := by
    rw [show (smoothedRData ctQ stQ seQ pl ql).m01 = ofRatI (ctQ * stQ * (1 - seQ)) from rfl]
    convert mem_ofRatI (ctQ * stQ * (1 - seQ)) using 2; simp [m01Sym]
  have hm11 : mem (m11Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (smoothedRData ctQ stQ seQ pl ql).m11 := by
    rw [show (smoothedRData ctQ stQ seQ pl ql).m11 = ofRatI (stQ ^ 2 + seQ * ctQ ^ 2) from rfl]
    convert mem_ofRatI (stQ ^ 2 + seQ * ctQ ^ 2) using 2; simp [m11Sym]
  set Frot : ℂ × ℂ → ℂ := fun u => F (uRot (ctQ : ℝ) (stQ : ℝ) u)
  have hFrot_m : Measurable Frot := hFm.comp (by unfold uRot; fun_prop)
  have hFrot_1 : ∀ u, ‖Frot u‖ ≤ 1 := fun _ => hF1 _
  have hU := kerPos_on_ball_gen hr2 hm00 hm01 hm11 rfl rfl hreg
  have hm := hmean_of_circleMeanOK hFrot_m hFrot_m hFrot_1 hFrot_1 hm00 hm01 hm11 rfl rfl
    (by linarith) hj0 hB0 hrr hU hmean_ok
  have hs := summable_abs_bivarKernel (ofListQ pl) (ofListQ ql) hP hQ _
    (summable_abs_energy ((memLp_smoothMap (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ) hFm hF1).toLp
      (smoothMap (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ) F)))
  have hdiff := differentiableOn_HholPair_RtGen hFrot_m hFrot_m hFrot_1 hFrot_1 Metric.isOpen_ball hU
  have hball := hasSum_odd_of_eqOn_real (by linarith) hdiff hs
    (hreal_smoothed hdR heR hFm hF1 hFch hP hQ)
  refine sum_sq_le_of_mean_le
    (f := fun t => HholPair Frot Frot
      (RtGen (m00Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (m01Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
        (m11Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (ofListQ pl) (ofListQ ql) t))
    (fun θ => hball _ ?_)
    (summable_abs_of_hasSum_ball (by linarith) hrr hball) hm J
  rw [Metric.mem_ball, dist_zero_right, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    Complex.norm_exp_ofReal_mul_I, mul_one, abs_of_pos (by linarith)]
  exact hrr

/-- Master Hardy budget theorem for any unsmoothed (`M = I₂`) channel `G` certified by
`circleMeanOK` and `regionOK`. -/
theorem hardy_unsmoothed_channel {G : ℂ × ℂ → ℂ}
    (hGm : Measurable G) (hG1 : ∀ u, ‖G u‖ ≤ 1)
    (hGch : ∀ c u, ‖c‖ = 1 → G (rot2 c u) = c * G u) (hGL : MemLp G 2 mu2)
    {pl ql : List ℚ} {rhoQ jQ regionRQ budgetQ : ℚ} {depth : ℕ}
    (hP : l1 (ofListQ pl) ≤ 1) (hQ : l1 (ofListQ ql) ≤ 1)
    (hρ1 : 1 < (rhoQ : ℝ)) (hrr : (rhoQ : ℝ) < (regionRQ : ℝ)) (hr2 : (regionRQ : ℝ) < 2)
    (hj0 : 0 < (jQ : ℝ)) (hB0 : 0 ≤ (budgetQ : ℝ))
    (hreg : regionOK (unsmoothedRData pl ql) regionRQ = true)
    (hmean_ok : circleMeanOK (unsmoothedRData pl ql) rhoQ jQ budgetQ depth = true)
    (J : ℕ) :
    ∑ n ∈ range J, bivarKernel (ofListQ pl) (ofListQ ql) (energy (hGL.toLp G)) n ^ 2 *
      (rhoQ : ℝ) ^ (2 * (2 * n + 1)) ≤ (budgetQ : ℝ) := by
  have hm1 : mem (1 : ℝ) (intI 1) := by simpa using mem_intI 1
  have hm0 : mem (0 : ℝ) zeroI := mem_zero
  have hU := kerPos_on_ball_gen (dat := unsmoothedRData pl ql) hr2 hm1 hm0 hm1 rfl rfl hreg
  have hm := hmean_of_circleMeanOK (dat := unsmoothedRData pl ql) hGm hGm hG1 hG1 hm1 hm0 hm1 rfl rfl
    (by linarith) hj0 hB0 hrr hU hmean_ok
  have hs := summable_abs_bivarKernel (ofListQ pl) (ofListQ ql) hP hQ _
    (summable_abs_energy (hGL.toLp G))
  have hdiff := differentiableOn_HholPair_RtGen hGm hGm hG1 hG1 Metric.isOpen_ball hU
  have hball := hasSum_odd_of_eqOn_real (by linarith) hdiff hs
    (hreal_unsmoothed hGm hG1 hGch hGL hP hQ)
  refine sum_sq_le_of_mean_le
    (f := fun t => HholPair G G (RtGen 1 0 1 (ofListQ pl) (ofListQ ql) t))
    (fun θ => hball _ ?_)
    (summable_abs_of_hasSum_ball (by linarith) hrr hball) hm J
  rw [Metric.mem_ball, dist_zero_right, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    Complex.norm_exp_ofReal_mul_I, mul_one, abs_of_pos (by linarith)]
  exact hrr

end

end Grothe.Upper

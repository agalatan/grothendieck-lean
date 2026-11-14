import Mathlib.Analysis.Complex.CauchyIntegral
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.Algebra.Polynomial.Eval.Defs

/-!
# The Gauss remainder of an analytic integrand on a Taylor disk (generic)

`gauss_remainder_disk`: let an `n`-point rule on `[l, h]` have nodes in the panel, nonnegative
weights and be exact on the real polynomials of degree `< 2n`.  Let `f : ℂ → E` (any complex
Banach space) be complex differentiable on the closed disk of radius `R > r = (h − l)/2` around the
panel centre `c = (l + h)/2`, with `‖f‖ ≤ M` on the boundary circle.  Then
```
‖∫_l^h f(s) ds − Σ_i W_i f(x_i)‖ ≤ 2 (h − l) M (r/R)^{2n} / (1 − r/R).
```
Proof: the Cauchy power series of `f` at `c` (coefficients `‖a_m‖ ≤ M R^{−m}`), truncated at
degree `2n − 1`, is integrated exactly by the rule; the tail is `≤ M Σ_{m ≥ 2n} (r/R)^m` on the
panel, and both the integral and the rule have total mass `h − l`.

The statement is generic in the integrand and the rule: the upper-closure port reuses it unchanged
for twisted integrands (`docs/QUAD_CHECKER.md` §12.4).

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.Remainder

open MeasureTheory Metric Complex
open scoped NNReal

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]

/-- The truncated Taylor polynomial of `f` at `c` with the Cauchy coefficients on the circle of
radius `R`. -/
def taylorTrunc (f : ℂ → E) (c : ℂ) (R : ℝ≥0) (N : ℕ) (z : ℂ) : E :=
  ∑ m ∈ Finset.range N, (z - c) ^ m • (cauchyPowerSeries f c R).coeff m

omit [CompleteSpace E] in
/-- The Cauchy coefficients are bounded by `M R^{−m}`. -/
lemma norm_coeff_cauchy_le (f : ℂ → E) (c : ℂ) {R : ℝ≥0} (hR : 0 < R) {M : ℝ}
    (hc : ContinuousOn f (sphere c R)) (hM : ∀ z ∈ sphere c R, ‖f z‖ ≤ M) (m : ℕ) :
    ‖(cauchyPowerSeries f c R).coeff m‖ ≤ M * ((R : ℝ)⁻¹) ^ m := by
  rw [← FormalMultilinearSeries.norm_apply_eq_norm_coef]
  refine (norm_cauchyPowerSeries_le f c R m).trans ?_
  have hR' : (0 : ℝ) < R := hR
  rw [abs_of_pos hR']
  apply mul_le_mul_of_nonneg_right _ (by positivity)
  have hint : ∫ θ : ℝ in (0 : ℝ)..2 * Real.pi, ‖f (circleMap c R θ)‖ ≤
      ∫ θ : ℝ in (0 : ℝ)..2 * Real.pi, M := by
    apply intervalIntegral.integral_mono_on (by positivity)
    · -- integrability of the norm: continuous on a compact interval
      exact (hc.comp_continuous (continuous_circleMap c R)
        fun θ => circleMap_mem_sphere c hR'.le θ).norm.intervalIntegrable _ _
    · exact intervalIntegrable_const
    · intro θ _
      apply hM
      simp
  rw [intervalIntegral.integral_const, smul_eq_mul, sub_zero] at hint
  have hpi : 0 < 2 * Real.pi := by positivity
  calc (2 * Real.pi)⁻¹ * ∫ θ : ℝ in (0 : ℝ)..2 * Real.pi, ‖f (circleMap c R θ)‖
      ≤ (2 * Real.pi)⁻¹ * (2 * Real.pi * M) := mul_le_mul_of_nonneg_left hint (by positivity)
    _ = M := by field_simp

/-- **The Taylor remainder on the disk**: at a point at relative distance `t < 1` from the centre,
the truncation through degree `N − 1` is within `M t^N/(1 − t)`. -/
lemma norm_sub_taylorTrunc_le (f : ℂ → E) (c : ℂ) {R : ℝ≥0} (hR : 0 < R)
    (hf : DifferentiableOn ℂ f (closedBall c R)) {M : ℝ} (hM : ∀ z ∈ sphere c R, ‖f z‖ ≤ M)
    (N : ℕ) {z : ℂ} {t : ℝ} (ht0 : 0 ≤ t) (ht1 : t < 1) (hz : ‖z - c‖ ≤ t * R) :
    ‖f z - taylorTrunc f c R N z‖ ≤ M * t ^ N / (1 - t) := by
  have hR' : (0 : ℝ) < R := hR
  have hps := hf.hasFPowerSeriesOnBall hR
  have hzmem : z - c ∈ Metric.eball (0 : ℂ) R := by
    rw [Metric.eball_coe, Metric.mem_ball, dist_zero_right]
    calc ‖z - c‖ ≤ t * R := hz
      _ < R := by nlinarith
  have hs := hps.hasSum hzmem
  simp only [add_sub_cancel] at hs
  simp_rw [FormalMultilinearSeries.apply_eq_pow_smul_coeff] at hs
  have htail := (hasSum_nat_add_iff' N).mpr hs
  have hcont : ContinuousOn f (sphere c R) := hf.continuousOn.mono sphere_subset_closedBall
  have hgeo : HasSum (fun m : ℕ => M * t ^ N * t ^ m) (M * t ^ N * (1 - t)⁻¹) :=
    (hasSum_geometric_of_lt_one ht0 ht1).mul_left _
  have hb := htail.norm_le_of_bounded hgeo (fun m => by
    rw [norm_smul, norm_pow]
    have hc := norm_coeff_cauchy_le f c hR hcont hM (m + N)
    have hM0 : 0 ≤ M := (norm_nonneg _).trans (hM (c + R) (by simp [abs_of_pos hR']))
    calc ‖z - c‖ ^ (m + N) * ‖(cauchyPowerSeries f c R).coeff (m + N)‖
        ≤ (t * R) ^ (m + N) * (M * ((R : ℝ)⁻¹) ^ (m + N)) :=
          mul_le_mul (pow_le_pow_left₀ (norm_nonneg _) hz _) hc (norm_nonneg _) (by positivity)
      _ = M * t ^ N * t ^ m := by
          have : ((R : ℝ)⁻¹) ^ (m + N) * (R : ℝ) ^ (m + N) = 1 := by
            rw [← mul_pow, inv_mul_cancel₀ hR'.ne', one_pow]
          rw [mul_pow, pow_add]
          linear_combination (M * t ^ m * t ^ N) * this)
  unfold taylorTrunc
  rw [div_eq_mul_inv]
  exact hb

/-- The rule integrates the truncated Taylor polynomial (degree `< 2n`, real centre) exactly. -/
lemma integral_taylorTrunc_eq {n : ℕ} (l h : ℝ) (node weight : Fin n → ℝ)
    (hexact : ∀ p : Polynomial ℝ, p.natDegree < 2 * n →
      ∫ s in l..h, p.eval s = ∑ i, weight i * p.eval (node i))
    (f : ℂ → E) (c₀ : ℝ) (R : ℝ≥0) :
    ∫ s in l..h, taylorTrunc f (c₀ : ℂ) R (2 * n) (s : ℂ) =
      ∑ i, (weight i : ℂ) • taylorTrunc f (c₀ : ℂ) R (2 * n) (node i : ℂ) := by
  unfold taylorTrunc
  have hterm : ∀ m ∈ Finset.range (2 * n), ∀ s : ℝ,
      ((s : ℂ) - c₀) ^ m • (cauchyPowerSeries f c₀ R).coeff m =
        ((((s - c₀) ^ m : ℝ)) : ℂ) • (cauchyPowerSeries f c₀ R).coeff m := by
    intro m _ s; push_cast; rfl
  have hint : ∀ m ∈ Finset.range (2 * n), IntervalIntegrable
      (fun s : ℝ => ((s : ℂ) - c₀) ^ m • (cauchyPowerSeries f c₀ R).coeff m) volume l h :=
    fun _ _ => Continuous.intervalIntegrable (by fun_prop) _ _
  rw [intervalIntegral.integral_finsetSum hint]
  simp_rw [Finset.smul_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro m hm
  have hm' : m < 2 * n := Finset.mem_range.mp hm
  simp_rw [hterm m hm]
  rw [intervalIntegral.integral_smul_const, intervalIntegral.integral_ofReal]
  have hp := hexact ((Polynomial.X - Polynomial.C c₀) ^ m) (by
    rw [Polynomial.natDegree_pow, Polynomial.natDegree_X_sub_C, mul_one]; exact hm')
  simp only [Polynomial.eval_pow, Polynomial.eval_sub, Polynomial.eval_X, Polynomial.eval_C] at hp
  rw [hp, Complex.ofReal_sum, Finset.sum_smul]
  apply Finset.sum_congr rfl
  intro i _
  rw [smul_smul]
  push_cast
  rfl

/-- **The Gauss remainder on a Taylor disk** (generic in the integrand and the rule). -/
theorem gauss_remainder_disk {n : ℕ} (hn : 0 < n) (l h : ℝ) (hlh : l < h) (node weight : Fin n → ℝ)
    (hnode : ∀ i, node i ∈ Set.Icc l h) (hweight : ∀ i, 0 ≤ weight i)
    (hexact : ∀ p : Polynomial ℝ, p.natDegree < 2 * n →
      ∫ s in l..h, p.eval s = ∑ i, weight i * p.eval (node i))
    (f : ℂ → E) {R : ℝ} (hR : (h - l) / 2 < R)
    (hf : DifferentiableOn ℂ f (closedBall (((l + h) / 2 : ℝ) : ℂ) R)) {M : ℝ}
    (hM : ∀ z ∈ sphere (((l + h) / 2 : ℝ) : ℂ) R, ‖f z‖ ≤ M) :
    ‖(∫ s in l..h, f s) - ∑ i, (weight i : ℂ) • f (node i)‖ ≤
      2 * (h - l) * (M * ((h - l) / 2 / R) ^ (2 * n) / (1 - (h - l) / 2 / R)) := by
  set c₀ : ℝ := (l + h) / 2 with hc₀
  have hr0 : 0 < (h - l) / 2 := by linarith
  have hR0 : 0 < R := hr0.trans hR
  set R' : ℝ≥0 := ⟨R, hR0.le⟩ with hR'
  have hR'pos : 0 < R' := hR0
  have hRR : (R' : ℝ) = R := rfl
  set t : ℝ := (h - l) / 2 / R with ht
  have ht0 : 0 ≤ t := by positivity
  have ht1 : t < 1 := (div_lt_one hR0).mpr hR
  set ε : ℝ := M * t ^ (2 * n) / (1 - t) with hε
  set P := taylorTrunc f (c₀ : ℂ) R' (2 * n) with hP
  have hball : ∀ s ∈ Set.Icc l h, (s : ℂ) ∈ closedBall (c₀ : ℂ) R := by
    intro s hs
    rw [Metric.mem_closedBall, dist_eq_norm, ← Complex.ofReal_sub, Complex.norm_real,
      Real.norm_eq_abs, abs_le]
    constructor <;> linarith [hs.1, hs.2]
  have happrox : ∀ s ∈ Set.Icc l h, ‖f s - P s‖ ≤ ε := by
    intro s hs
    apply norm_sub_taylorTrunc_le f (c₀ : ℂ) hR'pos hf hM (2 * n) ht0 ht1
    rw [← Complex.ofReal_sub, Complex.norm_real, Real.norm_eq_abs, hRR, ht,
      div_mul_cancel₀ _ hR0.ne', abs_le]
    constructor <;> linarith [hs.1, hs.2]
  have hε0 : 0 ≤ ε := (norm_nonneg _).trans (happrox l ⟨le_rfl, hlh.le⟩)
  have hsum : ∑ i, weight i = h - l := by
    have h1 := hexact (Polynomial.C 1) (by rw [Polynomial.natDegree_C]; omega)
    simp only [Polynomial.eval_C, mul_one] at h1
    rw [intervalIntegral.integral_const, smul_eq_mul, mul_one] at h1
    linarith
  have hfint : IntervalIntegrable (fun s : ℝ => f s) volume l h :=
    (hf.continuousOn.comp Complex.continuous_ofReal.continuousOn hball).intervalIntegrable_of_Icc
      hlh.le
  have hPint : IntervalIntegrable (fun s : ℝ => P s) volume l h := by
    apply Continuous.intervalIntegrable
    rw [hP]; unfold taylorTrunc
    fun_prop
  have hexP := integral_taylorTrunc_eq l h node weight hexact f c₀ R'
  rw [← hP] at hexP
  have hdiff : (∫ s in l..h, f s) - ∑ i, (weight i : ℂ) • f (node i) =
      (∫ s in l..h, (f s - P s)) + ∑ i, (weight i : ℂ) • (P (node i) - f (node i)) := by
    rw [intervalIntegral.integral_sub hfint hPint, hexP]
    simp only [smul_sub, Finset.sum_sub_distrib]
    abel
  rw [hdiff]
  have hI : ‖∫ s in l..h, (f s - P s)‖ ≤ ε * (h - l) := by
    have := intervalIntegral.norm_integral_le_of_norm_le_const (a := l) (b := h) (C := ε)
      (f := fun s : ℝ => f s - P s)
      (fun s hs => happrox s ((Set.uIcc_of_le hlh.le).subset (Set.uIoc_subset_uIcc hs)))
    rwa [abs_of_nonneg (sub_nonneg.mpr hlh.le)] at this
  have hS : ‖∑ i, (weight i : ℂ) • (P (node i) - f (node i))‖ ≤ ε * (h - l) := by
    calc ‖∑ i, (weight i : ℂ) • (P (node i) - f (node i))‖
        ≤ ∑ i, ‖(weight i : ℂ) • (P (node i) - f (node i))‖ := norm_sum_le _ _
      _ ≤ ∑ i, weight i * ε := by
          apply Finset.sum_le_sum
          intro i _
          rw [norm_smul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (hweight i),
            norm_sub_rev]
          exact mul_le_mul_of_nonneg_left (happrox _ (hnode i)) (hweight i)
      _ = ε * (h - l) := by rw [← Finset.sum_mul, hsum, mul_comm]
  calc _ ≤ ‖∫ s in l..h, (f s - P s)‖ + ‖∑ i, (weight i : ℂ) • (P (node i) - f (node i))‖ :=
        norm_add_le _ _
    _ ≤ ε * (h - l) + ε * (h - l) := add_le_add hI hS
    _ = 2 * (h - l) * ε := by ring

end

end Grothe.UpperQuad.Remainder

import Grothe.UpperChaos.HardyReal
import Grothe.UpperChaos.Smoothing

/-!
# Analytic series of a smoothed response

A bounded charge-one response has the same real Mehler-to-holomorphic
identification as the concrete rounder. This interface is intended for a
certified smooth surrogate; it does not construct one or bound any sample.
-/

open MeasureTheory Complex
open scoped ComplexConjugate

namespace Grothe.UpperChaos.SmoothResponseSeries
noncomputable section

open HardyReal

private def pairResponse (F : ℂ × ℂ → ℂ) (z : (ℂ × ℂ) × (ℂ × ℂ)) : ℂ :=
  conj (F z.1) * F z.2

private lemma measurable_pairResponse {F : ℂ × ℂ → ℂ} (hF : Measurable F) :
    Measurable (pairResponse F) :=
  (Complex.continuous_conj.measurable.comp (hF.comp measurable_fst)).mul
    (hF.comp measurable_snd)

private lemma norm_pairResponse_le {F : ℂ × ℂ → ℂ} (hF : ∀ u, ‖F u‖ ≤ 1)
    (z : (ℂ × ℂ) × (ℂ × ℂ)) : ‖pairResponse F z‖ ≤ 1 := by
  rw [pairResponse, norm_mul, Complex.norm_conj]
  nlinarith [hF z.1, hF z.2, norm_nonneg (F z.1), norm_nonneg (F z.2)]

/-- Unfold both Gaussian smoothings in the Mehler correlation. -/
private theorem mehler_smoothFn {F : ℂ × ℂ → ℂ} (hFm : Measurable F)
    (hF : ∀ u, ‖F u‖ ≤ 1) (p q : ℝ) :
    ∫ ω, conj (smoothFn F (Xof ω)) * smoothFn F (Yof p q ω) ∂mu4 =
      ∫ v, pairResponse F (mehlerPair p q v) ∂(mu4.prod (mu2.prod mu2)) := by
  have hm : Measurable fun v => pairResponse F (mehlerPair p q v) :=
    (measurable_pairResponse hFm).comp (mehlerPair p q).continuous.measurable
  rw [integral_prod _ (integrable_of_le_one hm fun v => norm_pairResponse_le hF _)]
  congr 1; ext ω
  symm
  simp only [pairResponse, mehlerPair, LinearMap.coe_toContinuousLinearMap', LinearMap.coe_mk,
    AddHom.coe_mk, smoothFn]
  rw [integral_prod_mul (fun Z => conj (F (smoothArg (Xof ω) Z)))
    (fun Z => F (smoothArg (Yof p q ω) Z)), integral_conj]
  rfl

/-- The real Mehler correlation of a smoothed response equals its continued
Gaussian correlation. -/
theorem mehler_smoothFn_eq_HholPair {F : ℂ × ℂ → ℂ} (hFm : Measurable F)
    (hF : ∀ u, ‖F u‖ ≤ 1) {t : ℝ} (ht0 : 0 < t) (ht1 : t < 1) :
    ∫ ω, conj (smoothFn F (Xof ω)) * smoothFn F (Yof (pr t) (qr t) ω) ∂mu4 =
      HholPair F F (Rt t) := by
  obtain ⟨h, hd⟩ := k11_kdet_pos ht0.le ht1
  have hp : |pr t| ≤ 1 := (abs_pr_le ht0.le ht1.le).trans ht1.le
  have hq : |qr t| ≤ 1 := (abs_qr_le ht0.le ht1.le).trans ht1.le
  rw [mehler_smoothFn hFm hF, ← integral_map (mehlerPair (pr t) (qr t)).continuous.measurable.aemeasurable
      (measurable_pairResponse hFm).aestronglyMeasurable,
    law_swap (a := ra t) (b := rb t) (c := rc t) hp hq rfl rfl rfl h hd,
    integral_map (pairMap _ _ _).continuous.measurable.aemeasurable
      (measurable_pairResponse hFm).aestronglyMeasurable,
    integral_prod (fun v => pairResponse F (pairMap _ _ _ v))
      (integrable_of_le_one ((measurable_pairResponse hFm).comp (pairMap _ _ _).continuous.measurable)
        fun v => norm_pairResponse_le hF _)]
  simp only [pairMap, LinearMap.coe_toContinuousLinearMap', LinearMap.coe_mk, AddHom.coe_mk]
  rw [integral_pair_eq_kHol h hd (measurable_pairResponse hFm) (norm_pairResponse_le hF), Rt_real]
  rfl

/-- Coefficients of the smoothed response with the project's preprocessors. -/
abbrev smoothCoeff (F : ℂ × ℂ → ℂ) (hFm : Measurable F) (hFL : MemLp F 2 mu2) : ℕ → ℝ :=
  Grothe.Upper.kernelCoeff (energy ((memLp_smoothFn hFm hFL).toLp (smoothFn F)))

/-- Real-series identification for any bounded charge-one source. -/
theorem hreal_smoothFn {F : ℂ × ℂ → ℂ} (hFm : Measurable F)
    (hF : ∀ u, ‖F u‖ ≤ 1) (hFL : MemLp F 2 mu2)
    (hrot : ∀ c u, ‖c‖ = 1 → F (rot2 c u) = c * F u)
    (t : ℝ) (ht0 : 0 < t) (ht1 : t < 1) :
    HasSum (fun j => (smoothCoeff F hFm hFL j : ℂ) * (t : ℂ) ^ (2 * j + 1))
      (HholPair F F (Rt t)) := by
  have hP : ‖Grothe.polyKernel Grothe.Upper.primaryPoly (t : ℂ)‖ ≤ 1 := by
    rw [polyKernel_real _ ht0.le, Complex.norm_real, Real.norm_eq_abs]
    exact (abs_pr_le ht0.le ht1.le).trans ht1.le
  have hQ : ‖Grothe.polyKernel Grothe.Upper.auxPoly (t : ℂ)‖ ≤ 1 := by
    rw [polyKernel_real _ ht0.le, Complex.norm_real, Real.norm_eq_abs]
    exact (abs_qr_le ht0.le ht1.le).trans ht1.le
  have hz : ‖(t : ℂ)‖ ≤ 1 := by rw [Complex.norm_real, Real.norm_of_nonneg ht0.le]; exact ht1.le
  have hS := memLp_smoothFn hFm hFL
  have hB := Bm_polyKernel (chargeOne_toLp hS fun c u hc => smoothFn_rot2 hFm hrot hc u)
    Grothe.l1_primaryPoly Grothe.l1_auxPoly hz hP hQ
  rw [Bm_toLp hS hP hQ, polyKernel_real _ ht0.le, polyKernel_real _ ht0.le] at hB
  change ∫ ω, conj (smoothFn F (Xof ω)) * smoothFn F (Yof (pr t) (qr t) ω) ∂mu4 = _ at hB
  rw [mehler_smoothFn_eq_HholPair hFm hF ht0 ht1] at hB
  rw [hB, radialKernel]
  have e : ∀ n : ℕ, ((Grothe.Upper.bivarKernel Grothe.Upper.primaryPoly Grothe.Upper.auxPoly
      (energy (hS.toLp (smoothFn F))) n : ℝ) : ℂ) *
      ((t : ℂ) * (((‖(t : ℂ)‖ : ℝ) : ℂ)) ^ (2 * n)) =
      (smoothCoeff F hFm hFL n : ℂ) * (t : ℂ) ^ (2 * n + 1) := by
    intro n
    rw [Complex.norm_real, Real.norm_of_nonneg ht0.le]
    simp only [smoothCoeff, Grothe.Upper.kernelCoeff]; ring
  simp_rw [e]
  have hs : Summable fun j => |smoothCoeff F hFm hFL j| :=
    Grothe.summable_kernelCoeff (summable_abs_energy _)
  refine (Summable.of_norm_bounded hs fun n => ?_).hasSum
  rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, norm_pow, Complex.norm_real,
    Real.norm_of_nonneg ht0.le]
  exact mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ ht0.le ht1.le)

/-- The actual continued correlation has the same odd series at each unit
circle point, including for a later bounded smooth surrogate. -/
theorem hasSum_unit_circle {F : ℂ × ℂ → ℂ} (hFm : Measurable F)
    (hF : ∀ u, ‖F u‖ ≤ 1) (hFL : MemLp F 2 mu2)
    (hrot : ∀ c u, ‖c‖ = 1 → F (rot2 c u) = c * F u)
    {z : ℂ} (hz : ‖z‖ = 1) :
    HasSum (fun j => (smoothCoeff F hFm hFL j : ℂ) * z ^ (2 * j + 1))
      (HholPair F F (Rt z)) := by
  have hreg := (hardy_region_and_mean hFm hFm hF hF).1
  have hdiff := differentiableOn_HholPair_Rt hFm hFm hF hF Metric.isOpen_ball hreg
  have hr : (1 : ℝ) < (HardyArcRegion.regionR : ℝ) := by
    norm_num [HardyArcRegion.regionR]
  have hs : Summable fun j => |smoothCoeff F hFm hFL j| :=
    Grothe.summable_kernelCoeff (summable_abs_energy _)
  have hball := hasSum_odd_of_eqOn_real hr hdiff hs (hreal_smoothFn hFm hF hFL hrot)
  apply hball
  rw [Metric.mem_ball, dist_zero_right, hz]
  exact hr

end
end Grothe.UpperChaos.SmoothResponseSeries

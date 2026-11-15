-- Grothe/UpperChaos/HardyGaussian.lean
import Grothe.UpperChaos.HardyGaussianSound
import Grothe.UpperChaos.HardyGaussianFacts
import Grothe.UpperChaos.HardyReal
import Grothe.UpperChaos.SchurMainGaussian

/-!
# The production Hardy budget from Gaussian amplitudes

The exact Gaussian-amplitude estimate is at most `5/4` on both charts of the
Hardy circle. Its circle mean gives the same bound for every partial weighted
energy sum of the actual rounding kernel.

Agent-ID: codex-9b17. Refs #380.
-/

open MeasureTheory Real

-- Keep the concrete acceptance fact outside the pure interval soundness module.
-- Agent-ID: codex-c8a4. Refs #380.
namespace Grothe.UpperChaos.HardyGaussianSound

open GrotheKernel GrotheKernel.HardyArc Grothe.Upper
open HardyArcSound HardyArcCover HardyArcCircle SchurMain SchurKernel Sym2R

noncomputable section

theorem chart_parameter_bound (neg : Bool) {τ : ℝ} (hτ : -1 ≤ τ ∧ τ ≤ 1) :
    Bound (chartPt (rhoQ : ℝ) neg τ) := by
  have hD := D_pos
  by_cases hzero : τ ≤ 0
  · apply cover_sound neg 24 (-D) 0
    · constructor <;> simp only [Int.cast_neg, Int.cast_zero]
      · simpa using mul_le_mul_of_nonneg_right hτ.1 hD.le
      · exact mul_nonpos_of_nonpos_of_nonneg hzero hD.le
    · exact HardyGaussianCheck.charts_checked neg false
  · apply cover_sound neg 24 0 D
    · constructor <;> simp only [Int.cast_zero]
      · exact mul_nonneg (le_of_not_ge hzero) hD.le
      · simpa using mul_le_mul_of_nonneg_right hτ.2 hD.le
    · exact HardyGaussianCheck.charts_checked neg true

/-- The complete half-circle for either sign, including both endpoints. -/
theorem chart_bound (neg : Bool) {θ : ℝ} (hlo : -Real.pi / 2 ≤ θ) (hhi : θ ≤ Real.pi / 2) :
    Bound (HardyArcSound.sig neg * ((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)) := by
  have h1 : 2 * Real.arctan (-1) ≤ θ := by rw [Real.arctan_neg, Real.arctan_one]; linarith
  have h2 : θ ≤ 2 * Real.arctan 1 := by rw [Real.arctan_one]; linarith
  have hτ := tan_half_mem h1 h2
  have he := exp_eq_chart (by linarith [Real.pi_pos] : -Real.pi < θ)
    (by linarith [Real.pi_pos] : θ < Real.pi)
  have hb := chart_parameter_bound neg hτ
  convert hb using 1
  rw [he, chartPt]
  push_cast
  ring

end

end Grothe.UpperChaos.HardyGaussianSound

namespace Grothe.UpperChaos.HardyGaussian

open GrotheKernel GrotheKernel.HardyArc Grothe.Upper
open HardyArcSound HardyArcCover HardyArcMean HardyArcRegion

variable {F G : ℂ × ℂ → ℂ} (hFm : Measurable F) (hGm : Measurable G)
  (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
include hFm hGm hF hG

/-- The pointwise Gaussian-amplitude estimate on either half-circle. -/
theorem chart_bound (neg : Bool) {θ : ℝ} (hlo : -(π / 2) ≤ θ) (hhi : θ ≤ π / 2) :
    gF F G neg θ ≤ 5 / 4 := by
  obtain ⟨hZ, hT, hb⟩ := HardyGaussianSound.chart_bound neg (by linarith) hhi
  have hj : (0 : ℝ) < (jQ : ℝ) := by norm_num [jQ]
  refine (SchurMainGaussian.norm_HholPair_sq_le _ _ hj hZ hT hFm hGm hF hG).trans ?_
  simpa only [HardyGaussianSound.denominator] using hb

/-- A uniform cap on a half-circle integrates to its length times that cap. -/
lemma chart_integral_le {r : ℝ} (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (Rt t) l) (neg : Bool) :
    ∫ θ in (-(π / 2))..(π / 2), gF F G neg θ ≤ π * (5 / 4) := by
  calc ∫ θ in (-(π / 2))..(π / 2), gF F G neg θ
      ≤ ∫ _θ in (-(π / 2))..(π / 2), (5 / 4 : ℝ) := by
        apply intervalIntegral.integral_mono_on (by linarith [Real.pi_pos])
          (gF_intervalIntegrable hFm hGm hF hG hr hU neg _ _) intervalIntegrable_const
        intro θ hθ
        exact chart_bound hFm hGm hF hG neg hθ.1 hθ.2
    _ = π * (5 / 4) := by
      rw [intervalIntegral.integral_const, smul_eq_mul]
      ring

/-- The Gaussian-amplitude estimate bounds the complete circle mean by `5/4`. -/
theorem hmean {r : ℝ} (hr : (4149 / 4000 : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (Rt t) l) :
    (2 * π)⁻¹ * ∫ θ in (0 : ℝ)..2 * π,
      ‖HholPair F G (Rt (((4149 / 4000 : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2
        ≤ 5 / 4 := by
  have hρ : ((rhoQ : ℚ) : ℝ) = 4149 / 4000 := by norm_num [rhoQ]
  have hr' : (rhoQ : ℝ) < r := by rw [hρ]; exact hr
  have hint := gF_intervalIntegrable hFm hGm hF hG hr' hU
  have hf : (fun θ : ℝ =>
      ‖HholPair F G (Rt (((4149 / 4000 : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2) =
      gF F G false := by
    funext θ
    simp only [gF, HardyArcSound.sig, Bool.false_eq_true, ↓reduceIte, one_mul, hρ]
  rw [hf]
  have hper : Function.Periodic (gF F G false) (2 * π) := by
    intro θ
    simp only [gF]
    congr 4
    push_cast
    rw [add_mul, Complex.exp_add, Complex.exp_two_pi_mul_I, mul_one]
  have hshift : ∫ θ in (0 : ℝ)..2 * π, gF F G false θ =
      ∫ θ in (-(π / 2))..(-(π / 2) + 2 * π), gF F G false θ := by
    simpa using hper.intervalIntegral_add_eq 0 (-(π / 2))
  rw [hshift, ← intervalIntegral.integral_add_adjacent_intervals
    (hint false _ _) (hint false _ _) (b := π / 2)]
  have hsecond : ∫ θ in (π / 2)..(-(π / 2) + 2 * π), gF F G false θ =
      ∫ θ in (-(π / 2))..(π / 2), gF F G true θ := by
    have e : ∀ θ : ℝ, gF F G false (θ + π) = gF F G true θ := by
      intro θ
      simp only [gF, HardyArcSound.sig, Bool.false_eq_true, ↓reduceIte, one_mul]
      congr 4
      push_cast
      rw [add_mul, Complex.exp_add, Complex.exp_pi_mul_I]
      ring
    calc ∫ θ in (π / 2)..(-(π / 2) + 2 * π), gF F G false θ
        = ∫ θ in (-(π / 2) + π)..(π / 2 + π), gF F G false θ := by
          congr 1 <;> ring
      _ = ∫ θ in (-(π / 2))..(π / 2), gF F G false (θ + π) :=
          (intervalIntegral.integral_comp_add_right (gF F G false) π).symm
      _ = ∫ θ in (-(π / 2))..(π / 2), gF F G true θ := by simp only [e]
  rw [hsecond]
  have c1 := chart_integral_le hFm hGm hF hG hr' hU false
  have c2 := chart_integral_le hFm hGm hF hG hr' hU true
  rw [inv_mul_le_iff₀ (by positivity)]
  linarith

/-- The existing analytic continuation and the improved mean give the Hardy input. -/
theorem hardy_of_real {h : ℕ → ℝ} (hs : Summable fun j => |h j|)
    (hreal : ∀ t : ℝ, 0 < t → t < 1 →
      HasSum (fun j => (h j : ℂ) * (t : ℂ) ^ (2 * j + 1)) (HholPair F G (Rt t)))
    (J : ℕ) :
    ∑ n ∈ Finset.range J, h n ^ 2 * (4149 / 4000 : ℝ) ^ (2 * (2 * n + 1)) ≤ 5 / 4 := by
  have hU := kerPos_on_ball hardy_region_check
  have hm := hmean hFm hGm hF hG (by norm_num [regionR]) hU
  exact hardy_of_pair_inputs_budget hFm hGm hF hG (by norm_num [regionR]) hU hs hreal hm J

end Grothe.UpperChaos.HardyGaussian

namespace Grothe.UpperChaos.HardyReal

/-- The improved Hardy budget for the actual production rounding. -/
theorem hardy_GT_gaussian (hφ : PhiBound) (J : ℕ) :
    ∑ n ∈ Finset.range J, Grothe.Upper.kernelCoeff (energy ((memLp_GT hφ).toLp GT)) n ^ 2
      * (4149 / 4000 : ℝ) ^ (2 * (2 * n + 1)) ≤ 5 / 4 :=
  HardyGaussian.hardy_of_real measurable_Tround measurable_Tround
    (norm_Tround_le hφ) (norm_Tround_le hφ) (summable_hGT hφ) (hreal_GT hφ) J

end Grothe.UpperChaos.HardyReal

import Mathlib.Analysis.Calculus.Deriv.MeanValue
import Mathlib.Analysis.Real.Pi.Bounds
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Tactic.LinearCombination
import HaagerupBound.CertData

/-!
# Enclosure of Haagerup's constant `γ†`

Defines `haagerupDagger := ∫ t in 0..π/2, cos² t / √(1 + sin² t)` and proves `0 < haagerupDagger` and
`haagerupDagger < 7119595 / 10000000` (`CertData.haagerupUpperQ`):

1. `1 + sin² t = 2 - cos² t`.
2. `1 / √(2 - u) ≤ M · P(u)` on `u ∈ [0, 1]`, where `M = 707106782 / 10⁹ > 1 / √2` and
   `P(u) = ∑_{k ≤ 20} c_k u^k + 3 c₂₁ u²¹`, with `c_k` the coefficients of `(1 - u/2)^{-1/2}`. Indeed
   `G(v) = √(2 - v) · P(v)` is nondecreasing on `[0, 1]`: the numerator of `G'` is `2 (2 - v) P'(v) - P(v)`,
   in which the powers `v⁰, …, v¹⁹` cancel because `4 (k+1) c_{k+1} = (2k+1) c_k`, leaving
   `c₂₁ v²⁰ (168 - 129 v) ≥ 0`. And `G(0) = √2`.
3. Integrate `cos² t · P(cos² t)` with the Wallis recurrence
   `∫₀^{π/2} cos^{2k+2} t dt = (2k+1)/(2k+2) ∫₀^{π/2} cos^{2k} t dt`, and bound `π` from above.
-/

namespace HaagerupBound

open MeasureTheory intervalIntegral Real

/-- Haagerup's constant `γ† = ∫₀^{π/2} cos² t / √(1 + sin² t) dt`. -/
noncomputable def haagerupDagger : ℝ :=
  ∫ t in (0 : ℝ)..(π / 2), (cos t) ^ 2 / Real.sqrt (1 + (sin t) ^ 2)

theorem continuous_integrand :
    Continuous fun t : ℝ => (cos t) ^ 2 / Real.sqrt (1 + (sin t) ^ 2) :=
  Continuous.div (continuous_cos.pow 2)
    (Real.continuous_sqrt.comp (continuous_const.add (continuous_sin.pow 2)))
    fun t => (Real.sqrt_pos.2 (by positivity)).ne'

/-- `0 < γ†`: the integrand is positive on `(0, π/2)`. -/
theorem haagerupDagger_pos : 0 < haagerupDagger := by
  unfold haagerupDagger
  refine intervalIntegral.intervalIntegral_pos_of_pos_on
    (continuous_integrand.intervalIntegrable _ _) ?_ (by positivity)
  intro t ht
  have hc : 0 < cos t := cos_pos_of_mem_Ioo ⟨by linarith [ht.1, pi_pos], ht.2⟩
  have hs : 0 < Real.sqrt (1 + (sin t) ^ 2) := Real.sqrt_pos.2 (by positivity)
  positivity

/-! ### Wallis integrals `∫₀^{π/2} cos^{2n} t dt = wFactor n · π/2` -/

/-- The rational factor of the Wallis integral: `wFactor (n+1) = (2n+1)/(2n+2) · wFactor n`. -/
def wFactor : ℕ → ℚ
  | 0 => 1
  | n + 1 => ((2 * n + 1 : ℚ) / (2 * n + 2 : ℚ)) * wFactor n

theorem integral_cos_even_pow (n : ℕ) :
    (∫ t in (0 : ℝ)..(π / 2), (cos t) ^ (2 * n)) = (wFactor n : ℝ) * (π / 2) := by
  induction n with
  | zero => simp [wFactor]
  | succ k ih =>
    rw [show 2 * (k + 1) = 2 * k + 2 by ring, integral_cos_pow, ih]
    simp only [cos_pi_div_two, sin_zero, wFactor, pow_succ, mul_zero, zero_mul, sub_zero,
      zero_div, zero_add]
    push_cast
    ring

/-! ### A polynomial majorant of `1 / √(2 - u)` on `[0, 1]` -/

/-- The coefficients `c_k = C(2k, k) / 8^k` of `(1 - u/2)^{-1/2} = ∑ c_k u^k`. -/
def halfBinom : ℕ → ℚ
  | 0 => 1
  | k + 1 => ((2 * k + 1 : ℚ) / (4 * (k + 1) : ℚ)) * halfBinom k

theorem halfBinom_pos (k : ℕ) : 0 < halfBinom k := by
  induction k with
  | zero => norm_num [halfBinom]
  | succ n ih =>
    simp only [halfBinom]
    positivity

/-- The truncated series with a tripled last term. -/
noncomputable def polyP (v : ℝ) : ℝ :=
  (∑ k ∈ Finset.range 21, (halfBinom k : ℝ) * v ^ k) + 3 * (halfBinom 21 : ℝ) * v ^ 21

/-- Its derivative. -/
noncomputable def polyDP (v : ℝ) : ℝ :=
  (∑ k ∈ Finset.range 21, (halfBinom k : ℝ) * ((k : ℝ) * v ^ (k - 1))) +
    63 * (halfBinom 21 : ℝ) * v ^ 20

/-- The majorant `M · P(u)`, `M = 707106782 / 10⁹ > 1 / √2`. -/
noncomputable def majorantPoly (u : ℝ) : ℝ :=
  (707106782 / 1000000000 : ℝ) * polyP u

theorem hasDerivAt_polyP (v : ℝ) : HasDerivAt polyP (polyDP v) v := by
  have hsum : HasDerivAt (fun w => ∑ k ∈ Finset.range 21, (halfBinom k : ℝ) * w ^ k)
      (∑ k ∈ Finset.range 21, (halfBinom k : ℝ) * ((k : ℝ) * v ^ (k - 1))) v :=
    HasDerivAt.fun_sum fun k _ => (hasDerivAt_pow k v).const_mul (halfBinom k : ℝ)
  have htail : HasDerivAt (fun w => 3 * (halfBinom 21 : ℝ) * w ^ 21)
      (63 * (halfBinom 21 : ℝ) * v ^ 20) v := by
    convert (hasDerivAt_pow 21 v).const_mul (3 * (halfBinom 21 : ℝ)) using 1
    rw [show (21 : ℕ) - 1 = 20 from rfl]
    push_cast
    ring
  exact hsum.add htail

theorem continuous_polyP : Continuous polyP :=
  continuous_iff_continuousAt.2 fun v => (hasDerivAt_polyP v).continuousAt

theorem continuous_majorantPoly : Continuous majorantPoly :=
  continuous_const.mul continuous_polyP

/-- The numerator of `G'`: all powers below `v²⁰` cancel. -/
theorem numerator_eq (v : ℝ) :
    (2 - v) * (2 * polyDP v) - polyP v = (halfBinom 21 : ℝ) * v ^ 20 * (168 - 129 * v) := by
  simp only [polyDP, polyP, Finset.sum_range_succ, Finset.sum_range_zero, halfBinom]
  push_cast
  ring

theorem one_div_sqrt_two_sub_le_majorant {u : ℝ} (hu0 : 0 ≤ u) (hu1 : u ≤ 1) :
    1 / Real.sqrt (2 - u) ≤ majorantPoly u := by
  have hG_deriv : ∀ v ∈ Set.Icc (0 : ℝ) 1,
      HasDerivAt (fun w => Real.sqrt (2 - w) * polyP w)
        (((2 - v) * (2 * polyDP v) - polyP v) / (2 * Real.sqrt (2 - v))) v := by
    intro v hv
    have h_pos : 0 < 2 - v := by linarith [hv.2]
    have hsq : Real.sqrt (2 - v) ≠ 0 := (Real.sqrt_pos.2 h_pos).ne'
    have hsq2 : Real.sqrt (2 - v) * Real.sqrt (2 - v) = 2 - v := Real.mul_self_sqrt h_pos.le
    have hd_sqrt : HasDerivAt (fun w => Real.sqrt (2 - w)) (-1 / (2 * Real.sqrt (2 - v))) v :=
      ((hasDerivAt_id' v).const_sub 2).sqrt h_pos.ne'
    convert hd_sqrt.mul (hasDerivAt_polyP v) using 1
    calc ((2 - v) * (2 * polyDP v) - polyP v) / (2 * Real.sqrt (2 - v))
        = (Real.sqrt (2 - v) * Real.sqrt (2 - v) * (2 * polyDP v) - polyP v) /
            (2 * Real.sqrt (2 - v)) := by rw [hsq2]
      _ = -1 / (2 * Real.sqrt (2 - v)) * polyP v + Real.sqrt (2 - v) * polyDP v := by
          field_simp
          ring
  have hG_mono : MonotoneOn (fun w => Real.sqrt (2 - w) * polyP w) (Set.Icc 0 1) := by
    refine monotoneOn_of_deriv_nonneg (convex_Icc 0 1)
      (fun v hv => (hG_deriv v hv).continuousAt.continuousWithinAt)
      (fun v hv => (hG_deriv v (interior_subset hv)).differentiableAt.differentiableWithinAt) ?_
    intro v hv
    have hv' : v ∈ Set.Icc (0 : ℝ) 1 := interior_subset hv
    rw [(hG_deriv v hv').deriv, numerator_eq]
    have hb : (0 : ℝ) < (halfBinom 21 : ℝ) := by exact_mod_cast halfBinom_pos 21
    have h1 : 0 ≤ 168 - 129 * v := by linarith [hv'.2]
    have h2 : 0 < Real.sqrt (2 - v) := Real.sqrt_pos.2 (by linarith [hv'.2])
    have h3 : 0 ≤ v ^ 20 := pow_nonneg hv'.1 20
    positivity
  have hP0 : polyP 0 = 1 := by
    simp [polyP, Finset.sum_range_succ, halfBinom]
  have hG_ge : Real.sqrt 2 ≤ Real.sqrt (2 - u) * polyP u := by
    have h := hG_mono ⟨le_rfl, zero_le_one⟩ ⟨hu0, hu1⟩ hu0
    simpa [hP0] using h
  have hsqrt2 : (1414213562 / 1000000000 : ℝ) ≤ Real.sqrt 2 :=
    Real.le_sqrt_of_sq_le (by norm_num)
  have hpos : 0 < Real.sqrt (2 - u) := Real.sqrt_pos.2 (by linarith)
  rw [div_le_iff₀ hpos, majorantPoly]
  nlinarith

/-! ### The bound `γ† < 7119595 / 10000000` -/

/-- The rational number `∑_{k ≤ 20} c_k w_{k+1} + 3 c₂₁ w₂₂`, with `w_n = wFactor n`. -/
def majorantSum : ℚ :=
  (∑ k ∈ Finset.range 21, halfBinom k * wFactor (k + 1)) + 3 * halfBinom 21 * wFactor 22

theorem integral_majorant :
    (∫ t in (0 : ℝ)..(π / 2), (cos t) ^ 2 * majorantPoly ((cos t) ^ 2)) =
      (707106782 / 1000000000 : ℝ) * (majorantSum : ℝ) * (π / 2) := by
  have h_expand : (fun t => (cos t) ^ 2 * majorantPoly ((cos t) ^ 2)) =
      fun t => (707106782 / 1000000000 : ℝ) *
        ((∑ k ∈ Finset.range 21, (halfBinom k : ℝ) * (cos t) ^ (2 * (k + 1))) +
          3 * (halfBinom 21 : ℝ) * (cos t) ^ (2 * 22)) := by
    funext t
    have hsum : (cos t) ^ 2 * ∑ k ∈ Finset.range 21, (halfBinom k : ℝ) * ((cos t) ^ 2) ^ k =
        ∑ k ∈ Finset.range 21, (halfBinom k : ℝ) * (cos t) ^ (2 * (k + 1)) := by
      rw [Finset.mul_sum]
      exact Finset.sum_congr rfl fun k _ => by ring
    simp only [majorantPoly, polyP]
    linear_combination (707106782 / 1000000000 : ℝ) * hsum
  have hi : ∀ n : ℕ, IntervalIntegrable (fun t => (cos t) ^ n) volume 0 (π / 2) :=
    fun n => (continuous_cos.pow n).intervalIntegrable _ _
  have hsumI : IntervalIntegrable
      (fun t => ∑ k ∈ Finset.range 21, (halfBinom k : ℝ) * (cos t) ^ (2 * (k + 1)))
      volume 0 (π / 2) :=
    (continuous_finsetSum _ fun k _ => continuous_const.mul (continuous_cos.pow _)).intervalIntegrable
      _ _
  rw [h_expand, intervalIntegral.integral_const_mul,
    intervalIntegral.integral_add hsumI ((hi _).const_mul _),
    intervalIntegral.integral_finsetSum
      (f := fun k t => (halfBinom k : ℝ) * (cos t) ^ (2 * (k + 1))) fun k _ => (hi _).const_mul _,
    intervalIntegral.integral_const_mul, integral_cos_even_pow 22]
  simp only [intervalIntegral.integral_const_mul, integral_cos_even_pow, majorantSum]
  push_cast
  simp only [← mul_assoc, ← Finset.sum_mul]
  ring

theorem haagerupDagger_lt_upper : haagerupDagger < (CertData.haagerupUpperQ : ℝ) := by
  have hle : ∀ t ∈ Set.Icc (0 : ℝ) (π / 2),
      (cos t) ^ 2 / Real.sqrt (1 + (sin t) ^ 2) ≤ (cos t) ^ 2 * majorantPoly ((cos t) ^ 2) := by
    intro t _
    have h_id : 1 + (sin t) ^ 2 = 2 - (cos t) ^ 2 := by linarith [sin_sq_add_cos_sq t]
    rw [h_id, div_eq_mul_one_div]
    exact mul_le_mul_of_nonneg_left
      (one_div_sqrt_two_sub_le_majorant (sq_nonneg _) (cos_sq_le_one t)) (sq_nonneg _)
  have hg : Continuous fun t => (cos t) ^ 2 * majorantPoly ((cos t) ^ 2) :=
    (continuous_cos.pow 2).mul (continuous_majorantPoly.comp (continuous_cos.pow 2))
  have hmono := intervalIntegral.integral_mono_on (μ := volume) (by positivity)
    (continuous_integrand.intervalIntegrable _ _) (hg.intervalIntegrable _ _) hle
  rw [integral_majorant] at hmono
  have hpi : π < 31415926536 / 10000000000 := by
    have := pi_lt_d20
    norm_num at this ⊢
    linarith
  have hS : (0 : ℝ) < (majorantSum : ℝ) := by
    have : (0 : ℚ) < majorantSum := by
      norm_num [majorantSum, Finset.sum_range_succ, halfBinom, wFactor]
    exact_mod_cast this
  have hnum : (707106782 / 1000000000 : ℝ) * (majorantSum : ℝ) * ((31415926536 / 10000000000) / 2) <
      (CertData.haagerupUpperQ : ℝ) := by
    have h : (707106782 / 1000000000 : ℚ) * majorantSum * ((31415926536 / 10000000000) / 2) <
        CertData.haagerupUpperQ := by
      norm_num [majorantSum, Finset.sum_range_succ, halfBinom, wFactor, CertData.haagerupUpperQ]
    have h' : (((707106782 / 1000000000 : ℚ) * majorantSum * ((31415926536 / 10000000000) / 2) : ℚ) :
        ℝ) < (CertData.haagerupUpperQ : ℝ) := Rat.cast_lt.2 h
    push_cast at h'
    linarith
  unfold haagerupDagger
  calc _ ≤ (707106782 / 1000000000 : ℝ) * (majorantSum : ℝ) * (π / 2) := hmono
    _ < (707106782 / 1000000000 : ℝ) * (majorantSum : ℝ) * ((31415926536 / 10000000000) / 2) := by
        gcongr
    _ < _ := hnum

end HaagerupBound

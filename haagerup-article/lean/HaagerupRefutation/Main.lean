import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Bounds
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.Real.Pi.Bounds
import Mathlib.Topology.Algebra.InfiniteSum.Real
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Tactic

namespace HaagerupRefutation
open MeasureTheory intervalIntegral Real
open scoped BigOperators

/-! ## 1. Exact Rational Certificate Data (cert_final) -/

def certDenom : ℚ := 1000000000000
def w1 : ℚ := 971858734217 / certDenom
def w2 : ℚ := 8906483332   / certDenom
def w3 : ℚ := 201845612    / certDenom
def w4 : ℚ := 18797147285  / certDenom
def w5 : ℚ := 50102530     / certDenom
def w6 : ℚ := 185687024    / certDenom
def wGT : ℚ := w1 + w2 + w3

def l1Norm (cs : List ℚ) : ℚ := (cs.map (fun x => |x|)).sum

def P1 : List ℚ := [991833356533 / certDenom, -8166643466 / certDenom]
def Q1 : List ℚ := [0, -1]
def P2 : List ℚ := [989554427299 / certDenom, 0, 0, -10445572700 / certDenom]
def Q2 : List ℚ := [0, -833435315100 / certDenom, 0, -166564684899 / certDenom]
def P3 : List ℚ := [91371963319 / certDenom, -825194568310 / certDenom, 0, -83433468370 / certDenom]
def Q3 : List ℚ := [0, -999999999999 / certDenom]
def R4 : List ℚ := [920082833249 / certDenom, -79917166750 / certDenom]
def R5 : List ℚ := [211831968397 / certDenom, -67863691543 / certDenom, 720304340059 / certDenom]
def R6 : List ℚ := [364133034656 / certDenom, -635866965343 / certDenom]

theorem cert_l1_and_weights_valid :
    w1 + w2 + w3 + w4 + w5 + w6 = 1 ∧
    l1Norm P1 ≤ 1 ∧ l1Norm Q1 ≤ 1 ∧ l1Norm P2 ≤ 1 ∧ l1Norm Q2 ≤ 1 ∧
    l1Norm P3 ≤ 1 ∧ l1Norm Q3 ≤ 1 ∧ l1Norm R4 ≤ 1 ∧ l1Norm R5 ≤ 1 ∧ l1Norm R6 ≤ 1 := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;>
    norm_num [l1Norm, certDenom, w1, w2, w3, w4, w5, w6, P1, Q1, P2, Q2, P3, Q3, R4, R5, R6]

def h0LowerQ        : ℚ := 711968933048 / certDenom
def headL1UpperQ    : ℚ := 1248782 / certDenom
def univGTErrUpperQ : ℚ := 1494117 / certDenom
def hardyTailUpperQ : ℚ := 32 / 1000000000
def haagerupUpperQ  : ℚ := 7119595 / 10000000
def certDLowerQ     : ℚ := h0LowerQ - headL1UpperQ - wGT * univGTErrUpperQ - hardyTailUpperQ

theorem cert_rational_margins :
    haagerupUpperQ < certDLowerQ ∧ 1 / certDLowerQ < 140456109 / 100000000 := by
  constructor <;>
    norm_num [certDLowerQ, haagerupUpperQ, h0LowerQ, headL1UpperQ, wGT, w1, w2, w3,
              certDenom, univGTErrUpperQ, hardyTailUpperQ]

/-! ## 2. Enclosure of Haagerup's Constant 0 < haagerupDagger < 7119595 / 10^7 -/

noncomputable def haagerupDagger : ℝ :=
  ∫ t in (0 : ℝ)..(Real.pi / 2), (Real.cos t) ^ 2 / Real.sqrt (1 + (Real.sin t) ^ 2)

def wFactor : ℕ → ℚ
  | 0 => 1
  | n + 1 => ((2 * n + 1 : ℚ) / (2 * n + 2 : ℚ)) * wFactor n

theorem integral_cos_even_pow (n : ℕ) :
    (∫ t in (0 : ℝ)..(Real.pi / 2), (Real.cos t) ^ (2 * n)) = (wFactor n : ℝ) * (Real.pi / 2) := by
  induction n with
  | zero => simp [wFactor]
  | succ k ih =>
    have hderiv : ∀ t : ℝ, HasDerivAt (fun x => Real.sin x * (Real.cos x) ^ (2 * k + 1))
        ((2 * (k : ℝ) + 2) * (Real.cos t) ^ (2 * (k + 1)) - (2 * (k : ℝ) + 1) * (Real.cos t) ^ (2 * k)) t := by
      intro t
      have hd_pow : HasDerivAt (fun x => (Real.cos x) ^ (2 * k + 1))
          (((2 * k + 1 : ℕ) : ℝ) * (Real.cos t) ^ (2 * k) * (-Real.sin t)) t := by
        simpa using (Real.hasDerivAt_cos t).fun_pow (2 * k + 1)
      convert (Real.hasDerivAt_sin t).fun_mul hd_pow using 1
      push_cast
      linear_combination (2 * (k : ℝ) + 1) * Real.cos t ^ (2 * k) * Real.sin_sq_add_cos_sq t
    have hi1 : IntervalIntegrable (fun t => (Real.cos t) ^ (2 * (k + 1))) volume 0 (Real.pi / 2) :=
      (Real.continuous_cos.pow _).intervalIntegrable 0 (Real.pi / 2)
    have hi0 : IntervalIntegrable (fun t => (Real.cos t) ^ (2 * k)) volume 0 (Real.pi / 2) :=
      (Real.continuous_cos.pow _).intervalIntegrable 0 (Real.pi / 2)
    have hftc := integral_eq_sub_of_hasDerivAt (fun x _ => hderiv x) ((hi1.const_mul _).sub (hi0.const_mul _))
    have hc0 : Real.cos (Real.pi / 2) ^ (2 * k + 1) = 0 := by
      rw [Real.cos_pi_div_two]; exact zero_pow (by omega)
    rw [intervalIntegral.integral_sub (hi1.const_mul _) (hi0.const_mul _), intervalIntegral.integral_const_mul,
      intervalIntegral.integral_const_mul, ih, hc0, Real.sin_zero, mul_zero, zero_mul, sub_zero] at hftc
    have hk_pos : (2 * (k : ℝ) + 2) ≠ 0 := by positivity
    have hw : (wFactor (k + 1) : ℝ) = (2 * (k : ℝ) + 1) / (2 * (k : ℝ) + 2) * (wFactor k : ℝ) := by
      rw [wFactor]; push_cast; ring
    have hI : (∫ t in (0 : ℝ)..(Real.pi / 2), Real.cos t ^ (2 * (k + 1))) =
        (2 * (k : ℝ) + 1) * ((wFactor k : ℝ) * (Real.pi / 2)) / (2 * (k : ℝ) + 2) := by
      rw [eq_div_iff hk_pos]; linarith
    rw [hI, hw]; ring

theorem haagerupDagger_pos : 0 < haagerupDagger := by
  have hpi : (0 : ℝ) ≤ Real.pi / 2 := by positivity
  have hf : IntervalIntegrable (fun t => (Real.cos t) ^ 2 / Real.sqrt (1 + (Real.sin t) ^ 2)) volume 0 (Real.pi / 2) := by
    apply ContinuousOn.intervalIntegrable; intro t _; apply ContinuousAt.continuousWithinAt
    exact (Real.continuous_cos.continuousAt.pow 2).div
      (Continuous.continuousAt (Real.continuous_sqrt.comp (continuous_const.add (Real.continuous_sin.pow 2)))) (by positivity)
  have hg : IntervalIntegrable (fun t => (1 / 2 : ℝ) * (Real.cos t) ^ (2 * 1)) volume 0 (Real.pi / 2) :=
    ((Real.continuous_cos.pow 2).const_mul (1 / 2)).intervalIntegrable 0 (Real.pi / 2)
  have hle : ∀ t ∈ Set.Icc (0 : ℝ) (Real.pi / 2),
      (1 / 2 : ℝ) * (Real.cos t) ^ (2 * 1) ≤ (Real.cos t) ^ 2 / Real.sqrt (1 + (Real.sin t) ^ 2) := by
    intro t _
    rw [one_div_mul_eq_div, pow_mul, pow_one]
    refine div_le_div_of_nonneg_left (sq_nonneg _) (Real.sqrt_pos.mpr (by positivity)) ?_
    calc Real.sqrt (1 + (Real.sin t) ^ 2)
      _ ≤ Real.sqrt 4 := Real.sqrt_le_sqrt (by linarith [Real.sin_sq_le_one t])
      _ = 2 := by norm_num
  have hmono := integral_mono_on hpi hg hf hle
  rw [intervalIntegral.integral_const_mul, integral_cos_even_pow 1] at hmono
  norm_num [wFactor] at hmono
  unfold haagerupDagger; linarith [Real.pi_pos]

def halfBinom : ℕ → ℚ
  | 0 => 1
  | k + 1 => ((2 * k + 1 : ℚ) / (4 * (k + 1) : ℚ)) * halfBinom k

noncomputable def majorantPoly (u : ℝ) : ℝ :=
  (707106782 / 1000000000 : ℝ) *
    ((∑ k ∈ Finset.range 21, (halfBinom k : ℝ) * u ^ k) + (21 / 10 : ℝ) * (halfBinom 21 : ℝ) * u ^ 21)

theorem one_div_sqrt_two_sub_le_majorant {u : ℝ} (hu0 : 0 ≤ u) (hu1 : u ≤ 1) :
    1 / Real.sqrt (2 - u) ≤ majorantPoly u := by
  obtain ⟨P, hP⟩ : ∃ P : ℝ → ℝ, ∀ v, P v =
      (∑ k ∈ Finset.range 21, (halfBinom k : ℝ) * v ^ k) + (21 / 10 : ℝ) * (halfBinom 21 : ℝ) * v ^ 21 :=
    ⟨_, fun _ => rfl⟩
  obtain ⟨DP, hDP⟩ : ∃ DP : ℝ → ℝ, ∀ v, DP v =
      (∑ j ∈ Finset.range 20, ((j + 1 : ℕ) : ℝ) * (halfBinom (j + 1) : ℝ) * v ^ j) +
        (441 / 10 : ℝ) * (halfBinom 21 : ℝ) * v ^ 20 :=
    ⟨_, fun _ => rfl⟩
  have hP_deriv : ∀ v, HasDerivAt P (DP v) v := by
    intro v
    have hd : HasDerivAt (fun w => (∑ k ∈ Finset.range 21, (halfBinom k : ℝ) * w ^ k) +
          (21 / 10 : ℝ) * (halfBinom 21 : ℝ) * w ^ 21)
        ((∑ k ∈ Finset.range 21, (halfBinom k : ℝ) * ((k : ℝ) * v ^ (k - 1))) +
          (21 / 10 : ℝ) * (halfBinom 21 : ℝ) * (((21 : ℕ) : ℝ) * v ^ (21 - 1))) v :=
      (HasDerivAt.fun_sum (u := Finset.range 21) fun k _ =>
        (hasDerivAt_pow k v).const_mul (halfBinom k : ℝ)).fun_add
        ((hasDerivAt_pow 21 v).const_mul ((21 / 10 : ℝ) * (halfBinom 21 : ℝ)))
    rw [show P = _ from funext hP, hDP]
    convert hd using 1
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    push_cast
    ring
  have h2u_pos : ∀ v ∈ Set.Icc (0 : ℝ) 1, 0 < 2 - v := fun _ hv => by linarith [hv.2]
  have hG_deriv : ∀ v ∈ Set.Icc (0 : ℝ) 1,
      HasDerivAt (fun w => Real.sqrt (2 - w) * P w)
        (((2 - v) * (2 * DP v) - P v) / (2 * Real.sqrt (2 - v))) v := by
    intro v hv
    have h_pos := h2u_pos v hv
    have hd_sqrt : HasDerivAt (fun w => Real.sqrt (2 - w)) (-1 / (2 * Real.sqrt (2 - v))) v := by
      simpa [div_eq_mul_inv, mul_comm] using ((hasDerivAt_const v (2 : ℝ)).sub (hasDerivAt_id v)).sqrt h_pos.ne'
    have hsq : Real.sqrt (2 - v) ≠ 0 := (Real.sqrt_pos.mpr h_pos).ne'
    have hsq2 : Real.sqrt (2 - v) * Real.sqrt (2 - v) = 2 - v := Real.mul_self_sqrt h_pos.le
    convert hd_sqrt.fun_mul (hP_deriv v) using 1
    field_simp
    linear_combination (-2 * DP v) * hsq2
  have h_num_nn : ∀ v ∈ Set.Icc (0 : ℝ) 1, 0 ≤ (2 - v) * (2 * DP v) - P v := by
    intro v ⟨hv0, hv1⟩
    have h_id : (2 - v) * (2 * DP v) - P v =
        (halfBinom 21 : ℝ) * v ^ 20 * ((462 / 5 : ℝ) - (903 / 10 : ℝ) * v) := by
      rw [hDP, hP]
      simp only [Finset.sum_range_succ, Finset.sum_range_zero, halfBinom]
      push_cast
      ring
    rw [h_id]
    have hb21 : (0 : ℝ) < (halfBinom 21 : ℝ) := by norm_num [halfBinom]
    have hlin : 0 ≤ (462 / 5 : ℝ) - (903 / 10 : ℝ) * v := by linarith
    positivity
  have hG_mono : MonotoneOn (fun w => Real.sqrt (2 - w) * P w) (Set.Icc 0 1) := by
    apply monotoneOn_of_deriv_nonneg (convex_Icc (0 : ℝ) 1)
      (fun v hv => (hG_deriv v hv).continuousAt.continuousWithinAt)
      (fun v hv => (hG_deriv v (interior_subset hv)).differentiableAt.differentiableWithinAt)
    intro v hv; have hvi := interior_subset hv
    rw [(hG_deriv v hvi).deriv]
    exact div_nonneg (h_num_nn v hvi) (mul_pos (by norm_num) (Real.sqrt_pos.mpr (h2u_pos v hvi))).le
  have hG_ge : Real.sqrt 2 ≤ Real.sqrt (2 - u) * P u := by
    have h0 := hG_mono ⟨le_rfl, zero_le_one⟩ ⟨hu0, hu1⟩ hu0
    have hP0 : P 0 = 1 := by rw [hP]; norm_num [Finset.sum_range_succ, halfBinom]
    simpa only [sub_zero, hP0, mul_one] using h0
  have h_s2 : 1 ≤ Real.sqrt 2 * (707106782 / 1000000000 : ℝ) := by
    rw [← sq_le_sq₀ zero_le_one (by positivity), mul_pow, Real.sq_sqrt (by norm_num)]; norm_num
  rw [div_le_iff₀ (Real.sqrt_pos.mpr (by linarith)), majorantPoly, ← hP]
  calc (1 : ℝ)
    _ ≤ Real.sqrt 2 * (707106782 / 1000000000 : ℝ) := h_s2
    _ ≤ (Real.sqrt (2 - u) * P u) * (707106782 / 1000000000 : ℝ) := mul_le_mul_of_nonneg_right hG_ge (by positivity)
    _ = (707106782 / 1000000000 : ℝ) * P u * Real.sqrt (2 - u) := by ring

theorem haagerupDagger_lt_upper : haagerupDagger < (haagerupUpperQ : ℝ) := by
  have hpi : (0 : ℝ) ≤ Real.pi / 2 := by positivity
  have hf : IntervalIntegrable (fun t => (Real.cos t) ^ 2 / Real.sqrt (1 + (Real.sin t) ^ 2)) volume 0 (Real.pi / 2) := by
    apply ContinuousOn.intervalIntegrable; intro t _; apply ContinuousAt.continuousWithinAt
    exact (Real.continuous_cos.continuousAt.pow 2).div
      (Continuous.continuousAt (Real.continuous_sqrt.comp (continuous_const.add (Real.continuous_sin.pow 2)))) (by positivity)
  have hexp : (fun t => (Real.cos t) ^ 2 * majorantPoly ((Real.cos t) ^ 2)) =
      fun t => (∑ k ∈ Finset.range 21,
          ((707106782 / 1000000000 : ℝ) * (halfBinom k : ℝ)) * (Real.cos t) ^ (2 * (k + 1))) +
        ((707106782 / 1000000000 : ℝ) * ((21 / 10 : ℝ) * (halfBinom 21 : ℝ))) * (Real.cos t) ^ (2 * 22) := by
    funext t
    rw [majorantPoly, mul_add, mul_add, Finset.mul_sum, Finset.mul_sum]
    congr 1
    · refine Finset.sum_congr rfl fun k _ => ?_
      rw [← pow_mul]; ring
    · rw [← pow_mul]; ring
  have hint : ∀ k ∈ Finset.range 21, IntervalIntegrable
      (fun t => ((707106782 / 1000000000 : ℝ) * (halfBinom k : ℝ)) * (Real.cos t) ^ (2 * (k + 1)))
      volume 0 (Real.pi / 2) :=
    fun k _ => ((Real.continuous_cos.pow _).const_mul _).intervalIntegrable _ _
  have hi_sum : IntervalIntegrable (fun t => ∑ k ∈ Finset.range 21,
      ((707106782 / 1000000000 : ℝ) * (halfBinom k : ℝ)) * (Real.cos t) ^ (2 * (k + 1))) volume 0 (Real.pi / 2) :=
    IntervalIntegrable.sum (Finset.range 21) hint
  have hi_tail : IntervalIntegrable (fun t => ((707106782 / 1000000000 : ℝ) * ((21 / 10 : ℝ) * (halfBinom 21 : ℝ))) *
      (Real.cos t) ^ (2 * 22)) volume 0 (Real.pi / 2) :=
    ((Real.continuous_cos.pow _).const_mul _).intervalIntegrable _ _
  have hmaj : IntervalIntegrable (fun t => (Real.cos t) ^ 2 * majorantPoly ((Real.cos t) ^ 2)) volume 0 (Real.pi / 2) := by
    rw [hexp]; exact hi_sum.add hi_tail
  have h_int_le := integral_mono_on hpi hf hmaj fun t _ => by
    have hid : 1 + (Real.sin t) ^ 2 = 2 - (Real.cos t) ^ 2 := by linarith [Real.sin_sq_add_cos_sq t]
    rw [hid, div_eq_mul_one_div]
    exact mul_le_mul_of_nonneg_left (one_div_sqrt_two_sub_le_majorant (sq_nonneg _) (Real.cos_sq_le_one t)) (sq_nonneg _)
  have h_eval : (∫ t in (0 : ℝ)..(Real.pi / 2), (Real.cos t) ^ 2 * majorantPoly ((Real.cos t) ^ 2)) =
      (707106782 / 1000000000 : ℝ) *
        ((∑ k ∈ Finset.range 21, (halfBinom k : ℝ) * (wFactor (k + 1) : ℝ) / 2) +
          (21 / 20 : ℝ) * (halfBinom 21 : ℝ) * (wFactor 22 : ℝ)) * Real.pi := by
    rw [hexp, intervalIntegral.integral_add hi_sum hi_tail, intervalIntegral.integral_finsetSum hint,
      intervalIntegral.integral_const_mul, integral_cos_even_pow 22]
    have hsum : (∑ k ∈ Finset.range 21, ∫ t in (0 : ℝ)..(Real.pi / 2),
        ((707106782 / 1000000000 : ℝ) * (halfBinom k : ℝ)) * (Real.cos t) ^ (2 * (k + 1))) =
        ∑ k ∈ Finset.range 21,
          ((707106782 / 1000000000 : ℝ) * (halfBinom k : ℝ)) * ((wFactor (k + 1) : ℝ) * (Real.pi / 2)) :=
      Finset.sum_congr rfl fun k _ => by rw [intervalIntegral.integral_const_mul, integral_cos_even_pow (k + 1)]
    rw [hsum]
    simp only [mul_add, add_mul, Finset.mul_sum, Finset.sum_mul]
    congr 1
    · exact Finset.sum_congr rfl fun k _ => by ring
    · ring
  set C_rat : ℝ := (707106782 / 1000000000 : ℝ) *
    ((∑ k ∈ Finset.range 21, (halfBinom k : ℝ) * (wFactor (k + 1) : ℝ) / 2) +
      (21 / 20 : ℝ) * (halfBinom 21 : ℝ) * (wFactor 22 : ℝ)) with hC_def
  have hC_pos : 0 < C_rat := by rw [hC_def]; norm_num [Finset.sum_range_succ, halfBinom, wFactor]
  have hpi_lt : Real.pi < 31415926536 / 10000000000 := by linarith [Real.pi_lt_d20]
  unfold haagerupDagger
  calc ∫ t in (0 : ℝ)..(Real.pi / 2), (Real.cos t) ^ 2 / Real.sqrt (1 + (Real.sin t) ^ 2)
    _ ≤ C_rat * Real.pi := h_int_le.trans h_eval.le
    _ < C_rat * (31415926536 / 10000000000 : ℝ) := mul_lt_mul_of_pos_left hpi_lt hC_pos
    _ < (haagerupUpperQ : ℝ) := by rw [hC_def]; norm_num [haagerupUpperQ, Finset.sum_range_succ, halfBinom, wFactor]

/-! ## 3. Universal Alternating Ceiling and Convex No-Go Theorem -/

noncomputable def transferMargin (h : ℕ → ℝ) : ℝ := h 0 - ∑' k : ℕ, |h (k + 1)|
noncomputable def alternatingVal (h : ℕ → ℝ) : ℝ := ∑' k : ℕ, (-1 : ℝ) ^ k * h k

theorem transferMargin_le_alternatingVal {h : ℕ → ℝ} (hs : Summable (fun k => |h k|)) :
    transferMargin h ≤ alternatingVal h := by
  unfold transferMargin alternatingVal
  have hsa : Summable (fun k => (-1 : ℝ) ^ k * h k) :=
    Summable.of_norm_bounded hs (fun k => by simp)
  rw [hsa.tsum_eq_zero_add]; simp only [pow_zero, one_mul]
  have hle := Summable.tsum_le_tsum (fun k => (le_abs_self _).trans_eq (by simp [abs_mul]))
    (((summable_nat_add_iff 1).mpr hsa).neg) ((summable_nat_add_iff 1).mpr hs)
  rw [tsum_neg] at hle; linarith

theorem convex_no_go_below_ceiling {ι : Type*} (s : Finset ι) (w : ι → ℝ)
    (hw_nn : ∀ i ∈ s, 0 ≤ w i) (hw_sum : ∑ i ∈ s, w i = 1)
    (h : ι → ℕ → ℝ) (hs : ∀ i ∈ s, Summable (fun k => |h i k|))
    {C : ℝ} (h_ceil : ∀ i ∈ s, alternatingVal (h i) ≤ C) :
    transferMargin (fun k => ∑ i ∈ s, w i * h i k) ≤ C := by
  have h_maj : Summable (fun k => ∑ i ∈ s, w i * |h i k|) :=
    summable_sum fun i hi => (hs i hi).mul_left (w i)
  have hH : Summable (fun k => |∑ i ∈ s, w i * h i k|) :=
    Summable.of_nonneg_of_le (fun _ => abs_nonneg _)
      (fun k => (Finset.abs_sum_le_sum_abs _ _).trans_eq
        (Finset.sum_congr rfl fun i hi => by rw [abs_mul, abs_of_nonneg (hw_nn i hi)])) h_maj
  have h_lin : alternatingVal (fun k => ∑ i ∈ s, w i * h i k) = ∑ i ∈ s, w i * alternatingVal (h i) := by
    unfold alternatingVal
    have hsi : ∀ i ∈ s, Summable (fun k => w i * ((-1 : ℝ) ^ k * h i k)) := fun i hi =>
      (Summable.of_norm_bounded (hs i hi) (fun k => by simp)).mul_left (w i)
    have hfn : (fun k => (-1 : ℝ) ^ k * ∑ i ∈ s, w i * h i k) = fun k => ∑ i ∈ s, w i * ((-1 : ℝ) ^ k * h i k) := by
      ext k; rw [Finset.mul_sum]; exact Finset.sum_congr rfl fun _ _ => by ring
    rw [hfn, Summable.tsum_finsetSum hsi]; exact Finset.sum_congr rfl fun _ _ => tsum_mul_left
  calc transferMargin (fun k => ∑ i ∈ s, w i * h i k)
    _ ≤ alternatingVal (fun k => ∑ i ∈ s, w i * h i k) := transferMargin_le_alternatingVal hH
    _ = ∑ i ∈ s, w i * alternatingVal (h i) := h_lin
    _ ≤ ∑ i ∈ s, w i * C := Finset.sum_le_sum fun i hi => mul_le_mul_of_nonneg_left (h_ceil i hi) (hw_nn i hi)
    _ = C := by rw [← Finset.sum_mul, hw_sum, one_mul]

/-! ## 4. Complex Grothendieck Constant, Radial Schur Transfer and Refutation -/

def cInner {N : ℕ} (u v : Fin N → ℂ) : ℂ := ∑ i : Fin N, starRingEnd ℂ (u i) * v i
noncomputable def cNormSq {N : ℕ} (u : Fin N → ℂ) : ℝ := ∑ i : Fin N, ‖u i‖ ^ 2

theorem norm_cInner_le_one {N : ℕ} {u v : Fin N → ℂ} (hu : cNormSq u ≤ 1) (hv : cNormSq v ≤ 1) :
    ‖cInner u v‖ ≤ 1 := by
  have hcs : (∑ i : Fin N, ‖u i‖ * ‖v i‖) ^ 2 ≤ (∑ i : Fin N, ‖u i‖ ^ 2) * (∑ i : Fin N, ‖v i‖ ^ 2) :=
    Finset.sum_mul_sq_le_sq_mul_sq Finset.univ (fun i => ‖u i‖) (fun i => ‖v i‖)
  have hprod : (∑ i : Fin N, ‖u i‖ ^ 2) * (∑ i : Fin N, ‖v i‖ ^ 2) ≤ 1 :=
    (mul_le_of_le_one_left (Finset.sum_nonneg fun _ _ => sq_nonneg _) hu).trans hv
  have hsum_nn : 0 ≤ ∑ i : Fin N, ‖u i‖ * ‖v i‖ := Finset.sum_nonneg fun _ _ => mul_nonneg (norm_nonneg _) (norm_nonneg _)
  have hsum_le : ∑ i : Fin N, ‖u i‖ * ‖v i‖ ≤ 1 := by nlinarith
  calc ‖cInner u v‖
    _ ≤ ∑ i : Fin N, ‖starRingEnd ℂ (u i) * v i‖ := norm_sum_le _ _
    _ = ∑ i : Fin N, ‖u i‖ * ‖v i‖ := Finset.sum_congr rfl fun i _ => by rw [norm_mul, Complex.norm_conj]
    _ ≤ 1 := hsum_le

noncomputable def classicalNorm {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℂ) : ℝ :=
  sSup { r : ℝ | ∃ (z : Fin m → ℂ) (w : Fin n → ℂ), (∀ p, ‖z p‖ ≤ 1) ∧ (∀ q, ‖w q‖ ≤ 1) ∧
    r = ‖∑ p : Fin m, ∑ q : Fin n, A p q * starRingEnd ℂ (z p) * w q‖ }

noncomputable def quantumNorm {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℂ) : ℝ :=
  sSup { r : ℝ | ∃ (N : ℕ) (u : Fin m → Fin N → ℂ) (v : Fin n → Fin N → ℂ),
    (∀ p, cNormSq (u p) ≤ 1) ∧ (∀ q, cNormSq (v q) ≤ 1) ∧
    r = ‖∑ p : Fin m, ∑ q : Fin n, A p q * cInner (u p) (v q)‖ }

noncomputable def complexGrothendieckConstant : ℝ :=
  sInf { K : ℝ | 0 ≤ K ∧ ∀ (m n : ℕ) (A : Matrix (Fin m) (Fin n) ℂ), quantumNorm A ≤ K * classicalNorm A }

def tensorVec {N1 N2 : ℕ} (x : Fin N1 → ℂ) (y : Fin N2 → ℂ) : Fin (N1 * N2) → ℂ :=
  fun idx => x (finProdFinEquiv.symm idx).1 * y (finProdFinEquiv.symm idx).2

def conjVec {N : ℕ} (x : Fin N → ℂ) : Fin N → ℂ := fun i => starRingEnd ℂ (x i)
def radDim (N : ℕ) : ℕ → ℕ | 0 => N | k + 1 => radDim N k * (N * N)

def radLift {N : ℕ} (x : Fin N → ℂ) : (k : ℕ) → Fin (radDim N k) → ℂ
  | 0 => x | k + 1 => tensorVec (radLift x k) (tensorVec x (conjVec x))

theorem cInner_tensorVec {N1 N2 : ℕ} (x1 x2 : Fin N1 → ℂ) (y1 y2 : Fin N2 → ℂ) :
    cInner (tensorVec x1 y1) (tensorVec x2 y2) = cInner x1 x2 * cInner y1 y2 := by
  unfold cInner tensorVec
  rw [← finProdFinEquiv.sum_comp]
  simp only [Equiv.symm_apply_apply, map_mul, Finset.sum_mul_sum, ← Fintype.sum_prod_type']
  exact Finset.sum_congr rfl fun _ _ => by ring

theorem cNormSq_tensorVec {N1 N2 : ℕ} (x : Fin N1 → ℂ) (y : Fin N2 → ℂ) :
    cNormSq (tensorVec x y) = cNormSq x * cNormSq y := by
  unfold cNormSq tensorVec
  rw [← finProdFinEquiv.sum_comp]
  simp only [Equiv.symm_apply_apply, norm_mul, mul_pow, Finset.sum_mul_sum, ← Fintype.sum_prod_type']

theorem cNormSq_radLift_le_one {N : ℕ} {x : Fin N → ℂ} (hx : cNormSq x ≤ 1) (k : ℕ) :
    cNormSq (radLift x k) ≤ 1 := by
  have hconj : cNormSq (conjVec x) = cNormSq x := by
    unfold cNormSq conjVec; simp only [Complex.norm_conj]
  have h0x : 0 ≤ cNormSq x := Finset.sum_nonneg fun _ _ => sq_nonneg _
  induction k with
  | zero => exact hx
  | succ k ih =>
    change @cNormSq (radDim N k * (N * N)) (tensorVec (radLift x k) (tensorVec x (conjVec x))) ≤ 1
    rw [cNormSq_tensorVec, cNormSq_tensorVec, hconj]
    have hin : cNormSq x * cNormSq x ≤ 1 := (mul_le_of_le_one_left h0x hx).trans hx
    exact (mul_le_of_le_one_left (mul_nonneg h0x h0x) ih).trans hin

theorem cInner_radLift {N : ℕ} (x y : Fin N → ℂ) (k : ℕ) :
    cInner (radLift x k) (radLift y k) = cInner x y * ((‖cInner x y‖ ^ 2 : ℝ) : ℂ) ^ k := by
  have hic : cInner (conjVec x) (conjVec y) = starRingEnd ℂ (cInner x y) := by
    unfold cInner conjVec; rw [map_sum]
    exact Finset.sum_congr rfl fun _ _ => by simp only [map_mul, RingHomCompTriple.comp_apply, RingHom.id_apply]
  have hns : cInner x y * starRingEnd ℂ (cInner x y) = ((‖cInner x y‖ ^ 2 : ℝ) : ℂ) := by
    rw [Complex.mul_conj', Complex.ofReal_pow]
  induction k with
  | zero => simp only [pow_zero, mul_one]; rfl
  | succ k ih =>
    change @cInner (radDim N k * (N * N)) (tensorVec (radLift x k) (tensorVec x (conjVec x)))
      (tensorVec (radLift y k) (tensorVec y (conjVec y))) = _
    rw [cInner_tensorVec, cInner_tensorVec, hic, ih, hns, pow_succ _ k]
    ring

theorem quantumNorm_bddAbove {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℂ) :
    BddAbove { r : ℝ | ∃ (N : ℕ) (u : Fin m → Fin N → ℂ) (v : Fin n → Fin N → ℂ),
      (∀ p, cNormSq (u p) ≤ 1) ∧ (∀ q, cNormSq (v q) ≤ 1) ∧
      r = ‖∑ p, ∑ q, A p q * cInner (u p) (v q)‖ } := by
  refine ⟨∑ p, ∑ q, ‖A p q‖, ?_⟩; rintro r ⟨N, u, v, hu, hv, rfl⟩
  refine (norm_sum_le _ _).trans (Finset.sum_le_sum fun p _ => (norm_sum_le _ _).trans (Finset.sum_le_sum fun q _ => ?_))
  rw [norm_mul]; exact mul_le_of_le_one_right (norm_nonneg _) (norm_cInner_le_one (hu p) (hv q))

structure DominatedRadialSeries (h : ℕ → ℝ) : Prop where
  summable_abs : Summable (fun k => |h k|)
  le_classical : ∀ {m n N : ℕ} (A : Matrix (Fin m) (Fin n) ℂ)
    (u : Fin m → Fin N → ℂ) (v : Fin n → Fin N → ℂ),
    (∀ p, cNormSq (u p) ≤ 1) → (∀ q, cNormSq (v q) ≤ 1) →
    ‖∑' k : ℕ, (h k : ℂ) * ∑ p, ∑ q, A p q * (cInner (u p) (v q) * ((‖cInner (u p) (v q)‖ ^ 2 : ℝ) : ℂ) ^ k)‖ ≤
      classicalNorm A

/-- Every radial degree is bounded by the quantum norm: the radial lifts of `u`, `v` are unit vectors. -/
theorem norm_radialSum_le_quantumNorm {m n N : ℕ} (A : Matrix (Fin m) (Fin n) ℂ)
    (u : Fin m → Fin N → ℂ) (v : Fin n → Fin N → ℂ)
    (hu : ∀ p, cNormSq (u p) ≤ 1) (hv : ∀ q, cNormSq (v q) ≤ 1) (k : ℕ) :
    ‖∑ p, ∑ q, A p q * (cInner (u p) (v q) * ((‖cInner (u p) (v q)‖ ^ 2 : ℝ) : ℂ) ^ k)‖ ≤ quantumNorm A := by
  have heq : (∑ p, ∑ q, A p q * (cInner (u p) (v q) * ((‖cInner (u p) (v q)‖ ^ 2 : ℝ) : ℂ) ^ k)) =
      ∑ p, ∑ q, A p q * cInner (radLift (u p) k) (radLift (v q) k) :=
    Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => by rw [cInner_radLift]
  rw [heq]; exact le_csSup (quantumNorm_bddAbove A)
    ⟨radDim N k, fun p => radLift (u p) k, fun q => radLift (v q) k,
     fun p => cNormSq_radLift_le_one (hu p) k, fun q => cNormSq_radLift_le_one (hv q) k, rfl⟩

theorem complexGrothendieckConstant_le_inv_of_dominated {h : ℕ → ℝ}
    (hdom : DominatedRadialSeries h) {D : ℝ} (hD_pos : 0 < D) (hD_le : D ≤ transferMargin h) :
    complexGrothendieckConstant ≤ 1 / D := by
  unfold transferMargin at hD_le
  refine csInf_le ⟨0, fun _ hK => hK.1⟩ ⟨by positivity, fun m n A => ?_⟩
  have htail_nn : (0 : ℝ) ≤ ∑' k : ℕ, |h (k + 1)| := tsum_nonneg fun k => abs_nonneg (h (k + 1))
  have hh0_pos : 0 < h 0 := by linarith
  have h0_mem : (0 : ℝ) ∈ { r : ℝ | ∃ (N : ℕ) (u : Fin m → Fin N → ℂ) (v : Fin n → Fin N → ℂ),
      (∀ p, cNormSq (u p) ≤ 1) ∧ (∀ q, cNormSq (v q) ≤ 1) ∧
      r = ‖∑ p, ∑ q, A p q * cInner (u p) (v q)‖ } :=
    ⟨0, fun _ i => Fin.elim0 i, fun _ i => Fin.elim0 i,
     fun _ => by simp [cNormSq], fun _ => by simp [cNormSq], by simp [cInner]⟩
  have hq_bound : quantumNorm A ≤ (classicalNorm A + (∑' k : ℕ, |h (k + 1)|) * quantumNorm A) / h 0 := by
    refine csSup_le ⟨0, h0_mem⟩ ?_; rintro r ⟨N, u, v, hu, hv, rfl⟩; rw [le_div_iff₀ hh0_pos]
    obtain ⟨S, hS_def⟩ : ∃ S : ℕ → ℂ, ∀ k, S k =
        ∑ p, ∑ q, A p q * (cInner (u p) (v q) * ((‖cInner (u p) (v q)‖ ^ 2 : ℝ) : ℂ) ^ k) :=
      ⟨_, fun _ => rfl⟩
    have hS : ∀ k, ‖S k‖ ≤ quantumNorm A := fun k => by
      rw [hS_def]; exact norm_radialSum_le_quantumNorm A u v hu hv k
    have hS0 : S 0 = ∑ p, ∑ q, A p q * cInner (u p) (v q) := by
      rw [hS_def]; simp only [pow_zero, mul_one]
    have hsc : Summable (fun k => (h k : ℂ) * S k) := Summable.of_norm_bounded
      (hdom.summable_abs.mul_right (quantumNorm A)) fun k => by
        rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]; exact mul_le_mul_of_nonneg_left (hS k) (abs_nonneg _)
    have hsh : Summable (fun k => |h (k + 1)|) := (summable_nat_add_iff 1).mpr hdom.summable_abs
    have hscs : Summable (fun k => ‖(h (k + 1) : ℂ) * S (k + 1)‖) := Summable.of_nonneg_of_le (fun _ => norm_nonneg _)
      (fun k => by rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]; exact mul_le_mul_of_nonneg_left (hS (k + 1)) (abs_nonneg _))
      (hsh.mul_right _)
    have htail : ‖∑' k, (h (k + 1) : ℂ) * S (k + 1)‖ ≤ (∑' k, |h (k + 1)|) * quantumNorm A :=
      (norm_tsum_le_tsum_norm hscs).trans ((Summable.tsum_le_tsum (fun k => by
        rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]; exact mul_le_mul_of_nonneg_left (hS (k + 1)) (abs_nonneg _))
        hscs (hsh.mul_right _)).trans tsum_mul_right.le)
    have hsplit0 : ∑' k, (h k : ℂ) * S k = (h 0 : ℂ) * S 0 + ∑' k, (h (k + 1) : ℂ) * S (k + 1) :=
      hsc.tsum_eq_zero_add
    have h2 := norm_sub_norm_le ((h 0 : ℂ) * S 0) (-∑' k, (h (k + 1) : ℂ) * S (k + 1))
    rw [sub_neg_eq_add, ← hsplit0, norm_neg, norm_mul, Complex.norm_real,
        Real.norm_eq_abs, abs_of_pos hh0_pos, hS0] at h2
    have hcls := hdom.le_classical A u v hu hv
    simp only [← hS_def] at hcls
    linarith
  rw [le_div_iff₀ hh0_pos] at hq_bound
  have hq_nn : 0 ≤ quantumNorm A := le_csSup_of_le (quantumNorm_bddAbove A) h0_mem le_rfl
  have hrearr : D * quantumNorm A ≤ classicalNorm A := by nlinarith [mul_le_mul_of_nonneg_right hD_le hq_nn]
  rw [div_mul_eq_mul_div, one_mul, le_div_iff₀ hD_pos, mul_comm]; exact hrearr

def chWeight : Fin 6 → ℝ
  | 0 => (w1 : ℝ) | 1 => (w2 : ℝ) | 2 => (w3 : ℝ) | 3 => (w4 : ℝ) | 4 => (w5 : ℝ) | 5 => (w6 : ℝ)

def chHeadErr : Fin 6 → ℝ
  | 0 => (univGTErrUpperQ : ℝ) | 1 => (univGTErrUpperQ : ℝ) | 2 => (univGTErrUpperQ : ℝ)
  | 3 => 0 | 4 => 0 | 5 => 0

structure VerifiedSixChannelData where
  h_true   : Fin 6 → ℕ → ℝ
  h_app    : Fin 6 → ℕ → ℝ
  tail_err : Fin 6 → ℝ
  dominated       : ∀ i, DominatedRadialSeries (h_true i)
  head_comparison : ∀ i, ∑ k ∈ Finset.range 251, |h_true i k - h_app i k| ≤ chHeadErr i
  hardy_tails     : ∀ i, ∑' k : ℕ, |h_true i (251 + k)| ≤ tail_err i
  h0_enclosure    : (h0LowerQ : ℝ) ≤ ∑ i, chWeight i * h_app i 0
  head_l1_encl    : (∑ k ∈ Finset.range 250, |∑ i, chWeight i * h_app i (k + 1)|) ≤ (headL1UpperQ : ℝ)
  tail_enclosure  : (∑ i, chWeight i * tail_err i) ≤ (hardyTailUpperQ : ℝ)

theorem main_refutation (cert : VerifiedSixChannelData) :
    complexGrothendieckConstant ≤ (140456109 / 100000000 : ℝ) ∧
    complexGrothendieckConstant < 1 / haagerupDagger := by
  obtain ⟨H, hH_def⟩ : ∃ H : ℕ → ℝ, ∀ k, H k = ∑ i : Fin 6, chWeight i * cert.h_true i k :=
    ⟨_, fun _ => rfl⟩
  obtain ⟨H_app, hH_app_def⟩ : ∃ H_app : ℕ → ℝ, ∀ k, H_app k = ∑ i : Fin 6, chWeight i * cert.h_app i k :=
    ⟨_, fun _ => rfl⟩
  have hw_nn : ∀ i : Fin 6, 0 ≤ chWeight i := by
    intro i
    fin_cases i <;> norm_num [chWeight, w1, w2, w3, w4, w5, w6, certDenom]
  have hw_sum : (∑ i : Fin 6, chWeight i) = 1 := by
    rw [Fin.sum_univ_six]; simp only [chWeight]; exact_mod_cast cert_l1_and_weights_valid.1
  have h_maj : Summable (fun k => ∑ i ∈ (Finset.univ : Finset (Fin 6)), chWeight i * |cert.h_true i k|) :=
    summable_sum fun i _ => ((cert.dominated i).summable_abs).mul_left (chWeight i)
  have hH_summ : Summable (fun k => |H k|) := Summable.of_nonneg_of_le (fun _ => abs_nonneg _)
    (fun k => by
      rw [hH_def]
      exact (Finset.abs_sum_le_sum_abs _ _).trans_eq
        (Finset.sum_congr rfl fun i _ => by rw [abs_mul, abs_of_nonneg (hw_nn i)])) h_maj
  have hH_dom : DominatedRadialSeries H := by
    refine ⟨hH_summ, fun {m n N} A u v hu hv => ?_⟩
    obtain ⟨S, hS_def⟩ : ∃ S : ℕ → ℂ, ∀ k, S k =
        ∑ p, ∑ q, A p q * (cInner (u p) (v q) * ((‖cInner (u p) (v q)‖ ^ 2 : ℝ) : ℂ) ^ k) :=
      ⟨_, fun _ => rfl⟩
    have hS : ∀ k, ‖S k‖ ≤ quantumNorm A := fun k => by
      rw [hS_def]; exact norm_radialSum_le_quantumNorm A u v hu hv k
    have hsi : ∀ i ∈ (Finset.univ : Finset (Fin 6)),
        Summable (fun k => (chWeight i : ℂ) * ((cert.h_true i k : ℂ) * S k)) := by
      intro i _
      have hs1 : Summable (fun k => (cert.h_true i k : ℂ) * S k) :=
        Summable.of_norm_bounded (((cert.dominated i).summable_abs).mul_right (quantumNorm A)) fun k => by
          rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]
          exact mul_le_mul_of_nonneg_left (hS k) (abs_nonneg _)
      exact hs1.mul_left _
    have hswap : (∑' k, (H k : ℂ) * S k) = ∑ i : Fin 6, (chWeight i : ℂ) * ∑' k, (cert.h_true i k : ℂ) * S k := by
      have hfn : (fun k => (H k : ℂ) * S k) =
          fun k => ∑ i : Fin 6, (chWeight i : ℂ) * ((cert.h_true i k : ℂ) * S k) := by
        funext k; rw [hH_def]; push_cast; rw [Finset.sum_mul]
        exact Finset.sum_congr rfl fun _ _ => by ring
      rw [hfn, Summable.tsum_finsetSum hsi]; exact Finset.sum_congr rfl fun _ _ => tsum_mul_left
    simp only [← hS_def]
    rw [hswap]
    calc ‖∑ i : Fin 6, (chWeight i : ℂ) * ∑' k, (cert.h_true i k : ℂ) * S k‖
      _ ≤ ∑ i : Fin 6, chWeight i * ‖∑' k, (cert.h_true i k : ℂ) * S k‖ :=
          (norm_sum_le _ _).trans_eq (Finset.sum_congr rfl fun i _ => by
            rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (hw_nn i)])
      _ ≤ ∑ i : Fin 6, chWeight i * classicalNorm A := by
          refine Finset.sum_le_sum fun i _ => mul_le_mul_of_nonneg_left ?_ (hw_nn i)
          have hcl := (cert.dominated i).le_classical A u v hu hv
          simp only [← hS_def] at hcl
          exact hcl
      _ = classicalNorm A := by rw [← Finset.sum_mul, hw_sum, one_mul]
  have hsh : Summable (fun k => |H (k + 1)|) := (summable_nat_add_iff 1).mpr hH_summ
  have hsplit : (∑' k, |H (k + 1)|) = (∑ k ∈ Finset.range 250, |H (k + 1)|) + ∑' k, |H (k + 251)| :=
    (hsh.sum_add_tsum_nat_add 250).symm
  have hhead : (H_app 0 - H 0) + ((∑ k ∈ Finset.range 250, |H (k + 1)|) - ∑ k ∈ Finset.range 250, |H_app (k + 1)|) ≤
      (wGT * univGTErrUpperQ : ℝ) := by
    have h1 : (H_app 0 - H 0) + ((∑ k ∈ Finset.range 250, |H (k + 1)|) - ∑ k ∈ Finset.range 250, |H_app (k + 1)|) ≤
        ∑ k ∈ Finset.range 251, |H k - H_app k| := by
      rw [Finset.sum_range_succ' (fun k => |H k - H_app k|) 250, ← Finset.sum_sub_distrib, add_comm]
      exact add_le_add (Finset.sum_le_sum fun k _ => abs_sub_abs_le_abs_sub _ _)
        ((le_abs_self _).trans_eq (abs_sub_comm _ _))
    have h2 : (∑ k ∈ Finset.range 251, |H k - H_app k|) ≤ ∑ i : Fin 6, chWeight i * chHeadErr i := by
      calc ∑ k ∈ Finset.range 251, |H k - H_app k|
        _ ≤ ∑ k ∈ Finset.range 251, ∑ i : Fin 6, chWeight i * |cert.h_true i k - cert.h_app i k| := by
            refine Finset.sum_le_sum fun k _ => ?_
            have hsub : H k - H_app k = ∑ i, chWeight i * (cert.h_true i k - cert.h_app i k) := by
              rw [hH_def, hH_app_def, ← Finset.sum_sub_distrib]; simp only [mul_sub]
            rw [hsub]; exact (Finset.abs_sum_le_sum_abs _ _).trans_eq
              (Finset.sum_congr rfl fun i _ => by rw [abs_mul, abs_of_nonneg (hw_nn i)])
        _ = ∑ i : Fin 6, chWeight i * ∑ k ∈ Finset.range 251, |cert.h_true i k - cert.h_app i k| := by
            rw [Finset.sum_comm]; exact Finset.sum_congr rfl fun _ _ => (Finset.mul_sum _ _ _).symm
        _ ≤ ∑ i : Fin 6, chWeight i * chHeadErr i :=
            Finset.sum_le_sum fun i _ => mul_le_mul_of_nonneg_left (cert.head_comparison i) (hw_nn i)
    have h3 : (∑ i : Fin 6, chWeight i * chHeadErr i) = (wGT * univGTErrUpperQ : ℝ) := by
      rw [Fin.sum_univ_six]; simp only [chWeight, chHeadErr, wGT]; push_cast; ring
    linarith
  have htail : (∑' k, |H (k + 251)|) ≤ (hardyTailUpperQ : ℝ) := by
    have hsi : ∀ i ∈ (Finset.univ : Finset (Fin 6)),
        Summable (fun k => chWeight i * |cert.h_true i (251 + k)|) := by
      intro i _
      have hfn : (fun k => chWeight i * |cert.h_true i (251 + k)|) =
          fun k => chWeight i * |cert.h_true i (k + 251)| := by
        funext k; rw [add_comm 251 k]
      rw [hfn]; exact ((summable_nat_add_iff 251).mpr (cert.dominated i).summable_abs).mul_left _
    calc ∑' k, |H (k + 251)|
      _ ≤ ∑' k, ∑ i : Fin 6, chWeight i * |cert.h_true i (251 + k)| := by
          refine Summable.tsum_le_tsum (fun k => ?_) ((summable_nat_add_iff 251).mpr hH_summ) (summable_sum hsi)
          rw [hH_def, add_comm k 251]
          exact (Finset.abs_sum_le_sum_abs _ _).trans_eq
            (Finset.sum_congr rfl fun i _ => by rw [abs_mul, abs_of_nonneg (hw_nn i)])
      _ = ∑ i : Fin 6, chWeight i * ∑' k, |cert.h_true i (251 + k)| := by
          rw [Summable.tsum_finsetSum hsi]; exact Finset.sum_congr rfl fun _ _ => tsum_mul_left
      _ ≤ ∑ i : Fin 6, chWeight i * cert.tail_err i :=
          Finset.sum_le_sum fun i _ => mul_le_mul_of_nonneg_left (cert.hardy_tails i) (hw_nn i)
      _ ≤ (hardyTailUpperQ : ℝ) := cert.tail_enclosure
  have hl1 : (∑ k ∈ Finset.range 250, |H_app (k + 1)|) =
      ∑ k ∈ Finset.range 250, |∑ i, chWeight i * cert.h_app i (k + 1)| := by
    simp only [hH_app_def]
  have hD_le : (certDLowerQ : ℝ) ≤ transferMargin H := by
    unfold transferMargin certDLowerQ; push_cast
    rw [hsplit]
    linarith [cert.h0_enclosure, cert.head_l1_encl, hhead, htail, hH_app_def 0, hl1]
  have hgd_pos := haagerupDagger_pos
  have hgd_lt_D : haagerupDagger < (certDLowerQ : ℝ) :=
    haagerupDagger_lt_upper.trans (by exact_mod_cast cert_rational_margins.1)
  have hK_le := complexGrothendieckConstant_le_inv_of_dominated hH_dom (hgd_pos.trans hgd_lt_D) hD_le
  have hmarg : 1 / (certDLowerQ : ℝ) ≤ (140456109 / 100000000 : ℝ) := by
    have h : ((1 / certDLowerQ : ℚ) : ℝ) ≤ ((140456109 / 100000000 : ℚ) : ℝ) :=
      Rat.cast_le.mpr cert_rational_margins.2.le
    push_cast at h
    exact h
  exact ⟨hK_le.trans hmarg, hK_le.trans_lt (one_div_lt_one_div_of_lt hgd_pos hgd_lt_D)⟩

end HaagerupRefutation

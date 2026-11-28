/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import Haagerup.Statement
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Analysis.Real.Pi.Bounds

/-!
# Rational bounds for Haagerup's integral `γ†`

The enclosure `711958633 / 10⁹ < γ† < 711958683 / 10⁹` (`gammaDagger_bounds`; Lemma 8.1 of the article, of which the
main theorem uses the upper bound), by the argument of the article, which uses no numerical quadrature; the
rational arithmetic is Computation 8.

Writing `1 + sin² t = (3/2) * (1 - cos(2t)/3)` puts `x = cos(2t)/3 ∈ [-1/3, 1/3]`. Let `P₁₄(x)` be
the degree-14 binomial polynomial `∑_{k=0}^{14} C(2k, k) 4⁻ᵏ xᵏ`. Telescoping gives the exact
algebraic identity `(1 - x) P₁₄(x)² = 1 - ∑_{m=15}^{29} d_m x^m` with `d_m > 0` and `∑ d_m = 1`,
so `|1 - (1 - x) P₁₄(x)²| ≤ 3⁻¹⁵` on `|x| ≤ 1/3`. Integrating the explicit trigonometric primitive
`q₀ t + sin(2t) Q(cos(2t))` of `cos² t * P₁₄(cos(2t)/3)` on `[0, π / 2]` certifies

  `711958633 / 10^9 < gammaDagger < 711958683 / 10^9`   (`gammaDagger_bounds`).
-/

set_option warningAsError true

namespace Haagerup

open MeasureTheory Real intervalIntegral Haagerup.Statement

noncomputable section

/-- Degree-14 binomial approximation to `(1 - x)^{-1/2}` on `[-1/3, 1/3]`. -/
def binomPoly14 (x : ℝ) : ℝ :=
  1 + (1 / 2 : ℝ) * x + (3 / 8 : ℝ) * x ^ 2 + (5 / 16 : ℝ) * x ^ 3 +
    (35 / 128 : ℝ) * x ^ 4 + (63 / 256 : ℝ) * x ^ 5 + (231 / 1024 : ℝ) * x ^ 6 +
    (429 / 2048 : ℝ) * x ^ 7 + (6435 / 32768 : ℝ) * x ^ 8 + (12155 / 65536 : ℝ) * x ^ 9 +
    (46189 / 262144 : ℝ) * x ^ 10 + (88179 / 524288 : ℝ) * x ^ 11 +
    (676039 / 4194304 : ℝ) * x ^ 12 + (1300075 / 8388608 : ℝ) * x ^ 13 +
    (5014575 / 33554432 : ℝ) * x ^ 14

/-- Positive-coefficient remainder `1 - (1 - x) P₁₄(x)² = ∑_{m=15}^{29} d_m x^m`. -/
def remPoly14 (x : ℝ) : ℝ :=
  (9694845 / 33554432 : ℝ) * x ^ 15 +
    (145422675 / 1073741824 : ℝ) * x ^ 16 +
    (25662825 / 268435456 : ℝ) * x ^ 17 +
    (80790375 / 1073741824 : ℝ) * x ^ 18 +
    (267883875 / 4294967296 : ℝ) * x ^ 19 +
    (1832325705 / 34359738368 : ℝ) * x ^ 20 +
    (1599649425 / 34359738368 : ℝ) * x ^ 21 +
    (5671484325 / 137438953472 : ℝ) * x ^ 22 +
    (40686735375 / 1099511627776 : ℝ) * x ^ 23 +
    (589204204875 / 17592186044416 : ℝ) * x ^ 24 +
    (268677117423 / 8796093022208 : ℝ) * x ^ 25 +
    (986402004525 / 35184372088832 : ℝ) * x ^ 26 +
    (3641162954975 / 140737488355328 : ℝ) * x ^ 27 +
    (27008626314375 / 1125899906842624 : ℝ) * x ^ 28 +
    (25145962430625 / 1125899906842624 : ℝ) * x ^ 29

private lemma binomPoly14_sq_ident (x : ℝ) :
    (1 - x) * binomPoly14 x ^ 2 = 1 - remPoly14 x := by
  unfold binomPoly14 remPoly14; ring

private lemma binomPoly14_pos {x : ℝ} (hx : -1 / 3 ≤ x) : 0 < binomPoly14 x := by
  have heq : binomPoly14 x =
      (1 + (1 / 2 : ℝ) * x) +
      (3 / 8 + (5 / 16 : ℝ) * x) * x ^ 2 +
      (35 / 128 + (63 / 256 : ℝ) * x) * (x ^ 2) ^ 2 +
      (231 / 1024 + (429 / 2048 : ℝ) * x) * (x ^ 3) ^ 2 +
      (6435 / 32768 + (12155 / 65536 : ℝ) * x) * (x ^ 4) ^ 2 +
      (46189 / 262144 + (88179 / 524288 : ℝ) * x) * (x ^ 5) ^ 2 +
      (676039 / 4194304 + (1300075 / 8388608 : ℝ) * x) * (x ^ 6) ^ 2 +
      (5014575 / 33554432 : ℝ) * (x ^ 7) ^ 2 := by
    unfold binomPoly14; ring
  rw [heq]
  have h0 : 0 < 1 + (1 / 2 : ℝ) * x := by linarith
  have h1 : 0 ≤ (3 / 8 + (5 / 16 : ℝ) * x) * x ^ 2 := mul_nonneg (by linarith) (sq_nonneg _)
  have h2 : 0 ≤ (35 / 128 + (63 / 256 : ℝ) * x) * (x ^ 2) ^ 2 := mul_nonneg (by linarith) (sq_nonneg _)
  have h3 : 0 ≤ (231 / 1024 + (429 / 2048 : ℝ) * x) * (x ^ 3) ^ 2 := mul_nonneg (by linarith) (sq_nonneg _)
  have h4 : 0 ≤ (6435 / 32768 + (12155 / 65536 : ℝ) * x) * (x ^ 4) ^ 2 := mul_nonneg (by linarith) (sq_nonneg _)
  have h5 : 0 ≤ (46189 / 262144 + (88179 / 524288 : ℝ) * x) * (x ^ 5) ^ 2 := mul_nonneg (by linarith) (sq_nonneg _)
  have h6 : 0 ≤ (676039 / 4194304 + (1300075 / 8388608 : ℝ) * x) * (x ^ 6) ^ 2 := mul_nonneg (by linarith) (sq_nonneg _)
  have h7 : 0 ≤ (5014575 / 33554432 : ℝ) * (x ^ 7) ^ 2 := mul_nonneg (by norm_num) (sq_nonneg _)
  linarith

private lemma abs_pow_fifteen_add_le {x : ℝ} (hx : |x| ≤ 1 / 3) (k : ℕ) :
    -(1 / 3 : ℝ) ^ 15 ≤ x ^ (15 + k) ∧ x ^ (15 + k) ≤ (1 / 3 : ℝ) ^ 15 := by
  refine abs_le.1 ?_
  rw [abs_pow, pow_add]
  have h15 : |x| ^ 15 ≤ (1 / 3 : ℝ) ^ 15 := pow_le_pow_left₀ (abs_nonneg x) hx 15
  have hk : |x| ^ k ≤ 1 := pow_le_one₀ (abs_nonneg x) (hx.trans (by norm_num))
  calc |x| ^ 15 * |x| ^ k ≤ |x| ^ 15 * 1 := mul_le_mul_of_nonneg_left hk (by positivity)
    _ = |x| ^ 15 := mul_one _
    _ ≤ (1 / 3 : ℝ) ^ 15 := h15

private lemma remPoly14_bounds {x : ℝ} (hx : |x| ≤ 1 / 3) :
    -(1 / 3 : ℝ) ^ 15 ≤ remPoly14 x ∧ remPoly14 x ≤ (1 / 3 : ℝ) ^ 15 := by
  have b0 := abs_pow_fifteen_add_le hx 0
  have b1 := abs_pow_fifteen_add_le hx 1
  have b2 := abs_pow_fifteen_add_le hx 2
  have b3 := abs_pow_fifteen_add_le hx 3
  have b4 := abs_pow_fifteen_add_le hx 4
  have b5 := abs_pow_fifteen_add_le hx 5
  have b6 := abs_pow_fifteen_add_le hx 6
  have b7 := abs_pow_fifteen_add_le hx 7
  have b8 := abs_pow_fifteen_add_le hx 8
  have b9 := abs_pow_fifteen_add_le hx 9
  have b10 := abs_pow_fifteen_add_le hx 10
  have b11 := abs_pow_fifteen_add_le hx 11
  have b12 := abs_pow_fifteen_add_le hx 12
  have b13 := abs_pow_fifteen_add_le hx 13
  have b14 := abs_pow_fifteen_add_le hx 14
  unfold remPoly14
  norm_num only [Nat.add_zero] at b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14
  constructor <;> linarith

private lemma integrand_bounds (t : ℝ) :
    (40824827623 / 50000000000 : ℝ) * (Real.cos t ^ 2 * binomPoly14 (Real.cos (2 * t) / 3)) ≤
      Real.cos t ^ 2 / √(1 + Real.sin t ^ 2) ∧
    Real.cos t ^ 2 / √(1 + Real.sin t ^ 2) ≤
      (40824830469 / 50000000000 : ℝ) * (Real.cos t ^ 2 * binomPoly14 (Real.cos (2 * t) / 3)) := by
  set x : ℝ := Real.cos (2 * t) / 3
  have hx_abs : |x| ≤ 1 / 3 := by
    dsimp only [x]
    rw [abs_div, abs_of_pos (by norm_num : (0 : ℝ) < 3)]
    linarith [Real.abs_cos_le_one (2 * t)]
  have hx_lo : -1 / 3 ≤ x := by linarith [(abs_le.1 hx_abs).1]
  have hP_pos : 0 < binomPoly14 x := binomPoly14_pos hx_lo
  have hsin_eq : 1 + Real.sin t ^ 2 = (3 / 2 : ℝ) * (1 - x) := by
    dsimp only [x]
    linarith [Real.cos_two_mul t, Real.sin_sq_add_cos_sq t]
  have h1_pos : 0 < 1 + Real.sin t ^ 2 := by positivity
  have hsq_pos : 0 < √(1 + Real.sin t ^ 2) := Real.sqrt_pos.2 h1_pos
  obtain ⟨hr_lo, hr_hi⟩ := remPoly14_bounds hx_abs
  have hid := binomPoly14_sq_ident x
  have hub_sq : 1 ≤ (√(1 + Real.sin t ^ 2) * ((40824830469 / 50000000000 : ℝ) * binomPoly14 x)) ^ 2 := by
    rw [mul_pow, Real.sq_sqrt h1_pos.le, hsin_eq]
    have hstep : (3 / 2 : ℝ) * (1 - x) * ((40824830469 / 50000000000 : ℝ) * binomPoly14 x) ^ 2 =
        (3 / 2 : ℝ) * (40824830469 / 50000000000 : ℝ) ^ 2 * ((1 - x) * binomPoly14 x ^ 2) := by ring
    rw [hstep, hid]; linarith
  have hub_prod : 1 ≤ √(1 + Real.sin t ^ 2) * ((40824830469 / 50000000000 : ℝ) * binomPoly14 x) := by
    have hnn : 0 ≤ √(1 + Real.sin t ^ 2) * ((40824830469 / 50000000000 : ℝ) * binomPoly14 x) := by positivity
    nlinarith [hub_sq]
  have hub_inv : 1 / √(1 + Real.sin t ^ 2) ≤ (40824830469 / 50000000000 : ℝ) * binomPoly14 x := by
    rw [div_le_iff₀ hsq_pos]; linarith
  have hlb_sq : (√(1 + Real.sin t ^ 2) * ((40824827623 / 50000000000 : ℝ) * binomPoly14 x)) ^ 2 ≤ 1 := by
    rw [mul_pow, Real.sq_sqrt h1_pos.le, hsin_eq]
    have hstep : (3 / 2 : ℝ) * (1 - x) * ((40824827623 / 50000000000 : ℝ) * binomPoly14 x) ^ 2 =
        (3 / 2 : ℝ) * (40824827623 / 50000000000 : ℝ) ^ 2 * ((1 - x) * binomPoly14 x ^ 2) := by ring
    rw [hstep, hid]; linarith
  have hlb_prod : √(1 + Real.sin t ^ 2) * ((40824827623 / 50000000000 : ℝ) * binomPoly14 x) ≤ 1 := by
    nlinarith [hlb_sq, sq_nonneg (√(1 + Real.sin t ^ 2) * ((40824827623 / 50000000000 : ℝ) * binomPoly14 x) - 1)]
  have hlb_inv : (40824827623 / 50000000000 : ℝ) * binomPoly14 x ≤ 1 / √(1 + Real.sin t ^ 2) := by
    rw [le_div_iff₀ hsq_pos]; linarith
  constructor
  · calc (40824827623 / 50000000000 : ℝ) * (Real.cos t ^ 2 * binomPoly14 x)
        = Real.cos t ^ 2 * ((40824827623 / 50000000000 : ℝ) * binomPoly14 x) := by ring
      _ ≤ Real.cos t ^ 2 * (1 / √(1 + Real.sin t ^ 2)) :=
          mul_le_mul_of_nonneg_left hlb_inv (sq_nonneg _)
      _ = Real.cos t ^ 2 / √(1 + Real.sin t ^ 2) := by ring
  · calc Real.cos t ^ 2 / √(1 + Real.sin t ^ 2)
        = Real.cos t ^ 2 * (1 / √(1 + Real.sin t ^ 2)) := by ring
      _ ≤ Real.cos t ^ 2 * ((40824830469 / 50000000000 : ℝ) * binomPoly14 x) :=
          mul_le_mul_of_nonneg_left hub_inv (sq_nonneg _)
      _ = (40824830469 / 50000000000 : ℝ) * (Real.cos t ^ 2 * binomPoly14 x) := by ring

/-- The coefficient `q₀` of `t` in the primitive `primF`: the mean of `cos² t * P₁₄(cos(2t)/3)` over a period. -/
private def q0Val : ℝ := 40545758045051663 / 73040694872113152

/-- The polynomial `Q` of the primitive `q₀ t + sin(2t) Q(cos(2t))` of `cos² t * P₁₄(cos(2t)/3)`. -/
private def antiQ (u : ℝ) : ℝ :=
  (36346160416567 / 120680812707840 : ℝ) +
    (4025410608995087 / 146081389744226304 : ℝ) * u +
    (1147590043447 / 241361625415680 : ℝ) * u ^ 2 +
    (221207751072527 / 219122084616339456 : ℝ) * u ^ 3 +
    (76734066487 / 321815500554240 : ℝ) * u ^ 4 +
    (16467666705167 / 273902605770424320 : ℝ) * u ^ 5 +
    (6119650615 / 386178600665088 : ℝ) * u ^ 6 +
    (1378175720207 / 319553040065495040 : ℝ) * u ^ 7 +
    (530728375 / 441346972188672 : ℝ) * u ^ 8 +
    (122808326927 / 359497170073681920 : ℝ) * u ^ 9 +
    (9651563 / 98077104930816 : ℝ) * u ^ 10 +
    (1027558285 / 35949717007368192 : ℝ) * u ^ 11 +
    (884051 / 106993205379072 : ℝ) * u ^ 12 +
    (6871825 / 2995809750614016 : ℝ) * u ^ 13 +
    (37145 / 71328803586048 : ℝ) * u ^ 14

/-- The derivative of the polynomial `antiQ`. -/
private def antiQDeriv (u : ℝ) : ℝ :=
  (4025410608995087 / 146081389744226304 : ℝ) +
    2 * (1147590043447 / 241361625415680 : ℝ) * u +
    3 * (221207751072527 / 219122084616339456 : ℝ) * u ^ 2 +
    4 * (76734066487 / 321815500554240 : ℝ) * u ^ 3 +
    5 * (16467666705167 / 273902605770424320 : ℝ) * u ^ 4 +
    6 * (6119650615 / 386178600665088 : ℝ) * u ^ 5 +
    7 * (1378175720207 / 319553040065495040 : ℝ) * u ^ 6 +
    8 * (530728375 / 441346972188672 : ℝ) * u ^ 7 +
    9 * (122808326927 / 359497170073681920 : ℝ) * u ^ 8 +
    10 * (9651563 / 98077104930816 : ℝ) * u ^ 9 +
    11 * (1027558285 / 35949717007368192 : ℝ) * u ^ 10 +
    12 * (884051 / 106993205379072 : ℝ) * u ^ 11 +
    13 * (6871825 / 2995809750614016 : ℝ) * u ^ 12 +
    14 * (37145 / 71328803586048 : ℝ) * u ^ 13

private lemma hasDerivAt_antiQ (u : ℝ) : HasDerivAt antiQ (antiQDeriv u) u := by
  unfold antiQ
  refine (((((((((((((((hasDerivAt_const u _).add
    ((hasDerivAt_id u).const_mul _)).add
    ((hasDerivAt_pow 2 u).const_mul _)).add
    ((hasDerivAt_pow 3 u).const_mul _)).add
    ((hasDerivAt_pow 4 u).const_mul _)).add
    ((hasDerivAt_pow 5 u).const_mul _)).add
    ((hasDerivAt_pow 6 u).const_mul _)).add
    ((hasDerivAt_pow 7 u).const_mul _)).add
    ((hasDerivAt_pow 8 u).const_mul _)).add
    ((hasDerivAt_pow 9 u).const_mul _)).add
    ((hasDerivAt_pow 10 u).const_mul _)).add
    ((hasDerivAt_pow 11 u).const_mul _)).add
    ((hasDerivAt_pow 12 u).const_mul _)).add
    ((hasDerivAt_pow 13 u).const_mul _)).add
    ((hasDerivAt_pow 14 u).const_mul _)).congr_deriv ?_
  unfold antiQDeriv; push_cast; ring

/-- The primitive `q₀ t + sin(2t) Q(cos(2t))` of `cos² t * P₁₄(cos(2t)/3)` (`hasDerivAt_primF`). -/
private def primF (t : ℝ) : ℝ :=
  q0Val * t + Real.sin (2 * t) * antiQ (Real.cos (2 * t))

private lemma hasDerivAt_primF (t : ℝ) :
    HasDerivAt primF (Real.cos t ^ 2 * binomPoly14 (Real.cos (2 * t) / 3)) t := by
  have h2t : HasDerivAt (fun s : ℝ => 2 * s) 2 t := by
    simpa using (hasDerivAt_id t).const_mul (2 : ℝ)
  have hsin : HasDerivAt (fun s : ℝ => Real.sin (2 * s)) (Real.cos (2 * t) * 2) t :=
    (Real.hasDerivAt_sin (2 * t)).comp t h2t
  have hcos : HasDerivAt (fun s : ℝ => Real.cos (2 * s)) (-Real.sin (2 * t) * 2) t :=
    (Real.hasDerivAt_cos (2 * t)).comp t h2t
  have hQ : HasDerivAt (fun s : ℝ => antiQ (Real.cos (2 * s)))
      (antiQDeriv (Real.cos (2 * t)) * (-Real.sin (2 * t) * 2)) t := by
    simpa only [Function.comp_def] using (hasDerivAt_antiQ (Real.cos (2 * t))).comp t hcos
  have hlin : HasDerivAt (fun s : ℝ => q0Val * s) q0Val t := by
    simpa using (hasDerivAt_id t).const_mul q0Val
  unfold primF
  refine (hlin.add (hsin.mul hQ)).congr_deriv ?_
  have hsc2 : Real.sin (2 * t) ^ 2 = 1 - Real.cos (2 * t) ^ 2 := by
    linarith [Real.sin_sq_add_cos_sq (2 * t)]
  have hc_half : Real.cos t ^ 2 = (1 + Real.cos (2 * t)) / 2 := by
    linarith [Real.cos_two_mul t]
  have halg : q0Val + (Real.cos (2 * t) * 2 * antiQ (Real.cos (2 * t)) +
      Real.sin (2 * t) * (antiQDeriv (Real.cos (2 * t)) * (-Real.sin (2 * t) * 2))) =
      q0Val + 2 * Real.cos (2 * t) * antiQ (Real.cos (2 * t)) -
      2 * Real.sin (2 * t) ^ 2 * antiQDeriv (Real.cos (2 * t)) := by ring
  rw [halg, hsc2, hc_half]
  unfold q0Val antiQ antiQDeriv binomPoly14
  ring

private lemma continuous_cos_sq_mul_binomPoly14 :
    Continuous (fun t : ℝ => Real.cos t ^ 2 * binomPoly14 (Real.cos (2 * t) / 3)) := by
  unfold binomPoly14; fun_prop

private lemma integral_binomPoly14 :
    (∫ t in (0 : ℝ)..(Real.pi / 2), Real.cos t ^ 2 * binomPoly14 (Real.cos (2 * t) / 3)) =
      q0Val * (Real.pi / 2) := by
  rw [integral_eq_sub_of_hasDerivAt (fun t _ => hasDerivAt_primF t)
    (continuous_cos_sq_mul_binomPoly14.intervalIntegrable (μ := volume) _ _)]
  unfold primF
  have h2pi : 2 * (Real.pi / 2) = Real.pi := by ring
  simp only [h2pi, mul_zero, Real.sin_pi, Real.sin_zero]; ring

private lemma integrable_haagerup :
    IntervalIntegrable (fun t : ℝ => Real.cos t ^ 2 / √(1 + Real.sin t ^ 2)) volume 0 (Real.pi / 2) := by
  refine (Continuous.div (by fun_prop) (by fun_prop) fun _ => ?_).intervalIntegrable (μ := volume) _ _
  exact (Real.sqrt_pos.2 (by positivity)).ne'

/-- Haagerup's integral to seven decimals: `0.711958633 < γ† < 0.711958683`. -/
theorem gammaDagger_bounds :
    (711958633 / 1000000000 : ℝ) < gammaDagger ∧ gammaDagger < (711958683 / 1000000000 : ℝ) := by
  have hint_P := continuous_cos_sq_mul_binomPoly14.intervalIntegrable (μ := volume) 0 (Real.pi / 2)
  have hle : (0 : ℝ) ≤ Real.pi / 2 := by linarith [Real.pi_pos]
  have hlo_int : (40824827623 / 50000000000 : ℝ) * (q0Val * (Real.pi / 2)) ≤ gammaDagger := by
    rw [← integral_binomPoly14, ← intervalIntegral.integral_const_mul]
    exact intervalIntegral.integral_mono_on hle (hint_P.const_mul _) integrable_haagerup
      fun t _ => (integrand_bounds t).1
  have hhi_int : gammaDagger ≤ (40824830469 / 50000000000 : ℝ) * (q0Val * (Real.pi / 2)) := by
    rw [← integral_binomPoly14, ← intervalIntegral.integral_const_mul]
    exact intervalIntegral.integral_mono_on hle integrable_haagerup (hint_P.const_mul _)
      fun t _ => (integrand_bounds t).2
  have hpi_gt : (314159265358979323846 / 10 ^ 20 : ℝ) < Real.pi := by
    convert Real.pi_gt_d20 using 1; norm_num
  have hpi_lt : Real.pi < (314159265358979323847 / 10 ^ 20 : ℝ) := by
    convert Real.pi_lt_d20 using 1; norm_num
  unfold q0Val at hlo_int hhi_int
  constructor
  · calc (711958633 / 1000000000 : ℝ)
        < (40824827623 / 50000000000 : ℝ) *
            (40545758045051663 / 73040694872113152 * ((314159265358979323846 / 10 ^ 20 : ℝ) / 2)) := by norm_num
      _ < (40824827623 / 50000000000 : ℝ) *
            (40545758045051663 / 73040694872113152 * (Real.pi / 2)) := by gcongr
      _ ≤ gammaDagger := hlo_int
  · calc gammaDagger
        ≤ (40824830469 / 50000000000 : ℝ) *
            (40545758045051663 / 73040694872113152 * (Real.pi / 2)) := hhi_int
      _ < (40824830469 / 50000000000 : ℝ) *
            (40545758045051663 / 73040694872113152 * ((314159265358979323847 / 10 ^ 20 : ℝ) / 2)) := by gcongr
      _ < (711958683 / 1000000000 : ℝ) := by norm_num

/-- `γ† > 0`. -/
theorem gammaDagger_pos : 0 < gammaDagger :=
  lt_trans (by norm_num) gammaDagger_bounds.1

end

end Haagerup

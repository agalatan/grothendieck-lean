import Grothe.UpperChaos.OriginalMomentRatios
import LeanCert.Core.Taylor
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Data.Rat.BigOperators
import Mathlib.Data.Rat.Cast.Lemmas
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Integrated Taylor bounds for the original positive moment

LeanCert's Taylor theorem bounds exp on [-x,0] with derivative bound one.
Integrating each monomial in the angular representation proves the J₀
remainder by the next integrated term. The exact rational terms below are
used symbolically; concrete arithmetic uses rounded integer checkpoints.

Agent-ID: codex-aa04. Refs #21.
-/

open MeasureTheory Set
open scoped BigOperators

namespace Grothe.UpperChaos.OriginalPositiveMoment

noncomputable section

/-- The angular normalization fixes the zeroth seed exactly. -/
theorem moment_zero_zero : moment 0 0 = 1 := by
  rw [moment_eq_angular]
  have hangular : PositiveMomentTheta.moment 0 0 = Real.pi / 4 := by
    unfold PositiveMomentTheta.moment PositiveMomentTheta.density
    simp only [Nat.mul_zero, pow_zero, one_mul, neg_zero, zero_mul,
      Real.exp_zero, mul_one]
    rw [integral_cos_sq]
    simp only [Real.cos_pi_div_two, Real.sin_pi_div_two, Real.cos_zero,
      Real.sin_zero, zero_mul, mul_zero, sub_zero, zero_add]
    ring
  rw [hangular]
  field_simp [ne_of_gt Real.pi_pos]

/-- At x = 0 the original three-term recurrence becomes a first-order one. -/
theorem moment_zero_succ (n : ℕ) :
    moment (n + 1) 0 = (((n : ℝ) + 1 / 2) * moment n 0) / ((n : ℝ) + 2) := by
  have hn : (n : ℝ) + 2 ≠ 0 := by positivity
  have hrec := moment_recurrence n 0
  simp only [add_zero, zero_mul, sub_eq_zero] at hrec
  apply (eq_div_iff hn).2
  nlinarith [hrec]

/-- The normalized coefficients Jₙ(0)/n! appearing in the finite seed. -/
def zeroTaylorCoeff (n : ℕ) : ℝ := moment n 0 / (n.factorial : ℝ)

@[simp]
theorem zeroTaylorCoeff_zero : zeroTaylorCoeff 0 = 1 := by
  simp [zeroTaylorCoeff, moment_zero_zero]

/-- This is the positive coefficient recurrence used by the exact replay. -/
theorem zeroTaylorCoeff_succ (n : ℕ) :
    zeroTaylorCoeff (n + 1) =
      zeroTaylorCoeff n * (2 * (n : ℝ) + 1) /
        (2 * ((n : ℝ) + 1) * ((n : ℝ) + 2)) := by
  have hn1 : (n : ℝ) + 1 ≠ 0 := by positivity
  have hn2 : (n : ℝ) + 2 ≠ 0 := by positivity
  have hf : (n.factorial : ℝ) ≠ 0 := by
    exact_mod_cast Nat.factorial_ne_zero n
  unfold zeroTaylorCoeff
  rw [moment_zero_succ, Nat.factorial_succ]
  push_cast
  field_simp [hn1, hn2, hf]
  ring

/-- Pointwise exp remainder on [-x,0]. The derivative cap is 1. -/
private theorem exp_neg_mul_taylor_error (x y : ℝ) (hx : 0 ≤ x)
    (hy0 : 0 ≤ y) (hy1 : y ≤ 1) (N : ℕ) :
    |Real.exp (-x * y) -
      ∑ n ∈ Finset.range (N + 1), (-x * y) ^ n / (n.factorial : ℝ)| ≤
      (x * y) ^ (N + 1) / ((N + 1).factorial : ℝ) := by
  have hleft : -x ≤ (0 : ℝ) := neg_nonpos.mpr hx
  have hpoint : -x * y ∈ Icc (-x) (0 : ℝ) := by
    constructor <;> nlinarith
  have hderiv : ∀ z ∈ Icc (-x) (0 : ℝ),
      ‖iteratedDeriv (N + 1) Real.exp z‖ ≤ (1 : ℝ) := by
    simpa only [Real.exp_zero] using
      (LeanCert.Core.exp_deriv_bound hleft (N + 1))
  have ht := LeanCert.Core.taylor_remainder_bound
    (f := Real.exp) (a := -x) (b := 0) (c := 0) (n := N + 1) (M := 1)
    hleft hleft le_rfl Real.contDiff_exp hderiv zero_le_one (-x * y) hpoint
  have habs : |(-x) * y| = x * y := by
    rw [abs_of_nonpos (by nlinarith : (-x) * y ≤ 0)]
    ring
  simpa only [iteratedDeriv_eq_iterate, Real.iter_deriv_exp, Real.exp_zero,
    sub_zero, Real.norm_eq_abs, one_div, inv_mul_eq_div, one_mul, habs] using ht

/-- Multiplying by cos² turns each Taylor monomial into an angular density. -/
private theorem angular_density_taylor_error (x : ℝ) (hx : 0 ≤ x) (N : ℕ) (t : ℝ) :
    |PositiveMomentTheta.density 0 x t -
      ∑ n ∈ Finset.range (N + 1),
        ((-x) ^ n / (n.factorial : ℝ)) * PositiveMomentTheta.density n 0 t| ≤
      (x ^ (N + 1) / ((N + 1).factorial : ℝ)) *
        PositiveMomentTheta.density (N + 1) 0 t := by
  have hs0 : 0 ≤ Real.sin t ^ 2 := sq_nonneg _
  have hs1 : Real.sin t ^ 2 ≤ 1 := by
    nlinarith [Real.sin_sq_add_cos_sq t, sq_nonneg (Real.cos t)]
  have ht := exp_neg_mul_taylor_error x (Real.sin t ^ 2) hx hs0 hs1 N
  have hsum : Real.cos t ^ 2 *
      (∑ n ∈ Finset.range (N + 1), (-x * Real.sin t ^ 2) ^ n / (n.factorial : ℝ)) =
      ∑ n ∈ Finset.range (N + 1),
        ((-x) ^ n / (n.factorial : ℝ)) * PositiveMomentTheta.density n 0 t := by
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro n _
    simp only [PositiveMomentTheta.density, neg_zero, zero_mul,
      Real.exp_zero, mul_one, mul_pow, ← pow_mul]
    ring
  have hzero : PositiveMomentTheta.density 0 x t =
      Real.cos t ^ 2 * Real.exp (-x * Real.sin t ^ 2) := by
    simp only [PositiveMomentTheta.density, Nat.mul_zero, pow_zero, one_mul]
  have hremainder : PositiveMomentTheta.density 0 x t -
      (∑ n ∈ Finset.range (N + 1),
        ((-x) ^ n / (n.factorial : ℝ)) * PositiveMomentTheta.density n 0 t) =
      Real.cos t ^ 2 * (Real.exp (-x * Real.sin t ^ 2) -
        ∑ n ∈ Finset.range (N + 1), (-x * Real.sin t ^ 2) ^ n / (n.factorial : ℝ)) := by
    rw [hzero, mul_sub, hsum]
  rw [hremainder, abs_mul, abs_of_nonneg (sq_nonneg (Real.cos t))]
  calc
    _ ≤ Real.cos t ^ 2 *
        ((x * Real.sin t ^ 2) ^ (N + 1) / ((N + 1).factorial : ℝ)) :=
      mul_le_mul_of_nonneg_left ht (sq_nonneg _)
    _ = _ := by
      simp only [PositiveMomentTheta.density, neg_zero, zero_mul,
        Real.exp_zero, mul_one, mul_pow, ← pow_mul]
      ring

/-- The finite angular integral is bounded by the next integrated term. -/
private theorem angular_zero_taylor_error (x : ℝ) (hx : 0 ≤ x) (N : ℕ) :
    |PositiveMomentTheta.moment 0 x -
      ∑ n ∈ Finset.range (N + 1),
        ((-x) ^ n / (n.factorial : ℝ)) * PositiveMomentTheta.moment n 0| ≤
      (x ^ (N + 1) / ((N + 1).factorial : ℝ)) *
        PositiveMomentTheta.moment (N + 1) 0 := by
  let P : ℝ → ℝ := fun t => ∑ n ∈ Finset.range (N + 1),
    ((-x) ^ n / (n.factorial : ℝ)) * PositiveMomentTheta.density n 0 t
  have hP : Continuous P := by
    exact continuous_finsetSum _ fun n _ =>
      continuous_const.mul (PositiveMomentTheta.density_continuous n 0)
  have hPi : IntervalIntegrable P volume 0 (Real.pi / 2) :=
    hP.intervalIntegrable 0 (Real.pi / 2)
  have hfi : IntervalIntegrable (PositiveMomentTheta.density 0 x) volume 0 (Real.pi / 2) :=
    (PositiveMomentTheta.density_continuous 0 x).intervalIntegrable 0 (Real.pi / 2)
  have herror : Continuous (fun t => PositiveMomentTheta.density 0 x t - P t) :=
    (PositiveMomentTheta.density_continuous 0 x).sub hP
  have hmajor : Continuous (fun t =>
      (x ^ (N + 1) / ((N + 1).factorial : ℝ)) *
        PositiveMomentTheta.density (N + 1) 0 t) :=
    continuous_const.mul (PositiveMomentTheta.density_continuous (N + 1) 0)
  have hP_integral : (∫ t in (0 : ℝ)..(Real.pi / 2), P t) =
      ∑ n ∈ Finset.range (N + 1),
        ((-x) ^ n / (n.factorial : ℝ)) * PositiveMomentTheta.moment n 0 := by
    dsimp only [P]
    rw [intervalIntegral.integral_finsetSum (fun n _ =>
      (continuous_const.mul (PositiveMomentTheta.density_continuous n 0)).intervalIntegrable
        0 (Real.pi / 2))]
    simp only [intervalIntegral.integral_const_mul, PositiveMomentTheta.moment]
  calc
    _ = |∫ t in (0 : ℝ)..(Real.pi / 2), PositiveMomentTheta.density 0 x t - P t| := by
      rw [intervalIntegral.integral_sub hfi hPi, hP_integral]
      rfl
    _ ≤ ∫ t in (0 : ℝ)..(Real.pi / 2), |PositiveMomentTheta.density 0 x t - P t| := by
      simpa only [Real.norm_eq_abs] using
        (intervalIntegral.norm_integral_le_integral_norm
          (μ := volume) (f := fun t => PositiveMomentTheta.density 0 x t - P t)
          Real.pi_div_two_pos.le)
    _ ≤ ∫ t in (0 : ℝ)..(Real.pi / 2),
        (x ^ (N + 1) / ((N + 1).factorial : ℝ)) *
          PositiveMomentTheta.density (N + 1) 0 t := by
      apply intervalIntegral.integral_mono_on Real.pi_div_two_pos.le
        (herror.abs.intervalIntegrable 0 (Real.pi / 2))
        (hmajor.intervalIntegrable 0 (Real.pi / 2))
      intro t _
      exact angular_density_taylor_error x hx N t
    _ = _ := by
      rw [intervalIntegral.integral_const_mul]
      rfl

/-- J₀ Taylor truncation with the next-moment remainder, without exp(|x|). -/
theorem moment_zero_taylor_error (x : ℝ) (hx : 0 ≤ x) (N : ℕ) :
    |moment 0 x -
      ∑ n ∈ Finset.range (N + 1), ((-x) ^ n / (n.factorial : ℝ)) * moment n 0| ≤
      (x ^ (N + 1) / ((N + 1).factorial : ℝ)) * moment (N + 1) 0 := by
  have hscale : 0 ≤ 4 / Real.pi := by positivity
  have hsum : (∑ n ∈ Finset.range (N + 1),
      ((-x) ^ n / (n.factorial : ℝ)) * ((4 / Real.pi) * PositiveMomentTheta.moment n 0)) =
      (4 / Real.pi) * (∑ n ∈ Finset.range (N + 1),
        ((-x) ^ n / (n.factorial : ℝ)) * PositiveMomentTheta.moment n 0) := by
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro n _
    ring
  simp only [moment_eq_angular]
  rw [hsum, ← mul_sub, abs_mul, abs_of_nonneg hscale]
  calc
    _ ≤ (4 / Real.pi) *
        ((x ^ (N + 1) / ((N + 1).factorial : ℝ)) *
          PositiveMomentTheta.moment (N + 1) 0) :=
      mul_le_mul_of_nonneg_left (angular_zero_taylor_error x hx N) hscale
    _ = _ := by ring

/-- The finite normalized seed used before multiplying by sqrt(π) A / 2. -/
def zeroTaylorSeed (N : ℕ) (x : ℝ) : ℝ :=
  ∑ n ∈ Finset.range (N + 1), (-x) ^ n * zeroTaylorCoeff n

theorem moment_zero_taylorSeed_error (x : ℝ) (hx : 0 ≤ x) (N : ℕ) :
    |moment 0 x - zeroTaylorSeed N x| ≤ x ^ (N + 1) * zeroTaylorCoeff (N + 1) := by
  simpa only [zeroTaylorSeed, zeroTaylorCoeff, div_mul_eq_mul_div, mul_div_assoc] using
    moment_zero_taylor_error x hx N

end

/-! All definitions below are outside the noncomputable section. -/

/-- Exact rational coefficients, normalized by n!, with no real integral in the code. -/
def zeroTaylorCoeffQ : ℕ → ℚ
  | 0 => 1
  | n + 1 => zeroTaylorCoeffQ n * (2 * (n : ℚ) + 1) /
      (2 * ((n : ℚ) + 1) * ((n : ℚ) + 2))

@[simp]
theorem zeroTaylorCoeffQ_zero : zeroTaylorCoeffQ 0 = 1 := rfl

theorem zeroTaylorCoeffQ_succ (n : ℕ) :
    zeroTaylorCoeffQ (n + 1) = zeroTaylorCoeffQ n * (2 * (n : ℚ) + 1) /
      (2 * ((n : ℚ) + 1) * ((n : ℚ) + 2)) := rfl

/-- The executable coefficient recurrence is exactly Jₙ(0)/n!. -/
theorem zeroTaylorCoeffQ_cast (n : ℕ) :
    (zeroTaylorCoeffQ n : ℝ) = zeroTaylorCoeff n := by
  induction n with
  | zero => simp only [zeroTaylorCoeffQ_zero, Rat.cast_one, zeroTaylorCoeff_zero]
  | succ n ih =>
    rw [zeroTaylorCoeffQ_succ, zeroTaylorCoeff_succ]
    simp only [Rat.cast_div, Rat.cast_mul, Rat.cast_add, Rat.cast_natCast,
      Rat.cast_ofNat, Rat.cast_one, ih]

theorem zeroTaylorCoeffQ_pos (n : ℕ) : 0 < zeroTaylorCoeffQ n := by
  induction n with
  | zero => norm_num only [zeroTaylorCoeffQ_zero]
  | succ n ih =>
    rw [zeroTaylorCoeffQ_succ]
    exact div_pos (mul_pos ih (by positivity)) (by positivity)

/-- One signed rational Taylor term. -/
def zeroTaylorTermQ (x : ℚ) (n : ℕ) : ℚ := (-x) ^ n * zeroTaylorCoeffQ n

theorem zeroTaylorTermQ_succ (x : ℚ) (n : ℕ) :
    zeroTaylorTermQ x (n + 1) =
      zeroTaylorTermQ x n * (-x) * (2 * (n : ℚ) + 1) /
        (2 * ((n : ℚ) + 1) * ((n : ℚ) + 2)) := by
  unfold zeroTaylorTermQ
  rw [pow_succ, zeroTaylorCoeffQ_succ]
  ring

theorem abs_zeroTaylorTermQ (x : ℚ) (hx : 0 ≤ x) (n : ℕ) :
    |zeroTaylorTermQ x n| = x ^ n * zeroTaylorCoeffQ n := by
  rw [zeroTaylorTermQ, abs_mul, abs_pow, abs_neg,
    abs_of_nonneg hx, abs_of_pos (zeroTaylorCoeffQ_pos n)]

/-- Exact finite polynomial; N means terms 0 through N, inclusive. -/
def zeroTaylorSeedQ (N : ℕ) (x : ℚ) : ℚ :=
  ∑ n ∈ Finset.range (N + 1), zeroTaylorTermQ x n

theorem zeroTaylorSeedQ_cast (N : ℕ) (x : ℚ) :
    (zeroTaylorSeedQ N x : ℝ) = zeroTaylorSeed N (x : ℝ) := by
  simp only [zeroTaylorSeedQ, zeroTaylorTermQ, zeroTaylorSeed,
    Rat.cast_sum, Rat.cast_mul, Rat.cast_pow, Rat.cast_neg, zeroTaylorCoeffQ_cast]

/-- The exact integrated next term, not a geometric-series or exp(|x|) estimate. -/
def zeroTaylorRadiusQ (N : ℕ) (x : ℚ) : ℚ :=
  x ^ (N + 1) * zeroTaylorCoeffQ (N + 1)

theorem zeroTaylorRadiusQ_cast (N : ℕ) (x : ℚ) :
    (zeroTaylorRadiusQ N x : ℝ) = (x : ℝ) ^ (N + 1) * zeroTaylorCoeff (N + 1) := by
  simp only [zeroTaylorRadiusQ, Rat.cast_mul, Rat.cast_pow, zeroTaylorCoeffQ_cast]

/-- Rational seed accuracy is proved from the analytic moment theorem. -/
theorem moment_zero_rationalSeed_error (N : ℕ) (x : ℚ) (hx : 0 ≤ x) :
    |moment 0 (x : ℝ) - (zeroTaylorSeedQ N x : ℝ)| ≤ (zeroTaylorRadiusQ N x : ℝ) := by
  rw [zeroTaylorSeedQ_cast, zeroTaylorRadiusQ_cast]
  exact moment_zero_taylorSeed_error (x : ℝ) (Rat.cast_nonneg.mpr hx) N

end Grothe.UpperChaos.OriginalPositiveMoment

#print axioms Grothe.UpperChaos.OriginalPositiveMoment.moment_zero_zero
#print axioms Grothe.UpperChaos.OriginalPositiveMoment.zeroTaylorCoeff_succ
/-- info: 'Grothe.UpperChaos.OriginalPositiveMoment.moment_zero_taylor_error' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.OriginalPositiveMoment.moment_zero_taylor_error
/-- info: 'Grothe.UpperChaos.OriginalPositiveMoment.moment_zero_taylorSeed_error' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.OriginalPositiveMoment.moment_zero_taylorSeed_error
#print axioms Grothe.UpperChaos.OriginalPositiveMoment.zeroTaylorCoeffQ_cast
/-- info: 'Grothe.UpperChaos.OriginalPositiveMoment.moment_zero_rationalSeed_error' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.OriginalPositiveMoment.moment_zero_rationalSeed_error

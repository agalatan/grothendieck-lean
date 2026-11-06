import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Analysis.Calculus.ParametricIntervalIntegral
import Grothe.UpperChaos.OriginalMomentIntegrable
import Grothe.UpperChaos.F0ConditionalSeed
import Grothe.UpperChaos.ConditionalCoefficientCharge

/-!
# The explicit formula of the canonical coefficients and their bound for large `|A|`

For the Bernstein-ellipse remainders of part (Q) of `hQuad` (`docs/QUAD_CHECKER.md` §12.4) the node
integrand needs an analytic extension of the canonical coefficients `U_{c,d}(A)` in the shift `A`,
and a bound on it where `|A|` is large (the root windows). With
`Φ_n(x) = ∫₀¹ t^{n−½} √(1−t) e^{−xt} dt` (entire in `x`) and
`D_{c,d}(A) = Σ_{i ≤ c} C(c,i) (d+1)↓i (−1)^{c+d−i} A^{c+d+1−2i} Φ_{c+d−i}(A²)`,
`Uext c d A = D_{c,d}(A) / √(c! d! π)`:

* (E1) `hasDerivAt_Phi`: `Φ_n' = −Φ_{n+1}` (differentiation under the integral);
* (E2) `hasDerivAt_Dcd`: `D_{c,d}' = D_{c+1,d} + D_{c,d+1}`, so `Uext c d` is entire;
* (E3) `Dcd_charge`: `A (D_{c+1,d} − D_{c,d+1}) = (d + 1 − c) D_{c,d}` (pure combinatorics:
  `coeff_charge`, `coeff_deriv`);
* (E4) `canonicalCoefficient_eq_Uext`: for real `A ≠ 0`, `canonicalCoefficient A (c, d) =
  Uext c d A` (zero row from `F0ConditionalSeed.canonicalCoefficient_zero_row` and
  `moment = (2/π) Φ`, then `canonicalCoefficient_forward` and E3, by induction on `c`);
* (E5) `sum_norm_Uext_sq_le`: for `Re A² > 0`, `θ = ‖A‖²/Re A²`,
  `Σ_{m ≤ D} Σ_{c ≤ m} ‖U_{c,m−c}(A)‖² ≤ 4θ Σ_{m ≤ D} (m+1) m! (8θ²/‖A‖²)^m`, from
  `‖Φ_n(x)‖ ≤ √π n! (Re x)^{−n−½}` (`norm_Phi_le_gamma`) and
  `C(c,i) (d+1)↓i (c+d−i)! = c! d! C(c+d−i, d) C(d+1, i)` (`coeff_factorial_eq`); per pair,
  `norm_Uext_sq_le : ‖U_{c,d}(A)‖² ≤ 4θ (c+d)! (8θ²/‖A‖²)^{c+d}`.

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.Explicit

open MeasureTheory

noncomputable section

/-- `Φ_n(x) = ∫₀¹ t^{n−½} √(1−t) e^{−xt} dt`, an entire function of `x`. -/
def Phi (n : ℕ) (x : ℂ) : ℂ :=
  ∫ t in (0:ℝ)..1, ((t ^ ((n:ℝ) - 1/2) * Real.sqrt (1 - t) : ℝ) : ℂ) * Complex.exp (-x * t)

/-- The unnormalised explicit coefficient. -/
def Dcd (c d : ℕ) (A : ℂ) : ℂ :=
  ∑ i ∈ Finset.range (c + 1), (c.choose i : ℂ) * ((d + 1).descFactorial i : ℂ) *
    (-1) ^ (c + d - i) * A ^ (c + d + 1 - 2 * i) * Phi (c + d - i) (A ^ 2)

/-- The explicit coefficient `U_{c,d}(A)`. -/
def Uext (c d : ℕ) (A : ℂ) : ℂ :=
  Dcd c d A / ((Real.sqrt ((c.factorial : ℝ) * d.factorial * Real.pi) : ℝ) : ℂ)

/-! ### The combinatorics of the coefficients -/

/-- The `i`-th term of `Dcd`. -/
def term (c d i : ℕ) (A : ℂ) : ℂ :=
  (c.choose i : ℂ) * ((d + 1).descFactorial i : ℂ) *
    (-1) ^ (c + d - i) * A ^ (c + d + 1 - 2 * i) * Phi (c + d - i) (A ^ 2)

lemma Dcd_eq_sum_term (c d : ℕ) (A : ℂ) : Dcd c d A = ∑ i ∈ Finset.range (c + 1), term c d i A :=
  rfl

/-- The common factor of the shifted terms. -/
def X (c d i : ℕ) (A : ℂ) : ℂ := (-1) ^ (c + d - i) * A ^ (c + d - 2 * i) * Phi (c + d - i) (A ^ 2)

lemma term_succ_left (c d i : ℕ) (A : ℂ) :
    term (c + 1) d (i + 1) A = ((c + 1).choose (i + 1) : ℂ) * ((d + 1).descFactorial (i + 1) : ℂ) *
      X c d i A := by
  unfold term X
  rw [show c + 1 + d - (i + 1) = c + d - i by omega,
    show c + 1 + d + 1 - 2 * (i + 1) = c + d - 2 * i by omega]
  ring

lemma term_succ_right (c d i : ℕ) (A : ℂ) :
    term c (d + 1) (i + 1) A = (c.choose (i + 1) : ℂ) * ((d + 1 + 1).descFactorial (i + 1) : ℂ) *
      X c d i A := by
  unfold term X
  rw [show c + (d + 1) - (i + 1) = c + d - i by omega,
    show c + (d + 1) + 1 - 2 * (i + 1) = c + d - 2 * i by omega]
  ring

lemma term_zero_left_right (c d : ℕ) (A : ℂ) : term (c + 1) d 0 A = term c (d + 1) 0 A := by
  unfold term
  rw [show c + 1 + d = c + (d + 1) by omega]
  simp

lemma term_choose_out (c d : ℕ) (A : ℂ) : term c d (c + 1) A = 0 := by
  unfold term
  simp [Nat.choose_succ_self]

/-- The charge identity of the coefficients, in `ℤ`. -/
lemma coeff_charge (c d i : ℕ) :
    (((c + 1).choose (i + 1) * (d + 1).descFactorial (i + 1) : ℕ) : ℤ) -
      ((c.choose (i + 1) * (d + 1 + 1).descFactorial (i + 1) : ℕ) : ℤ) =
      ((d : ℤ) + 1 - c) * ((c.choose i * (d + 1).descFactorial i : ℕ) : ℤ) := by
  have h1 := Nat.choose_succ_succ' c i
  have h2 := Nat.descFactorial_succ (d + 1) i
  have h3 := Nat.succ_descFactorial_succ (d + 1) i
  have h4 := Nat.choose_succ_right_eq c i
  rw [h1, h2, h3]
  by_cases hc : i ≤ c
  · by_cases hd : i ≤ d + 1
    · have h4' : ((c.choose (i + 1) : ℕ) : ℤ) * ((i : ℤ) + 1) =
          (c.choose i : ℤ) * ((c : ℤ) - i) := by
        have := congrArg (fun n : ℕ => (n : ℤ)) h4
        push_cast [Nat.cast_sub hc] at this
        linarith
      have hi : ((i : ℤ) + 1) ≠ 0 := by positivity
      apply mul_left_cancel₀ hi
      push_cast [Nat.cast_sub hd]
      linear_combination (((d : ℤ) + 1 - i) * ((d + 1).descFactorial i : ℤ) -
        ((d : ℤ) + 1 + 1) * ((d + 1).descFactorial i : ℤ)) * h4'
    · have : (d + 1).descFactorial i = 0 := Nat.descFactorial_eq_zero_iff_lt.mpr (by omega)
      simp [this]
  · have h0 : c.choose i = 0 := Nat.choose_eq_zero_of_lt (by omega)
    have h0' : c.choose (i + 1) = 0 := Nat.choose_eq_zero_of_lt (by omega)
    simp [h0, h0']

/-- The derivative identity of the coefficients, in `ℕ`. -/
lemma coeff_deriv (c d i : ℕ) :
    (c + 1).choose (i + 1) * (d + 1).descFactorial (i + 1) +
      c.choose (i + 1) * (d + 1 + 1).descFactorial (i + 1) =
      2 * (c.choose (i + 1) * (d + 1).descFactorial (i + 1)) +
        (c + d + 1 - 2 * i) * (c.choose i * (d + 1).descFactorial i) := by
  have h1 := Nat.choose_succ_succ' c i
  have h2 := Nat.descFactorial_succ (d + 1) i
  have h3 := Nat.succ_descFactorial_succ (d + 1) i
  have h4 := Nat.choose_succ_right_eq c i
  rw [h1, h2, h3]
  by_cases hc : i ≤ c
  · by_cases hd : i ≤ d + 1
    · have h4' : ((c.choose (i + 1) : ℕ) : ℤ) * ((i : ℤ) + 1) =
          (c.choose i : ℤ) * ((c : ℤ) - i) := by
        have := congrArg (fun n : ℕ => (n : ℤ)) h4
        push_cast [Nat.cast_sub hc] at this
        linarith
      have hi : ((i : ℤ) + 1) ≠ 0 := by positivity
      zify [hd, show 2 * i ≤ c + d + 1 by omega]
      apply mul_left_cancel₀ hi
      linear_combination (((d : ℤ) + 1 - i) * ((d + 1).descFactorial i : ℤ) +
        ((d : ℤ) + 1 + 1) * ((d + 1).descFactorial i : ℤ) -
        2 * ((d : ℤ) + 1 - i) * ((d + 1).descFactorial i : ℤ)) * h4'
    · have : (d + 1).descFactorial i = 0 := Nat.descFactorial_eq_zero_iff_lt.mpr (by omega)
      simp [this]
  · have h0 : c.choose i = 0 := Nat.choose_eq_zero_of_lt (by omega)
    have h0' : c.choose (i + 1) = 0 := Nat.choose_eq_zero_of_lt (by omega)
    simp [h0, h0']

lemma sum_succ_left (c d : ℕ) (A : ℂ) :
    Dcd (c + 1) d A =
      term (c + 1) d 0 A + ∑ i ∈ Finset.range (c + 1), term (c + 1) d (i + 1) A := by
  rw [Dcd_eq_sum_term, Finset.sum_range_succ', add_comm]

lemma sum_succ_right (c d : ℕ) (A : ℂ) :
    Dcd c (d + 1) A =
      term c (d + 1) 0 A + ∑ i ∈ Finset.range (c + 1), term c (d + 1) (i + 1) A := by
  have h := Finset.sum_range_succ (fun i => term c (d + 1) i A) (c + 1)
  rw [term_choose_out, add_zero, Finset.sum_range_succ'] at h
  rw [Dcd_eq_sum_term, ← h, add_comm]

lemma A_mul_X (c d i : ℕ) (hi : i < c + 1) (A : ℂ) :
    A * (((d : ℂ) + 1 - c) * ((c.choose i : ℂ) * ((d + 1).descFactorial i : ℂ)) * X c d i A) =
      ((d : ℂ) + 1 - c) * term c d i A := by
  unfold X term
  by_cases h2 : 2 * i ≤ c + d
  · rw [show c + d + 1 - 2 * i = (c + d - 2 * i) + 1 by omega, pow_succ]
    ring
  · by_cases hd : i ≤ d + 1
    · have hc : (c : ℂ) = (d : ℂ) + 1 := by exact_mod_cast (show c = d + 1 by omega)
      rw [hc]; ring
    · have : (d + 1).descFactorial i = 0 := Nat.descFactorial_eq_zero_iff_lt.mpr (by omega)
      simp [this]

/-- **(E3) The charge identity of the explicit coefficients.** -/
theorem Dcd_charge (c d : ℕ) (A : ℂ) :
    A * (Dcd (c + 1) d A - Dcd c (d + 1) A) = ((d : ℂ) + 1 - c) * Dcd c d A := by
  rw [sum_succ_left, sum_succ_right, term_zero_left_right, add_sub_add_left_eq_sub,
    ← Finset.sum_sub_distrib, Dcd_eq_sum_term, Finset.mul_sum, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i hi
  rw [Finset.mem_range] at hi
  rw [← A_mul_X c d i hi A, term_succ_left, term_succ_right]
  congr 1
  have h := congrArg (fun z : ℤ => (z : ℂ)) (coeff_charge c d i)
  push_cast at h
  linear_combination X c d i A * h

/-! ### The functions `Φ_n` -/

/-- The weight `t^{n−½} √(1−t)` of `Φ_n`. -/
def wt (n : ℕ) (t : ℝ) : ℝ := t ^ ((n : ℝ) - 1 / 2) * Real.sqrt (1 - t)

lemma Phi_eq (n : ℕ) (x : ℂ) :
    Phi n x = ∫ t in (0:ℝ)..1, (wt n t : ℂ) * Complex.exp (-x * t) := rfl

lemma wt_nonneg (n : ℕ) {t : ℝ} (ht : 0 ≤ t) : 0 ≤ wt n t :=
  mul_nonneg (Real.rpow_nonneg ht _) (Real.sqrt_nonneg _)

lemma measurable_wt (n : ℕ) : Measurable (wt n) := by
  unfold wt; fun_prop

lemma wt_intervalIntegrable (n : ℕ) : IntervalIntegrable (wt n) volume 0 1 := by
  have hn : (0 : ℝ) ≤ n := Nat.cast_nonneg n
  have hs : IntervalIntegrable (fun t : ℝ => t ^ ((n : ℝ) - 1 / 2)) volume 0 1 :=
    intervalIntegral.intervalIntegrable_rpow' (by linarith)
  have hc : Continuous (fun t : ℝ => Real.sqrt (1 - t)) := by fun_prop
  exact hs.mul_continuousOn hc.continuousOn

lemma wt_mul_self (n : ℕ) {t : ℝ} (ht : 0 ≤ t) : wt n t * t = wt (n + 1) t := by
  unfold wt
  rcases ht.eq_or_lt with h | h
  · subst h
    have h1 : ((n : ℝ) - 1 / 2) ≠ 0 := by
      intro h; have : (2 : ℝ) * n = 1 := by linarith
      have : (2 * n : ℕ) = 1 := by exact_mod_cast this
      omega
    have h2 : (((n + 1 : ℕ) : ℝ) - 1 / 2) ≠ 0 := by
      intro h; have : (2 : ℝ) * n + 1 = 0 := by push_cast at h; linarith
      have : (2 * n + 1 : ℕ) = 0 := by exact_mod_cast this
      omega
    rw [Real.zero_rpow h1, Real.zero_rpow h2]
    ring
  · have : (((n + 1 : ℕ) : ℝ) - 1 / 2) = ((n : ℝ) - 1 / 2) + 1 := by push_cast; ring
    rw [this, Real.rpow_add_one h.ne']
    ring

lemma norm_cexp_neg_mul_le {x : ℂ} {t : ℝ} (ht : t ∈ Set.Icc (0 : ℝ) 1) :
    ‖Complex.exp (-x * t)‖ ≤ Real.exp ‖x‖ := by
  rw [Complex.norm_exp]
  apply Real.exp_le_exp.mpr
  calc (-x * t).re ≤ ‖-x * t‖ := Complex.re_le_norm _
    _ = ‖x‖ * t := by rw [norm_mul, norm_neg, Complex.norm_real, Real.norm_of_nonneg ht.1]
    _ ≤ ‖x‖ * 1 := mul_le_mul_of_nonneg_left ht.2 (norm_nonneg _)
    _ = ‖x‖ := mul_one _

/-- **(E1)** `Φ_n' = −Φ_{n+1}`. -/
theorem hasDerivAt_Phi (n : ℕ) (x : ℂ) : HasDerivAt (Phi n) (-Phi (n + 1) x) x := by
  have hball : Metric.ball x 1 ∈ nhds x := Metric.ball_mem_nhds x one_pos
  have hmeas : ∀ y : ℂ, AEStronglyMeasurable (fun t : ℝ => (wt n t : ℂ) * Complex.exp (-y * t))
      (volume.restrict (Set.uIoc 0 1)) := by
    intro y
    apply Measurable.aestronglyMeasurable
    have := measurable_wt n
    fun_prop
  have hmeas' : AEStronglyMeasurable
      (fun t : ℝ => (wt n t : ℂ) * (-(t : ℂ) * Complex.exp (-x * t)))
      (volume.restrict (Set.uIoc 0 1)) := by
    apply Measurable.aestronglyMeasurable
    have := measurable_wt n
    fun_prop
  have hint : IntervalIntegrable (fun t : ℝ => (wt n t : ℂ) * Complex.exp (-x * t)) volume 0 1 := by
    have h1 : IntervalIntegrable (fun t : ℝ => (wt n t : ℂ)) volume 0 1 :=
      ⟨(wt_intervalIntegrable n).1.ofReal, (wt_intervalIntegrable n).2.ofReal⟩
    exact h1.mul_continuousOn (by fun_prop)
  have hbint : IntervalIntegrable (fun t => wt n t * Real.exp (‖x‖ + 1)) volume 0 1 :=
    (wt_intervalIntegrable n).mul_const _
  have key := intervalIntegral.hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (F := fun y t => (wt n t : ℂ) * Complex.exp (-y * t))
    (F' := fun y t => (wt n t : ℂ) * (-(t : ℂ) * Complex.exp (-y * t)))
    (bound := fun t => wt n t * Real.exp (‖x‖ + 1)) hball
    (Filter.Eventually.of_forall hmeas) hint hmeas' ?_ hbint ?_
  · have heq : (∫ t in (0:ℝ)..1, (wt n t : ℂ) * (-(t : ℂ) * Complex.exp (-x * t))) =
        -Phi (n + 1) x := by
      rw [Phi_eq, ← intervalIntegral.integral_neg]
      apply intervalIntegral.integral_congr
      intro t ht
      rw [Set.uIcc_of_le zero_le_one] at ht
      simp only
      rw [← wt_mul_self n ht.1]
      push_cast
      ring
    rw [← heq]
    exact key.2
  · filter_upwards with t ht y hy
    rw [Set.uIoc_of_le zero_le_one] at ht
    have ht' : t ∈ Set.Icc (0 : ℝ) 1 := ⟨ht.1.le, ht.2⟩
    rw [norm_mul, norm_mul, norm_neg, Complex.norm_real, Complex.norm_real,
      Real.norm_of_nonneg (wt_nonneg n ht'.1), Real.norm_of_nonneg ht'.1]
    apply mul_le_mul_of_nonneg_left _ (wt_nonneg n ht'.1)
    have hy' : ‖y‖ ≤ ‖x‖ + 1 := by
      have := norm_le_norm_add_norm_sub' y x
      rw [Metric.mem_ball, dist_eq_norm] at hy
      linarith
    calc t * ‖Complex.exp (-y * t)‖ ≤ 1 * Real.exp ‖y‖ :=
          mul_le_mul ht'.2 (norm_cexp_neg_mul_le ht') (norm_nonneg _) zero_le_one
      _ ≤ Real.exp (‖x‖ + 1) := by rw [one_mul]; exact Real.exp_le_exp.mpr hy'
  · filter_upwards with t _ y _
    have h1 : HasDerivAt (fun y : ℂ => -y * t) (-1 * t) y := (hasDerivAt_id' y).neg.mul_const _
    have h := h1.cexp.const_mul (wt n t : ℂ)
    convert h using 1
    ring

theorem differentiable_Phi (n : ℕ) : Differentiable ℂ (Phi n) :=
  fun x => (hasDerivAt_Phi n x).differentiableAt

/-! ### The derivative of the explicit coefficients -/

/-- The first part of the derivative of the `i`-th term (from the power of `A`). -/
def wd (c d i : ℕ) (A : ℂ) : ℂ :=
  (c.choose i : ℂ) * ((d + 1).descFactorial i : ℂ) * (-1) ^ (c + d - i) *
    (((c + d + 1 - 2 * i : ℕ) : ℂ) * A ^ (c + d + 1 - 2 * i - 1)) * Phi (c + d - i) (A ^ 2)

/-- The second part of the derivative of the `i`-th term (from `Φ`). -/
def zd (c d i : ℕ) (A : ℂ) : ℂ :=
  (c.choose i : ℂ) * ((d + 1).descFactorial i : ℂ) * (-1) ^ (c + d - i) *
    A ^ (c + d + 1 - 2 * i) * (-Phi (c + d - i + 1) (A ^ 2) * ((2 : ℕ) * A ^ (2 - 1)))

lemma hasDerivAt_term (c d i : ℕ) (A : ℂ) :
    HasDerivAt (term c d i) (wd c d i A + zd c d i A) A := by
  have hP := (hasDerivAt_Phi (c + d - i) (A ^ 2)).comp A (hasDerivAt_pow 2 A)
  have hp := hasDerivAt_pow (c + d + 1 - 2 * i) A
  have h := (hp.mul hP).const_mul ((c.choose i : ℂ) * ((d + 1).descFactorial i : ℂ) *
    (-1) ^ (c + d - i))
  unfold term
  convert h using 1
  · funext B
    simp only [Pi.mul_apply, Function.comp_apply]
    ring
  · unfold wd zd
    simp only [Function.comp_apply]
    ring

lemma wd_eq (c d i : ℕ) (A : ℂ) :
    wd c d i A = (c.choose i : ℂ) * ((d + 1).descFactorial i : ℂ) * ((c + d + 1 - 2 * i : ℕ) : ℂ) *
      X c d i A := by
  unfold wd X
  rw [show c + d + 1 - 2 * i - 1 = c + d - 2 * i by omega]
  ring

lemma zd_zero (c d : ℕ) (A : ℂ) : zd c d 0 A = 2 * term c (d + 1) 0 A := by
  unfold zd term
  rw [show c + (d + 1) - 0 = c + d - 0 + 1 by omega,
    show c + (d + 1) + 1 - 2 * 0 = (c + d + 1 - 2 * 0) + 1 by omega, pow_succ, pow_succ]
  simp only [Nat.descFactorial_zero, Nat.choose_zero_right]
  push_cast
  ring

lemma zd_succ (c d i : ℕ) (A : ℂ) :
    zd c d (i + 1) A = 2 * ((c.choose (i + 1) : ℂ) * ((d + 1).descFactorial (i + 1) : ℂ)) *
      X c d i A := by
  by_cases h : i + 1 ≤ c ∧ i + 1 ≤ d + 1
  · unfold zd X
    obtain ⟨h1, h2⟩ := h
    rw [show c + d - (i + 1) + 1 = c + d - i by omega,
      show c + d - 2 * i = (c + d + 1 - 2 * (i + 1)) + 1 by omega,
      show c + d - i = (c + d - (i + 1)) + 1 by omega, pow_succ, pow_succ (A : ℂ)]
    push_cast
    ring
  · have h0 : (c.choose (i + 1) : ℂ) * ((d + 1).descFactorial (i + 1) : ℂ) = 0 := by
      rcases not_and_or.mp h with h | h
      · rw [Nat.choose_eq_zero_of_lt (by omega)]; simp
      · rw [Nat.descFactorial_eq_zero_iff_lt.mpr (by omega)]; simp
    unfold zd
    rw [h0]
    simp

lemma zd_out (c d : ℕ) (A : ℂ) : zd c d (c + 1) A = 0 := by
  unfold zd
  simp [Nat.choose_succ_self]

/-- **(E2)** The derivative of the explicit coefficient. -/
theorem hasDerivAt_Dcd (c d : ℕ) (A : ℂ) :
    HasDerivAt (Dcd c d) (Dcd (c + 1) d A + Dcd c (d + 1) A) A := by
  have h := HasDerivAt.sum (u := Finset.range (c + 1)) (A := fun i => term c d i)
    (A' := fun i => wd c d i A + zd c d i A) (x := A) (fun i _ => hasDerivAt_term c d i A)
  have hfun : ∑ i ∈ Finset.range (c + 1), term c d i = Dcd c d := by
    funext y; rw [Finset.sum_apply]; rfl
  rw [hfun] at h
  convert h using 1
  rw [Finset.sum_add_distrib, sum_succ_left, sum_succ_right, term_zero_left_right]
  have hz : ∑ i ∈ Finset.range (c + 1), zd c d i A =
      zd c d 0 A + ∑ i ∈ Finset.range (c + 1), zd c d (i + 1) A := by
    rw [Finset.sum_range_succ', Finset.sum_range_succ (fun i => zd c d (i + 1) A), zd_out]
    ring
  rw [hz, zd_zero]
  have hterm : ∀ i ∈ Finset.range (c + 1),
      term (c + 1) d (i + 1) A + term c (d + 1) (i + 1) A = wd c d i A + zd c d (i + 1) A := by
    intro i _
    rw [term_succ_left, term_succ_right, wd_eq, zd_succ]
    have hc := congrArg (fun n : ℕ => (n : ℂ)) (coeff_deriv c d i)
    push_cast at hc
    linear_combination X c d i A * hc
  have hs : ∑ i ∈ Finset.range (c + 1), (term (c + 1) d (i + 1) A + term c (d + 1) (i + 1) A) =
      ∑ i ∈ Finset.range (c + 1), (wd c d i A + zd c d (i + 1) A) := Finset.sum_congr rfl hterm
  rw [Finset.sum_add_distrib, Finset.sum_add_distrib] at hs
  linear_combination hs

theorem differentiable_Dcd (c d : ℕ) : Differentiable ℂ (Dcd c d) :=
  fun A => (hasDerivAt_Dcd c d A).differentiableAt

/-! ### The bound of `Φ_n` in the right half plane -/

lemma norm_Phi_le (n : ℕ) (x : ℂ) :
    ‖Phi n x‖ ≤ ∫ t in (0:ℝ)..1, wt n t * Real.exp (-x.re * t) := by
  rw [Phi_eq]
  refine (intervalIntegral.norm_integral_le_integral_norm zero_le_one).trans (le_of_eq ?_)
  apply intervalIntegral.integral_congr
  intro t ht
  rw [Set.uIcc_of_le zero_le_one] at ht
  simp only
  rw [norm_mul, Complex.norm_real, Real.norm_of_nonneg (wt_nonneg n ht.1), Complex.norm_exp]
  congr 2
  simp

/-- The Gamma integral of the weight without `√(1−t)`. -/
lemma integral_rpow_exp_Ioi (n : ℕ) {r : ℝ} (hr : 0 < r) :
    ∫ t in Set.Ioi 0, t ^ ((n : ℝ) - 1 / 2) * Real.exp (-(r * t)) =
      (1 / r) ^ ((n : ℝ) + 1 / 2) * Real.Gamma ((n : ℝ) + 1 / 2) := by
  have ha : (0 : ℝ) < (n : ℝ) + 1 / 2 := by positivity
  have h := Real.integral_rpow_mul_exp_neg_mul_Ioi ha hr
  rw [show (n : ℝ) + 1 / 2 - 1 = (n : ℝ) - 1 / 2 by ring] at h
  exact h

lemma integrableOn_rpow_exp_Ioi (n : ℕ) {r : ℝ} (hr : 0 < r) :
    IntegrableOn (fun t : ℝ => t ^ ((n : ℝ) - 1 / 2) * Real.exp (-(r * t))) (Set.Ioi 0) := by
  by_contra hcon
  have h := integral_rpow_exp_Ioi n hr
  rw [integral_undef hcon] at h
  have hpos : 0 < (1 / r) ^ ((n : ℝ) + 1 / 2) * Real.Gamma ((n : ℝ) + 1 / 2) :=
    mul_pos (Real.rpow_pos_of_pos (by positivity) _) (Real.Gamma_pos_of_pos (by positivity))
  linarith

lemma Gamma_add_half_le (n : ℕ) :
    Real.Gamma ((n : ℝ) + 1 / 2) ≤ Real.sqrt Real.pi * n.factorial := by
  induction n with
  | zero => rw [Nat.cast_zero, zero_add, Real.Gamma_one_half_eq]; simp
  | succ n ih =>
    have hne : (n : ℝ) + 1 / 2 ≠ 0 := by positivity
    rw [show ((n + 1 : ℕ) : ℝ) + 1 / 2 = ((n : ℝ) + 1 / 2) + 1 by push_cast; ring,
      Real.Gamma_add_one hne, Nat.factorial_succ]
    have hG : 0 ≤ Real.Gamma ((n : ℝ) + 1 / 2) := (Real.Gamma_pos_of_pos (by positivity)).le
    push_cast
    calc ((n : ℝ) + 1 / 2) * Real.Gamma ((n : ℝ) + 1 / 2)
        ≤ ((n : ℝ) + 1) * (Real.sqrt Real.pi * n.factorial) :=
          mul_le_mul (by linarith) ih hG (by positivity)
      _ = _ := by ring

/-- `‖Φ_n(x)‖ ≤ √π n! (Re x)^{−n−½}` for `Re x > 0`. -/
theorem norm_Phi_le_gamma (n : ℕ) {x : ℂ} (hx : 0 < x.re) :
    ‖Phi n x‖ ≤ Real.sqrt Real.pi * n.factorial * (1 / x.re) ^ ((n : ℝ) + 1 / 2) := by
  refine (norm_Phi_le n x).trans ?_
  have hn : (0 : ℝ) ≤ n := Nat.cast_nonneg n
  have hint1 : IntervalIntegrable (fun t => wt n t * Real.exp (-x.re * t)) volume 0 1 :=
    (wt_intervalIntegrable n).mul_continuousOn (by fun_prop)
  have hint2 : IntervalIntegrable (fun t : ℝ => t ^ ((n : ℝ) - 1 / 2) * Real.exp (-(x.re * t)))
      volume 0 1 :=
    (intervalIntegral.intervalIntegrable_rpow' (by linarith)).mul_continuousOn (by fun_prop)
  calc (∫ t in (0:ℝ)..1, wt n t * Real.exp (-x.re * t))
      ≤ ∫ t in (0:ℝ)..1, t ^ ((n : ℝ) - 1 / 2) * Real.exp (-(x.re * t)) := by
        apply intervalIntegral.integral_mono_on zero_le_one hint1 hint2
        intro t ht
        unfold wt
        rw [neg_mul]
        apply mul_le_mul_of_nonneg_right _ (Real.exp_pos _).le
        calc t ^ ((n : ℝ) - 1 / 2) * Real.sqrt (1 - t) ≤ t ^ ((n : ℝ) - 1 / 2) * 1 :=
              mul_le_mul_of_nonneg_left (Real.sqrt_le_one.mpr (by linarith [ht.1]))
                (Real.rpow_nonneg ht.1 _)
          _ = _ := mul_one _
    _ = ∫ t in Set.Ioc 0 1, t ^ ((n : ℝ) - 1 / 2) * Real.exp (-(x.re * t)) :=
        intervalIntegral.integral_of_le zero_le_one
    _ ≤ ∫ t in Set.Ioi 0, t ^ ((n : ℝ) - 1 / 2) * Real.exp (-(x.re * t)) := by
        apply setIntegral_mono_set (integrableOn_rpow_exp_Ioi n hx)
        · filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht
          exact mul_nonneg (Real.rpow_nonneg (le_of_lt ht) _) (Real.exp_pos _).le
        · exact Filter.Eventually.of_forall (fun t ht => Set.Ioc_subset_Ioi_self ht)
    _ = (1 / x.re) ^ ((n : ℝ) + 1 / 2) * Real.Gamma ((n : ℝ) + 1 / 2) := integral_rpow_exp_Ioi n hx
    _ ≤ (1 / x.re) ^ ((n : ℝ) + 1 / 2) * (Real.sqrt Real.pi * n.factorial) :=
        mul_le_mul_of_nonneg_left (Gamma_add_half_le n) (Real.rpow_nonneg (by positivity) _)
    _ = _ := by ring

/-! ### The bound of the explicit coefficients for `Re A² > 0` -/

lemma re_sq_le_norm_sq (A : ℂ) : (A ^ 2).re ≤ ‖A‖ ^ 2 := by
  calc (A ^ 2).re ≤ ‖A ^ 2‖ := Complex.re_le_norm _
    _ = ‖A‖ ^ 2 := norm_pow _ _

lemma norm_pos_of_re_sq_pos {A : ℂ} (hr : 0 < (A ^ 2).re) : 0 < ‖A‖ := by
  have := re_sq_le_norm_sq A
  by_contra h
  have h0 : ‖A‖ = 0 := le_antisymm (not_lt.mp h) (norm_nonneg _)
  rw [h0] at this
  linarith

/-- The powers of `‖A‖` and `(Re A²)^{−k−½}` combine into `θ^k √θ`. -/
lemma pow_mul_rpow_eq {a r : ℝ} (ha : 0 < a) (hr : 0 < r) (n p k : ℕ) (hnp : n + p = 2 * k + 1) :
    a ^ n * a ^ p * (1 / r) ^ ((k : ℝ) + 1 / 2) =
      (a ^ 2 / r) ^ k * Real.sqrt (a ^ 2 / r) := by
  rw [Real.rpow_add (by positivity), Real.rpow_natCast, ← Real.sqrt_eq_rpow, ← pow_add, hnp]
  have h1 : Real.sqrt (a ^ 2 / r) = a * Real.sqrt (1 / r) := by
    rw [show a ^ 2 / r = a ^ 2 * (1 / r) by ring, Real.sqrt_mul (sq_nonneg a), Real.sqrt_sq ha.le]
  rw [h1, show a ^ 2 / r = a ^ 2 * (1 / r) by ring, mul_pow]
  ring

/-- The bound of one term: `‖A‖^{c+d} ‖term‖ ≤ √π √θ · C(c,i) (d+1)↓i (c+d−i)! θ^{c+d−i}`. -/
lemma norm_term_le (c d i : ℕ) {A : ℂ} (hr : 0 < (A ^ 2).re) :
    ‖A‖ ^ (c + d) * ‖term c d i A‖ ≤
      Real.sqrt Real.pi * Real.sqrt (‖A‖ ^ 2 / (A ^ 2).re) *
        ((c.choose i : ℝ) * ((d + 1).descFactorial i : ℝ) * ((c + d - i).factorial : ℝ) *
          (‖A‖ ^ 2 / (A ^ 2).re) ^ (c + d - i)) := by
  have ha := norm_pos_of_re_sq_pos hr
  by_cases h : i ≤ c ∧ i ≤ d + 1
  · obtain ⟨h1, h2⟩ := h
    have hP := norm_Phi_le_gamma (c + d - i) (x := A ^ 2) hr
    unfold term
    rw [norm_mul, norm_mul, norm_mul, norm_mul, norm_pow, norm_neg, norm_one, one_pow, mul_one,
      Complex.norm_natCast, Complex.norm_natCast, norm_pow]
    have hk := pow_mul_rpow_eq ha hr (c + d) (c + d + 1 - 2 * i) (c + d - i) (by omega)
    have hcoef : (0 : ℝ) ≤ (c.choose i : ℝ) * ((d + 1).descFactorial i : ℝ) := by positivity
    calc ‖A‖ ^ (c + d) * ((c.choose i : ℝ) * ((d + 1).descFactorial i : ℝ) *
          ‖A‖ ^ (c + d + 1 - 2 * i) * ‖Phi (c + d - i) (A ^ 2)‖)
        ≤ ‖A‖ ^ (c + d) * ((c.choose i : ℝ) * ((d + 1).descFactorial i : ℝ) *
          ‖A‖ ^ (c + d + 1 - 2 * i) * (Real.sqrt Real.pi * ((c + d - i).factorial : ℝ) *
            (1 / (A ^ 2).re) ^ (((c + d - i : ℕ) : ℝ) + 1 / 2))) := by
          gcongr
      _ = Real.sqrt Real.pi * ((c.choose i : ℝ) * ((d + 1).descFactorial i : ℝ) *
            ((c + d - i).factorial : ℝ)) * (‖A‖ ^ (c + d) * ‖A‖ ^ (c + d + 1 - 2 * i) *
            (1 / (A ^ 2).re) ^ (((c + d - i : ℕ) : ℝ) + 1 / 2)) := by ring
      _ = _ := by rw [hk]; ring
  · have h0 : (c.choose i : ℂ) * ((d + 1).descFactorial i : ℂ) = 0 := by
      rcases not_and_or.mp h with h | h
      · rw [Nat.choose_eq_zero_of_lt (by omega)]; simp
      · rw [Nat.descFactorial_eq_zero_iff_lt.mpr (by omega)]; simp
    have : term c d i A = 0 := by unfold term; rw [h0]; simp
    rw [this, norm_zero, mul_zero]
    positivity

/-- `C(c,i) (d+1)↓i (c+d−i)! = c! d! C(c+d−i, d) C(d+1, i)` (as reals). -/
lemma coeff_factorial_eq (c d i : ℕ) (hc : i ≤ c) :
    (c.choose i : ℝ) * ((d + 1).descFactorial i : ℝ) * ((c + d - i).factorial : ℝ) =
      (c.factorial : ℝ) * d.factorial * ((c + d - i).choose d : ℝ) * ((d + 1).choose i : ℝ) := by
  by_cases hd : i ≤ d + 1
  · have e1 : ((c.choose i : ℕ) : ℝ) * (i.factorial : ℝ) * ((c - i).factorial : ℝ) =
        c.factorial := by
      exact_mod_cast Nat.choose_mul_factorial_mul_factorial hc
    have e2 : ((d + 1 - i).factorial : ℝ) * ((d + 1).descFactorial i : ℝ) = (d + 1).factorial := by
      exact_mod_cast Nat.factorial_mul_descFactorial hd
    have e3 : (((c + d - i).choose d : ℕ) : ℝ) * (d.factorial : ℝ) * ((c - i).factorial : ℝ) =
        (c + d - i).factorial := by
      have := Nat.choose_mul_factorial_mul_factorial (n := c + d - i) (k := d) (by omega)
      rw [show c + d - i - d = c - i by omega] at this
      exact_mod_cast this
    have e4 : (((d + 1).choose i : ℕ) : ℝ) * (i.factorial : ℝ) * ((d + 1 - i).factorial : ℝ) =
        (d + 1).factorial := by
      exact_mod_cast Nat.choose_mul_factorial_mul_factorial hd
    have hP : (i.factorial : ℝ) * ((c - i).factorial : ℝ) * ((d + 1 - i).factorial : ℝ) ≠ 0 := by
      positivity
    apply mul_right_cancel₀ hP
    linear_combination ((c + d - i).factorial : ℝ) *
        (((d + 1 - i).factorial : ℝ) * ((d + 1).descFactorial i : ℝ) * e1 +
          (c.factorial : ℝ) * e2) -
      (c.factorial : ℝ) * ((((d + 1).choose i : ℕ) : ℝ) * (i.factorial : ℝ) *
        ((d + 1 - i).factorial : ℝ) * e3 + ((c + d - i).factorial : ℝ) * e4)
  · rw [Nat.descFactorial_eq_zero_iff_lt.mpr (by omega),
      Nat.choose_eq_zero_of_lt (n := d + 1) (k := i) (by omega)]
    simp

lemma sum_choose_le (c d : ℕ) :
    ∑ i ∈ Finset.range (c + 1), ((d + 1).choose i : ℝ) ≤ 2 ^ (d + 1) := by
  have h : ∀ k, ∑ i ∈ Finset.range k, ((d + 1).choose i : ℝ) ≤ 2 ^ (d + 1) := by
    intro k
    calc ∑ i ∈ Finset.range k, ((d + 1).choose i : ℝ)
        ≤ ∑ i ∈ Finset.range (k + (d + 2)), ((d + 1).choose i : ℝ) :=
          Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_subset_range.mpr (by omega))
            (fun _ _ _ => by positivity)
      _ = 2 ^ (d + 1) := by
          rw [add_comm k, Finset.sum_range_add]
          have h0 : ∑ i ∈ Finset.range k, ((d + 1).choose (d + 2 + i) : ℝ) = 0 :=
            Finset.sum_eq_zero fun i _ => by rw [Nat.choose_eq_zero_of_lt (by omega)]; simp
          rw [h0, add_zero]
          exact_mod_cast Nat.sum_range_choose (d + 1)
  exact h (c + 1)

/-- The coefficient sum: `Σ_i C(c,i) (d+1)↓i (c+d−i)! ≤ c! d! C(c+d, d) 2^{d+1}`. -/
lemma sum_coeff_le (c d : ℕ) :
    ∑ i ∈ Finset.range (c + 1),
        (c.choose i : ℝ) * ((d + 1).descFactorial i : ℝ) * ((c + d - i).factorial : ℝ) ≤
      (c.factorial : ℝ) * d.factorial * ((c + d).choose d : ℝ) * 2 ^ (d + 1) := by
  calc ∑ i ∈ Finset.range (c + 1),
        (c.choose i : ℝ) * ((d + 1).descFactorial i : ℝ) * ((c + d - i).factorial : ℝ)
      = ∑ i ∈ Finset.range (c + 1),
          (c.factorial : ℝ) * d.factorial * ((c + d - i).choose d : ℝ) * ((d + 1).choose i : ℝ) :=
        Finset.sum_congr rfl fun i hi =>
          coeff_factorial_eq c d i (by rw [Finset.mem_range] at hi; omega)
    _ ≤ ∑ i ∈ Finset.range (c + 1),
          (c.factorial : ℝ) * d.factorial * ((c + d).choose d : ℝ) * ((d + 1).choose i : ℝ) := by
        apply Finset.sum_le_sum
        intro i _
        have : ((c + d - i).choose d : ℝ) ≤ ((c + d).choose d : ℝ) := by
          exact_mod_cast Nat.choose_le_choose d (by omega)
        gcongr
    _ = (c.factorial : ℝ) * d.factorial * ((c + d).choose d : ℝ) *
          ∑ i ∈ Finset.range (c + 1), ((d + 1).choose i : ℝ) := by rw [Finset.mul_sum]
    _ ≤ _ := by gcongr; exact sum_choose_le c d

/-- The bound of `Dcd`: `‖A‖^{c+d} ‖Dcd‖ ≤ √π √θ θ^{c+d} c! d! C(c+d, d) 2^{d+1}`. -/
theorem norm_Dcd_le (c d : ℕ) {A : ℂ} (hr : 0 < (A ^ 2).re) :
    ‖A‖ ^ (c + d) * ‖Dcd c d A‖ ≤
      Real.sqrt Real.pi * Real.sqrt (‖A‖ ^ 2 / (A ^ 2).re) * (‖A‖ ^ 2 / (A ^ 2).re) ^ (c + d) *
        ((c.factorial : ℝ) * d.factorial * ((c + d).choose d : ℝ) * 2 ^ (d + 1)) := by
  have ha := norm_pos_of_re_sq_pos hr
  have hθ : 1 ≤ ‖A‖ ^ 2 / (A ^ 2).re := by
    rw [le_div_iff₀ hr, one_mul]; exact re_sq_le_norm_sq A
  set θ := ‖A‖ ^ 2 / (A ^ 2).re with hθdef
  calc ‖A‖ ^ (c + d) * ‖Dcd c d A‖
      ≤ ∑ i ∈ Finset.range (c + 1), ‖A‖ ^ (c + d) * ‖term c d i A‖ := by
        rw [Dcd_eq_sum_term, ← Finset.mul_sum]
        exact mul_le_mul_of_nonneg_left (norm_sum_le _ _) (by positivity)
    _ ≤ ∑ i ∈ Finset.range (c + 1), Real.sqrt Real.pi * Real.sqrt θ *
          ((c.choose i : ℝ) * ((d + 1).descFactorial i : ℝ) * ((c + d - i).factorial : ℝ) *
            θ ^ (c + d - i)) :=
        Finset.sum_le_sum fun i _ => norm_term_le c d i hr
    _ ≤ ∑ i ∈ Finset.range (c + 1), Real.sqrt Real.pi * Real.sqrt θ *
          ((c.choose i : ℝ) * ((d + 1).descFactorial i : ℝ) * ((c + d - i).factorial : ℝ) *
            θ ^ (c + d)) := by
        apply Finset.sum_le_sum
        intro i _
        have : θ ^ (c + d - i) ≤ θ ^ (c + d) := pow_le_pow_right₀ hθ (by omega)
        gcongr
    _ = Real.sqrt Real.pi * Real.sqrt θ * θ ^ (c + d) * ∑ i ∈ Finset.range (c + 1),
          (c.choose i : ℝ) * ((d + 1).descFactorial i : ℝ) * ((c + d - i).factorial : ℝ) := by
        rw [Finset.mul_sum]
        apply Finset.sum_congr rfl
        intro i _
        ring
    _ ≤ _ := by gcongr; exact sum_coeff_le c d

/-- The bound of one normalised coefficient: `‖U_{c,d}(A)‖² ≤ 4θ m! (8θ²/‖A‖²)^m`, `m = c + d`. -/
theorem norm_Uext_sq_le (c d : ℕ) {A : ℂ} (hr : 0 < (A ^ 2).re) :
    ‖Uext c d A‖ ^ 2 ≤ 4 * (‖A‖ ^ 2 / (A ^ 2).re) * ((c + d).factorial : ℝ) *
      (8 * (‖A‖ ^ 2 / (A ^ 2).re) ^ 2 / ‖A‖ ^ 2) ^ (c + d) := by
  have ha := norm_pos_of_re_sq_pos hr
  have hθ : 1 ≤ ‖A‖ ^ 2 / (A ^ 2).re := by
    rw [le_div_iff₀ hr, one_mul]; exact re_sq_le_norm_sq A
  have hD := norm_Dcd_le c d hr
  set θ := ‖A‖ ^ 2 / (A ^ 2).re with hθdef
  set a := ‖A‖ with hadef
  have hθ0 : 0 ≤ θ := by linarith
  have hpi : 0 < Real.pi := Real.pi_pos
  have hfac : 0 < (c.factorial : ℝ) * d.factorial * Real.pi := by positivity
  -- `c! d! C(c+d,d) = (c+d)!`
  have hcf : (c.factorial : ℝ) * d.factorial * ((c + d).choose d : ℝ) = (c + d).factorial := by
    have := Nat.choose_mul_factorial_mul_factorial (n := c + d) (k := d) (by omega)
    rw [show c + d - d = c by omega] at this
    rw [← this]; push_cast; ring
  have hch : ((c + d).choose d : ℝ) ≤ 2 ^ (c + d) := by
    exact_mod_cast Nat.choose_le_two_pow (c + d) d
  have h4 : (4 : ℝ) ^ (d + 1) ≤ 4 * 4 ^ (c + d) := by
    rw [pow_succ, mul_comm]
    exact mul_le_mul_of_nonneg_left (pow_le_pow_right₀ (by norm_num) (by omega)) (by norm_num)
  have hU : ‖Uext c d A‖ = ‖Dcd c d A‖ / Real.sqrt ((c.factorial : ℝ) * d.factorial * Real.pi) := by
    unfold Uext
    rw [norm_div, Complex.norm_real, Real.norm_of_nonneg (Real.sqrt_nonneg _)]
  -- square the bound of `Dcd`
  have hD2 : (a ^ (c + d) * ‖Dcd c d A‖) ^ 2 ≤ (Real.sqrt Real.pi * Real.sqrt θ * θ ^ (c + d) *
      ((c.factorial : ℝ) * d.factorial * ((c + d).choose d : ℝ) * 2 ^ (d + 1))) ^ 2 :=
    pow_le_pow_left₀ (by positivity) hD 2
  have hsq : (Real.sqrt Real.pi * Real.sqrt θ * θ ^ (c + d) *
      ((c.factorial : ℝ) * d.factorial * ((c + d).choose d : ℝ) * 2 ^ (d + 1))) ^ 2 =
      ((c.factorial : ℝ) * d.factorial * Real.pi) *
        (θ * (θ ^ 2) ^ (c + d) * ((c + d).factorial : ℝ) * ((c + d).choose d : ℝ) *
          4 ^ (d + 1)) := by
    have h42 : (4 : ℝ) ^ (d + 1) = (2 ^ (d + 1)) ^ 2 := by
      rw [← pow_mul, show (4 : ℝ) = 2 ^ 2 by norm_num, ← pow_mul, mul_comm]
    rw [mul_pow, mul_pow, mul_pow, Real.sq_sqrt hpi.le, Real.sq_sqrt hθ0, ← hcf, h42]
    ring
  have hmain : a ^ (2 * (c + d)) * ‖Uext c d A‖ ^ 2 ≤
      θ * (θ ^ 2) ^ (c + d) * ((c + d).factorial : ℝ) * ((c + d).choose d : ℝ) * 4 ^ (d + 1) := by
    rw [hU, div_pow, Real.sq_sqrt hfac.le, pow_mul, ← mul_div_assoc, div_le_iff₀ hfac]
    calc (a ^ 2) ^ (c + d) * ‖Dcd c d A‖ ^ 2 = (a ^ (c + d) * ‖Dcd c d A‖) ^ 2 := by ring
      _ ≤ _ := hD2.trans (le_of_eq hsq)
      _ = _ := by ring
  have hmain2 : a ^ (2 * (c + d)) * ‖Uext c d A‖ ^ 2 ≤
      4 * θ * ((c + d).factorial : ℝ) * (8 * θ ^ 2) ^ (c + d) := by
    refine hmain.trans ?_
    calc θ * (θ ^ 2) ^ (c + d) * ((c + d).factorial : ℝ) * ((c + d).choose d : ℝ) * 4 ^ (d + 1)
        ≤ θ * (θ ^ 2) ^ (c + d) * ((c + d).factorial : ℝ) * 2 ^ (c + d) * (4 * 4 ^ (c + d)) := by
          gcongr
      _ = 4 * θ * ((c + d).factorial : ℝ) * (8 * θ ^ 2) ^ (c + d) := by
          rw [show (8 : ℝ) * θ ^ 2 = 2 * 4 * θ ^ 2 by norm_num, mul_pow, mul_pow]
          ring
  have hapos : 0 < a ^ (2 * (c + d)) := by positivity
  have hfin : ‖Uext c d A‖ ^ 2 ≤
      4 * θ * ((c + d).factorial : ℝ) * (8 * θ ^ 2) ^ (c + d) / a ^ (2 * (c + d)) := by
    rw [le_div_iff₀ hapos]
    linarith [hmain2, mul_comm (a ^ (2 * (c + d))) (‖Uext c d A‖ ^ 2)]
  calc ‖Uext c d A‖ ^ 2 ≤ _ := hfin
    _ = _ := by rw [div_pow, ← pow_mul]; ring

/-- **(E5) The large-`|A|` bound**: for `Re A² > 0` and `θ = ‖A‖²/Re A²`,
`Σ_{m ≤ D} Σ_{c ≤ m} ‖U_{c,m−c}(A)‖² ≤ 4θ Σ_{m ≤ D} (m+1) m! (8θ²/‖A‖²)^m`. -/
theorem sum_norm_Uext_sq_le {A : ℂ} (hr : 0 < (A ^ 2).re) (D : ℕ) :
    ∑ m ∈ Finset.range (D + 1), ∑ c ∈ Finset.range (m + 1), ‖Uext c (m - c) A‖ ^ 2 ≤
      4 * (‖A‖ ^ 2 / (A ^ 2).re) * ∑ m ∈ Finset.range (D + 1),
        ((m + 1) * m.factorial : ℝ) * (8 * (‖A‖ ^ 2 / (A ^ 2).re) ^ 2 / ‖A‖ ^ 2) ^ m := by
  rw [Finset.mul_sum]
  apply Finset.sum_le_sum
  intro m _
  calc ∑ c ∈ Finset.range (m + 1), ‖Uext c (m - c) A‖ ^ 2
      ≤ ∑ c ∈ Finset.range (m + 1), 4 * (‖A‖ ^ 2 / (A ^ 2).re) * (m.factorial : ℝ) *
          (8 * (‖A‖ ^ 2 / (A ^ 2).re) ^ 2 / ‖A‖ ^ 2) ^ m := by
        apply Finset.sum_le_sum
        intro c hc
        rw [Finset.mem_range] at hc
        have h := norm_Uext_sq_le c (m - c) hr
        rwa [show c + (m - c) = m by omega] at h
    _ = _ := by
        rw [Finset.sum_const, Finset.card_range, nsmul_eq_mul]
        push_cast
        ring

/-! ### The sharper per-pair bound (E5') -/

/-- `C(c+d−i, d) ≤ C(c+d, d) (c/(c+d))^i` for `i ≤ c`. -/
lemma choose_sub_le (c d : ℕ) {i : ℕ} (hi : i ≤ c) :
    ((c + d - i).choose d : ℝ) ≤ ((c + d).choose d : ℝ) * ((c : ℝ) / (c + d)) ^ i := by
  induction i with
  | zero => simp
  | succ i ih =>
    have ih' := ih (by omega)
    have hm : (0 : ℝ) < (c : ℝ) + d := by
      have : (0 : ℝ) < c := by exact_mod_cast (show 0 < c by omega)
      positivity
    -- `C(m−i−1, d) (m − i) = C(m−i, d) (c − i)`
    have hrat := Nat.choose_mul_succ_eq (c + d - (i + 1)) d
    rw [show c + d - (i + 1) + 1 = c + d - i by omega,
      show c + d - i - d = c - i by omega] at hrat
    have hrat' : ((c + d - (i + 1)).choose d : ℝ) * ((c : ℝ) + d - i) =
        ((c + d - i).choose d : ℝ) * ((c : ℝ) - i) := by
      have := congrArg (fun n : ℕ => (n : ℝ)) hrat
      push_cast [Nat.cast_sub (show i ≤ c + d by omega), Nat.cast_sub (show i ≤ c by omega)] at this
      linarith
    have hmi : (0 : ℝ) < (c : ℝ) + d - i := by
      have : (i : ℝ) < c := by exact_mod_cast (show i < c by omega)
      linarith
    have hfrac : ((c : ℝ) - i) / ((c : ℝ) + d - i) ≤ (c : ℝ) / (c + d) := by
      rw [div_le_div_iff₀ hmi hm]
      have : (0 : ℝ) ≤ (i : ℝ) * d := by positivity
      nlinarith
    have hC0 : (0 : ℝ) ≤ ((c + d - i).choose d : ℝ) := by positivity
    calc ((c + d - (i + 1)).choose d : ℝ)
        = ((c + d - i).choose d : ℝ) * (((c : ℝ) - i) / ((c : ℝ) + d - i)) := by
          field_simp; linarith
      _ ≤ ((c + d - i).choose d : ℝ) * ((c : ℝ) / (c + d)) :=
          mul_le_mul_of_nonneg_left hfrac hC0
      _ ≤ ((c + d).choose d : ℝ) * ((c : ℝ) / (c + d)) ^ i * ((c : ℝ) / (c + d)) :=
          mul_le_mul_of_nonneg_right ih' (by positivity)
      _ = _ := by ring

lemma sum_choose_pow_le (c d : ℕ) {x : ℝ} (hx : 0 ≤ x) :
    ∑ i ∈ Finset.range (c + 1), ((d + 1).choose i : ℝ) * x ^ i ≤ (1 + x) ^ (d + 1) := by
  have h : ∀ k, ∑ i ∈ Finset.range k, ((d + 1).choose i : ℝ) * x ^ i ≤ (1 + x) ^ (d + 1) := by
    intro k
    calc ∑ i ∈ Finset.range k, ((d + 1).choose i : ℝ) * x ^ i
        ≤ ∑ i ∈ Finset.range (k + (d + 2)), ((d + 1).choose i : ℝ) * x ^ i :=
          Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_subset_range.mpr (by omega))
            (fun _ _ _ => by positivity)
      _ = (1 + x) ^ (d + 1) := by
          rw [add_comm k, Finset.sum_range_add]
          have h0 : ∑ i ∈ Finset.range k, ((d + 1).choose (d + 2 + i) : ℝ) * x ^ (d + 2 + i) = 0 :=
            Finset.sum_eq_zero fun i _ => by rw [Nat.choose_eq_zero_of_lt (by omega)]; simp
          rw [h0, add_zero, add_comm 1 x, add_pow]
          apply Finset.sum_congr rfl
          intro i _
          ring
  exact h (c + 1)

/-- The sharper coefficient sum: `Σ_i C(c,i) (d+1)↓i (c+d−i)! θ^{c+d−i} ≤
θ^{c+d} c! d! C(c+d, d) (1 + c/(c+d))^{d+1}` for `θ ≥ 1`. -/
lemma sum_coeff_theta_le (c d : ℕ) {θ : ℝ} (hθ : 1 ≤ θ) :
    ∑ i ∈ Finset.range (c + 1), (c.choose i : ℝ) * ((d + 1).descFactorial i : ℝ) *
        ((c + d - i).factorial : ℝ) * θ ^ (c + d - i) ≤
      θ ^ (c + d) * ((c.factorial : ℝ) * d.factorial * ((c + d).choose d : ℝ) *
        (1 + (c : ℝ) / (c + d)) ^ (d + 1)) := by
  have hx : 0 ≤ (c : ℝ) / (c + d) := by positivity
  calc ∑ i ∈ Finset.range (c + 1), (c.choose i : ℝ) * ((d + 1).descFactorial i : ℝ) *
        ((c + d - i).factorial : ℝ) * θ ^ (c + d - i)
      ≤ ∑ i ∈ Finset.range (c + 1), θ ^ (c + d) * ((c.factorial : ℝ) * d.factorial *
          ((c + d).choose d : ℝ) * (((d + 1).choose i : ℝ) * ((c : ℝ) / (c + d)) ^ i)) := by
        apply Finset.sum_le_sum
        intro i hi
        rw [Finset.mem_range] at hi
        rw [coeff_factorial_eq c d i (by omega)]
        have h1 : θ ^ (c + d - i) ≤ θ ^ (c + d) := pow_le_pow_right₀ hθ (by omega)
        have h2 := choose_sub_le c d (i := i) (by omega)
        have h0 : (0 : ℝ) ≤ (c.factorial : ℝ) * d.factorial * ((d + 1).choose i : ℝ) := by
          positivity
        calc (c.factorial : ℝ) * d.factorial * ((c + d - i).choose d : ℝ) * ((d + 1).choose i : ℝ) *
              θ ^ (c + d - i)
            ≤ (c.factorial : ℝ) * d.factorial * (((c + d).choose d : ℝ) *
                ((c : ℝ) / (c + d)) ^ i) * ((d + 1).choose i : ℝ) * θ ^ (c + d) := by
              gcongr
          _ = _ := by ring
    _ = θ ^ (c + d) * ((c.factorial : ℝ) * d.factorial * ((c + d).choose d : ℝ) *
          ∑ i ∈ Finset.range (c + 1), ((d + 1).choose i : ℝ) * ((c : ℝ) / (c + d)) ^ i) := by
        rw [Finset.mul_sum, Finset.mul_sum]
    _ ≤ _ := by gcongr; exact sum_choose_pow_le c d hx

/-- **(E5') The sharper per-pair bound**: for `Re A² > 0`, `m = c + d`, `θ = ‖A‖²/Re A²`,
`‖U_{c,d}(A)‖ ≤ ‖A‖^{−m} θ^m √θ (m!/√(c! d!)) (1 + c/m)^{d+1}`. -/
theorem norm_Uext_le (c d : ℕ) {A : ℂ} (hr : 0 < (A ^ 2).re) :
    ‖Uext c d A‖ ≤ ‖A‖⁻¹ ^ (c + d) * (‖A‖ ^ 2 / (A ^ 2).re) ^ (c + d) *
      Real.sqrt (‖A‖ ^ 2 / (A ^ 2).re) *
      (((c + d).factorial : ℝ) / Real.sqrt ((c.factorial : ℝ) * d.factorial)) *
      (1 + (c : ℝ) / (c + d : ℕ)) ^ (d + 1) := by
  have ha := norm_pos_of_re_sq_pos hr
  have hθ : 1 ≤ ‖A‖ ^ 2 / (A ^ 2).re := by
    rw [le_div_iff₀ hr, one_mul]; exact re_sq_le_norm_sq A
  set θ := ‖A‖ ^ 2 / (A ^ 2).re with hθdef
  have hpi : 0 < Real.pi := Real.pi_pos
  have hcd : 0 < (c.factorial : ℝ) * d.factorial := by positivity
  -- the bound of `Dcd`
  have hD : ‖A‖ ^ (c + d) * ‖Dcd c d A‖ ≤ Real.sqrt Real.pi * Real.sqrt θ * (θ ^ (c + d) *
      ((c.factorial : ℝ) * d.factorial * ((c + d).choose d : ℝ) *
        (1 + (c : ℝ) / (c + d)) ^ (d + 1))) := by
    calc ‖A‖ ^ (c + d) * ‖Dcd c d A‖
        ≤ ∑ i ∈ Finset.range (c + 1), ‖A‖ ^ (c + d) * ‖term c d i A‖ := by
          rw [Dcd_eq_sum_term, ← Finset.mul_sum]
          exact mul_le_mul_of_nonneg_left (norm_sum_le _ _) (by positivity)
      _ ≤ ∑ i ∈ Finset.range (c + 1), Real.sqrt Real.pi * Real.sqrt θ *
            ((c.choose i : ℝ) * ((d + 1).descFactorial i : ℝ) * ((c + d - i).factorial : ℝ) *
              θ ^ (c + d - i)) :=
          Finset.sum_le_sum fun i _ => norm_term_le c d i hr
      _ = Real.sqrt Real.pi * Real.sqrt θ * ∑ i ∈ Finset.range (c + 1),
            (c.choose i : ℝ) * ((d + 1).descFactorial i : ℝ) * ((c + d - i).factorial : ℝ) *
              θ ^ (c + d - i) := by rw [Finset.mul_sum]
      _ ≤ _ := by gcongr; exact sum_coeff_theta_le c d hθ
  -- `c! d! C(c+d, d) = (c+d)!`
  have hcf : (c.factorial : ℝ) * d.factorial * ((c + d).choose d : ℝ) = (c + d).factorial := by
    have := Nat.choose_mul_factorial_mul_factorial (n := c + d) (k := d) (by omega)
    rw [show c + d - d = c by omega] at this
    rw [← this]; push_cast; ring
  have hU : ‖Uext c d A‖ = ‖Dcd c d A‖ / Real.sqrt ((c.factorial : ℝ) * d.factorial * Real.pi) := by
    unfold Uext
    rw [norm_div, Complex.norm_real, Real.norm_of_nonneg (Real.sqrt_nonneg _)]
  have hsq : Real.sqrt ((c.factorial : ℝ) * d.factorial * Real.pi) =
      Real.sqrt ((c.factorial : ℝ) * d.factorial) * Real.sqrt Real.pi :=
    Real.sqrt_mul hcd.le _
  have hs1 : 0 < Real.sqrt ((c.factorial : ℝ) * d.factorial) := Real.sqrt_pos.mpr hcd
  have hs2 : 0 < Real.sqrt Real.pi := Real.sqrt_pos.mpr hpi
  have hcast : ((c + d : ℕ) : ℝ) = (c : ℝ) + d := by push_cast; ring
  rw [hU, hsq, hcast, div_le_iff₀ (by positivity)]
  have hA : ‖A‖⁻¹ ^ (c + d) * ‖A‖ ^ (c + d) = 1 := by
    rw [← mul_pow, inv_mul_cancel₀ ha.ne', one_pow]
  have hfin : ‖Dcd c d A‖ = ‖A‖⁻¹ ^ (c + d) * (‖A‖ ^ (c + d) * ‖Dcd c d A‖) := by
    rw [← mul_assoc, hA, one_mul]
  rw [hfin]
  calc ‖A‖⁻¹ ^ (c + d) * (‖A‖ ^ (c + d) * ‖Dcd c d A‖)
      ≤ ‖A‖⁻¹ ^ (c + d) * (Real.sqrt Real.pi * Real.sqrt θ * (θ ^ (c + d) *
          ((c.factorial : ℝ) * d.factorial * ((c + d).choose d : ℝ) *
            (1 + (c : ℝ) / (c + d)) ^ (d + 1)))) :=
        mul_le_mul_of_nonneg_left hD (by positivity)
    _ = _ := by
        rw [← hcf]
        field_simp

/-! ### The explicit formula of the canonical coefficients (real shifts) -/

/-- On the real axis, `Φ_n` is the real integral of master's moment integrand. -/
lemma Phi_ofReal (n : ℕ) (x : ℝ) :
    Phi n (x : ℂ) =
      ((∫ t in (0:ℝ)..1, Grothe.UpperChaos.OriginalPositiveMoment.integrand n x t : ℝ) : ℂ) := by
  rw [Phi_eq, ← intervalIntegral.integral_ofReal]
  apply intervalIntegral.integral_congr
  intro t _
  simp only [wt, Grothe.UpperChaos.OriginalPositiveMoment.integrand]
  push_cast
  ring_nf

/-- `moment n x = (2/π) Φ_n(x)` for real `x`. -/
lemma moment_eq_Phi (n : ℕ) (x : ℝ) :
    ((Grothe.UpperChaos.OriginalPositiveMoment.moment n x : ℝ) : ℂ) =
      ((2 / Real.pi : ℝ) : ℂ) * Phi n (x : ℂ) := by
  rw [Phi_ofReal, Grothe.UpperChaos.OriginalPositiveMoment.moment]
  push_cast
  ring

lemma sqrt_norm_pos (c d : ℕ) : 0 < Real.sqrt ((c.factorial : ℝ) * d.factorial * Real.pi) :=
  Real.sqrt_pos.mpr (by positivity [Real.pi_pos])

/-- The zero row. -/
lemma canonicalCoefficient_zero_row_eq (A : ℝ) (d : ℕ) :
    Grothe.UpperChaos.F0ConditionalEvaluator.canonicalCoefficient A (0, d) =
      Uext 0 d (A : ℂ) := by
  rw [Grothe.UpperChaos.F0ConditionalSeed.canonicalCoefficient_zero_row]
  unfold Uext Dcd
  simp only [zero_add, Finset.range_one, Finset.sum_singleton, Nat.choose_zero_right,
    Nat.descFactorial_zero, Nat.cast_one, one_mul, Nat.sub_zero, mul_zero, Nat.factorial_zero]
  have hpi : 0 < Real.pi := Real.pi_pos
  have hsp : 0 < Real.sqrt Real.pi := Real.sqrt_pos.mpr hpi
  have hsd : 0 < Real.sqrt (d.factorial : ℝ) := Real.sqrt_pos.mpr (by positivity)
  have hs : Real.sqrt ((d.factorial : ℝ) * Real.pi) =
      Real.sqrt (d.factorial : ℝ) * Real.sqrt Real.pi := Real.sqrt_mul (by positivity) _
  have hpi2 : Real.pi = Real.sqrt Real.pi * Real.sqrt Real.pi := (Real.mul_self_sqrt hpi.le).symm
  have hm := moment_eq_Phi d (A ^ 2)
  push_cast at hm ⊢
  rw [hs, hm]
  push_cast
  have hspc : (Real.sqrt Real.pi : ℂ) ≠ 0 := by exact_mod_cast hsp.ne'
  have hsdc : (Real.sqrt (d.factorial : ℝ) : ℂ) ≠ 0 := by exact_mod_cast hsd.ne'
  have hpic : (Real.pi : ℂ) = (Real.sqrt Real.pi : ℂ) * (Real.sqrt Real.pi : ℂ) := by
    exact_mod_cast hpi2
  rw [hpic]
  field_simp
  ring

/-- **(E4) The explicit formula**: for every real `A ≠ 0`, `U_{c,d}(A) = Uext c d A`. -/
theorem canonicalCoefficient_eq_Uext (A : ℝ) (hA : A ≠ 0) (c d : ℕ) :
    Grothe.UpperChaos.F0ConditionalEvaluator.canonicalCoefficient A (c, d) =
      Uext c d (A : ℂ) := by
  induction c generalizing d with
  | zero => exact canonicalCoefficient_zero_row_eq A d
  | succ c ih =>
    rw [Grothe.UpperChaos.F0ConditionalEvaluator.canonicalCoefficient_forward A hA c d,
      ih (d + 1), ih d]
    have hAC : (A : ℂ) ≠ 0 := by exact_mod_cast hA
    set s := Real.sqrt ((c.factorial : ℝ) * d.factorial * Real.pi) with hs_def
    have hs : 0 < s := sqrt_norm_pos c d
    have hs1 : Real.sqrt (((c + 1).factorial : ℝ) * d.factorial * Real.pi) =
        Real.sqrt ((c + 1 : ℕ) : ℝ) * s := by
      rw [hs_def, ← Real.sqrt_mul (by positivity), Nat.factorial_succ]
      push_cast; ring_nf
    have hs2 : Real.sqrt ((c.factorial : ℝ) * (d + 1).factorial * Real.pi) =
        Real.sqrt ((d + 1 : ℕ) : ℝ) * s := by
      rw [hs_def, ← Real.sqrt_mul (by positivity), Nat.factorial_succ]
      push_cast; ring_nf
    have hc1 : 0 < Real.sqrt ((c + 1 : ℕ) : ℝ) := Real.sqrt_pos.mpr (by positivity)
    have hd1 : 0 < Real.sqrt ((d + 1 : ℕ) : ℝ) := Real.sqrt_pos.mpr (by positivity)
    unfold Uext
    rw [hs1, hs2, Complex.ofReal_mul, Complex.ofReal_mul]
    have hE := Dcd_charge c d (A : ℂ)
    have hsc : (s : ℂ) ≠ 0 := by exact_mod_cast hs.ne'
    have hc1c : (Real.sqrt ((c + 1 : ℕ) : ℝ) : ℂ) ≠ 0 := by exact_mod_cast hc1.ne'
    have hd1c : (Real.sqrt ((d + 1 : ℕ) : ℝ) : ℂ) ≠ 0 := by exact_mod_cast hd1.ne'
    generalize (Real.sqrt ((c + 1 : ℕ) : ℝ) : ℂ) = P at *
    generalize (Real.sqrt ((d + 1 : ℕ) : ℝ) : ℂ) = Q at *
    generalize (s : ℂ) = S at *
    generalize (A : ℂ) = B at *
    rw [div_eq_iff (mul_ne_zero hAC hc1c)]
    field_simp
    linear_combination (-1 : ℂ) * hE

end

end Grothe.UpperQuad.Explicit

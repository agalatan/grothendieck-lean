import Mathlib

/-!
# Joint quadratic constraints for spectral comparison

A moment budget and several overlapping quadratic budgets can be priced together before
bounding a linear comparison error. Nonnegative incidence weights include prefix budgets
and arbitrary subsets as special cases. The dual inequality is a sum of completed squares;
it requires no numerical optimization or sign assumptions on the primal variables.

The normed-space adapter states the essential small-error condition explicitly: a lower
bound on a center norm may be squared after subtraction only when the error is no larger
than that lower bound. No historical numerical enclosure or endpoint is assumed here.

Agent-ID: codex-c8a4. Refs #377.
-/

namespace Grothe.QuadraticDual

open Finset

/-- Completing a square bounds a linear term by a positive quadratic and an exact residual. -/
theorem linear_le_quadratic_add (a x c : ℝ) (hc : 0 < c) :
    a * x ≤ c * x ^ 2 + a ^ 2 / (4 * c) := by
  have h : a * x - c * x ^ 2 ≤ a ^ 2 / (4 * c) := by
    apply (le_div_iff₀ (by positivity : (0 : ℝ) < 4 * c)).2
    nlinarith [sq_nonneg (2 * c * x - a)]
  linarith

variable {ι κ : Type*} [Fintype ι] [Fintype κ]

/-- Price a common moment budget and all weighted quadratic constraints simultaneously.
The coefficients, centers, errors and tail variable may be arbitrary real numbers. -/
theorem quadratic_constraint_dual (a e ell : ι → ℝ) (b : κ → ι → ℝ)
    (ν B : κ → ℝ) (aTail t μ lam : ℝ) (hlam : 0 < lam)
    (hν : ∀ k, 0 ≤ ν k) (hb : ∀ k i, 0 ≤ b k i)
    (hconstraints : ∀ k, ∑ i, b k i * e i ^ 2 ≤ B k)
    (hmoment : t ^ 2 + ∑ i, (ell i - e i) ^ 2 ≤ μ) :
    ∑ i, a i * e i + aTail * t ≤
      lam * (μ - ∑ i, ell i ^ 2) + aTail ^ 2 / (4 * lam) + ∑ k, ν k * B k +
        ∑ i, (a i + 2 * lam * ell i) ^ 2 / (4 * (lam + ∑ k, ν k * b k i)) := by
  let M (i : ι) : ℝ := ∑ k, ν k * b k i
  have hM (i : ι) : 0 ≤ M i := sum_nonneg fun k _ ↦ mul_nonneg (hν k) (hb k i)
  have hweighted : ∑ i, M i * e i ^ 2 ≤ ∑ k, ν k * B k := by
    calc
      _ = ∑ k, ν k * ∑ i, b k i * e i ^ 2 := by
        simp_rw [M, sum_mul, mul_sum]
        rw [sum_comm]
        apply sum_congr rfl
        intro k _
        apply sum_congr rfl
        intro i _
        ring
      _ ≤ _ := sum_le_sum fun k _ ↦ mul_le_mul_of_nonneg_left (hconstraints k) (hν k)
  have hterm (i : ι) : a i * e i ≤
      lam * (ell i - e i) ^ 2 - lam * ell i ^ 2 + M i * e i ^ 2 +
        (a i + 2 * lam * ell i) ^ 2 / (4 * (lam + M i)) := by
    have h := linear_le_quadratic_add (a i + 2 * lam * ell i) (e i) (lam + M i)
      (add_pos_of_pos_of_nonneg hlam (hM i))
    nlinarith
  have hsum : ∑ i, a i * e i ≤
      lam * (∑ i, (ell i - e i) ^ 2) - lam * (∑ i, ell i ^ 2) +
        (∑ i, M i * e i ^ 2) +
        ∑ i, (a i + 2 * lam * ell i) ^ 2 / (4 * (lam + M i)) := by
    calc
      _ ≤ ∑ i, (lam * (ell i - e i) ^ 2 - lam * ell i ^ 2 + M i * e i ^ 2 +
          (a i + 2 * lam * ell i) ^ 2 / (4 * (lam + M i))) :=
        sum_le_sum fun i _ ↦ hterm i
      _ = _ := by simp only [sum_add_distrib, sum_sub_distrib, mul_sum]
  have htail := linear_le_quadratic_add aTail t lam hlam
  have hmoment' := mul_le_mul_of_nonneg_left hmoment hlam.le
  change ∑ i, a i * e i + aTail * t ≤
    lam * (μ - ∑ i, ell i ^ 2) + aTail ^ 2 / (4 * lam) + ∑ k, ν k * B k +
      ∑ i, (a i + 2 * lam * ell i) ^ 2 / (4 * (lam + M i))
  nlinarith

/-- Prefix constraints are the incidence-weight specialization of the joint dual. -/
theorem prefix_constraint_dual {n : ℕ} (a e ell ν B : Fin n → ℝ)
    (aTail t μ lam : ℝ) (hlam : 0 < lam) (hν : ∀ k, 0 ≤ ν k)
    (hconstraints : ∀ k, ∑ i ∈ univ.filter (fun i ↦ i ≤ k), e i ^ 2 ≤ B k)
    (hmoment : t ^ 2 + ∑ i, (ell i - e i) ^ 2 ≤ μ) :
    ∑ i, a i * e i + aTail * t ≤
      lam * (μ - ∑ i, ell i ^ 2) + aTail ^ 2 / (4 * lam) + ∑ k, ν k * B k +
        ∑ i, (a i + 2 * lam * ell i) ^ 2 /
          (4 * (lam + ∑ k ∈ univ.filter (fun k ↦ i ≤ k), ν k)) := by
  have h := quadratic_constraint_dual a e ell (fun k i ↦ if i ≤ k then 1 else 0)
    ν B aTail t μ lam hlam hν (by intros; split_ifs <;> norm_num)
    (by intro k; simpa [sum_filter] using hconstraints k) hmoment
  simpa [sum_filter, mul_ite] using h

variable {V : ι → Type*} [∀ i, NormedAddCommGroup (V i)]

/-- Reverse triangle inequalities give the moment constraint when the certified errors do not
exceed the lower center norms. This last condition makes squaring the lower bounds sound. -/
theorem moment_constraint_of_norm_bounds (y c : ∀ i, V i) (e ell : ι → ℝ) (t μ : ℝ)
    (hcenter : ∀ i, ell i ≤ ‖c i‖) (herror : ∀ i, ‖y i - c i‖ ≤ e i)
    (hsmall : ∀ i, e i ≤ ell i) (htotal : t ^ 2 + ∑ i, ‖y i‖ ^ 2 ≤ μ) :
    t ^ 2 + ∑ i, (ell i - e i) ^ 2 ≤ μ := by
  have hnorm (i : ι) : ell i - e i ≤ ‖y i‖ := by
    have h := (abs_le.mp (abs_norm_sub_norm_le (c i) (y i))).2
    rw [norm_sub_rev] at h
    linarith [hcenter i, herror i]
  exact (add_le_add le_rfl (sum_le_sum fun i _ ↦
    pow_le_pow_left₀ (sub_nonneg.mpr (hsmall i)) (hnorm i) 2)).trans htotal

/-- Joint comparison from total norm energy, center lower bounds, and overlapping error budgets. -/
theorem normed_quadratic_constraint_dual (y c : ∀ i, V i) (a e ell : ι → ℝ)
    (b : κ → ι → ℝ) (ν B : κ → ℝ) (aTail t μ lam : ℝ) (hlam : 0 < lam)
    (hν : ∀ k, 0 ≤ ν k) (hb : ∀ k i, 0 ≤ b k i)
    (hconstraints : ∀ k, ∑ i, b k i * e i ^ 2 ≤ B k)
    (hcenter : ∀ i, ell i ≤ ‖c i‖) (herror : ∀ i, ‖y i - c i‖ ≤ e i)
    (hsmall : ∀ i, e i ≤ ell i) (htotal : t ^ 2 + ∑ i, ‖y i‖ ^ 2 ≤ μ) :
    ∑ i, a i * e i + aTail * t ≤
      lam * (μ - ∑ i, ell i ^ 2) + aTail ^ 2 / (4 * lam) + ∑ k, ν k * B k +
        ∑ i, (a i + 2 * lam * ell i) ^ 2 / (4 * (lam + ∑ k, ν k * b k i)) :=
  quadratic_constraint_dual a e ell b ν B aTail t μ lam hlam hν hb hconstraints
    (moment_constraint_of_norm_bounds y c e ell t μ hcenter herror hsmall htotal)

/-- A joint budget improves the separate bounds `e ≤ 1/2` and `t ≤ 1`, whose sum is `3/2`. -/
theorem two_variable_joint_bound (e t : ℝ) (he : e ^ 2 ≤ 1 / 4)
    (hmoment : t ^ 2 + (1 - e) ^ 2 ≤ 1) : e + t ≤ 41 / 30 := by
  have h := quadratic_constraint_dual (ι := Unit) (κ := Unit)
    (fun _ ↦ 1) (fun _ ↦ e) (fun _ ↦ 1) (fun _ _ ↦ 1)
    (fun _ ↦ 8 / 5) (fun _ ↦ 1 / 4) 1 t 1 (3 / 5) (by norm_num)
    (by intros; norm_num) (by intros; norm_num)
    (by intro k; simpa using he) (by simpa using hmoment)
  norm_num at h ⊢
  exact h

end Grothe.QuadraticDual

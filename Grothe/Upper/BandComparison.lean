import Mathlib.Analysis.Normed.Group.Basic
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!+# Localized comparison of squared block norms

A finite kernel head only sees selected chaos blocks. Error pieces supported in
known bands pair with the norm of the comparison vector on those bands, rather
than its whole infinite tail. The quadratic error is charged once.
-/

namespace Grothe.Upper.BandComparison

open Finset

variable {ι κ : Type*} {V : ι → Type*} [∀ i, NormedAddCommGroup (V i)]

lemma norm_sq_difference (x y : V i) :
    |‖y‖ ^ 2 - ‖x‖ ^ 2| ≤ 2 * ‖x‖ * ‖y - x‖ + ‖y - x‖ ^ 2 := by
  have h := abs_norm_sub_norm_le y x
  have ht : ‖y‖ ≤ ‖x‖ + ‖y - x‖ := by
    simpa [sub_add_cancel, add_comm] using norm_add_le (y - x) x
  calc
    |‖y‖ ^ 2 - ‖x‖ ^ 2| = |‖y‖ - ‖x‖| * (‖y‖ + ‖x‖) := by
      rw [← abs_of_nonneg (add_nonneg (norm_nonneg y) (norm_nonneg x)), ← abs_mul]
      congr 1; ring
    _ ≤ ‖y - x‖ * (‖y‖ + ‖x‖) :=
      mul_le_mul_of_nonneg_right h (by positivity)
    _ ≤ 2 * ‖x‖ * ‖y - x‖ + ‖y - x‖ ^ 2 := by
      nlinarith [mul_nonneg (norm_nonneg (y - x)) (sub_nonneg.mpr ht)]

lemma band_cross (S : Finset ι) (x d : ∀ i, V i) {A e : ℝ}
    (hA : 0 ≤ A) (he : 0 ≤ e)
    (hx : ∑ i ∈ S, ‖x i‖ ^ 2 ≤ A ^ 2)
    (hd : ∑ i ∈ S, ‖d i‖ ^ 2 ≤ e ^ 2) :
    ∑ i ∈ S, ‖x i‖ * ‖d i‖ ≤ A * e := by
  have ha : √(∑ i ∈ S, ‖x i‖ ^ 2) ≤ A := (Real.sqrt_le_left hA).2 hx
  have hb : √(∑ i ∈ S, ‖d i‖ ^ 2) ≤ e := (Real.sqrt_le_left he).2 hd
  exact (Real.sum_mul_le_sqrt_mul_sqrt S (fun i => ‖x i‖) (fun i => ‖d i‖)).trans
    (mul_le_mul ha hb (Real.sqrt_nonneg _) hA)

/-- Only pairs of error pieces with overlapping supports contribute to the quadratic cost.
The overlap flag may be conservative: every pair it excludes must have disjoint support. -/
theorem quadratic_sum_le_overlap (S : Finset ι) (J : Finset κ)
    (d : κ → ∀ i, V i) (e : κ → ℝ) (overlap : κ → κ → Bool)
    (he : ∀ j ∈ J, 0 ≤ e j)
    (hd : ∀ j ∈ J, ∑ i ∈ S, ‖d j i‖ ^ 2 ≤ e j ^ 2)
    (hseparate : ∀ j ∈ J, ∀ k ∈ J, overlap j k = false →
      ∀ i ∈ S, d j i = 0 ∨ d k i = 0) :
    ∑ i ∈ S, ‖∑ j ∈ J, d j i‖ ^ 2 ≤
      ∑ j ∈ J, ∑ k ∈ J, if overlap j k then e j * e k else 0 := by
  have hpair : ∀ j ∈ J, ∀ k ∈ J,
      ∑ i ∈ S, ‖d j i‖ * ‖d k i‖ ≤
        if overlap j k then e j * e k else 0 := by
    intro j hj k hk
    cases h : overlap j k with
    | true =>
        simpa only [h, ite_true] using band_cross S (d j) (d k)
          (he j hj) (he k hk) (hd j hj) (hd k hk)
    | false =>
        simp only [Bool.false_eq_true, ite_false]
        apply le_of_eq
        apply sum_eq_zero
        intro i hi
        rcases hseparate j hj k hk h i hi with hz | hz <;> simp [hz]
  calc
    ∑ i ∈ S, ‖∑ j ∈ J, d j i‖ ^ 2 ≤ ∑ i ∈ S, (∑ j ∈ J, ‖d j i‖) ^ 2 :=
      sum_le_sum fun i _ => pow_le_pow_left₀ (norm_nonneg _) (norm_sum_le _ _) 2
    _ = ∑ j ∈ J, ∑ k ∈ J, ∑ i ∈ S, ‖d j i‖ * ‖d k i‖ := by
      simp_rw [pow_two, sum_mul, mul_sum]
      rw [sum_comm]
      apply sum_congr rfl
      intro j hj
      rw [sum_comm]
    _ ≤ _ := sum_le_sum fun j hj => sum_le_sum fun k hk => hpair j hj k hk

/-- Weighted comparison for a downstream kernel. The cross-term radius uses
squared coefficient costs, whereas the quadratic error is still paid once.
This preserves the same error decomposition and all overlapping supports. -/
theorem weighted_compare [DecidableEq ι] (S : Finset ι) (J : Finset κ)
    (w : ι → ℝ) (x y : ∀ i, V i) (d : κ → ∀ i, V i)
    (B : κ → Finset ι) (A e : κ → ℝ) (E : ℝ)
    (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ 1)
    (hdecomp : ∀ i ∈ S, y i - x i = ∑ j ∈ J, d j i)
    (hsupport : ∀ j ∈ J, ∀ i ∈ S, i ∉ B j → d j i = 0)
    (hA : ∀ j ∈ J, 0 ≤ A j) (he : ∀ j ∈ J, 0 ≤ e j)
    (hx : ∀ j ∈ J, ∑ i ∈ S ∩ B j, (w i * ‖x i‖) ^ 2 ≤ A j ^ 2)
    (hd : ∀ j ∈ J, ∑ i ∈ S ∩ B j, ‖d j i‖ ^ 2 ≤ e j ^ 2)
    (hquad : ∑ i ∈ S, ‖y i - x i‖ ^ 2 ≤ E) :
    ∑ i ∈ S, w i * |‖y i‖ ^ 2 - ‖x i‖ ^ 2|
      ≤ 2 * (∑ j ∈ J, A j * e j) + E := by
  classical
  have hc : ∑ i ∈ S, w i * ‖x i‖ * ‖y i - x i‖ ≤ ∑ j ∈ J, A j * e j := by
    calc
      _ ≤ ∑ i ∈ S, (w i * ‖x i‖) * ∑ j ∈ J, ‖d j i‖ := by
        refine sum_le_sum fun i hi => mul_le_mul_of_nonneg_left ?_
          (mul_nonneg (hw i hi).1 (norm_nonneg _))
        rw [hdecomp i hi]
        exact norm_sum_le _ _
      _ = ∑ j ∈ J, ∑ i ∈ S, (w i * ‖x i‖) * ‖d j i‖ := by
        simp_rw [mul_sum]; rw [sum_comm]
      _ ≤ ∑ j ∈ J, A j * e j := by
        refine sum_le_sum fun j hj => ?_
        have ha : √(∑ i ∈ S ∩ B j, (w i * ‖x i‖) ^ 2) ≤ A j :=
          (Real.sqrt_le_left (hA j hj)).2 (hx j hj)
        have hb : √(∑ i ∈ S ∩ B j, ‖d j i‖ ^ 2) ≤ e j :=
          (Real.sqrt_le_left (he j hj)).2 (hd j hj)
        have hcs := (Real.sum_mul_le_sqrt_mul_sqrt (S ∩ B j)
          (fun i => w i * ‖x i‖) (fun i => ‖d j i‖)).trans
          (mul_le_mul ha hb (Real.sqrt_nonneg _) (hA j hj))
        have eq : ∑ i ∈ S, (w i * ‖x i‖) * ‖d j i‖ =
            ∑ i ∈ S ∩ B j, (w i * ‖x i‖) * ‖d j i‖ := by
          symm
          exact sum_subset inter_subset_left fun i hi hni => by
            rw [hsupport j hj i hi (by simpa [hi] using hni), norm_zero, mul_zero]
        rwa [eq]
  calc
    _ ≤ ∑ i ∈ S, w i * (2 * ‖x i‖ * ‖y i - x i‖ + ‖y i - x i‖ ^ 2) :=
      sum_le_sum fun i hi => mul_le_mul_of_nonneg_left (norm_sq_difference _ _) (hw i hi).1
    _ = 2 * (∑ i ∈ S, w i * ‖x i‖ * ‖y i - x i‖) +
        ∑ i ∈ S, w i * ‖y i - x i‖ ^ 2 := by
      simp_rw [mul_add]; rw [sum_add_distrib, mul_sum]
      congr 1; apply sum_congr rfl; intro i _; ring
    _ ≤ 2 * (∑ j ∈ J, A j * e j) + ∑ i ∈ S, ‖y i - x i‖ ^ 2 := by
      refine add_le_add (mul_le_mul_of_nonneg_left hc (by norm_num)) ?_
      exact sum_le_sum fun i hi => mul_le_of_le_one_left (sq_nonneg _) (hw i hi).2
    _ ≤ _ := add_le_add le_rfl hquad

/-- The same selected blocks and the same error pieces are used throughout.
The band of each piece may overlap the other bands. -/
theorem compare [DecidableEq ι] (S : Finset ι) (J : Finset κ) (x y : ∀ i, V i)
    (d : κ → ∀ i, V i) (B : κ → Finset ι) (A e : κ → ℝ) (E : ℝ)
    (hdecomp : ∀ i ∈ S, y i - x i = ∑ j ∈ J, d j i)
    (hsupport : ∀ j ∈ J, ∀ i ∈ S, i ∉ B j → d j i = 0)
    (hA : ∀ j ∈ J, 0 ≤ A j) (he : ∀ j ∈ J, 0 ≤ e j)
    (hx : ∀ j ∈ J, ∑ i ∈ S ∩ B j, ‖x i‖ ^ 2 ≤ A j ^ 2)
    (hd : ∀ j ∈ J, ∑ i ∈ S ∩ B j, ‖d j i‖ ^ 2 ≤ e j ^ 2)
    (hquad : ∑ i ∈ S, ‖y i - x i‖ ^ 2 ≤ E) :
    ∑ i ∈ S, |‖y i‖ ^ 2 - ‖x i‖ ^ 2|
      ≤ 2 * (∑ j ∈ J, A j * e j) + E := by
  simpa only [one_mul] using weighted_compare S J (fun _ => 1) x y d B A e E
    (by simp) hdecomp hsupport hA he (by simpa only [one_mul] using hx) hd hquad

end Grothe.Upper.BandComparison

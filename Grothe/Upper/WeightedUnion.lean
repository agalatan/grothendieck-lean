import Grothe.Upper.BandComparison

/-! # Weighted comparison over a union of disjoint bands

A shared squared source norm can pay the linear comparison cost across several
bands at once. The separate center costs remain explicit.

Agent-ID: codex-239c -/

namespace Grothe.Upper.BandComparison

open Finset

variable {ι : Type*} {V : ι → Type*} [∀ i, NormedAddCommGroup (V i)]

/-- A shared square-sum bound on the source pays for all band weights at once.
The hypotheses are stated for actual components so that an orthogonal
projection theorem can provide the source bound without assigning the entire
source radius to each band separately. -/
theorem weighted_union_sub (S : Finset ι) (a t : ι → ℝ)
    (f c : ∀ i, V i) (A R : ℝ)
    (ha : ∀ i ∈ S, 0 ≤ a i) (hA : 0 ≤ A) (hR : 0 ≤ R)
    (ha_sq : ∑ i ∈ S, a i ^ 2 ≤ A ^ 2)
    (hf_sq : ∑ i ∈ S, ‖f i‖ ^ 2 ≤ R ^ 2)
    (hc : ∀ i ∈ S, ‖c i‖ ≤ t i) :
    ∑ i ∈ S, a i * ‖f i - c i‖ ≤ A * R + ∑ i ∈ S, a i * t i := by
  have hcs : ∑ i ∈ S, a i * ‖f i‖ ≤ A * R := by
    have ha' : √(∑ i ∈ S, a i ^ 2) ≤ A := (Real.sqrt_le_left hA).2 ha_sq
    have hf' : √(∑ i ∈ S, ‖f i‖ ^ 2) ≤ R := (Real.sqrt_le_left hR).2 hf_sq
    exact (Real.sum_mul_le_sqrt_mul_sqrt S a (fun i => ‖f i‖)).trans
      (mul_le_mul ha' hf' (Real.sqrt_nonneg _) hA)
  calc
    ∑ i ∈ S, a i * ‖f i - c i‖ ≤ ∑ i ∈ S, (a i * ‖f i‖ + a i * t i) := by
      apply sum_le_sum
      intro i hi
      calc
        a i * ‖f i - c i‖ ≤ a i * (‖f i‖ + t i) :=
          mul_le_mul_of_nonneg_left
            ((norm_sub_le _ _).trans (add_le_add le_rfl (hc i hi))) (ha i hi)
        _ = a i * ‖f i‖ + a i * t i := mul_add _ _ _
    _ = (∑ i ∈ S, a i * ‖f i‖) + ∑ i ∈ S, a i * t i := sum_add_distrib
    _ ≤ _ := add_le_add hcs le_rfl

/-- Once the weighted cross term is bounded, the entire quadratic error is
paid only once. This form admits a shared-source bound across several bands. -/
theorem weighted_compare_of_cross (S : Finset ι)
    (w : ι → ℝ) (x y : ∀ i, V i) (C E : ℝ)
    (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ 1)
    (hcross : ∑ i ∈ S, w i * ‖x i‖ * ‖y i - x i‖ ≤ C)
    (hquad : ∑ i ∈ S, ‖y i - x i‖ ^ 2 ≤ E) :
    ∑ i ∈ S, w i * |‖y i‖ ^ 2 - ‖x i‖ ^ 2| ≤ 2 * C + E := by
  calc
    _ ≤ ∑ i ∈ S, w i * (2 * ‖x i‖ * ‖y i - x i‖ + ‖y i - x i‖ ^ 2) :=
      sum_le_sum fun i hi => mul_le_mul_of_nonneg_left (norm_sq_difference _ _) (hw i hi).1
    _ = 2 * (∑ i ∈ S, w i * ‖x i‖ * ‖y i - x i‖) +
        ∑ i ∈ S, w i * ‖y i - x i‖ ^ 2 := by
      simp_rw [mul_add]; rw [sum_add_distrib, mul_sum]
      congr 1; apply sum_congr rfl; intro i _; ring
    _ ≤ 2 * C + ∑ i ∈ S, ‖y i - x i‖ ^ 2 := by
      refine add_le_add (mul_le_mul_of_nonneg_left hcross (by norm_num)) ?_
      exact sum_le_sum fun i hi => mul_le_of_le_one_left (sq_nonneg _) (hw i hi).2
    _ ≤ _ := add_le_add le_rfl hquad

end Grothe.Upper.BandComparison

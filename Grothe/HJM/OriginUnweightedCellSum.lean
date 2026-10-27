import Grothe.Upper.IntervalSound

/-!
# Exact certificate-list summation and compact-support transport

These general lemmas introduce no numerical certificate or native check.
-/

open MeasureTheory Set Finset

namespace Grothe.HJM.OriginUnweightedCellSum

/-- All entries up to the actual list length are summed in their original
order. The `getD` fallback is never reached in this range. -/
theorem sum_cast_getD_eq_list_sum (xs : List ℤ) :
    (∑ i ∈ range xs.length, (xs.getD i 0 : ℚ)) = (xs.sum : ℚ) := by
  induction xs with
  | nil => simp
  | cons a xs ih =>
    simp only [List.length_cons, Finset.sum_range_succ', List.getD_cons_zero,
      List.getD_cons_succ, List.sum_cons, Int.cast_add, ih]

/-- Finite endpoint lists on the 10⁻¹⁸ grid are summed exactly. -/
theorem sum_scaled_entries (xs : List ℤ) (N : ℕ) (hlen : xs.length = N) :
    (∑ i ∈ range N, ((xs.getD i 0 : ℚ) / 10 ^ 18)) =
      (xs.sum : ℚ) / 10 ^ 18 := by
  have h := sum_cast_getD_eq_list_sum xs
  rw [hlen] at h
  rw [← Finset.sum_div]
  exact congrArg (fun q : ℚ => q / 10 ^ 18) h

/-- A piecewise integrable compactly supported mean has the same [0,8]
and positive-half-line integrals. Support beyond eight is a premise that
will be established from the actual panel cover, not assumed for a response.
-/
theorem interval_eq_halfline_of_zero_tail {f : ℝ → ℝ}
    (hint : IntervalIntegrable f volume 0 8)
    (hzero : ∀ t ∈ Ioi (8 : ℝ), f t = 0) :
    (∫ t in (0 : ℝ)..8, f t) = ∫ t in Ioi (0 : ℝ), f t := by
  have hz : IntegrableOn (fun _ : ℝ => (0 : ℝ)) (Ioi (8 : ℝ)) volume :=
    integrableOn_zero
  have htail : IntegrableOn f (Ioi (8 : ℝ)) volume := by
    refine hz.congr_fun ?_ measurableSet_Ioi
    intro t ht
    exact (hzero t ht).symm
  have htailzero : (∫ t in Ioi (8 : ℝ), f t) = 0 :=
    setIntegral_eq_zero_of_forall_eq_zero hzero
  have hsplit := intervalIntegral.integral_interval_add_Ioi' hint htail
  simpa only [htailzero, add_zero] using hsplit

/-- The same compact-support hypotheses also give actual half-line
integrability, needed before combining signed real and imaginary moments. -/
theorem integrable_halfline_of_zero_tail {f : ℝ → ℝ}
    (hint : IntervalIntegrable f volume 0 8)
    (hzero : ∀ t ∈ Ioi (8 : ℝ), f t = 0) :
    IntegrableOn f (Ioi (0 : ℝ)) volume := by
  have hz : IntegrableOn (fun _ : ℝ => (0 : ℝ)) (Ioi (8 : ℝ)) volume :=
    integrableOn_zero
  have htail : IntegrableOn f (Ioi (8 : ℝ)) volume := by
    refine hz.congr_fun ?_ measurableSet_Ioi
    intro t ht
    exact (hzero t ht).symm
  have hfirst : IntegrableOn f (Ioc (0 : ℝ) 8) volume :=
    (intervalIntegrable_iff_integrableOn_Ioc_of_le (by norm_num)).1 hint
  have h := hfirst.union htail
  simpa only [Ioc_union_Ioi_eq_Ioi (show (0 : ℝ) ≤ 8 by norm_num)] using h

/-- The minimum of all four corner products is below every product in the
rectangle, even when either interval crosses zero. This is the existing
interval-arithmetic soundness theorem, specialized to its lower endpoint. -/
theorem min_four_products_le (a b c d x y : ℝ)
    (hax : a ≤ x) (hxb : x ≤ b) (hcy : c ≤ y) (hyd : y ≤ d) :
    min (min (a * c) (a * d)) (min (b * c) (b * d)) ≤ x * y :=
  (Grothe.Upper.mul_bounds ⟨hax, hxb⟩ ⟨hcy, hyd⟩).1

end Grothe.HJM.OriginUnweightedCellSum

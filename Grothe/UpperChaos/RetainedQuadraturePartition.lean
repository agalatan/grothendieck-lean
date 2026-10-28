import Grothe.UpperChaos.QuadraturePartition

/-! Exact assembly of a radial mesh with a separate auxiliary endpoint on
selected strips. Agent-ID: codex-2ca4. -/

open MeasureTheory

namespace Grothe.UpperChaos.QuadraturePartition
noncomputable section

/-- A common auxiliary interval may be split at arbitrary radial boundaries. -/
theorem rectangleIntegral_eq_sum_radial (f : ℝ → ℝ → ℂ)
    (hf : Continuous f.uncurry) (u v : ℝ) (a : ℕ → ℝ) (n : ℕ) :
    rectangleIntegral f u v (a 0) (a n) =
      ∑ k ∈ Finset.range n, rectangleIntegral f u v (a k) (a (k + 1)) := by
  have hs (x : ℝ) : (∫ s in a 0..a n, f x s) =
      ∑ k ∈ Finset.range n, ∫ s in a k..a (k + 1), f x s := by
    exact (intervalIntegral.sum_integral_adjacent_intervals
      (fun k _hk => (hf.uncurry_left x).intervalIntegrable (a k) (a (k + 1)))).symm
  unfold rectangleIntegral
  simp_rw [hs]
  apply intervalIntegral.integral_finsetSum
  intro k _hk
  exact (intervalIntegral.continuous_parametric_intervalIntegral_of_continuous'
    hf (a k) (a (k + 1))).intervalIntegrable u v

/-- Radial prefix subtraction is exactly one rectangular cell. -/
theorem rectangleIntegral_radial_prefix_sub (f : ℝ → ℝ → ℂ)
    (hf : Continuous f.uncurry) (u v c a b : ℝ) :
    rectangleIntegral f u v c b - rectangleIntegral f u v c a =
      rectangleIntegral f u v a b := by
  unfold rectangleIntegral
  have hFb := intervalIntegral.continuous_parametric_intervalIntegral_of_continuous' hf c b
  have hFa := intervalIntegral.continuous_parametric_intervalIntegral_of_continuous' hf c a
  rw [← intervalIntegral.integral_sub
    (hFb.intervalIntegrable u v) (hFa.intervalIntegrable u v)]
  apply intervalIntegral.integral_congr
  intro x _hx
  exact intervalIntegral.integral_interval_sub_left
    ((hf.uncurry_left x).intervalIntegrable c b)
    ((hf.uncurry_left x).intervalIntegrable c a)

/-- Removing the long auxiliary tail on selected radial strips is exactly
integration over the retained rectangles, not a subtraction of numerical
estimates for overlapping large domains. -/
theorem rectangleIntegral_sub_selected_eq_retained (f : ℝ → ℝ → ℂ)
    (hf : Continuous f.uncurry) (u v w : ℝ) (a : ℕ → ℝ) (n : ℕ)
    (selected : ℕ → Prop) [DecidablePred selected] :
    rectangleIntegral f u v (a 0) (a n) -
      (∑ k ∈ Finset.range n, if selected k then
        rectangleIntegral f u v (a k) (a (k + 1)) -
          rectangleIntegral f u w (a k) (a (k + 1)) else 0) =
      ∑ k ∈ Finset.range n,
        rectangleIntegral f u (if selected k then w else v) (a k) (a (k + 1)) := by
  rw [rectangleIntegral_eq_sum_radial f hf u v a n, ← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro k _hk
  by_cases hk : selected k <;> simp [hk]

end
end Grothe.UpperChaos.QuadraturePartition

import Mathlib.MeasureTheory.Integral.DominatedConvergence

/-!
# Exact assembly of a finite rectangle from numerical cells

Each auxiliary strip may use its own radial subdivision. Adjacent interval
identities account for the entire rectangle, and the error estimate sums the
individual cell radii. There is no sampling or unaccounted remainder between
cells. Continuity supplies every integrability requirement.

Agent-ID: codex-2ca4
-/

open MeasureTheory

namespace Grothe.UpperChaos.QuadraturePartition
noncomputable section

def rectangleIntegral (f : ℝ → ℝ → ℂ) (a b c d : ℝ) : ℂ :=
  ∫ u in a..b, ∫ s in c..d, f u s

/-- The complete auxiliary range is split at `0, 1, 2, 4, ..., 2^53`. -/
def dyadicAuxiliaryCut (k : ℕ) : ℝ := if k = 0 then 0 else 2 ^ (k - 1)

theorem dyadicAuxiliaryCut_zero : dyadicAuxiliaryCut 0 = 0 := by
  simp [dyadicAuxiliaryCut]

theorem dyadicAuxiliaryCut_succ (k : ℕ) : dyadicAuxiliaryCut (k + 1) = 2 ^ k := by
  simp [dyadicAuxiliaryCut]

theorem monotone_dyadicAuxiliaryCut : Monotone dyadicAuxiliaryCut := by
  apply monotone_nat_of_le_succ
  intro k
  cases k with
  | zero => norm_num [dyadicAuxiliaryCut]
  | succ k =>
      rw [dyadicAuxiliaryCut_succ, dyadicAuxiliaryCut_succ]
      exact pow_le_pow_right₀ (by norm_num : (1 : ℝ) ≤ 2) (Nat.le_succ k)

/-- A complete strip partition may have a different radial mesh in each strip. -/
theorem rectangleIntegral_eq_sum (f : ℝ → ℝ → ℂ)
    (hf : Continuous f.uncurry) (a : ℕ → ℝ) (m : ℕ)
    (b : ℕ → ℕ → ℝ) (n : ℕ → ℕ) (c d : ℝ)
    (hleft : ∀ i < m, b i 0 = c) (hright : ∀ i < m, b i (n i) = d) :
    rectangleIntegral f (a 0) (a m) c d =
      ∑ i ∈ Finset.range m, ∑ k ∈ Finset.range (n i),
        rectangleIntegral f (a i) (a (i + 1)) (b i k) (b i (k + 1)) := by
  have hF : Continuous (fun u => ∫ s in c..d, f u s) :=
    intervalIntegral.continuous_parametric_intervalIntegral_of_continuous' hf c d
  unfold rectangleIntegral
  rw [← intervalIntegral.sum_integral_adjacent_intervals
    (a := a) (n := m) (fun i _hi => hF.intervalIntegrable (a i) (a (i + 1)))]
  apply Finset.sum_congr rfl
  intro i hi
  have him : i < m := Finset.mem_range.mp hi
  have hs (u : ℝ) : (∫ s in c..d, f u s) =
      ∑ k ∈ Finset.range (n i), ∫ s in b i k..b i (k + 1), f u s := by
    rw [← hleft i him, ← hright i him]
    exact (intervalIntegral.sum_integral_adjacent_intervals
      (fun k _hk => (hf.uncurry_left u).intervalIntegrable (b i k) (b i (k + 1)))).symm
  simp_rw [hs]
  apply intervalIntegral.integral_finsetSum
  intro k _hk
  exact (intervalIntegral.continuous_parametric_intervalIntegral_of_continuous'
    hf (b i k) (b i (k + 1))).intervalIntegrable (a i) (a (i + 1))

/-- The production rectangle is covered by all dyadic strips, with arbitrary
complete radial subdivisions inside each strip. -/
theorem rectangleIntegral_dyadic_eq_sum (f : ℝ → ℝ → ℂ)
    (hf : Continuous f.uncurry) (b : ℕ → ℕ → ℝ) (n : ℕ → ℕ)
    (hleft : ∀ i < 54, b i 0 = 0) (hright : ∀ i < 54, b i (n i) = 80) :
    rectangleIntegral f 0 (2 ^ 53) 0 80 =
      ∑ i ∈ Finset.range 54, ∑ k ∈ Finset.range (n i),
        rectangleIntegral f (dyadicAuxiliaryCut i) (dyadicAuxiliaryCut (i + 1))
          (b i k) (b i (k + 1)) := by
  have hend : dyadicAuxiliaryCut 54 = (2 : ℝ) ^ 53 := by
    simpa using dyadicAuxiliaryCut_succ 53
  simpa only [dyadicAuxiliaryCut_zero, hend] using
    rectangleIntegral_eq_sum f hf dyadicAuxiliaryCut 54 b n 0 80 hleft hright

/-- Certified cell errors add to a rigorous error for the whole rectangle. -/
theorem norm_rectangleIntegral_sub_sum_le (f : ℝ → ℝ → ℂ)
    (hf : Continuous f.uncurry) (a : ℕ → ℝ) (m : ℕ)
    (b : ℕ → ℕ → ℝ) (n : ℕ → ℕ) (c d : ℝ)
    (hleft : ∀ i < m, b i 0 = c) (hright : ∀ i < m, b i (n i) = d)
    (center : ℕ → ℕ → ℂ) (radius : ℕ → ℕ → ℝ)
    (hcell : ∀ i < m, ∀ k < n i,
      ‖rectangleIntegral f (a i) (a (i + 1)) (b i k) (b i (k + 1)) -
        center i k‖ ≤ radius i k) :
    ‖rectangleIntegral f (a 0) (a m) c d -
      ∑ i ∈ Finset.range m, ∑ k ∈ Finset.range (n i), center i k‖ ≤
      ∑ i ∈ Finset.range m, ∑ k ∈ Finset.range (n i), radius i k := by
  rw [rectangleIntegral_eq_sum f hf a m b n c d hleft hright,
    ← Finset.sum_sub_distrib]
  simp_rw [← Finset.sum_sub_distrib]
  apply (norm_sum_le _ _).trans
  apply Finset.sum_le_sum
  intro i hi
  apply (norm_sum_le _ _).trans
  apply Finset.sum_le_sum
  intro k hk
  exact hcell i (Finset.mem_range.mp hi) k (Finset.mem_range.mp hk)

end
end Grothe.UpperChaos.QuadraturePartition

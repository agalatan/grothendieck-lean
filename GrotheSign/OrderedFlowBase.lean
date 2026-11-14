import GrotheSign.OrderedFlow

/-!
# The constant and linear parts of the ordered inverse flow

At positive weight the empty label set contributes zero. A singleton contributes exactly the
diagonal generator term; the coefficient product formula avoids a separate enumeration of its
finitely supported assignments.

Agent-ID: codex-1a87. Refs #365.
-/

namespace GrotheSign

open Finset PowerSeries

/-- The empty ordered label set has no positive-weight contribution. -/
theorem orderedFlowTerm_zero (k : ℕ) (hk : 0 < k) (L : ℕ → ℝ) (P : PowerSeries ℝ) :
    orderedFlowTerm k 0 L P = 0 := by
  simp [orderedFlowTerm, hk.ne']

/-- The singleton contribution is the exact diagonal term of the inverse flow. -/
theorem orderedFlowTerm_one (k : ℕ) (L : ℕ → ℝ) (hL : L 0 = 0) (P : PowerSeries ℝ) :
    orderedFlowTerm k 1 L P = -L k * coeff k P := by
  simp only [orderedFlowTerm, Nat.factorial_one, Nat.cast_one, div_one, one_mul,
    Finset.range_one]
  calc
    _ = ∑ j ∈ finsuppAntidiag ({0} : Finset ℕ) k,
        -L k * ∏ a ∈ ({0} : Finset ℕ), coeff (j a) P := by
      apply Finset.sum_congr rfl
      intro j hj
      have hj0 : j 0 = k := by simpa using (Finset.mem_finsuppAntidiag.mp hj).1
      rw [labeledFlowCoefficient_singleton 0 j L hL, hj0]
    _ = -L k * ∑ j ∈ finsuppAntidiag ({0} : Finset ℕ) k,
        ∏ a ∈ ({0} : Finset ℕ), coeff (j a) P := by rw [Finset.mul_sum]
    _ = -L k * coeff k P := by
      congr 1
      symm
      simpa only [Finset.prod_singleton] using
        (PowerSeries.coeff_prod (fun _ : ℕ ↦ P) k ({0} : Finset ℕ))

/-- The whole positive-weight flow is its diagonal term plus the nonlinear ordered terms. -/
theorem orderedFlow_eq_diagonal_add (k : ℕ) (hk : 0 < k) (L : ℕ → ℝ)
    (hL : L 0 = 0) (P : PowerSeries ℝ) :
    orderedFlow k L P = -L k * coeff k P +
      ∑ m ∈ range (k - 1), orderedFlowTerm k (2 + m) L P := by
  have hs := Finset.sum_range_add (fun m ↦ orderedFlowTerm k m L P) 2 (k - 1)
  rw [show 2 + (k - 1) = k + 1 by omega] at hs
  rw [orderedFlow, hs]
  simp only [Finset.sum_range_succ, Finset.sum_range_zero, zero_add,
    orderedFlowTerm_zero k hk L P, orderedFlowTerm_one k L hL P]

end GrotheSign

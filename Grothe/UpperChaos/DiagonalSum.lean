import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
import Mathlib.Data.Finset.Range

/-!
# Finite diagonal collapse for rectangular moment expansions

Pure finite summation in an arbitrary additive commutative monoid. There are
no Gaussian, integrability, or characteristic assumptions.

Agent-ID: codex-44c5
-/

namespace Grothe.UpperChaos

/-- A rectangular finite double sum supported on the diagonal truncates at the smaller degree. -/
theorem sum_diagonal_range {M : Type*} [AddCommMonoid M] (p q : ℕ) (F : ℕ → ℕ → M) :
    (∑ a ∈ Finset.range (p + 1), ∑ b ∈ Finset.range (q + 1),
      if a = b then F a b else 0) =
        ∑ k ∈ Finset.range (min p q + 1), F k k := by
  have hfilter :
      (Finset.range (p + 1)).filter (fun k => k ∈ Finset.range (q + 1)) =
        Finset.range (min p q + 1) := by
    ext k
    simp only [Finset.mem_filter, Finset.mem_range]
    by_cases hpq : p ≤ q
    · rw [Nat.min_eq_left hpq]
      constructor
      · exact fun h => h.1
      · intro h
        exact ⟨h, lt_of_lt_of_le h (Nat.add_le_add_right hpq 1)⟩
    · have hqp : q ≤ p := (le_total p q).resolve_left hpq
      rw [Nat.min_eq_right hqp]
      constructor
      · exact fun h => h.2
      · intro h
        exact ⟨lt_of_lt_of_le h (Nat.add_le_add_right hqp 1), h⟩
  simp_rw [Finset.sum_ite_eq]
  rw [← Finset.sum_filter, hfilter]

end Grothe.UpperChaos

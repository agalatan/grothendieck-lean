import Grothe.UpperChaos.ConditionalCheckpointVector

/-!
Exact common-grid squared-sum transport.
Exact integer sums on a common grid can be checked in separate bounded blocks.
The bridge below transports their aggregate to the rational squared budget;
it never introduces a square root or approximates individual coefficients.
Agent-ID: codex-aa04. Refs #293, #21.
-/

open scoped BigOperators

namespace Grothe.UpperChaos.ConditionalIntegerErrorSum

/-- Common-grid squared sums reduce to a single integer sum and denominator. -/
theorem sum_sq_div_eq {ι : Type*} (s : Finset ι) (n : ι → ℤ) (D : ℚ) :
    (∑ i ∈ s, ((n i : ℚ) / D) ^ 2) =
      ((∑ i ∈ s, n i ^ 2 : ℤ) : ℚ) / D ^ 2 := by
  simp only [div_pow, Int.cast_sum, Int.cast_pow, Finset.sum_div]

/-- A cross-multiplied integer check proves the exact rational radius.
The denominator hypotheses refer to grid/radius denominators, not data accuracy. -/
theorem sum_sq_div_le_of_integer_check {ι : Type*} (s : Finset ι) (n : ι → ℤ)
    (D E B : ℕ) (hD : 0 < D) (hB : 0 < B)
    (hcheck : (∑ i ∈ s, n i ^ 2) * (B : ℤ) ^ 2 ≤
      (E : ℤ) ^ 2 * (D : ℤ) ^ 2) :
    (∑ i ∈ s, ((n i : ℚ) / (D : ℚ)) ^ 2) ≤ ((E : ℚ) / (B : ℚ)) ^ 2 := by
  rw [sum_sq_div_eq, div_pow]
  have hDq : (0 : ℚ) < D := by exact_mod_cast hD
  have hBq : (0 : ℚ) < B := by exact_mod_cast hB
  apply (div_le_div_iff₀ (sq_pos_of_pos hDq) (sq_pos_of_pos hBq)).2
  exact_mod_cast hcheck

/-- A separately proved aggregate equality lets the numerical guard mention
one integer literal, rather than reevaluating all coefficient entries. -/
theorem sum_sq_div_le_of_total {ι : Type*} (s : Finset ι) (n : ι → ℤ)
    (total : ℤ) (D E B : ℕ) (hD : 0 < D) (hB : 0 < B)
    (htotal : (∑ i ∈ s, n i ^ 2) = total)
    (hcheck : total * (B : ℤ) ^ 2 ≤ (E : ℤ) ^ 2 * (D : ℤ) ^ 2) :
    (∑ i ∈ s, ((n i : ℚ) / (D : ℚ)) ^ 2) ≤ ((E : ℚ) / (B : ℚ)) ^ 2 := by
  apply sum_sq_div_le_of_integer_check s n D E B hD hB
  rw [htotal]
  exact hcheck

/-- Exact signed residual identity on the product grid. Scalar uncertainty
is deliberately absent here: it belongs to the once-only vector estimate. -/
theorem scaled_center_error_eq (a u v : ℤ) (S D : ℚ) :
    ((a : ℚ) / S) * ((u : ℚ) / D) - ((v : ℚ) / (S * D)) =
      ((a * u - v : ℤ) : ℚ) / (S * D) := by
  rw [div_mul_div_comm, ← sub_div, Int.cast_sub, Int.cast_mul]

end Grothe.UpperChaos.ConditionalIntegerErrorSum

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[
      ``Grothe.UpperChaos.ConditionalIntegerErrorSum.sum_sq_div_le_of_integer_check,
      ``Grothe.UpperChaos.ConditionalIntegerErrorSum.sum_sq_div_le_of_total,
      ``Grothe.UpperChaos.ConditionalIntegerErrorSum.scaled_center_error_eq] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"unexpected axiom {dependency}"

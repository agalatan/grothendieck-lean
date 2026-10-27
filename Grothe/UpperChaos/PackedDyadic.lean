import Mathlib.Data.Int.Basic
import Mathlib.Data.String.Defs
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Rat.Cast.Defs

/-!
# Packed dyadic coefficients and their exact energy

A record `m:e` denotes the rational coefficient `m / 2^e`. At a fixed
denominator exponent `E`, decoding returns the integer `m * 2^(E-e)`.
The decoder rejects invalid integers, exponents above `E`, and mantissas
whose absolute value is at least `2^53`.

Rows contain comma-separated records. An empty string encodes an empty row;
every nonempty record must parse successfully. Expected row lengths and
source ordering are checked separately by the finite certificate.
The energy is computed by summing integer squares before dividing once
by the square of the common denominator.

Agent-ID: codex-2ca4
-/

namespace Grothe.UpperChaos.PackedDyadic

/-- Decode one dyadic record into an integer at the common scale `2^E`. -/
def parseRecord (E : ℕ) (record : String) : Option ℤ :=
  match record.splitOn ":" with
  | [mantissaText, exponentText] => do
      let mantissa ← mantissaText.toInt?
      let exponent ← exponentText.toNat?
      if exponent ≤ E ∧ mantissa.natAbs < 2 ^ 53 then
        some (mantissa * (2 : ℤ) ^ (E - exponent))
      else
        none
  | _ => none

/-- Decode a complete comma-separated row, rejecting it if any record fails. -/
def parse (E : ℕ) (row : String) : Option (Array ℤ) :=
  if row == "" then
    some #[]
  else
    ((row.splitOn ",").mapM (parseRecord E)).map List.toArray

/-- The rational coefficient at a flat index, extended by zero beyond the array. -/
def coeff (E : ℕ) (a : Array ℤ) (k : ℕ) : ℚ :=
  (a[k]?.getD 0 : ℚ) / (2 : ℚ) ^ E

/-- Sum the squares at integer scale, without repeated rational reduction. -/
def sumSquares (a : Array ℤ) : ℤ :=
  ∑ k ∈ Finset.range a.size, a[k]?.getD 0 ^ 2

/-- Exact rational energy at the common denominator `2^E`. -/
def energy (E : ℕ) (a : Array ℤ) : ℚ :=
  (sumSquares a : ℚ) / (2 : ℚ) ^ (2 * E)

/-- A finite sum of squares with a common denominator reduces to one integer sum. -/
theorem sum_div_sq {ι : Type*} (s : Finset ι) (a : ι → ℤ) (d : ℚ) :
    (∑ i ∈ s, ((a i : ℚ) / d) ^ 2) =
      ((∑ i ∈ s, a i ^ 2 : ℤ) : ℚ) / d ^ 2 := by
  simp_rw [div_pow]
  simp only [div_eq_mul_inv, ← Finset.sum_mul, Int.cast_sum, Int.cast_pow]

/-- The integer energy equals the sum of squares of the decoded rational coefficients. -/
theorem sum_coeff_sq (E : ℕ) (a : Array ℤ) :
    (∑ k ∈ Finset.range a.size, coeff E a k ^ 2) = energy E a := by
  simp only [coeff]
  rw [sum_div_sq]
  simp only [energy, sumSquares, ← pow_mul, Nat.mul_comm E 2]

end Grothe.UpperChaos.PackedDyadic

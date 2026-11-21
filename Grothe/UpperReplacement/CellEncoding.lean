import Lean.Elab.Tactic.Decide

/-!
# Exact compact encoding of the two dyadic response tables

Agent-ID: codex-a7c4.

Each complex entry consists of two signed 27-bit integers, offset by `2^26` and encoded
as nine base-64 digits. Rows are independent, so a checker need not expand the full table.
Decoding is ordinary total Lean code. Malformed bytes decode to zero digits; disk membership
is still enforced by `clippedCell` when the decoded table is used as a response.
-/

namespace Grothe.UpperReplacement.CellEncoding

def digit (b : UInt8) : Nat :=
  let n := b.toNat
  if 65 ≤ n ∧ n ≤ 90 then n - 65
  else if 97 ≤ n ∧ n ≤ 122 then n - 97 + 26
  else if 48 ≤ n ∧ n ≤ 57 then n - 48 + 52
  else if n = 43 then 62
  else if n = 47 then 63
  else 0

def word (row : ByteArray) (k : Nat) : Nat :=
  (List.range 9).foldl (fun v j ↦ 64 * v + digit (row[9 * k + j]?.getD 0)) 0

def entry (row : ByteArray) (k : Nat) : Int × Int :=
  let v := word row k
  (((v / 2 ^ 27 : Nat) : Int) - 2 ^ 26, ((v % 2 ^ 27 : Nat) : Int) - 2 ^ 26)

def decodeRow (row : String) : Array (Int × Int) :=
  let bytes := row.toByteArray
  (Array.range (bytes.size / 9)).map (entry bytes)

def decode (rows : Array String) : Array (Int × Int) := rows.flatMap decodeRow

/-- Small exact checks exercise zero, both signs, and the largest positive coordinate. -/
theorem examples_checked :
    entry "gAAAEAAAA".toByteArray 0 = (0, 0) ∧
    entry "f////////".toByteArray 0 = (-1, 67108863) ∧
    entry "AAAAAAAAA".toByteArray 0 = (-67108864, -67108864) := by
  decide +kernel

end Grothe.UpperReplacement.CellEncoding

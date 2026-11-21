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

def digitTable : ByteArray :=
  ByteArray.mk <| Array.ofFn fun i : Fin 256 ↦ (digit i.val.toUInt8).toUInt8

theorem digitTable_size : digitTable.size = 256 := by
  simp [digitTable, ByteArray.size, Array.size_ofFn]

def digitFast (b : UInt8) : Nat :=
  (digitTable[b.toNat]'(by rw [digitTable_size]; exact b.toNat_lt)).toNat

def wordFastAt (row : ByteArray) (base : Nat) (h : base + 8 < row.size) : Nat :=
  let d0 := digitFast (row[base]'(by omega))
  let d1 := digitFast (row[base + 1]'(by omega))
  let d2 := digitFast (row[base + 2]'(by omega))
  let d3 := digitFast (row[base + 3]'(by omega))
  let d4 := digitFast (row[base + 4]'(by omega))
  let d5 := digitFast (row[base + 5]'(by omega))
  let d6 := digitFast (row[base + 6]'(by omega))
  let d7 := digitFast (row[base + 7]'(by omega))
  let d8 := digitFast (row[base + 8]'h)
  ((((((((d0 * 64 + d1) * 64 + d2) * 64 + d3) * 64 + d4) * 64 + d5) * 64 + d6) * 64 + d7) * 64 + d8)

def decodeRowClippedAux (bytes : ByteArray) (scale2 : Int) (n : Nat) :
    Nat → Array Int → Array Int → Array Int × Array Int
  | 0, re, im => (re, im)
  | rem + 1, re, im =>
    let k := n - (rem + 1)
    if h : 9 * k + 8 < bytes.size then
      let v := wordFastAt bytes (9 * k) h
      let a : Int := ((v / 134217728 : Nat) : Int) - 67108864
      let b : Int := ((v % 134217728 : Nat) : Int) - 67108864
      if a * a + b * b ≤ scale2 then
        decodeRowClippedAux bytes scale2 n rem (re.push a) (im.push b)
      else
        decodeRowClippedAux bytes scale2 n rem (re.push 0) (im.push 0)
    else (re, im)

def decodeRowsClippedAux (rows : Array String) (scale2 : Int) :
    Nat → Array Int → Array Int → Array Int × Array Int
  | 0, re, im => (re, im)
  | rem + 1, re, im =>
    let r := rows.size - (rem + 1)
    if h : r < rows.size then
      let bytes := rows[r].toByteArray
      let n := bytes.size / 9
      let p := decodeRowClippedAux bytes scale2 n n re im
      decodeRowsClippedAux rows scale2 rem p.1 p.2
    else (re, im)

/-- Decode and disk-clip all rows directly into flat real and imaginary integer arrays. -/
def decodeClipped (rows : Array String) (scale : Nat) : Array Int × Array Int :=
  decodeRowsClippedAux rows ((scale : Int) * scale) rows.size
    (Array.mkEmpty 1048576) (Array.mkEmpty 1048576)

end Grothe.UpperReplacement.CellEncoding

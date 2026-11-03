import Mathlib.Data.Rat.Defs

set_option warningAsError true

/-! Exact rational semantics for finite IEEE binary64 source words.
No machine floating-point operation is used. Agent-ID: codex-7c2e. -/
namespace Grothe.UpperChaos.Binary64Center

/-- The unsigned exponent field (biased by 1023). -/
def exponent (word : ℕ) : ℕ := word / 2^52 % 2048

def fraction (word : ℕ) : ℕ := word % 2^52

/-- The magnitude is an exact dyadic rational, including subnormal values. -/
def magnitude (word : ℕ) : ℚ :=
  let e := exponent word
  let f := fraction word
  if e = 0 then (f : ℚ) / 2^1074
  else if 1075 ≤ e then ((2^52 + f : ℕ) : ℚ) * 2^(e - 1075)
  else ((2^52 + f : ℕ) : ℚ) / 2^(1075 - e)

/-- Reject non-finite values and words exceeding 64 bits. Signed zeros both
have the exact rational value zero. -/
def decode (word : ℕ) : Option ℚ :=
  if word < 2^64 ∧ exponent word < 2047 then
    some (if word / 2^63 = 0 then magnitude word else -magnitude word)
  else none

end Grothe.UpperChaos.Binary64Center

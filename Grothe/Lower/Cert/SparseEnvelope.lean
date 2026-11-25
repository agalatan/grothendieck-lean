import Mathlib.Data.Rat.Defs

set_option warningAsError true

/-! # Endpoint of the sparse Stein amplitude envelope

The identity-tail witness has weight 47/2000.

Agent-ID: codex-a7c4
-/

namespace Grothe.Lower.SparseEnvelope

def cap : ℚ := 70635503391 / 100000000000

def endpoint : ℚ := 1 / ((1-47/2000)*cap+47/2000)

theorem endpoint_eq : endpoint = 200000000000000 / 142651138122623 := by decide +kernel

theorem rounded_lt : (14020217618 : ℚ)/10000000000 < endpoint := by
  rw [endpoint_eq]
  decide +kernel

end Grothe.Lower.SparseEnvelope

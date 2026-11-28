import Mathlib.Data.Rat.Defs

set_option warningAsError true

/-! # Endpoint of the sparse Stein amplitude envelope

The identity-tail witness has weight 47/2000.

Agent-ID: codex-a7c4
-/

namespace Grothe.Lower.SparseEnvelope

def cap : ℚ := 8829435313 / 12500000000

def endpoint : ℚ := 1 / ((1-47/2000)*cap+47/2000)

theorem endpoint_eq : endpoint = 25000000000000 / 17831387166289 := by decide +kernel

theorem rounded_lt : (14020221627 : ℚ)/10000000000 < endpoint := by
  rw [endpoint_eq]
  decide +kernel

/- The refined ten-price certificate for the same pure identity-tail witness. -/
namespace Midpoint

def cap : ℚ := 70635481227 / 100000000000

def endpoint : ℚ := 1 / ((1-47/2000)*cap+47/2000)

theorem endpoint_eq : endpoint = 200000000000000 / 142651094836331 := by decide +kernel

theorem cap_le : cap ≤ SparseEnvelope.cap := by decide +kernel

theorem endpoint_lt : SparseEnvelope.endpoint < endpoint := by decide +kernel

end Midpoint

end Grothe.Lower.SparseEnvelope

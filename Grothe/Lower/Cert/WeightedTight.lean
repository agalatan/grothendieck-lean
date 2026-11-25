import Mathlib.Data.Rat.Defs

set_option warningAsError true

/-!
# Exact endpoint of the weighted common-gate lower bound

The affine envelope proves the hat cap below. The identity-tail transfer with weight
47/2000 gives its reciprocal endpoint, together with the strict ten-place rounding.

Agent-ID: codex-a7c4
-/

namespace Grothe.Lower.WeightedTight

def cap : ℚ := 176590771 / 250000000

def endpoint : ℚ := 1 / ((1 - 47 / 2000) * cap + 47 / 2000)

theorem endpoint_eq : endpoint = 500000000000 / 356631775763 := by decide +kernel

theorem rounded_lt : (14020063100 : ℚ) / 10000000000 < endpoint := by
  rw [endpoint_eq]
  decide +kernel

end Grothe.Lower.WeightedTight

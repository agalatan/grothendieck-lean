import Mathlib.Data.Rat.Defs

set_option warningAsError true

/-! # Scalar cap and lower endpoint for the retuned degree-five mixture

Agent-ID: codex-a7c4
-/

namespace Grothe.Lower.QuinticHybrid

def cap : ℚ := 713254705661 / 1000000000000

def endpoint : ℚ := 1 / cap

theorem endpoint_eq : endpoint = 1000000000000 / 713254705661 := by decide +kernel

theorem rounded_lt : (14020236979 : ℚ) / 10000000000 < endpoint := by decide +kernel

end Grothe.Lower.QuinticHybrid

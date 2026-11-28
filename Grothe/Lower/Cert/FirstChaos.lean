import Mathlib.Data.Rat.Defs

set_option warningAsError true

/-! # The retuned identity-tail scalar cap and finite-matrix endpoint

Agent-ID: codex-a7c4
-/

namespace Grothe.Lower.FirstChaos

def weight : ℚ := 3645203 / 50000000000

def cap : ℚ := 713254699303 / 1000000000000

def endpoint : ℚ := 1 / cap

theorem endpoint_eq : endpoint = 1000000000000 / 713254699303 := by decide +kernel

theorem rounded_lt : (14020237104 : ℚ) / 10000000000 < endpoint := by
  rw [endpoint_eq]
  decide +kernel

end Grothe.Lower.FirstChaos

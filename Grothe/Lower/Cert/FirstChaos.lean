import Mathlib.Data.Rat.Defs

set_option warningAsError true

/-! # The retuned identity-tail scalar cap and finite-matrix endpoint

Agent-ID: codex-a7c4
-/

namespace Grothe.Lower.FirstChaos

def weight : ℚ := 358503031 / 5000000000000

def cap : ℚ := 713254612582 / 1000000000000

def endpoint : ℚ := 1 / cap

theorem endpoint_eq : endpoint = 1000000000000 / 713254612582 := by decide +kernel

theorem rounded_lt : (14020238808 : ℚ) / 10000000000 < endpoint := by
  rw [endpoint_eq]
  decide +kernel

end Grothe.Lower.FirstChaos

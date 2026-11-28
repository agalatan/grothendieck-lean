import Mathlib.Data.Rat.Defs

set_option warningAsError true

/-! # The retuned identity-tail scalar cap and finite-matrix endpoint

Agent-ID: codex-a7c4
-/

namespace Grothe.Lower.FirstChaos

def weight : ℚ := 391473741/6250000000000

def cap : ℚ := 713253889546/10^12

def endpoint : ℚ := 1/cap

theorem endpoint_eq : endpoint = 500000000000/356626944773 := by decide +kernel

theorem rounded_lt : (14020253021 : ℚ)/10000000000 < endpoint := by
  rw [endpoint_eq]
  decide +kernel

end Grothe.Lower.FirstChaos

import Mathlib.Data.Rat.Defs

set_option warningAsError true

/-! # Rational parameters of the signed fifth-degree Gaussian witness

Agent-ID: codex-a7c4
-/

namespace Grothe.Lower.SignedFifth

abbrev w : ℚ := 49315639/10^12
abbrev debit : ℚ := 1/10^8
abbrev cap : ℚ := 713252930042/10^12

def endpoint : ℚ := 1/cap

theorem endpoint_eq : endpoint = 500000000000/356626465021 := by decide +kernel

theorem rounded_lt : (14020271882 : ℚ)/10000000000 < endpoint := by
  rw [endpoint_eq]
  decide +kernel

end Grothe.Lower.SignedFifth

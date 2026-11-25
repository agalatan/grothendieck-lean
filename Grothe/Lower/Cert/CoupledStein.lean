import Mathlib.Data.Rat.Defs

set_option warningAsError true

/-!
# Endpoint arithmetic for the coupled Stein profile

The witness has identity-tail weight 47/2000. The scalar cap below includes the
full amplitude envelope and the two expectation chords at their common scale.

Agent-ID: codex-a7c4
-/

namespace Grothe.Lower.CoupledStein

def cap : ℚ := 1412721229 / 2000000000

def endpoint : ℚ := 1 / ((1 - 47 / 2000) * cap + 47 / 2000)

theorem endpoint_eq : endpoint = 4000000000000 / 2853044560237 := by decide +kernel

theorem rounded_lt : (14020110501 : ℚ) / 10000000000 < endpoint := by
  rw [endpoint_eq]
  decide +kernel

end Grothe.Lower.CoupledStein

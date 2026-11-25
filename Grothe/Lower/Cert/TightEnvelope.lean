import Grothe.Lower.EnvelopeTight

set_option warningAsError true

/-!
# Exact endpoint of the 38-cell tightened antiholomorphic Stein envelope

Records the exact reciprocal endpoint `1 / ((1 - 47/2000) * envBTight + 47/2000) = 1000000000 / 713266399`
and its strict downward rounding `1402 / 1000 < endpoint`.
-/

namespace Grothe.Lower.TightEnvelope

def endpoint : ℚ := 1 / ((1 - 47 / 2000) * envBTight + 47 / 2000)

theorem endpoint_eq : endpoint = 1000000000 / 713266399 := by
  decide +kernel

theorem rounded_lt : (1402 : ℚ) / 1000 < endpoint := by
  rw [endpoint_eq]
  decide +kernel

end Grothe.Lower.TightEnvelope

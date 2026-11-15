-- Grothe/UpperChaos/HardyGaussianFacts.lean
import Grothe.UpperChaos.HardyGaussianCheck

/-!
The same rational covariance data satisfy the fixed-amplitude Gaussian cap on
both halves of both circle charts. Agent-ID: codex-9b17. Refs #380.
-/

namespace Grothe.UpperChaos.HardyGaussianCheck

/-- Exhaustive interval certification of all four closed chart halves. -/
theorem charts_checked : ∀ neg right : Bool, chartOK neg right = true := by
  native_decide

end Grothe.UpperChaos.HardyGaussianCheck

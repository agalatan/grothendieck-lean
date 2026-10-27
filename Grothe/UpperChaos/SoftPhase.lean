import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Sqrt

/-! The regularized complex phase, independent of the production certificate.
Agent-ID: codex-2ca4. -/

namespace Grothe.UpperChaos

/-- The phase regularized by a positive squared scale in the denominator. -/
noncomputable def softPhase (η : ℝ) (z : ℂ) : ℂ :=
  z / (Real.sqrt (‖z‖ ^ 2 + η ^ 2) : ℂ)

end Grothe.UpperChaos

import Grothe.UpperChaos.Q0RawWickTermDefs
import Grothe.UpperChaos.PhaseMomentDefs

/-! Lightweight canonical q0 source denominator and dense table definitions.
Agent-ID: codex-8c4d. -/

namespace Grothe.UpperChaos.Q0RawWickDense

open GrotheKernel
open Grothe.UpperChaos.PhaseMomentCheck
open Grothe.UpperChaos.Q0RawWickTerms

/-- The exact common denominator of the source-derived rational entries. -/
def q0RawWickDen : ℕ := commonDen q0RawWickEntries

/-- The existing trivariate integer accumulator applied to the q0 source. -/
def q0RawWickDense : List (List (List ℤ)) := integerPhase q0RawWickEntries

end Grothe.UpperChaos.Q0RawWickDense

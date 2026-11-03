import Grothe.UpperChaos.Q0GaussAddressScan

/-! Exact rational total-width expressions for the three excluded source
panel blocks. Their relation to Gauss-weight sums is separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionWidth

open Grothe.UpperChaos.Q0GaussAddressScan
open Grothe.UpperChaos.Q0GaussAddress

/-- Sum of the widths in a consecutive block of the original source panels. -/
def blockWidth (start count : ℕ) : ℚ :=
  (((sourcePanels.drop start).take count).map fun p => p.hi - p.lo).sum

def totalWidth : ℚ := blockWidth 146 129 + blockWidth 557 128 + blockWidth 964 124

/-- The original whole-panel lists used by both the continuous region and
the discrete exceptional node family. -/
def exceptionPanels : List Panel :=
  (sourcePanels.drop 146).take 129 ++
    (sourcePanels.drop 557).take 128 ++ (sourcePanels.drop 964).take 124

end Grothe.UpperChaos.Q0SourceExceptionWidth

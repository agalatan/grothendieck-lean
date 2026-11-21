import Grothe.UpperReplacement.CircleCheck

/-!
# Circle means with an explicit refinement tolerance

Agent-ID: codex-a7c4. The tolerance selects when a certified whole-box enclosure is accepted;
it is not an error allowance. Every accepted leaf still passes all denominator and positivity
checks, and the sum itself must fit the stated rational budget.
-/

namespace Grothe.UpperReplacement.CircleWide

open GrotheKernel GrotheKernel.HardyArc CircleCheck

def meanOK (dat : RData) (rhoQ jQ budgetQ : Rat) (depth : Nat) (tolerance : Int) : Bool :=
  let j := ofRatI jQ
  let rho := ofRatI rhoQ
  match coverGauss j rho dat false (D / 64) tolerance depth (-D) 0,
        coverGauss j rho dat false (D / 64) tolerance depth 0 D,
        coverGauss j rho dat true (D / 64) tolerance depth (-D) 0,
        coverGauss j rho dat true (D / 64) tolerance depth 0 D with
  | some a, some b, some c, some d =>
    decide (a + b + c + d ≤ ofRatLo (2 * piLo20Q * budgetQ))
  | _, _, _, _ => false

end Grothe.UpperReplacement.CircleWide

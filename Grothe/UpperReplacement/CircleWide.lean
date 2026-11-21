import Grothe.UpperReplacement.CircleCheck

set_option warningAsError true

/-!
# Circle means with an explicit refinement tolerance

Agent-ID: codex-a7c4, gemini-1aa9. The tolerance selects when a certified whole-box enclosure is
accepted; it is not an error allowance. Every accepted leaf still passes all denominator and
positivity checks, and the quarter-circle sum is scaled by four (using oddness and conjugation
symmetry of the Schur denominator) before comparison with the stated rational budget.
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

/-- Quarter-circle cancellation-free Schur check with Lipschitz polynomial enclosure. -/
def quarterMeanOK (M : SR) (pl ql : List Rat) (rhoQ jQ budgetQ : Rat)
    (depth : Nat) (tolerance : Int) : Bool :=
  let pl' := trimQ pl
  let ql' := trimQ ql
  let P := pl'.map ofRatI
  let Q := ql'.map ofRatI
  let j := ofRatI jQ
  let rho := ofRatI rhoQ
  let lipP := ofRatHi (lipBoundQ pl' rhoQ)
  let lipQ := ofRatHi (lipBoundQ ql' rhoQ)
  let m00sq := mulI M.a M.a
  let m01sq := mulI M.b M.b
  let m0001 := mulI M.a M.b
  let m0111 := mulI M.b M.c
  let m11sq := mulI M.c M.c
  match coverFast j rho m00sq m01sq m0001 m0111 m11sq P Q lipP lipQ
      (D / 8) tolerance depth 0 D with
  | some q => decide (4 * q ≤ ofRatLo (2 * piLo20Q * budgetQ))
  | none => false

end Grothe.UpperReplacement.CircleWide

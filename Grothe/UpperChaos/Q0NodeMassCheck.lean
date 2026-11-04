import Mathlib.Tactic

/-! Shared integer checks for directed node-mass candidates. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0NodeMassCheck

structure Row where
  index : ℕ
  panel : ℕ
  rule : ℕ
  nodeLower : ℕ
  weightUpper : ℕ
  termUpper : ℕ
  deriving DecidableEq

def valid (r : Row) : Bool :=
  decide (r.weightUpper * (16000000000 : ℕ)^16 * 1000000000000000000 ≤
    r.termUpper * 1000000000000 * (16000000000 + r.nodeLower)^16)

end Grothe.UpperChaos.Q0NodeMassCheck

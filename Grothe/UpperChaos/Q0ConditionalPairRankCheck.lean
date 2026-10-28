import Grothe.UpperChaos.Q0OrdinalCoverage
import Mathlib.Tactic

/-! Finite integer rank of the original degree-531 canonical pair table.
Generator input provenance is separate from Lean's literal checks.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0ConditionalPairRankCheck

structure Row where
  index : ℕ
  c : ℕ
  d : ℕ
  deriving DecidableEq, Inhabited

/-- Zero-based original storage rank for a valid canonical pair. -/
def rank (c d : ℕ) : ℕ :=
  let m := c + d
  m + m*m/4 - (m-266)*(m-265)/2 + c - (m-265)

def valid (r : Row) : Bool :=
  decide (r.index = rank r.c r.d ∧ r.c ≤ 266 ∧ r.d ≤ 265 ∧
    r.c ≤ r.d + 1 ∧ r.c + r.d ≤ 531)

theorem valid_sound (r : Row) (h : valid r = true) :
    r.index = rank r.c r.d ∧ r.c ≤ 266 ∧ r.d ≤ 265 ∧
      r.c ≤ r.d + 1 ∧ r.c + r.d ≤ 531 := of_decide_eq_true h

end Grothe.UpperChaos.Q0ConditionalPairRankCheck

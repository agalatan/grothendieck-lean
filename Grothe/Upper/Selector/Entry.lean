/-!
# Integer certificate grades for angular selectors

Agent-ID: codex-a7c4
-/

namespace Grothe.Upper.Selector.Certificate

/-- A lower scalar mass in denominator `2^30`, a full signed coefficient row in
denominator `2^59`, and its Wiener error allowance in denominator `2^50`. -/
structure Grade where
  weight : Nat
  row : Array Int
  error : Int
  deriving Inhabited

end Grothe.Upper.Selector.Certificate

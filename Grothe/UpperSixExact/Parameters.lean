import Grothe.UpperSix.Haagerup.Parameters

set_option warningAsError true

/-!
# Exact six-channel certificate parameters

Agent-ID: codex-a7c4
-/

namespace Haagerup.SixChannelExact

/-- First-coordinate preprocessor in channel zero. -/
def firstPolynomial : List ℚ := [
  990998086400 / d12Q, -8999423909 / d12Q, 0, 0, 0, 0, 0, 0, 0, 0,
  -103698 / d12Q, 0, 1399963 / d12Q, 0, 0, 892956 / d12Q, 0, 0, 0, 0, 93074 / d12Q
]

def slope : ℚ := 711973082422 / 10 ^ 12
def headCap : ℚ := 4481751845 / 10 ^ 15

/-- Only channel zero needs a new circle budget. -/
def circleBudget (p : Fin 6) : ℚ := if p = 0 then 13 / 5 else budgetQ p

/-- Lower bounds for the linear coefficients certified in the interval head. -/
def linearFloor : Fin 6 → ℚ
  | 0 => 711855 / 10 ^ 6
  | 1 => 711138 / 10 ^ 6
  | 2 => 72246 / 10 ^ 6
  | 3 => 755183 / 10 ^ 6
  | 4 => 716847 / 10 ^ 6
  | 5 => 692306 / 10 ^ 6

/-- Bounds on the absolute coefficient tails from index 251. -/
def tailCap : Fin 6 → ℚ
  | 0 => 45093333 / 10 ^ 15
  | 1 => 44082953 / 10 ^ 15
  | 2 => 1784099260 / 10 ^ 15
  | 3 => 88593460 / 10 ^ 15
  | 4 => 1 / 10 ^ 15
  | 5 => 53006658 / 10 ^ 15

end Haagerup.SixChannelExact

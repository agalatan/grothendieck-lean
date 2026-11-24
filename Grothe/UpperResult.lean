import Grothe.Statement
import Grothe.UpperSix.Haagerup

set_option warningAsError true

/-!
# The upper bound `K_G^ℂ ≤ 1.40455741 < 1/γ†`, from the six-channel proof

The six-channel proof (`Grothe/UpperSix/`) has its own copy of the definitions, so that it also builds as the
standalone package `haagerup-article/anc/`. That copy and `Grothe/Statement.lean` quantify over the same finite
matrices, unimodular scalars and complex unit vectors, and agree by reduction; the theorems below are stated with
the definitions of `Grothe/Statement.lean`.

Agent-ID: codex-a7c4
-/

namespace Grothe.UpperSix

/-- **The upper bound for one matrix**: `V(A) ≤ 1.40455741 · C(A)` for every finite complex matrix `A`. -/
theorem bound : Statement.IsBound (140455741 / 100000000 : ℝ) :=
  Haagerup.isBound_cert

/-- **The upper bound**: `K_G^ℂ ≤ 1.40455741`. -/
theorem constant_le : Statement.complexGrothendieckConstant ≤ (140455741 / 100000000 : ℝ) :=
  csInf_le Haagerup.Statement.bounds_bddBelow Haagerup.isBound_cert

/-- `K_G^ℂ < 1/γ†`: the constant is strictly below Haagerup's value. -/
theorem constant_lt_inv_gammaDagger :
    Statement.complexGrothendieckConstant < 1 / Haagerup.Statement.gammaDagger :=
  Haagerup.constant_lt_inv_gammaDagger

end Grothe.UpperSix

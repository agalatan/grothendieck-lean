import Grothe.Statement
import Grothe.UpperSix.Haagerup

set_option warningAsError true

/-!
# Six-channel upper bound for the complex Grothendieck constant

The standalone certificate and the repository quantify over the same finite matrices,
unimodular scalars and complex unit vectors. Their definitions agree by reduction.

Agent-ID: codex-a7c4
-/

namespace Grothe.UpperSix

/-- The advertised six-channel rational is an admissible bound for every finite matrix. -/
theorem bound : Statement.IsBound (140457588 / 100000000 : ℝ) :=
  Haagerup.isBound_cert

/-- The standard infimum is at most the six-channel bound. -/
theorem constant_le : Statement.complexGrothendieckConstant ≤ (140457588 / 100000000 : ℝ) :=
  csInf_le Haagerup.Statement.bounds_bddBelow Haagerup.isBound_cert

/-- The same standard constant is strictly below the reciprocal phase integral. -/
theorem constant_lt_inv_gammaDagger :
    Statement.complexGrothendieckConstant < 1 / Haagerup.Statement.gammaDagger :=
  Haagerup.constant_lt_inv_gammaDagger

end Grothe.UpperSix

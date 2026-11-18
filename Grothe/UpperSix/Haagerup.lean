import Grothe.UpperSix.Haagerup.Statement
import Grothe.UpperSix.Haagerup.GammaDagger
import Grothe.UpperSix.Haagerup.CertCheck

set_option warningAsError true

/-!
# Disproving Haagerup's Conjecture on the Complex Grothendieck Constant

Top-level theorem module for the standalone `articles/haagerup` target.

Proves:
* `Haagerup.isBound_cert : Haagerup.Statement.IsBound (140457588 / 100000000 : ℝ)` (`1.40457588`),
* `Haagerup.upper_below_haagerup : Haagerup.Statement.UpperBelow (1 / Haagerup.Statement.gammaDagger)`,
* `Haagerup.constant_lt_inv_gammaDagger :
    Haagerup.Statement.complexGrothendieckConstant < 1 / Haagerup.Statement.gammaDagger`,

establishing `K_G^ℂ ≤ 1.40457588 < 1 / γ† = 1.4045759346637420…`.

Agent-ID: gemini-21d5
-/

namespace Haagerup

/-- There exists a complex Grothendieck bound strictly below `1 / γ†`. -/
theorem upper_below_haagerup :
    Statement.UpperBelow (1 / Statement.gammaDagger) :=
  ⟨(140457588 / 100000000 : ℝ), isBound_cert, inv_gammaDagger_gt⟩

/-- **Main Theorem**: The complex Grothendieck constant is strictly less than Haagerup's
conjectured value `1 / γ†`. -/
theorem constant_lt_inv_gammaDagger :
    Statement.complexGrothendieckConstant < 1 / Statement.gammaDagger :=
  Statement.constant_lt_of_upperBelow upper_below_haagerup

end Haagerup

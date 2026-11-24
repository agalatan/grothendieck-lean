import Haagerup.Statement
import Haagerup.GammaDagger
import Haagerup.CertCheck

set_option warningAsError true

/-!
# Haagerup's value is a strict upper bound for the complex Grothendieck constant

The production endpoint and the article's ancillary package `haagerup-article/anc` both use these theorems.

Proves:
* `Haagerup.isBound_cert : Haagerup.Statement.IsBound (140455741 / 100000000 : ℝ)` (`1.40455741`),
* `Haagerup.upper_below_haagerup : Haagerup.Statement.UpperBelow (1 / Haagerup.Statement.gammaDagger)`,
* `Haagerup.constant_lt_inv_gammaDagger :
    Haagerup.Statement.complexGrothendieckConstant < 1 / Haagerup.Statement.gammaDagger`,

establishing `K_G^ℂ ≤ 1.40455741 < 1 / γ† = 1.4045759346637420…`.

Agent-ID: gemini-21d5
-/

namespace Haagerup

/-- There exists a complex Grothendieck bound strictly below `1 / γ†`. -/
theorem upper_below_haagerup :
    Statement.UpperBelow (1 / Statement.gammaDagger) :=
  ⟨(140455741 / 100000000 : ℝ), isBound_cert, inv_gammaDagger_gt⟩

/-- **Main Theorem**: The complex Grothendieck constant is strictly less than Haagerup's
conjectured value `1 / γ†`. -/
theorem constant_lt_inv_gammaDagger :
    Statement.complexGrothendieckConstant < 1 / Statement.gammaDagger :=
  Statement.constant_lt_of_upperBelow upper_below_haagerup

end Haagerup

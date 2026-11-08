import Grothe.UpperQuad.PortFacts.J1Tables
import Grothe.UpperQuad.PortFacts.J1Final
import Grothe.UpperQuad.PortFacts.J2Tables
import Grothe.UpperQuad.PortFacts.J2Final
import Grothe.UpperQuad.PortFacts.J3Tables
import Grothe.UpperQuad.PortFacts.J3Final
import Grothe.UpperQuad.TwistBridge
import Grothe.UpperQuad.TwistPhaseDeg

/-!
# The three concrete bundles of finite port facts

Each bundle packages the production power, phase degree theorem, table flags, final table
check, and every range fact into the `FactsOf` interface consumed by the twisted soundness
bridge. No additional finite check is evaluated in this module.

The analytic quadrature remainders and energy-table closeness required by the upper-bound
endpoint remain separate inputs.

Agent-ID: codex-40e8. Refs #335, #334, #332.
-/

namespace Grothe.UpperQuad.PortFacts

open GrotheQuad

/-- The independently compiled table flags have the soundness layer's exact definition. -/
private theorem tablesValid_of_flags {P : ℕ} {prm : TwistParams} {tabs : TwistTables}
    (h : tablesFlags P prm tabs = true) : twistTablesValid P prm tabs = true := h

/-- All finite inputs for the first production power. -/
theorem j1FactsOf : FactsOf 1 j1Bounds j1Tables j1ThetaNum (10 ^ 20) j1Eps := by
  refine
    { hj := Or.inl rfl
      deg := phaseDegOK
      tablesValid := tablesValid_of_flags j1TablesValid
      final := j1Final
      ranges := ?_ }
  intro r hr
  exact j1RangeFacts r (by
    simpa only [j1Tables, List.length_cons, List.length_nil] using hr)

/-- All finite inputs for the second production power. -/
theorem j2FactsOf : FactsOf 2 j2Bounds j2Tables j2ThetaNum (10 ^ 20) j2Eps := by
  refine
    { hj := Or.inr (Or.inl rfl)
      deg := phaseDegOK
      tablesValid := tablesValid_of_flags j2TablesValid
      final := j2Final
      ranges := ?_ }
  intro r hr
  exact j2RangeFacts r (by
    simpa only [j2Tables, List.length_cons, List.length_nil] using hr)

/-- All finite inputs for the third production power. -/
theorem j3FactsOf : FactsOf 3 j3Bounds j3Tables j3ThetaNum (10 ^ 20) j3Eps := by
  refine
    { hj := Or.inr (Or.inr rfl)
      deg := phaseDegOK
      tablesValid := tablesValid_of_flags j3TablesValid
      final := j3Final
      ranges := ?_ }
  intro r hr
  exact j3RangeFacts r (by
    simpa only [j3Tables, List.length_cons, List.length_nil] using hr)

end Grothe.UpperQuad.PortFacts

-- Grothe/Upper/ImprovedHeadWeightFacts.lean
import Grothe.Upper.ImprovedHeadWeightData

/-!
# Exact finite masses for the longer-prefix coefficient costs

Only two complete high bands are evaluated. The existing energy-table tolerance
is included once in each cap, and the four low-band caps follow analytically from
the pointwise decrease in coefficient cost. The native check recomputes all
interval coefficients from the unchanged rational polynomials and energy table;
it does not trust the Python generator or its reported masses.

Agent-ID: codex-9b17. Refs #379.
-/

namespace Grothe.Upper

open GrotheKernel

/-- A closed Boolean checker keeps the expensive arithmetic out of elaborator reduction. -/
def improvedHighMassCheck : Bool :=
    let rows := weightedRows energyRows improvedWeightQ
    decide (comparisonMass rows (improvedCheckBand 2) + energyErrQ ≤
      (improvedThreeBandMassQ 2) ^ 2) &&
    decide (comparisonMass rows (improvedCheckBand 6) + energyErrQ ≤
      (improvedThreeBandMassQ 6) ^ 2)

set_option maxRecDepth 10000 in
/-- Independent native acceptance of both generated high-band mass ceilings. -/
theorem improved_high_mass_native : improvedHighMassCheck = true := by
  native_decide

private theorem improved_high_mass_pair :
    comparisonMass (weightedRows energyRows improvedWeightQ) (improvedCheckBand 2) + energyErrQ ≤
      (improvedThreeBandMassQ 2) ^ 2 ∧
    comparisonMass (weightedRows energyRows improvedWeightQ) (improvedCheckBand 6) + energyErrQ ≤
      (improvedThreeBandMassQ 6) ^ 2 := by
  simpa only [improvedHighMassCheck, Bool.and_eq_true, decide_eq_true_eq] using
    improved_high_mass_native

theorem improved_high_mass_51 :
    comparisonMass (weightedRows energyRows improvedWeightQ) (improvedCheckBand 2) + energyErrQ ≤
      (improvedThreeBandMassQ 2) ^ 2 :=
  improved_high_mass_pair.1

theorem improved_high_mass_11 :
    comparisonMass (weightedRows energyRows improvedWeightQ) (improvedCheckBand 6) + energyErrQ ≤
      (improvedThreeBandMassQ 6) ^ 2 :=
  improved_high_mass_pair.2

/-- The two high Taylor bands with cutoff 51 share exactly the same finite mass. -/
theorem improved_high_mass_check (j : Fin 7) (hj : j = 2 ∨ j = 4 ∨ j = 6) :
    comparisonMass (weightedRows energyRows improvedWeightQ) (improvedCheckBand j) + energyErrQ ≤
      (improvedThreeBandMassQ j) ^ 2 := by
  rcases hj with rfl | rfl | rfl
  · exact improved_high_mass_51
  · exact improved_high_mass_51
  · exact improved_high_mass_11

end Grothe.Upper

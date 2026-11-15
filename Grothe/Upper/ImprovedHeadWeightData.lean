-- Grothe/Upper/ImprovedHeadWeightData.lean
import Grothe.Upper.Data
import Grothe.Upper.ComparisonData
import GrotheKernel.HeadWeight
import Mathlib.Algebra.Order.Ring.Rat

/-!
# A longer interval prefix with a geometric remainder

The first 51 unshifted coefficients are enclosed using the unchanged 128-bit
interval operations. A weighted polynomial norm at radius `3/2` pays for every
remaining coefficient. The old 21-coefficient cost remains an independent cap.
The two high-band mass ceilings are reproduced by
`tools/gen_improved_head_weight.py` and checked in `ImprovedHeadWeightFacts`.

Agent-ID: codex-9b17. Refs #379.
-/

namespace Grothe.Upper

open GrotheKernel

/-- Keep both old power tables closed so native evaluation constructs each only once. -/
def improvedOldPowersP : List (List Ival) := powsT 21 (pList.map ofRatI) 501

def improvedOldPowersQ : List (List Ival) := powsT 21 (qList.tail.map ofRatI) (501 / 3)

/-- The original cost, expressed without importing its analytic soundness proof. -/
def improvedOldWeightQ (n m : ℕ) : ℚ :=
  headWeight 501 21 improvedOldPowersP improvedOldPowersQ n m

def improvedPowersP : List (List Ival) := powsT 51 (pList.map ofRatI) 501

def improvedPowersQ : List (List Ival) := powsT 51 (qList.tail.map ofRatI) 167

/-- Interval enclosure of the unshifted prefix visible to the 251-coefficient head. -/
def improvedPrefixCostQ (n m : ℕ) : ℚ :=
  (absSum (weightTerm (min (251 - (n / 2 + m / 2 + m)) 51)
    improvedPowersP improvedPowersQ n m) : ℚ) / (D : ℚ)

/-- Every omitted unshifted coefficient is covered by this uniform remainder. -/
def improvedTailQ : ℚ := 1 / 50000000

/-- The old cost and the longer-prefix cost are both valid upper bounds. -/
def improvedWeightQ (n m : ℕ) : ℚ :=
  if n ≤ 501 ∧ m ≤ 167 then
    min (improvedOldWeightQ n m)
      (min 1 (max 0 (improvedPrefixCostQ n m +
        if 51 < 251 - (n / 2 + m / 2 + m) then improvedTailQ else 0)))
  else improvedOldWeightQ n m

/-- Coefficients of `P((3/2)X)`. -/
def scaledPList : List ℚ := pList.mapIdx (fun i q ↦ q * (3 / 2 : ℚ) ^ i)

/-- Coefficients of `(Q/X)((3/2)X)`. -/
def scaledQList : List ℚ := qList.tail.mapIdx (fun i q ↦ q * (3 / 2 : ℚ) ^ i)

set_option maxRecDepth 10000 in
theorem scaledPList_norm : (scaledPList.map (fun q ↦ |q|)).sum ≤ (10049 / 10000 : ℚ) := by
  decide +kernel

set_option maxRecDepth 10000 in
theorem scaledQList_norm : (scaledQList.map (fun q ↦ |q|)).sum ≤ (10023 / 10000 : ℚ) := by
  decide +kernel

set_option maxRecDepth 10000 in
theorem improvedTail_numeric :
    (10049 / 10000 : ℚ) ^ 501 * (10023 / 10000 : ℚ) ^ 167 / (3 / 2 : ℚ) ^ 51 ≤
      improvedTailQ := by
  decide +kernel

/-- Only containment matters to the finite high-band mass check. -/
def improvedCheckBand (j : Fin 7) : ComparisonBand :=
  ⟨if j = 6 then 11 else 51, 0, 0, 0⟩

-- BEGIN GENERATED MASS CAPS: tools/gen_improved_head_weight.py
/-- Mass square-root ceilings; the four low-band caps retain their existing values. -/
def improvedThreeBandMassQ (j : Fin 7) : ℚ :=
  if j = 2 then (45755176460937 : ℚ) / 500000000000000 else
  if j = 4 then (45755176460937 : ℚ) / 500000000000000 else
  if j = 6 then (49729961473103 : ℚ) / 250000000000000 else
  if j = 0 then comparisonBands[0].norm else
  if j = 1 then comparisonBands[1].norm else
  if j = 3 then comparisonBands[8].norm else comparisonBands[13].norm
-- END GENERATED MASS CAPS

theorem improvedThreeBandMassQ_nonneg (j : Fin 7) : 0 ≤ improvedThreeBandMassQ j := by
  have h : ∀ j : Fin 7, 0 ≤ improvedThreeBandMassQ j := by decide +kernel
  exact h j

end Grothe.Upper

import Grothe.UpperSelector.PhysicalColumn
import Grothe.UpperSelector.Mixture

/-!
# Parameters of the seven-channel interval witness

The six legacy channels keep their order. The new angular selector occupies the last slot.
All seven weights share denominator `10^12`. Agent-ID: codex-a7c4
-/

set_option warningAsError true

namespace Haagerup.AngularSelector.NumericWitness
open HaagerupKernel

def weight : Fin 7 → ℚ
  | 0 => 855442507081 / 10^12
  | 1 => 87437053595 / 10^12
  | 2 => 156268190 / 10^12
  | 3 => 113929802 / 10^12
  | 4 => 56404889960 / 10^12
  | 5 => 351620478 / 10^12
  | 6 => 93730894 / 10^12

theorem weight_nonneg (i : Fin 7) : 0 ≤ weight i := by fin_cases i <;> decide +kernel

theorem weight_sum : ∑ i, weight i = 1 := by decide +kernel

def center : ℚ := 1
def headBudget : ℚ := 288031377028001 / 10^15
def selectorBudget : ℚ := 219915172743 / 10^15

def heads (six : Fin 6 → List Ival) (col : Certificate.Column) : Fin 7 → List Ival :=
  Fin.lastCases col.thinHead six

def caps (six : Fin 6 → ℚ) (last : ℚ) : Fin 7 → ℚ := Fin.lastCases last six

/-- These comparisons share the same computed physical selector column. -/
def withinBudgets (six : Fin 6 → List Ival) (col : Certificate.Column) : Bool :=
  decide (absSum (addL (sumL ((List.finRange 7).map fun i =>
    (heads six col i).map (mulI (ofRatI (weight i)))))
    [negI (ofRatI center)]) ≤ ofRatLo headBudget ∧
    (col.allowance : ℚ) / 2^89 ≤ selectorBudget)

end Haagerup.AngularSelector.NumericWitness

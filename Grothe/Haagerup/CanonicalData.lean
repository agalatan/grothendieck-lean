import Grothe.Haagerup.PowerData
import Grothe.Upper.Haagerup
import Grothe.Upper.FiniteDifference
import Grothe.Haagerup.CanonicalArithmetic

/-! Exact parameters of the canonical resolvent completion. -/
namespace Grothe.HaagerupCanonical

open Upper.FiniteDifference

def start : ℕ := 64
def order : ℕ := 10
def cutoff : ℕ := 165
def prefixCap : ℚ := 368411/5000000000000000
def headCap : ℚ := 736823/10000000000000000
def remainderCap : ℚ := 2/10000000000000000
def differences : List ℚ := (List.range order).map fun j => iterDiff j haagR start

/-- Exact coefficient-weighted Horner majorant. -/
def majorantQ (rho : ℚ) : List ℚ → ℚ
  | [] => 0
  | q :: qs => |q| + rho*majorantQ rho qs

/-- The weighted completion bound, retaining each coefficient's actual size. -/
def weightedBudget : ℚ :=
  (21/20)*majorantQ (5/3) (GrotheKernel.haagList start) +
    (9*((21/20)*(5/3)^start))*majorantQ 15 differences + 1

/-- The combined-seed remainder bound, including the inverse defect. -/
def remainderBudget : ℚ :=
  ((1/16)*iterDiff order haagR start + HaagerupPower.defectCap*
    ∑ j ∈ Finset.range order, iterDiff j haagR start) /
    (1-HaagerupPower.defectCap)

end Grothe.HaagerupCanonical

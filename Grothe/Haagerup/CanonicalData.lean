import Grothe.Haagerup.PowerData
import Grothe.Upper.Haagerup
import Grothe.Upper.FiniteDifference
import Grothe.Haagerup.CanonicalArithmetic

/-! Exact parameters of the canonical resolvent completion. -/
namespace Grothe.HaagerupCanonical

open Upper.FiniteDifference

def start : ℕ := 64
def order : ℕ := 8
def cutoff : ℕ := 172
def prefixCap : ℚ := 74/1000000000000
def headCap : ℚ := 126/1000000000000
def remainderCap : ℚ := 14/1000000000000
def differences : List ℚ := (List.range order).map fun j => iterDiff j haagR start

end Grothe.HaagerupCanonical

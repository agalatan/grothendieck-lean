import Grothe.Haagerup.PowerCheck
import Grothe.Upper.Haagerup
import Grothe.Upper.FiniteDifference
import GrotheKernel.ResolventCompletion

/-! Exact parameters of the canonical resolvent completion. -/
namespace Grothe.HaagerupCanonical

open Upper.FiniteDifference

def start : ℕ := 64
def order : ℕ := 6
def cutoff : ℕ := 2500
def headCap : ℚ := 914/100000000000
def remainderCap : ℚ := 24/100000000000
def differences : List ℚ := (List.range order).map fun j => iterDiff j haagR start

end Grothe.HaagerupCanonical

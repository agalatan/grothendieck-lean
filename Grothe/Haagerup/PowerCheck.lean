import Mathlib.Tactic
import GrotheKernel.PowerTail

/-! Exact degree-13 preprocessor and its three computational certificates. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 4000000
namespace Grothe.HaagerupPower
open GrotheKernel

def pl : List ℚ := [906284633979/1000000000000, -93047318709/1000000000000, 0,
  -490402143/1000000000000, -125872719/1000000000000,
  -38769671/1000000000000, -13002779/1000000000000]
def terms : ℕ := 2000
def headCap : ℚ := 11/1000000
def tailCap : ℚ := 27/1250000
def gamma : ℚ := 637/1000
def ratio : ℚ := 199787/200000
def slope : ℚ := 906284633979/1000000000000

def checks : Bool :=
  haagCheck 26000 pl terms slope headCap gamma && powerNormOK pl 4 ratio &&
    powerTailOK terms 8192 ratio gamma tailCap

/-- The complete finite residual, fourth-power budget and infinite-tail
certificate. Evaluated sequentially; no threading or floating arithmetic. -/
theorem check : checks = true := by
  native_decide


end Grothe.HaagerupPower

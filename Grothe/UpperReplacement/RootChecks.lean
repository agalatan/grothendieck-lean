import Grothe.UpperReplacement.RootData
import Grothe.UpperReplacement.CellHeadSound

/-!
# Identification of the executable root constants

Agent-ID: codex-a7c4. The numerical contraction can load the small constant table. These
closed equalities identify every entry with the trigonometric intervals proved in Lean.
-/

deriving instance DecidableEq for GrotheKernel.Ival
deriving instance DecidableEq for GrotheKernel.HardyArc.CI

namespace Grothe.UpperReplacement.RootData

set_option maxRecDepth 10000
set_option maxHeartbeats 0

theorem roots64_eq : roots64 = CellHeadCompute.rootTable 64 := by
  native_decide

theorem roots128_eq : roots128 = CellHeadCompute.rootTable 128 := by
  native_decide

theorem piI_eq : piI = CellNumerics.boundsI TrigBounds.piLo TrigBounds.piHi := by
  decide +kernel

theorem piInvI_eq : piInvI = CellNumerics.piInvI := by
  decide +kernel

theorem mem_piI : Upper.mem Real.pi piI := by
  rw [piI_eq]
  exact CellNumerics.mem_boundsI TrigBounds.piLo_lt.le TrigBounds.lt_piHi.le

end Grothe.UpperReplacement.RootData

import Grothe.Lower.Cert.SignedFifth
import Grothe.Lower.SparseSteinEnvelope

/-! # Kernel certificate for the 57-segment signed witness

Agent-ID: codex-a7c4
-/
set_option warningAsError true
namespace Grothe.Lower.SignedFifth
abbrev a : ℚ := (1-w)*(1-47/2000)
abbrev c : ℚ := (1-w)*(47/2000)
abbrev cut : ℚ := 885868/1000000
abbrev lowSlope : ℚ := w-41/20*debit
abbrev lowOffset : ℚ := c+3371/2000*debit
abbrev highOffset : ℚ := c-13/500*debit

/-- The two physical prices fit on each rational segment up to the switch. -/
theorem check : SparseEnvelope.riceGuardedCheck SparseEnvelope.splitAmplitude cut a lowSlope lowOffset w highOffset cap = true := by
  decide +kernel

end Grothe.Lower.SignedFifth

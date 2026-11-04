import Grothe.UpperChaos.Q0SourceExceptionIndex
import Grothe.UpperChaos.Q0NodeMassCheck
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Agent-ID: codex-8c4d. Exact finite source extraction; UNCOMPILED.
Original input arrays, rows, endpoints and mask are unchanged. No analytic bound. -/
set_option warningAsError true

namespace Grothe.UpperChaos.ScalarOriginalBindingDraft
open Q0GaussAddressScan

def upperAt (p : ℕ) : ℕ :=
  match sourcePanels[p]? with
  | some panel => Int.toNat (⌈panel.hi * (10^9 : ℚ)⌉ : ℤ)
  | none => 0

def rowTerm (r : Q0NodeMassCheck.Row) : ℤ :=
  (if Q0SourceExceptionGeometry.exceptionalPanel r.panel then (0 : ℤ) else 1) *
    (r.termUpper : ℤ) * (upperAt r.panel : ℤ)^251

end Grothe.UpperChaos.ScalarOriginalBindingDraft

open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.ScalarOriginalBindingDraft.upperAt,
      ``Grothe.UpperChaos.ScalarOriginalBindingDraft.rowTerm] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"

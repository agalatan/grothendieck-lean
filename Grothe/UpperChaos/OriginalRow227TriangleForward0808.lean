import Grothe.UpperChaos.OriginalRow227TriangleData0811
import Grothe.UpperChaos.OriginalRow227TriangleData0824
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0808
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0811.coefficient55_440, Icur := OriginalRow227TriangleData0811.coefficient55_439,
    output := OriginalRow227TriangleData0824.coefficient56_439, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0811.coefficient55_441, Icur := OriginalRow227TriangleData0811.coefficient55_440,
    output := OriginalRow227TriangleData0824.coefficient56_440, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0811.coefficient55_442, Icur := OriginalRow227TriangleData0811.coefficient55_441,
    output := OriginalRow227TriangleData0824.coefficient56_441, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0811.coefficient55_443, Icur := OriginalRow227TriangleData0811.coefficient55_442,
    output := OriginalRow227TriangleData0824.coefficient56_442, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0811.coefficient55_444, Icur := OriginalRow227TriangleData0811.coefficient55_443,
    output := OriginalRow227TriangleData0824.coefficient56_443, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0811.coefficient55_445, Icur := OriginalRow227TriangleData0811.coefficient55_444,
    output := OriginalRow227TriangleData0824.coefficient56_444, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots01.root56,
    Inext := OriginalRow227TriangleData0811.coefficient55_446, Icur := OriginalRow227TriangleData0811.coefficient55_445,
    output := OriginalRow227TriangleData0824.coefficient56_445, hC := OriginalRow227TriangleRoots01.root56_pos, hAC := OriginalRow227TriangleRoots01.product56_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0808

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0808.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

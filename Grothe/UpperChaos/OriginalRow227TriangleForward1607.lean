import Grothe.UpperChaos.OriginalRow227TriangleData1615
import Grothe.UpperChaos.OriginalRow227TriangleData1623
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1607
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1615.coefficient133_358, Icur := OriginalRow227TriangleData1615.coefficient133_357,
    output := OriginalRow227TriangleData1623.coefficient134_357, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1615.coefficient133_359, Icur := OriginalRow227TriangleData1615.coefficient133_358,
    output := OriginalRow227TriangleData1623.coefficient134_358, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1615.coefficient133_360, Icur := OriginalRow227TriangleData1615.coefficient133_359,
    output := OriginalRow227TriangleData1623.coefficient134_359, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1615.coefficient133_361, Icur := OriginalRow227TriangleData1615.coefficient133_360,
    output := OriginalRow227TriangleData1623.coefficient134_360, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1615.coefficient133_362, Icur := OriginalRow227TriangleData1615.coefficient133_361,
    output := OriginalRow227TriangleData1623.coefficient134_361, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1615.coefficient133_363, Icur := OriginalRow227TriangleData1615.coefficient133_362,
    output := OriginalRow227TriangleData1623.coefficient134_362, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1615.coefficient133_364, Icur := OriginalRow227TriangleData1615.coefficient133_363,
    output := OriginalRow227TriangleData1623.coefficient134_363, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1615.coefficient133_365, Icur := OriginalRow227TriangleData1615.coefficient133_364,
    output := OriginalRow227TriangleData1623.coefficient134_364, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1615.coefficient133_366, Icur := OriginalRow227TriangleData1615.coefficient133_365,
    output := OriginalRow227TriangleData1623.coefficient134_365, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1615.coefficient133_367, Icur := OriginalRow227TriangleData1615.coefficient133_366,
    output := OriginalRow227TriangleData1623.coefficient134_366, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1615.coefficient133_368, Icur := OriginalRow227TriangleData1615.coefficient133_367,
    output := OriginalRow227TriangleData1623.coefficient134_367, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1607

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1607.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

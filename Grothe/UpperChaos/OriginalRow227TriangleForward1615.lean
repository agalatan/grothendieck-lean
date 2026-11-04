import Grothe.UpperChaos.OriginalRow227TriangleData1623
import Grothe.UpperChaos.OriginalRow227TriangleData1631
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1615
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1623.coefficient134_359, Icur := OriginalRow227TriangleData1623.coefficient134_358,
    output := OriginalRow227TriangleData1631.coefficient135_358, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1623.coefficient134_360, Icur := OriginalRow227TriangleData1623.coefficient134_359,
    output := OriginalRow227TriangleData1631.coefficient135_359, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1623.coefficient134_361, Icur := OriginalRow227TriangleData1623.coefficient134_360,
    output := OriginalRow227TriangleData1631.coefficient135_360, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1623.coefficient134_362, Icur := OriginalRow227TriangleData1623.coefficient134_361,
    output := OriginalRow227TriangleData1631.coefficient135_361, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1623.coefficient134_363, Icur := OriginalRow227TriangleData1623.coefficient134_362,
    output := OriginalRow227TriangleData1631.coefficient135_362, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1623.coefficient134_364, Icur := OriginalRow227TriangleData1623.coefficient134_363,
    output := OriginalRow227TriangleData1631.coefficient135_363, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1623.coefficient134_365, Icur := OriginalRow227TriangleData1623.coefficient134_364,
    output := OriginalRow227TriangleData1631.coefficient135_364, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1623.coefficient134_366, Icur := OriginalRow227TriangleData1623.coefficient134_365,
    output := OriginalRow227TriangleData1631.coefficient135_365, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1623.coefficient134_367, Icur := OriginalRow227TriangleData1623.coefficient134_366,
    output := OriginalRow227TriangleData1631.coefficient135_366, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1615

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1615.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

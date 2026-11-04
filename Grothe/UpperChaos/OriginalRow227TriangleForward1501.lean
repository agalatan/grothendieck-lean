import Grothe.UpperChaos.OriginalRow227TriangleData1508
import Grothe.UpperChaos.OriginalRow227TriangleData1517
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1501
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1508.coefficient120_377, Icur := OriginalRow227TriangleData1508.coefficient120_376,
    output := OriginalRow227TriangleData1517.coefficient121_376, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1508.coefficient120_378, Icur := OriginalRow227TriangleData1508.coefficient120_377,
    output := OriginalRow227TriangleData1517.coefficient121_377, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1508.coefficient120_379, Icur := OriginalRow227TriangleData1508.coefficient120_378,
    output := OriginalRow227TriangleData1517.coefficient121_378, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1508.coefficient120_380, Icur := OriginalRow227TriangleData1508.coefficient120_379,
    output := OriginalRow227TriangleData1517.coefficient121_379, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots03.root121,
    Inext := OriginalRow227TriangleData1508.coefficient120_381, Icur := OriginalRow227TriangleData1508.coefficient120_380,
    output := OriginalRow227TriangleData1517.coefficient121_380, hC := OriginalRow227TriangleRoots03.root121_pos, hAC := OriginalRow227TriangleRoots03.product121_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1501

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1501.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

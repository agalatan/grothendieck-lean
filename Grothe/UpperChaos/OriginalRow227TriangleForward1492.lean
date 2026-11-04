import Grothe.UpperChaos.OriginalRow227TriangleData1499
import Grothe.UpperChaos.OriginalRow227TriangleData1508
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1492
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1499.coefficient119_376, Icur := OriginalRow227TriangleData1499.coefficient119_375,
    output := OriginalRow227TriangleData1508.coefficient120_375, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1499.coefficient119_377, Icur := OriginalRow227TriangleData1499.coefficient119_376,
    output := OriginalRow227TriangleData1508.coefficient120_376, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1499.coefficient119_378, Icur := OriginalRow227TriangleData1499.coefficient119_377,
    output := OriginalRow227TriangleData1508.coefficient120_377, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1499.coefficient119_379, Icur := OriginalRow227TriangleData1499.coefficient119_378,
    output := OriginalRow227TriangleData1508.coefficient120_378, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1499.coefficient119_380, Icur := OriginalRow227TriangleData1499.coefficient119_379,
    output := OriginalRow227TriangleData1508.coefficient120_379, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1499.coefficient119_381, Icur := OriginalRow227TriangleData1499.coefficient119_380,
    output := OriginalRow227TriangleData1508.coefficient120_380, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots03.root120,
    Inext := OriginalRow227TriangleData1499.coefficient119_382, Icur := OriginalRow227TriangleData1499.coefficient119_381,
    output := OriginalRow227TriangleData1508.coefficient120_381, hC := OriginalRow227TriangleRoots03.root120_pos, hAC := OriginalRow227TriangleRoots03.product120_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1492

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1492.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

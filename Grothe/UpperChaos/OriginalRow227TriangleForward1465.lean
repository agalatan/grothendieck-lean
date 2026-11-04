import Grothe.UpperChaos.OriginalRow227TriangleData1472
import Grothe.UpperChaos.OriginalRow227TriangleData1481
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1465
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1472.coefficient116_373, Icur := OriginalRow227TriangleData1472.coefficient116_372,
    output := OriginalRow227TriangleData1481.coefficient117_372, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1472.coefficient116_374, Icur := OriginalRow227TriangleData1472.coefficient116_373,
    output := OriginalRow227TriangleData1481.coefficient117_373, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1472.coefficient116_375, Icur := OriginalRow227TriangleData1472.coefficient116_374,
    output := OriginalRow227TriangleData1481.coefficient117_374, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1472.coefficient116_376, Icur := OriginalRow227TriangleData1472.coefficient116_375,
    output := OriginalRow227TriangleData1481.coefficient117_375, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1472.coefficient116_377, Icur := OriginalRow227TriangleData1472.coefficient116_376,
    output := OriginalRow227TriangleData1481.coefficient117_376, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1472.coefficient116_378, Icur := OriginalRow227TriangleData1472.coefficient116_377,
    output := OriginalRow227TriangleData1481.coefficient117_377, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1472.coefficient116_379, Icur := OriginalRow227TriangleData1472.coefficient116_378,
    output := OriginalRow227TriangleData1481.coefficient117_378, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1472.coefficient116_380, Icur := OriginalRow227TriangleData1472.coefficient116_379,
    output := OriginalRow227TriangleData1481.coefficient117_379, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1472.coefficient116_381, Icur := OriginalRow227TriangleData1472.coefficient116_380,
    output := OriginalRow227TriangleData1481.coefficient117_380, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1472.coefficient116_382, Icur := OriginalRow227TriangleData1472.coefficient116_381,
    output := OriginalRow227TriangleData1481.coefficient117_381, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1472.coefficient116_383, Icur := OriginalRow227TriangleData1472.coefficient116_382,
    output := OriginalRow227TriangleData1481.coefficient117_382, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1472.coefficient116_384, Icur := OriginalRow227TriangleData1472.coefficient116_383,
    output := OriginalRow227TriangleData1481.coefficient117_383, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots03.root117,
    Inext := OriginalRow227TriangleData1472.coefficient116_385, Icur := OriginalRow227TriangleData1472.coefficient116_384,
    output := OriginalRow227TriangleData1481.coefficient117_384, hC := OriginalRow227TriangleRoots03.root117_pos, hAC := OriginalRow227TriangleRoots03.product117_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1465

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1465.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

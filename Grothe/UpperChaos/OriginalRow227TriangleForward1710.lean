import Grothe.UpperChaos.OriginalRow227TriangleData1719
import Grothe.UpperChaos.OriginalRow227TriangleData1726
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1710
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1719.coefficient147_340, Icur := OriginalRow227TriangleData1719.coefficient147_339,
    output := OriginalRow227TriangleData1726.coefficient148_339, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1719.coefficient147_341, Icur := OriginalRow227TriangleData1719.coefficient147_340,
    output := OriginalRow227TriangleData1726.coefficient148_340, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1719.coefficient147_342, Icur := OriginalRow227TriangleData1719.coefficient147_341,
    output := OriginalRow227TriangleData1726.coefficient148_341, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1719.coefficient147_343, Icur := OriginalRow227TriangleData1719.coefficient147_342,
    output := OriginalRow227TriangleData1726.coefficient148_342, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1719.coefficient147_344, Icur := OriginalRow227TriangleData1719.coefficient147_343,
    output := OriginalRow227TriangleData1726.coefficient148_343, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1719.coefficient147_345, Icur := OriginalRow227TriangleData1719.coefficient147_344,
    output := OriginalRow227TriangleData1726.coefficient148_344, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1719.coefficient147_346, Icur := OriginalRow227TriangleData1719.coefficient147_345,
    output := OriginalRow227TriangleData1726.coefficient148_345, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1719.coefficient147_347, Icur := OriginalRow227TriangleData1719.coefficient147_346,
    output := OriginalRow227TriangleData1726.coefficient148_346, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1719.coefficient147_348, Icur := OriginalRow227TriangleData1719.coefficient147_347,
    output := OriginalRow227TriangleData1726.coefficient148_347, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1719.coefficient147_349, Icur := OriginalRow227TriangleData1719.coefficient147_348,
    output := OriginalRow227TriangleData1726.coefficient148_348, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1719.coefficient147_350, Icur := OriginalRow227TriangleData1719.coefficient147_349,
    output := OriginalRow227TriangleData1726.coefficient148_349, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1719.coefficient147_351, Icur := OriginalRow227TriangleData1719.coefficient147_350,
    output := OriginalRow227TriangleData1726.coefficient148_350, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1719.coefficient147_352, Icur := OriginalRow227TriangleData1719.coefficient147_351,
    output := OriginalRow227TriangleData1726.coefficient148_351, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1719.coefficient147_353, Icur := OriginalRow227TriangleData1719.coefficient147_352,
    output := OriginalRow227TriangleData1726.coefficient148_352, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1719.coefficient147_354, Icur := OriginalRow227TriangleData1719.coefficient147_353,
    output := OriginalRow227TriangleData1726.coefficient148_353, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1710

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1710.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

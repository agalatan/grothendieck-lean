import Grothe.UpperChaos.OriginalRow227TriangleData1705
import Grothe.UpperChaos.OriginalRow227TriangleData1712
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1696
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_338, Icur := OriginalRow227TriangleData1705.coefficient145_337,
    output := OriginalRow227TriangleData1712.coefficient146_337, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_339, Icur := OriginalRow227TriangleData1705.coefficient145_338,
    output := OriginalRow227TriangleData1712.coefficient146_338, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_340, Icur := OriginalRow227TriangleData1705.coefficient145_339,
    output := OriginalRow227TriangleData1712.coefficient146_339, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_341, Icur := OriginalRow227TriangleData1705.coefficient145_340,
    output := OriginalRow227TriangleData1712.coefficient146_340, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_342, Icur := OriginalRow227TriangleData1705.coefficient145_341,
    output := OriginalRow227TriangleData1712.coefficient146_341, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_343, Icur := OriginalRow227TriangleData1705.coefficient145_342,
    output := OriginalRow227TriangleData1712.coefficient146_342, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_344, Icur := OriginalRow227TriangleData1705.coefficient145_343,
    output := OriginalRow227TriangleData1712.coefficient146_343, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_345, Icur := OriginalRow227TriangleData1705.coefficient145_344,
    output := OriginalRow227TriangleData1712.coefficient146_344, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_346, Icur := OriginalRow227TriangleData1705.coefficient145_345,
    output := OriginalRow227TriangleData1712.coefficient146_345, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_347, Icur := OriginalRow227TriangleData1705.coefficient145_346,
    output := OriginalRow227TriangleData1712.coefficient146_346, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_348, Icur := OriginalRow227TriangleData1705.coefficient145_347,
    output := OriginalRow227TriangleData1712.coefficient146_347, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_349, Icur := OriginalRow227TriangleData1705.coefficient145_348,
    output := OriginalRow227TriangleData1712.coefficient146_348, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_350, Icur := OriginalRow227TriangleData1705.coefficient145_349,
    output := OriginalRow227TriangleData1712.coefficient146_349, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_351, Icur := OriginalRow227TriangleData1705.coefficient145_350,
    output := OriginalRow227TriangleData1712.coefficient146_350, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_352, Icur := OriginalRow227TriangleData1705.coefficient145_351,
    output := OriginalRow227TriangleData1712.coefficient146_351, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_353, Icur := OriginalRow227TriangleData1705.coefficient145_352,
    output := OriginalRow227TriangleData1712.coefficient146_352, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_354, Icur := OriginalRow227TriangleData1705.coefficient145_353,
    output := OriginalRow227TriangleData1712.coefficient146_353, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_355, Icur := OriginalRow227TriangleData1705.coefficient145_354,
    output := OriginalRow227TriangleData1712.coefficient146_354, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots04.root146,
    Inext := OriginalRow227TriangleData1705.coefficient145_356, Icur := OriginalRow227TriangleData1705.coefficient145_355,
    output := OriginalRow227TriangleData1712.coefficient146_355, hC := OriginalRow227TriangleRoots04.root146_pos, hAC := OriginalRow227TriangleRoots04.product146_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1696

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1696.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

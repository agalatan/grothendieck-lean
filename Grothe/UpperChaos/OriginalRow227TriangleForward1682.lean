import Grothe.UpperChaos.OriginalRow227TriangleData1691
import Grothe.UpperChaos.OriginalRow227TriangleData1698
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1682
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_336, Icur := OriginalRow227TriangleData1691.coefficient143_335,
    output := OriginalRow227TriangleData1698.coefficient144_335, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_337, Icur := OriginalRow227TriangleData1691.coefficient143_336,
    output := OriginalRow227TriangleData1698.coefficient144_336, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_338, Icur := OriginalRow227TriangleData1691.coefficient143_337,
    output := OriginalRow227TriangleData1698.coefficient144_337, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_339, Icur := OriginalRow227TriangleData1691.coefficient143_338,
    output := OriginalRow227TriangleData1698.coefficient144_338, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_340, Icur := OriginalRow227TriangleData1691.coefficient143_339,
    output := OriginalRow227TriangleData1698.coefficient144_339, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_341, Icur := OriginalRow227TriangleData1691.coefficient143_340,
    output := OriginalRow227TriangleData1698.coefficient144_340, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_342, Icur := OriginalRow227TriangleData1691.coefficient143_341,
    output := OriginalRow227TriangleData1698.coefficient144_341, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_343, Icur := OriginalRow227TriangleData1691.coefficient143_342,
    output := OriginalRow227TriangleData1698.coefficient144_342, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_344, Icur := OriginalRow227TriangleData1691.coefficient143_343,
    output := OriginalRow227TriangleData1698.coefficient144_343, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_345, Icur := OriginalRow227TriangleData1691.coefficient143_344,
    output := OriginalRow227TriangleData1698.coefficient144_344, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_346, Icur := OriginalRow227TriangleData1691.coefficient143_345,
    output := OriginalRow227TriangleData1698.coefficient144_345, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_347, Icur := OriginalRow227TriangleData1691.coefficient143_346,
    output := OriginalRow227TriangleData1698.coefficient144_346, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_348, Icur := OriginalRow227TriangleData1691.coefficient143_347,
    output := OriginalRow227TriangleData1698.coefficient144_347, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_349, Icur := OriginalRow227TriangleData1691.coefficient143_348,
    output := OriginalRow227TriangleData1698.coefficient144_348, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_350, Icur := OriginalRow227TriangleData1691.coefficient143_349,
    output := OriginalRow227TriangleData1698.coefficient144_349, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_351, Icur := OriginalRow227TriangleData1691.coefficient143_350,
    output := OriginalRow227TriangleData1698.coefficient144_350, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_352, Icur := OriginalRow227TriangleData1691.coefficient143_351,
    output := OriginalRow227TriangleData1698.coefficient144_351, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_353, Icur := OriginalRow227TriangleData1691.coefficient143_352,
    output := OriginalRow227TriangleData1698.coefficient144_352, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_354, Icur := OriginalRow227TriangleData1691.coefficient143_353,
    output := OriginalRow227TriangleData1698.coefficient144_353, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_355, Icur := OriginalRow227TriangleData1691.coefficient143_354,
    output := OriginalRow227TriangleData1698.coefficient144_354, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_356, Icur := OriginalRow227TriangleData1691.coefficient143_355,
    output := OriginalRow227TriangleData1698.coefficient144_355, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_357, Icur := OriginalRow227TriangleData1691.coefficient143_356,
    output := OriginalRow227TriangleData1698.coefficient144_356, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1691.coefficient143_358, Icur := OriginalRow227TriangleData1691.coefficient143_357,
    output := OriginalRow227TriangleData1698.coefficient144_357, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1682

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1682.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

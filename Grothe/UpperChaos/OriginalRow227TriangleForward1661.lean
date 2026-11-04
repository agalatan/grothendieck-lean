import Grothe.UpperChaos.OriginalRow227TriangleData1670
import Grothe.UpperChaos.OriginalRow227TriangleData1677
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1661
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_333, Icur := OriginalRow227TriangleData1670.coefficient140_332,
    output := OriginalRow227TriangleData1677.coefficient141_332, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_334, Icur := OriginalRow227TriangleData1670.coefficient140_333,
    output := OriginalRow227TriangleData1677.coefficient141_333, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_335, Icur := OriginalRow227TriangleData1670.coefficient140_334,
    output := OriginalRow227TriangleData1677.coefficient141_334, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_336, Icur := OriginalRow227TriangleData1670.coefficient140_335,
    output := OriginalRow227TriangleData1677.coefficient141_335, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_337, Icur := OriginalRow227TriangleData1670.coefficient140_336,
    output := OriginalRow227TriangleData1677.coefficient141_336, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_338, Icur := OriginalRow227TriangleData1670.coefficient140_337,
    output := OriginalRow227TriangleData1677.coefficient141_337, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_339, Icur := OriginalRow227TriangleData1670.coefficient140_338,
    output := OriginalRow227TriangleData1677.coefficient141_338, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_340, Icur := OriginalRow227TriangleData1670.coefficient140_339,
    output := OriginalRow227TriangleData1677.coefficient141_339, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_341, Icur := OriginalRow227TriangleData1670.coefficient140_340,
    output := OriginalRow227TriangleData1677.coefficient141_340, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_342, Icur := OriginalRow227TriangleData1670.coefficient140_341,
    output := OriginalRow227TriangleData1677.coefficient141_341, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_343, Icur := OriginalRow227TriangleData1670.coefficient140_342,
    output := OriginalRow227TriangleData1677.coefficient141_342, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_344, Icur := OriginalRow227TriangleData1670.coefficient140_343,
    output := OriginalRow227TriangleData1677.coefficient141_343, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_345, Icur := OriginalRow227TriangleData1670.coefficient140_344,
    output := OriginalRow227TriangleData1677.coefficient141_344, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_346, Icur := OriginalRow227TriangleData1670.coefficient140_345,
    output := OriginalRow227TriangleData1677.coefficient141_345, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_347, Icur := OriginalRow227TriangleData1670.coefficient140_346,
    output := OriginalRow227TriangleData1677.coefficient141_346, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_348, Icur := OriginalRow227TriangleData1670.coefficient140_347,
    output := OriginalRow227TriangleData1677.coefficient141_347, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_349, Icur := OriginalRow227TriangleData1670.coefficient140_348,
    output := OriginalRow227TriangleData1677.coefficient141_348, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_350, Icur := OriginalRow227TriangleData1670.coefficient140_349,
    output := OriginalRow227TriangleData1677.coefficient141_349, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_351, Icur := OriginalRow227TriangleData1670.coefficient140_350,
    output := OriginalRow227TriangleData1677.coefficient141_350, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_352, Icur := OriginalRow227TriangleData1670.coefficient140_351,
    output := OriginalRow227TriangleData1677.coefficient141_351, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_353, Icur := OriginalRow227TriangleData1670.coefficient140_352,
    output := OriginalRow227TriangleData1677.coefficient141_352, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_354, Icur := OriginalRow227TriangleData1670.coefficient140_353,
    output := OriginalRow227TriangleData1677.coefficient141_353, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_355, Icur := OriginalRow227TriangleData1670.coefficient140_354,
    output := OriginalRow227TriangleData1677.coefficient141_354, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_356, Icur := OriginalRow227TriangleData1670.coefficient140_355,
    output := OriginalRow227TriangleData1677.coefficient141_355, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_357, Icur := OriginalRow227TriangleData1670.coefficient140_356,
    output := OriginalRow227TriangleData1677.coefficient141_356, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_358, Icur := OriginalRow227TriangleData1670.coefficient140_357,
    output := OriginalRow227TriangleData1677.coefficient141_357, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_359, Icur := OriginalRow227TriangleData1670.coefficient140_358,
    output := OriginalRow227TriangleData1677.coefficient141_358, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_360, Icur := OriginalRow227TriangleData1670.coefficient140_359,
    output := OriginalRow227TriangleData1677.coefficient141_359, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1670.coefficient140_361, Icur := OriginalRow227TriangleData1670.coefficient140_360,
    output := OriginalRow227TriangleData1677.coefficient141_360, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1661

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1661.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

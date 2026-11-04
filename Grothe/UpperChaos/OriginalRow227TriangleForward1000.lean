import Grothe.UpperChaos.OriginalRow227TriangleData1004
import Grothe.UpperChaos.OriginalRow227TriangleData1005
import Grothe.UpperChaos.OriginalRow227TriangleData1016
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1000
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_328, Icur := OriginalRow227TriangleData1004.coefficient71_327,
    output := OriginalRow227TriangleData1016.coefficient72_327, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_329, Icur := OriginalRow227TriangleData1004.coefficient71_328,
    output := OriginalRow227TriangleData1016.coefficient72_328, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_330, Icur := OriginalRow227TriangleData1004.coefficient71_329,
    output := OriginalRow227TriangleData1016.coefficient72_329, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_331, Icur := OriginalRow227TriangleData1004.coefficient71_330,
    output := OriginalRow227TriangleData1016.coefficient72_330, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_332, Icur := OriginalRow227TriangleData1004.coefficient71_331,
    output := OriginalRow227TriangleData1016.coefficient72_331, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_333, Icur := OriginalRow227TriangleData1004.coefficient71_332,
    output := OriginalRow227TriangleData1016.coefficient72_332, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_334, Icur := OriginalRow227TriangleData1004.coefficient71_333,
    output := OriginalRow227TriangleData1016.coefficient72_333, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_335, Icur := OriginalRow227TriangleData1004.coefficient71_334,
    output := OriginalRow227TriangleData1016.coefficient72_334, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_336, Icur := OriginalRow227TriangleData1004.coefficient71_335,
    output := OriginalRow227TriangleData1016.coefficient72_335, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_337, Icur := OriginalRow227TriangleData1004.coefficient71_336,
    output := OriginalRow227TriangleData1016.coefficient72_336, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_338, Icur := OriginalRow227TriangleData1004.coefficient71_337,
    output := OriginalRow227TriangleData1016.coefficient72_337, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_339, Icur := OriginalRow227TriangleData1004.coefficient71_338,
    output := OriginalRow227TriangleData1016.coefficient72_338, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_340, Icur := OriginalRow227TriangleData1004.coefficient71_339,
    output := OriginalRow227TriangleData1016.coefficient72_339, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_341, Icur := OriginalRow227TriangleData1004.coefficient71_340,
    output := OriginalRow227TriangleData1016.coefficient72_340, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_342, Icur := OriginalRow227TriangleData1004.coefficient71_341,
    output := OriginalRow227TriangleData1016.coefficient72_341, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_343, Icur := OriginalRow227TriangleData1004.coefficient71_342,
    output := OriginalRow227TriangleData1016.coefficient72_342, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_344, Icur := OriginalRow227TriangleData1004.coefficient71_343,
    output := OriginalRow227TriangleData1016.coefficient72_343, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_345, Icur := OriginalRow227TriangleData1004.coefficient71_344,
    output := OriginalRow227TriangleData1016.coefficient72_344, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_346, Icur := OriginalRow227TriangleData1004.coefficient71_345,
    output := OriginalRow227TriangleData1016.coefficient72_345, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_347, Icur := OriginalRow227TriangleData1004.coefficient71_346,
    output := OriginalRow227TriangleData1016.coefficient72_346, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_348, Icur := OriginalRow227TriangleData1004.coefficient71_347,
    output := OriginalRow227TriangleData1016.coefficient72_347, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_349, Icur := OriginalRow227TriangleData1004.coefficient71_348,
    output := OriginalRow227TriangleData1016.coefficient72_348, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_350, Icur := OriginalRow227TriangleData1004.coefficient71_349,
    output := OriginalRow227TriangleData1016.coefficient72_349, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_351, Icur := OriginalRow227TriangleData1004.coefficient71_350,
    output := OriginalRow227TriangleData1016.coefficient72_350, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_352, Icur := OriginalRow227TriangleData1004.coefficient71_351,
    output := OriginalRow227TriangleData1016.coefficient72_351, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_353, Icur := OriginalRow227TriangleData1004.coefficient71_352,
    output := OriginalRow227TriangleData1016.coefficient72_352, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_354, Icur := OriginalRow227TriangleData1004.coefficient71_353,
    output := OriginalRow227TriangleData1016.coefficient72_353, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_355, Icur := OriginalRow227TriangleData1004.coefficient71_354,
    output := OriginalRow227TriangleData1016.coefficient72_354, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_356, Icur := OriginalRow227TriangleData1004.coefficient71_355,
    output := OriginalRow227TriangleData1016.coefficient72_355, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1004.coefficient71_357, Icur := OriginalRow227TriangleData1004.coefficient71_356,
    output := OriginalRow227TriangleData1016.coefficient72_356, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1005.coefficient71_358, Icur := OriginalRow227TriangleData1004.coefficient71_357,
    output := OriginalRow227TriangleData1016.coefficient72_357, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1005.coefficient71_359, Icur := OriginalRow227TriangleData1005.coefficient71_358,
    output := OriginalRow227TriangleData1016.coefficient72_358, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1000

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1000.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

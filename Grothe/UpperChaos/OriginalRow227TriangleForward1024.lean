import Grothe.UpperChaos.OriginalRow227TriangleData1028
import Grothe.UpperChaos.OriginalRow227TriangleData1029
import Grothe.UpperChaos.OriginalRow227TriangleData1040
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1024
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_330, Icur := OriginalRow227TriangleData1028.coefficient73_329,
    output := OriginalRow227TriangleData1040.coefficient74_329, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_331, Icur := OriginalRow227TriangleData1028.coefficient73_330,
    output := OriginalRow227TriangleData1040.coefficient74_330, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_332, Icur := OriginalRow227TriangleData1028.coefficient73_331,
    output := OriginalRow227TriangleData1040.coefficient74_331, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_333, Icur := OriginalRow227TriangleData1028.coefficient73_332,
    output := OriginalRow227TriangleData1040.coefficient74_332, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_334, Icur := OriginalRow227TriangleData1028.coefficient73_333,
    output := OriginalRow227TriangleData1040.coefficient74_333, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_335, Icur := OriginalRow227TriangleData1028.coefficient73_334,
    output := OriginalRow227TriangleData1040.coefficient74_334, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_336, Icur := OriginalRow227TriangleData1028.coefficient73_335,
    output := OriginalRow227TriangleData1040.coefficient74_335, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_337, Icur := OriginalRow227TriangleData1028.coefficient73_336,
    output := OriginalRow227TriangleData1040.coefficient74_336, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_338, Icur := OriginalRow227TriangleData1028.coefficient73_337,
    output := OriginalRow227TriangleData1040.coefficient74_337, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_339, Icur := OriginalRow227TriangleData1028.coefficient73_338,
    output := OriginalRow227TriangleData1040.coefficient74_338, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_340, Icur := OriginalRow227TriangleData1028.coefficient73_339,
    output := OriginalRow227TriangleData1040.coefficient74_339, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_341, Icur := OriginalRow227TriangleData1028.coefficient73_340,
    output := OriginalRow227TriangleData1040.coefficient74_340, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_342, Icur := OriginalRow227TriangleData1028.coefficient73_341,
    output := OriginalRow227TriangleData1040.coefficient74_341, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_343, Icur := OriginalRow227TriangleData1028.coefficient73_342,
    output := OriginalRow227TriangleData1040.coefficient74_342, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_344, Icur := OriginalRow227TriangleData1028.coefficient73_343,
    output := OriginalRow227TriangleData1040.coefficient74_343, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_345, Icur := OriginalRow227TriangleData1028.coefficient73_344,
    output := OriginalRow227TriangleData1040.coefficient74_344, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_346, Icur := OriginalRow227TriangleData1028.coefficient73_345,
    output := OriginalRow227TriangleData1040.coefficient74_345, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_347, Icur := OriginalRow227TriangleData1028.coefficient73_346,
    output := OriginalRow227TriangleData1040.coefficient74_346, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_348, Icur := OriginalRow227TriangleData1028.coefficient73_347,
    output := OriginalRow227TriangleData1040.coefficient74_347, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_349, Icur := OriginalRow227TriangleData1028.coefficient73_348,
    output := OriginalRow227TriangleData1040.coefficient74_348, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_350, Icur := OriginalRow227TriangleData1028.coefficient73_349,
    output := OriginalRow227TriangleData1040.coefficient74_349, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_351, Icur := OriginalRow227TriangleData1028.coefficient73_350,
    output := OriginalRow227TriangleData1040.coefficient74_350, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_352, Icur := OriginalRow227TriangleData1028.coefficient73_351,
    output := OriginalRow227TriangleData1040.coefficient74_351, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_353, Icur := OriginalRow227TriangleData1028.coefficient73_352,
    output := OriginalRow227TriangleData1040.coefficient74_352, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_354, Icur := OriginalRow227TriangleData1028.coefficient73_353,
    output := OriginalRow227TriangleData1040.coefficient74_353, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_355, Icur := OriginalRow227TriangleData1028.coefficient73_354,
    output := OriginalRow227TriangleData1040.coefficient74_354, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_356, Icur := OriginalRow227TriangleData1028.coefficient73_355,
    output := OriginalRow227TriangleData1040.coefficient74_355, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_357, Icur := OriginalRow227TriangleData1028.coefficient73_356,
    output := OriginalRow227TriangleData1040.coefficient74_356, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_358, Icur := OriginalRow227TriangleData1028.coefficient73_357,
    output := OriginalRow227TriangleData1040.coefficient74_357, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1028.coefficient73_359, Icur := OriginalRow227TriangleData1028.coefficient73_358,
    output := OriginalRow227TriangleData1040.coefficient74_358, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_360, Icur := OriginalRow227TriangleData1028.coefficient73_359,
    output := OriginalRow227TriangleData1040.coefficient74_359, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_361, Icur := OriginalRow227TriangleData1029.coefficient73_360,
    output := OriginalRow227TriangleData1040.coefficient74_360, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1024

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1024.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

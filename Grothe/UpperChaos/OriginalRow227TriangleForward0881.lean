import Grothe.UpperChaos.OriginalRow227TriangleData0885
import Grothe.UpperChaos.OriginalRow227TriangleData0886
import Grothe.UpperChaos.OriginalRow227TriangleData0897
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0881
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_350, Icur := OriginalRow227TriangleData0885.coefficient61_349,
    output := OriginalRow227TriangleData0897.coefficient62_349, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_351, Icur := OriginalRow227TriangleData0885.coefficient61_350,
    output := OriginalRow227TriangleData0897.coefficient62_350, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_352, Icur := OriginalRow227TriangleData0885.coefficient61_351,
    output := OriginalRow227TriangleData0897.coefficient62_351, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_353, Icur := OriginalRow227TriangleData0885.coefficient61_352,
    output := OriginalRow227TriangleData0897.coefficient62_352, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_354, Icur := OriginalRow227TriangleData0885.coefficient61_353,
    output := OriginalRow227TriangleData0897.coefficient62_353, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_355, Icur := OriginalRow227TriangleData0885.coefficient61_354,
    output := OriginalRow227TriangleData0897.coefficient62_354, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_356, Icur := OriginalRow227TriangleData0885.coefficient61_355,
    output := OriginalRow227TriangleData0897.coefficient62_355, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_357, Icur := OriginalRow227TriangleData0885.coefficient61_356,
    output := OriginalRow227TriangleData0897.coefficient62_356, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_358, Icur := OriginalRow227TriangleData0885.coefficient61_357,
    output := OriginalRow227TriangleData0897.coefficient62_357, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_359, Icur := OriginalRow227TriangleData0885.coefficient61_358,
    output := OriginalRow227TriangleData0897.coefficient62_358, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_360, Icur := OriginalRow227TriangleData0885.coefficient61_359,
    output := OriginalRow227TriangleData0897.coefficient62_359, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_361, Icur := OriginalRow227TriangleData0885.coefficient61_360,
    output := OriginalRow227TriangleData0897.coefficient62_360, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_362, Icur := OriginalRow227TriangleData0885.coefficient61_361,
    output := OriginalRow227TriangleData0897.coefficient62_361, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_363, Icur := OriginalRow227TriangleData0885.coefficient61_362,
    output := OriginalRow227TriangleData0897.coefficient62_362, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_364, Icur := OriginalRow227TriangleData0885.coefficient61_363,
    output := OriginalRow227TriangleData0897.coefficient62_363, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_365, Icur := OriginalRow227TriangleData0885.coefficient61_364,
    output := OriginalRow227TriangleData0897.coefficient62_364, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_366, Icur := OriginalRow227TriangleData0885.coefficient61_365,
    output := OriginalRow227TriangleData0897.coefficient62_365, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_367, Icur := OriginalRow227TriangleData0885.coefficient61_366,
    output := OriginalRow227TriangleData0897.coefficient62_366, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_368, Icur := OriginalRow227TriangleData0885.coefficient61_367,
    output := OriginalRow227TriangleData0897.coefficient62_367, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_369, Icur := OriginalRow227TriangleData0885.coefficient61_368,
    output := OriginalRow227TriangleData0897.coefficient62_368, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_370, Icur := OriginalRow227TriangleData0885.coefficient61_369,
    output := OriginalRow227TriangleData0897.coefficient62_369, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_371, Icur := OriginalRow227TriangleData0885.coefficient61_370,
    output := OriginalRow227TriangleData0897.coefficient62_370, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_372, Icur := OriginalRow227TriangleData0885.coefficient61_371,
    output := OriginalRow227TriangleData0897.coefficient62_371, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_373, Icur := OriginalRow227TriangleData0885.coefficient61_372,
    output := OriginalRow227TriangleData0897.coefficient62_372, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_374, Icur := OriginalRow227TriangleData0885.coefficient61_373,
    output := OriginalRow227TriangleData0897.coefficient62_373, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_375, Icur := OriginalRow227TriangleData0885.coefficient61_374,
    output := OriginalRow227TriangleData0897.coefficient62_374, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_376, Icur := OriginalRow227TriangleData0885.coefficient61_375,
    output := OriginalRow227TriangleData0897.coefficient62_375, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_377, Icur := OriginalRow227TriangleData0885.coefficient61_376,
    output := OriginalRow227TriangleData0897.coefficient62_376, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_378, Icur := OriginalRow227TriangleData0885.coefficient61_377,
    output := OriginalRow227TriangleData0897.coefficient62_377, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0885.coefficient61_379, Icur := OriginalRow227TriangleData0885.coefficient61_378,
    output := OriginalRow227TriangleData0897.coefficient62_378, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_380, Icur := OriginalRow227TriangleData0885.coefficient61_379,
    output := OriginalRow227TriangleData0897.coefficient62_379, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0886.coefficient61_381, Icur := OriginalRow227TriangleData0886.coefficient61_380,
    output := OriginalRow227TriangleData0897.coefficient62_380, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0881

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0881.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

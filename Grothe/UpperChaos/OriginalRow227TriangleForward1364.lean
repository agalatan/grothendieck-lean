import Grothe.UpperChaos.OriginalRow227TriangleData1370
import Grothe.UpperChaos.OriginalRow227TriangleData1371
import Grothe.UpperChaos.OriginalRow227TriangleData1380
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1364
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_362, Icur := OriginalRow227TriangleData1370.coefficient105_361,
    output := OriginalRow227TriangleData1380.coefficient106_361, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_363, Icur := OriginalRow227TriangleData1370.coefficient105_362,
    output := OriginalRow227TriangleData1380.coefficient106_362, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_364, Icur := OriginalRow227TriangleData1370.coefficient105_363,
    output := OriginalRow227TriangleData1380.coefficient106_363, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_365, Icur := OriginalRow227TriangleData1370.coefficient105_364,
    output := OriginalRow227TriangleData1380.coefficient106_364, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_366, Icur := OriginalRow227TriangleData1370.coefficient105_365,
    output := OriginalRow227TriangleData1380.coefficient106_365, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_367, Icur := OriginalRow227TriangleData1370.coefficient105_366,
    output := OriginalRow227TriangleData1380.coefficient106_366, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_368, Icur := OriginalRow227TriangleData1370.coefficient105_367,
    output := OriginalRow227TriangleData1380.coefficient106_367, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_369, Icur := OriginalRow227TriangleData1370.coefficient105_368,
    output := OriginalRow227TriangleData1380.coefficient106_368, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_370, Icur := OriginalRow227TriangleData1370.coefficient105_369,
    output := OriginalRow227TriangleData1380.coefficient106_369, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_371, Icur := OriginalRow227TriangleData1370.coefficient105_370,
    output := OriginalRow227TriangleData1380.coefficient106_370, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_372, Icur := OriginalRow227TriangleData1370.coefficient105_371,
    output := OriginalRow227TriangleData1380.coefficient106_371, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_373, Icur := OriginalRow227TriangleData1370.coefficient105_372,
    output := OriginalRow227TriangleData1380.coefficient106_372, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_374, Icur := OriginalRow227TriangleData1370.coefficient105_373,
    output := OriginalRow227TriangleData1380.coefficient106_373, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_375, Icur := OriginalRow227TriangleData1370.coefficient105_374,
    output := OriginalRow227TriangleData1380.coefficient106_374, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_376, Icur := OriginalRow227TriangleData1370.coefficient105_375,
    output := OriginalRow227TriangleData1380.coefficient106_375, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_377, Icur := OriginalRow227TriangleData1370.coefficient105_376,
    output := OriginalRow227TriangleData1380.coefficient106_376, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_378, Icur := OriginalRow227TriangleData1370.coefficient105_377,
    output := OriginalRow227TriangleData1380.coefficient106_377, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_379, Icur := OriginalRow227TriangleData1370.coefficient105_378,
    output := OriginalRow227TriangleData1380.coefficient106_378, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_380, Icur := OriginalRow227TriangleData1370.coefficient105_379,
    output := OriginalRow227TriangleData1380.coefficient106_379, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_381, Icur := OriginalRow227TriangleData1370.coefficient105_380,
    output := OriginalRow227TriangleData1380.coefficient106_380, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_382, Icur := OriginalRow227TriangleData1370.coefficient105_381,
    output := OriginalRow227TriangleData1380.coefficient106_381, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_383, Icur := OriginalRow227TriangleData1370.coefficient105_382,
    output := OriginalRow227TriangleData1380.coefficient106_382, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_384, Icur := OriginalRow227TriangleData1370.coefficient105_383,
    output := OriginalRow227TriangleData1380.coefficient106_383, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_385, Icur := OriginalRow227TriangleData1370.coefficient105_384,
    output := OriginalRow227TriangleData1380.coefficient106_384, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_386, Icur := OriginalRow227TriangleData1370.coefficient105_385,
    output := OriginalRow227TriangleData1380.coefficient106_385, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_387, Icur := OriginalRow227TriangleData1370.coefficient105_386,
    output := OriginalRow227TriangleData1380.coefficient106_386, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_388, Icur := OriginalRow227TriangleData1370.coefficient105_387,
    output := OriginalRow227TriangleData1380.coefficient106_387, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_389, Icur := OriginalRow227TriangleData1370.coefficient105_388,
    output := OriginalRow227TriangleData1380.coefficient106_388, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_390, Icur := OriginalRow227TriangleData1370.coefficient105_389,
    output := OriginalRow227TriangleData1380.coefficient106_389, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1370.coefficient105_391, Icur := OriginalRow227TriangleData1370.coefficient105_390,
    output := OriginalRow227TriangleData1380.coefficient106_390, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1371.coefficient105_392, Icur := OriginalRow227TriangleData1370.coefficient105_391,
    output := OriginalRow227TriangleData1380.coefficient106_391, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots03.root106,
    Inext := OriginalRow227TriangleData1371.coefficient105_393, Icur := OriginalRow227TriangleData1371.coefficient105_392,
    output := OriginalRow227TriangleData1380.coefficient106_392, hC := OriginalRow227TriangleRoots03.root106_pos, hAC := OriginalRow227TriangleRoots03.product106_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1364

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1364.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

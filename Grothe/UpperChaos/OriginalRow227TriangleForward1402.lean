import Grothe.UpperChaos.OriginalRow227TriangleData1409
import Grothe.UpperChaos.OriginalRow227TriangleData1418
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1402
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_366, Icur := OriginalRow227TriangleData1409.coefficient109_365,
    output := OriginalRow227TriangleData1418.coefficient110_365, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_367, Icur := OriginalRow227TriangleData1409.coefficient109_366,
    output := OriginalRow227TriangleData1418.coefficient110_366, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_368, Icur := OriginalRow227TriangleData1409.coefficient109_367,
    output := OriginalRow227TriangleData1418.coefficient110_367, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_369, Icur := OriginalRow227TriangleData1409.coefficient109_368,
    output := OriginalRow227TriangleData1418.coefficient110_368, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_370, Icur := OriginalRow227TriangleData1409.coefficient109_369,
    output := OriginalRow227TriangleData1418.coefficient110_369, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_371, Icur := OriginalRow227TriangleData1409.coefficient109_370,
    output := OriginalRow227TriangleData1418.coefficient110_370, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_372, Icur := OriginalRow227TriangleData1409.coefficient109_371,
    output := OriginalRow227TriangleData1418.coefficient110_371, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_373, Icur := OriginalRow227TriangleData1409.coefficient109_372,
    output := OriginalRow227TriangleData1418.coefficient110_372, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_374, Icur := OriginalRow227TriangleData1409.coefficient109_373,
    output := OriginalRow227TriangleData1418.coefficient110_373, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_375, Icur := OriginalRow227TriangleData1409.coefficient109_374,
    output := OriginalRow227TriangleData1418.coefficient110_374, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_376, Icur := OriginalRow227TriangleData1409.coefficient109_375,
    output := OriginalRow227TriangleData1418.coefficient110_375, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_377, Icur := OriginalRow227TriangleData1409.coefficient109_376,
    output := OriginalRow227TriangleData1418.coefficient110_376, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_378, Icur := OriginalRow227TriangleData1409.coefficient109_377,
    output := OriginalRow227TriangleData1418.coefficient110_377, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_379, Icur := OriginalRow227TriangleData1409.coefficient109_378,
    output := OriginalRow227TriangleData1418.coefficient110_378, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_380, Icur := OriginalRow227TriangleData1409.coefficient109_379,
    output := OriginalRow227TriangleData1418.coefficient110_379, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_381, Icur := OriginalRow227TriangleData1409.coefficient109_380,
    output := OriginalRow227TriangleData1418.coefficient110_380, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_382, Icur := OriginalRow227TriangleData1409.coefficient109_381,
    output := OriginalRow227TriangleData1418.coefficient110_381, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_383, Icur := OriginalRow227TriangleData1409.coefficient109_382,
    output := OriginalRow227TriangleData1418.coefficient110_382, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_384, Icur := OriginalRow227TriangleData1409.coefficient109_383,
    output := OriginalRow227TriangleData1418.coefficient110_383, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_385, Icur := OriginalRow227TriangleData1409.coefficient109_384,
    output := OriginalRow227TriangleData1418.coefficient110_384, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_386, Icur := OriginalRow227TriangleData1409.coefficient109_385,
    output := OriginalRow227TriangleData1418.coefficient110_385, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_387, Icur := OriginalRow227TriangleData1409.coefficient109_386,
    output := OriginalRow227TriangleData1418.coefficient110_386, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_388, Icur := OriginalRow227TriangleData1409.coefficient109_387,
    output := OriginalRow227TriangleData1418.coefficient110_387, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_389, Icur := OriginalRow227TriangleData1409.coefficient109_388,
    output := OriginalRow227TriangleData1418.coefficient110_388, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_390, Icur := OriginalRow227TriangleData1409.coefficient109_389,
    output := OriginalRow227TriangleData1418.coefficient110_389, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_391, Icur := OriginalRow227TriangleData1409.coefficient109_390,
    output := OriginalRow227TriangleData1418.coefficient110_390, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1409.coefficient109_392, Icur := OriginalRow227TriangleData1409.coefficient109_391,
    output := OriginalRow227TriangleData1418.coefficient110_391, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1402

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1402.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

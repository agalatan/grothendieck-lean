import Grothe.UpperChaos.OriginalRow227TriangleData1053
import Grothe.UpperChaos.OriginalRow227TriangleData1054
import Grothe.UpperChaos.OriginalRow227TriangleData1065
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1049
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_364, Icur := OriginalRow227TriangleData1053.coefficient75_363,
    output := OriginalRow227TriangleData1065.coefficient76_363, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_365, Icur := OriginalRow227TriangleData1053.coefficient75_364,
    output := OriginalRow227TriangleData1065.coefficient76_364, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_366, Icur := OriginalRow227TriangleData1053.coefficient75_365,
    output := OriginalRow227TriangleData1065.coefficient76_365, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_367, Icur := OriginalRow227TriangleData1053.coefficient75_366,
    output := OriginalRow227TriangleData1065.coefficient76_366, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_368, Icur := OriginalRow227TriangleData1053.coefficient75_367,
    output := OriginalRow227TriangleData1065.coefficient76_367, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_369, Icur := OriginalRow227TriangleData1053.coefficient75_368,
    output := OriginalRow227TriangleData1065.coefficient76_368, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_370, Icur := OriginalRow227TriangleData1053.coefficient75_369,
    output := OriginalRow227TriangleData1065.coefficient76_369, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_371, Icur := OriginalRow227TriangleData1053.coefficient75_370,
    output := OriginalRow227TriangleData1065.coefficient76_370, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_372, Icur := OriginalRow227TriangleData1053.coefficient75_371,
    output := OriginalRow227TriangleData1065.coefficient76_371, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_373, Icur := OriginalRow227TriangleData1053.coefficient75_372,
    output := OriginalRow227TriangleData1065.coefficient76_372, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_374, Icur := OriginalRow227TriangleData1053.coefficient75_373,
    output := OriginalRow227TriangleData1065.coefficient76_373, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_375, Icur := OriginalRow227TriangleData1053.coefficient75_374,
    output := OriginalRow227TriangleData1065.coefficient76_374, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_376, Icur := OriginalRow227TriangleData1053.coefficient75_375,
    output := OriginalRow227TriangleData1065.coefficient76_375, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_377, Icur := OriginalRow227TriangleData1053.coefficient75_376,
    output := OriginalRow227TriangleData1065.coefficient76_376, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_378, Icur := OriginalRow227TriangleData1053.coefficient75_377,
    output := OriginalRow227TriangleData1065.coefficient76_377, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_379, Icur := OriginalRow227TriangleData1053.coefficient75_378,
    output := OriginalRow227TriangleData1065.coefficient76_378, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_380, Icur := OriginalRow227TriangleData1053.coefficient75_379,
    output := OriginalRow227TriangleData1065.coefficient76_379, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_381, Icur := OriginalRow227TriangleData1053.coefficient75_380,
    output := OriginalRow227TriangleData1065.coefficient76_380, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_382, Icur := OriginalRow227TriangleData1053.coefficient75_381,
    output := OriginalRow227TriangleData1065.coefficient76_381, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_383, Icur := OriginalRow227TriangleData1053.coefficient75_382,
    output := OriginalRow227TriangleData1065.coefficient76_382, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_384, Icur := OriginalRow227TriangleData1053.coefficient75_383,
    output := OriginalRow227TriangleData1065.coefficient76_383, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_385, Icur := OriginalRow227TriangleData1053.coefficient75_384,
    output := OriginalRow227TriangleData1065.coefficient76_384, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_386, Icur := OriginalRow227TriangleData1053.coefficient75_385,
    output := OriginalRow227TriangleData1065.coefficient76_385, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_387, Icur := OriginalRow227TriangleData1053.coefficient75_386,
    output := OriginalRow227TriangleData1065.coefficient76_386, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_388, Icur := OriginalRow227TriangleData1053.coefficient75_387,
    output := OriginalRow227TriangleData1065.coefficient76_387, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_389, Icur := OriginalRow227TriangleData1053.coefficient75_388,
    output := OriginalRow227TriangleData1065.coefficient76_388, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_390, Icur := OriginalRow227TriangleData1053.coefficient75_389,
    output := OriginalRow227TriangleData1065.coefficient76_389, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_391, Icur := OriginalRow227TriangleData1053.coefficient75_390,
    output := OriginalRow227TriangleData1065.coefficient76_390, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_392, Icur := OriginalRow227TriangleData1053.coefficient75_391,
    output := OriginalRow227TriangleData1065.coefficient76_391, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1053.coefficient75_393, Icur := OriginalRow227TriangleData1053.coefficient75_392,
    output := OriginalRow227TriangleData1065.coefficient76_392, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1054.coefficient75_394, Icur := OriginalRow227TriangleData1053.coefficient75_393,
    output := OriginalRow227TriangleData1065.coefficient76_393, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1054.coefficient75_395, Icur := OriginalRow227TriangleData1054.coefficient75_394,
    output := OriginalRow227TriangleData1065.coefficient76_394, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1049

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1049.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData1208
import Grothe.UpperChaos.OriginalRow227TriangleData1209
import Grothe.UpperChaos.OriginalRow227TriangleData1219
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1203
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_378, Icur := OriginalRow227TriangleData1208.coefficient89_377,
    output := OriginalRow227TriangleData1219.coefficient90_377, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_379, Icur := OriginalRow227TriangleData1208.coefficient89_378,
    output := OriginalRow227TriangleData1219.coefficient90_378, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_380, Icur := OriginalRow227TriangleData1208.coefficient89_379,
    output := OriginalRow227TriangleData1219.coefficient90_379, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_381, Icur := OriginalRow227TriangleData1208.coefficient89_380,
    output := OriginalRow227TriangleData1219.coefficient90_380, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_382, Icur := OriginalRow227TriangleData1208.coefficient89_381,
    output := OriginalRow227TriangleData1219.coefficient90_381, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_383, Icur := OriginalRow227TriangleData1208.coefficient89_382,
    output := OriginalRow227TriangleData1219.coefficient90_382, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_384, Icur := OriginalRow227TriangleData1208.coefficient89_383,
    output := OriginalRow227TriangleData1219.coefficient90_383, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_385, Icur := OriginalRow227TriangleData1208.coefficient89_384,
    output := OriginalRow227TriangleData1219.coefficient90_384, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_386, Icur := OriginalRow227TriangleData1208.coefficient89_385,
    output := OriginalRow227TriangleData1219.coefficient90_385, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_387, Icur := OriginalRow227TriangleData1208.coefficient89_386,
    output := OriginalRow227TriangleData1219.coefficient90_386, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_388, Icur := OriginalRow227TriangleData1208.coefficient89_387,
    output := OriginalRow227TriangleData1219.coefficient90_387, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_389, Icur := OriginalRow227TriangleData1208.coefficient89_388,
    output := OriginalRow227TriangleData1219.coefficient90_388, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_390, Icur := OriginalRow227TriangleData1208.coefficient89_389,
    output := OriginalRow227TriangleData1219.coefficient90_389, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_391, Icur := OriginalRow227TriangleData1208.coefficient89_390,
    output := OriginalRow227TriangleData1219.coefficient90_390, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_392, Icur := OriginalRow227TriangleData1208.coefficient89_391,
    output := OriginalRow227TriangleData1219.coefficient90_391, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_393, Icur := OriginalRow227TriangleData1208.coefficient89_392,
    output := OriginalRow227TriangleData1219.coefficient90_392, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_394, Icur := OriginalRow227TriangleData1208.coefficient89_393,
    output := OriginalRow227TriangleData1219.coefficient90_393, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_395, Icur := OriginalRow227TriangleData1208.coefficient89_394,
    output := OriginalRow227TriangleData1219.coefficient90_394, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_396, Icur := OriginalRow227TriangleData1208.coefficient89_395,
    output := OriginalRow227TriangleData1219.coefficient90_395, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_397, Icur := OriginalRow227TriangleData1208.coefficient89_396,
    output := OriginalRow227TriangleData1219.coefficient90_396, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_398, Icur := OriginalRow227TriangleData1208.coefficient89_397,
    output := OriginalRow227TriangleData1219.coefficient90_397, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_399, Icur := OriginalRow227TriangleData1208.coefficient89_398,
    output := OriginalRow227TriangleData1219.coefficient90_398, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_400, Icur := OriginalRow227TriangleData1208.coefficient89_399,
    output := OriginalRow227TriangleData1219.coefficient90_399, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_401, Icur := OriginalRow227TriangleData1208.coefficient89_400,
    output := OriginalRow227TriangleData1219.coefficient90_400, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_402, Icur := OriginalRow227TriangleData1208.coefficient89_401,
    output := OriginalRow227TriangleData1219.coefficient90_401, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_403, Icur := OriginalRow227TriangleData1208.coefficient89_402,
    output := OriginalRow227TriangleData1219.coefficient90_402, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_404, Icur := OriginalRow227TriangleData1208.coefficient89_403,
    output := OriginalRow227TriangleData1219.coefficient90_403, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_405, Icur := OriginalRow227TriangleData1208.coefficient89_404,
    output := OriginalRow227TriangleData1219.coefficient90_404, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_406, Icur := OriginalRow227TriangleData1208.coefficient89_405,
    output := OriginalRow227TriangleData1219.coefficient90_405, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1208.coefficient89_407, Icur := OriginalRow227TriangleData1208.coefficient89_406,
    output := OriginalRow227TriangleData1219.coefficient90_406, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1209.coefficient89_408, Icur := OriginalRow227TriangleData1208.coefficient89_407,
    output := OriginalRow227TriangleData1219.coefficient90_407, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1209.coefficient89_409, Icur := OriginalRow227TriangleData1209.coefficient89_408,
    output := OriginalRow227TriangleData1219.coefficient90_408, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1203

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1203.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

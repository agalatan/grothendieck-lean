import Grothe.UpperChaos.OriginalRow227TriangleData1230
import Grothe.UpperChaos.OriginalRow227TriangleData1231
import Grothe.UpperChaos.OriginalRow227TriangleData1241
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1225
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_380, Icur := OriginalRow227TriangleData1230.coefficient91_379,
    output := OriginalRow227TriangleData1241.coefficient92_379, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_381, Icur := OriginalRow227TriangleData1230.coefficient91_380,
    output := OriginalRow227TriangleData1241.coefficient92_380, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_382, Icur := OriginalRow227TriangleData1230.coefficient91_381,
    output := OriginalRow227TriangleData1241.coefficient92_381, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_383, Icur := OriginalRow227TriangleData1230.coefficient91_382,
    output := OriginalRow227TriangleData1241.coefficient92_382, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_384, Icur := OriginalRow227TriangleData1230.coefficient91_383,
    output := OriginalRow227TriangleData1241.coefficient92_383, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_385, Icur := OriginalRow227TriangleData1230.coefficient91_384,
    output := OriginalRow227TriangleData1241.coefficient92_384, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_386, Icur := OriginalRow227TriangleData1230.coefficient91_385,
    output := OriginalRow227TriangleData1241.coefficient92_385, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_387, Icur := OriginalRow227TriangleData1230.coefficient91_386,
    output := OriginalRow227TriangleData1241.coefficient92_386, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_388, Icur := OriginalRow227TriangleData1230.coefficient91_387,
    output := OriginalRow227TriangleData1241.coefficient92_387, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_389, Icur := OriginalRow227TriangleData1230.coefficient91_388,
    output := OriginalRow227TriangleData1241.coefficient92_388, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_390, Icur := OriginalRow227TriangleData1230.coefficient91_389,
    output := OriginalRow227TriangleData1241.coefficient92_389, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_391, Icur := OriginalRow227TriangleData1230.coefficient91_390,
    output := OriginalRow227TriangleData1241.coefficient92_390, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_392, Icur := OriginalRow227TriangleData1230.coefficient91_391,
    output := OriginalRow227TriangleData1241.coefficient92_391, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_393, Icur := OriginalRow227TriangleData1230.coefficient91_392,
    output := OriginalRow227TriangleData1241.coefficient92_392, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_394, Icur := OriginalRow227TriangleData1230.coefficient91_393,
    output := OriginalRow227TriangleData1241.coefficient92_393, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_395, Icur := OriginalRow227TriangleData1230.coefficient91_394,
    output := OriginalRow227TriangleData1241.coefficient92_394, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_396, Icur := OriginalRow227TriangleData1230.coefficient91_395,
    output := OriginalRow227TriangleData1241.coefficient92_395, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_397, Icur := OriginalRow227TriangleData1230.coefficient91_396,
    output := OriginalRow227TriangleData1241.coefficient92_396, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_398, Icur := OriginalRow227TriangleData1230.coefficient91_397,
    output := OriginalRow227TriangleData1241.coefficient92_397, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_399, Icur := OriginalRow227TriangleData1230.coefficient91_398,
    output := OriginalRow227TriangleData1241.coefficient92_398, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_400, Icur := OriginalRow227TriangleData1230.coefficient91_399,
    output := OriginalRow227TriangleData1241.coefficient92_399, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_401, Icur := OriginalRow227TriangleData1230.coefficient91_400,
    output := OriginalRow227TriangleData1241.coefficient92_400, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_402, Icur := OriginalRow227TriangleData1230.coefficient91_401,
    output := OriginalRow227TriangleData1241.coefficient92_401, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_403, Icur := OriginalRow227TriangleData1230.coefficient91_402,
    output := OriginalRow227TriangleData1241.coefficient92_402, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_404, Icur := OriginalRow227TriangleData1230.coefficient91_403,
    output := OriginalRow227TriangleData1241.coefficient92_403, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_405, Icur := OriginalRow227TriangleData1230.coefficient91_404,
    output := OriginalRow227TriangleData1241.coefficient92_404, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_406, Icur := OriginalRow227TriangleData1230.coefficient91_405,
    output := OriginalRow227TriangleData1241.coefficient92_405, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_407, Icur := OriginalRow227TriangleData1230.coefficient91_406,
    output := OriginalRow227TriangleData1241.coefficient92_406, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_408, Icur := OriginalRow227TriangleData1230.coefficient91_407,
    output := OriginalRow227TriangleData1241.coefficient92_407, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1230.coefficient91_409, Icur := OriginalRow227TriangleData1230.coefficient91_408,
    output := OriginalRow227TriangleData1241.coefficient92_408, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots02.root92,
    Inext := OriginalRow227TriangleData1231.coefficient91_410, Icur := OriginalRow227TriangleData1230.coefficient91_409,
    output := OriginalRow227TriangleData1241.coefficient92_409, hC := OriginalRow227TriangleRoots02.root92_pos, hAC := OriginalRow227TriangleRoots02.product92_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1225

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1225.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData0835
import Grothe.UpperChaos.OriginalRow227TriangleData0836
import Grothe.UpperChaos.OriginalRow227TriangleData0848
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0832
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_378, Icur := OriginalRow227TriangleData0835.coefficient57_377,
    output := OriginalRow227TriangleData0848.coefficient58_377, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_379, Icur := OriginalRow227TriangleData0835.coefficient57_378,
    output := OriginalRow227TriangleData0848.coefficient58_378, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_380, Icur := OriginalRow227TriangleData0835.coefficient57_379,
    output := OriginalRow227TriangleData0848.coefficient58_379, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_381, Icur := OriginalRow227TriangleData0835.coefficient57_380,
    output := OriginalRow227TriangleData0848.coefficient58_380, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_382, Icur := OriginalRow227TriangleData0835.coefficient57_381,
    output := OriginalRow227TriangleData0848.coefficient58_381, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_383, Icur := OriginalRow227TriangleData0835.coefficient57_382,
    output := OriginalRow227TriangleData0848.coefficient58_382, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_384, Icur := OriginalRow227TriangleData0835.coefficient57_383,
    output := OriginalRow227TriangleData0848.coefficient58_383, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_385, Icur := OriginalRow227TriangleData0835.coefficient57_384,
    output := OriginalRow227TriangleData0848.coefficient58_384, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_386, Icur := OriginalRow227TriangleData0835.coefficient57_385,
    output := OriginalRow227TriangleData0848.coefficient58_385, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_387, Icur := OriginalRow227TriangleData0835.coefficient57_386,
    output := OriginalRow227TriangleData0848.coefficient58_386, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_388, Icur := OriginalRow227TriangleData0835.coefficient57_387,
    output := OriginalRow227TriangleData0848.coefficient58_387, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_389, Icur := OriginalRow227TriangleData0835.coefficient57_388,
    output := OriginalRow227TriangleData0848.coefficient58_388, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_390, Icur := OriginalRow227TriangleData0835.coefficient57_389,
    output := OriginalRow227TriangleData0848.coefficient58_389, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_391, Icur := OriginalRow227TriangleData0835.coefficient57_390,
    output := OriginalRow227TriangleData0848.coefficient58_390, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_392, Icur := OriginalRow227TriangleData0835.coefficient57_391,
    output := OriginalRow227TriangleData0848.coefficient58_391, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_393, Icur := OriginalRow227TriangleData0835.coefficient57_392,
    output := OriginalRow227TriangleData0848.coefficient58_392, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_394, Icur := OriginalRow227TriangleData0835.coefficient57_393,
    output := OriginalRow227TriangleData0848.coefficient58_393, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_395, Icur := OriginalRow227TriangleData0835.coefficient57_394,
    output := OriginalRow227TriangleData0848.coefficient58_394, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_396, Icur := OriginalRow227TriangleData0835.coefficient57_395,
    output := OriginalRow227TriangleData0848.coefficient58_395, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_397, Icur := OriginalRow227TriangleData0835.coefficient57_396,
    output := OriginalRow227TriangleData0848.coefficient58_396, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_398, Icur := OriginalRow227TriangleData0835.coefficient57_397,
    output := OriginalRow227TriangleData0848.coefficient58_397, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_399, Icur := OriginalRow227TriangleData0835.coefficient57_398,
    output := OriginalRow227TriangleData0848.coefficient58_398, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_400, Icur := OriginalRow227TriangleData0835.coefficient57_399,
    output := OriginalRow227TriangleData0848.coefficient58_399, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_401, Icur := OriginalRow227TriangleData0835.coefficient57_400,
    output := OriginalRow227TriangleData0848.coefficient58_400, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_402, Icur := OriginalRow227TriangleData0835.coefficient57_401,
    output := OriginalRow227TriangleData0848.coefficient58_401, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_403, Icur := OriginalRow227TriangleData0835.coefficient57_402,
    output := OriginalRow227TriangleData0848.coefficient58_402, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_404, Icur := OriginalRow227TriangleData0835.coefficient57_403,
    output := OriginalRow227TriangleData0848.coefficient58_403, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_405, Icur := OriginalRow227TriangleData0835.coefficient57_404,
    output := OriginalRow227TriangleData0848.coefficient58_404, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_406, Icur := OriginalRow227TriangleData0835.coefficient57_405,
    output := OriginalRow227TriangleData0848.coefficient58_405, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0835.coefficient57_407, Icur := OriginalRow227TriangleData0835.coefficient57_406,
    output := OriginalRow227TriangleData0848.coefficient58_406, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0836.coefficient57_408, Icur := OriginalRow227TriangleData0835.coefficient57_407,
    output := OriginalRow227TriangleData0848.coefficient58_407, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0836.coefficient57_409, Icur := OriginalRow227TriangleData0836.coefficient57_408,
    output := OriginalRow227TriangleData0848.coefficient58_408, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0832

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0832.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

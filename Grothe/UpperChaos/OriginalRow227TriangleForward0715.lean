import Grothe.UpperChaos.OriginalRow227TriangleData0718
import Grothe.UpperChaos.OriginalRow227TriangleData0719
import Grothe.UpperChaos.OriginalRow227TriangleData0731
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0715
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_369, Icur := OriginalRow227TriangleData0718.coefficient48_368,
    output := OriginalRow227TriangleData0731.coefficient49_368, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_370, Icur := OriginalRow227TriangleData0718.coefficient48_369,
    output := OriginalRow227TriangleData0731.coefficient49_369, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_371, Icur := OriginalRow227TriangleData0718.coefficient48_370,
    output := OriginalRow227TriangleData0731.coefficient49_370, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_372, Icur := OriginalRow227TriangleData0718.coefficient48_371,
    output := OriginalRow227TriangleData0731.coefficient49_371, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_373, Icur := OriginalRow227TriangleData0718.coefficient48_372,
    output := OriginalRow227TriangleData0731.coefficient49_372, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_374, Icur := OriginalRow227TriangleData0718.coefficient48_373,
    output := OriginalRow227TriangleData0731.coefficient49_373, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_375, Icur := OriginalRow227TriangleData0718.coefficient48_374,
    output := OriginalRow227TriangleData0731.coefficient49_374, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_376, Icur := OriginalRow227TriangleData0718.coefficient48_375,
    output := OriginalRow227TriangleData0731.coefficient49_375, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_377, Icur := OriginalRow227TriangleData0718.coefficient48_376,
    output := OriginalRow227TriangleData0731.coefficient49_376, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_378, Icur := OriginalRow227TriangleData0718.coefficient48_377,
    output := OriginalRow227TriangleData0731.coefficient49_377, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_379, Icur := OriginalRow227TriangleData0718.coefficient48_378,
    output := OriginalRow227TriangleData0731.coefficient49_378, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_380, Icur := OriginalRow227TriangleData0718.coefficient48_379,
    output := OriginalRow227TriangleData0731.coefficient49_379, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_381, Icur := OriginalRow227TriangleData0718.coefficient48_380,
    output := OriginalRow227TriangleData0731.coefficient49_380, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_382, Icur := OriginalRow227TriangleData0718.coefficient48_381,
    output := OriginalRow227TriangleData0731.coefficient49_381, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_383, Icur := OriginalRow227TriangleData0718.coefficient48_382,
    output := OriginalRow227TriangleData0731.coefficient49_382, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_384, Icur := OriginalRow227TriangleData0718.coefficient48_383,
    output := OriginalRow227TriangleData0731.coefficient49_383, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_385, Icur := OriginalRow227TriangleData0718.coefficient48_384,
    output := OriginalRow227TriangleData0731.coefficient49_384, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_386, Icur := OriginalRow227TriangleData0718.coefficient48_385,
    output := OriginalRow227TriangleData0731.coefficient49_385, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_387, Icur := OriginalRow227TriangleData0718.coefficient48_386,
    output := OriginalRow227TriangleData0731.coefficient49_386, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_388, Icur := OriginalRow227TriangleData0718.coefficient48_387,
    output := OriginalRow227TriangleData0731.coefficient49_387, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_389, Icur := OriginalRow227TriangleData0718.coefficient48_388,
    output := OriginalRow227TriangleData0731.coefficient49_388, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_390, Icur := OriginalRow227TriangleData0718.coefficient48_389,
    output := OriginalRow227TriangleData0731.coefficient49_389, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_391, Icur := OriginalRow227TriangleData0718.coefficient48_390,
    output := OriginalRow227TriangleData0731.coefficient49_390, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_392, Icur := OriginalRow227TriangleData0718.coefficient48_391,
    output := OriginalRow227TriangleData0731.coefficient49_391, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_393, Icur := OriginalRow227TriangleData0718.coefficient48_392,
    output := OriginalRow227TriangleData0731.coefficient49_392, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_394, Icur := OriginalRow227TriangleData0718.coefficient48_393,
    output := OriginalRow227TriangleData0731.coefficient49_393, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_395, Icur := OriginalRow227TriangleData0718.coefficient48_394,
    output := OriginalRow227TriangleData0731.coefficient49_394, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_396, Icur := OriginalRow227TriangleData0718.coefficient48_395,
    output := OriginalRow227TriangleData0731.coefficient49_395, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_397, Icur := OriginalRow227TriangleData0718.coefficient48_396,
    output := OriginalRow227TriangleData0731.coefficient49_396, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0718.coefficient48_398, Icur := OriginalRow227TriangleData0718.coefficient48_397,
    output := OriginalRow227TriangleData0731.coefficient49_397, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0719.coefficient48_399, Icur := OriginalRow227TriangleData0718.coefficient48_398,
    output := OriginalRow227TriangleData0731.coefficient49_398, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0719.coefficient48_400, Icur := OriginalRow227TriangleData0719.coefficient48_399,
    output := OriginalRow227TriangleData0731.coefficient49_399, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0715

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0715.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

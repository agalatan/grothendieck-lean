import Grothe.UpperChaos.OriginalRow227TriangleData0705
import Grothe.UpperChaos.OriginalRow227TriangleData0706
import Grothe.UpperChaos.OriginalRow227TriangleData0718
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0702
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_368, Icur := OriginalRow227TriangleData0705.coefficient47_367,
    output := OriginalRow227TriangleData0718.coefficient48_367, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_369, Icur := OriginalRow227TriangleData0705.coefficient47_368,
    output := OriginalRow227TriangleData0718.coefficient48_368, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_370, Icur := OriginalRow227TriangleData0705.coefficient47_369,
    output := OriginalRow227TriangleData0718.coefficient48_369, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_371, Icur := OriginalRow227TriangleData0705.coefficient47_370,
    output := OriginalRow227TriangleData0718.coefficient48_370, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_372, Icur := OriginalRow227TriangleData0705.coefficient47_371,
    output := OriginalRow227TriangleData0718.coefficient48_371, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_373, Icur := OriginalRow227TriangleData0705.coefficient47_372,
    output := OriginalRow227TriangleData0718.coefficient48_372, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_374, Icur := OriginalRow227TriangleData0705.coefficient47_373,
    output := OriginalRow227TriangleData0718.coefficient48_373, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_375, Icur := OriginalRow227TriangleData0705.coefficient47_374,
    output := OriginalRow227TriangleData0718.coefficient48_374, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_376, Icur := OriginalRow227TriangleData0705.coefficient47_375,
    output := OriginalRow227TriangleData0718.coefficient48_375, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_377, Icur := OriginalRow227TriangleData0705.coefficient47_376,
    output := OriginalRow227TriangleData0718.coefficient48_376, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_378, Icur := OriginalRow227TriangleData0705.coefficient47_377,
    output := OriginalRow227TriangleData0718.coefficient48_377, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_379, Icur := OriginalRow227TriangleData0705.coefficient47_378,
    output := OriginalRow227TriangleData0718.coefficient48_378, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_380, Icur := OriginalRow227TriangleData0705.coefficient47_379,
    output := OriginalRow227TriangleData0718.coefficient48_379, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_381, Icur := OriginalRow227TriangleData0705.coefficient47_380,
    output := OriginalRow227TriangleData0718.coefficient48_380, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_382, Icur := OriginalRow227TriangleData0705.coefficient47_381,
    output := OriginalRow227TriangleData0718.coefficient48_381, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_383, Icur := OriginalRow227TriangleData0705.coefficient47_382,
    output := OriginalRow227TriangleData0718.coefficient48_382, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_384, Icur := OriginalRow227TriangleData0705.coefficient47_383,
    output := OriginalRow227TriangleData0718.coefficient48_383, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_385, Icur := OriginalRow227TriangleData0705.coefficient47_384,
    output := OriginalRow227TriangleData0718.coefficient48_384, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_386, Icur := OriginalRow227TriangleData0705.coefficient47_385,
    output := OriginalRow227TriangleData0718.coefficient48_385, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_387, Icur := OriginalRow227TriangleData0705.coefficient47_386,
    output := OriginalRow227TriangleData0718.coefficient48_386, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_388, Icur := OriginalRow227TriangleData0705.coefficient47_387,
    output := OriginalRow227TriangleData0718.coefficient48_387, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_389, Icur := OriginalRow227TriangleData0705.coefficient47_388,
    output := OriginalRow227TriangleData0718.coefficient48_388, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_390, Icur := OriginalRow227TriangleData0705.coefficient47_389,
    output := OriginalRow227TriangleData0718.coefficient48_389, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_391, Icur := OriginalRow227TriangleData0705.coefficient47_390,
    output := OriginalRow227TriangleData0718.coefficient48_390, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_392, Icur := OriginalRow227TriangleData0705.coefficient47_391,
    output := OriginalRow227TriangleData0718.coefficient48_391, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_393, Icur := OriginalRow227TriangleData0705.coefficient47_392,
    output := OriginalRow227TriangleData0718.coefficient48_392, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_394, Icur := OriginalRow227TriangleData0705.coefficient47_393,
    output := OriginalRow227TriangleData0718.coefficient48_393, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_395, Icur := OriginalRow227TriangleData0705.coefficient47_394,
    output := OriginalRow227TriangleData0718.coefficient48_394, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_396, Icur := OriginalRow227TriangleData0705.coefficient47_395,
    output := OriginalRow227TriangleData0718.coefficient48_395, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0705.coefficient47_397, Icur := OriginalRow227TriangleData0705.coefficient47_396,
    output := OriginalRow227TriangleData0718.coefficient48_396, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_398, Icur := OriginalRow227TriangleData0705.coefficient47_397,
    output := OriginalRow227TriangleData0718.coefficient48_397, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0706.coefficient47_399, Icur := OriginalRow227TriangleData0706.coefficient47_398,
    output := OriginalRow227TriangleData0718.coefficient48_398, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0702

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0702.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

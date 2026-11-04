import Grothe.UpperChaos.OriginalRow227TriangleData0624
import Grothe.UpperChaos.OriginalRow227TriangleData0625
import Grothe.UpperChaos.OriginalRow227TriangleData0638
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0622
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_362, Icur := OriginalRow227TriangleData0624.coefficient41_361,
    output := OriginalRow227TriangleData0638.coefficient42_361, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_363, Icur := OriginalRow227TriangleData0624.coefficient41_362,
    output := OriginalRow227TriangleData0638.coefficient42_362, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_364, Icur := OriginalRow227TriangleData0624.coefficient41_363,
    output := OriginalRow227TriangleData0638.coefficient42_363, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_365, Icur := OriginalRow227TriangleData0624.coefficient41_364,
    output := OriginalRow227TriangleData0638.coefficient42_364, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_366, Icur := OriginalRow227TriangleData0624.coefficient41_365,
    output := OriginalRow227TriangleData0638.coefficient42_365, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_367, Icur := OriginalRow227TriangleData0624.coefficient41_366,
    output := OriginalRow227TriangleData0638.coefficient42_366, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_368, Icur := OriginalRow227TriangleData0624.coefficient41_367,
    output := OriginalRow227TriangleData0638.coefficient42_367, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_369, Icur := OriginalRow227TriangleData0624.coefficient41_368,
    output := OriginalRow227TriangleData0638.coefficient42_368, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_370, Icur := OriginalRow227TriangleData0624.coefficient41_369,
    output := OriginalRow227TriangleData0638.coefficient42_369, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_371, Icur := OriginalRow227TriangleData0624.coefficient41_370,
    output := OriginalRow227TriangleData0638.coefficient42_370, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_372, Icur := OriginalRow227TriangleData0624.coefficient41_371,
    output := OriginalRow227TriangleData0638.coefficient42_371, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_373, Icur := OriginalRow227TriangleData0624.coefficient41_372,
    output := OriginalRow227TriangleData0638.coefficient42_372, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_374, Icur := OriginalRow227TriangleData0624.coefficient41_373,
    output := OriginalRow227TriangleData0638.coefficient42_373, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_375, Icur := OriginalRow227TriangleData0624.coefficient41_374,
    output := OriginalRow227TriangleData0638.coefficient42_374, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_376, Icur := OriginalRow227TriangleData0624.coefficient41_375,
    output := OriginalRow227TriangleData0638.coefficient42_375, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_377, Icur := OriginalRow227TriangleData0624.coefficient41_376,
    output := OriginalRow227TriangleData0638.coefficient42_376, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_378, Icur := OriginalRow227TriangleData0624.coefficient41_377,
    output := OriginalRow227TriangleData0638.coefficient42_377, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_379, Icur := OriginalRow227TriangleData0624.coefficient41_378,
    output := OriginalRow227TriangleData0638.coefficient42_378, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_380, Icur := OriginalRow227TriangleData0624.coefficient41_379,
    output := OriginalRow227TriangleData0638.coefficient42_379, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_381, Icur := OriginalRow227TriangleData0624.coefficient41_380,
    output := OriginalRow227TriangleData0638.coefficient42_380, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_382, Icur := OriginalRow227TriangleData0624.coefficient41_381,
    output := OriginalRow227TriangleData0638.coefficient42_381, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_383, Icur := OriginalRow227TriangleData0624.coefficient41_382,
    output := OriginalRow227TriangleData0638.coefficient42_382, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_384, Icur := OriginalRow227TriangleData0624.coefficient41_383,
    output := OriginalRow227TriangleData0638.coefficient42_383, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_385, Icur := OriginalRow227TriangleData0624.coefficient41_384,
    output := OriginalRow227TriangleData0638.coefficient42_384, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_386, Icur := OriginalRow227TriangleData0624.coefficient41_385,
    output := OriginalRow227TriangleData0638.coefficient42_385, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_387, Icur := OriginalRow227TriangleData0624.coefficient41_386,
    output := OriginalRow227TriangleData0638.coefficient42_386, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_388, Icur := OriginalRow227TriangleData0624.coefficient41_387,
    output := OriginalRow227TriangleData0638.coefficient42_387, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_389, Icur := OriginalRow227TriangleData0624.coefficient41_388,
    output := OriginalRow227TriangleData0638.coefficient42_388, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_390, Icur := OriginalRow227TriangleData0624.coefficient41_389,
    output := OriginalRow227TriangleData0638.coefficient42_389, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_391, Icur := OriginalRow227TriangleData0624.coefficient41_390,
    output := OriginalRow227TriangleData0638.coefficient42_390, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0625.coefficient41_392, Icur := OriginalRow227TriangleData0624.coefficient41_391,
    output := OriginalRow227TriangleData0638.coefficient42_391, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0625.coefficient41_393, Icur := OriginalRow227TriangleData0625.coefficient41_392,
    output := OriginalRow227TriangleData0638.coefficient42_392, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0622

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0622.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

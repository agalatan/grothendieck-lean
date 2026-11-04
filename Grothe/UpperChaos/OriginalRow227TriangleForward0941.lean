import Grothe.UpperChaos.OriginalRow227TriangleData0945
import Grothe.UpperChaos.OriginalRow227TriangleData0946
import Grothe.UpperChaos.OriginalRow227TriangleData0957
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0941
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_355, Icur := OriginalRow227TriangleData0945.coefficient66_354,
    output := OriginalRow227TriangleData0957.coefficient67_354, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_356, Icur := OriginalRow227TriangleData0945.coefficient66_355,
    output := OriginalRow227TriangleData0957.coefficient67_355, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_357, Icur := OriginalRow227TriangleData0945.coefficient66_356,
    output := OriginalRow227TriangleData0957.coefficient67_356, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_358, Icur := OriginalRow227TriangleData0945.coefficient66_357,
    output := OriginalRow227TriangleData0957.coefficient67_357, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_359, Icur := OriginalRow227TriangleData0945.coefficient66_358,
    output := OriginalRow227TriangleData0957.coefficient67_358, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_360, Icur := OriginalRow227TriangleData0945.coefficient66_359,
    output := OriginalRow227TriangleData0957.coefficient67_359, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_361, Icur := OriginalRow227TriangleData0945.coefficient66_360,
    output := OriginalRow227TriangleData0957.coefficient67_360, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_362, Icur := OriginalRow227TriangleData0945.coefficient66_361,
    output := OriginalRow227TriangleData0957.coefficient67_361, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_363, Icur := OriginalRow227TriangleData0945.coefficient66_362,
    output := OriginalRow227TriangleData0957.coefficient67_362, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_364, Icur := OriginalRow227TriangleData0945.coefficient66_363,
    output := OriginalRow227TriangleData0957.coefficient67_363, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_365, Icur := OriginalRow227TriangleData0945.coefficient66_364,
    output := OriginalRow227TriangleData0957.coefficient67_364, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_366, Icur := OriginalRow227TriangleData0945.coefficient66_365,
    output := OriginalRow227TriangleData0957.coefficient67_365, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_367, Icur := OriginalRow227TriangleData0945.coefficient66_366,
    output := OriginalRow227TriangleData0957.coefficient67_366, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_368, Icur := OriginalRow227TriangleData0945.coefficient66_367,
    output := OriginalRow227TriangleData0957.coefficient67_367, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_369, Icur := OriginalRow227TriangleData0945.coefficient66_368,
    output := OriginalRow227TriangleData0957.coefficient67_368, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_370, Icur := OriginalRow227TriangleData0945.coefficient66_369,
    output := OriginalRow227TriangleData0957.coefficient67_369, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_371, Icur := OriginalRow227TriangleData0945.coefficient66_370,
    output := OriginalRow227TriangleData0957.coefficient67_370, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_372, Icur := OriginalRow227TriangleData0945.coefficient66_371,
    output := OriginalRow227TriangleData0957.coefficient67_371, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_373, Icur := OriginalRow227TriangleData0945.coefficient66_372,
    output := OriginalRow227TriangleData0957.coefficient67_372, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_374, Icur := OriginalRow227TriangleData0945.coefficient66_373,
    output := OriginalRow227TriangleData0957.coefficient67_373, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_375, Icur := OriginalRow227TriangleData0945.coefficient66_374,
    output := OriginalRow227TriangleData0957.coefficient67_374, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_376, Icur := OriginalRow227TriangleData0945.coefficient66_375,
    output := OriginalRow227TriangleData0957.coefficient67_375, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_377, Icur := OriginalRow227TriangleData0945.coefficient66_376,
    output := OriginalRow227TriangleData0957.coefficient67_376, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_378, Icur := OriginalRow227TriangleData0945.coefficient66_377,
    output := OriginalRow227TriangleData0957.coefficient67_377, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_379, Icur := OriginalRow227TriangleData0945.coefficient66_378,
    output := OriginalRow227TriangleData0957.coefficient67_378, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_380, Icur := OriginalRow227TriangleData0945.coefficient66_379,
    output := OriginalRow227TriangleData0957.coefficient67_379, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_381, Icur := OriginalRow227TriangleData0945.coefficient66_380,
    output := OriginalRow227TriangleData0957.coefficient67_380, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_382, Icur := OriginalRow227TriangleData0945.coefficient66_381,
    output := OriginalRow227TriangleData0957.coefficient67_381, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_383, Icur := OriginalRow227TriangleData0945.coefficient66_382,
    output := OriginalRow227TriangleData0957.coefficient67_382, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0945.coefficient66_384, Icur := OriginalRow227TriangleData0945.coefficient66_383,
    output := OriginalRow227TriangleData0957.coefficient67_383, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0946.coefficient66_385, Icur := OriginalRow227TriangleData0945.coefficient66_384,
    output := OriginalRow227TriangleData0957.coefficient67_384, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0946.coefficient66_386, Icur := OriginalRow227TriangleData0946.coefficient66_385,
    output := OriginalRow227TriangleData0957.coefficient67_385, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0941

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0941.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

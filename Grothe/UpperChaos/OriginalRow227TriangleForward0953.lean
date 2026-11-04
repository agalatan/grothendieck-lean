import Grothe.UpperChaos.OriginalRow227TriangleData0957
import Grothe.UpperChaos.OriginalRow227TriangleData0958
import Grothe.UpperChaos.OriginalRow227TriangleData0969
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0953
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_356, Icur := OriginalRow227TriangleData0957.coefficient67_355,
    output := OriginalRow227TriangleData0969.coefficient68_355, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_357, Icur := OriginalRow227TriangleData0957.coefficient67_356,
    output := OriginalRow227TriangleData0969.coefficient68_356, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_358, Icur := OriginalRow227TriangleData0957.coefficient67_357,
    output := OriginalRow227TriangleData0969.coefficient68_357, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_359, Icur := OriginalRow227TriangleData0957.coefficient67_358,
    output := OriginalRow227TriangleData0969.coefficient68_358, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_360, Icur := OriginalRow227TriangleData0957.coefficient67_359,
    output := OriginalRow227TriangleData0969.coefficient68_359, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_361, Icur := OriginalRow227TriangleData0957.coefficient67_360,
    output := OriginalRow227TriangleData0969.coefficient68_360, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_362, Icur := OriginalRow227TriangleData0957.coefficient67_361,
    output := OriginalRow227TriangleData0969.coefficient68_361, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_363, Icur := OriginalRow227TriangleData0957.coefficient67_362,
    output := OriginalRow227TriangleData0969.coefficient68_362, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_364, Icur := OriginalRow227TriangleData0957.coefficient67_363,
    output := OriginalRow227TriangleData0969.coefficient68_363, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_365, Icur := OriginalRow227TriangleData0957.coefficient67_364,
    output := OriginalRow227TriangleData0969.coefficient68_364, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_366, Icur := OriginalRow227TriangleData0957.coefficient67_365,
    output := OriginalRow227TriangleData0969.coefficient68_365, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_367, Icur := OriginalRow227TriangleData0957.coefficient67_366,
    output := OriginalRow227TriangleData0969.coefficient68_366, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_368, Icur := OriginalRow227TriangleData0957.coefficient67_367,
    output := OriginalRow227TriangleData0969.coefficient68_367, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_369, Icur := OriginalRow227TriangleData0957.coefficient67_368,
    output := OriginalRow227TriangleData0969.coefficient68_368, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_370, Icur := OriginalRow227TriangleData0957.coefficient67_369,
    output := OriginalRow227TriangleData0969.coefficient68_369, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_371, Icur := OriginalRow227TriangleData0957.coefficient67_370,
    output := OriginalRow227TriangleData0969.coefficient68_370, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_372, Icur := OriginalRow227TriangleData0957.coefficient67_371,
    output := OriginalRow227TriangleData0969.coefficient68_371, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_373, Icur := OriginalRow227TriangleData0957.coefficient67_372,
    output := OriginalRow227TriangleData0969.coefficient68_372, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_374, Icur := OriginalRow227TriangleData0957.coefficient67_373,
    output := OriginalRow227TriangleData0969.coefficient68_373, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_375, Icur := OriginalRow227TriangleData0957.coefficient67_374,
    output := OriginalRow227TriangleData0969.coefficient68_374, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_376, Icur := OriginalRow227TriangleData0957.coefficient67_375,
    output := OriginalRow227TriangleData0969.coefficient68_375, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_377, Icur := OriginalRow227TriangleData0957.coefficient67_376,
    output := OriginalRow227TriangleData0969.coefficient68_376, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_378, Icur := OriginalRow227TriangleData0957.coefficient67_377,
    output := OriginalRow227TriangleData0969.coefficient68_377, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_379, Icur := OriginalRow227TriangleData0957.coefficient67_378,
    output := OriginalRow227TriangleData0969.coefficient68_378, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_380, Icur := OriginalRow227TriangleData0957.coefficient67_379,
    output := OriginalRow227TriangleData0969.coefficient68_379, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_381, Icur := OriginalRow227TriangleData0957.coefficient67_380,
    output := OriginalRow227TriangleData0969.coefficient68_380, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_382, Icur := OriginalRow227TriangleData0957.coefficient67_381,
    output := OriginalRow227TriangleData0969.coefficient68_381, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_383, Icur := OriginalRow227TriangleData0957.coefficient67_382,
    output := OriginalRow227TriangleData0969.coefficient68_382, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_384, Icur := OriginalRow227TriangleData0957.coefficient67_383,
    output := OriginalRow227TriangleData0969.coefficient68_383, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0957.coefficient67_385, Icur := OriginalRow227TriangleData0957.coefficient67_384,
    output := OriginalRow227TriangleData0969.coefficient68_384, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_386, Icur := OriginalRow227TriangleData0957.coefficient67_385,
    output := OriginalRow227TriangleData0969.coefficient68_385, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0958.coefficient67_387, Icur := OriginalRow227TriangleData0958.coefficient67_386,
    output := OriginalRow227TriangleData0969.coefficient68_386, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0953

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0953.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

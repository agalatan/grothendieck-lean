import Grothe.UpperChaos.OriginalRow227TriangleData0933
import Grothe.UpperChaos.OriginalRow227TriangleData0934
import Grothe.UpperChaos.OriginalRow227TriangleData0945
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0929
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_354, Icur := OriginalRow227TriangleData0933.coefficient65_353,
    output := OriginalRow227TriangleData0945.coefficient66_353, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_355, Icur := OriginalRow227TriangleData0933.coefficient65_354,
    output := OriginalRow227TriangleData0945.coefficient66_354, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_356, Icur := OriginalRow227TriangleData0933.coefficient65_355,
    output := OriginalRow227TriangleData0945.coefficient66_355, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_357, Icur := OriginalRow227TriangleData0933.coefficient65_356,
    output := OriginalRow227TriangleData0945.coefficient66_356, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_358, Icur := OriginalRow227TriangleData0933.coefficient65_357,
    output := OriginalRow227TriangleData0945.coefficient66_357, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_359, Icur := OriginalRow227TriangleData0933.coefficient65_358,
    output := OriginalRow227TriangleData0945.coefficient66_358, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_360, Icur := OriginalRow227TriangleData0933.coefficient65_359,
    output := OriginalRow227TriangleData0945.coefficient66_359, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_361, Icur := OriginalRow227TriangleData0933.coefficient65_360,
    output := OriginalRow227TriangleData0945.coefficient66_360, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_362, Icur := OriginalRow227TriangleData0933.coefficient65_361,
    output := OriginalRow227TriangleData0945.coefficient66_361, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_363, Icur := OriginalRow227TriangleData0933.coefficient65_362,
    output := OriginalRow227TriangleData0945.coefficient66_362, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_364, Icur := OriginalRow227TriangleData0933.coefficient65_363,
    output := OriginalRow227TriangleData0945.coefficient66_363, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_365, Icur := OriginalRow227TriangleData0933.coefficient65_364,
    output := OriginalRow227TriangleData0945.coefficient66_364, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_366, Icur := OriginalRow227TriangleData0933.coefficient65_365,
    output := OriginalRow227TriangleData0945.coefficient66_365, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_367, Icur := OriginalRow227TriangleData0933.coefficient65_366,
    output := OriginalRow227TriangleData0945.coefficient66_366, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_368, Icur := OriginalRow227TriangleData0933.coefficient65_367,
    output := OriginalRow227TriangleData0945.coefficient66_367, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_369, Icur := OriginalRow227TriangleData0933.coefficient65_368,
    output := OriginalRow227TriangleData0945.coefficient66_368, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_370, Icur := OriginalRow227TriangleData0933.coefficient65_369,
    output := OriginalRow227TriangleData0945.coefficient66_369, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_371, Icur := OriginalRow227TriangleData0933.coefficient65_370,
    output := OriginalRow227TriangleData0945.coefficient66_370, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_372, Icur := OriginalRow227TriangleData0933.coefficient65_371,
    output := OriginalRow227TriangleData0945.coefficient66_371, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_373, Icur := OriginalRow227TriangleData0933.coefficient65_372,
    output := OriginalRow227TriangleData0945.coefficient66_372, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_374, Icur := OriginalRow227TriangleData0933.coefficient65_373,
    output := OriginalRow227TriangleData0945.coefficient66_373, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_375, Icur := OriginalRow227TriangleData0933.coefficient65_374,
    output := OriginalRow227TriangleData0945.coefficient66_374, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_376, Icur := OriginalRow227TriangleData0933.coefficient65_375,
    output := OriginalRow227TriangleData0945.coefficient66_375, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_377, Icur := OriginalRow227TriangleData0933.coefficient65_376,
    output := OriginalRow227TriangleData0945.coefficient66_376, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_378, Icur := OriginalRow227TriangleData0933.coefficient65_377,
    output := OriginalRow227TriangleData0945.coefficient66_377, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_379, Icur := OriginalRow227TriangleData0933.coefficient65_378,
    output := OriginalRow227TriangleData0945.coefficient66_378, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_380, Icur := OriginalRow227TriangleData0933.coefficient65_379,
    output := OriginalRow227TriangleData0945.coefficient66_379, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_381, Icur := OriginalRow227TriangleData0933.coefficient65_380,
    output := OriginalRow227TriangleData0945.coefficient66_380, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_382, Icur := OriginalRow227TriangleData0933.coefficient65_381,
    output := OriginalRow227TriangleData0945.coefficient66_381, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0933.coefficient65_383, Icur := OriginalRow227TriangleData0933.coefficient65_382,
    output := OriginalRow227TriangleData0945.coefficient66_382, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_384, Icur := OriginalRow227TriangleData0933.coefficient65_383,
    output := OriginalRow227TriangleData0945.coefficient66_383, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0934.coefficient65_385, Icur := OriginalRow227TriangleData0934.coefficient65_384,
    output := OriginalRow227TriangleData0945.coefficient66_384, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0929

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0929.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

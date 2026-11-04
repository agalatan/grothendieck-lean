import Grothe.UpperChaos.OriginalRow227TriangleData0921
import Grothe.UpperChaos.OriginalRow227TriangleData0922
import Grothe.UpperChaos.OriginalRow227TriangleData0933
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0917
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_353, Icur := OriginalRow227TriangleData0921.coefficient64_352,
    output := OriginalRow227TriangleData0933.coefficient65_352, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_354, Icur := OriginalRow227TriangleData0921.coefficient64_353,
    output := OriginalRow227TriangleData0933.coefficient65_353, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_355, Icur := OriginalRow227TriangleData0921.coefficient64_354,
    output := OriginalRow227TriangleData0933.coefficient65_354, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_356, Icur := OriginalRow227TriangleData0921.coefficient64_355,
    output := OriginalRow227TriangleData0933.coefficient65_355, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_357, Icur := OriginalRow227TriangleData0921.coefficient64_356,
    output := OriginalRow227TriangleData0933.coefficient65_356, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_358, Icur := OriginalRow227TriangleData0921.coefficient64_357,
    output := OriginalRow227TriangleData0933.coefficient65_357, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_359, Icur := OriginalRow227TriangleData0921.coefficient64_358,
    output := OriginalRow227TriangleData0933.coefficient65_358, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_360, Icur := OriginalRow227TriangleData0921.coefficient64_359,
    output := OriginalRow227TriangleData0933.coefficient65_359, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_361, Icur := OriginalRow227TriangleData0921.coefficient64_360,
    output := OriginalRow227TriangleData0933.coefficient65_360, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_362, Icur := OriginalRow227TriangleData0921.coefficient64_361,
    output := OriginalRow227TriangleData0933.coefficient65_361, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_363, Icur := OriginalRow227TriangleData0921.coefficient64_362,
    output := OriginalRow227TriangleData0933.coefficient65_362, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_364, Icur := OriginalRow227TriangleData0921.coefficient64_363,
    output := OriginalRow227TriangleData0933.coefficient65_363, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_365, Icur := OriginalRow227TriangleData0921.coefficient64_364,
    output := OriginalRow227TriangleData0933.coefficient65_364, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_366, Icur := OriginalRow227TriangleData0921.coefficient64_365,
    output := OriginalRow227TriangleData0933.coefficient65_365, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_367, Icur := OriginalRow227TriangleData0921.coefficient64_366,
    output := OriginalRow227TriangleData0933.coefficient65_366, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_368, Icur := OriginalRow227TriangleData0921.coefficient64_367,
    output := OriginalRow227TriangleData0933.coefficient65_367, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_369, Icur := OriginalRow227TriangleData0921.coefficient64_368,
    output := OriginalRow227TriangleData0933.coefficient65_368, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_370, Icur := OriginalRow227TriangleData0921.coefficient64_369,
    output := OriginalRow227TriangleData0933.coefficient65_369, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_371, Icur := OriginalRow227TriangleData0921.coefficient64_370,
    output := OriginalRow227TriangleData0933.coefficient65_370, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_372, Icur := OriginalRow227TriangleData0921.coefficient64_371,
    output := OriginalRow227TriangleData0933.coefficient65_371, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_373, Icur := OriginalRow227TriangleData0921.coefficient64_372,
    output := OriginalRow227TriangleData0933.coefficient65_372, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_374, Icur := OriginalRow227TriangleData0921.coefficient64_373,
    output := OriginalRow227TriangleData0933.coefficient65_373, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_375, Icur := OriginalRow227TriangleData0921.coefficient64_374,
    output := OriginalRow227TriangleData0933.coefficient65_374, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_376, Icur := OriginalRow227TriangleData0921.coefficient64_375,
    output := OriginalRow227TriangleData0933.coefficient65_375, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_377, Icur := OriginalRow227TriangleData0921.coefficient64_376,
    output := OriginalRow227TriangleData0933.coefficient65_376, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_378, Icur := OriginalRow227TriangleData0921.coefficient64_377,
    output := OriginalRow227TriangleData0933.coefficient65_377, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_379, Icur := OriginalRow227TriangleData0921.coefficient64_378,
    output := OriginalRow227TriangleData0933.coefficient65_378, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_380, Icur := OriginalRow227TriangleData0921.coefficient64_379,
    output := OriginalRow227TriangleData0933.coefficient65_379, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_381, Icur := OriginalRow227TriangleData0921.coefficient64_380,
    output := OriginalRow227TriangleData0933.coefficient65_380, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0921.coefficient64_382, Icur := OriginalRow227TriangleData0921.coefficient64_381,
    output := OriginalRow227TriangleData0933.coefficient65_381, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_383, Icur := OriginalRow227TriangleData0921.coefficient64_382,
    output := OriginalRow227TriangleData0933.coefficient65_382, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0922.coefficient64_384, Icur := OriginalRow227TriangleData0922.coefficient64_383,
    output := OriginalRow227TriangleData0933.coefficient65_383, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0917

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0917.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

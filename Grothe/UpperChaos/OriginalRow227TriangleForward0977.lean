import Grothe.UpperChaos.OriginalRow227TriangleData0981
import Grothe.UpperChaos.OriginalRow227TriangleData0982
import Grothe.UpperChaos.OriginalRow227TriangleData0993
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0977
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_358, Icur := OriginalRow227TriangleData0981.coefficient69_357,
    output := OriginalRow227TriangleData0993.coefficient70_357, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_359, Icur := OriginalRow227TriangleData0981.coefficient69_358,
    output := OriginalRow227TriangleData0993.coefficient70_358, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_360, Icur := OriginalRow227TriangleData0981.coefficient69_359,
    output := OriginalRow227TriangleData0993.coefficient70_359, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_361, Icur := OriginalRow227TriangleData0981.coefficient69_360,
    output := OriginalRow227TriangleData0993.coefficient70_360, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_362, Icur := OriginalRow227TriangleData0981.coefficient69_361,
    output := OriginalRow227TriangleData0993.coefficient70_361, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_363, Icur := OriginalRow227TriangleData0981.coefficient69_362,
    output := OriginalRow227TriangleData0993.coefficient70_362, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_364, Icur := OriginalRow227TriangleData0981.coefficient69_363,
    output := OriginalRow227TriangleData0993.coefficient70_363, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_365, Icur := OriginalRow227TriangleData0981.coefficient69_364,
    output := OriginalRow227TriangleData0993.coefficient70_364, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_366, Icur := OriginalRow227TriangleData0981.coefficient69_365,
    output := OriginalRow227TriangleData0993.coefficient70_365, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_367, Icur := OriginalRow227TriangleData0981.coefficient69_366,
    output := OriginalRow227TriangleData0993.coefficient70_366, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_368, Icur := OriginalRow227TriangleData0981.coefficient69_367,
    output := OriginalRow227TriangleData0993.coefficient70_367, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_369, Icur := OriginalRow227TriangleData0981.coefficient69_368,
    output := OriginalRow227TriangleData0993.coefficient70_368, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_370, Icur := OriginalRow227TriangleData0981.coefficient69_369,
    output := OriginalRow227TriangleData0993.coefficient70_369, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_371, Icur := OriginalRow227TriangleData0981.coefficient69_370,
    output := OriginalRow227TriangleData0993.coefficient70_370, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_372, Icur := OriginalRow227TriangleData0981.coefficient69_371,
    output := OriginalRow227TriangleData0993.coefficient70_371, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_373, Icur := OriginalRow227TriangleData0981.coefficient69_372,
    output := OriginalRow227TriangleData0993.coefficient70_372, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_374, Icur := OriginalRow227TriangleData0981.coefficient69_373,
    output := OriginalRow227TriangleData0993.coefficient70_373, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_375, Icur := OriginalRow227TriangleData0981.coefficient69_374,
    output := OriginalRow227TriangleData0993.coefficient70_374, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_376, Icur := OriginalRow227TriangleData0981.coefficient69_375,
    output := OriginalRow227TriangleData0993.coefficient70_375, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_377, Icur := OriginalRow227TriangleData0981.coefficient69_376,
    output := OriginalRow227TriangleData0993.coefficient70_376, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_378, Icur := OriginalRow227TriangleData0981.coefficient69_377,
    output := OriginalRow227TriangleData0993.coefficient70_377, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_379, Icur := OriginalRow227TriangleData0981.coefficient69_378,
    output := OriginalRow227TriangleData0993.coefficient70_378, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_380, Icur := OriginalRow227TriangleData0981.coefficient69_379,
    output := OriginalRow227TriangleData0993.coefficient70_379, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_381, Icur := OriginalRow227TriangleData0981.coefficient69_380,
    output := OriginalRow227TriangleData0993.coefficient70_380, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_382, Icur := OriginalRow227TriangleData0981.coefficient69_381,
    output := OriginalRow227TriangleData0993.coefficient70_381, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_383, Icur := OriginalRow227TriangleData0981.coefficient69_382,
    output := OriginalRow227TriangleData0993.coefficient70_382, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_384, Icur := OriginalRow227TriangleData0981.coefficient69_383,
    output := OriginalRow227TriangleData0993.coefficient70_383, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_385, Icur := OriginalRow227TriangleData0981.coefficient69_384,
    output := OriginalRow227TriangleData0993.coefficient70_384, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_386, Icur := OriginalRow227TriangleData0981.coefficient69_385,
    output := OriginalRow227TriangleData0993.coefficient70_385, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0981.coefficient69_387, Icur := OriginalRow227TriangleData0981.coefficient69_386,
    output := OriginalRow227TriangleData0993.coefficient70_386, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0982.coefficient69_388, Icur := OriginalRow227TriangleData0981.coefficient69_387,
    output := OriginalRow227TriangleData0993.coefficient70_387, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0982.coefficient69_389, Icur := OriginalRow227TriangleData0982.coefficient69_388,
    output := OriginalRow227TriangleData0993.coefficient70_388, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0977

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0977.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

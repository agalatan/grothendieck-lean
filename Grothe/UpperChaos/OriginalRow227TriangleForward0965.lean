import Grothe.UpperChaos.OriginalRow227TriangleData0969
import Grothe.UpperChaos.OriginalRow227TriangleData0970
import Grothe.UpperChaos.OriginalRow227TriangleData0981
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0965
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_357, Icur := OriginalRow227TriangleData0969.coefficient68_356,
    output := OriginalRow227TriangleData0981.coefficient69_356, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_358, Icur := OriginalRow227TriangleData0969.coefficient68_357,
    output := OriginalRow227TriangleData0981.coefficient69_357, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_359, Icur := OriginalRow227TriangleData0969.coefficient68_358,
    output := OriginalRow227TriangleData0981.coefficient69_358, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_360, Icur := OriginalRow227TriangleData0969.coefficient68_359,
    output := OriginalRow227TriangleData0981.coefficient69_359, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_361, Icur := OriginalRow227TriangleData0969.coefficient68_360,
    output := OriginalRow227TriangleData0981.coefficient69_360, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_362, Icur := OriginalRow227TriangleData0969.coefficient68_361,
    output := OriginalRow227TriangleData0981.coefficient69_361, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_363, Icur := OriginalRow227TriangleData0969.coefficient68_362,
    output := OriginalRow227TriangleData0981.coefficient69_362, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_364, Icur := OriginalRow227TriangleData0969.coefficient68_363,
    output := OriginalRow227TriangleData0981.coefficient69_363, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_365, Icur := OriginalRow227TriangleData0969.coefficient68_364,
    output := OriginalRow227TriangleData0981.coefficient69_364, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_366, Icur := OriginalRow227TriangleData0969.coefficient68_365,
    output := OriginalRow227TriangleData0981.coefficient69_365, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_367, Icur := OriginalRow227TriangleData0969.coefficient68_366,
    output := OriginalRow227TriangleData0981.coefficient69_366, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_368, Icur := OriginalRow227TriangleData0969.coefficient68_367,
    output := OriginalRow227TriangleData0981.coefficient69_367, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_369, Icur := OriginalRow227TriangleData0969.coefficient68_368,
    output := OriginalRow227TriangleData0981.coefficient69_368, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_370, Icur := OriginalRow227TriangleData0969.coefficient68_369,
    output := OriginalRow227TriangleData0981.coefficient69_369, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_371, Icur := OriginalRow227TriangleData0969.coefficient68_370,
    output := OriginalRow227TriangleData0981.coefficient69_370, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_372, Icur := OriginalRow227TriangleData0969.coefficient68_371,
    output := OriginalRow227TriangleData0981.coefficient69_371, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_373, Icur := OriginalRow227TriangleData0969.coefficient68_372,
    output := OriginalRow227TriangleData0981.coefficient69_372, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_374, Icur := OriginalRow227TriangleData0969.coefficient68_373,
    output := OriginalRow227TriangleData0981.coefficient69_373, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_375, Icur := OriginalRow227TriangleData0969.coefficient68_374,
    output := OriginalRow227TriangleData0981.coefficient69_374, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_376, Icur := OriginalRow227TriangleData0969.coefficient68_375,
    output := OriginalRow227TriangleData0981.coefficient69_375, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_377, Icur := OriginalRow227TriangleData0969.coefficient68_376,
    output := OriginalRow227TriangleData0981.coefficient69_376, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_378, Icur := OriginalRow227TriangleData0969.coefficient68_377,
    output := OriginalRow227TriangleData0981.coefficient69_377, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_379, Icur := OriginalRow227TriangleData0969.coefficient68_378,
    output := OriginalRow227TriangleData0981.coefficient69_378, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_380, Icur := OriginalRow227TriangleData0969.coefficient68_379,
    output := OriginalRow227TriangleData0981.coefficient69_379, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_381, Icur := OriginalRow227TriangleData0969.coefficient68_380,
    output := OriginalRow227TriangleData0981.coefficient69_380, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_382, Icur := OriginalRow227TriangleData0969.coefficient68_381,
    output := OriginalRow227TriangleData0981.coefficient69_381, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_383, Icur := OriginalRow227TriangleData0969.coefficient68_382,
    output := OriginalRow227TriangleData0981.coefficient69_382, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_384, Icur := OriginalRow227TriangleData0969.coefficient68_383,
    output := OriginalRow227TriangleData0981.coefficient69_383, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_385, Icur := OriginalRow227TriangleData0969.coefficient68_384,
    output := OriginalRow227TriangleData0981.coefficient69_384, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0969.coefficient68_386, Icur := OriginalRow227TriangleData0969.coefficient68_385,
    output := OriginalRow227TriangleData0981.coefficient69_385, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0970.coefficient68_387, Icur := OriginalRow227TriangleData0969.coefficient68_386,
    output := OriginalRow227TriangleData0981.coefficient69_386, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0970.coefficient68_388, Icur := OriginalRow227TriangleData0970.coefficient68_387,
    output := OriginalRow227TriangleData0981.coefficient69_387, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0965

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0965.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

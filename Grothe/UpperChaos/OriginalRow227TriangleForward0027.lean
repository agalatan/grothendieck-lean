import Grothe.UpperChaos.OriginalRow227TriangleData0027
import Grothe.UpperChaos.OriginalRow227TriangleData0028
import Grothe.UpperChaos.OriginalRow227TriangleData0043
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0027
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_354, Icur := OriginalRow227TriangleData0027.coefficient1_353,
    output := OriginalRow227TriangleData0043.coefficient2_353, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_355, Icur := OriginalRow227TriangleData0027.coefficient1_354,
    output := OriginalRow227TriangleData0043.coefficient2_354, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_356, Icur := OriginalRow227TriangleData0027.coefficient1_355,
    output := OriginalRow227TriangleData0043.coefficient2_355, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_357, Icur := OriginalRow227TriangleData0027.coefficient1_356,
    output := OriginalRow227TriangleData0043.coefficient2_356, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_358, Icur := OriginalRow227TriangleData0027.coefficient1_357,
    output := OriginalRow227TriangleData0043.coefficient2_357, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_359, Icur := OriginalRow227TriangleData0027.coefficient1_358,
    output := OriginalRow227TriangleData0043.coefficient2_358, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_360, Icur := OriginalRow227TriangleData0027.coefficient1_359,
    output := OriginalRow227TriangleData0043.coefficient2_359, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_361, Icur := OriginalRow227TriangleData0027.coefficient1_360,
    output := OriginalRow227TriangleData0043.coefficient2_360, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_362, Icur := OriginalRow227TriangleData0027.coefficient1_361,
    output := OriginalRow227TriangleData0043.coefficient2_361, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_363, Icur := OriginalRow227TriangleData0027.coefficient1_362,
    output := OriginalRow227TriangleData0043.coefficient2_362, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_364, Icur := OriginalRow227TriangleData0027.coefficient1_363,
    output := OriginalRow227TriangleData0043.coefficient2_363, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_365, Icur := OriginalRow227TriangleData0027.coefficient1_364,
    output := OriginalRow227TriangleData0043.coefficient2_364, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_366, Icur := OriginalRow227TriangleData0027.coefficient1_365,
    output := OriginalRow227TriangleData0043.coefficient2_365, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_367, Icur := OriginalRow227TriangleData0027.coefficient1_366,
    output := OriginalRow227TriangleData0043.coefficient2_366, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_368, Icur := OriginalRow227TriangleData0027.coefficient1_367,
    output := OriginalRow227TriangleData0043.coefficient2_367, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_369, Icur := OriginalRow227TriangleData0027.coefficient1_368,
    output := OriginalRow227TriangleData0043.coefficient2_368, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_370, Icur := OriginalRow227TriangleData0027.coefficient1_369,
    output := OriginalRow227TriangleData0043.coefficient2_369, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_371, Icur := OriginalRow227TriangleData0027.coefficient1_370,
    output := OriginalRow227TriangleData0043.coefficient2_370, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_372, Icur := OriginalRow227TriangleData0027.coefficient1_371,
    output := OriginalRow227TriangleData0043.coefficient2_371, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_373, Icur := OriginalRow227TriangleData0027.coefficient1_372,
    output := OriginalRow227TriangleData0043.coefficient2_372, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_374, Icur := OriginalRow227TriangleData0027.coefficient1_373,
    output := OriginalRow227TriangleData0043.coefficient2_373, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_375, Icur := OriginalRow227TriangleData0027.coefficient1_374,
    output := OriginalRow227TriangleData0043.coefficient2_374, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_376, Icur := OriginalRow227TriangleData0027.coefficient1_375,
    output := OriginalRow227TriangleData0043.coefficient2_375, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_377, Icur := OriginalRow227TriangleData0027.coefficient1_376,
    output := OriginalRow227TriangleData0043.coefficient2_376, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_378, Icur := OriginalRow227TriangleData0027.coefficient1_377,
    output := OriginalRow227TriangleData0043.coefficient2_377, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_379, Icur := OriginalRow227TriangleData0027.coefficient1_378,
    output := OriginalRow227TriangleData0043.coefficient2_378, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_380, Icur := OriginalRow227TriangleData0027.coefficient1_379,
    output := OriginalRow227TriangleData0043.coefficient2_379, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_381, Icur := OriginalRow227TriangleData0027.coefficient1_380,
    output := OriginalRow227TriangleData0043.coefficient2_380, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_382, Icur := OriginalRow227TriangleData0027.coefficient1_381,
    output := OriginalRow227TriangleData0043.coefficient2_381, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0027.coefficient1_383, Icur := OriginalRow227TriangleData0027.coefficient1_382,
    output := OriginalRow227TriangleData0043.coefficient2_382, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_384, Icur := OriginalRow227TriangleData0027.coefficient1_383,
    output := OriginalRow227TriangleData0043.coefficient2_383, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0028.coefficient1_385, Icur := OriginalRow227TriangleData0028.coefficient1_384,
    output := OriginalRow227TriangleData0043.coefficient2_384, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0027

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0027.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

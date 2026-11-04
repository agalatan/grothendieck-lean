import Grothe.UpperChaos.OriginalRow227TriangleData0155
import Grothe.UpperChaos.OriginalRow227TriangleData0156
import Grothe.UpperChaos.OriginalRow227TriangleData0171
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0155
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_362, Icur := OriginalRow227TriangleData0155.coefficient9_361,
    output := OriginalRow227TriangleData0171.coefficient10_361, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_363, Icur := OriginalRow227TriangleData0155.coefficient9_362,
    output := OriginalRow227TriangleData0171.coefficient10_362, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_364, Icur := OriginalRow227TriangleData0155.coefficient9_363,
    output := OriginalRow227TriangleData0171.coefficient10_363, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_365, Icur := OriginalRow227TriangleData0155.coefficient9_364,
    output := OriginalRow227TriangleData0171.coefficient10_364, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_366, Icur := OriginalRow227TriangleData0155.coefficient9_365,
    output := OriginalRow227TriangleData0171.coefficient10_365, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_367, Icur := OriginalRow227TriangleData0155.coefficient9_366,
    output := OriginalRow227TriangleData0171.coefficient10_366, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_368, Icur := OriginalRow227TriangleData0155.coefficient9_367,
    output := OriginalRow227TriangleData0171.coefficient10_367, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_369, Icur := OriginalRow227TriangleData0155.coefficient9_368,
    output := OriginalRow227TriangleData0171.coefficient10_368, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_370, Icur := OriginalRow227TriangleData0155.coefficient9_369,
    output := OriginalRow227TriangleData0171.coefficient10_369, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_371, Icur := OriginalRow227TriangleData0155.coefficient9_370,
    output := OriginalRow227TriangleData0171.coefficient10_370, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_372, Icur := OriginalRow227TriangleData0155.coefficient9_371,
    output := OriginalRow227TriangleData0171.coefficient10_371, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_373, Icur := OriginalRow227TriangleData0155.coefficient9_372,
    output := OriginalRow227TriangleData0171.coefficient10_372, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_374, Icur := OriginalRow227TriangleData0155.coefficient9_373,
    output := OriginalRow227TriangleData0171.coefficient10_373, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_375, Icur := OriginalRow227TriangleData0155.coefficient9_374,
    output := OriginalRow227TriangleData0171.coefficient10_374, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_376, Icur := OriginalRow227TriangleData0155.coefficient9_375,
    output := OriginalRow227TriangleData0171.coefficient10_375, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_377, Icur := OriginalRow227TriangleData0155.coefficient9_376,
    output := OriginalRow227TriangleData0171.coefficient10_376, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_378, Icur := OriginalRow227TriangleData0155.coefficient9_377,
    output := OriginalRow227TriangleData0171.coefficient10_377, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_379, Icur := OriginalRow227TriangleData0155.coefficient9_378,
    output := OriginalRow227TriangleData0171.coefficient10_378, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_380, Icur := OriginalRow227TriangleData0155.coefficient9_379,
    output := OriginalRow227TriangleData0171.coefficient10_379, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_381, Icur := OriginalRow227TriangleData0155.coefficient9_380,
    output := OriginalRow227TriangleData0171.coefficient10_380, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_382, Icur := OriginalRow227TriangleData0155.coefficient9_381,
    output := OriginalRow227TriangleData0171.coefficient10_381, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_383, Icur := OriginalRow227TriangleData0155.coefficient9_382,
    output := OriginalRow227TriangleData0171.coefficient10_382, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_384, Icur := OriginalRow227TriangleData0155.coefficient9_383,
    output := OriginalRow227TriangleData0171.coefficient10_383, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_385, Icur := OriginalRow227TriangleData0155.coefficient9_384,
    output := OriginalRow227TriangleData0171.coefficient10_384, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_386, Icur := OriginalRow227TriangleData0155.coefficient9_385,
    output := OriginalRow227TriangleData0171.coefficient10_385, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_387, Icur := OriginalRow227TriangleData0155.coefficient9_386,
    output := OriginalRow227TriangleData0171.coefficient10_386, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_388, Icur := OriginalRow227TriangleData0155.coefficient9_387,
    output := OriginalRow227TriangleData0171.coefficient10_387, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_389, Icur := OriginalRow227TriangleData0155.coefficient9_388,
    output := OriginalRow227TriangleData0171.coefficient10_388, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_390, Icur := OriginalRow227TriangleData0155.coefficient9_389,
    output := OriginalRow227TriangleData0171.coefficient10_389, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0155.coefficient9_391, Icur := OriginalRow227TriangleData0155.coefficient9_390,
    output := OriginalRow227TriangleData0171.coefficient10_390, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_392, Icur := OriginalRow227TriangleData0155.coefficient9_391,
    output := OriginalRow227TriangleData0171.coefficient10_391, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0156.coefficient9_393, Icur := OriginalRow227TriangleData0156.coefficient9_392,
    output := OriginalRow227TriangleData0171.coefficient10_392, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0155

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0155.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

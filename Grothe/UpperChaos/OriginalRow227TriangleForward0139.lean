import Grothe.UpperChaos.OriginalRow227TriangleData0139
import Grothe.UpperChaos.OriginalRow227TriangleData0140
import Grothe.UpperChaos.OriginalRow227TriangleData0155
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0139
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_361, Icur := OriginalRow227TriangleData0139.coefficient8_360,
    output := OriginalRow227TriangleData0155.coefficient9_360, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_362, Icur := OriginalRow227TriangleData0139.coefficient8_361,
    output := OriginalRow227TriangleData0155.coefficient9_361, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_363, Icur := OriginalRow227TriangleData0139.coefficient8_362,
    output := OriginalRow227TriangleData0155.coefficient9_362, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_364, Icur := OriginalRow227TriangleData0139.coefficient8_363,
    output := OriginalRow227TriangleData0155.coefficient9_363, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_365, Icur := OriginalRow227TriangleData0139.coefficient8_364,
    output := OriginalRow227TriangleData0155.coefficient9_364, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_366, Icur := OriginalRow227TriangleData0139.coefficient8_365,
    output := OriginalRow227TriangleData0155.coefficient9_365, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_367, Icur := OriginalRow227TriangleData0139.coefficient8_366,
    output := OriginalRow227TriangleData0155.coefficient9_366, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_368, Icur := OriginalRow227TriangleData0139.coefficient8_367,
    output := OriginalRow227TriangleData0155.coefficient9_367, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_369, Icur := OriginalRow227TriangleData0139.coefficient8_368,
    output := OriginalRow227TriangleData0155.coefficient9_368, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_370, Icur := OriginalRow227TriangleData0139.coefficient8_369,
    output := OriginalRow227TriangleData0155.coefficient9_369, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_371, Icur := OriginalRow227TriangleData0139.coefficient8_370,
    output := OriginalRow227TriangleData0155.coefficient9_370, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_372, Icur := OriginalRow227TriangleData0139.coefficient8_371,
    output := OriginalRow227TriangleData0155.coefficient9_371, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_373, Icur := OriginalRow227TriangleData0139.coefficient8_372,
    output := OriginalRow227TriangleData0155.coefficient9_372, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_374, Icur := OriginalRow227TriangleData0139.coefficient8_373,
    output := OriginalRow227TriangleData0155.coefficient9_373, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_375, Icur := OriginalRow227TriangleData0139.coefficient8_374,
    output := OriginalRow227TriangleData0155.coefficient9_374, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_376, Icur := OriginalRow227TriangleData0139.coefficient8_375,
    output := OriginalRow227TriangleData0155.coefficient9_375, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_377, Icur := OriginalRow227TriangleData0139.coefficient8_376,
    output := OriginalRow227TriangleData0155.coefficient9_376, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_378, Icur := OriginalRow227TriangleData0139.coefficient8_377,
    output := OriginalRow227TriangleData0155.coefficient9_377, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_379, Icur := OriginalRow227TriangleData0139.coefficient8_378,
    output := OriginalRow227TriangleData0155.coefficient9_378, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_380, Icur := OriginalRow227TriangleData0139.coefficient8_379,
    output := OriginalRow227TriangleData0155.coefficient9_379, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_381, Icur := OriginalRow227TriangleData0139.coefficient8_380,
    output := OriginalRow227TriangleData0155.coefficient9_380, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_382, Icur := OriginalRow227TriangleData0139.coefficient8_381,
    output := OriginalRow227TriangleData0155.coefficient9_381, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_383, Icur := OriginalRow227TriangleData0139.coefficient8_382,
    output := OriginalRow227TriangleData0155.coefficient9_382, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_384, Icur := OriginalRow227TriangleData0139.coefficient8_383,
    output := OriginalRow227TriangleData0155.coefficient9_383, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_385, Icur := OriginalRow227TriangleData0139.coefficient8_384,
    output := OriginalRow227TriangleData0155.coefficient9_384, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_386, Icur := OriginalRow227TriangleData0139.coefficient8_385,
    output := OriginalRow227TriangleData0155.coefficient9_385, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_387, Icur := OriginalRow227TriangleData0139.coefficient8_386,
    output := OriginalRow227TriangleData0155.coefficient9_386, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_388, Icur := OriginalRow227TriangleData0139.coefficient8_387,
    output := OriginalRow227TriangleData0155.coefficient9_387, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_389, Icur := OriginalRow227TriangleData0139.coefficient8_388,
    output := OriginalRow227TriangleData0155.coefficient9_388, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0139.coefficient8_390, Icur := OriginalRow227TriangleData0139.coefficient8_389,
    output := OriginalRow227TriangleData0155.coefficient9_389, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0140.coefficient8_391, Icur := OriginalRow227TriangleData0139.coefficient8_390,
    output := OriginalRow227TriangleData0155.coefficient9_390, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0140.coefficient8_392, Icur := OriginalRow227TriangleData0140.coefficient8_391,
    output := OriginalRow227TriangleData0155.coefficient9_391, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0139

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0139.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

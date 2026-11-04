import Grothe.UpperChaos.OriginalRow227TriangleData0203
import Grothe.UpperChaos.OriginalRow227TriangleData0204
import Grothe.UpperChaos.OriginalRow227TriangleData0218
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0202
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_365, Icur := OriginalRow227TriangleData0203.coefficient12_364,
    output := OriginalRow227TriangleData0218.coefficient13_364, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_366, Icur := OriginalRow227TriangleData0203.coefficient12_365,
    output := OriginalRow227TriangleData0218.coefficient13_365, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_367, Icur := OriginalRow227TriangleData0203.coefficient12_366,
    output := OriginalRow227TriangleData0218.coefficient13_366, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_368, Icur := OriginalRow227TriangleData0203.coefficient12_367,
    output := OriginalRow227TriangleData0218.coefficient13_367, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_369, Icur := OriginalRow227TriangleData0203.coefficient12_368,
    output := OriginalRow227TriangleData0218.coefficient13_368, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_370, Icur := OriginalRow227TriangleData0203.coefficient12_369,
    output := OriginalRow227TriangleData0218.coefficient13_369, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_371, Icur := OriginalRow227TriangleData0203.coefficient12_370,
    output := OriginalRow227TriangleData0218.coefficient13_370, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_372, Icur := OriginalRow227TriangleData0203.coefficient12_371,
    output := OriginalRow227TriangleData0218.coefficient13_371, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_373, Icur := OriginalRow227TriangleData0203.coefficient12_372,
    output := OriginalRow227TriangleData0218.coefficient13_372, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_374, Icur := OriginalRow227TriangleData0203.coefficient12_373,
    output := OriginalRow227TriangleData0218.coefficient13_373, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_375, Icur := OriginalRow227TriangleData0203.coefficient12_374,
    output := OriginalRow227TriangleData0218.coefficient13_374, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_376, Icur := OriginalRow227TriangleData0203.coefficient12_375,
    output := OriginalRow227TriangleData0218.coefficient13_375, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_377, Icur := OriginalRow227TriangleData0203.coefficient12_376,
    output := OriginalRow227TriangleData0218.coefficient13_376, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_378, Icur := OriginalRow227TriangleData0203.coefficient12_377,
    output := OriginalRow227TriangleData0218.coefficient13_377, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_379, Icur := OriginalRow227TriangleData0203.coefficient12_378,
    output := OriginalRow227TriangleData0218.coefficient13_378, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_380, Icur := OriginalRow227TriangleData0203.coefficient12_379,
    output := OriginalRow227TriangleData0218.coefficient13_379, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_381, Icur := OriginalRow227TriangleData0203.coefficient12_380,
    output := OriginalRow227TriangleData0218.coefficient13_380, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 370, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_382, Icur := OriginalRow227TriangleData0203.coefficient12_381,
    output := OriginalRow227TriangleData0218.coefficient13_381, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 371, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_383, Icur := OriginalRow227TriangleData0203.coefficient12_382,
    output := OriginalRow227TriangleData0218.coefficient13_382, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 372, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_384, Icur := OriginalRow227TriangleData0203.coefficient12_383,
    output := OriginalRow227TriangleData0218.coefficient13_383, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 373, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_385, Icur := OriginalRow227TriangleData0203.coefficient12_384,
    output := OriginalRow227TriangleData0218.coefficient13_384, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 374, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_386, Icur := OriginalRow227TriangleData0203.coefficient12_385,
    output := OriginalRow227TriangleData0218.coefficient13_385, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 375, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_387, Icur := OriginalRow227TriangleData0203.coefficient12_386,
    output := OriginalRow227TriangleData0218.coefficient13_386, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 376, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_388, Icur := OriginalRow227TriangleData0203.coefficient12_387,
    output := OriginalRow227TriangleData0218.coefficient13_387, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 377, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_389, Icur := OriginalRow227TriangleData0203.coefficient12_388,
    output := OriginalRow227TriangleData0218.coefficient13_388, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 378, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_390, Icur := OriginalRow227TriangleData0203.coefficient12_389,
    output := OriginalRow227TriangleData0218.coefficient13_389, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 379, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_391, Icur := OriginalRow227TriangleData0203.coefficient12_390,
    output := OriginalRow227TriangleData0218.coefficient13_390, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 380, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_392, Icur := OriginalRow227TriangleData0203.coefficient12_391,
    output := OriginalRow227TriangleData0218.coefficient13_391, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 381, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_393, Icur := OriginalRow227TriangleData0203.coefficient12_392,
    output := OriginalRow227TriangleData0218.coefficient13_392, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 382, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0203.coefficient12_394, Icur := OriginalRow227TriangleData0203.coefficient12_393,
    output := OriginalRow227TriangleData0218.coefficient13_393, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 383, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_395, Icur := OriginalRow227TriangleData0203.coefficient12_394,
    output := OriginalRow227TriangleData0218.coefficient13_394, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 384, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0204.coefficient12_396, Icur := OriginalRow227TriangleData0204.coefficient12_395,
    output := OriginalRow227TriangleData0218.coefficient13_395, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0202

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0202.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

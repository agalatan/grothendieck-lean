import Grothe.UpperChaos.OriginalRow227TriangleData0744
import Grothe.UpperChaos.OriginalRow227TriangleData0745
import Grothe.UpperChaos.OriginalRow227TriangleData0757
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0741
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_371, Icur := OriginalRow227TriangleData0744.coefficient50_370,
    output := OriginalRow227TriangleData0757.coefficient51_370, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_372, Icur := OriginalRow227TriangleData0744.coefficient50_371,
    output := OriginalRow227TriangleData0757.coefficient51_371, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_373, Icur := OriginalRow227TriangleData0744.coefficient50_372,
    output := OriginalRow227TriangleData0757.coefficient51_372, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_374, Icur := OriginalRow227TriangleData0744.coefficient50_373,
    output := OriginalRow227TriangleData0757.coefficient51_373, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_375, Icur := OriginalRow227TriangleData0744.coefficient50_374,
    output := OriginalRow227TriangleData0757.coefficient51_374, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_376, Icur := OriginalRow227TriangleData0744.coefficient50_375,
    output := OriginalRow227TriangleData0757.coefficient51_375, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_377, Icur := OriginalRow227TriangleData0744.coefficient50_376,
    output := OriginalRow227TriangleData0757.coefficient51_376, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_378, Icur := OriginalRow227TriangleData0744.coefficient50_377,
    output := OriginalRow227TriangleData0757.coefficient51_377, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_379, Icur := OriginalRow227TriangleData0744.coefficient50_378,
    output := OriginalRow227TriangleData0757.coefficient51_378, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_380, Icur := OriginalRow227TriangleData0744.coefficient50_379,
    output := OriginalRow227TriangleData0757.coefficient51_379, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_381, Icur := OriginalRow227TriangleData0744.coefficient50_380,
    output := OriginalRow227TriangleData0757.coefficient51_380, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_382, Icur := OriginalRow227TriangleData0744.coefficient50_381,
    output := OriginalRow227TriangleData0757.coefficient51_381, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_383, Icur := OriginalRow227TriangleData0744.coefficient50_382,
    output := OriginalRow227TriangleData0757.coefficient51_382, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 334, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_384, Icur := OriginalRow227TriangleData0744.coefficient50_383,
    output := OriginalRow227TriangleData0757.coefficient51_383, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 335, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_385, Icur := OriginalRow227TriangleData0744.coefficient50_384,
    output := OriginalRow227TriangleData0757.coefficient51_384, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 336, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_386, Icur := OriginalRow227TriangleData0744.coefficient50_385,
    output := OriginalRow227TriangleData0757.coefficient51_385, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 337, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_387, Icur := OriginalRow227TriangleData0744.coefficient50_386,
    output := OriginalRow227TriangleData0757.coefficient51_386, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 338, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_388, Icur := OriginalRow227TriangleData0744.coefficient50_387,
    output := OriginalRow227TriangleData0757.coefficient51_387, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 339, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_389, Icur := OriginalRow227TriangleData0744.coefficient50_388,
    output := OriginalRow227TriangleData0757.coefficient51_388, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 340, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_390, Icur := OriginalRow227TriangleData0744.coefficient50_389,
    output := OriginalRow227TriangleData0757.coefficient51_389, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 341, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_391, Icur := OriginalRow227TriangleData0744.coefficient50_390,
    output := OriginalRow227TriangleData0757.coefficient51_390, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 342, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_392, Icur := OriginalRow227TriangleData0744.coefficient50_391,
    output := OriginalRow227TriangleData0757.coefficient51_391, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 343, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_393, Icur := OriginalRow227TriangleData0744.coefficient50_392,
    output := OriginalRow227TriangleData0757.coefficient51_392, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 344, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_394, Icur := OriginalRow227TriangleData0744.coefficient50_393,
    output := OriginalRow227TriangleData0757.coefficient51_393, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 345, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_395, Icur := OriginalRow227TriangleData0744.coefficient50_394,
    output := OriginalRow227TriangleData0757.coefficient51_394, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 346, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_396, Icur := OriginalRow227TriangleData0744.coefficient50_395,
    output := OriginalRow227TriangleData0757.coefficient51_395, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 347, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_397, Icur := OriginalRow227TriangleData0744.coefficient50_396,
    output := OriginalRow227TriangleData0757.coefficient51_396, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 348, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_398, Icur := OriginalRow227TriangleData0744.coefficient50_397,
    output := OriginalRow227TriangleData0757.coefficient51_397, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 349, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_399, Icur := OriginalRow227TriangleData0744.coefficient50_398,
    output := OriginalRow227TriangleData0757.coefficient51_398, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 350, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_400, Icur := OriginalRow227TriangleData0744.coefficient50_399,
    output := OriginalRow227TriangleData0757.coefficient51_399, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 351, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0745.coefficient50_401, Icur := OriginalRow227TriangleData0744.coefficient50_400,
    output := OriginalRow227TriangleData0757.coefficient51_400, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 352, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0745.coefficient50_402, Icur := OriginalRow227TriangleData0745.coefficient50_401,
    output := OriginalRow227TriangleData0757.coefficient51_401, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0741

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0741.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData1131
import Grothe.UpperChaos.OriginalRow227TriangleData1132
import Grothe.UpperChaos.OriginalRow227TriangleData1142
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1126
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_371, Icur := OriginalRow227TriangleData1131.coefficient82_370,
    output := OriginalRow227TriangleData1142.coefficient83_370, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_372, Icur := OriginalRow227TriangleData1131.coefficient82_371,
    output := OriginalRow227TriangleData1142.coefficient83_371, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_373, Icur := OriginalRow227TriangleData1131.coefficient82_372,
    output := OriginalRow227TriangleData1142.coefficient83_372, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_374, Icur := OriginalRow227TriangleData1131.coefficient82_373,
    output := OriginalRow227TriangleData1142.coefficient83_373, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_375, Icur := OriginalRow227TriangleData1131.coefficient82_374,
    output := OriginalRow227TriangleData1142.coefficient83_374, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_376, Icur := OriginalRow227TriangleData1131.coefficient82_375,
    output := OriginalRow227TriangleData1142.coefficient83_375, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_377, Icur := OriginalRow227TriangleData1131.coefficient82_376,
    output := OriginalRow227TriangleData1142.coefficient83_376, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_378, Icur := OriginalRow227TriangleData1131.coefficient82_377,
    output := OriginalRow227TriangleData1142.coefficient83_377, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_379, Icur := OriginalRow227TriangleData1131.coefficient82_378,
    output := OriginalRow227TriangleData1142.coefficient83_378, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_380, Icur := OriginalRow227TriangleData1131.coefficient82_379,
    output := OriginalRow227TriangleData1142.coefficient83_379, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_381, Icur := OriginalRow227TriangleData1131.coefficient82_380,
    output := OriginalRow227TriangleData1142.coefficient83_380, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_382, Icur := OriginalRow227TriangleData1131.coefficient82_381,
    output := OriginalRow227TriangleData1142.coefficient83_381, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_383, Icur := OriginalRow227TriangleData1131.coefficient82_382,
    output := OriginalRow227TriangleData1142.coefficient83_382, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_384, Icur := OriginalRow227TriangleData1131.coefficient82_383,
    output := OriginalRow227TriangleData1142.coefficient83_383, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_385, Icur := OriginalRow227TriangleData1131.coefficient82_384,
    output := OriginalRow227TriangleData1142.coefficient83_384, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_386, Icur := OriginalRow227TriangleData1131.coefficient82_385,
    output := OriginalRow227TriangleData1142.coefficient83_385, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_387, Icur := OriginalRow227TriangleData1131.coefficient82_386,
    output := OriginalRow227TriangleData1142.coefficient83_386, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_388, Icur := OriginalRow227TriangleData1131.coefficient82_387,
    output := OriginalRow227TriangleData1142.coefficient83_387, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_389, Icur := OriginalRow227TriangleData1131.coefficient82_388,
    output := OriginalRow227TriangleData1142.coefficient83_388, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_390, Icur := OriginalRow227TriangleData1131.coefficient82_389,
    output := OriginalRow227TriangleData1142.coefficient83_389, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_391, Icur := OriginalRow227TriangleData1131.coefficient82_390,
    output := OriginalRow227TriangleData1142.coefficient83_390, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_392, Icur := OriginalRow227TriangleData1131.coefficient82_391,
    output := OriginalRow227TriangleData1142.coefficient83_391, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_393, Icur := OriginalRow227TriangleData1131.coefficient82_392,
    output := OriginalRow227TriangleData1142.coefficient83_392, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_394, Icur := OriginalRow227TriangleData1131.coefficient82_393,
    output := OriginalRow227TriangleData1142.coefficient83_393, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_395, Icur := OriginalRow227TriangleData1131.coefficient82_394,
    output := OriginalRow227TriangleData1142.coefficient83_394, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_396, Icur := OriginalRow227TriangleData1131.coefficient82_395,
    output := OriginalRow227TriangleData1142.coefficient83_395, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_397, Icur := OriginalRow227TriangleData1131.coefficient82_396,
    output := OriginalRow227TriangleData1142.coefficient83_396, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_398, Icur := OriginalRow227TriangleData1131.coefficient82_397,
    output := OriginalRow227TriangleData1142.coefficient83_397, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_399, Icur := OriginalRow227TriangleData1131.coefficient82_398,
    output := OriginalRow227TriangleData1142.coefficient83_398, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1131.coefficient82_400, Icur := OriginalRow227TriangleData1131.coefficient82_399,
    output := OriginalRow227TriangleData1142.coefficient83_399, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1132.coefficient82_401, Icur := OriginalRow227TriangleData1131.coefficient82_400,
    output := OriginalRow227TriangleData1142.coefficient83_400, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1132.coefficient82_402, Icur := OriginalRow227TriangleData1132.coefficient82_401,
    output := OriginalRow227TriangleData1142.coefficient83_401, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1126

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1126.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

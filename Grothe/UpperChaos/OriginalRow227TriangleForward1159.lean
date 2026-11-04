import Grothe.UpperChaos.OriginalRow227TriangleData1164
import Grothe.UpperChaos.OriginalRow227TriangleData1165
import Grothe.UpperChaos.OriginalRow227TriangleData1175
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1159
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_374, Icur := OriginalRow227TriangleData1164.coefficient85_373,
    output := OriginalRow227TriangleData1175.coefficient86_373, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_375, Icur := OriginalRow227TriangleData1164.coefficient85_374,
    output := OriginalRow227TriangleData1175.coefficient86_374, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_376, Icur := OriginalRow227TriangleData1164.coefficient85_375,
    output := OriginalRow227TriangleData1175.coefficient86_375, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_377, Icur := OriginalRow227TriangleData1164.coefficient85_376,
    output := OriginalRow227TriangleData1175.coefficient86_376, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_378, Icur := OriginalRow227TriangleData1164.coefficient85_377,
    output := OriginalRow227TriangleData1175.coefficient86_377, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_379, Icur := OriginalRow227TriangleData1164.coefficient85_378,
    output := OriginalRow227TriangleData1175.coefficient86_378, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_380, Icur := OriginalRow227TriangleData1164.coefficient85_379,
    output := OriginalRow227TriangleData1175.coefficient86_379, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_381, Icur := OriginalRow227TriangleData1164.coefficient85_380,
    output := OriginalRow227TriangleData1175.coefficient86_380, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_382, Icur := OriginalRow227TriangleData1164.coefficient85_381,
    output := OriginalRow227TriangleData1175.coefficient86_381, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_383, Icur := OriginalRow227TriangleData1164.coefficient85_382,
    output := OriginalRow227TriangleData1175.coefficient86_382, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_384, Icur := OriginalRow227TriangleData1164.coefficient85_383,
    output := OriginalRow227TriangleData1175.coefficient86_383, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_385, Icur := OriginalRow227TriangleData1164.coefficient85_384,
    output := OriginalRow227TriangleData1175.coefficient86_384, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_386, Icur := OriginalRow227TriangleData1164.coefficient85_385,
    output := OriginalRow227TriangleData1175.coefficient86_385, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_387, Icur := OriginalRow227TriangleData1164.coefficient85_386,
    output := OriginalRow227TriangleData1175.coefficient86_386, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_388, Icur := OriginalRow227TriangleData1164.coefficient85_387,
    output := OriginalRow227TriangleData1175.coefficient86_387, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_389, Icur := OriginalRow227TriangleData1164.coefficient85_388,
    output := OriginalRow227TriangleData1175.coefficient86_388, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_390, Icur := OriginalRow227TriangleData1164.coefficient85_389,
    output := OriginalRow227TriangleData1175.coefficient86_389, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_391, Icur := OriginalRow227TriangleData1164.coefficient85_390,
    output := OriginalRow227TriangleData1175.coefficient86_390, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_392, Icur := OriginalRow227TriangleData1164.coefficient85_391,
    output := OriginalRow227TriangleData1175.coefficient86_391, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_393, Icur := OriginalRow227TriangleData1164.coefficient85_392,
    output := OriginalRow227TriangleData1175.coefficient86_392, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_394, Icur := OriginalRow227TriangleData1164.coefficient85_393,
    output := OriginalRow227TriangleData1175.coefficient86_393, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_395, Icur := OriginalRow227TriangleData1164.coefficient85_394,
    output := OriginalRow227TriangleData1175.coefficient86_394, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_396, Icur := OriginalRow227TriangleData1164.coefficient85_395,
    output := OriginalRow227TriangleData1175.coefficient86_395, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_397, Icur := OriginalRow227TriangleData1164.coefficient85_396,
    output := OriginalRow227TriangleData1175.coefficient86_396, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_398, Icur := OriginalRow227TriangleData1164.coefficient85_397,
    output := OriginalRow227TriangleData1175.coefficient86_397, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_399, Icur := OriginalRow227TriangleData1164.coefficient85_398,
    output := OriginalRow227TriangleData1175.coefficient86_398, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_400, Icur := OriginalRow227TriangleData1164.coefficient85_399,
    output := OriginalRow227TriangleData1175.coefficient86_399, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_401, Icur := OriginalRow227TriangleData1164.coefficient85_400,
    output := OriginalRow227TriangleData1175.coefficient86_400, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_402, Icur := OriginalRow227TriangleData1164.coefficient85_401,
    output := OriginalRow227TriangleData1175.coefficient86_401, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1164.coefficient85_403, Icur := OriginalRow227TriangleData1164.coefficient85_402,
    output := OriginalRow227TriangleData1175.coefficient86_402, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1165.coefficient85_404, Icur := OriginalRow227TriangleData1164.coefficient85_403,
    output := OriginalRow227TriangleData1175.coefficient86_403, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots02.root86,
    Inext := OriginalRow227TriangleData1165.coefficient85_405, Icur := OriginalRow227TriangleData1165.coefficient85_404,
    output := OriginalRow227TriangleData1175.coefficient86_404, hC := OriginalRow227TriangleRoots02.root86_pos, hAC := OriginalRow227TriangleRoots02.product86_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1159

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1159.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData1291
import Grothe.UpperChaos.OriginalRow227TriangleData1301
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1285
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_386, Icur := OriginalRow227TriangleData1291.coefficient97_385,
    output := OriginalRow227TriangleData1301.coefficient98_385, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_387, Icur := OriginalRow227TriangleData1291.coefficient97_386,
    output := OriginalRow227TriangleData1301.coefficient98_386, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_388, Icur := OriginalRow227TriangleData1291.coefficient97_387,
    output := OriginalRow227TriangleData1301.coefficient98_387, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_389, Icur := OriginalRow227TriangleData1291.coefficient97_388,
    output := OriginalRow227TriangleData1301.coefficient98_388, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_390, Icur := OriginalRow227TriangleData1291.coefficient97_389,
    output := OriginalRow227TriangleData1301.coefficient98_389, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_391, Icur := OriginalRow227TriangleData1291.coefficient97_390,
    output := OriginalRow227TriangleData1301.coefficient98_390, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_392, Icur := OriginalRow227TriangleData1291.coefficient97_391,
    output := OriginalRow227TriangleData1301.coefficient98_391, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_393, Icur := OriginalRow227TriangleData1291.coefficient97_392,
    output := OriginalRow227TriangleData1301.coefficient98_392, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_394, Icur := OriginalRow227TriangleData1291.coefficient97_393,
    output := OriginalRow227TriangleData1301.coefficient98_393, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_395, Icur := OriginalRow227TriangleData1291.coefficient97_394,
    output := OriginalRow227TriangleData1301.coefficient98_394, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_396, Icur := OriginalRow227TriangleData1291.coefficient97_395,
    output := OriginalRow227TriangleData1301.coefficient98_395, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_397, Icur := OriginalRow227TriangleData1291.coefficient97_396,
    output := OriginalRow227TriangleData1301.coefficient98_396, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_398, Icur := OriginalRow227TriangleData1291.coefficient97_397,
    output := OriginalRow227TriangleData1301.coefficient98_397, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_399, Icur := OriginalRow227TriangleData1291.coefficient97_398,
    output := OriginalRow227TriangleData1301.coefficient98_398, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_400, Icur := OriginalRow227TriangleData1291.coefficient97_399,
    output := OriginalRow227TriangleData1301.coefficient98_399, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_401, Icur := OriginalRow227TriangleData1291.coefficient97_400,
    output := OriginalRow227TriangleData1301.coefficient98_400, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_402, Icur := OriginalRow227TriangleData1291.coefficient97_401,
    output := OriginalRow227TriangleData1301.coefficient98_401, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_403, Icur := OriginalRow227TriangleData1291.coefficient97_402,
    output := OriginalRow227TriangleData1301.coefficient98_402, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots12.root404, IC := OriginalRow227TriangleRoots03.root98,
    Inext := OriginalRow227TriangleData1291.coefficient97_404, Icur := OriginalRow227TriangleData1291.coefficient97_403,
    output := OriginalRow227TriangleData1301.coefficient98_403, hC := OriginalRow227TriangleRoots03.root98_pos, hAC := OriginalRow227TriangleRoots03.product98_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1285

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1285.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

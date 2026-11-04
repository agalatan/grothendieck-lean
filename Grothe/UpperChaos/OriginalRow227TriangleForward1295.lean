import Grothe.UpperChaos.OriginalRow227TriangleData1301
import Grothe.UpperChaos.OriginalRow227TriangleData1311
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1295
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_387, Icur := OriginalRow227TriangleData1301.coefficient98_386,
    output := OriginalRow227TriangleData1311.coefficient99_386, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_388, Icur := OriginalRow227TriangleData1301.coefficient98_387,
    output := OriginalRow227TriangleData1311.coefficient99_387, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_389, Icur := OriginalRow227TriangleData1301.coefficient98_388,
    output := OriginalRow227TriangleData1311.coefficient99_388, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_390, Icur := OriginalRow227TriangleData1301.coefficient98_389,
    output := OriginalRow227TriangleData1311.coefficient99_389, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_391, Icur := OriginalRow227TriangleData1301.coefficient98_390,
    output := OriginalRow227TriangleData1311.coefficient99_390, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_392, Icur := OriginalRow227TriangleData1301.coefficient98_391,
    output := OriginalRow227TriangleData1311.coefficient99_391, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_393, Icur := OriginalRow227TriangleData1301.coefficient98_392,
    output := OriginalRow227TriangleData1311.coefficient99_392, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_394, Icur := OriginalRow227TriangleData1301.coefficient98_393,
    output := OriginalRow227TriangleData1311.coefficient99_393, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_395, Icur := OriginalRow227TriangleData1301.coefficient98_394,
    output := OriginalRow227TriangleData1311.coefficient99_394, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_396, Icur := OriginalRow227TriangleData1301.coefficient98_395,
    output := OriginalRow227TriangleData1311.coefficient99_395, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_397, Icur := OriginalRow227TriangleData1301.coefficient98_396,
    output := OriginalRow227TriangleData1311.coefficient99_396, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_398, Icur := OriginalRow227TriangleData1301.coefficient98_397,
    output := OriginalRow227TriangleData1311.coefficient99_397, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_399, Icur := OriginalRow227TriangleData1301.coefficient98_398,
    output := OriginalRow227TriangleData1311.coefficient99_398, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_400, Icur := OriginalRow227TriangleData1301.coefficient98_399,
    output := OriginalRow227TriangleData1311.coefficient99_399, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_401, Icur := OriginalRow227TriangleData1301.coefficient98_400,
    output := OriginalRow227TriangleData1311.coefficient99_400, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots12.root402, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_402, Icur := OriginalRow227TriangleData1301.coefficient98_401,
    output := OriginalRow227TriangleData1311.coefficient99_401, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots12.root403, IC := OriginalRow227TriangleRoots03.root99,
    Inext := OriginalRow227TriangleData1301.coefficient98_403, Icur := OriginalRow227TriangleData1301.coefficient98_402,
    output := OriginalRow227TriangleData1311.coefficient99_402, hC := OriginalRow227TriangleRoots03.root99_pos, hAC := OriginalRow227TriangleRoots03.product99_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1295

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1295.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

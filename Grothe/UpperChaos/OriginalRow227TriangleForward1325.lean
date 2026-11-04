import Grothe.UpperChaos.OriginalRow227TriangleData1331
import Grothe.UpperChaos.OriginalRow227TriangleData1341
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1325
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1331.coefficient101_390, Icur := OriginalRow227TriangleData1331.coefficient101_389,
    output := OriginalRow227TriangleData1341.coefficient102_389, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1331.coefficient101_391, Icur := OriginalRow227TriangleData1331.coefficient101_390,
    output := OriginalRow227TriangleData1341.coefficient102_390, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1331.coefficient101_392, Icur := OriginalRow227TriangleData1331.coefficient101_391,
    output := OriginalRow227TriangleData1341.coefficient102_391, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1331.coefficient101_393, Icur := OriginalRow227TriangleData1331.coefficient101_392,
    output := OriginalRow227TriangleData1341.coefficient102_392, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1331.coefficient101_394, Icur := OriginalRow227TriangleData1331.coefficient101_393,
    output := OriginalRow227TriangleData1341.coefficient102_393, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1331.coefficient101_395, Icur := OriginalRow227TriangleData1331.coefficient101_394,
    output := OriginalRow227TriangleData1341.coefficient102_394, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1331.coefficient101_396, Icur := OriginalRow227TriangleData1331.coefficient101_395,
    output := OriginalRow227TriangleData1341.coefficient102_395, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1331.coefficient101_397, Icur := OriginalRow227TriangleData1331.coefficient101_396,
    output := OriginalRow227TriangleData1341.coefficient102_396, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1331.coefficient101_398, Icur := OriginalRow227TriangleData1331.coefficient101_397,
    output := OriginalRow227TriangleData1341.coefficient102_397, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1331.coefficient101_399, Icur := OriginalRow227TriangleData1331.coefficient101_398,
    output := OriginalRow227TriangleData1341.coefficient102_398, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots03.root102,
    Inext := OriginalRow227TriangleData1331.coefficient101_400, Icur := OriginalRow227TriangleData1331.coefficient101_399,
    output := OriginalRow227TriangleData1341.coefficient102_399, hC := OriginalRow227TriangleRoots03.root102_pos, hAC := OriginalRow227TriangleRoots03.product102_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1325

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1325.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

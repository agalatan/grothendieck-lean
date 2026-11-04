import Grothe.UpperChaos.OriginalRow227TriangleData1321
import Grothe.UpperChaos.OriginalRow227TriangleData1331
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1315
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1321.coefficient100_389, Icur := OriginalRow227TriangleData1321.coefficient100_388,
    output := OriginalRow227TriangleData1331.coefficient101_388, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1321.coefficient100_390, Icur := OriginalRow227TriangleData1321.coefficient100_389,
    output := OriginalRow227TriangleData1331.coefficient101_389, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1321.coefficient100_391, Icur := OriginalRow227TriangleData1321.coefficient100_390,
    output := OriginalRow227TriangleData1331.coefficient101_390, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1321.coefficient100_392, Icur := OriginalRow227TriangleData1321.coefficient100_391,
    output := OriginalRow227TriangleData1331.coefficient101_391, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1321.coefficient100_393, Icur := OriginalRow227TriangleData1321.coefficient100_392,
    output := OriginalRow227TriangleData1331.coefficient101_392, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1321.coefficient100_394, Icur := OriginalRow227TriangleData1321.coefficient100_393,
    output := OriginalRow227TriangleData1331.coefficient101_393, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1321.coefficient100_395, Icur := OriginalRow227TriangleData1321.coefficient100_394,
    output := OriginalRow227TriangleData1331.coefficient101_394, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1321.coefficient100_396, Icur := OriginalRow227TriangleData1321.coefficient100_395,
    output := OriginalRow227TriangleData1331.coefficient101_395, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1321.coefficient100_397, Icur := OriginalRow227TriangleData1321.coefficient100_396,
    output := OriginalRow227TriangleData1331.coefficient101_396, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1321.coefficient100_398, Icur := OriginalRow227TriangleData1321.coefficient100_397,
    output := OriginalRow227TriangleData1331.coefficient101_397, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1321.coefficient100_399, Icur := OriginalRow227TriangleData1321.coefficient100_398,
    output := OriginalRow227TriangleData1331.coefficient101_398, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots12.root400, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1321.coefficient100_400, Icur := OriginalRow227TriangleData1321.coefficient100_399,
    output := OriginalRow227TriangleData1331.coefficient101_399, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots12.root401, IC := OriginalRow227TriangleRoots03.root101,
    Inext := OriginalRow227TriangleData1321.coefficient100_401, Icur := OriginalRow227TriangleData1321.coefficient100_400,
    output := OriginalRow227TriangleData1331.coefficient101_400, hC := OriginalRow227TriangleRoots03.root101_pos, hAC := OriginalRow227TriangleRoots03.product101_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1315

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1315.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

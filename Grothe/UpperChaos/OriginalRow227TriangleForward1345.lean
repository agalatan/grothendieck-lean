import Grothe.UpperChaos.OriginalRow227TriangleData1351
import Grothe.UpperChaos.OriginalRow227TriangleData1361
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1345
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1351.coefficient103_392, Icur := OriginalRow227TriangleData1351.coefficient103_391,
    output := OriginalRow227TriangleData1361.coefficient104_391, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1351.coefficient103_393, Icur := OriginalRow227TriangleData1351.coefficient103_392,
    output := OriginalRow227TriangleData1361.coefficient104_392, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1351.coefficient103_394, Icur := OriginalRow227TriangleData1351.coefficient103_393,
    output := OriginalRow227TriangleData1361.coefficient104_393, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1351.coefficient103_395, Icur := OriginalRow227TriangleData1351.coefficient103_394,
    output := OriginalRow227TriangleData1361.coefficient104_394, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1351.coefficient103_396, Icur := OriginalRow227TriangleData1351.coefficient103_395,
    output := OriginalRow227TriangleData1361.coefficient104_395, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1351.coefficient103_397, Icur := OriginalRow227TriangleData1351.coefficient103_396,
    output := OriginalRow227TriangleData1361.coefficient104_396, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots03.root104,
    Inext := OriginalRow227TriangleData1351.coefficient103_398, Icur := OriginalRow227TriangleData1351.coefficient103_397,
    output := OriginalRow227TriangleData1361.coefficient104_397, hC := OriginalRow227TriangleRoots03.root104_pos, hAC := OriginalRow227TriangleRoots03.product104_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1345

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1345.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

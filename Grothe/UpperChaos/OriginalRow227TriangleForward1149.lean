import Grothe.UpperChaos.OriginalRow227TriangleData1154
import Grothe.UpperChaos.OriginalRow227TriangleData1165
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1149
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 321, IA := shift, ID := OriginalRow227TriangleRoots12.root405, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1154.coefficient84_405, Icur := OriginalRow227TriangleData1154.coefficient84_404,
    output := OriginalRow227TriangleData1165.coefficient85_404, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 322, IA := shift, ID := OriginalRow227TriangleRoots12.root406, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1154.coefficient84_406, Icur := OriginalRow227TriangleData1154.coefficient84_405,
    output := OriginalRow227TriangleData1165.coefficient85_405, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 323, IA := shift, ID := OriginalRow227TriangleRoots12.root407, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1154.coefficient84_407, Icur := OriginalRow227TriangleData1154.coefficient84_406,
    output := OriginalRow227TriangleData1165.coefficient85_406, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 324, IA := shift, ID := OriginalRow227TriangleRoots12.root408, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1154.coefficient84_408, Icur := OriginalRow227TriangleData1154.coefficient84_407,
    output := OriginalRow227TriangleData1165.coefficient85_407, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 325, IA := shift, ID := OriginalRow227TriangleRoots12.root409, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1154.coefficient84_409, Icur := OriginalRow227TriangleData1154.coefficient84_408,
    output := OriginalRow227TriangleData1165.coefficient85_408, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 326, IA := shift, ID := OriginalRow227TriangleRoots12.root410, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1154.coefficient84_410, Icur := OriginalRow227TriangleData1154.coefficient84_409,
    output := OriginalRow227TriangleData1165.coefficient85_409, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 327, IA := shift, ID := OriginalRow227TriangleRoots12.root411, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1154.coefficient84_411, Icur := OriginalRow227TriangleData1154.coefficient84_410,
    output := OriginalRow227TriangleData1165.coefficient85_410, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 328, IA := shift, ID := OriginalRow227TriangleRoots12.root412, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1154.coefficient84_412, Icur := OriginalRow227TriangleData1154.coefficient84_411,
    output := OriginalRow227TriangleData1165.coefficient85_411, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 329, IA := shift, ID := OriginalRow227TriangleRoots12.root413, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1154.coefficient84_413, Icur := OriginalRow227TriangleData1154.coefficient84_412,
    output := OriginalRow227TriangleData1165.coefficient85_412, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 330, IA := shift, ID := OriginalRow227TriangleRoots12.root414, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1154.coefficient84_414, Icur := OriginalRow227TriangleData1154.coefficient84_413,
    output := OriginalRow227TriangleData1165.coefficient85_413, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 331, IA := shift, ID := OriginalRow227TriangleRoots12.root415, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1154.coefficient84_415, Icur := OriginalRow227TriangleData1154.coefficient84_414,
    output := OriginalRow227TriangleData1165.coefficient85_414, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 332, IA := shift, ID := OriginalRow227TriangleRoots12.root416, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1154.coefficient84_416, Icur := OriginalRow227TriangleData1154.coefficient84_415,
    output := OriginalRow227TriangleData1165.coefficient85_415, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 333, IA := shift, ID := OriginalRow227TriangleRoots13.root417, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1154.coefficient84_417, Icur := OriginalRow227TriangleData1154.coefficient84_416,
    output := OriginalRow227TriangleData1165.coefficient85_416, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1149

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1149.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

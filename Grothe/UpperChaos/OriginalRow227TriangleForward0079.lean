import Grothe.UpperChaos.OriginalRow227TriangleData0079
import Grothe.UpperChaos.OriginalRow227TriangleData0095
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots15
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0079
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 481, IA := shift, ID := OriginalRow227TriangleRoots15.root485, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0079.coefficient4_485, Icur := OriginalRow227TriangleData0079.coefficient4_484,
    output := OriginalRow227TriangleData0095.coefficient5_484, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 482, IA := shift, ID := OriginalRow227TriangleRoots15.root486, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0079.coefficient4_486, Icur := OriginalRow227TriangleData0079.coefficient4_485,
    output := OriginalRow227TriangleData0095.coefficient5_485, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 483, IA := shift, ID := OriginalRow227TriangleRoots15.root487, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0079.coefficient4_487, Icur := OriginalRow227TriangleData0079.coefficient4_486,
    output := OriginalRow227TriangleData0095.coefficient5_486, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 484, IA := shift, ID := OriginalRow227TriangleRoots15.root488, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0079.coefficient4_488, Icur := OriginalRow227TriangleData0079.coefficient4_487,
    output := OriginalRow227TriangleData0095.coefficient5_487, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 485, IA := shift, ID := OriginalRow227TriangleRoots15.root489, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0079.coefficient4_489, Icur := OriginalRow227TriangleData0079.coefficient4_488,
    output := OriginalRow227TriangleData0095.coefficient5_488, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 486, IA := shift, ID := OriginalRow227TriangleRoots15.root490, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0079.coefficient4_490, Icur := OriginalRow227TriangleData0079.coefficient4_489,
    output := OriginalRow227TriangleData0095.coefficient5_489, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 487, IA := shift, ID := OriginalRow227TriangleRoots15.root491, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0079.coefficient4_491, Icur := OriginalRow227TriangleData0079.coefficient4_490,
    output := OriginalRow227TriangleData0095.coefficient5_490, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 488, IA := shift, ID := OriginalRow227TriangleRoots15.root492, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0079.coefficient4_492, Icur := OriginalRow227TriangleData0079.coefficient4_491,
    output := OriginalRow227TriangleData0095.coefficient5_491, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 489, IA := shift, ID := OriginalRow227TriangleRoots15.root493, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0079.coefficient4_493, Icur := OriginalRow227TriangleData0079.coefficient4_492,
    output := OriginalRow227TriangleData0095.coefficient5_492, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 490, IA := shift, ID := OriginalRow227TriangleRoots15.root494, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0079.coefficient4_494, Icur := OriginalRow227TriangleData0079.coefficient4_493,
    output := OriginalRow227TriangleData0095.coefficient5_493, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 491, IA := shift, ID := OriginalRow227TriangleRoots15.root495, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0079.coefficient4_495, Icur := OriginalRow227TriangleData0079.coefficient4_494,
    output := OriginalRow227TriangleData0095.coefficient5_494, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 492, IA := shift, ID := OriginalRow227TriangleRoots15.root496, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0079.coefficient4_496, Icur := OriginalRow227TriangleData0079.coefficient4_495,
    output := OriginalRow227TriangleData0095.coefficient5_495, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 493, IA := shift, ID := OriginalRow227TriangleRoots15.root497, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0079.coefficient4_497, Icur := OriginalRow227TriangleData0079.coefficient4_496,
    output := OriginalRow227TriangleData0095.coefficient5_496, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0079

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0079.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

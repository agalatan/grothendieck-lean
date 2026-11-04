import Grothe.UpperChaos.OriginalRow227TriangleData0095
import Grothe.UpperChaos.OriginalRow227TriangleData0111
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots15
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0095
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 481, IA := shift, ID := OriginalRow227TriangleRoots15.root486, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0095.coefficient5_486, Icur := OriginalRow227TriangleData0095.coefficient5_485,
    output := OriginalRow227TriangleData0111.coefficient6_485, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 482, IA := shift, ID := OriginalRow227TriangleRoots15.root487, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0095.coefficient5_487, Icur := OriginalRow227TriangleData0095.coefficient5_486,
    output := OriginalRow227TriangleData0111.coefficient6_486, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 483, IA := shift, ID := OriginalRow227TriangleRoots15.root488, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0095.coefficient5_488, Icur := OriginalRow227TriangleData0095.coefficient5_487,
    output := OriginalRow227TriangleData0111.coefficient6_487, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 484, IA := shift, ID := OriginalRow227TriangleRoots15.root489, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0095.coefficient5_489, Icur := OriginalRow227TriangleData0095.coefficient5_488,
    output := OriginalRow227TriangleData0111.coefficient6_488, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 485, IA := shift, ID := OriginalRow227TriangleRoots15.root490, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0095.coefficient5_490, Icur := OriginalRow227TriangleData0095.coefficient5_489,
    output := OriginalRow227TriangleData0111.coefficient6_489, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 486, IA := shift, ID := OriginalRow227TriangleRoots15.root491, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0095.coefficient5_491, Icur := OriginalRow227TriangleData0095.coefficient5_490,
    output := OriginalRow227TriangleData0111.coefficient6_490, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 487, IA := shift, ID := OriginalRow227TriangleRoots15.root492, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0095.coefficient5_492, Icur := OriginalRow227TriangleData0095.coefficient5_491,
    output := OriginalRow227TriangleData0111.coefficient6_491, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 488, IA := shift, ID := OriginalRow227TriangleRoots15.root493, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0095.coefficient5_493, Icur := OriginalRow227TriangleData0095.coefficient5_492,
    output := OriginalRow227TriangleData0111.coefficient6_492, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 489, IA := shift, ID := OriginalRow227TriangleRoots15.root494, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0095.coefficient5_494, Icur := OriginalRow227TriangleData0095.coefficient5_493,
    output := OriginalRow227TriangleData0111.coefficient6_493, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 490, IA := shift, ID := OriginalRow227TriangleRoots15.root495, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0095.coefficient5_495, Icur := OriginalRow227TriangleData0095.coefficient5_494,
    output := OriginalRow227TriangleData0111.coefficient6_494, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos },
  { charge := 491, IA := shift, ID := OriginalRow227TriangleRoots15.root496, IC := OriginalRow227TriangleRoots00.root6,
    Inext := OriginalRow227TriangleData0095.coefficient5_496, Icur := OriginalRow227TriangleData0095.coefficient5_495,
    output := OriginalRow227TriangleData0111.coefficient6_495, hC := OriginalRow227TriangleRoots00.root6_pos, hAC := OriginalRow227TriangleRoots00.product6_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0095

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0095.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

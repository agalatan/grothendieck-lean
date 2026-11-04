import Grothe.UpperChaos.OriginalRow227TriangleData0111
import Grothe.UpperChaos.OriginalRow227TriangleData0127
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots15
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0111
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 481, IA := shift, ID := OriginalRow227TriangleRoots15.root487, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0111.coefficient6_487, Icur := OriginalRow227TriangleData0111.coefficient6_486,
    output := OriginalRow227TriangleData0127.coefficient7_486, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 482, IA := shift, ID := OriginalRow227TriangleRoots15.root488, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0111.coefficient6_488, Icur := OriginalRow227TriangleData0111.coefficient6_487,
    output := OriginalRow227TriangleData0127.coefficient7_487, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 483, IA := shift, ID := OriginalRow227TriangleRoots15.root489, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0111.coefficient6_489, Icur := OriginalRow227TriangleData0111.coefficient6_488,
    output := OriginalRow227TriangleData0127.coefficient7_488, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 484, IA := shift, ID := OriginalRow227TriangleRoots15.root490, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0111.coefficient6_490, Icur := OriginalRow227TriangleData0111.coefficient6_489,
    output := OriginalRow227TriangleData0127.coefficient7_489, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 485, IA := shift, ID := OriginalRow227TriangleRoots15.root491, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0111.coefficient6_491, Icur := OriginalRow227TriangleData0111.coefficient6_490,
    output := OriginalRow227TriangleData0127.coefficient7_490, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 486, IA := shift, ID := OriginalRow227TriangleRoots15.root492, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0111.coefficient6_492, Icur := OriginalRow227TriangleData0111.coefficient6_491,
    output := OriginalRow227TriangleData0127.coefficient7_491, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 487, IA := shift, ID := OriginalRow227TriangleRoots15.root493, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0111.coefficient6_493, Icur := OriginalRow227TriangleData0111.coefficient6_492,
    output := OriginalRow227TriangleData0127.coefficient7_492, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 488, IA := shift, ID := OriginalRow227TriangleRoots15.root494, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0111.coefficient6_494, Icur := OriginalRow227TriangleData0111.coefficient6_493,
    output := OriginalRow227TriangleData0127.coefficient7_493, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 489, IA := shift, ID := OriginalRow227TriangleRoots15.root495, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0111.coefficient6_495, Icur := OriginalRow227TriangleData0111.coefficient6_494,
    output := OriginalRow227TriangleData0127.coefficient7_494, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0111

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0111.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

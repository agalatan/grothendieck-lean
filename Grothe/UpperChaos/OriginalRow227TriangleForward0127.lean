import Grothe.UpperChaos.OriginalRow227TriangleData0127
import Grothe.UpperChaos.OriginalRow227TriangleData0143
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots15
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0127
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 481, IA := shift, ID := OriginalRow227TriangleRoots15.root488, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0127.coefficient7_488, Icur := OriginalRow227TriangleData0127.coefficient7_487,
    output := OriginalRow227TriangleData0143.coefficient8_487, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 482, IA := shift, ID := OriginalRow227TriangleRoots15.root489, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0127.coefficient7_489, Icur := OriginalRow227TriangleData0127.coefficient7_488,
    output := OriginalRow227TriangleData0143.coefficient8_488, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 483, IA := shift, ID := OriginalRow227TriangleRoots15.root490, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0127.coefficient7_490, Icur := OriginalRow227TriangleData0127.coefficient7_489,
    output := OriginalRow227TriangleData0143.coefficient8_489, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 484, IA := shift, ID := OriginalRow227TriangleRoots15.root491, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0127.coefficient7_491, Icur := OriginalRow227TriangleData0127.coefficient7_490,
    output := OriginalRow227TriangleData0143.coefficient8_490, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 485, IA := shift, ID := OriginalRow227TriangleRoots15.root492, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0127.coefficient7_492, Icur := OriginalRow227TriangleData0127.coefficient7_491,
    output := OriginalRow227TriangleData0143.coefficient8_491, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 486, IA := shift, ID := OriginalRow227TriangleRoots15.root493, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0127.coefficient7_493, Icur := OriginalRow227TriangleData0127.coefficient7_492,
    output := OriginalRow227TriangleData0143.coefficient8_492, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 487, IA := shift, ID := OriginalRow227TriangleRoots15.root494, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0127.coefficient7_494, Icur := OriginalRow227TriangleData0127.coefficient7_493,
    output := OriginalRow227TriangleData0143.coefficient8_493, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0127

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0127.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

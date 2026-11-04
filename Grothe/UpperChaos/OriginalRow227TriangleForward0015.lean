import Grothe.UpperChaos.OriginalRow227TriangleData0015
import Grothe.UpperChaos.OriginalRow227TriangleData0031
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots15
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0015
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 481, IA := shift, ID := OriginalRow227TriangleRoots15.root481, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_481, Icur := OriginalRow227TriangleData0015.coefficient0_480,
    output := OriginalRow227TriangleData0031.coefficient1_480, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 482, IA := shift, ID := OriginalRow227TriangleRoots15.root482, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_482, Icur := OriginalRow227TriangleData0015.coefficient0_481,
    output := OriginalRow227TriangleData0031.coefficient1_481, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 483, IA := shift, ID := OriginalRow227TriangleRoots15.root483, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_483, Icur := OriginalRow227TriangleData0015.coefficient0_482,
    output := OriginalRow227TriangleData0031.coefficient1_482, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 484, IA := shift, ID := OriginalRow227TriangleRoots15.root484, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_484, Icur := OriginalRow227TriangleData0015.coefficient0_483,
    output := OriginalRow227TriangleData0031.coefficient1_483, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 485, IA := shift, ID := OriginalRow227TriangleRoots15.root485, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_485, Icur := OriginalRow227TriangleData0015.coefficient0_484,
    output := OriginalRow227TriangleData0031.coefficient1_484, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 486, IA := shift, ID := OriginalRow227TriangleRoots15.root486, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_486, Icur := OriginalRow227TriangleData0015.coefficient0_485,
    output := OriginalRow227TriangleData0031.coefficient1_485, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 487, IA := shift, ID := OriginalRow227TriangleRoots15.root487, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_487, Icur := OriginalRow227TriangleData0015.coefficient0_486,
    output := OriginalRow227TriangleData0031.coefficient1_486, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 488, IA := shift, ID := OriginalRow227TriangleRoots15.root488, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_488, Icur := OriginalRow227TriangleData0015.coefficient0_487,
    output := OriginalRow227TriangleData0031.coefficient1_487, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 489, IA := shift, ID := OriginalRow227TriangleRoots15.root489, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_489, Icur := OriginalRow227TriangleData0015.coefficient0_488,
    output := OriginalRow227TriangleData0031.coefficient1_488, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 490, IA := shift, ID := OriginalRow227TriangleRoots15.root490, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_490, Icur := OriginalRow227TriangleData0015.coefficient0_489,
    output := OriginalRow227TriangleData0031.coefficient1_489, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 491, IA := shift, ID := OriginalRow227TriangleRoots15.root491, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_491, Icur := OriginalRow227TriangleData0015.coefficient0_490,
    output := OriginalRow227TriangleData0031.coefficient1_490, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 492, IA := shift, ID := OriginalRow227TriangleRoots15.root492, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_492, Icur := OriginalRow227TriangleData0015.coefficient0_491,
    output := OriginalRow227TriangleData0031.coefficient1_491, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 493, IA := shift, ID := OriginalRow227TriangleRoots15.root493, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_493, Icur := OriginalRow227TriangleData0015.coefficient0_492,
    output := OriginalRow227TriangleData0031.coefficient1_492, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 494, IA := shift, ID := OriginalRow227TriangleRoots15.root494, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_494, Icur := OriginalRow227TriangleData0015.coefficient0_493,
    output := OriginalRow227TriangleData0031.coefficient1_493, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 495, IA := shift, ID := OriginalRow227TriangleRoots15.root495, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_495, Icur := OriginalRow227TriangleData0015.coefficient0_494,
    output := OriginalRow227TriangleData0031.coefficient1_494, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 496, IA := shift, ID := OriginalRow227TriangleRoots15.root496, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_496, Icur := OriginalRow227TriangleData0015.coefficient0_495,
    output := OriginalRow227TriangleData0031.coefficient1_495, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 497, IA := shift, ID := OriginalRow227TriangleRoots15.root497, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_497, Icur := OriginalRow227TriangleData0015.coefficient0_496,
    output := OriginalRow227TriangleData0031.coefficient1_496, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 498, IA := shift, ID := OriginalRow227TriangleRoots15.root498, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_498, Icur := OriginalRow227TriangleData0015.coefficient0_497,
    output := OriginalRow227TriangleData0031.coefficient1_497, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 499, IA := shift, ID := OriginalRow227TriangleRoots15.root499, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_499, Icur := OriginalRow227TriangleData0015.coefficient0_498,
    output := OriginalRow227TriangleData0031.coefficient1_498, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 500, IA := shift, ID := OriginalRow227TriangleRoots15.root500, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_500, Icur := OriginalRow227TriangleData0015.coefficient0_499,
    output := OriginalRow227TriangleData0031.coefficient1_499, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 501, IA := shift, ID := OriginalRow227TriangleRoots15.root501, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0015.coefficient0_501, Icur := OriginalRow227TriangleData0015.coefficient0_500,
    output := OriginalRow227TriangleData0031.coefficient1_500, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0015

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0015.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

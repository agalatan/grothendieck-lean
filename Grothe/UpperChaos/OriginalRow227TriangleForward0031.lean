import Grothe.UpperChaos.OriginalRow227TriangleData0031
import Grothe.UpperChaos.OriginalRow227TriangleData0047
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots15
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0031
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 481, IA := shift, ID := OriginalRow227TriangleRoots15.root482, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_482, Icur := OriginalRow227TriangleData0031.coefficient1_481,
    output := OriginalRow227TriangleData0047.coefficient2_481, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 482, IA := shift, ID := OriginalRow227TriangleRoots15.root483, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_483, Icur := OriginalRow227TriangleData0031.coefficient1_482,
    output := OriginalRow227TriangleData0047.coefficient2_482, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 483, IA := shift, ID := OriginalRow227TriangleRoots15.root484, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_484, Icur := OriginalRow227TriangleData0031.coefficient1_483,
    output := OriginalRow227TriangleData0047.coefficient2_483, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 484, IA := shift, ID := OriginalRow227TriangleRoots15.root485, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_485, Icur := OriginalRow227TriangleData0031.coefficient1_484,
    output := OriginalRow227TriangleData0047.coefficient2_484, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 485, IA := shift, ID := OriginalRow227TriangleRoots15.root486, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_486, Icur := OriginalRow227TriangleData0031.coefficient1_485,
    output := OriginalRow227TriangleData0047.coefficient2_485, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 486, IA := shift, ID := OriginalRow227TriangleRoots15.root487, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_487, Icur := OriginalRow227TriangleData0031.coefficient1_486,
    output := OriginalRow227TriangleData0047.coefficient2_486, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 487, IA := shift, ID := OriginalRow227TriangleRoots15.root488, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_488, Icur := OriginalRow227TriangleData0031.coefficient1_487,
    output := OriginalRow227TriangleData0047.coefficient2_487, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 488, IA := shift, ID := OriginalRow227TriangleRoots15.root489, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_489, Icur := OriginalRow227TriangleData0031.coefficient1_488,
    output := OriginalRow227TriangleData0047.coefficient2_488, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 489, IA := shift, ID := OriginalRow227TriangleRoots15.root490, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_490, Icur := OriginalRow227TriangleData0031.coefficient1_489,
    output := OriginalRow227TriangleData0047.coefficient2_489, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 490, IA := shift, ID := OriginalRow227TriangleRoots15.root491, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_491, Icur := OriginalRow227TriangleData0031.coefficient1_490,
    output := OriginalRow227TriangleData0047.coefficient2_490, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 491, IA := shift, ID := OriginalRow227TriangleRoots15.root492, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_492, Icur := OriginalRow227TriangleData0031.coefficient1_491,
    output := OriginalRow227TriangleData0047.coefficient2_491, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 492, IA := shift, ID := OriginalRow227TriangleRoots15.root493, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_493, Icur := OriginalRow227TriangleData0031.coefficient1_492,
    output := OriginalRow227TriangleData0047.coefficient2_492, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 493, IA := shift, ID := OriginalRow227TriangleRoots15.root494, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_494, Icur := OriginalRow227TriangleData0031.coefficient1_493,
    output := OriginalRow227TriangleData0047.coefficient2_493, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 494, IA := shift, ID := OriginalRow227TriangleRoots15.root495, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_495, Icur := OriginalRow227TriangleData0031.coefficient1_494,
    output := OriginalRow227TriangleData0047.coefficient2_494, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 495, IA := shift, ID := OriginalRow227TriangleRoots15.root496, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_496, Icur := OriginalRow227TriangleData0031.coefficient1_495,
    output := OriginalRow227TriangleData0047.coefficient2_495, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 496, IA := shift, ID := OriginalRow227TriangleRoots15.root497, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_497, Icur := OriginalRow227TriangleData0031.coefficient1_496,
    output := OriginalRow227TriangleData0047.coefficient2_496, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 497, IA := shift, ID := OriginalRow227TriangleRoots15.root498, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_498, Icur := OriginalRow227TriangleData0031.coefficient1_497,
    output := OriginalRow227TriangleData0047.coefficient2_497, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 498, IA := shift, ID := OriginalRow227TriangleRoots15.root499, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_499, Icur := OriginalRow227TriangleData0031.coefficient1_498,
    output := OriginalRow227TriangleData0047.coefficient2_498, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 499, IA := shift, ID := OriginalRow227TriangleRoots15.root500, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_500, Icur := OriginalRow227TriangleData0031.coefficient1_499,
    output := OriginalRow227TriangleData0047.coefficient2_499, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0031

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0031.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

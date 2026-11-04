import Grothe.UpperChaos.OriginalRow227TriangleData0206
import Grothe.UpperChaos.OriginalRow227TriangleData0221
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots14
import Grothe.UpperChaos.OriginalRow227TriangleRoots15
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0205
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 449, IA := shift, ID := OriginalRow227TriangleRoots14.root461, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_461, Icur := OriginalRow227TriangleData0206.coefficient12_460,
    output := OriginalRow227TriangleData0221.coefficient13_460, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 450, IA := shift, ID := OriginalRow227TriangleRoots14.root462, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_462, Icur := OriginalRow227TriangleData0206.coefficient12_461,
    output := OriginalRow227TriangleData0221.coefficient13_461, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 451, IA := shift, ID := OriginalRow227TriangleRoots14.root463, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_463, Icur := OriginalRow227TriangleData0206.coefficient12_462,
    output := OriginalRow227TriangleData0221.coefficient13_462, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 452, IA := shift, ID := OriginalRow227TriangleRoots14.root464, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_464, Icur := OriginalRow227TriangleData0206.coefficient12_463,
    output := OriginalRow227TriangleData0221.coefficient13_463, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 453, IA := shift, ID := OriginalRow227TriangleRoots14.root465, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_465, Icur := OriginalRow227TriangleData0206.coefficient12_464,
    output := OriginalRow227TriangleData0221.coefficient13_464, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 454, IA := shift, ID := OriginalRow227TriangleRoots14.root466, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_466, Icur := OriginalRow227TriangleData0206.coefficient12_465,
    output := OriginalRow227TriangleData0221.coefficient13_465, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 455, IA := shift, ID := OriginalRow227TriangleRoots14.root467, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_467, Icur := OriginalRow227TriangleData0206.coefficient12_466,
    output := OriginalRow227TriangleData0221.coefficient13_466, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 456, IA := shift, ID := OriginalRow227TriangleRoots14.root468, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_468, Icur := OriginalRow227TriangleData0206.coefficient12_467,
    output := OriginalRow227TriangleData0221.coefficient13_467, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 457, IA := shift, ID := OriginalRow227TriangleRoots14.root469, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_469, Icur := OriginalRow227TriangleData0206.coefficient12_468,
    output := OriginalRow227TriangleData0221.coefficient13_468, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 458, IA := shift, ID := OriginalRow227TriangleRoots14.root470, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_470, Icur := OriginalRow227TriangleData0206.coefficient12_469,
    output := OriginalRow227TriangleData0221.coefficient13_469, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 459, IA := shift, ID := OriginalRow227TriangleRoots14.root471, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_471, Icur := OriginalRow227TriangleData0206.coefficient12_470,
    output := OriginalRow227TriangleData0221.coefficient13_470, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 460, IA := shift, ID := OriginalRow227TriangleRoots14.root472, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_472, Icur := OriginalRow227TriangleData0206.coefficient12_471,
    output := OriginalRow227TriangleData0221.coefficient13_471, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 461, IA := shift, ID := OriginalRow227TriangleRoots14.root473, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_473, Icur := OriginalRow227TriangleData0206.coefficient12_472,
    output := OriginalRow227TriangleData0221.coefficient13_472, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 462, IA := shift, ID := OriginalRow227TriangleRoots14.root474, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_474, Icur := OriginalRow227TriangleData0206.coefficient12_473,
    output := OriginalRow227TriangleData0221.coefficient13_473, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 463, IA := shift, ID := OriginalRow227TriangleRoots14.root475, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_475, Icur := OriginalRow227TriangleData0206.coefficient12_474,
    output := OriginalRow227TriangleData0221.coefficient13_474, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 464, IA := shift, ID := OriginalRow227TriangleRoots14.root476, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_476, Icur := OriginalRow227TriangleData0206.coefficient12_475,
    output := OriginalRow227TriangleData0221.coefficient13_475, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 465, IA := shift, ID := OriginalRow227TriangleRoots14.root477, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_477, Icur := OriginalRow227TriangleData0206.coefficient12_476,
    output := OriginalRow227TriangleData0221.coefficient13_476, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 466, IA := shift, ID := OriginalRow227TriangleRoots14.root478, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_478, Icur := OriginalRow227TriangleData0206.coefficient12_477,
    output := OriginalRow227TriangleData0221.coefficient13_477, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 467, IA := shift, ID := OriginalRow227TriangleRoots14.root479, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_479, Icur := OriginalRow227TriangleData0206.coefficient12_478,
    output := OriginalRow227TriangleData0221.coefficient13_478, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 468, IA := shift, ID := OriginalRow227TriangleRoots14.root480, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_480, Icur := OriginalRow227TriangleData0206.coefficient12_479,
    output := OriginalRow227TriangleData0221.coefficient13_479, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 469, IA := shift, ID := OriginalRow227TriangleRoots15.root481, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_481, Icur := OriginalRow227TriangleData0206.coefficient12_480,
    output := OriginalRow227TriangleData0221.coefficient13_480, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 470, IA := shift, ID := OriginalRow227TriangleRoots15.root482, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_482, Icur := OriginalRow227TriangleData0206.coefficient12_481,
    output := OriginalRow227TriangleData0221.coefficient13_481, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 471, IA := shift, ID := OriginalRow227TriangleRoots15.root483, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_483, Icur := OriginalRow227TriangleData0206.coefficient12_482,
    output := OriginalRow227TriangleData0221.coefficient13_482, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 472, IA := shift, ID := OriginalRow227TriangleRoots15.root484, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_484, Icur := OriginalRow227TriangleData0206.coefficient12_483,
    output := OriginalRow227TriangleData0221.coefficient13_483, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 473, IA := shift, ID := OriginalRow227TriangleRoots15.root485, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_485, Icur := OriginalRow227TriangleData0206.coefficient12_484,
    output := OriginalRow227TriangleData0221.coefficient13_484, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 474, IA := shift, ID := OriginalRow227TriangleRoots15.root486, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_486, Icur := OriginalRow227TriangleData0206.coefficient12_485,
    output := OriginalRow227TriangleData0221.coefficient13_485, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 475, IA := shift, ID := OriginalRow227TriangleRoots15.root487, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_487, Icur := OriginalRow227TriangleData0206.coefficient12_486,
    output := OriginalRow227TriangleData0221.coefficient13_486, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 476, IA := shift, ID := OriginalRow227TriangleRoots15.root488, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_488, Icur := OriginalRow227TriangleData0206.coefficient12_487,
    output := OriginalRow227TriangleData0221.coefficient13_487, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 477, IA := shift, ID := OriginalRow227TriangleRoots15.root489, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0206.coefficient12_489, Icur := OriginalRow227TriangleData0206.coefficient12_488,
    output := OriginalRow227TriangleData0221.coefficient13_488, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0205

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0205.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

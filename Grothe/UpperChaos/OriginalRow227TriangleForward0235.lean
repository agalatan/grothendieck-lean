import Grothe.UpperChaos.OriginalRow227TriangleData0236
import Grothe.UpperChaos.OriginalRow227TriangleData0251
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0235
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 449, IA := shift, ID := OriginalRow227TriangleRoots14.root463, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_463, Icur := OriginalRow227TriangleData0236.coefficient14_462,
    output := OriginalRow227TriangleData0251.coefficient15_462, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 450, IA := shift, ID := OriginalRow227TriangleRoots14.root464, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_464, Icur := OriginalRow227TriangleData0236.coefficient14_463,
    output := OriginalRow227TriangleData0251.coefficient15_463, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 451, IA := shift, ID := OriginalRow227TriangleRoots14.root465, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_465, Icur := OriginalRow227TriangleData0236.coefficient14_464,
    output := OriginalRow227TriangleData0251.coefficient15_464, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 452, IA := shift, ID := OriginalRow227TriangleRoots14.root466, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_466, Icur := OriginalRow227TriangleData0236.coefficient14_465,
    output := OriginalRow227TriangleData0251.coefficient15_465, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 453, IA := shift, ID := OriginalRow227TriangleRoots14.root467, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_467, Icur := OriginalRow227TriangleData0236.coefficient14_466,
    output := OriginalRow227TriangleData0251.coefficient15_466, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 454, IA := shift, ID := OriginalRow227TriangleRoots14.root468, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_468, Icur := OriginalRow227TriangleData0236.coefficient14_467,
    output := OriginalRow227TriangleData0251.coefficient15_467, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 455, IA := shift, ID := OriginalRow227TriangleRoots14.root469, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_469, Icur := OriginalRow227TriangleData0236.coefficient14_468,
    output := OriginalRow227TriangleData0251.coefficient15_468, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 456, IA := shift, ID := OriginalRow227TriangleRoots14.root470, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_470, Icur := OriginalRow227TriangleData0236.coefficient14_469,
    output := OriginalRow227TriangleData0251.coefficient15_469, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 457, IA := shift, ID := OriginalRow227TriangleRoots14.root471, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_471, Icur := OriginalRow227TriangleData0236.coefficient14_470,
    output := OriginalRow227TriangleData0251.coefficient15_470, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 458, IA := shift, ID := OriginalRow227TriangleRoots14.root472, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_472, Icur := OriginalRow227TriangleData0236.coefficient14_471,
    output := OriginalRow227TriangleData0251.coefficient15_471, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 459, IA := shift, ID := OriginalRow227TriangleRoots14.root473, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_473, Icur := OriginalRow227TriangleData0236.coefficient14_472,
    output := OriginalRow227TriangleData0251.coefficient15_472, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 460, IA := shift, ID := OriginalRow227TriangleRoots14.root474, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_474, Icur := OriginalRow227TriangleData0236.coefficient14_473,
    output := OriginalRow227TriangleData0251.coefficient15_473, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 461, IA := shift, ID := OriginalRow227TriangleRoots14.root475, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_475, Icur := OriginalRow227TriangleData0236.coefficient14_474,
    output := OriginalRow227TriangleData0251.coefficient15_474, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 462, IA := shift, ID := OriginalRow227TriangleRoots14.root476, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_476, Icur := OriginalRow227TriangleData0236.coefficient14_475,
    output := OriginalRow227TriangleData0251.coefficient15_475, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 463, IA := shift, ID := OriginalRow227TriangleRoots14.root477, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_477, Icur := OriginalRow227TriangleData0236.coefficient14_476,
    output := OriginalRow227TriangleData0251.coefficient15_476, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 464, IA := shift, ID := OriginalRow227TriangleRoots14.root478, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_478, Icur := OriginalRow227TriangleData0236.coefficient14_477,
    output := OriginalRow227TriangleData0251.coefficient15_477, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 465, IA := shift, ID := OriginalRow227TriangleRoots14.root479, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_479, Icur := OriginalRow227TriangleData0236.coefficient14_478,
    output := OriginalRow227TriangleData0251.coefficient15_478, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 466, IA := shift, ID := OriginalRow227TriangleRoots14.root480, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_480, Icur := OriginalRow227TriangleData0236.coefficient14_479,
    output := OriginalRow227TriangleData0251.coefficient15_479, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 467, IA := shift, ID := OriginalRow227TriangleRoots15.root481, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_481, Icur := OriginalRow227TriangleData0236.coefficient14_480,
    output := OriginalRow227TriangleData0251.coefficient15_480, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 468, IA := shift, ID := OriginalRow227TriangleRoots15.root482, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_482, Icur := OriginalRow227TriangleData0236.coefficient14_481,
    output := OriginalRow227TriangleData0251.coefficient15_481, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 469, IA := shift, ID := OriginalRow227TriangleRoots15.root483, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_483, Icur := OriginalRow227TriangleData0236.coefficient14_482,
    output := OriginalRow227TriangleData0251.coefficient15_482, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 470, IA := shift, ID := OriginalRow227TriangleRoots15.root484, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_484, Icur := OriginalRow227TriangleData0236.coefficient14_483,
    output := OriginalRow227TriangleData0251.coefficient15_483, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 471, IA := shift, ID := OriginalRow227TriangleRoots15.root485, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_485, Icur := OriginalRow227TriangleData0236.coefficient14_484,
    output := OriginalRow227TriangleData0251.coefficient15_484, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 472, IA := shift, ID := OriginalRow227TriangleRoots15.root486, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_486, Icur := OriginalRow227TriangleData0236.coefficient14_485,
    output := OriginalRow227TriangleData0251.coefficient15_485, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 473, IA := shift, ID := OriginalRow227TriangleRoots15.root487, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_487, Icur := OriginalRow227TriangleData0236.coefficient14_486,
    output := OriginalRow227TriangleData0251.coefficient15_486, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0235

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0235.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

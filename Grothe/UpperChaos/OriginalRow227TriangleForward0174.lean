import Grothe.UpperChaos.OriginalRow227TriangleData0174
import Grothe.UpperChaos.OriginalRow227TriangleData0175
import Grothe.UpperChaos.OriginalRow227TriangleData0190
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0174
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 449, IA := shift, ID := OriginalRow227TriangleRoots14.root459, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_459, Icur := OriginalRow227TriangleData0174.coefficient10_458,
    output := OriginalRow227TriangleData0190.coefficient11_458, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 450, IA := shift, ID := OriginalRow227TriangleRoots14.root460, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_460, Icur := OriginalRow227TriangleData0174.coefficient10_459,
    output := OriginalRow227TriangleData0190.coefficient11_459, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 451, IA := shift, ID := OriginalRow227TriangleRoots14.root461, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_461, Icur := OriginalRow227TriangleData0174.coefficient10_460,
    output := OriginalRow227TriangleData0190.coefficient11_460, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 452, IA := shift, ID := OriginalRow227TriangleRoots14.root462, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_462, Icur := OriginalRow227TriangleData0174.coefficient10_461,
    output := OriginalRow227TriangleData0190.coefficient11_461, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 453, IA := shift, ID := OriginalRow227TriangleRoots14.root463, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_463, Icur := OriginalRow227TriangleData0174.coefficient10_462,
    output := OriginalRow227TriangleData0190.coefficient11_462, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 454, IA := shift, ID := OriginalRow227TriangleRoots14.root464, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_464, Icur := OriginalRow227TriangleData0174.coefficient10_463,
    output := OriginalRow227TriangleData0190.coefficient11_463, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 455, IA := shift, ID := OriginalRow227TriangleRoots14.root465, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_465, Icur := OriginalRow227TriangleData0174.coefficient10_464,
    output := OriginalRow227TriangleData0190.coefficient11_464, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 456, IA := shift, ID := OriginalRow227TriangleRoots14.root466, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_466, Icur := OriginalRow227TriangleData0174.coefficient10_465,
    output := OriginalRow227TriangleData0190.coefficient11_465, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 457, IA := shift, ID := OriginalRow227TriangleRoots14.root467, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_467, Icur := OriginalRow227TriangleData0174.coefficient10_466,
    output := OriginalRow227TriangleData0190.coefficient11_466, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 458, IA := shift, ID := OriginalRow227TriangleRoots14.root468, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_468, Icur := OriginalRow227TriangleData0174.coefficient10_467,
    output := OriginalRow227TriangleData0190.coefficient11_467, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 459, IA := shift, ID := OriginalRow227TriangleRoots14.root469, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_469, Icur := OriginalRow227TriangleData0174.coefficient10_468,
    output := OriginalRow227TriangleData0190.coefficient11_468, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 460, IA := shift, ID := OriginalRow227TriangleRoots14.root470, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_470, Icur := OriginalRow227TriangleData0174.coefficient10_469,
    output := OriginalRow227TriangleData0190.coefficient11_469, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 461, IA := shift, ID := OriginalRow227TriangleRoots14.root471, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_471, Icur := OriginalRow227TriangleData0174.coefficient10_470,
    output := OriginalRow227TriangleData0190.coefficient11_470, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 462, IA := shift, ID := OriginalRow227TriangleRoots14.root472, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_472, Icur := OriginalRow227TriangleData0174.coefficient10_471,
    output := OriginalRow227TriangleData0190.coefficient11_471, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 463, IA := shift, ID := OriginalRow227TriangleRoots14.root473, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_473, Icur := OriginalRow227TriangleData0174.coefficient10_472,
    output := OriginalRow227TriangleData0190.coefficient11_472, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 464, IA := shift, ID := OriginalRow227TriangleRoots14.root474, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_474, Icur := OriginalRow227TriangleData0174.coefficient10_473,
    output := OriginalRow227TriangleData0190.coefficient11_473, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 465, IA := shift, ID := OriginalRow227TriangleRoots14.root475, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_475, Icur := OriginalRow227TriangleData0174.coefficient10_474,
    output := OriginalRow227TriangleData0190.coefficient11_474, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 466, IA := shift, ID := OriginalRow227TriangleRoots14.root476, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_476, Icur := OriginalRow227TriangleData0174.coefficient10_475,
    output := OriginalRow227TriangleData0190.coefficient11_475, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 467, IA := shift, ID := OriginalRow227TriangleRoots14.root477, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_477, Icur := OriginalRow227TriangleData0174.coefficient10_476,
    output := OriginalRow227TriangleData0190.coefficient11_476, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 468, IA := shift, ID := OriginalRow227TriangleRoots14.root478, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_478, Icur := OriginalRow227TriangleData0174.coefficient10_477,
    output := OriginalRow227TriangleData0190.coefficient11_477, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 469, IA := shift, ID := OriginalRow227TriangleRoots14.root479, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_479, Icur := OriginalRow227TriangleData0174.coefficient10_478,
    output := OriginalRow227TriangleData0190.coefficient11_478, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 470, IA := shift, ID := OriginalRow227TriangleRoots14.root480, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_480, Icur := OriginalRow227TriangleData0174.coefficient10_479,
    output := OriginalRow227TriangleData0190.coefficient11_479, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 471, IA := shift, ID := OriginalRow227TriangleRoots15.root481, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_481, Icur := OriginalRow227TriangleData0174.coefficient10_480,
    output := OriginalRow227TriangleData0190.coefficient11_480, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 472, IA := shift, ID := OriginalRow227TriangleRoots15.root482, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_482, Icur := OriginalRow227TriangleData0174.coefficient10_481,
    output := OriginalRow227TriangleData0190.coefficient11_481, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 473, IA := shift, ID := OriginalRow227TriangleRoots15.root483, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_483, Icur := OriginalRow227TriangleData0174.coefficient10_482,
    output := OriginalRow227TriangleData0190.coefficient11_482, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 474, IA := shift, ID := OriginalRow227TriangleRoots15.root484, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_484, Icur := OriginalRow227TriangleData0174.coefficient10_483,
    output := OriginalRow227TriangleData0190.coefficient11_483, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 475, IA := shift, ID := OriginalRow227TriangleRoots15.root485, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_485, Icur := OriginalRow227TriangleData0174.coefficient10_484,
    output := OriginalRow227TriangleData0190.coefficient11_484, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 476, IA := shift, ID := OriginalRow227TriangleRoots15.root486, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_486, Icur := OriginalRow227TriangleData0174.coefficient10_485,
    output := OriginalRow227TriangleData0190.coefficient11_485, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 477, IA := shift, ID := OriginalRow227TriangleRoots15.root487, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_487, Icur := OriginalRow227TriangleData0174.coefficient10_486,
    output := OriginalRow227TriangleData0190.coefficient11_486, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 478, IA := shift, ID := OriginalRow227TriangleRoots15.root488, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0174.coefficient10_488, Icur := OriginalRow227TriangleData0174.coefficient10_487,
    output := OriginalRow227TriangleData0190.coefficient11_487, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 479, IA := shift, ID := OriginalRow227TriangleRoots15.root489, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0175.coefficient10_489, Icur := OriginalRow227TriangleData0174.coefficient10_488,
    output := OriginalRow227TriangleData0190.coefficient11_488, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 480, IA := shift, ID := OriginalRow227TriangleRoots15.root490, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0175.coefficient10_490, Icur := OriginalRow227TriangleData0175.coefficient10_489,
    output := OriginalRow227TriangleData0190.coefficient11_489, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0174

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0174.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

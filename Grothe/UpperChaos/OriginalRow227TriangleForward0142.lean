import Grothe.UpperChaos.OriginalRow227TriangleData0142
import Grothe.UpperChaos.OriginalRow227TriangleData0143
import Grothe.UpperChaos.OriginalRow227TriangleData0158
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0142
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 449, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_457, Icur := OriginalRow227TriangleData0142.coefficient8_456,
    output := OriginalRow227TriangleData0158.coefficient9_456, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 450, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_458, Icur := OriginalRow227TriangleData0142.coefficient8_457,
    output := OriginalRow227TriangleData0158.coefficient9_457, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 451, IA := shift, ID := OriginalRow227TriangleRoots14.root459, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_459, Icur := OriginalRow227TriangleData0142.coefficient8_458,
    output := OriginalRow227TriangleData0158.coefficient9_458, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 452, IA := shift, ID := OriginalRow227TriangleRoots14.root460, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_460, Icur := OriginalRow227TriangleData0142.coefficient8_459,
    output := OriginalRow227TriangleData0158.coefficient9_459, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 453, IA := shift, ID := OriginalRow227TriangleRoots14.root461, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_461, Icur := OriginalRow227TriangleData0142.coefficient8_460,
    output := OriginalRow227TriangleData0158.coefficient9_460, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 454, IA := shift, ID := OriginalRow227TriangleRoots14.root462, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_462, Icur := OriginalRow227TriangleData0142.coefficient8_461,
    output := OriginalRow227TriangleData0158.coefficient9_461, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 455, IA := shift, ID := OriginalRow227TriangleRoots14.root463, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_463, Icur := OriginalRow227TriangleData0142.coefficient8_462,
    output := OriginalRow227TriangleData0158.coefficient9_462, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 456, IA := shift, ID := OriginalRow227TriangleRoots14.root464, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_464, Icur := OriginalRow227TriangleData0142.coefficient8_463,
    output := OriginalRow227TriangleData0158.coefficient9_463, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 457, IA := shift, ID := OriginalRow227TriangleRoots14.root465, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_465, Icur := OriginalRow227TriangleData0142.coefficient8_464,
    output := OriginalRow227TriangleData0158.coefficient9_464, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 458, IA := shift, ID := OriginalRow227TriangleRoots14.root466, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_466, Icur := OriginalRow227TriangleData0142.coefficient8_465,
    output := OriginalRow227TriangleData0158.coefficient9_465, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 459, IA := shift, ID := OriginalRow227TriangleRoots14.root467, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_467, Icur := OriginalRow227TriangleData0142.coefficient8_466,
    output := OriginalRow227TriangleData0158.coefficient9_466, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 460, IA := shift, ID := OriginalRow227TriangleRoots14.root468, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_468, Icur := OriginalRow227TriangleData0142.coefficient8_467,
    output := OriginalRow227TriangleData0158.coefficient9_467, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 461, IA := shift, ID := OriginalRow227TriangleRoots14.root469, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_469, Icur := OriginalRow227TriangleData0142.coefficient8_468,
    output := OriginalRow227TriangleData0158.coefficient9_468, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 462, IA := shift, ID := OriginalRow227TriangleRoots14.root470, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_470, Icur := OriginalRow227TriangleData0142.coefficient8_469,
    output := OriginalRow227TriangleData0158.coefficient9_469, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 463, IA := shift, ID := OriginalRow227TriangleRoots14.root471, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_471, Icur := OriginalRow227TriangleData0142.coefficient8_470,
    output := OriginalRow227TriangleData0158.coefficient9_470, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 464, IA := shift, ID := OriginalRow227TriangleRoots14.root472, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_472, Icur := OriginalRow227TriangleData0142.coefficient8_471,
    output := OriginalRow227TriangleData0158.coefficient9_471, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 465, IA := shift, ID := OriginalRow227TriangleRoots14.root473, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_473, Icur := OriginalRow227TriangleData0142.coefficient8_472,
    output := OriginalRow227TriangleData0158.coefficient9_472, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 466, IA := shift, ID := OriginalRow227TriangleRoots14.root474, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_474, Icur := OriginalRow227TriangleData0142.coefficient8_473,
    output := OriginalRow227TriangleData0158.coefficient9_473, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 467, IA := shift, ID := OriginalRow227TriangleRoots14.root475, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_475, Icur := OriginalRow227TriangleData0142.coefficient8_474,
    output := OriginalRow227TriangleData0158.coefficient9_474, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 468, IA := shift, ID := OriginalRow227TriangleRoots14.root476, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_476, Icur := OriginalRow227TriangleData0142.coefficient8_475,
    output := OriginalRow227TriangleData0158.coefficient9_475, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 469, IA := shift, ID := OriginalRow227TriangleRoots14.root477, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_477, Icur := OriginalRow227TriangleData0142.coefficient8_476,
    output := OriginalRow227TriangleData0158.coefficient9_476, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 470, IA := shift, ID := OriginalRow227TriangleRoots14.root478, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_478, Icur := OriginalRow227TriangleData0142.coefficient8_477,
    output := OriginalRow227TriangleData0158.coefficient9_477, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 471, IA := shift, ID := OriginalRow227TriangleRoots14.root479, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_479, Icur := OriginalRow227TriangleData0142.coefficient8_478,
    output := OriginalRow227TriangleData0158.coefficient9_478, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 472, IA := shift, ID := OriginalRow227TriangleRoots14.root480, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_480, Icur := OriginalRow227TriangleData0142.coefficient8_479,
    output := OriginalRow227TriangleData0158.coefficient9_479, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 473, IA := shift, ID := OriginalRow227TriangleRoots15.root481, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_481, Icur := OriginalRow227TriangleData0142.coefficient8_480,
    output := OriginalRow227TriangleData0158.coefficient9_480, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 474, IA := shift, ID := OriginalRow227TriangleRoots15.root482, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_482, Icur := OriginalRow227TriangleData0142.coefficient8_481,
    output := OriginalRow227TriangleData0158.coefficient9_481, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 475, IA := shift, ID := OriginalRow227TriangleRoots15.root483, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_483, Icur := OriginalRow227TriangleData0142.coefficient8_482,
    output := OriginalRow227TriangleData0158.coefficient9_482, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 476, IA := shift, ID := OriginalRow227TriangleRoots15.root484, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_484, Icur := OriginalRow227TriangleData0142.coefficient8_483,
    output := OriginalRow227TriangleData0158.coefficient9_483, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 477, IA := shift, ID := OriginalRow227TriangleRoots15.root485, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_485, Icur := OriginalRow227TriangleData0142.coefficient8_484,
    output := OriginalRow227TriangleData0158.coefficient9_484, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 478, IA := shift, ID := OriginalRow227TriangleRoots15.root486, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0142.coefficient8_486, Icur := OriginalRow227TriangleData0142.coefficient8_485,
    output := OriginalRow227TriangleData0158.coefficient9_485, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 479, IA := shift, ID := OriginalRow227TriangleRoots15.root487, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0143.coefficient8_487, Icur := OriginalRow227TriangleData0142.coefficient8_486,
    output := OriginalRow227TriangleData0158.coefficient9_486, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 480, IA := shift, ID := OriginalRow227TriangleRoots15.root488, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0143.coefficient8_488, Icur := OriginalRow227TriangleData0143.coefficient8_487,
    output := OriginalRow227TriangleData0158.coefficient9_487, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0142

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0142.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

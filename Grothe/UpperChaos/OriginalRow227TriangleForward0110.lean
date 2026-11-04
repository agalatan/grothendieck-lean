import Grothe.UpperChaos.OriginalRow227TriangleData0110
import Grothe.UpperChaos.OriginalRow227TriangleData0111
import Grothe.UpperChaos.OriginalRow227TriangleData0126
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0110
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 449, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_455, Icur := OriginalRow227TriangleData0110.coefficient6_454,
    output := OriginalRow227TriangleData0126.coefficient7_454, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 450, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_456, Icur := OriginalRow227TriangleData0110.coefficient6_455,
    output := OriginalRow227TriangleData0126.coefficient7_455, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 451, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_457, Icur := OriginalRow227TriangleData0110.coefficient6_456,
    output := OriginalRow227TriangleData0126.coefficient7_456, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 452, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_458, Icur := OriginalRow227TriangleData0110.coefficient6_457,
    output := OriginalRow227TriangleData0126.coefficient7_457, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 453, IA := shift, ID := OriginalRow227TriangleRoots14.root459, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_459, Icur := OriginalRow227TriangleData0110.coefficient6_458,
    output := OriginalRow227TriangleData0126.coefficient7_458, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 454, IA := shift, ID := OriginalRow227TriangleRoots14.root460, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_460, Icur := OriginalRow227TriangleData0110.coefficient6_459,
    output := OriginalRow227TriangleData0126.coefficient7_459, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 455, IA := shift, ID := OriginalRow227TriangleRoots14.root461, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_461, Icur := OriginalRow227TriangleData0110.coefficient6_460,
    output := OriginalRow227TriangleData0126.coefficient7_460, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 456, IA := shift, ID := OriginalRow227TriangleRoots14.root462, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_462, Icur := OriginalRow227TriangleData0110.coefficient6_461,
    output := OriginalRow227TriangleData0126.coefficient7_461, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 457, IA := shift, ID := OriginalRow227TriangleRoots14.root463, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_463, Icur := OriginalRow227TriangleData0110.coefficient6_462,
    output := OriginalRow227TriangleData0126.coefficient7_462, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 458, IA := shift, ID := OriginalRow227TriangleRoots14.root464, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_464, Icur := OriginalRow227TriangleData0110.coefficient6_463,
    output := OriginalRow227TriangleData0126.coefficient7_463, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 459, IA := shift, ID := OriginalRow227TriangleRoots14.root465, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_465, Icur := OriginalRow227TriangleData0110.coefficient6_464,
    output := OriginalRow227TriangleData0126.coefficient7_464, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 460, IA := shift, ID := OriginalRow227TriangleRoots14.root466, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_466, Icur := OriginalRow227TriangleData0110.coefficient6_465,
    output := OriginalRow227TriangleData0126.coefficient7_465, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 461, IA := shift, ID := OriginalRow227TriangleRoots14.root467, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_467, Icur := OriginalRow227TriangleData0110.coefficient6_466,
    output := OriginalRow227TriangleData0126.coefficient7_466, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 462, IA := shift, ID := OriginalRow227TriangleRoots14.root468, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_468, Icur := OriginalRow227TriangleData0110.coefficient6_467,
    output := OriginalRow227TriangleData0126.coefficient7_467, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 463, IA := shift, ID := OriginalRow227TriangleRoots14.root469, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_469, Icur := OriginalRow227TriangleData0110.coefficient6_468,
    output := OriginalRow227TriangleData0126.coefficient7_468, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 464, IA := shift, ID := OriginalRow227TriangleRoots14.root470, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_470, Icur := OriginalRow227TriangleData0110.coefficient6_469,
    output := OriginalRow227TriangleData0126.coefficient7_469, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 465, IA := shift, ID := OriginalRow227TriangleRoots14.root471, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_471, Icur := OriginalRow227TriangleData0110.coefficient6_470,
    output := OriginalRow227TriangleData0126.coefficient7_470, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 466, IA := shift, ID := OriginalRow227TriangleRoots14.root472, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_472, Icur := OriginalRow227TriangleData0110.coefficient6_471,
    output := OriginalRow227TriangleData0126.coefficient7_471, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 467, IA := shift, ID := OriginalRow227TriangleRoots14.root473, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_473, Icur := OriginalRow227TriangleData0110.coefficient6_472,
    output := OriginalRow227TriangleData0126.coefficient7_472, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 468, IA := shift, ID := OriginalRow227TriangleRoots14.root474, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_474, Icur := OriginalRow227TriangleData0110.coefficient6_473,
    output := OriginalRow227TriangleData0126.coefficient7_473, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 469, IA := shift, ID := OriginalRow227TriangleRoots14.root475, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_475, Icur := OriginalRow227TriangleData0110.coefficient6_474,
    output := OriginalRow227TriangleData0126.coefficient7_474, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 470, IA := shift, ID := OriginalRow227TriangleRoots14.root476, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_476, Icur := OriginalRow227TriangleData0110.coefficient6_475,
    output := OriginalRow227TriangleData0126.coefficient7_475, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 471, IA := shift, ID := OriginalRow227TriangleRoots14.root477, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_477, Icur := OriginalRow227TriangleData0110.coefficient6_476,
    output := OriginalRow227TriangleData0126.coefficient7_476, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 472, IA := shift, ID := OriginalRow227TriangleRoots14.root478, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_478, Icur := OriginalRow227TriangleData0110.coefficient6_477,
    output := OriginalRow227TriangleData0126.coefficient7_477, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 473, IA := shift, ID := OriginalRow227TriangleRoots14.root479, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_479, Icur := OriginalRow227TriangleData0110.coefficient6_478,
    output := OriginalRow227TriangleData0126.coefficient7_478, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 474, IA := shift, ID := OriginalRow227TriangleRoots14.root480, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_480, Icur := OriginalRow227TriangleData0110.coefficient6_479,
    output := OriginalRow227TriangleData0126.coefficient7_479, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 475, IA := shift, ID := OriginalRow227TriangleRoots15.root481, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_481, Icur := OriginalRow227TriangleData0110.coefficient6_480,
    output := OriginalRow227TriangleData0126.coefficient7_480, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 476, IA := shift, ID := OriginalRow227TriangleRoots15.root482, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_482, Icur := OriginalRow227TriangleData0110.coefficient6_481,
    output := OriginalRow227TriangleData0126.coefficient7_481, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 477, IA := shift, ID := OriginalRow227TriangleRoots15.root483, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_483, Icur := OriginalRow227TriangleData0110.coefficient6_482,
    output := OriginalRow227TriangleData0126.coefficient7_482, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 478, IA := shift, ID := OriginalRow227TriangleRoots15.root484, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0110.coefficient6_484, Icur := OriginalRow227TriangleData0110.coefficient6_483,
    output := OriginalRow227TriangleData0126.coefficient7_483, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 479, IA := shift, ID := OriginalRow227TriangleRoots15.root485, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0111.coefficient6_485, Icur := OriginalRow227TriangleData0110.coefficient6_484,
    output := OriginalRow227TriangleData0126.coefficient7_484, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos },
  { charge := 480, IA := shift, ID := OriginalRow227TriangleRoots15.root486, IC := OriginalRow227TriangleRoots00.root7,
    Inext := OriginalRow227TriangleData0111.coefficient6_486, Icur := OriginalRow227TriangleData0111.coefficient6_485,
    output := OriginalRow227TriangleData0126.coefficient7_485, hC := OriginalRow227TriangleRoots00.root7_pos, hAC := OriginalRow227TriangleRoots00.product7_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0110

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0110.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

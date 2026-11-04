import Grothe.UpperChaos.OriginalRow227TriangleData0266
import Grothe.UpperChaos.OriginalRow227TriangleData0281
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0265
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 449, IA := shift, ID := OriginalRow227TriangleRoots14.root465, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_465, Icur := OriginalRow227TriangleData0266.coefficient16_464,
    output := OriginalRow227TriangleData0281.coefficient17_464, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 450, IA := shift, ID := OriginalRow227TriangleRoots14.root466, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_466, Icur := OriginalRow227TriangleData0266.coefficient16_465,
    output := OriginalRow227TriangleData0281.coefficient17_465, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 451, IA := shift, ID := OriginalRow227TriangleRoots14.root467, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_467, Icur := OriginalRow227TriangleData0266.coefficient16_466,
    output := OriginalRow227TriangleData0281.coefficient17_466, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 452, IA := shift, ID := OriginalRow227TriangleRoots14.root468, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_468, Icur := OriginalRow227TriangleData0266.coefficient16_467,
    output := OriginalRow227TriangleData0281.coefficient17_467, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 453, IA := shift, ID := OriginalRow227TriangleRoots14.root469, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_469, Icur := OriginalRow227TriangleData0266.coefficient16_468,
    output := OriginalRow227TriangleData0281.coefficient17_468, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 454, IA := shift, ID := OriginalRow227TriangleRoots14.root470, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_470, Icur := OriginalRow227TriangleData0266.coefficient16_469,
    output := OriginalRow227TriangleData0281.coefficient17_469, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 455, IA := shift, ID := OriginalRow227TriangleRoots14.root471, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_471, Icur := OriginalRow227TriangleData0266.coefficient16_470,
    output := OriginalRow227TriangleData0281.coefficient17_470, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 456, IA := shift, ID := OriginalRow227TriangleRoots14.root472, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_472, Icur := OriginalRow227TriangleData0266.coefficient16_471,
    output := OriginalRow227TriangleData0281.coefficient17_471, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 457, IA := shift, ID := OriginalRow227TriangleRoots14.root473, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_473, Icur := OriginalRow227TriangleData0266.coefficient16_472,
    output := OriginalRow227TriangleData0281.coefficient17_472, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 458, IA := shift, ID := OriginalRow227TriangleRoots14.root474, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_474, Icur := OriginalRow227TriangleData0266.coefficient16_473,
    output := OriginalRow227TriangleData0281.coefficient17_473, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 459, IA := shift, ID := OriginalRow227TriangleRoots14.root475, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_475, Icur := OriginalRow227TriangleData0266.coefficient16_474,
    output := OriginalRow227TriangleData0281.coefficient17_474, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 460, IA := shift, ID := OriginalRow227TriangleRoots14.root476, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_476, Icur := OriginalRow227TriangleData0266.coefficient16_475,
    output := OriginalRow227TriangleData0281.coefficient17_475, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 461, IA := shift, ID := OriginalRow227TriangleRoots14.root477, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_477, Icur := OriginalRow227TriangleData0266.coefficient16_476,
    output := OriginalRow227TriangleData0281.coefficient17_476, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 462, IA := shift, ID := OriginalRow227TriangleRoots14.root478, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_478, Icur := OriginalRow227TriangleData0266.coefficient16_477,
    output := OriginalRow227TriangleData0281.coefficient17_477, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 463, IA := shift, ID := OriginalRow227TriangleRoots14.root479, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_479, Icur := OriginalRow227TriangleData0266.coefficient16_478,
    output := OriginalRow227TriangleData0281.coefficient17_478, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 464, IA := shift, ID := OriginalRow227TriangleRoots14.root480, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_480, Icur := OriginalRow227TriangleData0266.coefficient16_479,
    output := OriginalRow227TriangleData0281.coefficient17_479, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 465, IA := shift, ID := OriginalRow227TriangleRoots15.root481, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_481, Icur := OriginalRow227TriangleData0266.coefficient16_480,
    output := OriginalRow227TriangleData0281.coefficient17_480, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 466, IA := shift, ID := OriginalRow227TriangleRoots15.root482, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_482, Icur := OriginalRow227TriangleData0266.coefficient16_481,
    output := OriginalRow227TriangleData0281.coefficient17_481, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 467, IA := shift, ID := OriginalRow227TriangleRoots15.root483, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_483, Icur := OriginalRow227TriangleData0266.coefficient16_482,
    output := OriginalRow227TriangleData0281.coefficient17_482, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 468, IA := shift, ID := OriginalRow227TriangleRoots15.root484, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_484, Icur := OriginalRow227TriangleData0266.coefficient16_483,
    output := OriginalRow227TriangleData0281.coefficient17_483, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 469, IA := shift, ID := OriginalRow227TriangleRoots15.root485, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0266.coefficient16_485, Icur := OriginalRow227TriangleData0266.coefficient16_484,
    output := OriginalRow227TriangleData0281.coefficient17_484, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0265

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0265.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

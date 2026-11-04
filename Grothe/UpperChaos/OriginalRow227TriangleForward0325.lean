import Grothe.UpperChaos.OriginalRow227TriangleData0326
import Grothe.UpperChaos.OriginalRow227TriangleData0341
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0325
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 449, IA := shift, ID := OriginalRow227TriangleRoots14.root469, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0326.coefficient20_469, Icur := OriginalRow227TriangleData0326.coefficient20_468,
    output := OriginalRow227TriangleData0341.coefficient21_468, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 450, IA := shift, ID := OriginalRow227TriangleRoots14.root470, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0326.coefficient20_470, Icur := OriginalRow227TriangleData0326.coefficient20_469,
    output := OriginalRow227TriangleData0341.coefficient21_469, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 451, IA := shift, ID := OriginalRow227TriangleRoots14.root471, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0326.coefficient20_471, Icur := OriginalRow227TriangleData0326.coefficient20_470,
    output := OriginalRow227TriangleData0341.coefficient21_470, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 452, IA := shift, ID := OriginalRow227TriangleRoots14.root472, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0326.coefficient20_472, Icur := OriginalRow227TriangleData0326.coefficient20_471,
    output := OriginalRow227TriangleData0341.coefficient21_471, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 453, IA := shift, ID := OriginalRow227TriangleRoots14.root473, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0326.coefficient20_473, Icur := OriginalRow227TriangleData0326.coefficient20_472,
    output := OriginalRow227TriangleData0341.coefficient21_472, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 454, IA := shift, ID := OriginalRow227TriangleRoots14.root474, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0326.coefficient20_474, Icur := OriginalRow227TriangleData0326.coefficient20_473,
    output := OriginalRow227TriangleData0341.coefficient21_473, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 455, IA := shift, ID := OriginalRow227TriangleRoots14.root475, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0326.coefficient20_475, Icur := OriginalRow227TriangleData0326.coefficient20_474,
    output := OriginalRow227TriangleData0341.coefficient21_474, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 456, IA := shift, ID := OriginalRow227TriangleRoots14.root476, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0326.coefficient20_476, Icur := OriginalRow227TriangleData0326.coefficient20_475,
    output := OriginalRow227TriangleData0341.coefficient21_475, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 457, IA := shift, ID := OriginalRow227TriangleRoots14.root477, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0326.coefficient20_477, Icur := OriginalRow227TriangleData0326.coefficient20_476,
    output := OriginalRow227TriangleData0341.coefficient21_476, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 458, IA := shift, ID := OriginalRow227TriangleRoots14.root478, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0326.coefficient20_478, Icur := OriginalRow227TriangleData0326.coefficient20_477,
    output := OriginalRow227TriangleData0341.coefficient21_477, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 459, IA := shift, ID := OriginalRow227TriangleRoots14.root479, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0326.coefficient20_479, Icur := OriginalRow227TriangleData0326.coefficient20_478,
    output := OriginalRow227TriangleData0341.coefficient21_478, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 460, IA := shift, ID := OriginalRow227TriangleRoots14.root480, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0326.coefficient20_480, Icur := OriginalRow227TriangleData0326.coefficient20_479,
    output := OriginalRow227TriangleData0341.coefficient21_479, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 461, IA := shift, ID := OriginalRow227TriangleRoots15.root481, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0326.coefficient20_481, Icur := OriginalRow227TriangleData0326.coefficient20_480,
    output := OriginalRow227TriangleData0341.coefficient21_480, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0325

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0325.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

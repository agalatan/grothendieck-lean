import Grothe.UpperChaos.OriginalRow227TriangleData0281
import Grothe.UpperChaos.OriginalRow227TriangleData0296
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0280
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 449, IA := shift, ID := OriginalRow227TriangleRoots14.root466, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_466, Icur := OriginalRow227TriangleData0281.coefficient17_465,
    output := OriginalRow227TriangleData0296.coefficient18_465, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 450, IA := shift, ID := OriginalRow227TriangleRoots14.root467, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_467, Icur := OriginalRow227TriangleData0281.coefficient17_466,
    output := OriginalRow227TriangleData0296.coefficient18_466, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 451, IA := shift, ID := OriginalRow227TriangleRoots14.root468, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_468, Icur := OriginalRow227TriangleData0281.coefficient17_467,
    output := OriginalRow227TriangleData0296.coefficient18_467, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 452, IA := shift, ID := OriginalRow227TriangleRoots14.root469, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_469, Icur := OriginalRow227TriangleData0281.coefficient17_468,
    output := OriginalRow227TriangleData0296.coefficient18_468, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 453, IA := shift, ID := OriginalRow227TriangleRoots14.root470, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_470, Icur := OriginalRow227TriangleData0281.coefficient17_469,
    output := OriginalRow227TriangleData0296.coefficient18_469, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 454, IA := shift, ID := OriginalRow227TriangleRoots14.root471, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_471, Icur := OriginalRow227TriangleData0281.coefficient17_470,
    output := OriginalRow227TriangleData0296.coefficient18_470, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 455, IA := shift, ID := OriginalRow227TriangleRoots14.root472, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_472, Icur := OriginalRow227TriangleData0281.coefficient17_471,
    output := OriginalRow227TriangleData0296.coefficient18_471, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 456, IA := shift, ID := OriginalRow227TriangleRoots14.root473, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_473, Icur := OriginalRow227TriangleData0281.coefficient17_472,
    output := OriginalRow227TriangleData0296.coefficient18_472, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 457, IA := shift, ID := OriginalRow227TriangleRoots14.root474, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_474, Icur := OriginalRow227TriangleData0281.coefficient17_473,
    output := OriginalRow227TriangleData0296.coefficient18_473, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 458, IA := shift, ID := OriginalRow227TriangleRoots14.root475, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_475, Icur := OriginalRow227TriangleData0281.coefficient17_474,
    output := OriginalRow227TriangleData0296.coefficient18_474, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 459, IA := shift, ID := OriginalRow227TriangleRoots14.root476, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_476, Icur := OriginalRow227TriangleData0281.coefficient17_475,
    output := OriginalRow227TriangleData0296.coefficient18_475, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 460, IA := shift, ID := OriginalRow227TriangleRoots14.root477, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_477, Icur := OriginalRow227TriangleData0281.coefficient17_476,
    output := OriginalRow227TriangleData0296.coefficient18_476, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 461, IA := shift, ID := OriginalRow227TriangleRoots14.root478, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_478, Icur := OriginalRow227TriangleData0281.coefficient17_477,
    output := OriginalRow227TriangleData0296.coefficient18_477, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 462, IA := shift, ID := OriginalRow227TriangleRoots14.root479, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_479, Icur := OriginalRow227TriangleData0281.coefficient17_478,
    output := OriginalRow227TriangleData0296.coefficient18_478, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 463, IA := shift, ID := OriginalRow227TriangleRoots14.root480, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_480, Icur := OriginalRow227TriangleData0281.coefficient17_479,
    output := OriginalRow227TriangleData0296.coefficient18_479, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 464, IA := shift, ID := OriginalRow227TriangleRoots15.root481, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_481, Icur := OriginalRow227TriangleData0281.coefficient17_480,
    output := OriginalRow227TriangleData0296.coefficient18_480, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 465, IA := shift, ID := OriginalRow227TriangleRoots15.root482, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_482, Icur := OriginalRow227TriangleData0281.coefficient17_481,
    output := OriginalRow227TriangleData0296.coefficient18_481, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 466, IA := shift, ID := OriginalRow227TriangleRoots15.root483, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_483, Icur := OriginalRow227TriangleData0281.coefficient17_482,
    output := OriginalRow227TriangleData0296.coefficient18_482, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 467, IA := shift, ID := OriginalRow227TriangleRoots15.root484, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0281.coefficient17_484, Icur := OriginalRow227TriangleData0281.coefficient17_483,
    output := OriginalRow227TriangleData0296.coefficient18_483, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0280

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0280.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

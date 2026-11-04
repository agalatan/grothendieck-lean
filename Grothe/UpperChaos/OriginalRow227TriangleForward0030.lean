import Grothe.UpperChaos.OriginalRow227TriangleData0030
import Grothe.UpperChaos.OriginalRow227TriangleData0031
import Grothe.UpperChaos.OriginalRow227TriangleData0046
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0030
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 449, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_450, Icur := OriginalRow227TriangleData0030.coefficient1_449,
    output := OriginalRow227TriangleData0046.coefficient2_449, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 450, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_451, Icur := OriginalRow227TriangleData0030.coefficient1_450,
    output := OriginalRow227TriangleData0046.coefficient2_450, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 451, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_452, Icur := OriginalRow227TriangleData0030.coefficient1_451,
    output := OriginalRow227TriangleData0046.coefficient2_451, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 452, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_453, Icur := OriginalRow227TriangleData0030.coefficient1_452,
    output := OriginalRow227TriangleData0046.coefficient2_452, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 453, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_454, Icur := OriginalRow227TriangleData0030.coefficient1_453,
    output := OriginalRow227TriangleData0046.coefficient2_453, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 454, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_455, Icur := OriginalRow227TriangleData0030.coefficient1_454,
    output := OriginalRow227TriangleData0046.coefficient2_454, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 455, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_456, Icur := OriginalRow227TriangleData0030.coefficient1_455,
    output := OriginalRow227TriangleData0046.coefficient2_455, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 456, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_457, Icur := OriginalRow227TriangleData0030.coefficient1_456,
    output := OriginalRow227TriangleData0046.coefficient2_456, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 457, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_458, Icur := OriginalRow227TriangleData0030.coefficient1_457,
    output := OriginalRow227TriangleData0046.coefficient2_457, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 458, IA := shift, ID := OriginalRow227TriangleRoots14.root459, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_459, Icur := OriginalRow227TriangleData0030.coefficient1_458,
    output := OriginalRow227TriangleData0046.coefficient2_458, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 459, IA := shift, ID := OriginalRow227TriangleRoots14.root460, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_460, Icur := OriginalRow227TriangleData0030.coefficient1_459,
    output := OriginalRow227TriangleData0046.coefficient2_459, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 460, IA := shift, ID := OriginalRow227TriangleRoots14.root461, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_461, Icur := OriginalRow227TriangleData0030.coefficient1_460,
    output := OriginalRow227TriangleData0046.coefficient2_460, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 461, IA := shift, ID := OriginalRow227TriangleRoots14.root462, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_462, Icur := OriginalRow227TriangleData0030.coefficient1_461,
    output := OriginalRow227TriangleData0046.coefficient2_461, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 462, IA := shift, ID := OriginalRow227TriangleRoots14.root463, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_463, Icur := OriginalRow227TriangleData0030.coefficient1_462,
    output := OriginalRow227TriangleData0046.coefficient2_462, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 463, IA := shift, ID := OriginalRow227TriangleRoots14.root464, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_464, Icur := OriginalRow227TriangleData0030.coefficient1_463,
    output := OriginalRow227TriangleData0046.coefficient2_463, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 464, IA := shift, ID := OriginalRow227TriangleRoots14.root465, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_465, Icur := OriginalRow227TriangleData0030.coefficient1_464,
    output := OriginalRow227TriangleData0046.coefficient2_464, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 465, IA := shift, ID := OriginalRow227TriangleRoots14.root466, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_466, Icur := OriginalRow227TriangleData0030.coefficient1_465,
    output := OriginalRow227TriangleData0046.coefficient2_465, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 466, IA := shift, ID := OriginalRow227TriangleRoots14.root467, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_467, Icur := OriginalRow227TriangleData0030.coefficient1_466,
    output := OriginalRow227TriangleData0046.coefficient2_466, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 467, IA := shift, ID := OriginalRow227TriangleRoots14.root468, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_468, Icur := OriginalRow227TriangleData0030.coefficient1_467,
    output := OriginalRow227TriangleData0046.coefficient2_467, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 468, IA := shift, ID := OriginalRow227TriangleRoots14.root469, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_469, Icur := OriginalRow227TriangleData0030.coefficient1_468,
    output := OriginalRow227TriangleData0046.coefficient2_468, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 469, IA := shift, ID := OriginalRow227TriangleRoots14.root470, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_470, Icur := OriginalRow227TriangleData0030.coefficient1_469,
    output := OriginalRow227TriangleData0046.coefficient2_469, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 470, IA := shift, ID := OriginalRow227TriangleRoots14.root471, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_471, Icur := OriginalRow227TriangleData0030.coefficient1_470,
    output := OriginalRow227TriangleData0046.coefficient2_470, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 471, IA := shift, ID := OriginalRow227TriangleRoots14.root472, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_472, Icur := OriginalRow227TriangleData0030.coefficient1_471,
    output := OriginalRow227TriangleData0046.coefficient2_471, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 472, IA := shift, ID := OriginalRow227TriangleRoots14.root473, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_473, Icur := OriginalRow227TriangleData0030.coefficient1_472,
    output := OriginalRow227TriangleData0046.coefficient2_472, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 473, IA := shift, ID := OriginalRow227TriangleRoots14.root474, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_474, Icur := OriginalRow227TriangleData0030.coefficient1_473,
    output := OriginalRow227TriangleData0046.coefficient2_473, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 474, IA := shift, ID := OriginalRow227TriangleRoots14.root475, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_475, Icur := OriginalRow227TriangleData0030.coefficient1_474,
    output := OriginalRow227TriangleData0046.coefficient2_474, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 475, IA := shift, ID := OriginalRow227TriangleRoots14.root476, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_476, Icur := OriginalRow227TriangleData0030.coefficient1_475,
    output := OriginalRow227TriangleData0046.coefficient2_475, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 476, IA := shift, ID := OriginalRow227TriangleRoots14.root477, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_477, Icur := OriginalRow227TriangleData0030.coefficient1_476,
    output := OriginalRow227TriangleData0046.coefficient2_476, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 477, IA := shift, ID := OriginalRow227TriangleRoots14.root478, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_478, Icur := OriginalRow227TriangleData0030.coefficient1_477,
    output := OriginalRow227TriangleData0046.coefficient2_477, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 478, IA := shift, ID := OriginalRow227TriangleRoots14.root479, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0030.coefficient1_479, Icur := OriginalRow227TriangleData0030.coefficient1_478,
    output := OriginalRow227TriangleData0046.coefficient2_478, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 479, IA := shift, ID := OriginalRow227TriangleRoots14.root480, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_480, Icur := OriginalRow227TriangleData0030.coefficient1_479,
    output := OriginalRow227TriangleData0046.coefficient2_479, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 480, IA := shift, ID := OriginalRow227TriangleRoots15.root481, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0031.coefficient1_481, Icur := OriginalRow227TriangleData0031.coefficient1_480,
    output := OriginalRow227TriangleData0046.coefficient2_480, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0030

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0030.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData0529
import Grothe.UpperChaos.OriginalRow227TriangleData0543
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots14
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0527
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 417, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_451, Icur := OriginalRow227TriangleData0529.coefficient34_450,
    output := OriginalRow227TriangleData0543.coefficient35_450, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 418, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_452, Icur := OriginalRow227TriangleData0529.coefficient34_451,
    output := OriginalRow227TriangleData0543.coefficient35_451, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 419, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_453, Icur := OriginalRow227TriangleData0529.coefficient34_452,
    output := OriginalRow227TriangleData0543.coefficient35_452, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 420, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_454, Icur := OriginalRow227TriangleData0529.coefficient34_453,
    output := OriginalRow227TriangleData0543.coefficient35_453, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 421, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_455, Icur := OriginalRow227TriangleData0529.coefficient34_454,
    output := OriginalRow227TriangleData0543.coefficient35_454, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 422, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_456, Icur := OriginalRow227TriangleData0529.coefficient34_455,
    output := OriginalRow227TriangleData0543.coefficient35_455, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 423, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_457, Icur := OriginalRow227TriangleData0529.coefficient34_456,
    output := OriginalRow227TriangleData0543.coefficient35_456, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 424, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_458, Icur := OriginalRow227TriangleData0529.coefficient34_457,
    output := OriginalRow227TriangleData0543.coefficient35_457, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 425, IA := shift, ID := OriginalRow227TriangleRoots14.root459, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_459, Icur := OriginalRow227TriangleData0529.coefficient34_458,
    output := OriginalRow227TriangleData0543.coefficient35_458, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 426, IA := shift, ID := OriginalRow227TriangleRoots14.root460, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_460, Icur := OriginalRow227TriangleData0529.coefficient34_459,
    output := OriginalRow227TriangleData0543.coefficient35_459, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 427, IA := shift, ID := OriginalRow227TriangleRoots14.root461, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_461, Icur := OriginalRow227TriangleData0529.coefficient34_460,
    output := OriginalRow227TriangleData0543.coefficient35_460, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 428, IA := shift, ID := OriginalRow227TriangleRoots14.root462, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_462, Icur := OriginalRow227TriangleData0529.coefficient34_461,
    output := OriginalRow227TriangleData0543.coefficient35_461, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 429, IA := shift, ID := OriginalRow227TriangleRoots14.root463, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_463, Icur := OriginalRow227TriangleData0529.coefficient34_462,
    output := OriginalRow227TriangleData0543.coefficient35_462, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 430, IA := shift, ID := OriginalRow227TriangleRoots14.root464, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_464, Icur := OriginalRow227TriangleData0529.coefficient34_463,
    output := OriginalRow227TriangleData0543.coefficient35_463, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 431, IA := shift, ID := OriginalRow227TriangleRoots14.root465, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_465, Icur := OriginalRow227TriangleData0529.coefficient34_464,
    output := OriginalRow227TriangleData0543.coefficient35_464, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 432, IA := shift, ID := OriginalRow227TriangleRoots14.root466, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_466, Icur := OriginalRow227TriangleData0529.coefficient34_465,
    output := OriginalRow227TriangleData0543.coefficient35_465, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 433, IA := shift, ID := OriginalRow227TriangleRoots14.root467, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0529.coefficient34_467, Icur := OriginalRow227TriangleData0529.coefficient34_466,
    output := OriginalRow227TriangleData0543.coefficient35_466, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0527

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0527.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData0515
import Grothe.UpperChaos.OriginalRow227TriangleData0529
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots14
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0513
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 417, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_450, Icur := OriginalRow227TriangleData0515.coefficient33_449,
    output := OriginalRow227TriangleData0529.coefficient34_449, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 418, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_451, Icur := OriginalRow227TriangleData0515.coefficient33_450,
    output := OriginalRow227TriangleData0529.coefficient34_450, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 419, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_452, Icur := OriginalRow227TriangleData0515.coefficient33_451,
    output := OriginalRow227TriangleData0529.coefficient34_451, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 420, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_453, Icur := OriginalRow227TriangleData0515.coefficient33_452,
    output := OriginalRow227TriangleData0529.coefficient34_452, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 421, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_454, Icur := OriginalRow227TriangleData0515.coefficient33_453,
    output := OriginalRow227TriangleData0529.coefficient34_453, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 422, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_455, Icur := OriginalRow227TriangleData0515.coefficient33_454,
    output := OriginalRow227TriangleData0529.coefficient34_454, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 423, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_456, Icur := OriginalRow227TriangleData0515.coefficient33_455,
    output := OriginalRow227TriangleData0529.coefficient34_455, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 424, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_457, Icur := OriginalRow227TriangleData0515.coefficient33_456,
    output := OriginalRow227TriangleData0529.coefficient34_456, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 425, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_458, Icur := OriginalRow227TriangleData0515.coefficient33_457,
    output := OriginalRow227TriangleData0529.coefficient34_457, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 426, IA := shift, ID := OriginalRow227TriangleRoots14.root459, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_459, Icur := OriginalRow227TriangleData0515.coefficient33_458,
    output := OriginalRow227TriangleData0529.coefficient34_458, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 427, IA := shift, ID := OriginalRow227TriangleRoots14.root460, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_460, Icur := OriginalRow227TriangleData0515.coefficient33_459,
    output := OriginalRow227TriangleData0529.coefficient34_459, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 428, IA := shift, ID := OriginalRow227TriangleRoots14.root461, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_461, Icur := OriginalRow227TriangleData0515.coefficient33_460,
    output := OriginalRow227TriangleData0529.coefficient34_460, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 429, IA := shift, ID := OriginalRow227TriangleRoots14.root462, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_462, Icur := OriginalRow227TriangleData0515.coefficient33_461,
    output := OriginalRow227TriangleData0529.coefficient34_461, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 430, IA := shift, ID := OriginalRow227TriangleRoots14.root463, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_463, Icur := OriginalRow227TriangleData0515.coefficient33_462,
    output := OriginalRow227TriangleData0529.coefficient34_462, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 431, IA := shift, ID := OriginalRow227TriangleRoots14.root464, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_464, Icur := OriginalRow227TriangleData0515.coefficient33_463,
    output := OriginalRow227TriangleData0529.coefficient34_463, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 432, IA := shift, ID := OriginalRow227TriangleRoots14.root465, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_465, Icur := OriginalRow227TriangleData0515.coefficient33_464,
    output := OriginalRow227TriangleData0529.coefficient34_464, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 433, IA := shift, ID := OriginalRow227TriangleRoots14.root466, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_466, Icur := OriginalRow227TriangleData0515.coefficient33_465,
    output := OriginalRow227TriangleData0529.coefficient34_465, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 434, IA := shift, ID := OriginalRow227TriangleRoots14.root467, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_467, Icur := OriginalRow227TriangleData0515.coefficient33_466,
    output := OriginalRow227TriangleData0529.coefficient34_466, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 435, IA := shift, ID := OriginalRow227TriangleRoots14.root468, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0515.coefficient33_468, Icur := OriginalRow227TriangleData0515.coefficient33_467,
    output := OriginalRow227TriangleData0529.coefficient34_467, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0513

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0513.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

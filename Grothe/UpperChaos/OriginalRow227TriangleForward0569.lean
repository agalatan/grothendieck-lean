import Grothe.UpperChaos.OriginalRow227TriangleData0571
import Grothe.UpperChaos.OriginalRow227TriangleData0585
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots14
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0569
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 417, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0571.coefficient37_454, Icur := OriginalRow227TriangleData0571.coefficient37_453,
    output := OriginalRow227TriangleData0585.coefficient38_453, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 418, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0571.coefficient37_455, Icur := OriginalRow227TriangleData0571.coefficient37_454,
    output := OriginalRow227TriangleData0585.coefficient38_454, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 419, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0571.coefficient37_456, Icur := OriginalRow227TriangleData0571.coefficient37_455,
    output := OriginalRow227TriangleData0585.coefficient38_455, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 420, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0571.coefficient37_457, Icur := OriginalRow227TriangleData0571.coefficient37_456,
    output := OriginalRow227TriangleData0585.coefficient38_456, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 421, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0571.coefficient37_458, Icur := OriginalRow227TriangleData0571.coefficient37_457,
    output := OriginalRow227TriangleData0585.coefficient38_457, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 422, IA := shift, ID := OriginalRow227TriangleRoots14.root459, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0571.coefficient37_459, Icur := OriginalRow227TriangleData0571.coefficient37_458,
    output := OriginalRow227TriangleData0585.coefficient38_458, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 423, IA := shift, ID := OriginalRow227TriangleRoots14.root460, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0571.coefficient37_460, Icur := OriginalRow227TriangleData0571.coefficient37_459,
    output := OriginalRow227TriangleData0585.coefficient38_459, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 424, IA := shift, ID := OriginalRow227TriangleRoots14.root461, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0571.coefficient37_461, Icur := OriginalRow227TriangleData0571.coefficient37_460,
    output := OriginalRow227TriangleData0585.coefficient38_460, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 425, IA := shift, ID := OriginalRow227TriangleRoots14.root462, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0571.coefficient37_462, Icur := OriginalRow227TriangleData0571.coefficient37_461,
    output := OriginalRow227TriangleData0585.coefficient38_461, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 426, IA := shift, ID := OriginalRow227TriangleRoots14.root463, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0571.coefficient37_463, Icur := OriginalRow227TriangleData0571.coefficient37_462,
    output := OriginalRow227TriangleData0585.coefficient38_462, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos },
  { charge := 427, IA := shift, ID := OriginalRow227TriangleRoots14.root464, IC := OriginalRow227TriangleRoots01.root38,
    Inext := OriginalRow227TriangleData0571.coefficient37_464, Icur := OriginalRow227TriangleData0571.coefficient37_463,
    output := OriginalRow227TriangleData0585.coefficient38_463, hC := OriginalRow227TriangleRoots01.root38_pos, hAC := OriginalRow227TriangleRoots01.product38_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0569

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0569.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

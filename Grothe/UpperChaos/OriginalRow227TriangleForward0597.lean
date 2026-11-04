import Grothe.UpperChaos.OriginalRow227TriangleData0599
import Grothe.UpperChaos.OriginalRow227TriangleData0613
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots14
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0597
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 417, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0599.coefficient39_456, Icur := OriginalRow227TriangleData0599.coefficient39_455,
    output := OriginalRow227TriangleData0613.coefficient40_455, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 418, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0599.coefficient39_457, Icur := OriginalRow227TriangleData0599.coefficient39_456,
    output := OriginalRow227TriangleData0613.coefficient40_456, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 419, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0599.coefficient39_458, Icur := OriginalRow227TriangleData0599.coefficient39_457,
    output := OriginalRow227TriangleData0613.coefficient40_457, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 420, IA := shift, ID := OriginalRow227TriangleRoots14.root459, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0599.coefficient39_459, Icur := OriginalRow227TriangleData0599.coefficient39_458,
    output := OriginalRow227TriangleData0613.coefficient40_458, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 421, IA := shift, ID := OriginalRow227TriangleRoots14.root460, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0599.coefficient39_460, Icur := OriginalRow227TriangleData0599.coefficient39_459,
    output := OriginalRow227TriangleData0613.coefficient40_459, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 422, IA := shift, ID := OriginalRow227TriangleRoots14.root461, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0599.coefficient39_461, Icur := OriginalRow227TriangleData0599.coefficient39_460,
    output := OriginalRow227TriangleData0613.coefficient40_460, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 423, IA := shift, ID := OriginalRow227TriangleRoots14.root462, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0599.coefficient39_462, Icur := OriginalRow227TriangleData0599.coefficient39_461,
    output := OriginalRow227TriangleData0613.coefficient40_461, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0597

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0597.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

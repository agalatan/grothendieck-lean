import Grothe.UpperChaos.OriginalRow227TriangleData2107
import Grothe.UpperChaos.OriginalRow227TriangleData2108
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2092
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots07.root248,
    Inext := OriginalRow227TriangleData2107.coefficient247_248, Icur := OriginalRow227TriangleData2107.coefficient247_247,
    output := OriginalRow227TriangleData2108.coefficient248_247, hC := OriginalRow227TriangleRoots07.root248_pos, hAC := OriginalRow227TriangleRoots07.product248_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots07.root248,
    Inext := OriginalRow227TriangleData2107.coefficient247_249, Icur := OriginalRow227TriangleData2107.coefficient247_248,
    output := OriginalRow227TriangleData2108.coefficient248_248, hC := OriginalRow227TriangleRoots07.root248_pos, hAC := OriginalRow227TriangleRoots07.product248_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots07.root248,
    Inext := OriginalRow227TriangleData2107.coefficient247_250, Icur := OriginalRow227TriangleData2107.coefficient247_249,
    output := OriginalRow227TriangleData2108.coefficient248_249, hC := OriginalRow227TriangleRoots07.root248_pos, hAC := OriginalRow227TriangleRoots07.product248_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots07.root248,
    Inext := OriginalRow227TriangleData2107.coefficient247_251, Icur := OriginalRow227TriangleData2107.coefficient247_250,
    output := OriginalRow227TriangleData2108.coefficient248_250, hC := OriginalRow227TriangleRoots07.root248_pos, hAC := OriginalRow227TriangleRoots07.product248_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots07.root248,
    Inext := OriginalRow227TriangleData2107.coefficient247_252, Icur := OriginalRow227TriangleData2107.coefficient247_251,
    output := OriginalRow227TriangleData2108.coefficient248_251, hC := OriginalRow227TriangleRoots07.root248_pos, hAC := OriginalRow227TriangleRoots07.product248_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots07.root248,
    Inext := OriginalRow227TriangleData2107.coefficient247_253, Icur := OriginalRow227TriangleData2107.coefficient247_252,
    output := OriginalRow227TriangleData2108.coefficient248_252, hC := OriginalRow227TriangleRoots07.root248_pos, hAC := OriginalRow227TriangleRoots07.product248_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots07.root248,
    Inext := OriginalRow227TriangleData2107.coefficient247_254, Icur := OriginalRow227TriangleData2107.coefficient247_253,
    output := OriginalRow227TriangleData2108.coefficient248_253, hC := OriginalRow227TriangleRoots07.root248_pos, hAC := OriginalRow227TriangleRoots07.product248_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2092

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2092.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData2106
import Grothe.UpperChaos.OriginalRow227TriangleData2107
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2091
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots07.root247,
    Inext := OriginalRow227TriangleData2106.coefficient246_247, Icur := OriginalRow227TriangleData2106.coefficient246_246,
    output := OriginalRow227TriangleData2107.coefficient247_246, hC := OriginalRow227TriangleRoots07.root247_pos, hAC := OriginalRow227TriangleRoots07.product247_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots07.root247,
    Inext := OriginalRow227TriangleData2106.coefficient246_248, Icur := OriginalRow227TriangleData2106.coefficient246_247,
    output := OriginalRow227TriangleData2107.coefficient247_247, hC := OriginalRow227TriangleRoots07.root247_pos, hAC := OriginalRow227TriangleRoots07.product247_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots07.root247,
    Inext := OriginalRow227TriangleData2106.coefficient246_249, Icur := OriginalRow227TriangleData2106.coefficient246_248,
    output := OriginalRow227TriangleData2107.coefficient247_248, hC := OriginalRow227TriangleRoots07.root247_pos, hAC := OriginalRow227TriangleRoots07.product247_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots07.root247,
    Inext := OriginalRow227TriangleData2106.coefficient246_250, Icur := OriginalRow227TriangleData2106.coefficient246_249,
    output := OriginalRow227TriangleData2107.coefficient247_249, hC := OriginalRow227TriangleRoots07.root247_pos, hAC := OriginalRow227TriangleRoots07.product247_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots07.root247,
    Inext := OriginalRow227TriangleData2106.coefficient246_251, Icur := OriginalRow227TriangleData2106.coefficient246_250,
    output := OriginalRow227TriangleData2107.coefficient247_250, hC := OriginalRow227TriangleRoots07.root247_pos, hAC := OriginalRow227TriangleRoots07.product247_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots07.root247,
    Inext := OriginalRow227TriangleData2106.coefficient246_252, Icur := OriginalRow227TriangleData2106.coefficient246_251,
    output := OriginalRow227TriangleData2107.coefficient247_251, hC := OriginalRow227TriangleRoots07.root247_pos, hAC := OriginalRow227TriangleRoots07.product247_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots07.root247,
    Inext := OriginalRow227TriangleData2106.coefficient246_253, Icur := OriginalRow227TriangleData2106.coefficient246_252,
    output := OriginalRow227TriangleData2107.coefficient247_252, hC := OriginalRow227TriangleRoots07.root247_pos, hAC := OriginalRow227TriangleRoots07.product247_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots07.root247,
    Inext := OriginalRow227TriangleData2106.coefficient246_254, Icur := OriginalRow227TriangleData2106.coefficient246_253,
    output := OriginalRow227TriangleData2107.coefficient247_253, hC := OriginalRow227TriangleRoots07.root247_pos, hAC := OriginalRow227TriangleRoots07.product247_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots07.root247,
    Inext := OriginalRow227TriangleData2106.coefficient246_255, Icur := OriginalRow227TriangleData2106.coefficient246_254,
    output := OriginalRow227TriangleData2107.coefficient247_254, hC := OriginalRow227TriangleRoots07.root247_pos, hAC := OriginalRow227TriangleRoots07.product247_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2091

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2091.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

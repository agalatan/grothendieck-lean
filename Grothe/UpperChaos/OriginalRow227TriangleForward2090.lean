import Grothe.UpperChaos.OriginalRow227TriangleData2105
import Grothe.UpperChaos.OriginalRow227TriangleData2106
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2090
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots07.root246,
    Inext := OriginalRow227TriangleData2105.coefficient245_246, Icur := OriginalRow227TriangleData2105.coefficient245_245,
    output := OriginalRow227TriangleData2106.coefficient246_245, hC := OriginalRow227TriangleRoots07.root246_pos, hAC := OriginalRow227TriangleRoots07.product246_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots07.root246,
    Inext := OriginalRow227TriangleData2105.coefficient245_247, Icur := OriginalRow227TriangleData2105.coefficient245_246,
    output := OriginalRow227TriangleData2106.coefficient246_246, hC := OriginalRow227TriangleRoots07.root246_pos, hAC := OriginalRow227TriangleRoots07.product246_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots07.root246,
    Inext := OriginalRow227TriangleData2105.coefficient245_248, Icur := OriginalRow227TriangleData2105.coefficient245_247,
    output := OriginalRow227TriangleData2106.coefficient246_247, hC := OriginalRow227TriangleRoots07.root246_pos, hAC := OriginalRow227TriangleRoots07.product246_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots07.root246,
    Inext := OriginalRow227TriangleData2105.coefficient245_249, Icur := OriginalRow227TriangleData2105.coefficient245_248,
    output := OriginalRow227TriangleData2106.coefficient246_248, hC := OriginalRow227TriangleRoots07.root246_pos, hAC := OriginalRow227TriangleRoots07.product246_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots07.root246,
    Inext := OriginalRow227TriangleData2105.coefficient245_250, Icur := OriginalRow227TriangleData2105.coefficient245_249,
    output := OriginalRow227TriangleData2106.coefficient246_249, hC := OriginalRow227TriangleRoots07.root246_pos, hAC := OriginalRow227TriangleRoots07.product246_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots07.root246,
    Inext := OriginalRow227TriangleData2105.coefficient245_251, Icur := OriginalRow227TriangleData2105.coefficient245_250,
    output := OriginalRow227TriangleData2106.coefficient246_250, hC := OriginalRow227TriangleRoots07.root246_pos, hAC := OriginalRow227TriangleRoots07.product246_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots07.root246,
    Inext := OriginalRow227TriangleData2105.coefficient245_252, Icur := OriginalRow227TriangleData2105.coefficient245_251,
    output := OriginalRow227TriangleData2106.coefficient246_251, hC := OriginalRow227TriangleRoots07.root246_pos, hAC := OriginalRow227TriangleRoots07.product246_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots07.root246,
    Inext := OriginalRow227TriangleData2105.coefficient245_253, Icur := OriginalRow227TriangleData2105.coefficient245_252,
    output := OriginalRow227TriangleData2106.coefficient246_252, hC := OriginalRow227TriangleRoots07.root246_pos, hAC := OriginalRow227TriangleRoots07.product246_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots07.root246,
    Inext := OriginalRow227TriangleData2105.coefficient245_254, Icur := OriginalRow227TriangleData2105.coefficient245_253,
    output := OriginalRow227TriangleData2106.coefficient246_253, hC := OriginalRow227TriangleRoots07.root246_pos, hAC := OriginalRow227TriangleRoots07.product246_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots07.root246,
    Inext := OriginalRow227TriangleData2105.coefficient245_255, Icur := OriginalRow227TriangleData2105.coefficient245_254,
    output := OriginalRow227TriangleData2106.coefficient246_254, hC := OriginalRow227TriangleRoots07.root246_pos, hAC := OriginalRow227TriangleRoots07.product246_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots07.root246,
    Inext := OriginalRow227TriangleData2105.coefficient245_256, Icur := OriginalRow227TriangleData2105.coefficient245_255,
    output := OriginalRow227TriangleData2106.coefficient246_255, hC := OriginalRow227TriangleRoots07.root246_pos, hAC := OriginalRow227TriangleRoots07.product246_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2090

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2090.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

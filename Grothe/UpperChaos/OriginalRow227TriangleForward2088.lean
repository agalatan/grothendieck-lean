import Grothe.UpperChaos.OriginalRow227TriangleData2103
import Grothe.UpperChaos.OriginalRow227TriangleData2104
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2088
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots07.root244,
    Inext := OriginalRow227TriangleData2103.coefficient243_244, Icur := OriginalRow227TriangleData2103.coefficient243_243,
    output := OriginalRow227TriangleData2104.coefficient244_243, hC := OriginalRow227TriangleRoots07.root244_pos, hAC := OriginalRow227TriangleRoots07.product244_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots07.root244,
    Inext := OriginalRow227TriangleData2103.coefficient243_245, Icur := OriginalRow227TriangleData2103.coefficient243_244,
    output := OriginalRow227TriangleData2104.coefficient244_244, hC := OriginalRow227TriangleRoots07.root244_pos, hAC := OriginalRow227TriangleRoots07.product244_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots07.root244,
    Inext := OriginalRow227TriangleData2103.coefficient243_246, Icur := OriginalRow227TriangleData2103.coefficient243_245,
    output := OriginalRow227TriangleData2104.coefficient244_245, hC := OriginalRow227TriangleRoots07.root244_pos, hAC := OriginalRow227TriangleRoots07.product244_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots07.root244,
    Inext := OriginalRow227TriangleData2103.coefficient243_247, Icur := OriginalRow227TriangleData2103.coefficient243_246,
    output := OriginalRow227TriangleData2104.coefficient244_246, hC := OriginalRow227TriangleRoots07.root244_pos, hAC := OriginalRow227TriangleRoots07.product244_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots07.root244,
    Inext := OriginalRow227TriangleData2103.coefficient243_248, Icur := OriginalRow227TriangleData2103.coefficient243_247,
    output := OriginalRow227TriangleData2104.coefficient244_247, hC := OriginalRow227TriangleRoots07.root244_pos, hAC := OriginalRow227TriangleRoots07.product244_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots07.root244,
    Inext := OriginalRow227TriangleData2103.coefficient243_249, Icur := OriginalRow227TriangleData2103.coefficient243_248,
    output := OriginalRow227TriangleData2104.coefficient244_248, hC := OriginalRow227TriangleRoots07.root244_pos, hAC := OriginalRow227TriangleRoots07.product244_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots07.root244,
    Inext := OriginalRow227TriangleData2103.coefficient243_250, Icur := OriginalRow227TriangleData2103.coefficient243_249,
    output := OriginalRow227TriangleData2104.coefficient244_249, hC := OriginalRow227TriangleRoots07.root244_pos, hAC := OriginalRow227TriangleRoots07.product244_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots07.root244,
    Inext := OriginalRow227TriangleData2103.coefficient243_251, Icur := OriginalRow227TriangleData2103.coefficient243_250,
    output := OriginalRow227TriangleData2104.coefficient244_250, hC := OriginalRow227TriangleRoots07.root244_pos, hAC := OriginalRow227TriangleRoots07.product244_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots07.root244,
    Inext := OriginalRow227TriangleData2103.coefficient243_252, Icur := OriginalRow227TriangleData2103.coefficient243_251,
    output := OriginalRow227TriangleData2104.coefficient244_251, hC := OriginalRow227TriangleRoots07.root244_pos, hAC := OriginalRow227TriangleRoots07.product244_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots07.root244,
    Inext := OriginalRow227TriangleData2103.coefficient243_253, Icur := OriginalRow227TriangleData2103.coefficient243_252,
    output := OriginalRow227TriangleData2104.coefficient244_252, hC := OriginalRow227TriangleRoots07.root244_pos, hAC := OriginalRow227TriangleRoots07.product244_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots07.root244,
    Inext := OriginalRow227TriangleData2103.coefficient243_254, Icur := OriginalRow227TriangleData2103.coefficient243_253,
    output := OriginalRow227TriangleData2104.coefficient244_253, hC := OriginalRow227TriangleRoots07.root244_pos, hAC := OriginalRow227TriangleRoots07.product244_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots07.root244,
    Inext := OriginalRow227TriangleData2103.coefficient243_255, Icur := OriginalRow227TriangleData2103.coefficient243_254,
    output := OriginalRow227TriangleData2104.coefficient244_254, hC := OriginalRow227TriangleRoots07.root244_pos, hAC := OriginalRow227TriangleRoots07.product244_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots07.root244,
    Inext := OriginalRow227TriangleData2103.coefficient243_256, Icur := OriginalRow227TriangleData2103.coefficient243_255,
    output := OriginalRow227TriangleData2104.coefficient244_255, hC := OriginalRow227TriangleRoots07.root244_pos, hAC := OriginalRow227TriangleRoots07.product244_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots07.root244,
    Inext := OriginalRow227TriangleData2103.coefficient243_257, Icur := OriginalRow227TriangleData2103.coefficient243_256,
    output := OriginalRow227TriangleData2104.coefficient244_256, hC := OriginalRow227TriangleRoots07.root244_pos, hAC := OriginalRow227TriangleRoots07.product244_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots07.root244,
    Inext := OriginalRow227TriangleData2103.coefficient243_258, Icur := OriginalRow227TriangleData2103.coefficient243_257,
    output := OriginalRow227TriangleData2104.coefficient244_257, hC := OriginalRow227TriangleRoots07.root244_pos, hAC := OriginalRow227TriangleRoots07.product244_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2088

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2088.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

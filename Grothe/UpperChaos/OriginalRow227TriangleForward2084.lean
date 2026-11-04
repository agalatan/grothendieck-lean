import Grothe.UpperChaos.OriginalRow227TriangleData2099
import Grothe.UpperChaos.OriginalRow227TriangleData2100
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2084
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_240, Icur := OriginalRow227TriangleData2099.coefficient239_239,
    output := OriginalRow227TriangleData2100.coefficient240_239, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_241, Icur := OriginalRow227TriangleData2099.coefficient239_240,
    output := OriginalRow227TriangleData2100.coefficient240_240, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_242, Icur := OriginalRow227TriangleData2099.coefficient239_241,
    output := OriginalRow227TriangleData2100.coefficient240_241, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_243, Icur := OriginalRow227TriangleData2099.coefficient239_242,
    output := OriginalRow227TriangleData2100.coefficient240_242, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_244, Icur := OriginalRow227TriangleData2099.coefficient239_243,
    output := OriginalRow227TriangleData2100.coefficient240_243, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_245, Icur := OriginalRow227TriangleData2099.coefficient239_244,
    output := OriginalRow227TriangleData2100.coefficient240_244, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_246, Icur := OriginalRow227TriangleData2099.coefficient239_245,
    output := OriginalRow227TriangleData2100.coefficient240_245, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_247, Icur := OriginalRow227TriangleData2099.coefficient239_246,
    output := OriginalRow227TriangleData2100.coefficient240_246, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_248, Icur := OriginalRow227TriangleData2099.coefficient239_247,
    output := OriginalRow227TriangleData2100.coefficient240_247, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_249, Icur := OriginalRow227TriangleData2099.coefficient239_248,
    output := OriginalRow227TriangleData2100.coefficient240_248, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_250, Icur := OriginalRow227TriangleData2099.coefficient239_249,
    output := OriginalRow227TriangleData2100.coefficient240_249, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_251, Icur := OriginalRow227TriangleData2099.coefficient239_250,
    output := OriginalRow227TriangleData2100.coefficient240_250, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_252, Icur := OriginalRow227TriangleData2099.coefficient239_251,
    output := OriginalRow227TriangleData2100.coefficient240_251, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_253, Icur := OriginalRow227TriangleData2099.coefficient239_252,
    output := OriginalRow227TriangleData2100.coefficient240_252, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_254, Icur := OriginalRow227TriangleData2099.coefficient239_253,
    output := OriginalRow227TriangleData2100.coefficient240_253, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_255, Icur := OriginalRow227TriangleData2099.coefficient239_254,
    output := OriginalRow227TriangleData2100.coefficient240_254, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_256, Icur := OriginalRow227TriangleData2099.coefficient239_255,
    output := OriginalRow227TriangleData2100.coefficient240_255, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_257, Icur := OriginalRow227TriangleData2099.coefficient239_256,
    output := OriginalRow227TriangleData2100.coefficient240_256, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_258, Icur := OriginalRow227TriangleData2099.coefficient239_257,
    output := OriginalRow227TriangleData2100.coefficient240_257, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_259, Icur := OriginalRow227TriangleData2099.coefficient239_258,
    output := OriginalRow227TriangleData2100.coefficient240_258, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_260, Icur := OriginalRow227TriangleData2099.coefficient239_259,
    output := OriginalRow227TriangleData2100.coefficient240_259, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_261, Icur := OriginalRow227TriangleData2099.coefficient239_260,
    output := OriginalRow227TriangleData2100.coefficient240_260, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots07.root240,
    Inext := OriginalRow227TriangleData2099.coefficient239_262, Icur := OriginalRow227TriangleData2099.coefficient239_261,
    output := OriginalRow227TriangleData2100.coefficient240_261, hC := OriginalRow227TriangleRoots07.root240_pos, hAC := OriginalRow227TriangleRoots07.product240_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2084

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2084.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

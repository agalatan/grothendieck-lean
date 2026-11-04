import Grothe.UpperChaos.OriginalRow227TriangleData2098
import Grothe.UpperChaos.OriginalRow227TriangleData2099
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2083
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_239, Icur := OriginalRow227TriangleData2098.coefficient238_238,
    output := OriginalRow227TriangleData2099.coefficient239_238, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_240, Icur := OriginalRow227TriangleData2098.coefficient238_239,
    output := OriginalRow227TriangleData2099.coefficient239_239, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_241, Icur := OriginalRow227TriangleData2098.coefficient238_240,
    output := OriginalRow227TriangleData2099.coefficient239_240, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_242, Icur := OriginalRow227TriangleData2098.coefficient238_241,
    output := OriginalRow227TriangleData2099.coefficient239_241, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_243, Icur := OriginalRow227TriangleData2098.coefficient238_242,
    output := OriginalRow227TriangleData2099.coefficient239_242, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_244, Icur := OriginalRow227TriangleData2098.coefficient238_243,
    output := OriginalRow227TriangleData2099.coefficient239_243, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_245, Icur := OriginalRow227TriangleData2098.coefficient238_244,
    output := OriginalRow227TriangleData2099.coefficient239_244, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_246, Icur := OriginalRow227TriangleData2098.coefficient238_245,
    output := OriginalRow227TriangleData2099.coefficient239_245, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_247, Icur := OriginalRow227TriangleData2098.coefficient238_246,
    output := OriginalRow227TriangleData2099.coefficient239_246, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_248, Icur := OriginalRow227TriangleData2098.coefficient238_247,
    output := OriginalRow227TriangleData2099.coefficient239_247, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_249, Icur := OriginalRow227TriangleData2098.coefficient238_248,
    output := OriginalRow227TriangleData2099.coefficient239_248, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_250, Icur := OriginalRow227TriangleData2098.coefficient238_249,
    output := OriginalRow227TriangleData2099.coefficient239_249, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_251, Icur := OriginalRow227TriangleData2098.coefficient238_250,
    output := OriginalRow227TriangleData2099.coefficient239_250, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_252, Icur := OriginalRow227TriangleData2098.coefficient238_251,
    output := OriginalRow227TriangleData2099.coefficient239_251, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_253, Icur := OriginalRow227TriangleData2098.coefficient238_252,
    output := OriginalRow227TriangleData2099.coefficient239_252, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_254, Icur := OriginalRow227TriangleData2098.coefficient238_253,
    output := OriginalRow227TriangleData2099.coefficient239_253, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_255, Icur := OriginalRow227TriangleData2098.coefficient238_254,
    output := OriginalRow227TriangleData2099.coefficient239_254, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_256, Icur := OriginalRow227TriangleData2098.coefficient238_255,
    output := OriginalRow227TriangleData2099.coefficient239_255, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_257, Icur := OriginalRow227TriangleData2098.coefficient238_256,
    output := OriginalRow227TriangleData2099.coefficient239_256, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_258, Icur := OriginalRow227TriangleData2098.coefficient238_257,
    output := OriginalRow227TriangleData2099.coefficient239_257, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_259, Icur := OriginalRow227TriangleData2098.coefficient238_258,
    output := OriginalRow227TriangleData2099.coefficient239_258, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_260, Icur := OriginalRow227TriangleData2098.coefficient238_259,
    output := OriginalRow227TriangleData2099.coefficient239_259, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_261, Icur := OriginalRow227TriangleData2098.coefficient238_260,
    output := OriginalRow227TriangleData2099.coefficient239_260, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_262, Icur := OriginalRow227TriangleData2098.coefficient238_261,
    output := OriginalRow227TriangleData2099.coefficient239_261, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots07.root239,
    Inext := OriginalRow227TriangleData2098.coefficient238_263, Icur := OriginalRow227TriangleData2098.coefficient238_262,
    output := OriginalRow227TriangleData2099.coefficient239_262, hC := OriginalRow227TriangleRoots07.root239_pos, hAC := OriginalRow227TriangleRoots07.product239_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2083

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2083.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

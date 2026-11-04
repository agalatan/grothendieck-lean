import Grothe.UpperChaos.OriginalRow227TriangleData1709
import Grothe.UpperChaos.OriginalRow227TriangleData1710
import Grothe.UpperChaos.OriginalRow227TriangleData1716
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1700
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_243, Icur := OriginalRow227TriangleData1709.coefficient146_242,
    output := OriginalRow227TriangleData1716.coefficient147_242, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_244, Icur := OriginalRow227TriangleData1709.coefficient146_243,
    output := OriginalRow227TriangleData1716.coefficient147_243, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_245, Icur := OriginalRow227TriangleData1709.coefficient146_244,
    output := OriginalRow227TriangleData1716.coefficient147_244, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_246, Icur := OriginalRow227TriangleData1709.coefficient146_245,
    output := OriginalRow227TriangleData1716.coefficient147_245, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_247, Icur := OriginalRow227TriangleData1709.coefficient146_246,
    output := OriginalRow227TriangleData1716.coefficient147_246, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_248, Icur := OriginalRow227TriangleData1709.coefficient146_247,
    output := OriginalRow227TriangleData1716.coefficient147_247, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_249, Icur := OriginalRow227TriangleData1709.coefficient146_248,
    output := OriginalRow227TriangleData1716.coefficient147_248, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_250, Icur := OriginalRow227TriangleData1709.coefficient146_249,
    output := OriginalRow227TriangleData1716.coefficient147_249, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_251, Icur := OriginalRow227TriangleData1709.coefficient146_250,
    output := OriginalRow227TriangleData1716.coefficient147_250, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_252, Icur := OriginalRow227TriangleData1709.coefficient146_251,
    output := OriginalRow227TriangleData1716.coefficient147_251, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_253, Icur := OriginalRow227TriangleData1709.coefficient146_252,
    output := OriginalRow227TriangleData1716.coefficient147_252, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_254, Icur := OriginalRow227TriangleData1709.coefficient146_253,
    output := OriginalRow227TriangleData1716.coefficient147_253, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_255, Icur := OriginalRow227TriangleData1709.coefficient146_254,
    output := OriginalRow227TriangleData1716.coefficient147_254, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_256, Icur := OriginalRow227TriangleData1709.coefficient146_255,
    output := OriginalRow227TriangleData1716.coefficient147_255, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_257, Icur := OriginalRow227TriangleData1709.coefficient146_256,
    output := OriginalRow227TriangleData1716.coefficient147_256, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_258, Icur := OriginalRow227TriangleData1709.coefficient146_257,
    output := OriginalRow227TriangleData1716.coefficient147_257, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_259, Icur := OriginalRow227TriangleData1709.coefficient146_258,
    output := OriginalRow227TriangleData1716.coefficient147_258, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_260, Icur := OriginalRow227TriangleData1709.coefficient146_259,
    output := OriginalRow227TriangleData1716.coefficient147_259, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_261, Icur := OriginalRow227TriangleData1709.coefficient146_260,
    output := OriginalRow227TriangleData1716.coefficient147_260, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_262, Icur := OriginalRow227TriangleData1709.coefficient146_261,
    output := OriginalRow227TriangleData1716.coefficient147_261, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_263, Icur := OriginalRow227TriangleData1709.coefficient146_262,
    output := OriginalRow227TriangleData1716.coefficient147_262, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_264, Icur := OriginalRow227TriangleData1709.coefficient146_263,
    output := OriginalRow227TriangleData1716.coefficient147_263, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_265, Icur := OriginalRow227TriangleData1709.coefficient146_264,
    output := OriginalRow227TriangleData1716.coefficient147_264, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_266, Icur := OriginalRow227TriangleData1709.coefficient146_265,
    output := OriginalRow227TriangleData1716.coefficient147_265, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_267, Icur := OriginalRow227TriangleData1709.coefficient146_266,
    output := OriginalRow227TriangleData1716.coefficient147_266, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_268, Icur := OriginalRow227TriangleData1709.coefficient146_267,
    output := OriginalRow227TriangleData1716.coefficient147_267, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_269, Icur := OriginalRow227TriangleData1709.coefficient146_268,
    output := OriginalRow227TriangleData1716.coefficient147_268, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_270, Icur := OriginalRow227TriangleData1709.coefficient146_269,
    output := OriginalRow227TriangleData1716.coefficient147_269, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_271, Icur := OriginalRow227TriangleData1709.coefficient146_270,
    output := OriginalRow227TriangleData1716.coefficient147_270, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1709.coefficient146_272, Icur := OriginalRow227TriangleData1709.coefficient146_271,
    output := OriginalRow227TriangleData1716.coefficient147_271, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1710.coefficient146_273, Icur := OriginalRow227TriangleData1709.coefficient146_272,
    output := OriginalRow227TriangleData1716.coefficient147_272, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1710.coefficient146_274, Icur := OriginalRow227TriangleData1710.coefficient146_273,
    output := OriginalRow227TriangleData1716.coefficient147_273, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1700

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1700.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

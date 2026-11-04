import Grothe.UpperChaos.OriginalRow227TriangleData1695
import Grothe.UpperChaos.OriginalRow227TriangleData1696
import Grothe.UpperChaos.OriginalRow227TriangleData1702
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1686
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_241, Icur := OriginalRow227TriangleData1695.coefficient144_240,
    output := OriginalRow227TriangleData1702.coefficient145_240, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_242, Icur := OriginalRow227TriangleData1695.coefficient144_241,
    output := OriginalRow227TriangleData1702.coefficient145_241, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_243, Icur := OriginalRow227TriangleData1695.coefficient144_242,
    output := OriginalRow227TriangleData1702.coefficient145_242, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_244, Icur := OriginalRow227TriangleData1695.coefficient144_243,
    output := OriginalRow227TriangleData1702.coefficient145_243, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_245, Icur := OriginalRow227TriangleData1695.coefficient144_244,
    output := OriginalRow227TriangleData1702.coefficient145_244, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_246, Icur := OriginalRow227TriangleData1695.coefficient144_245,
    output := OriginalRow227TriangleData1702.coefficient145_245, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_247, Icur := OriginalRow227TriangleData1695.coefficient144_246,
    output := OriginalRow227TriangleData1702.coefficient145_246, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_248, Icur := OriginalRow227TriangleData1695.coefficient144_247,
    output := OriginalRow227TriangleData1702.coefficient145_247, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_249, Icur := OriginalRow227TriangleData1695.coefficient144_248,
    output := OriginalRow227TriangleData1702.coefficient145_248, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_250, Icur := OriginalRow227TriangleData1695.coefficient144_249,
    output := OriginalRow227TriangleData1702.coefficient145_249, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_251, Icur := OriginalRow227TriangleData1695.coefficient144_250,
    output := OriginalRow227TriangleData1702.coefficient145_250, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_252, Icur := OriginalRow227TriangleData1695.coefficient144_251,
    output := OriginalRow227TriangleData1702.coefficient145_251, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_253, Icur := OriginalRow227TriangleData1695.coefficient144_252,
    output := OriginalRow227TriangleData1702.coefficient145_252, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_254, Icur := OriginalRow227TriangleData1695.coefficient144_253,
    output := OriginalRow227TriangleData1702.coefficient145_253, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_255, Icur := OriginalRow227TriangleData1695.coefficient144_254,
    output := OriginalRow227TriangleData1702.coefficient145_254, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_256, Icur := OriginalRow227TriangleData1695.coefficient144_255,
    output := OriginalRow227TriangleData1702.coefficient145_255, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_257, Icur := OriginalRow227TriangleData1695.coefficient144_256,
    output := OriginalRow227TriangleData1702.coefficient145_256, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_258, Icur := OriginalRow227TriangleData1695.coefficient144_257,
    output := OriginalRow227TriangleData1702.coefficient145_257, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_259, Icur := OriginalRow227TriangleData1695.coefficient144_258,
    output := OriginalRow227TriangleData1702.coefficient145_258, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_260, Icur := OriginalRow227TriangleData1695.coefficient144_259,
    output := OriginalRow227TriangleData1702.coefficient145_259, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_261, Icur := OriginalRow227TriangleData1695.coefficient144_260,
    output := OriginalRow227TriangleData1702.coefficient145_260, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_262, Icur := OriginalRow227TriangleData1695.coefficient144_261,
    output := OriginalRow227TriangleData1702.coefficient145_261, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_263, Icur := OriginalRow227TriangleData1695.coefficient144_262,
    output := OriginalRow227TriangleData1702.coefficient145_262, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_264, Icur := OriginalRow227TriangleData1695.coefficient144_263,
    output := OriginalRow227TriangleData1702.coefficient145_263, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_265, Icur := OriginalRow227TriangleData1695.coefficient144_264,
    output := OriginalRow227TriangleData1702.coefficient145_264, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_266, Icur := OriginalRow227TriangleData1695.coefficient144_265,
    output := OriginalRow227TriangleData1702.coefficient145_265, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_267, Icur := OriginalRow227TriangleData1695.coefficient144_266,
    output := OriginalRow227TriangleData1702.coefficient145_266, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_268, Icur := OriginalRow227TriangleData1695.coefficient144_267,
    output := OriginalRow227TriangleData1702.coefficient145_267, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_269, Icur := OriginalRow227TriangleData1695.coefficient144_268,
    output := OriginalRow227TriangleData1702.coefficient145_268, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1695.coefficient144_270, Icur := OriginalRow227TriangleData1695.coefficient144_269,
    output := OriginalRow227TriangleData1702.coefficient145_269, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1696.coefficient144_271, Icur := OriginalRow227TriangleData1695.coefficient144_270,
    output := OriginalRow227TriangleData1702.coefficient145_270, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots04.root145,
    Inext := OriginalRow227TriangleData1696.coefficient144_272, Icur := OriginalRow227TriangleData1696.coefficient144_271,
    output := OriginalRow227TriangleData1702.coefficient145_271, hC := OriginalRow227TriangleRoots04.root145_pos, hAC := OriginalRow227TriangleRoots04.product145_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1686

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1686.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

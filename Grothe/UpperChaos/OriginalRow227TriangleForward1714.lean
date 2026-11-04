import Grothe.UpperChaos.OriginalRow227TriangleData1723
import Grothe.UpperChaos.OriginalRow227TriangleData1724
import Grothe.UpperChaos.OriginalRow227TriangleData1730
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1714
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_245, Icur := OriginalRow227TriangleData1723.coefficient148_244,
    output := OriginalRow227TriangleData1730.coefficient149_244, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_246, Icur := OriginalRow227TriangleData1723.coefficient148_245,
    output := OriginalRow227TriangleData1730.coefficient149_245, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_247, Icur := OriginalRow227TriangleData1723.coefficient148_246,
    output := OriginalRow227TriangleData1730.coefficient149_246, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_248, Icur := OriginalRow227TriangleData1723.coefficient148_247,
    output := OriginalRow227TriangleData1730.coefficient149_247, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_249, Icur := OriginalRow227TriangleData1723.coefficient148_248,
    output := OriginalRow227TriangleData1730.coefficient149_248, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_250, Icur := OriginalRow227TriangleData1723.coefficient148_249,
    output := OriginalRow227TriangleData1730.coefficient149_249, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_251, Icur := OriginalRow227TriangleData1723.coefficient148_250,
    output := OriginalRow227TriangleData1730.coefficient149_250, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_252, Icur := OriginalRow227TriangleData1723.coefficient148_251,
    output := OriginalRow227TriangleData1730.coefficient149_251, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_253, Icur := OriginalRow227TriangleData1723.coefficient148_252,
    output := OriginalRow227TriangleData1730.coefficient149_252, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_254, Icur := OriginalRow227TriangleData1723.coefficient148_253,
    output := OriginalRow227TriangleData1730.coefficient149_253, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_255, Icur := OriginalRow227TriangleData1723.coefficient148_254,
    output := OriginalRow227TriangleData1730.coefficient149_254, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_256, Icur := OriginalRow227TriangleData1723.coefficient148_255,
    output := OriginalRow227TriangleData1730.coefficient149_255, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_257, Icur := OriginalRow227TriangleData1723.coefficient148_256,
    output := OriginalRow227TriangleData1730.coefficient149_256, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_258, Icur := OriginalRow227TriangleData1723.coefficient148_257,
    output := OriginalRow227TriangleData1730.coefficient149_257, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_259, Icur := OriginalRow227TriangleData1723.coefficient148_258,
    output := OriginalRow227TriangleData1730.coefficient149_258, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_260, Icur := OriginalRow227TriangleData1723.coefficient148_259,
    output := OriginalRow227TriangleData1730.coefficient149_259, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_261, Icur := OriginalRow227TriangleData1723.coefficient148_260,
    output := OriginalRow227TriangleData1730.coefficient149_260, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_262, Icur := OriginalRow227TriangleData1723.coefficient148_261,
    output := OriginalRow227TriangleData1730.coefficient149_261, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_263, Icur := OriginalRow227TriangleData1723.coefficient148_262,
    output := OriginalRow227TriangleData1730.coefficient149_262, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_264, Icur := OriginalRow227TriangleData1723.coefficient148_263,
    output := OriginalRow227TriangleData1730.coefficient149_263, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_265, Icur := OriginalRow227TriangleData1723.coefficient148_264,
    output := OriginalRow227TriangleData1730.coefficient149_264, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_266, Icur := OriginalRow227TriangleData1723.coefficient148_265,
    output := OriginalRow227TriangleData1730.coefficient149_265, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_267, Icur := OriginalRow227TriangleData1723.coefficient148_266,
    output := OriginalRow227TriangleData1730.coefficient149_266, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_268, Icur := OriginalRow227TriangleData1723.coefficient148_267,
    output := OriginalRow227TriangleData1730.coefficient149_267, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_269, Icur := OriginalRow227TriangleData1723.coefficient148_268,
    output := OriginalRow227TriangleData1730.coefficient149_268, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_270, Icur := OriginalRow227TriangleData1723.coefficient148_269,
    output := OriginalRow227TriangleData1730.coefficient149_269, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_271, Icur := OriginalRow227TriangleData1723.coefficient148_270,
    output := OriginalRow227TriangleData1730.coefficient149_270, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_272, Icur := OriginalRow227TriangleData1723.coefficient148_271,
    output := OriginalRow227TriangleData1730.coefficient149_271, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_273, Icur := OriginalRow227TriangleData1723.coefficient148_272,
    output := OriginalRow227TriangleData1730.coefficient149_272, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1723.coefficient148_274, Icur := OriginalRow227TriangleData1723.coefficient148_273,
    output := OriginalRow227TriangleData1730.coefficient149_273, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1724.coefficient148_275, Icur := OriginalRow227TriangleData1723.coefficient148_274,
    output := OriginalRow227TriangleData1730.coefficient149_274, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1724.coefficient148_276, Icur := OriginalRow227TriangleData1724.coefficient148_275,
    output := OriginalRow227TriangleData1730.coefficient149_275, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1714

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1714.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

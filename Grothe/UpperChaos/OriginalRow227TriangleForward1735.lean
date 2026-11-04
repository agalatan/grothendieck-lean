import Grothe.UpperChaos.OriginalRow227TriangleData1744
import Grothe.UpperChaos.OriginalRow227TriangleData1745
import Grothe.UpperChaos.OriginalRow227TriangleData1751
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1735
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_248, Icur := OriginalRow227TriangleData1744.coefficient151_247,
    output := OriginalRow227TriangleData1751.coefficient152_247, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_249, Icur := OriginalRow227TriangleData1744.coefficient151_248,
    output := OriginalRow227TriangleData1751.coefficient152_248, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_250, Icur := OriginalRow227TriangleData1744.coefficient151_249,
    output := OriginalRow227TriangleData1751.coefficient152_249, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_251, Icur := OriginalRow227TriangleData1744.coefficient151_250,
    output := OriginalRow227TriangleData1751.coefficient152_250, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_252, Icur := OriginalRow227TriangleData1744.coefficient151_251,
    output := OriginalRow227TriangleData1751.coefficient152_251, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_253, Icur := OriginalRow227TriangleData1744.coefficient151_252,
    output := OriginalRow227TriangleData1751.coefficient152_252, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_254, Icur := OriginalRow227TriangleData1744.coefficient151_253,
    output := OriginalRow227TriangleData1751.coefficient152_253, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_255, Icur := OriginalRow227TriangleData1744.coefficient151_254,
    output := OriginalRow227TriangleData1751.coefficient152_254, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_256, Icur := OriginalRow227TriangleData1744.coefficient151_255,
    output := OriginalRow227TriangleData1751.coefficient152_255, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_257, Icur := OriginalRow227TriangleData1744.coefficient151_256,
    output := OriginalRow227TriangleData1751.coefficient152_256, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_258, Icur := OriginalRow227TriangleData1744.coefficient151_257,
    output := OriginalRow227TriangleData1751.coefficient152_257, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_259, Icur := OriginalRow227TriangleData1744.coefficient151_258,
    output := OriginalRow227TriangleData1751.coefficient152_258, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_260, Icur := OriginalRow227TriangleData1744.coefficient151_259,
    output := OriginalRow227TriangleData1751.coefficient152_259, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_261, Icur := OriginalRow227TriangleData1744.coefficient151_260,
    output := OriginalRow227TriangleData1751.coefficient152_260, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_262, Icur := OriginalRow227TriangleData1744.coefficient151_261,
    output := OriginalRow227TriangleData1751.coefficient152_261, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_263, Icur := OriginalRow227TriangleData1744.coefficient151_262,
    output := OriginalRow227TriangleData1751.coefficient152_262, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_264, Icur := OriginalRow227TriangleData1744.coefficient151_263,
    output := OriginalRow227TriangleData1751.coefficient152_263, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_265, Icur := OriginalRow227TriangleData1744.coefficient151_264,
    output := OriginalRow227TriangleData1751.coefficient152_264, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_266, Icur := OriginalRow227TriangleData1744.coefficient151_265,
    output := OriginalRow227TriangleData1751.coefficient152_265, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_267, Icur := OriginalRow227TriangleData1744.coefficient151_266,
    output := OriginalRow227TriangleData1751.coefficient152_266, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_268, Icur := OriginalRow227TriangleData1744.coefficient151_267,
    output := OriginalRow227TriangleData1751.coefficient152_267, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_269, Icur := OriginalRow227TriangleData1744.coefficient151_268,
    output := OriginalRow227TriangleData1751.coefficient152_268, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_270, Icur := OriginalRow227TriangleData1744.coefficient151_269,
    output := OriginalRow227TriangleData1751.coefficient152_269, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_271, Icur := OriginalRow227TriangleData1744.coefficient151_270,
    output := OriginalRow227TriangleData1751.coefficient152_270, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_272, Icur := OriginalRow227TriangleData1744.coefficient151_271,
    output := OriginalRow227TriangleData1751.coefficient152_271, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_273, Icur := OriginalRow227TriangleData1744.coefficient151_272,
    output := OriginalRow227TriangleData1751.coefficient152_272, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_274, Icur := OriginalRow227TriangleData1744.coefficient151_273,
    output := OriginalRow227TriangleData1751.coefficient152_273, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_275, Icur := OriginalRow227TriangleData1744.coefficient151_274,
    output := OriginalRow227TriangleData1751.coefficient152_274, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_276, Icur := OriginalRow227TriangleData1744.coefficient151_275,
    output := OriginalRow227TriangleData1751.coefficient152_275, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1744.coefficient151_277, Icur := OriginalRow227TriangleData1744.coefficient151_276,
    output := OriginalRow227TriangleData1751.coefficient152_276, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1745.coefficient151_278, Icur := OriginalRow227TriangleData1744.coefficient151_277,
    output := OriginalRow227TriangleData1751.coefficient152_277, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots04.root152,
    Inext := OriginalRow227TriangleData1745.coefficient151_279, Icur := OriginalRow227TriangleData1745.coefficient151_278,
    output := OriginalRow227TriangleData1751.coefficient152_278, hC := OriginalRow227TriangleRoots04.root152_pos, hAC := OriginalRow227TriangleRoots04.product152_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1735

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1735.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

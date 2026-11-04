import Grothe.UpperChaos.OriginalRow227TriangleData1791
import Grothe.UpperChaos.OriginalRow227TriangleData1792
import Grothe.UpperChaos.OriginalRow227TriangleData1797
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1781
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_255, Icur := OriginalRow227TriangleData1791.coefficient158_254,
    output := OriginalRow227TriangleData1797.coefficient159_254, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_256, Icur := OriginalRow227TriangleData1791.coefficient158_255,
    output := OriginalRow227TriangleData1797.coefficient159_255, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_257, Icur := OriginalRow227TriangleData1791.coefficient158_256,
    output := OriginalRow227TriangleData1797.coefficient159_256, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_258, Icur := OriginalRow227TriangleData1791.coefficient158_257,
    output := OriginalRow227TriangleData1797.coefficient159_257, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_259, Icur := OriginalRow227TriangleData1791.coefficient158_258,
    output := OriginalRow227TriangleData1797.coefficient159_258, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_260, Icur := OriginalRow227TriangleData1791.coefficient158_259,
    output := OriginalRow227TriangleData1797.coefficient159_259, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_261, Icur := OriginalRow227TriangleData1791.coefficient158_260,
    output := OriginalRow227TriangleData1797.coefficient159_260, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_262, Icur := OriginalRow227TriangleData1791.coefficient158_261,
    output := OriginalRow227TriangleData1797.coefficient159_261, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_263, Icur := OriginalRow227TriangleData1791.coefficient158_262,
    output := OriginalRow227TriangleData1797.coefficient159_262, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_264, Icur := OriginalRow227TriangleData1791.coefficient158_263,
    output := OriginalRow227TriangleData1797.coefficient159_263, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_265, Icur := OriginalRow227TriangleData1791.coefficient158_264,
    output := OriginalRow227TriangleData1797.coefficient159_264, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_266, Icur := OriginalRow227TriangleData1791.coefficient158_265,
    output := OriginalRow227TriangleData1797.coefficient159_265, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_267, Icur := OriginalRow227TriangleData1791.coefficient158_266,
    output := OriginalRow227TriangleData1797.coefficient159_266, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_268, Icur := OriginalRow227TriangleData1791.coefficient158_267,
    output := OriginalRow227TriangleData1797.coefficient159_267, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_269, Icur := OriginalRow227TriangleData1791.coefficient158_268,
    output := OriginalRow227TriangleData1797.coefficient159_268, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_270, Icur := OriginalRow227TriangleData1791.coefficient158_269,
    output := OriginalRow227TriangleData1797.coefficient159_269, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_271, Icur := OriginalRow227TriangleData1791.coefficient158_270,
    output := OriginalRow227TriangleData1797.coefficient159_270, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_272, Icur := OriginalRow227TriangleData1791.coefficient158_271,
    output := OriginalRow227TriangleData1797.coefficient159_271, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_273, Icur := OriginalRow227TriangleData1791.coefficient158_272,
    output := OriginalRow227TriangleData1797.coefficient159_272, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_274, Icur := OriginalRow227TriangleData1791.coefficient158_273,
    output := OriginalRow227TriangleData1797.coefficient159_273, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_275, Icur := OriginalRow227TriangleData1791.coefficient158_274,
    output := OriginalRow227TriangleData1797.coefficient159_274, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_276, Icur := OriginalRow227TriangleData1791.coefficient158_275,
    output := OriginalRow227TriangleData1797.coefficient159_275, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_277, Icur := OriginalRow227TriangleData1791.coefficient158_276,
    output := OriginalRow227TriangleData1797.coefficient159_276, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_278, Icur := OriginalRow227TriangleData1791.coefficient158_277,
    output := OriginalRow227TriangleData1797.coefficient159_277, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_279, Icur := OriginalRow227TriangleData1791.coefficient158_278,
    output := OriginalRow227TriangleData1797.coefficient159_278, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_280, Icur := OriginalRow227TriangleData1791.coefficient158_279,
    output := OriginalRow227TriangleData1797.coefficient159_279, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_281, Icur := OriginalRow227TriangleData1791.coefficient158_280,
    output := OriginalRow227TriangleData1797.coefficient159_280, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_282, Icur := OriginalRow227TriangleData1791.coefficient158_281,
    output := OriginalRow227TriangleData1797.coefficient159_281, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_283, Icur := OriginalRow227TriangleData1791.coefficient158_282,
    output := OriginalRow227TriangleData1797.coefficient159_282, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1791.coefficient158_284, Icur := OriginalRow227TriangleData1791.coefficient158_283,
    output := OriginalRow227TriangleData1797.coefficient159_283, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_285, Icur := OriginalRow227TriangleData1791.coefficient158_284,
    output := OriginalRow227TriangleData1797.coefficient159_284, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_286, Icur := OriginalRow227TriangleData1792.coefficient158_285,
    output := OriginalRow227TriangleData1797.coefficient159_285, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1781

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1781.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

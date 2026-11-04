import Grothe.UpperChaos.OriginalRow227TriangleData1556
import Grothe.UpperChaos.OriginalRow227TriangleData1557
import Grothe.UpperChaos.OriginalRow227TriangleData1564
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1548
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_255, Icur := OriginalRow227TriangleData1556.coefficient126_254,
    output := OriginalRow227TriangleData1564.coefficient127_254, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_256, Icur := OriginalRow227TriangleData1556.coefficient126_255,
    output := OriginalRow227TriangleData1564.coefficient127_255, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_257, Icur := OriginalRow227TriangleData1556.coefficient126_256,
    output := OriginalRow227TriangleData1564.coefficient127_256, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_258, Icur := OriginalRow227TriangleData1556.coefficient126_257,
    output := OriginalRow227TriangleData1564.coefficient127_257, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_259, Icur := OriginalRow227TriangleData1556.coefficient126_258,
    output := OriginalRow227TriangleData1564.coefficient127_258, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_260, Icur := OriginalRow227TriangleData1556.coefficient126_259,
    output := OriginalRow227TriangleData1564.coefficient127_259, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_261, Icur := OriginalRow227TriangleData1556.coefficient126_260,
    output := OriginalRow227TriangleData1564.coefficient127_260, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_262, Icur := OriginalRow227TriangleData1556.coefficient126_261,
    output := OriginalRow227TriangleData1564.coefficient127_261, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_263, Icur := OriginalRow227TriangleData1556.coefficient126_262,
    output := OriginalRow227TriangleData1564.coefficient127_262, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_264, Icur := OriginalRow227TriangleData1556.coefficient126_263,
    output := OriginalRow227TriangleData1564.coefficient127_263, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_265, Icur := OriginalRow227TriangleData1556.coefficient126_264,
    output := OriginalRow227TriangleData1564.coefficient127_264, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_266, Icur := OriginalRow227TriangleData1556.coefficient126_265,
    output := OriginalRow227TriangleData1564.coefficient127_265, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_267, Icur := OriginalRow227TriangleData1556.coefficient126_266,
    output := OriginalRow227TriangleData1564.coefficient127_266, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_268, Icur := OriginalRow227TriangleData1556.coefficient126_267,
    output := OriginalRow227TriangleData1564.coefficient127_267, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_269, Icur := OriginalRow227TriangleData1556.coefficient126_268,
    output := OriginalRow227TriangleData1564.coefficient127_268, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_270, Icur := OriginalRow227TriangleData1556.coefficient126_269,
    output := OriginalRow227TriangleData1564.coefficient127_269, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_271, Icur := OriginalRow227TriangleData1556.coefficient126_270,
    output := OriginalRow227TriangleData1564.coefficient127_270, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_272, Icur := OriginalRow227TriangleData1556.coefficient126_271,
    output := OriginalRow227TriangleData1564.coefficient127_271, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_273, Icur := OriginalRow227TriangleData1556.coefficient126_272,
    output := OriginalRow227TriangleData1564.coefficient127_272, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_274, Icur := OriginalRow227TriangleData1556.coefficient126_273,
    output := OriginalRow227TriangleData1564.coefficient127_273, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_275, Icur := OriginalRow227TriangleData1556.coefficient126_274,
    output := OriginalRow227TriangleData1564.coefficient127_274, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_276, Icur := OriginalRow227TriangleData1556.coefficient126_275,
    output := OriginalRow227TriangleData1564.coefficient127_275, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_277, Icur := OriginalRow227TriangleData1556.coefficient126_276,
    output := OriginalRow227TriangleData1564.coefficient127_276, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_278, Icur := OriginalRow227TriangleData1556.coefficient126_277,
    output := OriginalRow227TriangleData1564.coefficient127_277, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_279, Icur := OriginalRow227TriangleData1556.coefficient126_278,
    output := OriginalRow227TriangleData1564.coefficient127_278, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_280, Icur := OriginalRow227TriangleData1556.coefficient126_279,
    output := OriginalRow227TriangleData1564.coefficient127_279, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_281, Icur := OriginalRow227TriangleData1556.coefficient126_280,
    output := OriginalRow227TriangleData1564.coefficient127_280, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_282, Icur := OriginalRow227TriangleData1556.coefficient126_281,
    output := OriginalRow227TriangleData1564.coefficient127_281, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_283, Icur := OriginalRow227TriangleData1556.coefficient126_282,
    output := OriginalRow227TriangleData1564.coefficient127_282, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1556.coefficient126_284, Icur := OriginalRow227TriangleData1556.coefficient126_283,
    output := OriginalRow227TriangleData1564.coefficient127_283, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_285, Icur := OriginalRow227TriangleData1556.coefficient126_284,
    output := OriginalRow227TriangleData1564.coefficient127_284, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_286, Icur := OriginalRow227TriangleData1557.coefficient126_285,
    output := OriginalRow227TriangleData1564.coefficient127_285, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1548

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1548.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

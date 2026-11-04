import Grothe.UpperChaos.OriginalRow227TriangleData2069
import Grothe.UpperChaos.OriginalRow227TriangleData2071
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2055
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_255, Icur := OriginalRow227TriangleData2069.coefficient222_254,
    output := OriginalRow227TriangleData2071.coefficient223_254, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_256, Icur := OriginalRow227TriangleData2069.coefficient222_255,
    output := OriginalRow227TriangleData2071.coefficient223_255, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_257, Icur := OriginalRow227TriangleData2069.coefficient222_256,
    output := OriginalRow227TriangleData2071.coefficient223_256, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_258, Icur := OriginalRow227TriangleData2069.coefficient222_257,
    output := OriginalRow227TriangleData2071.coefficient223_257, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_259, Icur := OriginalRow227TriangleData2069.coefficient222_258,
    output := OriginalRow227TriangleData2071.coefficient223_258, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_260, Icur := OriginalRow227TriangleData2069.coefficient222_259,
    output := OriginalRow227TriangleData2071.coefficient223_259, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_261, Icur := OriginalRow227TriangleData2069.coefficient222_260,
    output := OriginalRow227TriangleData2071.coefficient223_260, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_262, Icur := OriginalRow227TriangleData2069.coefficient222_261,
    output := OriginalRow227TriangleData2071.coefficient223_261, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_263, Icur := OriginalRow227TriangleData2069.coefficient222_262,
    output := OriginalRow227TriangleData2071.coefficient223_262, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_264, Icur := OriginalRow227TriangleData2069.coefficient222_263,
    output := OriginalRow227TriangleData2071.coefficient223_263, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_265, Icur := OriginalRow227TriangleData2069.coefficient222_264,
    output := OriginalRow227TriangleData2071.coefficient223_264, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_266, Icur := OriginalRow227TriangleData2069.coefficient222_265,
    output := OriginalRow227TriangleData2071.coefficient223_265, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_267, Icur := OriginalRow227TriangleData2069.coefficient222_266,
    output := OriginalRow227TriangleData2071.coefficient223_266, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_268, Icur := OriginalRow227TriangleData2069.coefficient222_267,
    output := OriginalRow227TriangleData2071.coefficient223_267, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_269, Icur := OriginalRow227TriangleData2069.coefficient222_268,
    output := OriginalRow227TriangleData2071.coefficient223_268, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_270, Icur := OriginalRow227TriangleData2069.coefficient222_269,
    output := OriginalRow227TriangleData2071.coefficient223_269, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_271, Icur := OriginalRow227TriangleData2069.coefficient222_270,
    output := OriginalRow227TriangleData2071.coefficient223_270, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_272, Icur := OriginalRow227TriangleData2069.coefficient222_271,
    output := OriginalRow227TriangleData2071.coefficient223_271, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_273, Icur := OriginalRow227TriangleData2069.coefficient222_272,
    output := OriginalRow227TriangleData2071.coefficient223_272, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_274, Icur := OriginalRow227TriangleData2069.coefficient222_273,
    output := OriginalRow227TriangleData2071.coefficient223_273, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_275, Icur := OriginalRow227TriangleData2069.coefficient222_274,
    output := OriginalRow227TriangleData2071.coefficient223_274, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_276, Icur := OriginalRow227TriangleData2069.coefficient222_275,
    output := OriginalRow227TriangleData2071.coefficient223_275, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_277, Icur := OriginalRow227TriangleData2069.coefficient222_276,
    output := OriginalRow227TriangleData2071.coefficient223_276, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_278, Icur := OriginalRow227TriangleData2069.coefficient222_277,
    output := OriginalRow227TriangleData2071.coefficient223_277, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots06.root223,
    Inext := OriginalRow227TriangleData2069.coefficient222_279, Icur := OriginalRow227TriangleData2069.coefficient222_278,
    output := OriginalRow227TriangleData2071.coefficient223_278, hC := OriginalRow227TriangleRoots06.root223_pos, hAC := OriginalRow227TriangleRoots06.product223_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2055

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2055.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

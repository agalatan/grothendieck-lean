import Grothe.UpperChaos.OriginalRow227TriangleData1612
import Grothe.UpperChaos.OriginalRow227TriangleData1613
import Grothe.UpperChaos.OriginalRow227TriangleData1620
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1604
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_262, Icur := OriginalRow227TriangleData1612.coefficient133_261,
    output := OriginalRow227TriangleData1620.coefficient134_261, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_263, Icur := OriginalRow227TriangleData1612.coefficient133_262,
    output := OriginalRow227TriangleData1620.coefficient134_262, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_264, Icur := OriginalRow227TriangleData1612.coefficient133_263,
    output := OriginalRow227TriangleData1620.coefficient134_263, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_265, Icur := OriginalRow227TriangleData1612.coefficient133_264,
    output := OriginalRow227TriangleData1620.coefficient134_264, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_266, Icur := OriginalRow227TriangleData1612.coefficient133_265,
    output := OriginalRow227TriangleData1620.coefficient134_265, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_267, Icur := OriginalRow227TriangleData1612.coefficient133_266,
    output := OriginalRow227TriangleData1620.coefficient134_266, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_268, Icur := OriginalRow227TriangleData1612.coefficient133_267,
    output := OriginalRow227TriangleData1620.coefficient134_267, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_269, Icur := OriginalRow227TriangleData1612.coefficient133_268,
    output := OriginalRow227TriangleData1620.coefficient134_268, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_270, Icur := OriginalRow227TriangleData1612.coefficient133_269,
    output := OriginalRow227TriangleData1620.coefficient134_269, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_271, Icur := OriginalRow227TriangleData1612.coefficient133_270,
    output := OriginalRow227TriangleData1620.coefficient134_270, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_272, Icur := OriginalRow227TriangleData1612.coefficient133_271,
    output := OriginalRow227TriangleData1620.coefficient134_271, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_273, Icur := OriginalRow227TriangleData1612.coefficient133_272,
    output := OriginalRow227TriangleData1620.coefficient134_272, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_274, Icur := OriginalRow227TriangleData1612.coefficient133_273,
    output := OriginalRow227TriangleData1620.coefficient134_273, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_275, Icur := OriginalRow227TriangleData1612.coefficient133_274,
    output := OriginalRow227TriangleData1620.coefficient134_274, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_276, Icur := OriginalRow227TriangleData1612.coefficient133_275,
    output := OriginalRow227TriangleData1620.coefficient134_275, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_277, Icur := OriginalRow227TriangleData1612.coefficient133_276,
    output := OriginalRow227TriangleData1620.coefficient134_276, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_278, Icur := OriginalRow227TriangleData1612.coefficient133_277,
    output := OriginalRow227TriangleData1620.coefficient134_277, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_279, Icur := OriginalRow227TriangleData1612.coefficient133_278,
    output := OriginalRow227TriangleData1620.coefficient134_278, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_280, Icur := OriginalRow227TriangleData1612.coefficient133_279,
    output := OriginalRow227TriangleData1620.coefficient134_279, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_281, Icur := OriginalRow227TriangleData1612.coefficient133_280,
    output := OriginalRow227TriangleData1620.coefficient134_280, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_282, Icur := OriginalRow227TriangleData1612.coefficient133_281,
    output := OriginalRow227TriangleData1620.coefficient134_281, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_283, Icur := OriginalRow227TriangleData1612.coefficient133_282,
    output := OriginalRow227TriangleData1620.coefficient134_282, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_284, Icur := OriginalRow227TriangleData1612.coefficient133_283,
    output := OriginalRow227TriangleData1620.coefficient134_283, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_285, Icur := OriginalRow227TriangleData1612.coefficient133_284,
    output := OriginalRow227TriangleData1620.coefficient134_284, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_286, Icur := OriginalRow227TriangleData1612.coefficient133_285,
    output := OriginalRow227TriangleData1620.coefficient134_285, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_287, Icur := OriginalRow227TriangleData1612.coefficient133_286,
    output := OriginalRow227TriangleData1620.coefficient134_286, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_288, Icur := OriginalRow227TriangleData1612.coefficient133_287,
    output := OriginalRow227TriangleData1620.coefficient134_287, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_289, Icur := OriginalRow227TriangleData1612.coefficient133_288,
    output := OriginalRow227TriangleData1620.coefficient134_288, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_290, Icur := OriginalRow227TriangleData1612.coefficient133_289,
    output := OriginalRow227TriangleData1620.coefficient134_289, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1612.coefficient133_291, Icur := OriginalRow227TriangleData1612.coefficient133_290,
    output := OriginalRow227TriangleData1620.coefficient134_290, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1613.coefficient133_292, Icur := OriginalRow227TriangleData1612.coefficient133_291,
    output := OriginalRow227TriangleData1620.coefficient134_291, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots04.root134,
    Inext := OriginalRow227TriangleData1613.coefficient133_293, Icur := OriginalRow227TriangleData1613.coefficient133_292,
    output := OriginalRow227TriangleData1620.coefficient134_292, hC := OriginalRow227TriangleRoots04.root134_pos, hAC := OriginalRow227TriangleRoots04.product134_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1604

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1604.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

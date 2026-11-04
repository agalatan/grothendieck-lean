import Grothe.UpperChaos.OriginalRow227TriangleData1689
import Grothe.UpperChaos.OriginalRow227TriangleData1690
import Grothe.UpperChaos.OriginalRow227TriangleData1696
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1680
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_272, Icur := OriginalRow227TriangleData1689.coefficient143_271,
    output := OriginalRow227TriangleData1696.coefficient144_271, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_273, Icur := OriginalRow227TriangleData1689.coefficient143_272,
    output := OriginalRow227TriangleData1696.coefficient144_272, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_274, Icur := OriginalRow227TriangleData1689.coefficient143_273,
    output := OriginalRow227TriangleData1696.coefficient144_273, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_275, Icur := OriginalRow227TriangleData1689.coefficient143_274,
    output := OriginalRow227TriangleData1696.coefficient144_274, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_276, Icur := OriginalRow227TriangleData1689.coefficient143_275,
    output := OriginalRow227TriangleData1696.coefficient144_275, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_277, Icur := OriginalRow227TriangleData1689.coefficient143_276,
    output := OriginalRow227TriangleData1696.coefficient144_276, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_278, Icur := OriginalRow227TriangleData1689.coefficient143_277,
    output := OriginalRow227TriangleData1696.coefficient144_277, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_279, Icur := OriginalRow227TriangleData1689.coefficient143_278,
    output := OriginalRow227TriangleData1696.coefficient144_278, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_280, Icur := OriginalRow227TriangleData1689.coefficient143_279,
    output := OriginalRow227TriangleData1696.coefficient144_279, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_281, Icur := OriginalRow227TriangleData1689.coefficient143_280,
    output := OriginalRow227TriangleData1696.coefficient144_280, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_282, Icur := OriginalRow227TriangleData1689.coefficient143_281,
    output := OriginalRow227TriangleData1696.coefficient144_281, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_283, Icur := OriginalRow227TriangleData1689.coefficient143_282,
    output := OriginalRow227TriangleData1696.coefficient144_282, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_284, Icur := OriginalRow227TriangleData1689.coefficient143_283,
    output := OriginalRow227TriangleData1696.coefficient144_283, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_285, Icur := OriginalRow227TriangleData1689.coefficient143_284,
    output := OriginalRow227TriangleData1696.coefficient144_284, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_286, Icur := OriginalRow227TriangleData1689.coefficient143_285,
    output := OriginalRow227TriangleData1696.coefficient144_285, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_287, Icur := OriginalRow227TriangleData1689.coefficient143_286,
    output := OriginalRow227TriangleData1696.coefficient144_286, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_288, Icur := OriginalRow227TriangleData1689.coefficient143_287,
    output := OriginalRow227TriangleData1696.coefficient144_287, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_289, Icur := OriginalRow227TriangleData1689.coefficient143_288,
    output := OriginalRow227TriangleData1696.coefficient144_288, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_290, Icur := OriginalRow227TriangleData1689.coefficient143_289,
    output := OriginalRow227TriangleData1696.coefficient144_289, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_291, Icur := OriginalRow227TriangleData1689.coefficient143_290,
    output := OriginalRow227TriangleData1696.coefficient144_290, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_292, Icur := OriginalRow227TriangleData1689.coefficient143_291,
    output := OriginalRow227TriangleData1696.coefficient144_291, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_293, Icur := OriginalRow227TriangleData1689.coefficient143_292,
    output := OriginalRow227TriangleData1696.coefficient144_292, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_294, Icur := OriginalRow227TriangleData1689.coefficient143_293,
    output := OriginalRow227TriangleData1696.coefficient144_293, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_295, Icur := OriginalRow227TriangleData1689.coefficient143_294,
    output := OriginalRow227TriangleData1696.coefficient144_294, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_296, Icur := OriginalRow227TriangleData1689.coefficient143_295,
    output := OriginalRow227TriangleData1696.coefficient144_295, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_297, Icur := OriginalRow227TriangleData1689.coefficient143_296,
    output := OriginalRow227TriangleData1696.coefficient144_296, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_298, Icur := OriginalRow227TriangleData1689.coefficient143_297,
    output := OriginalRow227TriangleData1696.coefficient144_297, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_299, Icur := OriginalRow227TriangleData1689.coefficient143_298,
    output := OriginalRow227TriangleData1696.coefficient144_298, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_300, Icur := OriginalRow227TriangleData1689.coefficient143_299,
    output := OriginalRow227TriangleData1696.coefficient144_299, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1689.coefficient143_301, Icur := OriginalRow227TriangleData1689.coefficient143_300,
    output := OriginalRow227TriangleData1696.coefficient144_300, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1690.coefficient143_302, Icur := OriginalRow227TriangleData1689.coefficient143_301,
    output := OriginalRow227TriangleData1696.coefficient144_301, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots04.root144,
    Inext := OriginalRow227TriangleData1690.coefficient143_303, Icur := OriginalRow227TriangleData1690.coefficient143_302,
    output := OriginalRow227TriangleData1696.coefficient144_302, hC := OriginalRow227TriangleRoots04.root144_pos, hAC := OriginalRow227TriangleRoots04.product144_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1680

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1680.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

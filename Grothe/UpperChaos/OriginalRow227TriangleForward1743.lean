import Grothe.UpperChaos.OriginalRow227TriangleData1752
import Grothe.UpperChaos.OriginalRow227TriangleData1753
import Grothe.UpperChaos.OriginalRow227TriangleData1759
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1743
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_281, Icur := OriginalRow227TriangleData1752.coefficient152_280,
    output := OriginalRow227TriangleData1759.coefficient153_280, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_282, Icur := OriginalRow227TriangleData1752.coefficient152_281,
    output := OriginalRow227TriangleData1759.coefficient153_281, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_283, Icur := OriginalRow227TriangleData1752.coefficient152_282,
    output := OriginalRow227TriangleData1759.coefficient153_282, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_284, Icur := OriginalRow227TriangleData1752.coefficient152_283,
    output := OriginalRow227TriangleData1759.coefficient153_283, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_285, Icur := OriginalRow227TriangleData1752.coefficient152_284,
    output := OriginalRow227TriangleData1759.coefficient153_284, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_286, Icur := OriginalRow227TriangleData1752.coefficient152_285,
    output := OriginalRow227TriangleData1759.coefficient153_285, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_287, Icur := OriginalRow227TriangleData1752.coefficient152_286,
    output := OriginalRow227TriangleData1759.coefficient153_286, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_288, Icur := OriginalRow227TriangleData1752.coefficient152_287,
    output := OriginalRow227TriangleData1759.coefficient153_287, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_289, Icur := OriginalRow227TriangleData1752.coefficient152_288,
    output := OriginalRow227TriangleData1759.coefficient153_288, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_290, Icur := OriginalRow227TriangleData1752.coefficient152_289,
    output := OriginalRow227TriangleData1759.coefficient153_289, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_291, Icur := OriginalRow227TriangleData1752.coefficient152_290,
    output := OriginalRow227TriangleData1759.coefficient153_290, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_292, Icur := OriginalRow227TriangleData1752.coefficient152_291,
    output := OriginalRow227TriangleData1759.coefficient153_291, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_293, Icur := OriginalRow227TriangleData1752.coefficient152_292,
    output := OriginalRow227TriangleData1759.coefficient153_292, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_294, Icur := OriginalRow227TriangleData1752.coefficient152_293,
    output := OriginalRow227TriangleData1759.coefficient153_293, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_295, Icur := OriginalRow227TriangleData1752.coefficient152_294,
    output := OriginalRow227TriangleData1759.coefficient153_294, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_296, Icur := OriginalRow227TriangleData1752.coefficient152_295,
    output := OriginalRow227TriangleData1759.coefficient153_295, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_297, Icur := OriginalRow227TriangleData1752.coefficient152_296,
    output := OriginalRow227TriangleData1759.coefficient153_296, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_298, Icur := OriginalRow227TriangleData1752.coefficient152_297,
    output := OriginalRow227TriangleData1759.coefficient153_297, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_299, Icur := OriginalRow227TriangleData1752.coefficient152_298,
    output := OriginalRow227TriangleData1759.coefficient153_298, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_300, Icur := OriginalRow227TriangleData1752.coefficient152_299,
    output := OriginalRow227TriangleData1759.coefficient153_299, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_301, Icur := OriginalRow227TriangleData1752.coefficient152_300,
    output := OriginalRow227TriangleData1759.coefficient153_300, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_302, Icur := OriginalRow227TriangleData1752.coefficient152_301,
    output := OriginalRow227TriangleData1759.coefficient153_301, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_303, Icur := OriginalRow227TriangleData1752.coefficient152_302,
    output := OriginalRow227TriangleData1759.coefficient153_302, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_304, Icur := OriginalRow227TriangleData1752.coefficient152_303,
    output := OriginalRow227TriangleData1759.coefficient153_303, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_305, Icur := OriginalRow227TriangleData1752.coefficient152_304,
    output := OriginalRow227TriangleData1759.coefficient153_304, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_306, Icur := OriginalRow227TriangleData1752.coefficient152_305,
    output := OriginalRow227TriangleData1759.coefficient153_305, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_307, Icur := OriginalRow227TriangleData1752.coefficient152_306,
    output := OriginalRow227TriangleData1759.coefficient153_306, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_308, Icur := OriginalRow227TriangleData1752.coefficient152_307,
    output := OriginalRow227TriangleData1759.coefficient153_307, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_309, Icur := OriginalRow227TriangleData1752.coefficient152_308,
    output := OriginalRow227TriangleData1759.coefficient153_308, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1752.coefficient152_310, Icur := OriginalRow227TriangleData1752.coefficient152_309,
    output := OriginalRow227TriangleData1759.coefficient153_309, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1753.coefficient152_311, Icur := OriginalRow227TriangleData1752.coefficient152_310,
    output := OriginalRow227TriangleData1759.coefficient153_310, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots04.root153,
    Inext := OriginalRow227TriangleData1753.coefficient152_312, Icur := OriginalRow227TriangleData1753.coefficient152_311,
    output := OriginalRow227TriangleData1759.coefficient153_311, hC := OriginalRow227TriangleRoots04.root153_pos, hAC := OriginalRow227TriangleRoots04.product153_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1743

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1743.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

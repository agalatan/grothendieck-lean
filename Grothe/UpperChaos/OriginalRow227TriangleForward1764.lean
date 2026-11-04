import Grothe.UpperChaos.OriginalRow227TriangleData1773
import Grothe.UpperChaos.OriginalRow227TriangleData1774
import Grothe.UpperChaos.OriginalRow227TriangleData1780
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1764
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_284, Icur := OriginalRow227TriangleData1773.coefficient155_283,
    output := OriginalRow227TriangleData1780.coefficient156_283, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_285, Icur := OriginalRow227TriangleData1773.coefficient155_284,
    output := OriginalRow227TriangleData1780.coefficient156_284, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_286, Icur := OriginalRow227TriangleData1773.coefficient155_285,
    output := OriginalRow227TriangleData1780.coefficient156_285, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_287, Icur := OriginalRow227TriangleData1773.coefficient155_286,
    output := OriginalRow227TriangleData1780.coefficient156_286, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_288, Icur := OriginalRow227TriangleData1773.coefficient155_287,
    output := OriginalRow227TriangleData1780.coefficient156_287, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_289, Icur := OriginalRow227TriangleData1773.coefficient155_288,
    output := OriginalRow227TriangleData1780.coefficient156_288, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_290, Icur := OriginalRow227TriangleData1773.coefficient155_289,
    output := OriginalRow227TriangleData1780.coefficient156_289, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_291, Icur := OriginalRow227TriangleData1773.coefficient155_290,
    output := OriginalRow227TriangleData1780.coefficient156_290, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_292, Icur := OriginalRow227TriangleData1773.coefficient155_291,
    output := OriginalRow227TriangleData1780.coefficient156_291, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_293, Icur := OriginalRow227TriangleData1773.coefficient155_292,
    output := OriginalRow227TriangleData1780.coefficient156_292, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_294, Icur := OriginalRow227TriangleData1773.coefficient155_293,
    output := OriginalRow227TriangleData1780.coefficient156_293, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_295, Icur := OriginalRow227TriangleData1773.coefficient155_294,
    output := OriginalRow227TriangleData1780.coefficient156_294, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_296, Icur := OriginalRow227TriangleData1773.coefficient155_295,
    output := OriginalRow227TriangleData1780.coefficient156_295, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_297, Icur := OriginalRow227TriangleData1773.coefficient155_296,
    output := OriginalRow227TriangleData1780.coefficient156_296, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_298, Icur := OriginalRow227TriangleData1773.coefficient155_297,
    output := OriginalRow227TriangleData1780.coefficient156_297, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_299, Icur := OriginalRow227TriangleData1773.coefficient155_298,
    output := OriginalRow227TriangleData1780.coefficient156_298, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_300, Icur := OriginalRow227TriangleData1773.coefficient155_299,
    output := OriginalRow227TriangleData1780.coefficient156_299, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_301, Icur := OriginalRow227TriangleData1773.coefficient155_300,
    output := OriginalRow227TriangleData1780.coefficient156_300, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_302, Icur := OriginalRow227TriangleData1773.coefficient155_301,
    output := OriginalRow227TriangleData1780.coefficient156_301, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_303, Icur := OriginalRow227TriangleData1773.coefficient155_302,
    output := OriginalRow227TriangleData1780.coefficient156_302, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_304, Icur := OriginalRow227TriangleData1773.coefficient155_303,
    output := OriginalRow227TriangleData1780.coefficient156_303, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_305, Icur := OriginalRow227TriangleData1773.coefficient155_304,
    output := OriginalRow227TriangleData1780.coefficient156_304, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_306, Icur := OriginalRow227TriangleData1773.coefficient155_305,
    output := OriginalRow227TriangleData1780.coefficient156_305, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_307, Icur := OriginalRow227TriangleData1773.coefficient155_306,
    output := OriginalRow227TriangleData1780.coefficient156_306, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_308, Icur := OriginalRow227TriangleData1773.coefficient155_307,
    output := OriginalRow227TriangleData1780.coefficient156_307, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_309, Icur := OriginalRow227TriangleData1773.coefficient155_308,
    output := OriginalRow227TriangleData1780.coefficient156_308, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_310, Icur := OriginalRow227TriangleData1773.coefficient155_309,
    output := OriginalRow227TriangleData1780.coefficient156_309, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_311, Icur := OriginalRow227TriangleData1773.coefficient155_310,
    output := OriginalRow227TriangleData1780.coefficient156_310, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_312, Icur := OriginalRow227TriangleData1773.coefficient155_311,
    output := OriginalRow227TriangleData1780.coefficient156_311, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1773.coefficient155_313, Icur := OriginalRow227TriangleData1773.coefficient155_312,
    output := OriginalRow227TriangleData1780.coefficient156_312, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1774.coefficient155_314, Icur := OriginalRow227TriangleData1773.coefficient155_313,
    output := OriginalRow227TriangleData1780.coefficient156_313, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1774.coefficient155_315, Icur := OriginalRow227TriangleData1774.coefficient155_314,
    output := OriginalRow227TriangleData1780.coefficient156_314, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1764

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1764.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

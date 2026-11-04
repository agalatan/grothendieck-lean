import Grothe.UpperChaos.OriginalRow227TriangleData1792
import Grothe.UpperChaos.OriginalRow227TriangleData1793
import Grothe.UpperChaos.OriginalRow227TriangleData1798
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1782
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_287, Icur := OriginalRow227TriangleData1792.coefficient158_286,
    output := OriginalRow227TriangleData1798.coefficient159_286, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_288, Icur := OriginalRow227TriangleData1792.coefficient158_287,
    output := OriginalRow227TriangleData1798.coefficient159_287, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_289, Icur := OriginalRow227TriangleData1792.coefficient158_288,
    output := OriginalRow227TriangleData1798.coefficient159_288, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_290, Icur := OriginalRow227TriangleData1792.coefficient158_289,
    output := OriginalRow227TriangleData1798.coefficient159_289, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_291, Icur := OriginalRow227TriangleData1792.coefficient158_290,
    output := OriginalRow227TriangleData1798.coefficient159_290, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_292, Icur := OriginalRow227TriangleData1792.coefficient158_291,
    output := OriginalRow227TriangleData1798.coefficient159_291, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_293, Icur := OriginalRow227TriangleData1792.coefficient158_292,
    output := OriginalRow227TriangleData1798.coefficient159_292, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_294, Icur := OriginalRow227TriangleData1792.coefficient158_293,
    output := OriginalRow227TriangleData1798.coefficient159_293, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_295, Icur := OriginalRow227TriangleData1792.coefficient158_294,
    output := OriginalRow227TriangleData1798.coefficient159_294, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_296, Icur := OriginalRow227TriangleData1792.coefficient158_295,
    output := OriginalRow227TriangleData1798.coefficient159_295, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_297, Icur := OriginalRow227TriangleData1792.coefficient158_296,
    output := OriginalRow227TriangleData1798.coefficient159_296, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_298, Icur := OriginalRow227TriangleData1792.coefficient158_297,
    output := OriginalRow227TriangleData1798.coefficient159_297, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_299, Icur := OriginalRow227TriangleData1792.coefficient158_298,
    output := OriginalRow227TriangleData1798.coefficient159_298, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_300, Icur := OriginalRow227TriangleData1792.coefficient158_299,
    output := OriginalRow227TriangleData1798.coefficient159_299, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_301, Icur := OriginalRow227TriangleData1792.coefficient158_300,
    output := OriginalRow227TriangleData1798.coefficient159_300, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_302, Icur := OriginalRow227TriangleData1792.coefficient158_301,
    output := OriginalRow227TriangleData1798.coefficient159_301, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_303, Icur := OriginalRow227TriangleData1792.coefficient158_302,
    output := OriginalRow227TriangleData1798.coefficient159_302, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_304, Icur := OriginalRow227TriangleData1792.coefficient158_303,
    output := OriginalRow227TriangleData1798.coefficient159_303, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_305, Icur := OriginalRow227TriangleData1792.coefficient158_304,
    output := OriginalRow227TriangleData1798.coefficient159_304, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_306, Icur := OriginalRow227TriangleData1792.coefficient158_305,
    output := OriginalRow227TriangleData1798.coefficient159_305, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_307, Icur := OriginalRow227TriangleData1792.coefficient158_306,
    output := OriginalRow227TriangleData1798.coefficient159_306, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_308, Icur := OriginalRow227TriangleData1792.coefficient158_307,
    output := OriginalRow227TriangleData1798.coefficient159_307, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_309, Icur := OriginalRow227TriangleData1792.coefficient158_308,
    output := OriginalRow227TriangleData1798.coefficient159_308, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_310, Icur := OriginalRow227TriangleData1792.coefficient158_309,
    output := OriginalRow227TriangleData1798.coefficient159_309, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_311, Icur := OriginalRow227TriangleData1792.coefficient158_310,
    output := OriginalRow227TriangleData1798.coefficient159_310, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_312, Icur := OriginalRow227TriangleData1792.coefficient158_311,
    output := OriginalRow227TriangleData1798.coefficient159_311, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_313, Icur := OriginalRow227TriangleData1792.coefficient158_312,
    output := OriginalRow227TriangleData1798.coefficient159_312, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_314, Icur := OriginalRow227TriangleData1792.coefficient158_313,
    output := OriginalRow227TriangleData1798.coefficient159_313, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_315, Icur := OriginalRow227TriangleData1792.coefficient158_314,
    output := OriginalRow227TriangleData1798.coefficient159_314, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1792.coefficient158_316, Icur := OriginalRow227TriangleData1792.coefficient158_315,
    output := OriginalRow227TriangleData1798.coefficient159_315, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1793.coefficient158_317, Icur := OriginalRow227TriangleData1792.coefficient158_316,
    output := OriginalRow227TriangleData1798.coefficient159_316, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1793.coefficient158_318, Icur := OriginalRow227TriangleData1793.coefficient158_317,
    output := OriginalRow227TriangleData1798.coefficient159_317, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1782

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1782.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData1557
import Grothe.UpperChaos.OriginalRow227TriangleData1558
import Grothe.UpperChaos.OriginalRow227TriangleData1565
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1549
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_287, Icur := OriginalRow227TriangleData1557.coefficient126_286,
    output := OriginalRow227TriangleData1565.coefficient127_286, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_288, Icur := OriginalRow227TriangleData1557.coefficient126_287,
    output := OriginalRow227TriangleData1565.coefficient127_287, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_289, Icur := OriginalRow227TriangleData1557.coefficient126_288,
    output := OriginalRow227TriangleData1565.coefficient127_288, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_290, Icur := OriginalRow227TriangleData1557.coefficient126_289,
    output := OriginalRow227TriangleData1565.coefficient127_289, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_291, Icur := OriginalRow227TriangleData1557.coefficient126_290,
    output := OriginalRow227TriangleData1565.coefficient127_290, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_292, Icur := OriginalRow227TriangleData1557.coefficient126_291,
    output := OriginalRow227TriangleData1565.coefficient127_291, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_293, Icur := OriginalRow227TriangleData1557.coefficient126_292,
    output := OriginalRow227TriangleData1565.coefficient127_292, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_294, Icur := OriginalRow227TriangleData1557.coefficient126_293,
    output := OriginalRow227TriangleData1565.coefficient127_293, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_295, Icur := OriginalRow227TriangleData1557.coefficient126_294,
    output := OriginalRow227TriangleData1565.coefficient127_294, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_296, Icur := OriginalRow227TriangleData1557.coefficient126_295,
    output := OriginalRow227TriangleData1565.coefficient127_295, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_297, Icur := OriginalRow227TriangleData1557.coefficient126_296,
    output := OriginalRow227TriangleData1565.coefficient127_296, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_298, Icur := OriginalRow227TriangleData1557.coefficient126_297,
    output := OriginalRow227TriangleData1565.coefficient127_297, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_299, Icur := OriginalRow227TriangleData1557.coefficient126_298,
    output := OriginalRow227TriangleData1565.coefficient127_298, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_300, Icur := OriginalRow227TriangleData1557.coefficient126_299,
    output := OriginalRow227TriangleData1565.coefficient127_299, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_301, Icur := OriginalRow227TriangleData1557.coefficient126_300,
    output := OriginalRow227TriangleData1565.coefficient127_300, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_302, Icur := OriginalRow227TriangleData1557.coefficient126_301,
    output := OriginalRow227TriangleData1565.coefficient127_301, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_303, Icur := OriginalRow227TriangleData1557.coefficient126_302,
    output := OriginalRow227TriangleData1565.coefficient127_302, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_304, Icur := OriginalRow227TriangleData1557.coefficient126_303,
    output := OriginalRow227TriangleData1565.coefficient127_303, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_305, Icur := OriginalRow227TriangleData1557.coefficient126_304,
    output := OriginalRow227TriangleData1565.coefficient127_304, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_306, Icur := OriginalRow227TriangleData1557.coefficient126_305,
    output := OriginalRow227TriangleData1565.coefficient127_305, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_307, Icur := OriginalRow227TriangleData1557.coefficient126_306,
    output := OriginalRow227TriangleData1565.coefficient127_306, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_308, Icur := OriginalRow227TriangleData1557.coefficient126_307,
    output := OriginalRow227TriangleData1565.coefficient127_307, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_309, Icur := OriginalRow227TriangleData1557.coefficient126_308,
    output := OriginalRow227TriangleData1565.coefficient127_308, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_310, Icur := OriginalRow227TriangleData1557.coefficient126_309,
    output := OriginalRow227TriangleData1565.coefficient127_309, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_311, Icur := OriginalRow227TriangleData1557.coefficient126_310,
    output := OriginalRow227TriangleData1565.coefficient127_310, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_312, Icur := OriginalRow227TriangleData1557.coefficient126_311,
    output := OriginalRow227TriangleData1565.coefficient127_311, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_313, Icur := OriginalRow227TriangleData1557.coefficient126_312,
    output := OriginalRow227TriangleData1565.coefficient127_312, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_314, Icur := OriginalRow227TriangleData1557.coefficient126_313,
    output := OriginalRow227TriangleData1565.coefficient127_313, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_315, Icur := OriginalRow227TriangleData1557.coefficient126_314,
    output := OriginalRow227TriangleData1565.coefficient127_314, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1557.coefficient126_316, Icur := OriginalRow227TriangleData1557.coefficient126_315,
    output := OriginalRow227TriangleData1565.coefficient127_315, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_317, Icur := OriginalRow227TriangleData1557.coefficient126_316,
    output := OriginalRow227TriangleData1565.coefficient127_316, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots03.root127,
    Inext := OriginalRow227TriangleData1558.coefficient126_318, Icur := OriginalRow227TriangleData1558.coefficient126_317,
    output := OriginalRow227TriangleData1565.coefficient127_317, hC := OriginalRow227TriangleRoots03.root127_pos, hAC := OriginalRow227TriangleRoots03.product127_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1549

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1549.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

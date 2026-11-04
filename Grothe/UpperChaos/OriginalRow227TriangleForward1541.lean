import Grothe.UpperChaos.OriginalRow227TriangleData1549
import Grothe.UpperChaos.OriginalRow227TriangleData1550
import Grothe.UpperChaos.OriginalRow227TriangleData1557
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1541
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_286, Icur := OriginalRow227TriangleData1549.coefficient125_285,
    output := OriginalRow227TriangleData1557.coefficient126_285, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_287, Icur := OriginalRow227TriangleData1549.coefficient125_286,
    output := OriginalRow227TriangleData1557.coefficient126_286, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_288, Icur := OriginalRow227TriangleData1549.coefficient125_287,
    output := OriginalRow227TriangleData1557.coefficient126_287, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_289, Icur := OriginalRow227TriangleData1549.coefficient125_288,
    output := OriginalRow227TriangleData1557.coefficient126_288, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_290, Icur := OriginalRow227TriangleData1549.coefficient125_289,
    output := OriginalRow227TriangleData1557.coefficient126_289, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_291, Icur := OriginalRow227TriangleData1549.coefficient125_290,
    output := OriginalRow227TriangleData1557.coefficient126_290, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_292, Icur := OriginalRow227TriangleData1549.coefficient125_291,
    output := OriginalRow227TriangleData1557.coefficient126_291, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_293, Icur := OriginalRow227TriangleData1549.coefficient125_292,
    output := OriginalRow227TriangleData1557.coefficient126_292, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_294, Icur := OriginalRow227TriangleData1549.coefficient125_293,
    output := OriginalRow227TriangleData1557.coefficient126_293, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_295, Icur := OriginalRow227TriangleData1549.coefficient125_294,
    output := OriginalRow227TriangleData1557.coefficient126_294, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_296, Icur := OriginalRow227TriangleData1549.coefficient125_295,
    output := OriginalRow227TriangleData1557.coefficient126_295, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_297, Icur := OriginalRow227TriangleData1549.coefficient125_296,
    output := OriginalRow227TriangleData1557.coefficient126_296, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_298, Icur := OriginalRow227TriangleData1549.coefficient125_297,
    output := OriginalRow227TriangleData1557.coefficient126_297, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_299, Icur := OriginalRow227TriangleData1549.coefficient125_298,
    output := OriginalRow227TriangleData1557.coefficient126_298, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_300, Icur := OriginalRow227TriangleData1549.coefficient125_299,
    output := OriginalRow227TriangleData1557.coefficient126_299, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_301, Icur := OriginalRow227TriangleData1549.coefficient125_300,
    output := OriginalRow227TriangleData1557.coefficient126_300, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_302, Icur := OriginalRow227TriangleData1549.coefficient125_301,
    output := OriginalRow227TriangleData1557.coefficient126_301, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_303, Icur := OriginalRow227TriangleData1549.coefficient125_302,
    output := OriginalRow227TriangleData1557.coefficient126_302, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_304, Icur := OriginalRow227TriangleData1549.coefficient125_303,
    output := OriginalRow227TriangleData1557.coefficient126_303, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_305, Icur := OriginalRow227TriangleData1549.coefficient125_304,
    output := OriginalRow227TriangleData1557.coefficient126_304, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_306, Icur := OriginalRow227TriangleData1549.coefficient125_305,
    output := OriginalRow227TriangleData1557.coefficient126_305, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_307, Icur := OriginalRow227TriangleData1549.coefficient125_306,
    output := OriginalRow227TriangleData1557.coefficient126_306, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_308, Icur := OriginalRow227TriangleData1549.coefficient125_307,
    output := OriginalRow227TriangleData1557.coefficient126_307, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_309, Icur := OriginalRow227TriangleData1549.coefficient125_308,
    output := OriginalRow227TriangleData1557.coefficient126_308, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_310, Icur := OriginalRow227TriangleData1549.coefficient125_309,
    output := OriginalRow227TriangleData1557.coefficient126_309, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_311, Icur := OriginalRow227TriangleData1549.coefficient125_310,
    output := OriginalRow227TriangleData1557.coefficient126_310, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_312, Icur := OriginalRow227TriangleData1549.coefficient125_311,
    output := OriginalRow227TriangleData1557.coefficient126_311, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_313, Icur := OriginalRow227TriangleData1549.coefficient125_312,
    output := OriginalRow227TriangleData1557.coefficient126_312, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_314, Icur := OriginalRow227TriangleData1549.coefficient125_313,
    output := OriginalRow227TriangleData1557.coefficient126_313, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1549.coefficient125_315, Icur := OriginalRow227TriangleData1549.coefficient125_314,
    output := OriginalRow227TriangleData1557.coefficient126_314, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1550.coefficient125_316, Icur := OriginalRow227TriangleData1549.coefficient125_315,
    output := OriginalRow227TriangleData1557.coefficient126_315, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots03.root126,
    Inext := OriginalRow227TriangleData1550.coefficient125_317, Icur := OriginalRow227TriangleData1550.coefficient125_316,
    output := OriginalRow227TriangleData1557.coefficient126_316, hC := OriginalRow227TriangleRoots03.root126_pos, hAC := OriginalRow227TriangleRoots03.product126_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1541

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1541.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

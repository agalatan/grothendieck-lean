import Grothe.UpperChaos.OriginalRow227TriangleData1573
import Grothe.UpperChaos.OriginalRow227TriangleData1574
import Grothe.UpperChaos.OriginalRow227TriangleData1581
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1565
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_289, Icur := OriginalRow227TriangleData1573.coefficient128_288,
    output := OriginalRow227TriangleData1581.coefficient129_288, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_290, Icur := OriginalRow227TriangleData1573.coefficient128_289,
    output := OriginalRow227TriangleData1581.coefficient129_289, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_291, Icur := OriginalRow227TriangleData1573.coefficient128_290,
    output := OriginalRow227TriangleData1581.coefficient129_290, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_292, Icur := OriginalRow227TriangleData1573.coefficient128_291,
    output := OriginalRow227TriangleData1581.coefficient129_291, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_293, Icur := OriginalRow227TriangleData1573.coefficient128_292,
    output := OriginalRow227TriangleData1581.coefficient129_292, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_294, Icur := OriginalRow227TriangleData1573.coefficient128_293,
    output := OriginalRow227TriangleData1581.coefficient129_293, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_295, Icur := OriginalRow227TriangleData1573.coefficient128_294,
    output := OriginalRow227TriangleData1581.coefficient129_294, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_296, Icur := OriginalRow227TriangleData1573.coefficient128_295,
    output := OriginalRow227TriangleData1581.coefficient129_295, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_297, Icur := OriginalRow227TriangleData1573.coefficient128_296,
    output := OriginalRow227TriangleData1581.coefficient129_296, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_298, Icur := OriginalRow227TriangleData1573.coefficient128_297,
    output := OriginalRow227TriangleData1581.coefficient129_297, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_299, Icur := OriginalRow227TriangleData1573.coefficient128_298,
    output := OriginalRow227TriangleData1581.coefficient129_298, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_300, Icur := OriginalRow227TriangleData1573.coefficient128_299,
    output := OriginalRow227TriangleData1581.coefficient129_299, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_301, Icur := OriginalRow227TriangleData1573.coefficient128_300,
    output := OriginalRow227TriangleData1581.coefficient129_300, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_302, Icur := OriginalRow227TriangleData1573.coefficient128_301,
    output := OriginalRow227TriangleData1581.coefficient129_301, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_303, Icur := OriginalRow227TriangleData1573.coefficient128_302,
    output := OriginalRow227TriangleData1581.coefficient129_302, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_304, Icur := OriginalRow227TriangleData1573.coefficient128_303,
    output := OriginalRow227TriangleData1581.coefficient129_303, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_305, Icur := OriginalRow227TriangleData1573.coefficient128_304,
    output := OriginalRow227TriangleData1581.coefficient129_304, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_306, Icur := OriginalRow227TriangleData1573.coefficient128_305,
    output := OriginalRow227TriangleData1581.coefficient129_305, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_307, Icur := OriginalRow227TriangleData1573.coefficient128_306,
    output := OriginalRow227TriangleData1581.coefficient129_306, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_308, Icur := OriginalRow227TriangleData1573.coefficient128_307,
    output := OriginalRow227TriangleData1581.coefficient129_307, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_309, Icur := OriginalRow227TriangleData1573.coefficient128_308,
    output := OriginalRow227TriangleData1581.coefficient129_308, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_310, Icur := OriginalRow227TriangleData1573.coefficient128_309,
    output := OriginalRow227TriangleData1581.coefficient129_309, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_311, Icur := OriginalRow227TriangleData1573.coefficient128_310,
    output := OriginalRow227TriangleData1581.coefficient129_310, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_312, Icur := OriginalRow227TriangleData1573.coefficient128_311,
    output := OriginalRow227TriangleData1581.coefficient129_311, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_313, Icur := OriginalRow227TriangleData1573.coefficient128_312,
    output := OriginalRow227TriangleData1581.coefficient129_312, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_314, Icur := OriginalRow227TriangleData1573.coefficient128_313,
    output := OriginalRow227TriangleData1581.coefficient129_313, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_315, Icur := OriginalRow227TriangleData1573.coefficient128_314,
    output := OriginalRow227TriangleData1581.coefficient129_314, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_316, Icur := OriginalRow227TriangleData1573.coefficient128_315,
    output := OriginalRow227TriangleData1581.coefficient129_315, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_317, Icur := OriginalRow227TriangleData1573.coefficient128_316,
    output := OriginalRow227TriangleData1581.coefficient129_316, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1573.coefficient128_318, Icur := OriginalRow227TriangleData1573.coefficient128_317,
    output := OriginalRow227TriangleData1581.coefficient129_317, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_319, Icur := OriginalRow227TriangleData1573.coefficient128_318,
    output := OriginalRow227TriangleData1581.coefficient129_318, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots04.root129,
    Inext := OriginalRow227TriangleData1574.coefficient128_320, Icur := OriginalRow227TriangleData1574.coefficient128_319,
    output := OriginalRow227TriangleData1581.coefficient129_319, hC := OriginalRow227TriangleRoots04.root129_pos, hAC := OriginalRow227TriangleRoots04.product129_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1565

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1565.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData1407
import Grothe.UpperChaos.OriginalRow227TriangleData1408
import Grothe.UpperChaos.OriginalRow227TriangleData1416
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1400
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_302, Icur := OriginalRow227TriangleData1407.coefficient109_301,
    output := OriginalRow227TriangleData1416.coefficient110_301, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_303, Icur := OriginalRow227TriangleData1407.coefficient109_302,
    output := OriginalRow227TriangleData1416.coefficient110_302, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_304, Icur := OriginalRow227TriangleData1407.coefficient109_303,
    output := OriginalRow227TriangleData1416.coefficient110_303, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_305, Icur := OriginalRow227TriangleData1407.coefficient109_304,
    output := OriginalRow227TriangleData1416.coefficient110_304, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_306, Icur := OriginalRow227TriangleData1407.coefficient109_305,
    output := OriginalRow227TriangleData1416.coefficient110_305, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_307, Icur := OriginalRow227TriangleData1407.coefficient109_306,
    output := OriginalRow227TriangleData1416.coefficient110_306, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_308, Icur := OriginalRow227TriangleData1407.coefficient109_307,
    output := OriginalRow227TriangleData1416.coefficient110_307, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_309, Icur := OriginalRow227TriangleData1407.coefficient109_308,
    output := OriginalRow227TriangleData1416.coefficient110_308, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_310, Icur := OriginalRow227TriangleData1407.coefficient109_309,
    output := OriginalRow227TriangleData1416.coefficient110_309, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_311, Icur := OriginalRow227TriangleData1407.coefficient109_310,
    output := OriginalRow227TriangleData1416.coefficient110_310, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_312, Icur := OriginalRow227TriangleData1407.coefficient109_311,
    output := OriginalRow227TriangleData1416.coefficient110_311, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_313, Icur := OriginalRow227TriangleData1407.coefficient109_312,
    output := OriginalRow227TriangleData1416.coefficient110_312, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_314, Icur := OriginalRow227TriangleData1407.coefficient109_313,
    output := OriginalRow227TriangleData1416.coefficient110_313, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_315, Icur := OriginalRow227TriangleData1407.coefficient109_314,
    output := OriginalRow227TriangleData1416.coefficient110_314, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_316, Icur := OriginalRow227TriangleData1407.coefficient109_315,
    output := OriginalRow227TriangleData1416.coefficient110_315, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_317, Icur := OriginalRow227TriangleData1407.coefficient109_316,
    output := OriginalRow227TriangleData1416.coefficient110_316, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_318, Icur := OriginalRow227TriangleData1407.coefficient109_317,
    output := OriginalRow227TriangleData1416.coefficient110_317, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_319, Icur := OriginalRow227TriangleData1407.coefficient109_318,
    output := OriginalRow227TriangleData1416.coefficient110_318, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_320, Icur := OriginalRow227TriangleData1407.coefficient109_319,
    output := OriginalRow227TriangleData1416.coefficient110_319, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_321, Icur := OriginalRow227TriangleData1407.coefficient109_320,
    output := OriginalRow227TriangleData1416.coefficient110_320, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_322, Icur := OriginalRow227TriangleData1407.coefficient109_321,
    output := OriginalRow227TriangleData1416.coefficient110_321, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_323, Icur := OriginalRow227TriangleData1407.coefficient109_322,
    output := OriginalRow227TriangleData1416.coefficient110_322, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_324, Icur := OriginalRow227TriangleData1407.coefficient109_323,
    output := OriginalRow227TriangleData1416.coefficient110_323, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_325, Icur := OriginalRow227TriangleData1407.coefficient109_324,
    output := OriginalRow227TriangleData1416.coefficient110_324, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_326, Icur := OriginalRow227TriangleData1407.coefficient109_325,
    output := OriginalRow227TriangleData1416.coefficient110_325, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_327, Icur := OriginalRow227TriangleData1407.coefficient109_326,
    output := OriginalRow227TriangleData1416.coefficient110_326, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_328, Icur := OriginalRow227TriangleData1407.coefficient109_327,
    output := OriginalRow227TriangleData1416.coefficient110_327, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_329, Icur := OriginalRow227TriangleData1407.coefficient109_328,
    output := OriginalRow227TriangleData1416.coefficient110_328, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_330, Icur := OriginalRow227TriangleData1407.coefficient109_329,
    output := OriginalRow227TriangleData1416.coefficient110_329, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1407.coefficient109_331, Icur := OriginalRow227TriangleData1407.coefficient109_330,
    output := OriginalRow227TriangleData1416.coefficient110_330, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1408.coefficient109_332, Icur := OriginalRow227TriangleData1407.coefficient109_331,
    output := OriginalRow227TriangleData1416.coefficient110_331, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1408.coefficient109_333, Icur := OriginalRow227TriangleData1408.coefficient109_332,
    output := OriginalRow227TriangleData1416.coefficient110_332, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1400

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1400.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

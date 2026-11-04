import Grothe.UpperChaos.OriginalRow227TriangleData1378
import Grothe.UpperChaos.OriginalRow227TriangleData1379
import Grothe.UpperChaos.OriginalRow227TriangleData1388
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1372
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_299, Icur := OriginalRow227TriangleData1378.coefficient106_298,
    output := OriginalRow227TriangleData1388.coefficient107_298, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_300, Icur := OriginalRow227TriangleData1378.coefficient106_299,
    output := OriginalRow227TriangleData1388.coefficient107_299, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_301, Icur := OriginalRow227TriangleData1378.coefficient106_300,
    output := OriginalRow227TriangleData1388.coefficient107_300, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_302, Icur := OriginalRow227TriangleData1378.coefficient106_301,
    output := OriginalRow227TriangleData1388.coefficient107_301, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_303, Icur := OriginalRow227TriangleData1378.coefficient106_302,
    output := OriginalRow227TriangleData1388.coefficient107_302, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_304, Icur := OriginalRow227TriangleData1378.coefficient106_303,
    output := OriginalRow227TriangleData1388.coefficient107_303, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_305, Icur := OriginalRow227TriangleData1378.coefficient106_304,
    output := OriginalRow227TriangleData1388.coefficient107_304, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_306, Icur := OriginalRow227TriangleData1378.coefficient106_305,
    output := OriginalRow227TriangleData1388.coefficient107_305, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_307, Icur := OriginalRow227TriangleData1378.coefficient106_306,
    output := OriginalRow227TriangleData1388.coefficient107_306, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_308, Icur := OriginalRow227TriangleData1378.coefficient106_307,
    output := OriginalRow227TriangleData1388.coefficient107_307, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_309, Icur := OriginalRow227TriangleData1378.coefficient106_308,
    output := OriginalRow227TriangleData1388.coefficient107_308, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_310, Icur := OriginalRow227TriangleData1378.coefficient106_309,
    output := OriginalRow227TriangleData1388.coefficient107_309, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_311, Icur := OriginalRow227TriangleData1378.coefficient106_310,
    output := OriginalRow227TriangleData1388.coefficient107_310, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_312, Icur := OriginalRow227TriangleData1378.coefficient106_311,
    output := OriginalRow227TriangleData1388.coefficient107_311, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_313, Icur := OriginalRow227TriangleData1378.coefficient106_312,
    output := OriginalRow227TriangleData1388.coefficient107_312, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_314, Icur := OriginalRow227TriangleData1378.coefficient106_313,
    output := OriginalRow227TriangleData1388.coefficient107_313, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_315, Icur := OriginalRow227TriangleData1378.coefficient106_314,
    output := OriginalRow227TriangleData1388.coefficient107_314, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_316, Icur := OriginalRow227TriangleData1378.coefficient106_315,
    output := OriginalRow227TriangleData1388.coefficient107_315, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_317, Icur := OriginalRow227TriangleData1378.coefficient106_316,
    output := OriginalRow227TriangleData1388.coefficient107_316, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_318, Icur := OriginalRow227TriangleData1378.coefficient106_317,
    output := OriginalRow227TriangleData1388.coefficient107_317, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_319, Icur := OriginalRow227TriangleData1378.coefficient106_318,
    output := OriginalRow227TriangleData1388.coefficient107_318, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_320, Icur := OriginalRow227TriangleData1378.coefficient106_319,
    output := OriginalRow227TriangleData1388.coefficient107_319, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_321, Icur := OriginalRow227TriangleData1378.coefficient106_320,
    output := OriginalRow227TriangleData1388.coefficient107_320, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_322, Icur := OriginalRow227TriangleData1378.coefficient106_321,
    output := OriginalRow227TriangleData1388.coefficient107_321, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_323, Icur := OriginalRow227TriangleData1378.coefficient106_322,
    output := OriginalRow227TriangleData1388.coefficient107_322, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_324, Icur := OriginalRow227TriangleData1378.coefficient106_323,
    output := OriginalRow227TriangleData1388.coefficient107_323, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_325, Icur := OriginalRow227TriangleData1378.coefficient106_324,
    output := OriginalRow227TriangleData1388.coefficient107_324, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_326, Icur := OriginalRow227TriangleData1378.coefficient106_325,
    output := OriginalRow227TriangleData1388.coefficient107_325, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_327, Icur := OriginalRow227TriangleData1378.coefficient106_326,
    output := OriginalRow227TriangleData1388.coefficient107_326, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1378.coefficient106_328, Icur := OriginalRow227TriangleData1378.coefficient106_327,
    output := OriginalRow227TriangleData1388.coefficient107_327, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1379.coefficient106_329, Icur := OriginalRow227TriangleData1378.coefficient106_328,
    output := OriginalRow227TriangleData1388.coefficient107_328, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1379.coefficient106_330, Icur := OriginalRow227TriangleData1379.coefficient106_329,
    output := OriginalRow227TriangleData1388.coefficient107_329, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1372

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1372.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

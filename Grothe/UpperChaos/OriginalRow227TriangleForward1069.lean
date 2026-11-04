import Grothe.UpperChaos.OriginalRow227TriangleData1074
import Grothe.UpperChaos.OriginalRow227TriangleData1075
import Grothe.UpperChaos.OriginalRow227TriangleData1085
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1069
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_302, Icur := OriginalRow227TriangleData1074.coefficient77_301,
    output := OriginalRow227TriangleData1085.coefficient78_301, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_303, Icur := OriginalRow227TriangleData1074.coefficient77_302,
    output := OriginalRow227TriangleData1085.coefficient78_302, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_304, Icur := OriginalRow227TriangleData1074.coefficient77_303,
    output := OriginalRow227TriangleData1085.coefficient78_303, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_305, Icur := OriginalRow227TriangleData1074.coefficient77_304,
    output := OriginalRow227TriangleData1085.coefficient78_304, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_306, Icur := OriginalRow227TriangleData1074.coefficient77_305,
    output := OriginalRow227TriangleData1085.coefficient78_305, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_307, Icur := OriginalRow227TriangleData1074.coefficient77_306,
    output := OriginalRow227TriangleData1085.coefficient78_306, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_308, Icur := OriginalRow227TriangleData1074.coefficient77_307,
    output := OriginalRow227TriangleData1085.coefficient78_307, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_309, Icur := OriginalRow227TriangleData1074.coefficient77_308,
    output := OriginalRow227TriangleData1085.coefficient78_308, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_310, Icur := OriginalRow227TriangleData1074.coefficient77_309,
    output := OriginalRow227TriangleData1085.coefficient78_309, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_311, Icur := OriginalRow227TriangleData1074.coefficient77_310,
    output := OriginalRow227TriangleData1085.coefficient78_310, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_312, Icur := OriginalRow227TriangleData1074.coefficient77_311,
    output := OriginalRow227TriangleData1085.coefficient78_311, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_313, Icur := OriginalRow227TriangleData1074.coefficient77_312,
    output := OriginalRow227TriangleData1085.coefficient78_312, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_314, Icur := OriginalRow227TriangleData1074.coefficient77_313,
    output := OriginalRow227TriangleData1085.coefficient78_313, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_315, Icur := OriginalRow227TriangleData1074.coefficient77_314,
    output := OriginalRow227TriangleData1085.coefficient78_314, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_316, Icur := OriginalRow227TriangleData1074.coefficient77_315,
    output := OriginalRow227TriangleData1085.coefficient78_315, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_317, Icur := OriginalRow227TriangleData1074.coefficient77_316,
    output := OriginalRow227TriangleData1085.coefficient78_316, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_318, Icur := OriginalRow227TriangleData1074.coefficient77_317,
    output := OriginalRow227TriangleData1085.coefficient78_317, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_319, Icur := OriginalRow227TriangleData1074.coefficient77_318,
    output := OriginalRow227TriangleData1085.coefficient78_318, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_320, Icur := OriginalRow227TriangleData1074.coefficient77_319,
    output := OriginalRow227TriangleData1085.coefficient78_319, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_321, Icur := OriginalRow227TriangleData1074.coefficient77_320,
    output := OriginalRow227TriangleData1085.coefficient78_320, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_322, Icur := OriginalRow227TriangleData1074.coefficient77_321,
    output := OriginalRow227TriangleData1085.coefficient78_321, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_323, Icur := OriginalRow227TriangleData1074.coefficient77_322,
    output := OriginalRow227TriangleData1085.coefficient78_322, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_324, Icur := OriginalRow227TriangleData1074.coefficient77_323,
    output := OriginalRow227TriangleData1085.coefficient78_323, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_325, Icur := OriginalRow227TriangleData1074.coefficient77_324,
    output := OriginalRow227TriangleData1085.coefficient78_324, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_326, Icur := OriginalRow227TriangleData1074.coefficient77_325,
    output := OriginalRow227TriangleData1085.coefficient78_325, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_327, Icur := OriginalRow227TriangleData1074.coefficient77_326,
    output := OriginalRow227TriangleData1085.coefficient78_326, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_328, Icur := OriginalRow227TriangleData1074.coefficient77_327,
    output := OriginalRow227TriangleData1085.coefficient78_327, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_329, Icur := OriginalRow227TriangleData1074.coefficient77_328,
    output := OriginalRow227TriangleData1085.coefficient78_328, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_330, Icur := OriginalRow227TriangleData1074.coefficient77_329,
    output := OriginalRow227TriangleData1085.coefficient78_329, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1074.coefficient77_331, Icur := OriginalRow227TriangleData1074.coefficient77_330,
    output := OriginalRow227TriangleData1085.coefficient78_330, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1075.coefficient77_332, Icur := OriginalRow227TriangleData1074.coefficient77_331,
    output := OriginalRow227TriangleData1085.coefficient78_331, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1075.coefficient77_333, Icur := OriginalRow227TriangleData1075.coefficient77_332,
    output := OriginalRow227TriangleData1085.coefficient78_332, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1069

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1069.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData1876
import Grothe.UpperChaos.OriginalRow227TriangleData1881
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1865
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_301, Icur := OriginalRow227TriangleData1876.coefficient172_300,
    output := OriginalRow227TriangleData1881.coefficient173_300, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_302, Icur := OriginalRow227TriangleData1876.coefficient172_301,
    output := OriginalRow227TriangleData1881.coefficient173_301, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_303, Icur := OriginalRow227TriangleData1876.coefficient172_302,
    output := OriginalRow227TriangleData1881.coefficient173_302, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_304, Icur := OriginalRow227TriangleData1876.coefficient172_303,
    output := OriginalRow227TriangleData1881.coefficient173_303, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_305, Icur := OriginalRow227TriangleData1876.coefficient172_304,
    output := OriginalRow227TriangleData1881.coefficient173_304, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_306, Icur := OriginalRow227TriangleData1876.coefficient172_305,
    output := OriginalRow227TriangleData1881.coefficient173_305, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_307, Icur := OriginalRow227TriangleData1876.coefficient172_306,
    output := OriginalRow227TriangleData1881.coefficient173_306, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_308, Icur := OriginalRow227TriangleData1876.coefficient172_307,
    output := OriginalRow227TriangleData1881.coefficient173_307, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_309, Icur := OriginalRow227TriangleData1876.coefficient172_308,
    output := OriginalRow227TriangleData1881.coefficient173_308, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_310, Icur := OriginalRow227TriangleData1876.coefficient172_309,
    output := OriginalRow227TriangleData1881.coefficient173_309, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_311, Icur := OriginalRow227TriangleData1876.coefficient172_310,
    output := OriginalRow227TriangleData1881.coefficient173_310, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_312, Icur := OriginalRow227TriangleData1876.coefficient172_311,
    output := OriginalRow227TriangleData1881.coefficient173_311, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_313, Icur := OriginalRow227TriangleData1876.coefficient172_312,
    output := OriginalRow227TriangleData1881.coefficient173_312, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_314, Icur := OriginalRow227TriangleData1876.coefficient172_313,
    output := OriginalRow227TriangleData1881.coefficient173_313, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_315, Icur := OriginalRow227TriangleData1876.coefficient172_314,
    output := OriginalRow227TriangleData1881.coefficient173_314, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_316, Icur := OriginalRow227TriangleData1876.coefficient172_315,
    output := OriginalRow227TriangleData1881.coefficient173_315, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_317, Icur := OriginalRow227TriangleData1876.coefficient172_316,
    output := OriginalRow227TriangleData1881.coefficient173_316, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_318, Icur := OriginalRow227TriangleData1876.coefficient172_317,
    output := OriginalRow227TriangleData1881.coefficient173_317, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_319, Icur := OriginalRow227TriangleData1876.coefficient172_318,
    output := OriginalRow227TriangleData1881.coefficient173_318, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_320, Icur := OriginalRow227TriangleData1876.coefficient172_319,
    output := OriginalRow227TriangleData1881.coefficient173_319, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_321, Icur := OriginalRow227TriangleData1876.coefficient172_320,
    output := OriginalRow227TriangleData1881.coefficient173_320, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_322, Icur := OriginalRow227TriangleData1876.coefficient172_321,
    output := OriginalRow227TriangleData1881.coefficient173_321, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_323, Icur := OriginalRow227TriangleData1876.coefficient172_322,
    output := OriginalRow227TriangleData1881.coefficient173_322, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_324, Icur := OriginalRow227TriangleData1876.coefficient172_323,
    output := OriginalRow227TriangleData1881.coefficient173_323, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_325, Icur := OriginalRow227TriangleData1876.coefficient172_324,
    output := OriginalRow227TriangleData1881.coefficient173_324, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_326, Icur := OriginalRow227TriangleData1876.coefficient172_325,
    output := OriginalRow227TriangleData1881.coefficient173_325, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_327, Icur := OriginalRow227TriangleData1876.coefficient172_326,
    output := OriginalRow227TriangleData1881.coefficient173_326, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_328, Icur := OriginalRow227TriangleData1876.coefficient172_327,
    output := OriginalRow227TriangleData1881.coefficient173_327, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots05.root173,
    Inext := OriginalRow227TriangleData1876.coefficient172_329, Icur := OriginalRow227TriangleData1876.coefficient172_328,
    output := OriginalRow227TriangleData1881.coefficient173_328, hC := OriginalRow227TriangleRoots05.root173_pos, hAC := OriginalRow227TriangleRoots05.product173_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1865

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1865.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

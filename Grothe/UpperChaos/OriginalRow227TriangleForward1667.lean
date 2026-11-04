import Grothe.UpperChaos.OriginalRow227TriangleData1676
import Grothe.UpperChaos.OriginalRow227TriangleData1677
import Grothe.UpperChaos.OriginalRow227TriangleData1683
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1667
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_302, Icur := OriginalRow227TriangleData1676.coefficient141_301,
    output := OriginalRow227TriangleData1683.coefficient142_301, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_303, Icur := OriginalRow227TriangleData1676.coefficient141_302,
    output := OriginalRow227TriangleData1683.coefficient142_302, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_304, Icur := OriginalRow227TriangleData1676.coefficient141_303,
    output := OriginalRow227TriangleData1683.coefficient142_303, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_305, Icur := OriginalRow227TriangleData1676.coefficient141_304,
    output := OriginalRow227TriangleData1683.coefficient142_304, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_306, Icur := OriginalRow227TriangleData1676.coefficient141_305,
    output := OriginalRow227TriangleData1683.coefficient142_305, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_307, Icur := OriginalRow227TriangleData1676.coefficient141_306,
    output := OriginalRow227TriangleData1683.coefficient142_306, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_308, Icur := OriginalRow227TriangleData1676.coefficient141_307,
    output := OriginalRow227TriangleData1683.coefficient142_307, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_309, Icur := OriginalRow227TriangleData1676.coefficient141_308,
    output := OriginalRow227TriangleData1683.coefficient142_308, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_310, Icur := OriginalRow227TriangleData1676.coefficient141_309,
    output := OriginalRow227TriangleData1683.coefficient142_309, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_311, Icur := OriginalRow227TriangleData1676.coefficient141_310,
    output := OriginalRow227TriangleData1683.coefficient142_310, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_312, Icur := OriginalRow227TriangleData1676.coefficient141_311,
    output := OriginalRow227TriangleData1683.coefficient142_311, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_313, Icur := OriginalRow227TriangleData1676.coefficient141_312,
    output := OriginalRow227TriangleData1683.coefficient142_312, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_314, Icur := OriginalRow227TriangleData1676.coefficient141_313,
    output := OriginalRow227TriangleData1683.coefficient142_313, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_315, Icur := OriginalRow227TriangleData1676.coefficient141_314,
    output := OriginalRow227TriangleData1683.coefficient142_314, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_316, Icur := OriginalRow227TriangleData1676.coefficient141_315,
    output := OriginalRow227TriangleData1683.coefficient142_315, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_317, Icur := OriginalRow227TriangleData1676.coefficient141_316,
    output := OriginalRow227TriangleData1683.coefficient142_316, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_318, Icur := OriginalRow227TriangleData1676.coefficient141_317,
    output := OriginalRow227TriangleData1683.coefficient142_317, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_319, Icur := OriginalRow227TriangleData1676.coefficient141_318,
    output := OriginalRow227TriangleData1683.coefficient142_318, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_320, Icur := OriginalRow227TriangleData1676.coefficient141_319,
    output := OriginalRow227TriangleData1683.coefficient142_319, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_321, Icur := OriginalRow227TriangleData1676.coefficient141_320,
    output := OriginalRow227TriangleData1683.coefficient142_320, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_322, Icur := OriginalRow227TriangleData1676.coefficient141_321,
    output := OriginalRow227TriangleData1683.coefficient142_321, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_323, Icur := OriginalRow227TriangleData1676.coefficient141_322,
    output := OriginalRow227TriangleData1683.coefficient142_322, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_324, Icur := OriginalRow227TriangleData1676.coefficient141_323,
    output := OriginalRow227TriangleData1683.coefficient142_323, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_325, Icur := OriginalRow227TriangleData1676.coefficient141_324,
    output := OriginalRow227TriangleData1683.coefficient142_324, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_326, Icur := OriginalRow227TriangleData1676.coefficient141_325,
    output := OriginalRow227TriangleData1683.coefficient142_325, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_327, Icur := OriginalRow227TriangleData1676.coefficient141_326,
    output := OriginalRow227TriangleData1683.coefficient142_326, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_328, Icur := OriginalRow227TriangleData1676.coefficient141_327,
    output := OriginalRow227TriangleData1683.coefficient142_327, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_329, Icur := OriginalRow227TriangleData1676.coefficient141_328,
    output := OriginalRow227TriangleData1683.coefficient142_328, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_330, Icur := OriginalRow227TriangleData1676.coefficient141_329,
    output := OriginalRow227TriangleData1683.coefficient142_329, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1676.coefficient141_331, Icur := OriginalRow227TriangleData1676.coefficient141_330,
    output := OriginalRow227TriangleData1683.coefficient142_330, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1677.coefficient141_332, Icur := OriginalRow227TriangleData1676.coefficient141_331,
    output := OriginalRow227TriangleData1683.coefficient142_331, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1677.coefficient141_333, Icur := OriginalRow227TriangleData1677.coefficient141_332,
    output := OriginalRow227TriangleData1683.coefficient142_332, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1667

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1667.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

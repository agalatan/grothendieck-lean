import Grothe.UpperChaos.OriginalRow227TriangleData1015
import Grothe.UpperChaos.OriginalRow227TriangleData1016
import Grothe.UpperChaos.OriginalRow227TriangleData1027
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1011
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_297, Icur := OriginalRow227TriangleData1015.coefficient72_296,
    output := OriginalRow227TriangleData1027.coefficient73_296, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_298, Icur := OriginalRow227TriangleData1015.coefficient72_297,
    output := OriginalRow227TriangleData1027.coefficient73_297, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_299, Icur := OriginalRow227TriangleData1015.coefficient72_298,
    output := OriginalRow227TriangleData1027.coefficient73_298, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_300, Icur := OriginalRow227TriangleData1015.coefficient72_299,
    output := OriginalRow227TriangleData1027.coefficient73_299, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_301, Icur := OriginalRow227TriangleData1015.coefficient72_300,
    output := OriginalRow227TriangleData1027.coefficient73_300, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_302, Icur := OriginalRow227TriangleData1015.coefficient72_301,
    output := OriginalRow227TriangleData1027.coefficient73_301, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_303, Icur := OriginalRow227TriangleData1015.coefficient72_302,
    output := OriginalRow227TriangleData1027.coefficient73_302, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_304, Icur := OriginalRow227TriangleData1015.coefficient72_303,
    output := OriginalRow227TriangleData1027.coefficient73_303, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_305, Icur := OriginalRow227TriangleData1015.coefficient72_304,
    output := OriginalRow227TriangleData1027.coefficient73_304, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_306, Icur := OriginalRow227TriangleData1015.coefficient72_305,
    output := OriginalRow227TriangleData1027.coefficient73_305, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_307, Icur := OriginalRow227TriangleData1015.coefficient72_306,
    output := OriginalRow227TriangleData1027.coefficient73_306, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_308, Icur := OriginalRow227TriangleData1015.coefficient72_307,
    output := OriginalRow227TriangleData1027.coefficient73_307, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_309, Icur := OriginalRow227TriangleData1015.coefficient72_308,
    output := OriginalRow227TriangleData1027.coefficient73_308, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_310, Icur := OriginalRow227TriangleData1015.coefficient72_309,
    output := OriginalRow227TriangleData1027.coefficient73_309, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_311, Icur := OriginalRow227TriangleData1015.coefficient72_310,
    output := OriginalRow227TriangleData1027.coefficient73_310, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_312, Icur := OriginalRow227TriangleData1015.coefficient72_311,
    output := OriginalRow227TriangleData1027.coefficient73_311, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_313, Icur := OriginalRow227TriangleData1015.coefficient72_312,
    output := OriginalRow227TriangleData1027.coefficient73_312, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_314, Icur := OriginalRow227TriangleData1015.coefficient72_313,
    output := OriginalRow227TriangleData1027.coefficient73_313, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_315, Icur := OriginalRow227TriangleData1015.coefficient72_314,
    output := OriginalRow227TriangleData1027.coefficient73_314, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_316, Icur := OriginalRow227TriangleData1015.coefficient72_315,
    output := OriginalRow227TriangleData1027.coefficient73_315, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_317, Icur := OriginalRow227TriangleData1015.coefficient72_316,
    output := OriginalRow227TriangleData1027.coefficient73_316, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_318, Icur := OriginalRow227TriangleData1015.coefficient72_317,
    output := OriginalRow227TriangleData1027.coefficient73_317, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_319, Icur := OriginalRow227TriangleData1015.coefficient72_318,
    output := OriginalRow227TriangleData1027.coefficient73_318, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_320, Icur := OriginalRow227TriangleData1015.coefficient72_319,
    output := OriginalRow227TriangleData1027.coefficient73_319, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_321, Icur := OriginalRow227TriangleData1015.coefficient72_320,
    output := OriginalRow227TriangleData1027.coefficient73_320, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_322, Icur := OriginalRow227TriangleData1015.coefficient72_321,
    output := OriginalRow227TriangleData1027.coefficient73_321, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_323, Icur := OriginalRow227TriangleData1015.coefficient72_322,
    output := OriginalRow227TriangleData1027.coefficient73_322, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_324, Icur := OriginalRow227TriangleData1015.coefficient72_323,
    output := OriginalRow227TriangleData1027.coefficient73_323, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_325, Icur := OriginalRow227TriangleData1015.coefficient72_324,
    output := OriginalRow227TriangleData1027.coefficient73_324, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1015.coefficient72_326, Icur := OriginalRow227TriangleData1015.coefficient72_325,
    output := OriginalRow227TriangleData1027.coefficient73_325, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1016.coefficient72_327, Icur := OriginalRow227TriangleData1015.coefficient72_326,
    output := OriginalRow227TriangleData1027.coefficient73_326, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots02.root73,
    Inext := OriginalRow227TriangleData1016.coefficient72_328, Icur := OriginalRow227TriangleData1016.coefficient72_327,
    output := OriginalRow227TriangleData1027.coefficient73_327, hC := OriginalRow227TriangleRoots02.root73_pos, hAC := OriginalRow227TriangleRoots02.product73_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1011

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1011.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

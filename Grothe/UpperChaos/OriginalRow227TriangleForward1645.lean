import Grothe.UpperChaos.OriginalRow227TriangleData1653
import Grothe.UpperChaos.OriginalRow227TriangleData1654
import Grothe.UpperChaos.OriginalRow227TriangleData1661
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1645
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_299, Icur := OriginalRow227TriangleData1653.coefficient138_298,
    output := OriginalRow227TriangleData1661.coefficient139_298, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_300, Icur := OriginalRow227TriangleData1653.coefficient138_299,
    output := OriginalRow227TriangleData1661.coefficient139_299, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_301, Icur := OriginalRow227TriangleData1653.coefficient138_300,
    output := OriginalRow227TriangleData1661.coefficient139_300, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_302, Icur := OriginalRow227TriangleData1653.coefficient138_301,
    output := OriginalRow227TriangleData1661.coefficient139_301, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_303, Icur := OriginalRow227TriangleData1653.coefficient138_302,
    output := OriginalRow227TriangleData1661.coefficient139_302, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_304, Icur := OriginalRow227TriangleData1653.coefficient138_303,
    output := OriginalRow227TriangleData1661.coefficient139_303, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_305, Icur := OriginalRow227TriangleData1653.coefficient138_304,
    output := OriginalRow227TriangleData1661.coefficient139_304, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_306, Icur := OriginalRow227TriangleData1653.coefficient138_305,
    output := OriginalRow227TriangleData1661.coefficient139_305, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_307, Icur := OriginalRow227TriangleData1653.coefficient138_306,
    output := OriginalRow227TriangleData1661.coefficient139_306, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_308, Icur := OriginalRow227TriangleData1653.coefficient138_307,
    output := OriginalRow227TriangleData1661.coefficient139_307, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_309, Icur := OriginalRow227TriangleData1653.coefficient138_308,
    output := OriginalRow227TriangleData1661.coefficient139_308, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_310, Icur := OriginalRow227TriangleData1653.coefficient138_309,
    output := OriginalRow227TriangleData1661.coefficient139_309, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_311, Icur := OriginalRow227TriangleData1653.coefficient138_310,
    output := OriginalRow227TriangleData1661.coefficient139_310, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_312, Icur := OriginalRow227TriangleData1653.coefficient138_311,
    output := OriginalRow227TriangleData1661.coefficient139_311, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_313, Icur := OriginalRow227TriangleData1653.coefficient138_312,
    output := OriginalRow227TriangleData1661.coefficient139_312, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_314, Icur := OriginalRow227TriangleData1653.coefficient138_313,
    output := OriginalRow227TriangleData1661.coefficient139_313, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_315, Icur := OriginalRow227TriangleData1653.coefficient138_314,
    output := OriginalRow227TriangleData1661.coefficient139_314, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_316, Icur := OriginalRow227TriangleData1653.coefficient138_315,
    output := OriginalRow227TriangleData1661.coefficient139_315, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_317, Icur := OriginalRow227TriangleData1653.coefficient138_316,
    output := OriginalRow227TriangleData1661.coefficient139_316, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_318, Icur := OriginalRow227TriangleData1653.coefficient138_317,
    output := OriginalRow227TriangleData1661.coefficient139_317, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_319, Icur := OriginalRow227TriangleData1653.coefficient138_318,
    output := OriginalRow227TriangleData1661.coefficient139_318, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_320, Icur := OriginalRow227TriangleData1653.coefficient138_319,
    output := OriginalRow227TriangleData1661.coefficient139_319, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_321, Icur := OriginalRow227TriangleData1653.coefficient138_320,
    output := OriginalRow227TriangleData1661.coefficient139_320, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_322, Icur := OriginalRow227TriangleData1653.coefficient138_321,
    output := OriginalRow227TriangleData1661.coefficient139_321, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_323, Icur := OriginalRow227TriangleData1653.coefficient138_322,
    output := OriginalRow227TriangleData1661.coefficient139_322, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_324, Icur := OriginalRow227TriangleData1653.coefficient138_323,
    output := OriginalRow227TriangleData1661.coefficient139_323, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_325, Icur := OriginalRow227TriangleData1653.coefficient138_324,
    output := OriginalRow227TriangleData1661.coefficient139_324, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_326, Icur := OriginalRow227TriangleData1653.coefficient138_325,
    output := OriginalRow227TriangleData1661.coefficient139_325, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_327, Icur := OriginalRow227TriangleData1653.coefficient138_326,
    output := OriginalRow227TriangleData1661.coefficient139_326, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1653.coefficient138_328, Icur := OriginalRow227TriangleData1653.coefficient138_327,
    output := OriginalRow227TriangleData1661.coefficient139_327, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1654.coefficient138_329, Icur := OriginalRow227TriangleData1653.coefficient138_328,
    output := OriginalRow227TriangleData1661.coefficient139_328, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1654.coefficient138_330, Icur := OriginalRow227TriangleData1654.coefficient138_329,
    output := OriginalRow227TriangleData1661.coefficient139_329, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1645

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1645.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

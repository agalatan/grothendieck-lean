import Grothe.UpperChaos.OriginalRow227TriangleData1711
import Grothe.UpperChaos.OriginalRow227TriangleData1712
import Grothe.UpperChaos.OriginalRow227TriangleData1718
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1702
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_307, Icur := OriginalRow227TriangleData1711.coefficient146_306,
    output := OriginalRow227TriangleData1718.coefficient147_306, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_308, Icur := OriginalRow227TriangleData1711.coefficient146_307,
    output := OriginalRow227TriangleData1718.coefficient147_307, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_309, Icur := OriginalRow227TriangleData1711.coefficient146_308,
    output := OriginalRow227TriangleData1718.coefficient147_308, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_310, Icur := OriginalRow227TriangleData1711.coefficient146_309,
    output := OriginalRow227TriangleData1718.coefficient147_309, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_311, Icur := OriginalRow227TriangleData1711.coefficient146_310,
    output := OriginalRow227TriangleData1718.coefficient147_310, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_312, Icur := OriginalRow227TriangleData1711.coefficient146_311,
    output := OriginalRow227TriangleData1718.coefficient147_311, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_313, Icur := OriginalRow227TriangleData1711.coefficient146_312,
    output := OriginalRow227TriangleData1718.coefficient147_312, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_314, Icur := OriginalRow227TriangleData1711.coefficient146_313,
    output := OriginalRow227TriangleData1718.coefficient147_313, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_315, Icur := OriginalRow227TriangleData1711.coefficient146_314,
    output := OriginalRow227TriangleData1718.coefficient147_314, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_316, Icur := OriginalRow227TriangleData1711.coefficient146_315,
    output := OriginalRow227TriangleData1718.coefficient147_315, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_317, Icur := OriginalRow227TriangleData1711.coefficient146_316,
    output := OriginalRow227TriangleData1718.coefficient147_316, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_318, Icur := OriginalRow227TriangleData1711.coefficient146_317,
    output := OriginalRow227TriangleData1718.coefficient147_317, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_319, Icur := OriginalRow227TriangleData1711.coefficient146_318,
    output := OriginalRow227TriangleData1718.coefficient147_318, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_320, Icur := OriginalRow227TriangleData1711.coefficient146_319,
    output := OriginalRow227TriangleData1718.coefficient147_319, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_321, Icur := OriginalRow227TriangleData1711.coefficient146_320,
    output := OriginalRow227TriangleData1718.coefficient147_320, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_322, Icur := OriginalRow227TriangleData1711.coefficient146_321,
    output := OriginalRow227TriangleData1718.coefficient147_321, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_323, Icur := OriginalRow227TriangleData1711.coefficient146_322,
    output := OriginalRow227TriangleData1718.coefficient147_322, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_324, Icur := OriginalRow227TriangleData1711.coefficient146_323,
    output := OriginalRow227TriangleData1718.coefficient147_323, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_325, Icur := OriginalRow227TriangleData1711.coefficient146_324,
    output := OriginalRow227TriangleData1718.coefficient147_324, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_326, Icur := OriginalRow227TriangleData1711.coefficient146_325,
    output := OriginalRow227TriangleData1718.coefficient147_325, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_327, Icur := OriginalRow227TriangleData1711.coefficient146_326,
    output := OriginalRow227TriangleData1718.coefficient147_326, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_328, Icur := OriginalRow227TriangleData1711.coefficient146_327,
    output := OriginalRow227TriangleData1718.coefficient147_327, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_329, Icur := OriginalRow227TriangleData1711.coefficient146_328,
    output := OriginalRow227TriangleData1718.coefficient147_328, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_330, Icur := OriginalRow227TriangleData1711.coefficient146_329,
    output := OriginalRow227TriangleData1718.coefficient147_329, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_331, Icur := OriginalRow227TriangleData1711.coefficient146_330,
    output := OriginalRow227TriangleData1718.coefficient147_330, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_332, Icur := OriginalRow227TriangleData1711.coefficient146_331,
    output := OriginalRow227TriangleData1718.coefficient147_331, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_333, Icur := OriginalRow227TriangleData1711.coefficient146_332,
    output := OriginalRow227TriangleData1718.coefficient147_332, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_334, Icur := OriginalRow227TriangleData1711.coefficient146_333,
    output := OriginalRow227TriangleData1718.coefficient147_333, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_335, Icur := OriginalRow227TriangleData1711.coefficient146_334,
    output := OriginalRow227TriangleData1718.coefficient147_334, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1711.coefficient146_336, Icur := OriginalRow227TriangleData1711.coefficient146_335,
    output := OriginalRow227TriangleData1718.coefficient147_335, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1712.coefficient146_337, Icur := OriginalRow227TriangleData1711.coefficient146_336,
    output := OriginalRow227TriangleData1718.coefficient147_336, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots04.root147,
    Inext := OriginalRow227TriangleData1712.coefficient146_338, Icur := OriginalRow227TriangleData1712.coefficient146_337,
    output := OriginalRow227TriangleData1718.coefficient147_337, hC := OriginalRow227TriangleRoots04.root147_pos, hAC := OriginalRow227TriangleRoots04.product147_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1702

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1702.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

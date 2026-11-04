import Grothe.UpperChaos.OriginalRow227TriangleData1140
import Grothe.UpperChaos.OriginalRow227TriangleData1141
import Grothe.UpperChaos.OriginalRow227TriangleData1151
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1135
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_308, Icur := OriginalRow227TriangleData1140.coefficient83_307,
    output := OriginalRow227TriangleData1151.coefficient84_307, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_309, Icur := OriginalRow227TriangleData1140.coefficient83_308,
    output := OriginalRow227TriangleData1151.coefficient84_308, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_310, Icur := OriginalRow227TriangleData1140.coefficient83_309,
    output := OriginalRow227TriangleData1151.coefficient84_309, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_311, Icur := OriginalRow227TriangleData1140.coefficient83_310,
    output := OriginalRow227TriangleData1151.coefficient84_310, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_312, Icur := OriginalRow227TriangleData1140.coefficient83_311,
    output := OriginalRow227TriangleData1151.coefficient84_311, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_313, Icur := OriginalRow227TriangleData1140.coefficient83_312,
    output := OriginalRow227TriangleData1151.coefficient84_312, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_314, Icur := OriginalRow227TriangleData1140.coefficient83_313,
    output := OriginalRow227TriangleData1151.coefficient84_313, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_315, Icur := OriginalRow227TriangleData1140.coefficient83_314,
    output := OriginalRow227TriangleData1151.coefficient84_314, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_316, Icur := OriginalRow227TriangleData1140.coefficient83_315,
    output := OriginalRow227TriangleData1151.coefficient84_315, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_317, Icur := OriginalRow227TriangleData1140.coefficient83_316,
    output := OriginalRow227TriangleData1151.coefficient84_316, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_318, Icur := OriginalRow227TriangleData1140.coefficient83_317,
    output := OriginalRow227TriangleData1151.coefficient84_317, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_319, Icur := OriginalRow227TriangleData1140.coefficient83_318,
    output := OriginalRow227TriangleData1151.coefficient84_318, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_320, Icur := OriginalRow227TriangleData1140.coefficient83_319,
    output := OriginalRow227TriangleData1151.coefficient84_319, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_321, Icur := OriginalRow227TriangleData1140.coefficient83_320,
    output := OriginalRow227TriangleData1151.coefficient84_320, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_322, Icur := OriginalRow227TriangleData1140.coefficient83_321,
    output := OriginalRow227TriangleData1151.coefficient84_321, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_323, Icur := OriginalRow227TriangleData1140.coefficient83_322,
    output := OriginalRow227TriangleData1151.coefficient84_322, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_324, Icur := OriginalRow227TriangleData1140.coefficient83_323,
    output := OriginalRow227TriangleData1151.coefficient84_323, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_325, Icur := OriginalRow227TriangleData1140.coefficient83_324,
    output := OriginalRow227TriangleData1151.coefficient84_324, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_326, Icur := OriginalRow227TriangleData1140.coefficient83_325,
    output := OriginalRow227TriangleData1151.coefficient84_325, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_327, Icur := OriginalRow227TriangleData1140.coefficient83_326,
    output := OriginalRow227TriangleData1151.coefficient84_326, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_328, Icur := OriginalRow227TriangleData1140.coefficient83_327,
    output := OriginalRow227TriangleData1151.coefficient84_327, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_329, Icur := OriginalRow227TriangleData1140.coefficient83_328,
    output := OriginalRow227TriangleData1151.coefficient84_328, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_330, Icur := OriginalRow227TriangleData1140.coefficient83_329,
    output := OriginalRow227TriangleData1151.coefficient84_329, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_331, Icur := OriginalRow227TriangleData1140.coefficient83_330,
    output := OriginalRow227TriangleData1151.coefficient84_330, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_332, Icur := OriginalRow227TriangleData1140.coefficient83_331,
    output := OriginalRow227TriangleData1151.coefficient84_331, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_333, Icur := OriginalRow227TriangleData1140.coefficient83_332,
    output := OriginalRow227TriangleData1151.coefficient84_332, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_334, Icur := OriginalRow227TriangleData1140.coefficient83_333,
    output := OriginalRow227TriangleData1151.coefficient84_333, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_335, Icur := OriginalRow227TriangleData1140.coefficient83_334,
    output := OriginalRow227TriangleData1151.coefficient84_334, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_336, Icur := OriginalRow227TriangleData1140.coefficient83_335,
    output := OriginalRow227TriangleData1151.coefficient84_335, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1140.coefficient83_337, Icur := OriginalRow227TriangleData1140.coefficient83_336,
    output := OriginalRow227TriangleData1151.coefficient84_336, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1141.coefficient83_338, Icur := OriginalRow227TriangleData1140.coefficient83_337,
    output := OriginalRow227TriangleData1151.coefficient84_337, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1141.coefficient83_339, Icur := OriginalRow227TriangleData1141.coefficient83_338,
    output := OriginalRow227TriangleData1151.coefficient84_338, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1135

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1135.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData1129
import Grothe.UpperChaos.OriginalRow227TriangleData1130
import Grothe.UpperChaos.OriginalRow227TriangleData1140
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1124
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_307, Icur := OriginalRow227TriangleData1129.coefficient82_306,
    output := OriginalRow227TriangleData1140.coefficient83_306, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_308, Icur := OriginalRow227TriangleData1129.coefficient82_307,
    output := OriginalRow227TriangleData1140.coefficient83_307, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_309, Icur := OriginalRow227TriangleData1129.coefficient82_308,
    output := OriginalRow227TriangleData1140.coefficient83_308, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_310, Icur := OriginalRow227TriangleData1129.coefficient82_309,
    output := OriginalRow227TriangleData1140.coefficient83_309, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_311, Icur := OriginalRow227TriangleData1129.coefficient82_310,
    output := OriginalRow227TriangleData1140.coefficient83_310, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_312, Icur := OriginalRow227TriangleData1129.coefficient82_311,
    output := OriginalRow227TriangleData1140.coefficient83_311, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_313, Icur := OriginalRow227TriangleData1129.coefficient82_312,
    output := OriginalRow227TriangleData1140.coefficient83_312, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_314, Icur := OriginalRow227TriangleData1129.coefficient82_313,
    output := OriginalRow227TriangleData1140.coefficient83_313, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_315, Icur := OriginalRow227TriangleData1129.coefficient82_314,
    output := OriginalRow227TriangleData1140.coefficient83_314, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_316, Icur := OriginalRow227TriangleData1129.coefficient82_315,
    output := OriginalRow227TriangleData1140.coefficient83_315, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_317, Icur := OriginalRow227TriangleData1129.coefficient82_316,
    output := OriginalRow227TriangleData1140.coefficient83_316, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_318, Icur := OriginalRow227TriangleData1129.coefficient82_317,
    output := OriginalRow227TriangleData1140.coefficient83_317, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_319, Icur := OriginalRow227TriangleData1129.coefficient82_318,
    output := OriginalRow227TriangleData1140.coefficient83_318, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_320, Icur := OriginalRow227TriangleData1129.coefficient82_319,
    output := OriginalRow227TriangleData1140.coefficient83_319, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_321, Icur := OriginalRow227TriangleData1129.coefficient82_320,
    output := OriginalRow227TriangleData1140.coefficient83_320, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_322, Icur := OriginalRow227TriangleData1129.coefficient82_321,
    output := OriginalRow227TriangleData1140.coefficient83_321, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_323, Icur := OriginalRow227TriangleData1129.coefficient82_322,
    output := OriginalRow227TriangleData1140.coefficient83_322, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_324, Icur := OriginalRow227TriangleData1129.coefficient82_323,
    output := OriginalRow227TriangleData1140.coefficient83_323, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_325, Icur := OriginalRow227TriangleData1129.coefficient82_324,
    output := OriginalRow227TriangleData1140.coefficient83_324, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_326, Icur := OriginalRow227TriangleData1129.coefficient82_325,
    output := OriginalRow227TriangleData1140.coefficient83_325, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_327, Icur := OriginalRow227TriangleData1129.coefficient82_326,
    output := OriginalRow227TriangleData1140.coefficient83_326, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_328, Icur := OriginalRow227TriangleData1129.coefficient82_327,
    output := OriginalRow227TriangleData1140.coefficient83_327, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_329, Icur := OriginalRow227TriangleData1129.coefficient82_328,
    output := OriginalRow227TriangleData1140.coefficient83_328, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_330, Icur := OriginalRow227TriangleData1129.coefficient82_329,
    output := OriginalRow227TriangleData1140.coefficient83_329, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_331, Icur := OriginalRow227TriangleData1129.coefficient82_330,
    output := OriginalRow227TriangleData1140.coefficient83_330, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_332, Icur := OriginalRow227TriangleData1129.coefficient82_331,
    output := OriginalRow227TriangleData1140.coefficient83_331, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_333, Icur := OriginalRow227TriangleData1129.coefficient82_332,
    output := OriginalRow227TriangleData1140.coefficient83_332, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_334, Icur := OriginalRow227TriangleData1129.coefficient82_333,
    output := OriginalRow227TriangleData1140.coefficient83_333, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_335, Icur := OriginalRow227TriangleData1129.coefficient82_334,
    output := OriginalRow227TriangleData1140.coefficient83_334, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1129.coefficient82_336, Icur := OriginalRow227TriangleData1129.coefficient82_335,
    output := OriginalRow227TriangleData1140.coefficient83_335, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1130.coefficient82_337, Icur := OriginalRow227TriangleData1129.coefficient82_336,
    output := OriginalRow227TriangleData1140.coefficient83_336, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots02.root83,
    Inext := OriginalRow227TriangleData1130.coefficient82_338, Icur := OriginalRow227TriangleData1130.coefficient82_337,
    output := OriginalRow227TriangleData1140.coefficient83_337, hC := OriginalRow227TriangleRoots02.root83_pos, hAC := OriginalRow227TriangleRoots02.product83_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1124

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1124.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

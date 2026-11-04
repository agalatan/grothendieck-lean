import Grothe.UpperChaos.OriginalRow227TriangleData1195
import Grothe.UpperChaos.OriginalRow227TriangleData1196
import Grothe.UpperChaos.OriginalRow227TriangleData1206
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1190
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_313, Icur := OriginalRow227TriangleData1195.coefficient88_312,
    output := OriginalRow227TriangleData1206.coefficient89_312, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_314, Icur := OriginalRow227TriangleData1195.coefficient88_313,
    output := OriginalRow227TriangleData1206.coefficient89_313, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_315, Icur := OriginalRow227TriangleData1195.coefficient88_314,
    output := OriginalRow227TriangleData1206.coefficient89_314, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_316, Icur := OriginalRow227TriangleData1195.coefficient88_315,
    output := OriginalRow227TriangleData1206.coefficient89_315, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_317, Icur := OriginalRow227TriangleData1195.coefficient88_316,
    output := OriginalRow227TriangleData1206.coefficient89_316, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_318, Icur := OriginalRow227TriangleData1195.coefficient88_317,
    output := OriginalRow227TriangleData1206.coefficient89_317, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_319, Icur := OriginalRow227TriangleData1195.coefficient88_318,
    output := OriginalRow227TriangleData1206.coefficient89_318, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_320, Icur := OriginalRow227TriangleData1195.coefficient88_319,
    output := OriginalRow227TriangleData1206.coefficient89_319, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_321, Icur := OriginalRow227TriangleData1195.coefficient88_320,
    output := OriginalRow227TriangleData1206.coefficient89_320, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_322, Icur := OriginalRow227TriangleData1195.coefficient88_321,
    output := OriginalRow227TriangleData1206.coefficient89_321, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_323, Icur := OriginalRow227TriangleData1195.coefficient88_322,
    output := OriginalRow227TriangleData1206.coefficient89_322, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_324, Icur := OriginalRow227TriangleData1195.coefficient88_323,
    output := OriginalRow227TriangleData1206.coefficient89_323, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_325, Icur := OriginalRow227TriangleData1195.coefficient88_324,
    output := OriginalRow227TriangleData1206.coefficient89_324, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_326, Icur := OriginalRow227TriangleData1195.coefficient88_325,
    output := OriginalRow227TriangleData1206.coefficient89_325, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_327, Icur := OriginalRow227TriangleData1195.coefficient88_326,
    output := OriginalRow227TriangleData1206.coefficient89_326, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_328, Icur := OriginalRow227TriangleData1195.coefficient88_327,
    output := OriginalRow227TriangleData1206.coefficient89_327, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_329, Icur := OriginalRow227TriangleData1195.coefficient88_328,
    output := OriginalRow227TriangleData1206.coefficient89_328, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_330, Icur := OriginalRow227TriangleData1195.coefficient88_329,
    output := OriginalRow227TriangleData1206.coefficient89_329, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_331, Icur := OriginalRow227TriangleData1195.coefficient88_330,
    output := OriginalRow227TriangleData1206.coefficient89_330, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_332, Icur := OriginalRow227TriangleData1195.coefficient88_331,
    output := OriginalRow227TriangleData1206.coefficient89_331, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_333, Icur := OriginalRow227TriangleData1195.coefficient88_332,
    output := OriginalRow227TriangleData1206.coefficient89_332, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_334, Icur := OriginalRow227TriangleData1195.coefficient88_333,
    output := OriginalRow227TriangleData1206.coefficient89_333, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_335, Icur := OriginalRow227TriangleData1195.coefficient88_334,
    output := OriginalRow227TriangleData1206.coefficient89_334, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_336, Icur := OriginalRow227TriangleData1195.coefficient88_335,
    output := OriginalRow227TriangleData1206.coefficient89_335, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_337, Icur := OriginalRow227TriangleData1195.coefficient88_336,
    output := OriginalRow227TriangleData1206.coefficient89_336, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_338, Icur := OriginalRow227TriangleData1195.coefficient88_337,
    output := OriginalRow227TriangleData1206.coefficient89_337, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_339, Icur := OriginalRow227TriangleData1195.coefficient88_338,
    output := OriginalRow227TriangleData1206.coefficient89_338, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_340, Icur := OriginalRow227TriangleData1195.coefficient88_339,
    output := OriginalRow227TriangleData1206.coefficient89_339, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_341, Icur := OriginalRow227TriangleData1195.coefficient88_340,
    output := OriginalRow227TriangleData1206.coefficient89_340, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1195.coefficient88_342, Icur := OriginalRow227TriangleData1195.coefficient88_341,
    output := OriginalRow227TriangleData1206.coefficient89_341, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_343, Icur := OriginalRow227TriangleData1195.coefficient88_342,
    output := OriginalRow227TriangleData1206.coefficient89_342, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots02.root89,
    Inext := OriginalRow227TriangleData1196.coefficient88_344, Icur := OriginalRow227TriangleData1196.coefficient88_343,
    output := OriginalRow227TriangleData1206.coefficient89_343, hC := OriginalRow227TriangleRoots02.root89_pos, hAC := OriginalRow227TriangleRoots02.product89_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1190

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1190.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

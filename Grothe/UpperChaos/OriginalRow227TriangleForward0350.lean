import Grothe.UpperChaos.OriginalRow227TriangleData0351
import Grothe.UpperChaos.OriginalRow227TriangleData0352
import Grothe.UpperChaos.OriginalRow227TriangleData0366
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0350
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_311, Icur := OriginalRow227TriangleData0351.coefficient22_310,
    output := OriginalRow227TriangleData0366.coefficient23_310, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_312, Icur := OriginalRow227TriangleData0351.coefficient22_311,
    output := OriginalRow227TriangleData0366.coefficient23_311, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_313, Icur := OriginalRow227TriangleData0351.coefficient22_312,
    output := OriginalRow227TriangleData0366.coefficient23_312, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_314, Icur := OriginalRow227TriangleData0351.coefficient22_313,
    output := OriginalRow227TriangleData0366.coefficient23_313, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_315, Icur := OriginalRow227TriangleData0351.coefficient22_314,
    output := OriginalRow227TriangleData0366.coefficient23_314, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_316, Icur := OriginalRow227TriangleData0351.coefficient22_315,
    output := OriginalRow227TriangleData0366.coefficient23_315, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_317, Icur := OriginalRow227TriangleData0351.coefficient22_316,
    output := OriginalRow227TriangleData0366.coefficient23_316, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_318, Icur := OriginalRow227TriangleData0351.coefficient22_317,
    output := OriginalRow227TriangleData0366.coefficient23_317, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_319, Icur := OriginalRow227TriangleData0351.coefficient22_318,
    output := OriginalRow227TriangleData0366.coefficient23_318, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_320, Icur := OriginalRow227TriangleData0351.coefficient22_319,
    output := OriginalRow227TriangleData0366.coefficient23_319, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_321, Icur := OriginalRow227TriangleData0351.coefficient22_320,
    output := OriginalRow227TriangleData0366.coefficient23_320, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_322, Icur := OriginalRow227TriangleData0351.coefficient22_321,
    output := OriginalRow227TriangleData0366.coefficient23_321, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_323, Icur := OriginalRow227TriangleData0351.coefficient22_322,
    output := OriginalRow227TriangleData0366.coefficient23_322, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_324, Icur := OriginalRow227TriangleData0351.coefficient22_323,
    output := OriginalRow227TriangleData0366.coefficient23_323, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_325, Icur := OriginalRow227TriangleData0351.coefficient22_324,
    output := OriginalRow227TriangleData0366.coefficient23_324, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_326, Icur := OriginalRow227TriangleData0351.coefficient22_325,
    output := OriginalRow227TriangleData0366.coefficient23_325, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_327, Icur := OriginalRow227TriangleData0351.coefficient22_326,
    output := OriginalRow227TriangleData0366.coefficient23_326, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_328, Icur := OriginalRow227TriangleData0351.coefficient22_327,
    output := OriginalRow227TriangleData0366.coefficient23_327, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_329, Icur := OriginalRow227TriangleData0351.coefficient22_328,
    output := OriginalRow227TriangleData0366.coefficient23_328, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_330, Icur := OriginalRow227TriangleData0351.coefficient22_329,
    output := OriginalRow227TriangleData0366.coefficient23_329, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_331, Icur := OriginalRow227TriangleData0351.coefficient22_330,
    output := OriginalRow227TriangleData0366.coefficient23_330, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_332, Icur := OriginalRow227TriangleData0351.coefficient22_331,
    output := OriginalRow227TriangleData0366.coefficient23_331, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_333, Icur := OriginalRow227TriangleData0351.coefficient22_332,
    output := OriginalRow227TriangleData0366.coefficient23_332, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_334, Icur := OriginalRow227TriangleData0351.coefficient22_333,
    output := OriginalRow227TriangleData0366.coefficient23_333, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_335, Icur := OriginalRow227TriangleData0351.coefficient22_334,
    output := OriginalRow227TriangleData0366.coefficient23_334, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_336, Icur := OriginalRow227TriangleData0351.coefficient22_335,
    output := OriginalRow227TriangleData0366.coefficient23_335, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_337, Icur := OriginalRow227TriangleData0351.coefficient22_336,
    output := OriginalRow227TriangleData0366.coefficient23_336, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_338, Icur := OriginalRow227TriangleData0351.coefficient22_337,
    output := OriginalRow227TriangleData0366.coefficient23_337, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_339, Icur := OriginalRow227TriangleData0351.coefficient22_338,
    output := OriginalRow227TriangleData0366.coefficient23_338, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0351.coefficient22_340, Icur := OriginalRow227TriangleData0351.coefficient22_339,
    output := OriginalRow227TriangleData0366.coefficient23_339, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_341, Icur := OriginalRow227TriangleData0351.coefficient22_340,
    output := OriginalRow227TriangleData0366.coefficient23_340, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots00.root23,
    Inext := OriginalRow227TriangleData0352.coefficient22_342, Icur := OriginalRow227TriangleData0352.coefficient22_341,
    output := OriginalRow227TriangleData0366.coefficient23_341, hC := OriginalRow227TriangleRoots00.root23_pos, hAC := OriginalRow227TriangleRoots00.product23_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0350

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0350.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData0716
import Grothe.UpperChaos.OriginalRow227TriangleData0717
import Grothe.UpperChaos.OriginalRow227TriangleData0729
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0713
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_305, Icur := OriginalRow227TriangleData0716.coefficient48_304,
    output := OriginalRow227TriangleData0729.coefficient49_304, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_306, Icur := OriginalRow227TriangleData0716.coefficient48_305,
    output := OriginalRow227TriangleData0729.coefficient49_305, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_307, Icur := OriginalRow227TriangleData0716.coefficient48_306,
    output := OriginalRow227TriangleData0729.coefficient49_306, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_308, Icur := OriginalRow227TriangleData0716.coefficient48_307,
    output := OriginalRow227TriangleData0729.coefficient49_307, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_309, Icur := OriginalRow227TriangleData0716.coefficient48_308,
    output := OriginalRow227TriangleData0729.coefficient49_308, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_310, Icur := OriginalRow227TriangleData0716.coefficient48_309,
    output := OriginalRow227TriangleData0729.coefficient49_309, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_311, Icur := OriginalRow227TriangleData0716.coefficient48_310,
    output := OriginalRow227TriangleData0729.coefficient49_310, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_312, Icur := OriginalRow227TriangleData0716.coefficient48_311,
    output := OriginalRow227TriangleData0729.coefficient49_311, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_313, Icur := OriginalRow227TriangleData0716.coefficient48_312,
    output := OriginalRow227TriangleData0729.coefficient49_312, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_314, Icur := OriginalRow227TriangleData0716.coefficient48_313,
    output := OriginalRow227TriangleData0729.coefficient49_313, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_315, Icur := OriginalRow227TriangleData0716.coefficient48_314,
    output := OriginalRow227TriangleData0729.coefficient49_314, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_316, Icur := OriginalRow227TriangleData0716.coefficient48_315,
    output := OriginalRow227TriangleData0729.coefficient49_315, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_317, Icur := OriginalRow227TriangleData0716.coefficient48_316,
    output := OriginalRow227TriangleData0729.coefficient49_316, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_318, Icur := OriginalRow227TriangleData0716.coefficient48_317,
    output := OriginalRow227TriangleData0729.coefficient49_317, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_319, Icur := OriginalRow227TriangleData0716.coefficient48_318,
    output := OriginalRow227TriangleData0729.coefficient49_318, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_320, Icur := OriginalRow227TriangleData0716.coefficient48_319,
    output := OriginalRow227TriangleData0729.coefficient49_319, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_321, Icur := OriginalRow227TriangleData0716.coefficient48_320,
    output := OriginalRow227TriangleData0729.coefficient49_320, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_322, Icur := OriginalRow227TriangleData0716.coefficient48_321,
    output := OriginalRow227TriangleData0729.coefficient49_321, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_323, Icur := OriginalRow227TriangleData0716.coefficient48_322,
    output := OriginalRow227TriangleData0729.coefficient49_322, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_324, Icur := OriginalRow227TriangleData0716.coefficient48_323,
    output := OriginalRow227TriangleData0729.coefficient49_323, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_325, Icur := OriginalRow227TriangleData0716.coefficient48_324,
    output := OriginalRow227TriangleData0729.coefficient49_324, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_326, Icur := OriginalRow227TriangleData0716.coefficient48_325,
    output := OriginalRow227TriangleData0729.coefficient49_325, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_327, Icur := OriginalRow227TriangleData0716.coefficient48_326,
    output := OriginalRow227TriangleData0729.coefficient49_326, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_328, Icur := OriginalRow227TriangleData0716.coefficient48_327,
    output := OriginalRow227TriangleData0729.coefficient49_327, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_329, Icur := OriginalRow227TriangleData0716.coefficient48_328,
    output := OriginalRow227TriangleData0729.coefficient49_328, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_330, Icur := OriginalRow227TriangleData0716.coefficient48_329,
    output := OriginalRow227TriangleData0729.coefficient49_329, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_331, Icur := OriginalRow227TriangleData0716.coefficient48_330,
    output := OriginalRow227TriangleData0729.coefficient49_330, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_332, Icur := OriginalRow227TriangleData0716.coefficient48_331,
    output := OriginalRow227TriangleData0729.coefficient49_331, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_333, Icur := OriginalRow227TriangleData0716.coefficient48_332,
    output := OriginalRow227TriangleData0729.coefficient49_332, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0716.coefficient48_334, Icur := OriginalRow227TriangleData0716.coefficient48_333,
    output := OriginalRow227TriangleData0729.coefficient49_333, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_335, Icur := OriginalRow227TriangleData0716.coefficient48_334,
    output := OriginalRow227TriangleData0729.coefficient49_334, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0717.coefficient48_336, Icur := OriginalRow227TriangleData0717.coefficient48_335,
    output := OriginalRow227TriangleData0729.coefficient49_335, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0713

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0713.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

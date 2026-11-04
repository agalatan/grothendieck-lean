import Grothe.UpperChaos.OriginalRow227TriangleData0703
import Grothe.UpperChaos.OriginalRow227TriangleData0704
import Grothe.UpperChaos.OriginalRow227TriangleData0716
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0700
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_304, Icur := OriginalRow227TriangleData0703.coefficient47_303,
    output := OriginalRow227TriangleData0716.coefficient48_303, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_305, Icur := OriginalRow227TriangleData0703.coefficient47_304,
    output := OriginalRow227TriangleData0716.coefficient48_304, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_306, Icur := OriginalRow227TriangleData0703.coefficient47_305,
    output := OriginalRow227TriangleData0716.coefficient48_305, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_307, Icur := OriginalRow227TriangleData0703.coefficient47_306,
    output := OriginalRow227TriangleData0716.coefficient48_306, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_308, Icur := OriginalRow227TriangleData0703.coefficient47_307,
    output := OriginalRow227TriangleData0716.coefficient48_307, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_309, Icur := OriginalRow227TriangleData0703.coefficient47_308,
    output := OriginalRow227TriangleData0716.coefficient48_308, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_310, Icur := OriginalRow227TriangleData0703.coefficient47_309,
    output := OriginalRow227TriangleData0716.coefficient48_309, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_311, Icur := OriginalRow227TriangleData0703.coefficient47_310,
    output := OriginalRow227TriangleData0716.coefficient48_310, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_312, Icur := OriginalRow227TriangleData0703.coefficient47_311,
    output := OriginalRow227TriangleData0716.coefficient48_311, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_313, Icur := OriginalRow227TriangleData0703.coefficient47_312,
    output := OriginalRow227TriangleData0716.coefficient48_312, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_314, Icur := OriginalRow227TriangleData0703.coefficient47_313,
    output := OriginalRow227TriangleData0716.coefficient48_313, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_315, Icur := OriginalRow227TriangleData0703.coefficient47_314,
    output := OriginalRow227TriangleData0716.coefficient48_314, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_316, Icur := OriginalRow227TriangleData0703.coefficient47_315,
    output := OriginalRow227TriangleData0716.coefficient48_315, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_317, Icur := OriginalRow227TriangleData0703.coefficient47_316,
    output := OriginalRow227TriangleData0716.coefficient48_316, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_318, Icur := OriginalRow227TriangleData0703.coefficient47_317,
    output := OriginalRow227TriangleData0716.coefficient48_317, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_319, Icur := OriginalRow227TriangleData0703.coefficient47_318,
    output := OriginalRow227TriangleData0716.coefficient48_318, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_320, Icur := OriginalRow227TriangleData0703.coefficient47_319,
    output := OriginalRow227TriangleData0716.coefficient48_319, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_321, Icur := OriginalRow227TriangleData0703.coefficient47_320,
    output := OriginalRow227TriangleData0716.coefficient48_320, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_322, Icur := OriginalRow227TriangleData0703.coefficient47_321,
    output := OriginalRow227TriangleData0716.coefficient48_321, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_323, Icur := OriginalRow227TriangleData0703.coefficient47_322,
    output := OriginalRow227TriangleData0716.coefficient48_322, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_324, Icur := OriginalRow227TriangleData0703.coefficient47_323,
    output := OriginalRow227TriangleData0716.coefficient48_323, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_325, Icur := OriginalRow227TriangleData0703.coefficient47_324,
    output := OriginalRow227TriangleData0716.coefficient48_324, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_326, Icur := OriginalRow227TriangleData0703.coefficient47_325,
    output := OriginalRow227TriangleData0716.coefficient48_325, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_327, Icur := OriginalRow227TriangleData0703.coefficient47_326,
    output := OriginalRow227TriangleData0716.coefficient48_326, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_328, Icur := OriginalRow227TriangleData0703.coefficient47_327,
    output := OriginalRow227TriangleData0716.coefficient48_327, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_329, Icur := OriginalRow227TriangleData0703.coefficient47_328,
    output := OriginalRow227TriangleData0716.coefficient48_328, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_330, Icur := OriginalRow227TriangleData0703.coefficient47_329,
    output := OriginalRow227TriangleData0716.coefficient48_329, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_331, Icur := OriginalRow227TriangleData0703.coefficient47_330,
    output := OriginalRow227TriangleData0716.coefficient48_330, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_332, Icur := OriginalRow227TriangleData0703.coefficient47_331,
    output := OriginalRow227TriangleData0716.coefficient48_331, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0703.coefficient47_333, Icur := OriginalRow227TriangleData0703.coefficient47_332,
    output := OriginalRow227TriangleData0716.coefficient48_332, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0704.coefficient47_334, Icur := OriginalRow227TriangleData0703.coefficient47_333,
    output := OriginalRow227TriangleData0716.coefficient48_333, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0704.coefficient47_335, Icur := OriginalRow227TriangleData0704.coefficient47_334,
    output := OriginalRow227TriangleData0716.coefficient48_334, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0700

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0700.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

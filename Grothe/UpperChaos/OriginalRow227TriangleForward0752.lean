import Grothe.UpperChaos.OriginalRow227TriangleData0755
import Grothe.UpperChaos.OriginalRow227TriangleData0756
import Grothe.UpperChaos.OriginalRow227TriangleData0768
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0752
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_308, Icur := OriginalRow227TriangleData0755.coefficient51_307,
    output := OriginalRow227TriangleData0768.coefficient52_307, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_309, Icur := OriginalRow227TriangleData0755.coefficient51_308,
    output := OriginalRow227TriangleData0768.coefficient52_308, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_310, Icur := OriginalRow227TriangleData0755.coefficient51_309,
    output := OriginalRow227TriangleData0768.coefficient52_309, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_311, Icur := OriginalRow227TriangleData0755.coefficient51_310,
    output := OriginalRow227TriangleData0768.coefficient52_310, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_312, Icur := OriginalRow227TriangleData0755.coefficient51_311,
    output := OriginalRow227TriangleData0768.coefficient52_311, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_313, Icur := OriginalRow227TriangleData0755.coefficient51_312,
    output := OriginalRow227TriangleData0768.coefficient52_312, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_314, Icur := OriginalRow227TriangleData0755.coefficient51_313,
    output := OriginalRow227TriangleData0768.coefficient52_313, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_315, Icur := OriginalRow227TriangleData0755.coefficient51_314,
    output := OriginalRow227TriangleData0768.coefficient52_314, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_316, Icur := OriginalRow227TriangleData0755.coefficient51_315,
    output := OriginalRow227TriangleData0768.coefficient52_315, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_317, Icur := OriginalRow227TriangleData0755.coefficient51_316,
    output := OriginalRow227TriangleData0768.coefficient52_316, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_318, Icur := OriginalRow227TriangleData0755.coefficient51_317,
    output := OriginalRow227TriangleData0768.coefficient52_317, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_319, Icur := OriginalRow227TriangleData0755.coefficient51_318,
    output := OriginalRow227TriangleData0768.coefficient52_318, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_320, Icur := OriginalRow227TriangleData0755.coefficient51_319,
    output := OriginalRow227TriangleData0768.coefficient52_319, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_321, Icur := OriginalRow227TriangleData0755.coefficient51_320,
    output := OriginalRow227TriangleData0768.coefficient52_320, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_322, Icur := OriginalRow227TriangleData0755.coefficient51_321,
    output := OriginalRow227TriangleData0768.coefficient52_321, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_323, Icur := OriginalRow227TriangleData0755.coefficient51_322,
    output := OriginalRow227TriangleData0768.coefficient52_322, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_324, Icur := OriginalRow227TriangleData0755.coefficient51_323,
    output := OriginalRow227TriangleData0768.coefficient52_323, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_325, Icur := OriginalRow227TriangleData0755.coefficient51_324,
    output := OriginalRow227TriangleData0768.coefficient52_324, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_326, Icur := OriginalRow227TriangleData0755.coefficient51_325,
    output := OriginalRow227TriangleData0768.coefficient52_325, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_327, Icur := OriginalRow227TriangleData0755.coefficient51_326,
    output := OriginalRow227TriangleData0768.coefficient52_326, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_328, Icur := OriginalRow227TriangleData0755.coefficient51_327,
    output := OriginalRow227TriangleData0768.coefficient52_327, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_329, Icur := OriginalRow227TriangleData0755.coefficient51_328,
    output := OriginalRow227TriangleData0768.coefficient52_328, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_330, Icur := OriginalRow227TriangleData0755.coefficient51_329,
    output := OriginalRow227TriangleData0768.coefficient52_329, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_331, Icur := OriginalRow227TriangleData0755.coefficient51_330,
    output := OriginalRow227TriangleData0768.coefficient52_330, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_332, Icur := OriginalRow227TriangleData0755.coefficient51_331,
    output := OriginalRow227TriangleData0768.coefficient52_331, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_333, Icur := OriginalRow227TriangleData0755.coefficient51_332,
    output := OriginalRow227TriangleData0768.coefficient52_332, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_334, Icur := OriginalRow227TriangleData0755.coefficient51_333,
    output := OriginalRow227TriangleData0768.coefficient52_333, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_335, Icur := OriginalRow227TriangleData0755.coefficient51_334,
    output := OriginalRow227TriangleData0768.coefficient52_334, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_336, Icur := OriginalRow227TriangleData0755.coefficient51_335,
    output := OriginalRow227TriangleData0768.coefficient52_335, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0755.coefficient51_337, Icur := OriginalRow227TriangleData0755.coefficient51_336,
    output := OriginalRow227TriangleData0768.coefficient52_336, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0756.coefficient51_338, Icur := OriginalRow227TriangleData0755.coefficient51_337,
    output := OriginalRow227TriangleData0768.coefficient52_337, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0756.coefficient51_339, Icur := OriginalRow227TriangleData0756.coefficient51_338,
    output := OriginalRow227TriangleData0768.coefficient52_338, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0752

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0752.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

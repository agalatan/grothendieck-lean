import Grothe.UpperChaos.OriginalRow227TriangleData0768
import Grothe.UpperChaos.OriginalRow227TriangleData0769
import Grothe.UpperChaos.OriginalRow227TriangleData0781
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0765
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_309, Icur := OriginalRow227TriangleData0768.coefficient52_308,
    output := OriginalRow227TriangleData0781.coefficient53_308, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_310, Icur := OriginalRow227TriangleData0768.coefficient52_309,
    output := OriginalRow227TriangleData0781.coefficient53_309, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_311, Icur := OriginalRow227TriangleData0768.coefficient52_310,
    output := OriginalRow227TriangleData0781.coefficient53_310, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_312, Icur := OriginalRow227TriangleData0768.coefficient52_311,
    output := OriginalRow227TriangleData0781.coefficient53_311, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_313, Icur := OriginalRow227TriangleData0768.coefficient52_312,
    output := OriginalRow227TriangleData0781.coefficient53_312, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_314, Icur := OriginalRow227TriangleData0768.coefficient52_313,
    output := OriginalRow227TriangleData0781.coefficient53_313, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_315, Icur := OriginalRow227TriangleData0768.coefficient52_314,
    output := OriginalRow227TriangleData0781.coefficient53_314, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_316, Icur := OriginalRow227TriangleData0768.coefficient52_315,
    output := OriginalRow227TriangleData0781.coefficient53_315, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_317, Icur := OriginalRow227TriangleData0768.coefficient52_316,
    output := OriginalRow227TriangleData0781.coefficient53_316, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_318, Icur := OriginalRow227TriangleData0768.coefficient52_317,
    output := OriginalRow227TriangleData0781.coefficient53_317, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_319, Icur := OriginalRow227TriangleData0768.coefficient52_318,
    output := OriginalRow227TriangleData0781.coefficient53_318, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_320, Icur := OriginalRow227TriangleData0768.coefficient52_319,
    output := OriginalRow227TriangleData0781.coefficient53_319, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_321, Icur := OriginalRow227TriangleData0768.coefficient52_320,
    output := OriginalRow227TriangleData0781.coefficient53_320, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_322, Icur := OriginalRow227TriangleData0768.coefficient52_321,
    output := OriginalRow227TriangleData0781.coefficient53_321, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_323, Icur := OriginalRow227TriangleData0768.coefficient52_322,
    output := OriginalRow227TriangleData0781.coefficient53_322, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_324, Icur := OriginalRow227TriangleData0768.coefficient52_323,
    output := OriginalRow227TriangleData0781.coefficient53_323, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_325, Icur := OriginalRow227TriangleData0768.coefficient52_324,
    output := OriginalRow227TriangleData0781.coefficient53_324, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_326, Icur := OriginalRow227TriangleData0768.coefficient52_325,
    output := OriginalRow227TriangleData0781.coefficient53_325, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_327, Icur := OriginalRow227TriangleData0768.coefficient52_326,
    output := OriginalRow227TriangleData0781.coefficient53_326, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_328, Icur := OriginalRow227TriangleData0768.coefficient52_327,
    output := OriginalRow227TriangleData0781.coefficient53_327, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_329, Icur := OriginalRow227TriangleData0768.coefficient52_328,
    output := OriginalRow227TriangleData0781.coefficient53_328, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_330, Icur := OriginalRow227TriangleData0768.coefficient52_329,
    output := OriginalRow227TriangleData0781.coefficient53_329, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_331, Icur := OriginalRow227TriangleData0768.coefficient52_330,
    output := OriginalRow227TriangleData0781.coefficient53_330, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_332, Icur := OriginalRow227TriangleData0768.coefficient52_331,
    output := OriginalRow227TriangleData0781.coefficient53_331, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_333, Icur := OriginalRow227TriangleData0768.coefficient52_332,
    output := OriginalRow227TriangleData0781.coefficient53_332, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_334, Icur := OriginalRow227TriangleData0768.coefficient52_333,
    output := OriginalRow227TriangleData0781.coefficient53_333, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_335, Icur := OriginalRow227TriangleData0768.coefficient52_334,
    output := OriginalRow227TriangleData0781.coefficient53_334, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_336, Icur := OriginalRow227TriangleData0768.coefficient52_335,
    output := OriginalRow227TriangleData0781.coefficient53_335, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_337, Icur := OriginalRow227TriangleData0768.coefficient52_336,
    output := OriginalRow227TriangleData0781.coefficient53_336, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0768.coefficient52_338, Icur := OriginalRow227TriangleData0768.coefficient52_337,
    output := OriginalRow227TriangleData0781.coefficient53_337, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0769.coefficient52_339, Icur := OriginalRow227TriangleData0768.coefficient52_338,
    output := OriginalRow227TriangleData0781.coefficient53_338, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0769.coefficient52_340, Icur := OriginalRow227TriangleData0769.coefficient52_339,
    output := OriginalRow227TriangleData0781.coefficient53_339, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0765

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0765.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

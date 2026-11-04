import Grothe.UpperChaos.OriginalRow227TriangleData0306
import Grothe.UpperChaos.OriginalRow227TriangleData0307
import Grothe.UpperChaos.OriginalRow227TriangleData0321
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0305
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_308, Icur := OriginalRow227TriangleData0306.coefficient19_307,
    output := OriginalRow227TriangleData0321.coefficient20_307, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_309, Icur := OriginalRow227TriangleData0306.coefficient19_308,
    output := OriginalRow227TriangleData0321.coefficient20_308, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_310, Icur := OriginalRow227TriangleData0306.coefficient19_309,
    output := OriginalRow227TriangleData0321.coefficient20_309, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_311, Icur := OriginalRow227TriangleData0306.coefficient19_310,
    output := OriginalRow227TriangleData0321.coefficient20_310, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_312, Icur := OriginalRow227TriangleData0306.coefficient19_311,
    output := OriginalRow227TriangleData0321.coefficient20_311, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_313, Icur := OriginalRow227TriangleData0306.coefficient19_312,
    output := OriginalRow227TriangleData0321.coefficient20_312, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_314, Icur := OriginalRow227TriangleData0306.coefficient19_313,
    output := OriginalRow227TriangleData0321.coefficient20_313, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_315, Icur := OriginalRow227TriangleData0306.coefficient19_314,
    output := OriginalRow227TriangleData0321.coefficient20_314, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_316, Icur := OriginalRow227TriangleData0306.coefficient19_315,
    output := OriginalRow227TriangleData0321.coefficient20_315, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_317, Icur := OriginalRow227TriangleData0306.coefficient19_316,
    output := OriginalRow227TriangleData0321.coefficient20_316, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_318, Icur := OriginalRow227TriangleData0306.coefficient19_317,
    output := OriginalRow227TriangleData0321.coefficient20_317, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_319, Icur := OriginalRow227TriangleData0306.coefficient19_318,
    output := OriginalRow227TriangleData0321.coefficient20_318, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_320, Icur := OriginalRow227TriangleData0306.coefficient19_319,
    output := OriginalRow227TriangleData0321.coefficient20_319, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_321, Icur := OriginalRow227TriangleData0306.coefficient19_320,
    output := OriginalRow227TriangleData0321.coefficient20_320, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_322, Icur := OriginalRow227TriangleData0306.coefficient19_321,
    output := OriginalRow227TriangleData0321.coefficient20_321, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_323, Icur := OriginalRow227TriangleData0306.coefficient19_322,
    output := OriginalRow227TriangleData0321.coefficient20_322, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_324, Icur := OriginalRow227TriangleData0306.coefficient19_323,
    output := OriginalRow227TriangleData0321.coefficient20_323, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_325, Icur := OriginalRow227TriangleData0306.coefficient19_324,
    output := OriginalRow227TriangleData0321.coefficient20_324, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_326, Icur := OriginalRow227TriangleData0306.coefficient19_325,
    output := OriginalRow227TriangleData0321.coefficient20_325, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_327, Icur := OriginalRow227TriangleData0306.coefficient19_326,
    output := OriginalRow227TriangleData0321.coefficient20_326, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_328, Icur := OriginalRow227TriangleData0306.coefficient19_327,
    output := OriginalRow227TriangleData0321.coefficient20_327, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_329, Icur := OriginalRow227TriangleData0306.coefficient19_328,
    output := OriginalRow227TriangleData0321.coefficient20_328, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_330, Icur := OriginalRow227TriangleData0306.coefficient19_329,
    output := OriginalRow227TriangleData0321.coefficient20_329, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_331, Icur := OriginalRow227TriangleData0306.coefficient19_330,
    output := OriginalRow227TriangleData0321.coefficient20_330, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_332, Icur := OriginalRow227TriangleData0306.coefficient19_331,
    output := OriginalRow227TriangleData0321.coefficient20_331, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_333, Icur := OriginalRow227TriangleData0306.coefficient19_332,
    output := OriginalRow227TriangleData0321.coefficient20_332, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_334, Icur := OriginalRow227TriangleData0306.coefficient19_333,
    output := OriginalRow227TriangleData0321.coefficient20_333, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_335, Icur := OriginalRow227TriangleData0306.coefficient19_334,
    output := OriginalRow227TriangleData0321.coefficient20_334, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_336, Icur := OriginalRow227TriangleData0306.coefficient19_335,
    output := OriginalRow227TriangleData0321.coefficient20_335, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_337, Icur := OriginalRow227TriangleData0306.coefficient19_336,
    output := OriginalRow227TriangleData0321.coefficient20_336, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0307.coefficient19_338, Icur := OriginalRow227TriangleData0306.coefficient19_337,
    output := OriginalRow227TriangleData0321.coefficient20_337, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0307.coefficient19_339, Icur := OriginalRow227TriangleData0307.coefficient19_338,
    output := OriginalRow227TriangleData0321.coefficient20_338, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0305

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0305.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

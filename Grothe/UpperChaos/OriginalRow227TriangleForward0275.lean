import Grothe.UpperChaos.OriginalRow227TriangleData0276
import Grothe.UpperChaos.OriginalRow227TriangleData0277
import Grothe.UpperChaos.OriginalRow227TriangleData0291
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0275
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_306, Icur := OriginalRow227TriangleData0276.coefficient17_305,
    output := OriginalRow227TriangleData0291.coefficient18_305, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_307, Icur := OriginalRow227TriangleData0276.coefficient17_306,
    output := OriginalRow227TriangleData0291.coefficient18_306, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_308, Icur := OriginalRow227TriangleData0276.coefficient17_307,
    output := OriginalRow227TriangleData0291.coefficient18_307, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_309, Icur := OriginalRow227TriangleData0276.coefficient17_308,
    output := OriginalRow227TriangleData0291.coefficient18_308, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_310, Icur := OriginalRow227TriangleData0276.coefficient17_309,
    output := OriginalRow227TriangleData0291.coefficient18_309, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_311, Icur := OriginalRow227TriangleData0276.coefficient17_310,
    output := OriginalRow227TriangleData0291.coefficient18_310, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_312, Icur := OriginalRow227TriangleData0276.coefficient17_311,
    output := OriginalRow227TriangleData0291.coefficient18_311, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_313, Icur := OriginalRow227TriangleData0276.coefficient17_312,
    output := OriginalRow227TriangleData0291.coefficient18_312, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_314, Icur := OriginalRow227TriangleData0276.coefficient17_313,
    output := OriginalRow227TriangleData0291.coefficient18_313, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_315, Icur := OriginalRow227TriangleData0276.coefficient17_314,
    output := OriginalRow227TriangleData0291.coefficient18_314, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_316, Icur := OriginalRow227TriangleData0276.coefficient17_315,
    output := OriginalRow227TriangleData0291.coefficient18_315, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_317, Icur := OriginalRow227TriangleData0276.coefficient17_316,
    output := OriginalRow227TriangleData0291.coefficient18_316, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_318, Icur := OriginalRow227TriangleData0276.coefficient17_317,
    output := OriginalRow227TriangleData0291.coefficient18_317, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_319, Icur := OriginalRow227TriangleData0276.coefficient17_318,
    output := OriginalRow227TriangleData0291.coefficient18_318, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_320, Icur := OriginalRow227TriangleData0276.coefficient17_319,
    output := OriginalRow227TriangleData0291.coefficient18_319, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_321, Icur := OriginalRow227TriangleData0276.coefficient17_320,
    output := OriginalRow227TriangleData0291.coefficient18_320, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_322, Icur := OriginalRow227TriangleData0276.coefficient17_321,
    output := OriginalRow227TriangleData0291.coefficient18_321, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_323, Icur := OriginalRow227TriangleData0276.coefficient17_322,
    output := OriginalRow227TriangleData0291.coefficient18_322, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_324, Icur := OriginalRow227TriangleData0276.coefficient17_323,
    output := OriginalRow227TriangleData0291.coefficient18_323, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_325, Icur := OriginalRow227TriangleData0276.coefficient17_324,
    output := OriginalRow227TriangleData0291.coefficient18_324, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_326, Icur := OriginalRow227TriangleData0276.coefficient17_325,
    output := OriginalRow227TriangleData0291.coefficient18_325, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_327, Icur := OriginalRow227TriangleData0276.coefficient17_326,
    output := OriginalRow227TriangleData0291.coefficient18_326, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_328, Icur := OriginalRow227TriangleData0276.coefficient17_327,
    output := OriginalRow227TriangleData0291.coefficient18_327, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_329, Icur := OriginalRow227TriangleData0276.coefficient17_328,
    output := OriginalRow227TriangleData0291.coefficient18_328, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_330, Icur := OriginalRow227TriangleData0276.coefficient17_329,
    output := OriginalRow227TriangleData0291.coefficient18_329, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_331, Icur := OriginalRow227TriangleData0276.coefficient17_330,
    output := OriginalRow227TriangleData0291.coefficient18_330, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_332, Icur := OriginalRow227TriangleData0276.coefficient17_331,
    output := OriginalRow227TriangleData0291.coefficient18_331, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_333, Icur := OriginalRow227TriangleData0276.coefficient17_332,
    output := OriginalRow227TriangleData0291.coefficient18_332, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_334, Icur := OriginalRow227TriangleData0276.coefficient17_333,
    output := OriginalRow227TriangleData0291.coefficient18_333, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0276.coefficient17_335, Icur := OriginalRow227TriangleData0276.coefficient17_334,
    output := OriginalRow227TriangleData0291.coefficient18_334, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0277.coefficient17_336, Icur := OriginalRow227TriangleData0276.coefficient17_335,
    output := OriginalRow227TriangleData0291.coefficient18_335, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0277.coefficient17_337, Icur := OriginalRow227TriangleData0277.coefficient17_336,
    output := OriginalRow227TriangleData0291.coefficient18_336, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0275

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0275.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

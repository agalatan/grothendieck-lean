import Grothe.UpperChaos.OriginalRow227TriangleData0623
import Grothe.UpperChaos.OriginalRow227TriangleData0624
import Grothe.UpperChaos.OriginalRow227TriangleData0637
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0621
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_330, Icur := OriginalRow227TriangleData0623.coefficient41_329,
    output := OriginalRow227TriangleData0637.coefficient42_329, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_331, Icur := OriginalRow227TriangleData0623.coefficient41_330,
    output := OriginalRow227TriangleData0637.coefficient42_330, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_332, Icur := OriginalRow227TriangleData0623.coefficient41_331,
    output := OriginalRow227TriangleData0637.coefficient42_331, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_333, Icur := OriginalRow227TriangleData0623.coefficient41_332,
    output := OriginalRow227TriangleData0637.coefficient42_332, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_334, Icur := OriginalRow227TriangleData0623.coefficient41_333,
    output := OriginalRow227TriangleData0637.coefficient42_333, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_335, Icur := OriginalRow227TriangleData0623.coefficient41_334,
    output := OriginalRow227TriangleData0637.coefficient42_334, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_336, Icur := OriginalRow227TriangleData0623.coefficient41_335,
    output := OriginalRow227TriangleData0637.coefficient42_335, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_337, Icur := OriginalRow227TriangleData0623.coefficient41_336,
    output := OriginalRow227TriangleData0637.coefficient42_336, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_338, Icur := OriginalRow227TriangleData0623.coefficient41_337,
    output := OriginalRow227TriangleData0637.coefficient42_337, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_339, Icur := OriginalRow227TriangleData0623.coefficient41_338,
    output := OriginalRow227TriangleData0637.coefficient42_338, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_340, Icur := OriginalRow227TriangleData0623.coefficient41_339,
    output := OriginalRow227TriangleData0637.coefficient42_339, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_341, Icur := OriginalRow227TriangleData0623.coefficient41_340,
    output := OriginalRow227TriangleData0637.coefficient42_340, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_342, Icur := OriginalRow227TriangleData0623.coefficient41_341,
    output := OriginalRow227TriangleData0637.coefficient42_341, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_343, Icur := OriginalRow227TriangleData0623.coefficient41_342,
    output := OriginalRow227TriangleData0637.coefficient42_342, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_344, Icur := OriginalRow227TriangleData0623.coefficient41_343,
    output := OriginalRow227TriangleData0637.coefficient42_343, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_345, Icur := OriginalRow227TriangleData0623.coefficient41_344,
    output := OriginalRow227TriangleData0637.coefficient42_344, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_346, Icur := OriginalRow227TriangleData0623.coefficient41_345,
    output := OriginalRow227TriangleData0637.coefficient42_345, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_347, Icur := OriginalRow227TriangleData0623.coefficient41_346,
    output := OriginalRow227TriangleData0637.coefficient42_346, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_348, Icur := OriginalRow227TriangleData0623.coefficient41_347,
    output := OriginalRow227TriangleData0637.coefficient42_347, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_349, Icur := OriginalRow227TriangleData0623.coefficient41_348,
    output := OriginalRow227TriangleData0637.coefficient42_348, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_350, Icur := OriginalRow227TriangleData0623.coefficient41_349,
    output := OriginalRow227TriangleData0637.coefficient42_349, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_351, Icur := OriginalRow227TriangleData0623.coefficient41_350,
    output := OriginalRow227TriangleData0637.coefficient42_350, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_352, Icur := OriginalRow227TriangleData0623.coefficient41_351,
    output := OriginalRow227TriangleData0637.coefficient42_351, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_353, Icur := OriginalRow227TriangleData0623.coefficient41_352,
    output := OriginalRow227TriangleData0637.coefficient42_352, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_354, Icur := OriginalRow227TriangleData0623.coefficient41_353,
    output := OriginalRow227TriangleData0637.coefficient42_353, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_355, Icur := OriginalRow227TriangleData0623.coefficient41_354,
    output := OriginalRow227TriangleData0637.coefficient42_354, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_356, Icur := OriginalRow227TriangleData0623.coefficient41_355,
    output := OriginalRow227TriangleData0637.coefficient42_355, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_357, Icur := OriginalRow227TriangleData0623.coefficient41_356,
    output := OriginalRow227TriangleData0637.coefficient42_356, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_358, Icur := OriginalRow227TriangleData0623.coefficient41_357,
    output := OriginalRow227TriangleData0637.coefficient42_357, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0623.coefficient41_359, Icur := OriginalRow227TriangleData0623.coefficient41_358,
    output := OriginalRow227TriangleData0637.coefficient42_358, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_360, Icur := OriginalRow227TriangleData0623.coefficient41_359,
    output := OriginalRow227TriangleData0637.coefficient42_359, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0624.coefficient41_361, Icur := OriginalRow227TriangleData0624.coefficient41_360,
    output := OriginalRow227TriangleData0637.coefficient42_360, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0621

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0621.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

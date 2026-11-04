import Grothe.UpperChaos.OriginalRow227TriangleData0595
import Grothe.UpperChaos.OriginalRow227TriangleData0596
import Grothe.UpperChaos.OriginalRow227TriangleData0609
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0593
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_328, Icur := OriginalRow227TriangleData0595.coefficient39_327,
    output := OriginalRow227TriangleData0609.coefficient40_327, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_329, Icur := OriginalRow227TriangleData0595.coefficient39_328,
    output := OriginalRow227TriangleData0609.coefficient40_328, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_330, Icur := OriginalRow227TriangleData0595.coefficient39_329,
    output := OriginalRow227TriangleData0609.coefficient40_329, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_331, Icur := OriginalRow227TriangleData0595.coefficient39_330,
    output := OriginalRow227TriangleData0609.coefficient40_330, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_332, Icur := OriginalRow227TriangleData0595.coefficient39_331,
    output := OriginalRow227TriangleData0609.coefficient40_331, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_333, Icur := OriginalRow227TriangleData0595.coefficient39_332,
    output := OriginalRow227TriangleData0609.coefficient40_332, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_334, Icur := OriginalRow227TriangleData0595.coefficient39_333,
    output := OriginalRow227TriangleData0609.coefficient40_333, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_335, Icur := OriginalRow227TriangleData0595.coefficient39_334,
    output := OriginalRow227TriangleData0609.coefficient40_334, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_336, Icur := OriginalRow227TriangleData0595.coefficient39_335,
    output := OriginalRow227TriangleData0609.coefficient40_335, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_337, Icur := OriginalRow227TriangleData0595.coefficient39_336,
    output := OriginalRow227TriangleData0609.coefficient40_336, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_338, Icur := OriginalRow227TriangleData0595.coefficient39_337,
    output := OriginalRow227TriangleData0609.coefficient40_337, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_339, Icur := OriginalRow227TriangleData0595.coefficient39_338,
    output := OriginalRow227TriangleData0609.coefficient40_338, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_340, Icur := OriginalRow227TriangleData0595.coefficient39_339,
    output := OriginalRow227TriangleData0609.coefficient40_339, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_341, Icur := OriginalRow227TriangleData0595.coefficient39_340,
    output := OriginalRow227TriangleData0609.coefficient40_340, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_342, Icur := OriginalRow227TriangleData0595.coefficient39_341,
    output := OriginalRow227TriangleData0609.coefficient40_341, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_343, Icur := OriginalRow227TriangleData0595.coefficient39_342,
    output := OriginalRow227TriangleData0609.coefficient40_342, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_344, Icur := OriginalRow227TriangleData0595.coefficient39_343,
    output := OriginalRow227TriangleData0609.coefficient40_343, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_345, Icur := OriginalRow227TriangleData0595.coefficient39_344,
    output := OriginalRow227TriangleData0609.coefficient40_344, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_346, Icur := OriginalRow227TriangleData0595.coefficient39_345,
    output := OriginalRow227TriangleData0609.coefficient40_345, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_347, Icur := OriginalRow227TriangleData0595.coefficient39_346,
    output := OriginalRow227TriangleData0609.coefficient40_346, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_348, Icur := OriginalRow227TriangleData0595.coefficient39_347,
    output := OriginalRow227TriangleData0609.coefficient40_347, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_349, Icur := OriginalRow227TriangleData0595.coefficient39_348,
    output := OriginalRow227TriangleData0609.coefficient40_348, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_350, Icur := OriginalRow227TriangleData0595.coefficient39_349,
    output := OriginalRow227TriangleData0609.coefficient40_349, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_351, Icur := OriginalRow227TriangleData0595.coefficient39_350,
    output := OriginalRow227TriangleData0609.coefficient40_350, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_352, Icur := OriginalRow227TriangleData0595.coefficient39_351,
    output := OriginalRow227TriangleData0609.coefficient40_351, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_353, Icur := OriginalRow227TriangleData0595.coefficient39_352,
    output := OriginalRow227TriangleData0609.coefficient40_352, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_354, Icur := OriginalRow227TriangleData0595.coefficient39_353,
    output := OriginalRow227TriangleData0609.coefficient40_353, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_355, Icur := OriginalRow227TriangleData0595.coefficient39_354,
    output := OriginalRow227TriangleData0609.coefficient40_354, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_356, Icur := OriginalRow227TriangleData0595.coefficient39_355,
    output := OriginalRow227TriangleData0609.coefficient40_355, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0595.coefficient39_357, Icur := OriginalRow227TriangleData0595.coefficient39_356,
    output := OriginalRow227TriangleData0609.coefficient40_356, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0596.coefficient39_358, Icur := OriginalRow227TriangleData0595.coefficient39_357,
    output := OriginalRow227TriangleData0609.coefficient40_357, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0596.coefficient39_359, Icur := OriginalRow227TriangleData0596.coefficient39_358,
    output := OriginalRow227TriangleData0609.coefficient40_358, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0593

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0593.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

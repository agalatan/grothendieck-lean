import Grothe.UpperChaos.OriginalRow227TriangleData0511
import Grothe.UpperChaos.OriginalRow227TriangleData0512
import Grothe.UpperChaos.OriginalRow227TriangleData0525
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0509
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_322, Icur := OriginalRow227TriangleData0511.coefficient33_321,
    output := OriginalRow227TriangleData0525.coefficient34_321, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_323, Icur := OriginalRow227TriangleData0511.coefficient33_322,
    output := OriginalRow227TriangleData0525.coefficient34_322, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_324, Icur := OriginalRow227TriangleData0511.coefficient33_323,
    output := OriginalRow227TriangleData0525.coefficient34_323, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_325, Icur := OriginalRow227TriangleData0511.coefficient33_324,
    output := OriginalRow227TriangleData0525.coefficient34_324, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_326, Icur := OriginalRow227TriangleData0511.coefficient33_325,
    output := OriginalRow227TriangleData0525.coefficient34_325, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_327, Icur := OriginalRow227TriangleData0511.coefficient33_326,
    output := OriginalRow227TriangleData0525.coefficient34_326, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_328, Icur := OriginalRow227TriangleData0511.coefficient33_327,
    output := OriginalRow227TriangleData0525.coefficient34_327, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_329, Icur := OriginalRow227TriangleData0511.coefficient33_328,
    output := OriginalRow227TriangleData0525.coefficient34_328, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_330, Icur := OriginalRow227TriangleData0511.coefficient33_329,
    output := OriginalRow227TriangleData0525.coefficient34_329, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_331, Icur := OriginalRow227TriangleData0511.coefficient33_330,
    output := OriginalRow227TriangleData0525.coefficient34_330, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_332, Icur := OriginalRow227TriangleData0511.coefficient33_331,
    output := OriginalRow227TriangleData0525.coefficient34_331, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_333, Icur := OriginalRow227TriangleData0511.coefficient33_332,
    output := OriginalRow227TriangleData0525.coefficient34_332, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_334, Icur := OriginalRow227TriangleData0511.coefficient33_333,
    output := OriginalRow227TriangleData0525.coefficient34_333, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_335, Icur := OriginalRow227TriangleData0511.coefficient33_334,
    output := OriginalRow227TriangleData0525.coefficient34_334, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_336, Icur := OriginalRow227TriangleData0511.coefficient33_335,
    output := OriginalRow227TriangleData0525.coefficient34_335, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_337, Icur := OriginalRow227TriangleData0511.coefficient33_336,
    output := OriginalRow227TriangleData0525.coefficient34_336, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_338, Icur := OriginalRow227TriangleData0511.coefficient33_337,
    output := OriginalRow227TriangleData0525.coefficient34_337, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_339, Icur := OriginalRow227TriangleData0511.coefficient33_338,
    output := OriginalRow227TriangleData0525.coefficient34_338, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_340, Icur := OriginalRow227TriangleData0511.coefficient33_339,
    output := OriginalRow227TriangleData0525.coefficient34_339, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_341, Icur := OriginalRow227TriangleData0511.coefficient33_340,
    output := OriginalRow227TriangleData0525.coefficient34_340, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_342, Icur := OriginalRow227TriangleData0511.coefficient33_341,
    output := OriginalRow227TriangleData0525.coefficient34_341, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_343, Icur := OriginalRow227TriangleData0511.coefficient33_342,
    output := OriginalRow227TriangleData0525.coefficient34_342, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_344, Icur := OriginalRow227TriangleData0511.coefficient33_343,
    output := OriginalRow227TriangleData0525.coefficient34_343, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_345, Icur := OriginalRow227TriangleData0511.coefficient33_344,
    output := OriginalRow227TriangleData0525.coefficient34_344, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_346, Icur := OriginalRow227TriangleData0511.coefficient33_345,
    output := OriginalRow227TriangleData0525.coefficient34_345, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_347, Icur := OriginalRow227TriangleData0511.coefficient33_346,
    output := OriginalRow227TriangleData0525.coefficient34_346, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_348, Icur := OriginalRow227TriangleData0511.coefficient33_347,
    output := OriginalRow227TriangleData0525.coefficient34_347, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_349, Icur := OriginalRow227TriangleData0511.coefficient33_348,
    output := OriginalRow227TriangleData0525.coefficient34_348, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_350, Icur := OriginalRow227TriangleData0511.coefficient33_349,
    output := OriginalRow227TriangleData0525.coefficient34_349, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0511.coefficient33_351, Icur := OriginalRow227TriangleData0511.coefficient33_350,
    output := OriginalRow227TriangleData0525.coefficient34_350, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0512.coefficient33_352, Icur := OriginalRow227TriangleData0511.coefficient33_351,
    output := OriginalRow227TriangleData0525.coefficient34_351, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0512.coefficient33_353, Icur := OriginalRow227TriangleData0512.coefficient33_352,
    output := OriginalRow227TriangleData0525.coefficient34_352, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0509

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0509.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

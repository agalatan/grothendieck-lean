import Grothe.UpperChaos.OriginalRow227TriangleData1622
import Grothe.UpperChaos.OriginalRow227TriangleData1623
import Grothe.UpperChaos.OriginalRow227TriangleData1630
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1614
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_327, Icur := OriginalRow227TriangleData1622.coefficient134_326,
    output := OriginalRow227TriangleData1630.coefficient135_326, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_328, Icur := OriginalRow227TriangleData1622.coefficient134_327,
    output := OriginalRow227TriangleData1630.coefficient135_327, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_329, Icur := OriginalRow227TriangleData1622.coefficient134_328,
    output := OriginalRow227TriangleData1630.coefficient135_328, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_330, Icur := OriginalRow227TriangleData1622.coefficient134_329,
    output := OriginalRow227TriangleData1630.coefficient135_329, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_331, Icur := OriginalRow227TriangleData1622.coefficient134_330,
    output := OriginalRow227TriangleData1630.coefficient135_330, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_332, Icur := OriginalRow227TriangleData1622.coefficient134_331,
    output := OriginalRow227TriangleData1630.coefficient135_331, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_333, Icur := OriginalRow227TriangleData1622.coefficient134_332,
    output := OriginalRow227TriangleData1630.coefficient135_332, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_334, Icur := OriginalRow227TriangleData1622.coefficient134_333,
    output := OriginalRow227TriangleData1630.coefficient135_333, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_335, Icur := OriginalRow227TriangleData1622.coefficient134_334,
    output := OriginalRow227TriangleData1630.coefficient135_334, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_336, Icur := OriginalRow227TriangleData1622.coefficient134_335,
    output := OriginalRow227TriangleData1630.coefficient135_335, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_337, Icur := OriginalRow227TriangleData1622.coefficient134_336,
    output := OriginalRow227TriangleData1630.coefficient135_336, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_338, Icur := OriginalRow227TriangleData1622.coefficient134_337,
    output := OriginalRow227TriangleData1630.coefficient135_337, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_339, Icur := OriginalRow227TriangleData1622.coefficient134_338,
    output := OriginalRow227TriangleData1630.coefficient135_338, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_340, Icur := OriginalRow227TriangleData1622.coefficient134_339,
    output := OriginalRow227TriangleData1630.coefficient135_339, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_341, Icur := OriginalRow227TriangleData1622.coefficient134_340,
    output := OriginalRow227TriangleData1630.coefficient135_340, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_342, Icur := OriginalRow227TriangleData1622.coefficient134_341,
    output := OriginalRow227TriangleData1630.coefficient135_341, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_343, Icur := OriginalRow227TriangleData1622.coefficient134_342,
    output := OriginalRow227TriangleData1630.coefficient135_342, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_344, Icur := OriginalRow227TriangleData1622.coefficient134_343,
    output := OriginalRow227TriangleData1630.coefficient135_343, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_345, Icur := OriginalRow227TriangleData1622.coefficient134_344,
    output := OriginalRow227TriangleData1630.coefficient135_344, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_346, Icur := OriginalRow227TriangleData1622.coefficient134_345,
    output := OriginalRow227TriangleData1630.coefficient135_345, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_347, Icur := OriginalRow227TriangleData1622.coefficient134_346,
    output := OriginalRow227TriangleData1630.coefficient135_346, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_348, Icur := OriginalRow227TriangleData1622.coefficient134_347,
    output := OriginalRow227TriangleData1630.coefficient135_347, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_349, Icur := OriginalRow227TriangleData1622.coefficient134_348,
    output := OriginalRow227TriangleData1630.coefficient135_348, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_350, Icur := OriginalRow227TriangleData1622.coefficient134_349,
    output := OriginalRow227TriangleData1630.coefficient135_349, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_351, Icur := OriginalRow227TriangleData1622.coefficient134_350,
    output := OriginalRow227TriangleData1630.coefficient135_350, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_352, Icur := OriginalRow227TriangleData1622.coefficient134_351,
    output := OriginalRow227TriangleData1630.coefficient135_351, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_353, Icur := OriginalRow227TriangleData1622.coefficient134_352,
    output := OriginalRow227TriangleData1630.coefficient135_352, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_354, Icur := OriginalRow227TriangleData1622.coefficient134_353,
    output := OriginalRow227TriangleData1630.coefficient135_353, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_355, Icur := OriginalRow227TriangleData1622.coefficient134_354,
    output := OriginalRow227TriangleData1630.coefficient135_354, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1622.coefficient134_356, Icur := OriginalRow227TriangleData1622.coefficient134_355,
    output := OriginalRow227TriangleData1630.coefficient135_355, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1623.coefficient134_357, Icur := OriginalRow227TriangleData1622.coefficient134_356,
    output := OriginalRow227TriangleData1630.coefficient135_356, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1623.coefficient134_358, Icur := OriginalRow227TriangleData1623.coefficient134_357,
    output := OriginalRow227TriangleData1630.coefficient135_357, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1614

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1614.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData0909
import Grothe.UpperChaos.OriginalRow227TriangleData0910
import Grothe.UpperChaos.OriginalRow227TriangleData0921
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0905
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_352, Icur := OriginalRow227TriangleData0909.coefficient63_351,
    output := OriginalRow227TriangleData0921.coefficient64_351, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_353, Icur := OriginalRow227TriangleData0909.coefficient63_352,
    output := OriginalRow227TriangleData0921.coefficient64_352, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_354, Icur := OriginalRow227TriangleData0909.coefficient63_353,
    output := OriginalRow227TriangleData0921.coefficient64_353, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_355, Icur := OriginalRow227TriangleData0909.coefficient63_354,
    output := OriginalRow227TriangleData0921.coefficient64_354, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_356, Icur := OriginalRow227TriangleData0909.coefficient63_355,
    output := OriginalRow227TriangleData0921.coefficient64_355, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_357, Icur := OriginalRow227TriangleData0909.coefficient63_356,
    output := OriginalRow227TriangleData0921.coefficient64_356, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_358, Icur := OriginalRow227TriangleData0909.coefficient63_357,
    output := OriginalRow227TriangleData0921.coefficient64_357, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_359, Icur := OriginalRow227TriangleData0909.coefficient63_358,
    output := OriginalRow227TriangleData0921.coefficient64_358, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_360, Icur := OriginalRow227TriangleData0909.coefficient63_359,
    output := OriginalRow227TriangleData0921.coefficient64_359, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_361, Icur := OriginalRow227TriangleData0909.coefficient63_360,
    output := OriginalRow227TriangleData0921.coefficient64_360, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_362, Icur := OriginalRow227TriangleData0909.coefficient63_361,
    output := OriginalRow227TriangleData0921.coefficient64_361, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_363, Icur := OriginalRow227TriangleData0909.coefficient63_362,
    output := OriginalRow227TriangleData0921.coefficient64_362, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_364, Icur := OriginalRow227TriangleData0909.coefficient63_363,
    output := OriginalRow227TriangleData0921.coefficient64_363, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_365, Icur := OriginalRow227TriangleData0909.coefficient63_364,
    output := OriginalRow227TriangleData0921.coefficient64_364, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_366, Icur := OriginalRow227TriangleData0909.coefficient63_365,
    output := OriginalRow227TriangleData0921.coefficient64_365, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_367, Icur := OriginalRow227TriangleData0909.coefficient63_366,
    output := OriginalRow227TriangleData0921.coefficient64_366, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_368, Icur := OriginalRow227TriangleData0909.coefficient63_367,
    output := OriginalRow227TriangleData0921.coefficient64_367, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_369, Icur := OriginalRow227TriangleData0909.coefficient63_368,
    output := OriginalRow227TriangleData0921.coefficient64_368, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_370, Icur := OriginalRow227TriangleData0909.coefficient63_369,
    output := OriginalRow227TriangleData0921.coefficient64_369, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_371, Icur := OriginalRow227TriangleData0909.coefficient63_370,
    output := OriginalRow227TriangleData0921.coefficient64_370, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_372, Icur := OriginalRow227TriangleData0909.coefficient63_371,
    output := OriginalRow227TriangleData0921.coefficient64_371, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_373, Icur := OriginalRow227TriangleData0909.coefficient63_372,
    output := OriginalRow227TriangleData0921.coefficient64_372, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_374, Icur := OriginalRow227TriangleData0909.coefficient63_373,
    output := OriginalRow227TriangleData0921.coefficient64_373, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_375, Icur := OriginalRow227TriangleData0909.coefficient63_374,
    output := OriginalRow227TriangleData0921.coefficient64_374, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_376, Icur := OriginalRow227TriangleData0909.coefficient63_375,
    output := OriginalRow227TriangleData0921.coefficient64_375, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_377, Icur := OriginalRow227TriangleData0909.coefficient63_376,
    output := OriginalRow227TriangleData0921.coefficient64_376, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_378, Icur := OriginalRow227TriangleData0909.coefficient63_377,
    output := OriginalRow227TriangleData0921.coefficient64_377, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_379, Icur := OriginalRow227TriangleData0909.coefficient63_378,
    output := OriginalRow227TriangleData0921.coefficient64_378, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_380, Icur := OriginalRow227TriangleData0909.coefficient63_379,
    output := OriginalRow227TriangleData0921.coefficient64_379, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0909.coefficient63_381, Icur := OriginalRow227TriangleData0909.coefficient63_380,
    output := OriginalRow227TriangleData0921.coefficient64_380, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0910.coefficient63_382, Icur := OriginalRow227TriangleData0909.coefficient63_381,
    output := OriginalRow227TriangleData0921.coefficient64_381, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots01.root64,
    Inext := OriginalRow227TriangleData0910.coefficient63_383, Icur := OriginalRow227TriangleData0910.coefficient63_382,
    output := OriginalRow227TriangleData0921.coefficient64_382, hC := OriginalRow227TriangleRoots01.root64_pos, hAC := OriginalRow227TriangleRoots01.product64_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0905

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0905.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

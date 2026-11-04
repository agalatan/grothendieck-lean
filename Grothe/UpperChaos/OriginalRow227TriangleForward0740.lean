import Grothe.UpperChaos.OriginalRow227TriangleData0743
import Grothe.UpperChaos.OriginalRow227TriangleData0744
import Grothe.UpperChaos.OriginalRow227TriangleData0756
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0740
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_339, Icur := OriginalRow227TriangleData0743.coefficient50_338,
    output := OriginalRow227TriangleData0756.coefficient51_338, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_340, Icur := OriginalRow227TriangleData0743.coefficient50_339,
    output := OriginalRow227TriangleData0756.coefficient51_339, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_341, Icur := OriginalRow227TriangleData0743.coefficient50_340,
    output := OriginalRow227TriangleData0756.coefficient51_340, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_342, Icur := OriginalRow227TriangleData0743.coefficient50_341,
    output := OriginalRow227TriangleData0756.coefficient51_341, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_343, Icur := OriginalRow227TriangleData0743.coefficient50_342,
    output := OriginalRow227TriangleData0756.coefficient51_342, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_344, Icur := OriginalRow227TriangleData0743.coefficient50_343,
    output := OriginalRow227TriangleData0756.coefficient51_343, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_345, Icur := OriginalRow227TriangleData0743.coefficient50_344,
    output := OriginalRow227TriangleData0756.coefficient51_344, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_346, Icur := OriginalRow227TriangleData0743.coefficient50_345,
    output := OriginalRow227TriangleData0756.coefficient51_345, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_347, Icur := OriginalRow227TriangleData0743.coefficient50_346,
    output := OriginalRow227TriangleData0756.coefficient51_346, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_348, Icur := OriginalRow227TriangleData0743.coefficient50_347,
    output := OriginalRow227TriangleData0756.coefficient51_347, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_349, Icur := OriginalRow227TriangleData0743.coefficient50_348,
    output := OriginalRow227TriangleData0756.coefficient51_348, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_350, Icur := OriginalRow227TriangleData0743.coefficient50_349,
    output := OriginalRow227TriangleData0756.coefficient51_349, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_351, Icur := OriginalRow227TriangleData0743.coefficient50_350,
    output := OriginalRow227TriangleData0756.coefficient51_350, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_352, Icur := OriginalRow227TriangleData0743.coefficient50_351,
    output := OriginalRow227TriangleData0756.coefficient51_351, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots11.root353, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_353, Icur := OriginalRow227TriangleData0743.coefficient50_352,
    output := OriginalRow227TriangleData0756.coefficient51_352, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots11.root354, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_354, Icur := OriginalRow227TriangleData0743.coefficient50_353,
    output := OriginalRow227TriangleData0756.coefficient51_353, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots11.root355, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_355, Icur := OriginalRow227TriangleData0743.coefficient50_354,
    output := OriginalRow227TriangleData0756.coefficient51_354, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots11.root356, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_356, Icur := OriginalRow227TriangleData0743.coefficient50_355,
    output := OriginalRow227TriangleData0756.coefficient51_355, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots11.root357, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_357, Icur := OriginalRow227TriangleData0743.coefficient50_356,
    output := OriginalRow227TriangleData0756.coefficient51_356, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots11.root358, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_358, Icur := OriginalRow227TriangleData0743.coefficient50_357,
    output := OriginalRow227TriangleData0756.coefficient51_357, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots11.root359, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_359, Icur := OriginalRow227TriangleData0743.coefficient50_358,
    output := OriginalRow227TriangleData0756.coefficient51_358, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots11.root360, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_360, Icur := OriginalRow227TriangleData0743.coefficient50_359,
    output := OriginalRow227TriangleData0756.coefficient51_359, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots11.root361, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_361, Icur := OriginalRow227TriangleData0743.coefficient50_360,
    output := OriginalRow227TriangleData0756.coefficient51_360, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_362, Icur := OriginalRow227TriangleData0743.coefficient50_361,
    output := OriginalRow227TriangleData0756.coefficient51_361, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_363, Icur := OriginalRow227TriangleData0743.coefficient50_362,
    output := OriginalRow227TriangleData0756.coefficient51_362, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_364, Icur := OriginalRow227TriangleData0743.coefficient50_363,
    output := OriginalRow227TriangleData0756.coefficient51_363, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_365, Icur := OriginalRow227TriangleData0743.coefficient50_364,
    output := OriginalRow227TriangleData0756.coefficient51_364, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_366, Icur := OriginalRow227TriangleData0743.coefficient50_365,
    output := OriginalRow227TriangleData0756.coefficient51_365, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_367, Icur := OriginalRow227TriangleData0743.coefficient50_366,
    output := OriginalRow227TriangleData0756.coefficient51_366, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0743.coefficient50_368, Icur := OriginalRow227TriangleData0743.coefficient50_367,
    output := OriginalRow227TriangleData0756.coefficient51_367, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_369, Icur := OriginalRow227TriangleData0743.coefficient50_368,
    output := OriginalRow227TriangleData0756.coefficient51_368, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0744.coefficient50_370, Icur := OriginalRow227TriangleData0744.coefficient50_369,
    output := OriginalRow227TriangleData0756.coefficient51_369, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0740

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0740.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

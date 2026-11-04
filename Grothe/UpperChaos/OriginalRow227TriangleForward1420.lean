import Grothe.UpperChaos.OriginalRow227TriangleData1427
import Grothe.UpperChaos.OriginalRow227TriangleData1436
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1420
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_368, Icur := OriginalRow227TriangleData1427.coefficient111_367,
    output := OriginalRow227TriangleData1436.coefficient112_367, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_369, Icur := OriginalRow227TriangleData1427.coefficient111_368,
    output := OriginalRow227TriangleData1436.coefficient112_368, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_370, Icur := OriginalRow227TriangleData1427.coefficient111_369,
    output := OriginalRow227TriangleData1436.coefficient112_369, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_371, Icur := OriginalRow227TriangleData1427.coefficient111_370,
    output := OriginalRow227TriangleData1436.coefficient112_370, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_372, Icur := OriginalRow227TriangleData1427.coefficient111_371,
    output := OriginalRow227TriangleData1436.coefficient112_371, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_373, Icur := OriginalRow227TriangleData1427.coefficient111_372,
    output := OriginalRow227TriangleData1436.coefficient112_372, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_374, Icur := OriginalRow227TriangleData1427.coefficient111_373,
    output := OriginalRow227TriangleData1436.coefficient112_373, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_375, Icur := OriginalRow227TriangleData1427.coefficient111_374,
    output := OriginalRow227TriangleData1436.coefficient112_374, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_376, Icur := OriginalRow227TriangleData1427.coefficient111_375,
    output := OriginalRow227TriangleData1436.coefficient112_375, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_377, Icur := OriginalRow227TriangleData1427.coefficient111_376,
    output := OriginalRow227TriangleData1436.coefficient112_376, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_378, Icur := OriginalRow227TriangleData1427.coefficient111_377,
    output := OriginalRow227TriangleData1436.coefficient112_377, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_379, Icur := OriginalRow227TriangleData1427.coefficient111_378,
    output := OriginalRow227TriangleData1436.coefficient112_378, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_380, Icur := OriginalRow227TriangleData1427.coefficient111_379,
    output := OriginalRow227TriangleData1436.coefficient112_379, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_381, Icur := OriginalRow227TriangleData1427.coefficient111_380,
    output := OriginalRow227TriangleData1436.coefficient112_380, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_382, Icur := OriginalRow227TriangleData1427.coefficient111_381,
    output := OriginalRow227TriangleData1436.coefficient112_381, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_383, Icur := OriginalRow227TriangleData1427.coefficient111_382,
    output := OriginalRow227TriangleData1436.coefficient112_382, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_384, Icur := OriginalRow227TriangleData1427.coefficient111_383,
    output := OriginalRow227TriangleData1436.coefficient112_383, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_385, Icur := OriginalRow227TriangleData1427.coefficient111_384,
    output := OriginalRow227TriangleData1436.coefficient112_384, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_386, Icur := OriginalRow227TriangleData1427.coefficient111_385,
    output := OriginalRow227TriangleData1436.coefficient112_385, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_387, Icur := OriginalRow227TriangleData1427.coefficient111_386,
    output := OriginalRow227TriangleData1436.coefficient112_386, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_388, Icur := OriginalRow227TriangleData1427.coefficient111_387,
    output := OriginalRow227TriangleData1436.coefficient112_387, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_389, Icur := OriginalRow227TriangleData1427.coefficient111_388,
    output := OriginalRow227TriangleData1436.coefficient112_388, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots03.root112,
    Inext := OriginalRow227TriangleData1427.coefficient111_390, Icur := OriginalRow227TriangleData1427.coefficient111_389,
    output := OriginalRow227TriangleData1436.coefficient112_389, hC := OriginalRow227TriangleRoots03.root112_pos, hAC := OriginalRow227TriangleRoots03.product112_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1420

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1420.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

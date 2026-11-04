import Grothe.UpperChaos.OriginalRow227TriangleData1098
import Grothe.UpperChaos.OriginalRow227TriangleData1099
import Grothe.UpperChaos.OriginalRow227TriangleData1109
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots11
import Grothe.UpperChaos.OriginalRow227TriangleRoots12
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1093
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_368, Icur := OriginalRow227TriangleData1098.coefficient79_367,
    output := OriginalRow227TriangleData1109.coefficient80_367, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_369, Icur := OriginalRow227TriangleData1098.coefficient79_368,
    output := OriginalRow227TriangleData1109.coefficient80_368, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_370, Icur := OriginalRow227TriangleData1098.coefficient79_369,
    output := OriginalRow227TriangleData1109.coefficient80_369, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_371, Icur := OriginalRow227TriangleData1098.coefficient79_370,
    output := OriginalRow227TriangleData1109.coefficient80_370, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_372, Icur := OriginalRow227TriangleData1098.coefficient79_371,
    output := OriginalRow227TriangleData1109.coefficient80_371, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_373, Icur := OriginalRow227TriangleData1098.coefficient79_372,
    output := OriginalRow227TriangleData1109.coefficient80_372, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_374, Icur := OriginalRow227TriangleData1098.coefficient79_373,
    output := OriginalRow227TriangleData1109.coefficient80_373, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_375, Icur := OriginalRow227TriangleData1098.coefficient79_374,
    output := OriginalRow227TriangleData1109.coefficient80_374, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_376, Icur := OriginalRow227TriangleData1098.coefficient79_375,
    output := OriginalRow227TriangleData1109.coefficient80_375, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_377, Icur := OriginalRow227TriangleData1098.coefficient79_376,
    output := OriginalRow227TriangleData1109.coefficient80_376, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_378, Icur := OriginalRow227TriangleData1098.coefficient79_377,
    output := OriginalRow227TriangleData1109.coefficient80_377, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_379, Icur := OriginalRow227TriangleData1098.coefficient79_378,
    output := OriginalRow227TriangleData1109.coefficient80_378, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_380, Icur := OriginalRow227TriangleData1098.coefficient79_379,
    output := OriginalRow227TriangleData1109.coefficient80_379, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_381, Icur := OriginalRow227TriangleData1098.coefficient79_380,
    output := OriginalRow227TriangleData1109.coefficient80_380, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_382, Icur := OriginalRow227TriangleData1098.coefficient79_381,
    output := OriginalRow227TriangleData1109.coefficient80_381, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_383, Icur := OriginalRow227TriangleData1098.coefficient79_382,
    output := OriginalRow227TriangleData1109.coefficient80_382, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_384, Icur := OriginalRow227TriangleData1098.coefficient79_383,
    output := OriginalRow227TriangleData1109.coefficient80_383, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_385, Icur := OriginalRow227TriangleData1098.coefficient79_384,
    output := OriginalRow227TriangleData1109.coefficient80_384, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_386, Icur := OriginalRow227TriangleData1098.coefficient79_385,
    output := OriginalRow227TriangleData1109.coefficient80_385, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_387, Icur := OriginalRow227TriangleData1098.coefficient79_386,
    output := OriginalRow227TriangleData1109.coefficient80_386, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_388, Icur := OriginalRow227TriangleData1098.coefficient79_387,
    output := OriginalRow227TriangleData1109.coefficient80_387, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_389, Icur := OriginalRow227TriangleData1098.coefficient79_388,
    output := OriginalRow227TriangleData1109.coefficient80_388, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_390, Icur := OriginalRow227TriangleData1098.coefficient79_389,
    output := OriginalRow227TriangleData1109.coefficient80_389, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_391, Icur := OriginalRow227TriangleData1098.coefficient79_390,
    output := OriginalRow227TriangleData1109.coefficient80_390, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_392, Icur := OriginalRow227TriangleData1098.coefficient79_391,
    output := OriginalRow227TriangleData1109.coefficient80_391, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_393, Icur := OriginalRow227TriangleData1098.coefficient79_392,
    output := OriginalRow227TriangleData1109.coefficient80_392, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots12.root394, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_394, Icur := OriginalRow227TriangleData1098.coefficient79_393,
    output := OriginalRow227TriangleData1109.coefficient80_393, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots12.root395, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_395, Icur := OriginalRow227TriangleData1098.coefficient79_394,
    output := OriginalRow227TriangleData1109.coefficient80_394, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots12.root396, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_396, Icur := OriginalRow227TriangleData1098.coefficient79_395,
    output := OriginalRow227TriangleData1109.coefficient80_395, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots12.root397, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1098.coefficient79_397, Icur := OriginalRow227TriangleData1098.coefficient79_396,
    output := OriginalRow227TriangleData1109.coefficient80_396, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots12.root398, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_398, Icur := OriginalRow227TriangleData1098.coefficient79_397,
    output := OriginalRow227TriangleData1109.coefficient80_397, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots12.root399, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1099.coefficient79_399, Icur := OriginalRow227TriangleData1099.coefficient79_398,
    output := OriginalRow227TriangleData1109.coefficient80_398, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1093

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1093.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

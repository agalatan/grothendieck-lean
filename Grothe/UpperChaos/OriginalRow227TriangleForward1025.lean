import Grothe.UpperChaos.OriginalRow227TriangleData1029
import Grothe.UpperChaos.OriginalRow227TriangleData1030
import Grothe.UpperChaos.OriginalRow227TriangleData1041
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1025
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots11.root362, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_362, Icur := OriginalRow227TriangleData1029.coefficient73_361,
    output := OriginalRow227TriangleData1041.coefficient74_361, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots11.root363, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_363, Icur := OriginalRow227TriangleData1029.coefficient73_362,
    output := OriginalRow227TriangleData1041.coefficient74_362, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots11.root364, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_364, Icur := OriginalRow227TriangleData1029.coefficient73_363,
    output := OriginalRow227TriangleData1041.coefficient74_363, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots11.root365, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_365, Icur := OriginalRow227TriangleData1029.coefficient73_364,
    output := OriginalRow227TriangleData1041.coefficient74_364, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots11.root366, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_366, Icur := OriginalRow227TriangleData1029.coefficient73_365,
    output := OriginalRow227TriangleData1041.coefficient74_365, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots11.root367, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_367, Icur := OriginalRow227TriangleData1029.coefficient73_366,
    output := OriginalRow227TriangleData1041.coefficient74_366, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots11.root368, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_368, Icur := OriginalRow227TriangleData1029.coefficient73_367,
    output := OriginalRow227TriangleData1041.coefficient74_367, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots11.root369, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_369, Icur := OriginalRow227TriangleData1029.coefficient73_368,
    output := OriginalRow227TriangleData1041.coefficient74_368, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots11.root370, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_370, Icur := OriginalRow227TriangleData1029.coefficient73_369,
    output := OriginalRow227TriangleData1041.coefficient74_369, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots11.root371, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_371, Icur := OriginalRow227TriangleData1029.coefficient73_370,
    output := OriginalRow227TriangleData1041.coefficient74_370, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots11.root372, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_372, Icur := OriginalRow227TriangleData1029.coefficient73_371,
    output := OriginalRow227TriangleData1041.coefficient74_371, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots11.root373, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_373, Icur := OriginalRow227TriangleData1029.coefficient73_372,
    output := OriginalRow227TriangleData1041.coefficient74_372, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots11.root374, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_374, Icur := OriginalRow227TriangleData1029.coefficient73_373,
    output := OriginalRow227TriangleData1041.coefficient74_373, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots11.root375, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_375, Icur := OriginalRow227TriangleData1029.coefficient73_374,
    output := OriginalRow227TriangleData1041.coefficient74_374, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots11.root376, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_376, Icur := OriginalRow227TriangleData1029.coefficient73_375,
    output := OriginalRow227TriangleData1041.coefficient74_375, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots11.root377, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_377, Icur := OriginalRow227TriangleData1029.coefficient73_376,
    output := OriginalRow227TriangleData1041.coefficient74_376, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots11.root378, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_378, Icur := OriginalRow227TriangleData1029.coefficient73_377,
    output := OriginalRow227TriangleData1041.coefficient74_377, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots11.root379, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_379, Icur := OriginalRow227TriangleData1029.coefficient73_378,
    output := OriginalRow227TriangleData1041.coefficient74_378, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots11.root380, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_380, Icur := OriginalRow227TriangleData1029.coefficient73_379,
    output := OriginalRow227TriangleData1041.coefficient74_379, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots11.root381, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_381, Icur := OriginalRow227TriangleData1029.coefficient73_380,
    output := OriginalRow227TriangleData1041.coefficient74_380, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots11.root382, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_382, Icur := OriginalRow227TriangleData1029.coefficient73_381,
    output := OriginalRow227TriangleData1041.coefficient74_381, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots11.root383, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_383, Icur := OriginalRow227TriangleData1029.coefficient73_382,
    output := OriginalRow227TriangleData1041.coefficient74_382, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots11.root384, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_384, Icur := OriginalRow227TriangleData1029.coefficient73_383,
    output := OriginalRow227TriangleData1041.coefficient74_383, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots12.root385, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_385, Icur := OriginalRow227TriangleData1029.coefficient73_384,
    output := OriginalRow227TriangleData1041.coefficient74_384, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots12.root386, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_386, Icur := OriginalRow227TriangleData1029.coefficient73_385,
    output := OriginalRow227TriangleData1041.coefficient74_385, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots12.root387, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_387, Icur := OriginalRow227TriangleData1029.coefficient73_386,
    output := OriginalRow227TriangleData1041.coefficient74_386, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots12.root388, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_388, Icur := OriginalRow227TriangleData1029.coefficient73_387,
    output := OriginalRow227TriangleData1041.coefficient74_387, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots12.root389, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_389, Icur := OriginalRow227TriangleData1029.coefficient73_388,
    output := OriginalRow227TriangleData1041.coefficient74_388, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots12.root390, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_390, Icur := OriginalRow227TriangleData1029.coefficient73_389,
    output := OriginalRow227TriangleData1041.coefficient74_389, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots12.root391, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1029.coefficient73_391, Icur := OriginalRow227TriangleData1029.coefficient73_390,
    output := OriginalRow227TriangleData1041.coefficient74_390, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots12.root392, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1030.coefficient73_392, Icur := OriginalRow227TriangleData1029.coefficient73_391,
    output := OriginalRow227TriangleData1041.coefficient74_391, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots12.root393, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1030.coefficient73_393, Icur := OriginalRow227TriangleData1030.coefficient73_392,
    output := OriginalRow227TriangleData1041.coefficient74_392, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1025

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1025.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

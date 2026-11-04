import Grothe.UpperChaos.OriginalRow227TriangleData0681
import Grothe.UpperChaos.OriginalRow227TriangleData0694
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleRoots14
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0678
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_430, Icur := OriginalRow227TriangleData0681.coefficient45_429,
    output := OriginalRow227TriangleData0694.coefficient46_429, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_431, Icur := OriginalRow227TriangleData0681.coefficient45_430,
    output := OriginalRow227TriangleData0694.coefficient46_430, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_432, Icur := OriginalRow227TriangleData0681.coefficient45_431,
    output := OriginalRow227TriangleData0694.coefficient46_431, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_433, Icur := OriginalRow227TriangleData0681.coefficient45_432,
    output := OriginalRow227TriangleData0694.coefficient46_432, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_434, Icur := OriginalRow227TriangleData0681.coefficient45_433,
    output := OriginalRow227TriangleData0694.coefficient46_433, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_435, Icur := OriginalRow227TriangleData0681.coefficient45_434,
    output := OriginalRow227TriangleData0694.coefficient46_434, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_436, Icur := OriginalRow227TriangleData0681.coefficient45_435,
    output := OriginalRow227TriangleData0694.coefficient46_435, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_437, Icur := OriginalRow227TriangleData0681.coefficient45_436,
    output := OriginalRow227TriangleData0694.coefficient46_436, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_438, Icur := OriginalRow227TriangleData0681.coefficient45_437,
    output := OriginalRow227TriangleData0694.coefficient46_437, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_439, Icur := OriginalRow227TriangleData0681.coefficient45_438,
    output := OriginalRow227TriangleData0694.coefficient46_438, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_440, Icur := OriginalRow227TriangleData0681.coefficient45_439,
    output := OriginalRow227TriangleData0694.coefficient46_439, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_441, Icur := OriginalRow227TriangleData0681.coefficient45_440,
    output := OriginalRow227TriangleData0694.coefficient46_440, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_442, Icur := OriginalRow227TriangleData0681.coefficient45_441,
    output := OriginalRow227TriangleData0694.coefficient46_441, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_443, Icur := OriginalRow227TriangleData0681.coefficient45_442,
    output := OriginalRow227TriangleData0694.coefficient46_442, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_444, Icur := OriginalRow227TriangleData0681.coefficient45_443,
    output := OriginalRow227TriangleData0694.coefficient46_443, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_445, Icur := OriginalRow227TriangleData0681.coefficient45_444,
    output := OriginalRow227TriangleData0694.coefficient46_444, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_446, Icur := OriginalRow227TriangleData0681.coefficient45_445,
    output := OriginalRow227TriangleData0694.coefficient46_445, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_447, Icur := OriginalRow227TriangleData0681.coefficient45_446,
    output := OriginalRow227TriangleData0694.coefficient46_446, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_448, Icur := OriginalRow227TriangleData0681.coefficient45_447,
    output := OriginalRow227TriangleData0694.coefficient46_447, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_449, Icur := OriginalRow227TriangleData0681.coefficient45_448,
    output := OriginalRow227TriangleData0694.coefficient46_448, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_450, Icur := OriginalRow227TriangleData0681.coefficient45_449,
    output := OriginalRow227TriangleData0694.coefficient46_449, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_451, Icur := OriginalRow227TriangleData0681.coefficient45_450,
    output := OriginalRow227TriangleData0694.coefficient46_450, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_452, Icur := OriginalRow227TriangleData0681.coefficient45_451,
    output := OriginalRow227TriangleData0694.coefficient46_451, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_453, Icur := OriginalRow227TriangleData0681.coefficient45_452,
    output := OriginalRow227TriangleData0694.coefficient46_452, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_454, Icur := OriginalRow227TriangleData0681.coefficient45_453,
    output := OriginalRow227TriangleData0694.coefficient46_453, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_455, Icur := OriginalRow227TriangleData0681.coefficient45_454,
    output := OriginalRow227TriangleData0694.coefficient46_454, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots01.root46,
    Inext := OriginalRow227TriangleData0681.coefficient45_456, Icur := OriginalRow227TriangleData0681.coefficient45_455,
    output := OriginalRow227TriangleData0694.coefficient46_455, hC := OriginalRow227TriangleRoots01.root46_pos, hAC := OriginalRow227TriangleRoots01.product46_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0678

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0678.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

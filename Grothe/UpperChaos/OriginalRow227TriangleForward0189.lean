import Grothe.UpperChaos.OriginalRow227TriangleData0189
import Grothe.UpperChaos.OriginalRow227TriangleData0190
import Grothe.UpperChaos.OriginalRow227TriangleData0205
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleRoots14
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0189
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 417, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_428, Icur := OriginalRow227TriangleData0189.coefficient11_427,
    output := OriginalRow227TriangleData0205.coefficient12_427, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 418, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_429, Icur := OriginalRow227TriangleData0189.coefficient11_428,
    output := OriginalRow227TriangleData0205.coefficient12_428, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 419, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_430, Icur := OriginalRow227TriangleData0189.coefficient11_429,
    output := OriginalRow227TriangleData0205.coefficient12_429, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 420, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_431, Icur := OriginalRow227TriangleData0189.coefficient11_430,
    output := OriginalRow227TriangleData0205.coefficient12_430, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 421, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_432, Icur := OriginalRow227TriangleData0189.coefficient11_431,
    output := OriginalRow227TriangleData0205.coefficient12_431, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 422, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_433, Icur := OriginalRow227TriangleData0189.coefficient11_432,
    output := OriginalRow227TriangleData0205.coefficient12_432, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 423, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_434, Icur := OriginalRow227TriangleData0189.coefficient11_433,
    output := OriginalRow227TriangleData0205.coefficient12_433, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 424, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_435, Icur := OriginalRow227TriangleData0189.coefficient11_434,
    output := OriginalRow227TriangleData0205.coefficient12_434, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 425, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_436, Icur := OriginalRow227TriangleData0189.coefficient11_435,
    output := OriginalRow227TriangleData0205.coefficient12_435, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 426, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_437, Icur := OriginalRow227TriangleData0189.coefficient11_436,
    output := OriginalRow227TriangleData0205.coefficient12_436, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 427, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_438, Icur := OriginalRow227TriangleData0189.coefficient11_437,
    output := OriginalRow227TriangleData0205.coefficient12_437, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 428, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_439, Icur := OriginalRow227TriangleData0189.coefficient11_438,
    output := OriginalRow227TriangleData0205.coefficient12_438, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 429, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_440, Icur := OriginalRow227TriangleData0189.coefficient11_439,
    output := OriginalRow227TriangleData0205.coefficient12_439, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 430, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_441, Icur := OriginalRow227TriangleData0189.coefficient11_440,
    output := OriginalRow227TriangleData0205.coefficient12_440, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 431, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_442, Icur := OriginalRow227TriangleData0189.coefficient11_441,
    output := OriginalRow227TriangleData0205.coefficient12_441, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 432, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_443, Icur := OriginalRow227TriangleData0189.coefficient11_442,
    output := OriginalRow227TriangleData0205.coefficient12_442, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 433, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_444, Icur := OriginalRow227TriangleData0189.coefficient11_443,
    output := OriginalRow227TriangleData0205.coefficient12_443, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 434, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_445, Icur := OriginalRow227TriangleData0189.coefficient11_444,
    output := OriginalRow227TriangleData0205.coefficient12_444, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 435, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_446, Icur := OriginalRow227TriangleData0189.coefficient11_445,
    output := OriginalRow227TriangleData0205.coefficient12_445, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 436, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_447, Icur := OriginalRow227TriangleData0189.coefficient11_446,
    output := OriginalRow227TriangleData0205.coefficient12_446, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 437, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_448, Icur := OriginalRow227TriangleData0189.coefficient11_447,
    output := OriginalRow227TriangleData0205.coefficient12_447, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 438, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_449, Icur := OriginalRow227TriangleData0189.coefficient11_448,
    output := OriginalRow227TriangleData0205.coefficient12_448, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 439, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_450, Icur := OriginalRow227TriangleData0189.coefficient11_449,
    output := OriginalRow227TriangleData0205.coefficient12_449, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 440, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_451, Icur := OriginalRow227TriangleData0189.coefficient11_450,
    output := OriginalRow227TriangleData0205.coefficient12_450, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 441, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_452, Icur := OriginalRow227TriangleData0189.coefficient11_451,
    output := OriginalRow227TriangleData0205.coefficient12_451, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 442, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_453, Icur := OriginalRow227TriangleData0189.coefficient11_452,
    output := OriginalRow227TriangleData0205.coefficient12_452, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 443, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_454, Icur := OriginalRow227TriangleData0189.coefficient11_453,
    output := OriginalRow227TriangleData0205.coefficient12_453, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 444, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_455, Icur := OriginalRow227TriangleData0189.coefficient11_454,
    output := OriginalRow227TriangleData0205.coefficient12_454, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 445, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_456, Icur := OriginalRow227TriangleData0189.coefficient11_455,
    output := OriginalRow227TriangleData0205.coefficient12_455, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 446, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0189.coefficient11_457, Icur := OriginalRow227TriangleData0189.coefficient11_456,
    output := OriginalRow227TriangleData0205.coefficient12_456, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 447, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0190.coefficient11_458, Icur := OriginalRow227TriangleData0189.coefficient11_457,
    output := OriginalRow227TriangleData0205.coefficient12_457, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos },
  { charge := 448, IA := shift, ID := OriginalRow227TriangleRoots14.root459, IC := OriginalRow227TriangleRoots00.root12,
    Inext := OriginalRow227TriangleData0190.coefficient11_459, Icur := OriginalRow227TriangleData0190.coefficient11_458,
    output := OriginalRow227TriangleData0205.coefficient12_458, hC := OriginalRow227TriangleRoots00.root12_pos, hAC := OriginalRow227TriangleRoots00.product12_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0189

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0189.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

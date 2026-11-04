import Grothe.UpperChaos.OriginalRow227TriangleData0654
import Grothe.UpperChaos.OriginalRow227TriangleData0655
import Grothe.UpperChaos.OriginalRow227TriangleData0668
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0652
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_428, Icur := OriginalRow227TriangleData0654.coefficient43_427,
    output := OriginalRow227TriangleData0668.coefficient44_427, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_429, Icur := OriginalRow227TriangleData0654.coefficient43_428,
    output := OriginalRow227TriangleData0668.coefficient44_428, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_430, Icur := OriginalRow227TriangleData0654.coefficient43_429,
    output := OriginalRow227TriangleData0668.coefficient44_429, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_431, Icur := OriginalRow227TriangleData0654.coefficient43_430,
    output := OriginalRow227TriangleData0668.coefficient44_430, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_432, Icur := OriginalRow227TriangleData0654.coefficient43_431,
    output := OriginalRow227TriangleData0668.coefficient44_431, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_433, Icur := OriginalRow227TriangleData0654.coefficient43_432,
    output := OriginalRow227TriangleData0668.coefficient44_432, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_434, Icur := OriginalRow227TriangleData0654.coefficient43_433,
    output := OriginalRow227TriangleData0668.coefficient44_433, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_435, Icur := OriginalRow227TriangleData0654.coefficient43_434,
    output := OriginalRow227TriangleData0668.coefficient44_434, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_436, Icur := OriginalRow227TriangleData0654.coefficient43_435,
    output := OriginalRow227TriangleData0668.coefficient44_435, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_437, Icur := OriginalRow227TriangleData0654.coefficient43_436,
    output := OriginalRow227TriangleData0668.coefficient44_436, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_438, Icur := OriginalRow227TriangleData0654.coefficient43_437,
    output := OriginalRow227TriangleData0668.coefficient44_437, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_439, Icur := OriginalRow227TriangleData0654.coefficient43_438,
    output := OriginalRow227TriangleData0668.coefficient44_438, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_440, Icur := OriginalRow227TriangleData0654.coefficient43_439,
    output := OriginalRow227TriangleData0668.coefficient44_439, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_441, Icur := OriginalRow227TriangleData0654.coefficient43_440,
    output := OriginalRow227TriangleData0668.coefficient44_440, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_442, Icur := OriginalRow227TriangleData0654.coefficient43_441,
    output := OriginalRow227TriangleData0668.coefficient44_441, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_443, Icur := OriginalRow227TriangleData0654.coefficient43_442,
    output := OriginalRow227TriangleData0668.coefficient44_442, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_444, Icur := OriginalRow227TriangleData0654.coefficient43_443,
    output := OriginalRow227TriangleData0668.coefficient44_443, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_445, Icur := OriginalRow227TriangleData0654.coefficient43_444,
    output := OriginalRow227TriangleData0668.coefficient44_444, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_446, Icur := OriginalRow227TriangleData0654.coefficient43_445,
    output := OriginalRow227TriangleData0668.coefficient44_445, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_447, Icur := OriginalRow227TriangleData0654.coefficient43_446,
    output := OriginalRow227TriangleData0668.coefficient44_446, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_448, Icur := OriginalRow227TriangleData0654.coefficient43_447,
    output := OriginalRow227TriangleData0668.coefficient44_447, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_449, Icur := OriginalRow227TriangleData0654.coefficient43_448,
    output := OriginalRow227TriangleData0668.coefficient44_448, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_450, Icur := OriginalRow227TriangleData0654.coefficient43_449,
    output := OriginalRow227TriangleData0668.coefficient44_449, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_451, Icur := OriginalRow227TriangleData0654.coefficient43_450,
    output := OriginalRow227TriangleData0668.coefficient44_450, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_452, Icur := OriginalRow227TriangleData0654.coefficient43_451,
    output := OriginalRow227TriangleData0668.coefficient44_451, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_453, Icur := OriginalRow227TriangleData0654.coefficient43_452,
    output := OriginalRow227TriangleData0668.coefficient44_452, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_454, Icur := OriginalRow227TriangleData0654.coefficient43_453,
    output := OriginalRow227TriangleData0668.coefficient44_453, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_455, Icur := OriginalRow227TriangleData0654.coefficient43_454,
    output := OriginalRow227TriangleData0668.coefficient44_454, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_456, Icur := OriginalRow227TriangleData0654.coefficient43_455,
    output := OriginalRow227TriangleData0668.coefficient44_455, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0654.coefficient43_457, Icur := OriginalRow227TriangleData0654.coefficient43_456,
    output := OriginalRow227TriangleData0668.coefficient44_456, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0655.coefficient43_458, Icur := OriginalRow227TriangleData0654.coefficient43_457,
    output := OriginalRow227TriangleData0668.coefficient44_457, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0652

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0652.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

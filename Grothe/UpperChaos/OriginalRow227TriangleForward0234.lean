import Grothe.UpperChaos.OriginalRow227TriangleData0235
import Grothe.UpperChaos.OriginalRow227TriangleData0236
import Grothe.UpperChaos.OriginalRow227TriangleData0250
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0234
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 417, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_431, Icur := OriginalRow227TriangleData0235.coefficient14_430,
    output := OriginalRow227TriangleData0250.coefficient15_430, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 418, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_432, Icur := OriginalRow227TriangleData0235.coefficient14_431,
    output := OriginalRow227TriangleData0250.coefficient15_431, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 419, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_433, Icur := OriginalRow227TriangleData0235.coefficient14_432,
    output := OriginalRow227TriangleData0250.coefficient15_432, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 420, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_434, Icur := OriginalRow227TriangleData0235.coefficient14_433,
    output := OriginalRow227TriangleData0250.coefficient15_433, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 421, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_435, Icur := OriginalRow227TriangleData0235.coefficient14_434,
    output := OriginalRow227TriangleData0250.coefficient15_434, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 422, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_436, Icur := OriginalRow227TriangleData0235.coefficient14_435,
    output := OriginalRow227TriangleData0250.coefficient15_435, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 423, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_437, Icur := OriginalRow227TriangleData0235.coefficient14_436,
    output := OriginalRow227TriangleData0250.coefficient15_436, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 424, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_438, Icur := OriginalRow227TriangleData0235.coefficient14_437,
    output := OriginalRow227TriangleData0250.coefficient15_437, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 425, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_439, Icur := OriginalRow227TriangleData0235.coefficient14_438,
    output := OriginalRow227TriangleData0250.coefficient15_438, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 426, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_440, Icur := OriginalRow227TriangleData0235.coefficient14_439,
    output := OriginalRow227TriangleData0250.coefficient15_439, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 427, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_441, Icur := OriginalRow227TriangleData0235.coefficient14_440,
    output := OriginalRow227TriangleData0250.coefficient15_440, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 428, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_442, Icur := OriginalRow227TriangleData0235.coefficient14_441,
    output := OriginalRow227TriangleData0250.coefficient15_441, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 429, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_443, Icur := OriginalRow227TriangleData0235.coefficient14_442,
    output := OriginalRow227TriangleData0250.coefficient15_442, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 430, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_444, Icur := OriginalRow227TriangleData0235.coefficient14_443,
    output := OriginalRow227TriangleData0250.coefficient15_443, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 431, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_445, Icur := OriginalRow227TriangleData0235.coefficient14_444,
    output := OriginalRow227TriangleData0250.coefficient15_444, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 432, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_446, Icur := OriginalRow227TriangleData0235.coefficient14_445,
    output := OriginalRow227TriangleData0250.coefficient15_445, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 433, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_447, Icur := OriginalRow227TriangleData0235.coefficient14_446,
    output := OriginalRow227TriangleData0250.coefficient15_446, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 434, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_448, Icur := OriginalRow227TriangleData0235.coefficient14_447,
    output := OriginalRow227TriangleData0250.coefficient15_447, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 435, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_449, Icur := OriginalRow227TriangleData0235.coefficient14_448,
    output := OriginalRow227TriangleData0250.coefficient15_448, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 436, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_450, Icur := OriginalRow227TriangleData0235.coefficient14_449,
    output := OriginalRow227TriangleData0250.coefficient15_449, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 437, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_451, Icur := OriginalRow227TriangleData0235.coefficient14_450,
    output := OriginalRow227TriangleData0250.coefficient15_450, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 438, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_452, Icur := OriginalRow227TriangleData0235.coefficient14_451,
    output := OriginalRow227TriangleData0250.coefficient15_451, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 439, IA := shift, ID := OriginalRow227TriangleRoots14.root453, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_453, Icur := OriginalRow227TriangleData0235.coefficient14_452,
    output := OriginalRow227TriangleData0250.coefficient15_452, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 440, IA := shift, ID := OriginalRow227TriangleRoots14.root454, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_454, Icur := OriginalRow227TriangleData0235.coefficient14_453,
    output := OriginalRow227TriangleData0250.coefficient15_453, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 441, IA := shift, ID := OriginalRow227TriangleRoots14.root455, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_455, Icur := OriginalRow227TriangleData0235.coefficient14_454,
    output := OriginalRow227TriangleData0250.coefficient15_454, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 442, IA := shift, ID := OriginalRow227TriangleRoots14.root456, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_456, Icur := OriginalRow227TriangleData0235.coefficient14_455,
    output := OriginalRow227TriangleData0250.coefficient15_455, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 443, IA := shift, ID := OriginalRow227TriangleRoots14.root457, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_457, Icur := OriginalRow227TriangleData0235.coefficient14_456,
    output := OriginalRow227TriangleData0250.coefficient15_456, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 444, IA := shift, ID := OriginalRow227TriangleRoots14.root458, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_458, Icur := OriginalRow227TriangleData0235.coefficient14_457,
    output := OriginalRow227TriangleData0250.coefficient15_457, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 445, IA := shift, ID := OriginalRow227TriangleRoots14.root459, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_459, Icur := OriginalRow227TriangleData0235.coefficient14_458,
    output := OriginalRow227TriangleData0250.coefficient15_458, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 446, IA := shift, ID := OriginalRow227TriangleRoots14.root460, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0235.coefficient14_460, Icur := OriginalRow227TriangleData0235.coefficient14_459,
    output := OriginalRow227TriangleData0250.coefficient15_459, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 447, IA := shift, ID := OriginalRow227TriangleRoots14.root461, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_461, Icur := OriginalRow227TriangleData0235.coefficient14_460,
    output := OriginalRow227TriangleData0250.coefficient15_460, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos },
  { charge := 448, IA := shift, ID := OriginalRow227TriangleRoots14.root462, IC := OriginalRow227TriangleRoots00.root15,
    Inext := OriginalRow227TriangleData0236.coefficient14_462, Icur := OriginalRow227TriangleData0236.coefficient14_461,
    output := OriginalRow227TriangleData0250.coefficient15_461, hC := OriginalRow227TriangleRoots00.root15_pos, hAC := OriginalRow227TriangleRoots00.product15_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0234

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0234.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

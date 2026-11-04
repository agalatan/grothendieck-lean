import Grothe.UpperChaos.OriginalRow227TriangleData0556
import Grothe.UpperChaos.OriginalRow227TriangleData0557
import Grothe.UpperChaos.OriginalRow227TriangleData0570
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0554
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_421, Icur := OriginalRow227TriangleData0556.coefficient36_420,
    output := OriginalRow227TriangleData0570.coefficient37_420, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_422, Icur := OriginalRow227TriangleData0556.coefficient36_421,
    output := OriginalRow227TriangleData0570.coefficient37_421, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_423, Icur := OriginalRow227TriangleData0556.coefficient36_422,
    output := OriginalRow227TriangleData0570.coefficient37_422, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_424, Icur := OriginalRow227TriangleData0556.coefficient36_423,
    output := OriginalRow227TriangleData0570.coefficient37_423, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_425, Icur := OriginalRow227TriangleData0556.coefficient36_424,
    output := OriginalRow227TriangleData0570.coefficient37_424, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_426, Icur := OriginalRow227TriangleData0556.coefficient36_425,
    output := OriginalRow227TriangleData0570.coefficient37_425, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_427, Icur := OriginalRow227TriangleData0556.coefficient36_426,
    output := OriginalRow227TriangleData0570.coefficient37_426, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_428, Icur := OriginalRow227TriangleData0556.coefficient36_427,
    output := OriginalRow227TriangleData0570.coefficient37_427, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_429, Icur := OriginalRow227TriangleData0556.coefficient36_428,
    output := OriginalRow227TriangleData0570.coefficient37_428, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_430, Icur := OriginalRow227TriangleData0556.coefficient36_429,
    output := OriginalRow227TriangleData0570.coefficient37_429, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_431, Icur := OriginalRow227TriangleData0556.coefficient36_430,
    output := OriginalRow227TriangleData0570.coefficient37_430, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 396, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_432, Icur := OriginalRow227TriangleData0556.coefficient36_431,
    output := OriginalRow227TriangleData0570.coefficient37_431, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 397, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_433, Icur := OriginalRow227TriangleData0556.coefficient36_432,
    output := OriginalRow227TriangleData0570.coefficient37_432, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 398, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_434, Icur := OriginalRow227TriangleData0556.coefficient36_433,
    output := OriginalRow227TriangleData0570.coefficient37_433, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 399, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_435, Icur := OriginalRow227TriangleData0556.coefficient36_434,
    output := OriginalRow227TriangleData0570.coefficient37_434, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 400, IA := shift, ID := OriginalRow227TriangleRoots13.root436, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_436, Icur := OriginalRow227TriangleData0556.coefficient36_435,
    output := OriginalRow227TriangleData0570.coefficient37_435, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 401, IA := shift, ID := OriginalRow227TriangleRoots13.root437, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_437, Icur := OriginalRow227TriangleData0556.coefficient36_436,
    output := OriginalRow227TriangleData0570.coefficient37_436, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 402, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_438, Icur := OriginalRow227TriangleData0556.coefficient36_437,
    output := OriginalRow227TriangleData0570.coefficient37_437, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 403, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_439, Icur := OriginalRow227TriangleData0556.coefficient36_438,
    output := OriginalRow227TriangleData0570.coefficient37_438, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 404, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_440, Icur := OriginalRow227TriangleData0556.coefficient36_439,
    output := OriginalRow227TriangleData0570.coefficient37_439, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 405, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_441, Icur := OriginalRow227TriangleData0556.coefficient36_440,
    output := OriginalRow227TriangleData0570.coefficient37_440, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 406, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_442, Icur := OriginalRow227TriangleData0556.coefficient36_441,
    output := OriginalRow227TriangleData0570.coefficient37_441, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 407, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_443, Icur := OriginalRow227TriangleData0556.coefficient36_442,
    output := OriginalRow227TriangleData0570.coefficient37_442, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 408, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_444, Icur := OriginalRow227TriangleData0556.coefficient36_443,
    output := OriginalRow227TriangleData0570.coefficient37_443, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 409, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_445, Icur := OriginalRow227TriangleData0556.coefficient36_444,
    output := OriginalRow227TriangleData0570.coefficient37_444, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 410, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_446, Icur := OriginalRow227TriangleData0556.coefficient36_445,
    output := OriginalRow227TriangleData0570.coefficient37_445, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 411, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_447, Icur := OriginalRow227TriangleData0556.coefficient36_446,
    output := OriginalRow227TriangleData0570.coefficient37_446, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 412, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_448, Icur := OriginalRow227TriangleData0556.coefficient36_447,
    output := OriginalRow227TriangleData0570.coefficient37_447, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 413, IA := shift, ID := OriginalRow227TriangleRoots14.root449, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_449, Icur := OriginalRow227TriangleData0556.coefficient36_448,
    output := OriginalRow227TriangleData0570.coefficient37_448, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 414, IA := shift, ID := OriginalRow227TriangleRoots14.root450, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0556.coefficient36_450, Icur := OriginalRow227TriangleData0556.coefficient36_449,
    output := OriginalRow227TriangleData0570.coefficient37_449, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 415, IA := shift, ID := OriginalRow227TriangleRoots14.root451, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0557.coefficient36_451, Icur := OriginalRow227TriangleData0556.coefficient36_450,
    output := OriginalRow227TriangleData0570.coefficient37_450, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos },
  { charge := 416, IA := shift, ID := OriginalRow227TriangleRoots14.root452, IC := OriginalRow227TriangleRoots01.root37,
    Inext := OriginalRow227TriangleData0557.coefficient36_452, Icur := OriginalRow227TriangleData0557.coefficient36_451,
    output := OriginalRow227TriangleData0570.coefficient37_451, hC := OriginalRow227TriangleRoots01.root37_pos, hAC := OriginalRow227TriangleRoots01.product37_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0554

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0554.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

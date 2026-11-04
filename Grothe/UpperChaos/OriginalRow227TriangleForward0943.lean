import Grothe.UpperChaos.OriginalRow227TriangleData0947
import Grothe.UpperChaos.OriginalRow227TriangleData0959
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0943
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots13.root419, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_419, Icur := OriginalRow227TriangleData0947.coefficient66_418,
    output := OriginalRow227TriangleData0959.coefficient67_418, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_420, Icur := OriginalRow227TriangleData0947.coefficient66_419,
    output := OriginalRow227TriangleData0959.coefficient67_419, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_421, Icur := OriginalRow227TriangleData0947.coefficient66_420,
    output := OriginalRow227TriangleData0959.coefficient67_420, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_422, Icur := OriginalRow227TriangleData0947.coefficient66_421,
    output := OriginalRow227TriangleData0959.coefficient67_421, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_423, Icur := OriginalRow227TriangleData0947.coefficient66_422,
    output := OriginalRow227TriangleData0959.coefficient67_422, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_424, Icur := OriginalRow227TriangleData0947.coefficient66_423,
    output := OriginalRow227TriangleData0959.coefficient67_423, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_425, Icur := OriginalRow227TriangleData0947.coefficient66_424,
    output := OriginalRow227TriangleData0959.coefficient67_424, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_426, Icur := OriginalRow227TriangleData0947.coefficient66_425,
    output := OriginalRow227TriangleData0959.coefficient67_425, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_427, Icur := OriginalRow227TriangleData0947.coefficient66_426,
    output := OriginalRow227TriangleData0959.coefficient67_426, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_428, Icur := OriginalRow227TriangleData0947.coefficient66_427,
    output := OriginalRow227TriangleData0959.coefficient67_427, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_429, Icur := OriginalRow227TriangleData0947.coefficient66_428,
    output := OriginalRow227TriangleData0959.coefficient67_428, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_430, Icur := OriginalRow227TriangleData0947.coefficient66_429,
    output := OriginalRow227TriangleData0959.coefficient67_429, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_431, Icur := OriginalRow227TriangleData0947.coefficient66_430,
    output := OriginalRow227TriangleData0959.coefficient67_430, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_432, Icur := OriginalRow227TriangleData0947.coefficient66_431,
    output := OriginalRow227TriangleData0959.coefficient67_431, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_433, Icur := OriginalRow227TriangleData0947.coefficient66_432,
    output := OriginalRow227TriangleData0959.coefficient67_432, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 368, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_434, Icur := OriginalRow227TriangleData0947.coefficient66_433,
    output := OriginalRow227TriangleData0959.coefficient67_433, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos },
  { charge := 369, IA := shift, ID := OriginalRow227TriangleRoots13.root435, IC := OriginalRow227TriangleRoots02.root67,
    Inext := OriginalRow227TriangleData0947.coefficient66_435, Icur := OriginalRow227TriangleData0947.coefficient66_434,
    output := OriginalRow227TriangleData0959.coefficient67_434, hC := OriginalRow227TriangleRoots02.root67_pos, hAC := OriginalRow227TriangleRoots02.product67_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0943

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0943.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

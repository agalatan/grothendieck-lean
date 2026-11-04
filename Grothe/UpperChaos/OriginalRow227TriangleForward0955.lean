import Grothe.UpperChaos.OriginalRow227TriangleData0959
import Grothe.UpperChaos.OriginalRow227TriangleData0971
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0955
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots13.root420, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_420, Icur := OriginalRow227TriangleData0959.coefficient67_419,
    output := OriginalRow227TriangleData0971.coefficient68_419, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots13.root421, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_421, Icur := OriginalRow227TriangleData0959.coefficient67_420,
    output := OriginalRow227TriangleData0971.coefficient68_420, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_422, Icur := OriginalRow227TriangleData0959.coefficient67_421,
    output := OriginalRow227TriangleData0971.coefficient68_421, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_423, Icur := OriginalRow227TriangleData0959.coefficient67_422,
    output := OriginalRow227TriangleData0971.coefficient68_422, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_424, Icur := OriginalRow227TriangleData0959.coefficient67_423,
    output := OriginalRow227TriangleData0971.coefficient68_423, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_425, Icur := OriginalRow227TriangleData0959.coefficient67_424,
    output := OriginalRow227TriangleData0971.coefficient68_424, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_426, Icur := OriginalRow227TriangleData0959.coefficient67_425,
    output := OriginalRow227TriangleData0971.coefficient68_425, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_427, Icur := OriginalRow227TriangleData0959.coefficient67_426,
    output := OriginalRow227TriangleData0971.coefficient68_426, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_428, Icur := OriginalRow227TriangleData0959.coefficient67_427,
    output := OriginalRow227TriangleData0971.coefficient68_427, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_429, Icur := OriginalRow227TriangleData0959.coefficient67_428,
    output := OriginalRow227TriangleData0971.coefficient68_428, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_430, Icur := OriginalRow227TriangleData0959.coefficient67_429,
    output := OriginalRow227TriangleData0971.coefficient68_429, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 364, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_431, Icur := OriginalRow227TriangleData0959.coefficient67_430,
    output := OriginalRow227TriangleData0971.coefficient68_430, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 365, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_432, Icur := OriginalRow227TriangleData0959.coefficient67_431,
    output := OriginalRow227TriangleData0971.coefficient68_431, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 366, IA := shift, ID := OriginalRow227TriangleRoots13.root433, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_433, Icur := OriginalRow227TriangleData0959.coefficient67_432,
    output := OriginalRow227TriangleData0971.coefficient68_432, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 367, IA := shift, ID := OriginalRow227TriangleRoots13.root434, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0959.coefficient67_434, Icur := OriginalRow227TriangleData0959.coefficient67_433,
    output := OriginalRow227TriangleData0971.coefficient68_433, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0955

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0955.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

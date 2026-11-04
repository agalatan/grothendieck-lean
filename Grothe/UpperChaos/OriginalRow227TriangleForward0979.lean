import Grothe.UpperChaos.OriginalRow227TriangleData0983
import Grothe.UpperChaos.OriginalRow227TriangleData0995
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0979
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 353, IA := shift, ID := OriginalRow227TriangleRoots13.root422, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0983.coefficient69_422, Icur := OriginalRow227TriangleData0983.coefficient69_421,
    output := OriginalRow227TriangleData0995.coefficient70_421, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 354, IA := shift, ID := OriginalRow227TriangleRoots13.root423, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0983.coefficient69_423, Icur := OriginalRow227TriangleData0983.coefficient69_422,
    output := OriginalRow227TriangleData0995.coefficient70_422, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 355, IA := shift, ID := OriginalRow227TriangleRoots13.root424, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0983.coefficient69_424, Icur := OriginalRow227TriangleData0983.coefficient69_423,
    output := OriginalRow227TriangleData0995.coefficient70_423, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 356, IA := shift, ID := OriginalRow227TriangleRoots13.root425, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0983.coefficient69_425, Icur := OriginalRow227TriangleData0983.coefficient69_424,
    output := OriginalRow227TriangleData0995.coefficient70_424, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 357, IA := shift, ID := OriginalRow227TriangleRoots13.root426, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0983.coefficient69_426, Icur := OriginalRow227TriangleData0983.coefficient69_425,
    output := OriginalRow227TriangleData0995.coefficient70_425, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 358, IA := shift, ID := OriginalRow227TriangleRoots13.root427, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0983.coefficient69_427, Icur := OriginalRow227TriangleData0983.coefficient69_426,
    output := OriginalRow227TriangleData0995.coefficient70_426, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 359, IA := shift, ID := OriginalRow227TriangleRoots13.root428, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0983.coefficient69_428, Icur := OriginalRow227TriangleData0983.coefficient69_427,
    output := OriginalRow227TriangleData0995.coefficient70_427, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 360, IA := shift, ID := OriginalRow227TriangleRoots13.root429, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0983.coefficient69_429, Icur := OriginalRow227TriangleData0983.coefficient69_428,
    output := OriginalRow227TriangleData0995.coefficient70_428, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 361, IA := shift, ID := OriginalRow227TriangleRoots13.root430, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0983.coefficient69_430, Icur := OriginalRow227TriangleData0983.coefficient69_429,
    output := OriginalRow227TriangleData0995.coefficient70_429, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 362, IA := shift, ID := OriginalRow227TriangleRoots13.root431, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0983.coefficient69_431, Icur := OriginalRow227TriangleData0983.coefficient69_430,
    output := OriginalRow227TriangleData0995.coefficient70_430, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 363, IA := shift, ID := OriginalRow227TriangleRoots13.root432, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0983.coefficient69_432, Icur := OriginalRow227TriangleData0983.coefficient69_431,
    output := OriginalRow227TriangleData0995.coefficient70_431, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0979

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0979.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

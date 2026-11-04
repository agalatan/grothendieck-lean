import Grothe.UpperChaos.OriginalRow227TriangleData0785
import Grothe.UpperChaos.OriginalRow227TriangleData0798
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots13
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0782
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 385, IA := shift, ID := OriginalRow227TriangleRoots13.root438, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0785.coefficient53_438, Icur := OriginalRow227TriangleData0785.coefficient53_437,
    output := OriginalRow227TriangleData0798.coefficient54_437, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 386, IA := shift, ID := OriginalRow227TriangleRoots13.root439, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0785.coefficient53_439, Icur := OriginalRow227TriangleData0785.coefficient53_438,
    output := OriginalRow227TriangleData0798.coefficient54_438, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 387, IA := shift, ID := OriginalRow227TriangleRoots13.root440, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0785.coefficient53_440, Icur := OriginalRow227TriangleData0785.coefficient53_439,
    output := OriginalRow227TriangleData0798.coefficient54_439, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 388, IA := shift, ID := OriginalRow227TriangleRoots13.root441, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0785.coefficient53_441, Icur := OriginalRow227TriangleData0785.coefficient53_440,
    output := OriginalRow227TriangleData0798.coefficient54_440, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 389, IA := shift, ID := OriginalRow227TriangleRoots13.root442, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0785.coefficient53_442, Icur := OriginalRow227TriangleData0785.coefficient53_441,
    output := OriginalRow227TriangleData0798.coefficient54_441, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 390, IA := shift, ID := OriginalRow227TriangleRoots13.root443, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0785.coefficient53_443, Icur := OriginalRow227TriangleData0785.coefficient53_442,
    output := OriginalRow227TriangleData0798.coefficient54_442, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 391, IA := shift, ID := OriginalRow227TriangleRoots13.root444, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0785.coefficient53_444, Icur := OriginalRow227TriangleData0785.coefficient53_443,
    output := OriginalRow227TriangleData0798.coefficient54_443, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 392, IA := shift, ID := OriginalRow227TriangleRoots13.root445, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0785.coefficient53_445, Icur := OriginalRow227TriangleData0785.coefficient53_444,
    output := OriginalRow227TriangleData0798.coefficient54_444, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 393, IA := shift, ID := OriginalRow227TriangleRoots13.root446, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0785.coefficient53_446, Icur := OriginalRow227TriangleData0785.coefficient53_445,
    output := OriginalRow227TriangleData0798.coefficient54_445, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 394, IA := shift, ID := OriginalRow227TriangleRoots13.root447, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0785.coefficient53_447, Icur := OriginalRow227TriangleData0785.coefficient53_446,
    output := OriginalRow227TriangleData0798.coefficient54_446, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 395, IA := shift, ID := OriginalRow227TriangleRoots13.root448, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0785.coefficient53_448, Icur := OriginalRow227TriangleData0785.coefficient53_447,
    output := OriginalRow227TriangleData0798.coefficient54_447, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0782

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0782.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

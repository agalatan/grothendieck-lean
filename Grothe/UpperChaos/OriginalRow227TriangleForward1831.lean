import Grothe.UpperChaos.OriginalRow227TriangleData1841
import Grothe.UpperChaos.OriginalRow227TriangleData1847
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1831
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1841.coefficient166_327, Icur := OriginalRow227TriangleData1841.coefficient166_326,
    output := OriginalRow227TriangleData1847.coefficient167_326, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1841.coefficient166_328, Icur := OriginalRow227TriangleData1841.coefficient166_327,
    output := OriginalRow227TriangleData1847.coefficient167_327, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1841.coefficient166_329, Icur := OriginalRow227TriangleData1841.coefficient166_328,
    output := OriginalRow227TriangleData1847.coefficient167_328, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1841.coefficient166_330, Icur := OriginalRow227TriangleData1841.coefficient166_329,
    output := OriginalRow227TriangleData1847.coefficient167_329, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1841.coefficient166_331, Icur := OriginalRow227TriangleData1841.coefficient166_330,
    output := OriginalRow227TriangleData1847.coefficient167_330, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1841.coefficient166_332, Icur := OriginalRow227TriangleData1841.coefficient166_331,
    output := OriginalRow227TriangleData1847.coefficient167_331, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1841.coefficient166_333, Icur := OriginalRow227TriangleData1841.coefficient166_332,
    output := OriginalRow227TriangleData1847.coefficient167_332, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1841.coefficient166_334, Icur := OriginalRow227TriangleData1841.coefficient166_333,
    output := OriginalRow227TriangleData1847.coefficient167_333, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots05.root167,
    Inext := OriginalRow227TriangleData1841.coefficient166_335, Icur := OriginalRow227TriangleData1841.coefficient166_334,
    output := OriginalRow227TriangleData1847.coefficient167_334, hC := OriginalRow227TriangleRoots05.root167_pos, hAC := OriginalRow227TriangleRoots05.product167_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1831

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1831.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

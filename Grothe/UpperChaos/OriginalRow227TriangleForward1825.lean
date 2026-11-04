import Grothe.UpperChaos.OriginalRow227TriangleData1835
import Grothe.UpperChaos.OriginalRow227TriangleData1841
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1825
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots05.root166,
    Inext := OriginalRow227TriangleData1835.coefficient165_326, Icur := OriginalRow227TriangleData1835.coefficient165_325,
    output := OriginalRow227TriangleData1841.coefficient166_325, hC := OriginalRow227TriangleRoots05.root166_pos, hAC := OriginalRow227TriangleRoots05.product166_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots05.root166,
    Inext := OriginalRow227TriangleData1835.coefficient165_327, Icur := OriginalRow227TriangleData1835.coefficient165_326,
    output := OriginalRow227TriangleData1841.coefficient166_326, hC := OriginalRow227TriangleRoots05.root166_pos, hAC := OriginalRow227TriangleRoots05.product166_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots05.root166,
    Inext := OriginalRow227TriangleData1835.coefficient165_328, Icur := OriginalRow227TriangleData1835.coefficient165_327,
    output := OriginalRow227TriangleData1841.coefficient166_327, hC := OriginalRow227TriangleRoots05.root166_pos, hAC := OriginalRow227TriangleRoots05.product166_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots05.root166,
    Inext := OriginalRow227TriangleData1835.coefficient165_329, Icur := OriginalRow227TriangleData1835.coefficient165_328,
    output := OriginalRow227TriangleData1841.coefficient166_328, hC := OriginalRow227TriangleRoots05.root166_pos, hAC := OriginalRow227TriangleRoots05.product166_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots05.root166,
    Inext := OriginalRow227TriangleData1835.coefficient165_330, Icur := OriginalRow227TriangleData1835.coefficient165_329,
    output := OriginalRow227TriangleData1841.coefficient166_329, hC := OriginalRow227TriangleRoots05.root166_pos, hAC := OriginalRow227TriangleRoots05.product166_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots05.root166,
    Inext := OriginalRow227TriangleData1835.coefficient165_331, Icur := OriginalRow227TriangleData1835.coefficient165_330,
    output := OriginalRow227TriangleData1841.coefficient166_330, hC := OriginalRow227TriangleRoots05.root166_pos, hAC := OriginalRow227TriangleRoots05.product166_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots05.root166,
    Inext := OriginalRow227TriangleData1835.coefficient165_332, Icur := OriginalRow227TriangleData1835.coefficient165_331,
    output := OriginalRow227TriangleData1841.coefficient166_331, hC := OriginalRow227TriangleRoots05.root166_pos, hAC := OriginalRow227TriangleRoots05.product166_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots05.root166,
    Inext := OriginalRow227TriangleData1835.coefficient165_333, Icur := OriginalRow227TriangleData1835.coefficient165_332,
    output := OriginalRow227TriangleData1841.coefficient166_332, hC := OriginalRow227TriangleRoots05.root166_pos, hAC := OriginalRow227TriangleRoots05.product166_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots05.root166,
    Inext := OriginalRow227TriangleData1835.coefficient165_334, Icur := OriginalRow227TriangleData1835.coefficient165_333,
    output := OriginalRow227TriangleData1841.coefficient166_333, hC := OriginalRow227TriangleRoots05.root166_pos, hAC := OriginalRow227TriangleRoots05.product166_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots05.root166,
    Inext := OriginalRow227TriangleData1835.coefficient165_335, Icur := OriginalRow227TriangleData1835.coefficient165_334,
    output := OriginalRow227TriangleData1841.coefficient166_334, hC := OriginalRow227TriangleRoots05.root166_pos, hAC := OriginalRow227TriangleRoots05.product166_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots05.root166,
    Inext := OriginalRow227TriangleData1835.coefficient165_336, Icur := OriginalRow227TriangleData1835.coefficient165_335,
    output := OriginalRow227TriangleData1841.coefficient166_335, hC := OriginalRow227TriangleRoots05.root166_pos, hAC := OriginalRow227TriangleRoots05.product166_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1825

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1825.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

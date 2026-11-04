import Grothe.UpperChaos.OriginalRow227TriangleData1817
import Grothe.UpperChaos.OriginalRow227TriangleData1823
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1807
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_323, Icur := OriginalRow227TriangleData1817.coefficient162_322,
    output := OriginalRow227TriangleData1823.coefficient163_322, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_324, Icur := OriginalRow227TriangleData1817.coefficient162_323,
    output := OriginalRow227TriangleData1823.coefficient163_323, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_325, Icur := OriginalRow227TriangleData1817.coefficient162_324,
    output := OriginalRow227TriangleData1823.coefficient163_324, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_326, Icur := OriginalRow227TriangleData1817.coefficient162_325,
    output := OriginalRow227TriangleData1823.coefficient163_325, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_327, Icur := OriginalRow227TriangleData1817.coefficient162_326,
    output := OriginalRow227TriangleData1823.coefficient163_326, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_328, Icur := OriginalRow227TriangleData1817.coefficient162_327,
    output := OriginalRow227TriangleData1823.coefficient163_327, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_329, Icur := OriginalRow227TriangleData1817.coefficient162_328,
    output := OriginalRow227TriangleData1823.coefficient163_328, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_330, Icur := OriginalRow227TriangleData1817.coefficient162_329,
    output := OriginalRow227TriangleData1823.coefficient163_329, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_331, Icur := OriginalRow227TriangleData1817.coefficient162_330,
    output := OriginalRow227TriangleData1823.coefficient163_330, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_332, Icur := OriginalRow227TriangleData1817.coefficient162_331,
    output := OriginalRow227TriangleData1823.coefficient163_331, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_333, Icur := OriginalRow227TriangleData1817.coefficient162_332,
    output := OriginalRow227TriangleData1823.coefficient163_332, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_334, Icur := OriginalRow227TriangleData1817.coefficient162_333,
    output := OriginalRow227TriangleData1823.coefficient163_333, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_335, Icur := OriginalRow227TriangleData1817.coefficient162_334,
    output := OriginalRow227TriangleData1823.coefficient163_334, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_336, Icur := OriginalRow227TriangleData1817.coefficient162_335,
    output := OriginalRow227TriangleData1823.coefficient163_335, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_337, Icur := OriginalRow227TriangleData1817.coefficient162_336,
    output := OriginalRow227TriangleData1823.coefficient163_336, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_338, Icur := OriginalRow227TriangleData1817.coefficient162_337,
    output := OriginalRow227TriangleData1823.coefficient163_337, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots05.root163,
    Inext := OriginalRow227TriangleData1817.coefficient162_339, Icur := OriginalRow227TriangleData1817.coefficient162_338,
    output := OriginalRow227TriangleData1823.coefficient163_338, hC := OriginalRow227TriangleRoots05.root163_pos, hAC := OriginalRow227TriangleRoots05.product163_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1807

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1807.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

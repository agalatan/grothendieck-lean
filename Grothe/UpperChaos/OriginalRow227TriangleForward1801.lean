import Grothe.UpperChaos.OriginalRow227TriangleData1811
import Grothe.UpperChaos.OriginalRow227TriangleData1817
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1801
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_322, Icur := OriginalRow227TriangleData1811.coefficient161_321,
    output := OriginalRow227TriangleData1817.coefficient162_321, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_323, Icur := OriginalRow227TriangleData1811.coefficient161_322,
    output := OriginalRow227TriangleData1817.coefficient162_322, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_324, Icur := OriginalRow227TriangleData1811.coefficient161_323,
    output := OriginalRow227TriangleData1817.coefficient162_323, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_325, Icur := OriginalRow227TriangleData1811.coefficient161_324,
    output := OriginalRow227TriangleData1817.coefficient162_324, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_326, Icur := OriginalRow227TriangleData1811.coefficient161_325,
    output := OriginalRow227TriangleData1817.coefficient162_325, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_327, Icur := OriginalRow227TriangleData1811.coefficient161_326,
    output := OriginalRow227TriangleData1817.coefficient162_326, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_328, Icur := OriginalRow227TriangleData1811.coefficient161_327,
    output := OriginalRow227TriangleData1817.coefficient162_327, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_329, Icur := OriginalRow227TriangleData1811.coefficient161_328,
    output := OriginalRow227TriangleData1817.coefficient162_328, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_330, Icur := OriginalRow227TriangleData1811.coefficient161_329,
    output := OriginalRow227TriangleData1817.coefficient162_329, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_331, Icur := OriginalRow227TriangleData1811.coefficient161_330,
    output := OriginalRow227TriangleData1817.coefficient162_330, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_332, Icur := OriginalRow227TriangleData1811.coefficient161_331,
    output := OriginalRow227TriangleData1817.coefficient162_331, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_333, Icur := OriginalRow227TriangleData1811.coefficient161_332,
    output := OriginalRow227TriangleData1817.coefficient162_332, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_334, Icur := OriginalRow227TriangleData1811.coefficient161_333,
    output := OriginalRow227TriangleData1817.coefficient162_333, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_335, Icur := OriginalRow227TriangleData1811.coefficient161_334,
    output := OriginalRow227TriangleData1817.coefficient162_334, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_336, Icur := OriginalRow227TriangleData1811.coefficient161_335,
    output := OriginalRow227TriangleData1817.coefficient162_335, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_337, Icur := OriginalRow227TriangleData1811.coefficient161_336,
    output := OriginalRow227TriangleData1817.coefficient162_336, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_338, Icur := OriginalRow227TriangleData1811.coefficient161_337,
    output := OriginalRow227TriangleData1817.coefficient162_337, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_339, Icur := OriginalRow227TriangleData1811.coefficient161_338,
    output := OriginalRow227TriangleData1817.coefficient162_338, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots05.root162,
    Inext := OriginalRow227TriangleData1811.coefficient161_340, Icur := OriginalRow227TriangleData1811.coefficient161_339,
    output := OriginalRow227TriangleData1817.coefficient162_339, hC := OriginalRow227TriangleRoots05.root162_pos, hAC := OriginalRow227TriangleRoots05.product162_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1801

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1801.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

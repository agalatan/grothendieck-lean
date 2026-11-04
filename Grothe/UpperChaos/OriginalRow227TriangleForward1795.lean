import Grothe.UpperChaos.OriginalRow227TriangleData1805
import Grothe.UpperChaos.OriginalRow227TriangleData1811
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1795
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_321, Icur := OriginalRow227TriangleData1805.coefficient160_320,
    output := OriginalRow227TriangleData1811.coefficient161_320, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_322, Icur := OriginalRow227TriangleData1805.coefficient160_321,
    output := OriginalRow227TriangleData1811.coefficient161_321, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_323, Icur := OriginalRow227TriangleData1805.coefficient160_322,
    output := OriginalRow227TriangleData1811.coefficient161_322, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_324, Icur := OriginalRow227TriangleData1805.coefficient160_323,
    output := OriginalRow227TriangleData1811.coefficient161_323, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_325, Icur := OriginalRow227TriangleData1805.coefficient160_324,
    output := OriginalRow227TriangleData1811.coefficient161_324, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_326, Icur := OriginalRow227TriangleData1805.coefficient160_325,
    output := OriginalRow227TriangleData1811.coefficient161_325, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_327, Icur := OriginalRow227TriangleData1805.coefficient160_326,
    output := OriginalRow227TriangleData1811.coefficient161_326, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_328, Icur := OriginalRow227TriangleData1805.coefficient160_327,
    output := OriginalRow227TriangleData1811.coefficient161_327, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_329, Icur := OriginalRow227TriangleData1805.coefficient160_328,
    output := OriginalRow227TriangleData1811.coefficient161_328, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_330, Icur := OriginalRow227TriangleData1805.coefficient160_329,
    output := OriginalRow227TriangleData1811.coefficient161_329, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_331, Icur := OriginalRow227TriangleData1805.coefficient160_330,
    output := OriginalRow227TriangleData1811.coefficient161_330, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_332, Icur := OriginalRow227TriangleData1805.coefficient160_331,
    output := OriginalRow227TriangleData1811.coefficient161_331, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_333, Icur := OriginalRow227TriangleData1805.coefficient160_332,
    output := OriginalRow227TriangleData1811.coefficient161_332, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_334, Icur := OriginalRow227TriangleData1805.coefficient160_333,
    output := OriginalRow227TriangleData1811.coefficient161_333, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_335, Icur := OriginalRow227TriangleData1805.coefficient160_334,
    output := OriginalRow227TriangleData1811.coefficient161_334, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_336, Icur := OriginalRow227TriangleData1805.coefficient160_335,
    output := OriginalRow227TriangleData1811.coefficient161_335, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_337, Icur := OriginalRow227TriangleData1805.coefficient160_336,
    output := OriginalRow227TriangleData1811.coefficient161_336, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_338, Icur := OriginalRow227TriangleData1805.coefficient160_337,
    output := OriginalRow227TriangleData1811.coefficient161_337, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_339, Icur := OriginalRow227TriangleData1805.coefficient160_338,
    output := OriginalRow227TriangleData1811.coefficient161_338, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_340, Icur := OriginalRow227TriangleData1805.coefficient160_339,
    output := OriginalRow227TriangleData1811.coefficient161_339, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots05.root161,
    Inext := OriginalRow227TriangleData1805.coefficient160_341, Icur := OriginalRow227TriangleData1805.coefficient160_340,
    output := OriginalRow227TriangleData1811.coefficient161_340, hC := OriginalRow227TriangleRoots05.root161_pos, hAC := OriginalRow227TriangleRoots05.product161_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1795

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1795.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

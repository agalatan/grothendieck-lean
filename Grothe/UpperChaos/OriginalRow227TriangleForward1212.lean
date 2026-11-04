import Grothe.UpperChaos.OriginalRow227TriangleData1217
import Grothe.UpperChaos.OriginalRow227TriangleData1218
import Grothe.UpperChaos.OriginalRow227TriangleData1228
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1212
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_315, Icur := OriginalRow227TriangleData1217.coefficient90_314,
    output := OriginalRow227TriangleData1228.coefficient91_314, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_316, Icur := OriginalRow227TriangleData1217.coefficient90_315,
    output := OriginalRow227TriangleData1228.coefficient91_315, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_317, Icur := OriginalRow227TriangleData1217.coefficient90_316,
    output := OriginalRow227TriangleData1228.coefficient91_316, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_318, Icur := OriginalRow227TriangleData1217.coefficient90_317,
    output := OriginalRow227TriangleData1228.coefficient91_317, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_319, Icur := OriginalRow227TriangleData1217.coefficient90_318,
    output := OriginalRow227TriangleData1228.coefficient91_318, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_320, Icur := OriginalRow227TriangleData1217.coefficient90_319,
    output := OriginalRow227TriangleData1228.coefficient91_319, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_321, Icur := OriginalRow227TriangleData1217.coefficient90_320,
    output := OriginalRow227TriangleData1228.coefficient91_320, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_322, Icur := OriginalRow227TriangleData1217.coefficient90_321,
    output := OriginalRow227TriangleData1228.coefficient91_321, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_323, Icur := OriginalRow227TriangleData1217.coefficient90_322,
    output := OriginalRow227TriangleData1228.coefficient91_322, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_324, Icur := OriginalRow227TriangleData1217.coefficient90_323,
    output := OriginalRow227TriangleData1228.coefficient91_323, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_325, Icur := OriginalRow227TriangleData1217.coefficient90_324,
    output := OriginalRow227TriangleData1228.coefficient91_324, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_326, Icur := OriginalRow227TriangleData1217.coefficient90_325,
    output := OriginalRow227TriangleData1228.coefficient91_325, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_327, Icur := OriginalRow227TriangleData1217.coefficient90_326,
    output := OriginalRow227TriangleData1228.coefficient91_326, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_328, Icur := OriginalRow227TriangleData1217.coefficient90_327,
    output := OriginalRow227TriangleData1228.coefficient91_327, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_329, Icur := OriginalRow227TriangleData1217.coefficient90_328,
    output := OriginalRow227TriangleData1228.coefficient91_328, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_330, Icur := OriginalRow227TriangleData1217.coefficient90_329,
    output := OriginalRow227TriangleData1228.coefficient91_329, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_331, Icur := OriginalRow227TriangleData1217.coefficient90_330,
    output := OriginalRow227TriangleData1228.coefficient91_330, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_332, Icur := OriginalRow227TriangleData1217.coefficient90_331,
    output := OriginalRow227TriangleData1228.coefficient91_331, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_333, Icur := OriginalRow227TriangleData1217.coefficient90_332,
    output := OriginalRow227TriangleData1228.coefficient91_332, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_334, Icur := OriginalRow227TriangleData1217.coefficient90_333,
    output := OriginalRow227TriangleData1228.coefficient91_333, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_335, Icur := OriginalRow227TriangleData1217.coefficient90_334,
    output := OriginalRow227TriangleData1228.coefficient91_334, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_336, Icur := OriginalRow227TriangleData1217.coefficient90_335,
    output := OriginalRow227TriangleData1228.coefficient91_335, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_337, Icur := OriginalRow227TriangleData1217.coefficient90_336,
    output := OriginalRow227TriangleData1228.coefficient91_336, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_338, Icur := OriginalRow227TriangleData1217.coefficient90_337,
    output := OriginalRow227TriangleData1228.coefficient91_337, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_339, Icur := OriginalRow227TriangleData1217.coefficient90_338,
    output := OriginalRow227TriangleData1228.coefficient91_338, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_340, Icur := OriginalRow227TriangleData1217.coefficient90_339,
    output := OriginalRow227TriangleData1228.coefficient91_339, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_341, Icur := OriginalRow227TriangleData1217.coefficient90_340,
    output := OriginalRow227TriangleData1228.coefficient91_340, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_342, Icur := OriginalRow227TriangleData1217.coefficient90_341,
    output := OriginalRow227TriangleData1228.coefficient91_341, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_343, Icur := OriginalRow227TriangleData1217.coefficient90_342,
    output := OriginalRow227TriangleData1228.coefficient91_342, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1217.coefficient90_344, Icur := OriginalRow227TriangleData1217.coefficient90_343,
    output := OriginalRow227TriangleData1228.coefficient91_343, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1218.coefficient90_345, Icur := OriginalRow227TriangleData1217.coefficient90_344,
    output := OriginalRow227TriangleData1228.coefficient91_344, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots02.root91,
    Inext := OriginalRow227TriangleData1218.coefficient90_346, Icur := OriginalRow227TriangleData1218.coefficient90_345,
    output := OriginalRow227TriangleData1228.coefficient91_345, hC := OriginalRow227TriangleRoots02.root91_pos, hAC := OriginalRow227TriangleRoots02.product91_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1212

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1212.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

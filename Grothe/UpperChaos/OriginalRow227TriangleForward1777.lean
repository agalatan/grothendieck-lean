import Grothe.UpperChaos.OriginalRow227TriangleData1787
import Grothe.UpperChaos.OriginalRow227TriangleData1793
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1777
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_318, Icur := OriginalRow227TriangleData1787.coefficient157_317,
    output := OriginalRow227TriangleData1793.coefficient158_317, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_319, Icur := OriginalRow227TriangleData1787.coefficient157_318,
    output := OriginalRow227TriangleData1793.coefficient158_318, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_320, Icur := OriginalRow227TriangleData1787.coefficient157_319,
    output := OriginalRow227TriangleData1793.coefficient158_319, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_321, Icur := OriginalRow227TriangleData1787.coefficient157_320,
    output := OriginalRow227TriangleData1793.coefficient158_320, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_322, Icur := OriginalRow227TriangleData1787.coefficient157_321,
    output := OriginalRow227TriangleData1793.coefficient158_321, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_323, Icur := OriginalRow227TriangleData1787.coefficient157_322,
    output := OriginalRow227TriangleData1793.coefficient158_322, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_324, Icur := OriginalRow227TriangleData1787.coefficient157_323,
    output := OriginalRow227TriangleData1793.coefficient158_323, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_325, Icur := OriginalRow227TriangleData1787.coefficient157_324,
    output := OriginalRow227TriangleData1793.coefficient158_324, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_326, Icur := OriginalRow227TriangleData1787.coefficient157_325,
    output := OriginalRow227TriangleData1793.coefficient158_325, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_327, Icur := OriginalRow227TriangleData1787.coefficient157_326,
    output := OriginalRow227TriangleData1793.coefficient158_326, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_328, Icur := OriginalRow227TriangleData1787.coefficient157_327,
    output := OriginalRow227TriangleData1793.coefficient158_327, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_329, Icur := OriginalRow227TriangleData1787.coefficient157_328,
    output := OriginalRow227TriangleData1793.coefficient158_328, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_330, Icur := OriginalRow227TriangleData1787.coefficient157_329,
    output := OriginalRow227TriangleData1793.coefficient158_329, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_331, Icur := OriginalRow227TriangleData1787.coefficient157_330,
    output := OriginalRow227TriangleData1793.coefficient158_330, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_332, Icur := OriginalRow227TriangleData1787.coefficient157_331,
    output := OriginalRow227TriangleData1793.coefficient158_331, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_333, Icur := OriginalRow227TriangleData1787.coefficient157_332,
    output := OriginalRow227TriangleData1793.coefficient158_332, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_334, Icur := OriginalRow227TriangleData1787.coefficient157_333,
    output := OriginalRow227TriangleData1793.coefficient158_333, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_335, Icur := OriginalRow227TriangleData1787.coefficient157_334,
    output := OriginalRow227TriangleData1793.coefficient158_334, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_336, Icur := OriginalRow227TriangleData1787.coefficient157_335,
    output := OriginalRow227TriangleData1793.coefficient158_335, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_337, Icur := OriginalRow227TriangleData1787.coefficient157_336,
    output := OriginalRow227TriangleData1793.coefficient158_336, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_338, Icur := OriginalRow227TriangleData1787.coefficient157_337,
    output := OriginalRow227TriangleData1793.coefficient158_337, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_339, Icur := OriginalRow227TriangleData1787.coefficient157_338,
    output := OriginalRow227TriangleData1793.coefficient158_338, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_340, Icur := OriginalRow227TriangleData1787.coefficient157_339,
    output := OriginalRow227TriangleData1793.coefficient158_339, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_341, Icur := OriginalRow227TriangleData1787.coefficient157_340,
    output := OriginalRow227TriangleData1793.coefficient158_340, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_342, Icur := OriginalRow227TriangleData1787.coefficient157_341,
    output := OriginalRow227TriangleData1793.coefficient158_341, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_343, Icur := OriginalRow227TriangleData1787.coefficient157_342,
    output := OriginalRow227TriangleData1793.coefficient158_342, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots04.root158,
    Inext := OriginalRow227TriangleData1787.coefficient157_344, Icur := OriginalRow227TriangleData1787.coefficient157_343,
    output := OriginalRow227TriangleData1793.coefficient158_343, hC := OriginalRow227TriangleRoots04.root158_pos, hAC := OriginalRow227TriangleRoots04.product158_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1777

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1777.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

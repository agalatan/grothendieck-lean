import Grothe.UpperChaos.OriginalRow227TriangleData1279
import Grothe.UpperChaos.OriginalRow227TriangleData1280
import Grothe.UpperChaos.OriginalRow227TriangleData1289
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1273
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_321, Icur := OriginalRow227TriangleData1279.coefficient96_320,
    output := OriginalRow227TriangleData1289.coefficient97_320, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_322, Icur := OriginalRow227TriangleData1279.coefficient96_321,
    output := OriginalRow227TriangleData1289.coefficient97_321, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_323, Icur := OriginalRow227TriangleData1279.coefficient96_322,
    output := OriginalRow227TriangleData1289.coefficient97_322, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_324, Icur := OriginalRow227TriangleData1279.coefficient96_323,
    output := OriginalRow227TriangleData1289.coefficient97_323, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_325, Icur := OriginalRow227TriangleData1279.coefficient96_324,
    output := OriginalRow227TriangleData1289.coefficient97_324, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_326, Icur := OriginalRow227TriangleData1279.coefficient96_325,
    output := OriginalRow227TriangleData1289.coefficient97_325, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_327, Icur := OriginalRow227TriangleData1279.coefficient96_326,
    output := OriginalRow227TriangleData1289.coefficient97_326, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_328, Icur := OriginalRow227TriangleData1279.coefficient96_327,
    output := OriginalRow227TriangleData1289.coefficient97_327, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_329, Icur := OriginalRow227TriangleData1279.coefficient96_328,
    output := OriginalRow227TriangleData1289.coefficient97_328, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_330, Icur := OriginalRow227TriangleData1279.coefficient96_329,
    output := OriginalRow227TriangleData1289.coefficient97_329, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_331, Icur := OriginalRow227TriangleData1279.coefficient96_330,
    output := OriginalRow227TriangleData1289.coefficient97_330, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_332, Icur := OriginalRow227TriangleData1279.coefficient96_331,
    output := OriginalRow227TriangleData1289.coefficient97_331, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_333, Icur := OriginalRow227TriangleData1279.coefficient96_332,
    output := OriginalRow227TriangleData1289.coefficient97_332, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_334, Icur := OriginalRow227TriangleData1279.coefficient96_333,
    output := OriginalRow227TriangleData1289.coefficient97_333, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_335, Icur := OriginalRow227TriangleData1279.coefficient96_334,
    output := OriginalRow227TriangleData1289.coefficient97_334, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_336, Icur := OriginalRow227TriangleData1279.coefficient96_335,
    output := OriginalRow227TriangleData1289.coefficient97_335, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_337, Icur := OriginalRow227TriangleData1279.coefficient96_336,
    output := OriginalRow227TriangleData1289.coefficient97_336, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_338, Icur := OriginalRow227TriangleData1279.coefficient96_337,
    output := OriginalRow227TriangleData1289.coefficient97_337, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_339, Icur := OriginalRow227TriangleData1279.coefficient96_338,
    output := OriginalRow227TriangleData1289.coefficient97_338, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_340, Icur := OriginalRow227TriangleData1279.coefficient96_339,
    output := OriginalRow227TriangleData1289.coefficient97_339, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_341, Icur := OriginalRow227TriangleData1279.coefficient96_340,
    output := OriginalRow227TriangleData1289.coefficient97_340, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_342, Icur := OriginalRow227TriangleData1279.coefficient96_341,
    output := OriginalRow227TriangleData1289.coefficient97_341, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_343, Icur := OriginalRow227TriangleData1279.coefficient96_342,
    output := OriginalRow227TriangleData1289.coefficient97_342, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_344, Icur := OriginalRow227TriangleData1279.coefficient96_343,
    output := OriginalRow227TriangleData1289.coefficient97_343, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_345, Icur := OriginalRow227TriangleData1279.coefficient96_344,
    output := OriginalRow227TriangleData1289.coefficient97_344, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_346, Icur := OriginalRow227TriangleData1279.coefficient96_345,
    output := OriginalRow227TriangleData1289.coefficient97_345, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots10.root347, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_347, Icur := OriginalRow227TriangleData1279.coefficient96_346,
    output := OriginalRow227TriangleData1289.coefficient97_346, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots10.root348, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_348, Icur := OriginalRow227TriangleData1279.coefficient96_347,
    output := OriginalRow227TriangleData1289.coefficient97_347, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots10.root349, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_349, Icur := OriginalRow227TriangleData1279.coefficient96_348,
    output := OriginalRow227TriangleData1289.coefficient97_348, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots10.root350, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1279.coefficient96_350, Icur := OriginalRow227TriangleData1279.coefficient96_349,
    output := OriginalRow227TriangleData1289.coefficient97_349, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots10.root351, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1280.coefficient96_351, Icur := OriginalRow227TriangleData1279.coefficient96_350,
    output := OriginalRow227TriangleData1289.coefficient97_350, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots10.root352, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1280.coefficient96_352, Icur := OriginalRow227TriangleData1280.coefficient96_351,
    output := OriginalRow227TriangleData1289.coefficient97_351, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1273

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1273.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

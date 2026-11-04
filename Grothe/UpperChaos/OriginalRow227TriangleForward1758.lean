import Grothe.UpperChaos.OriginalRow227TriangleData1767
import Grothe.UpperChaos.OriginalRow227TriangleData1768
import Grothe.UpperChaos.OriginalRow227TriangleData1774
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1758
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_315, Icur := OriginalRow227TriangleData1767.coefficient154_314,
    output := OriginalRow227TriangleData1774.coefficient155_314, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_316, Icur := OriginalRow227TriangleData1767.coefficient154_315,
    output := OriginalRow227TriangleData1774.coefficient155_315, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_317, Icur := OriginalRow227TriangleData1767.coefficient154_316,
    output := OriginalRow227TriangleData1774.coefficient155_316, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_318, Icur := OriginalRow227TriangleData1767.coefficient154_317,
    output := OriginalRow227TriangleData1774.coefficient155_317, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_319, Icur := OriginalRow227TriangleData1767.coefficient154_318,
    output := OriginalRow227TriangleData1774.coefficient155_318, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_320, Icur := OriginalRow227TriangleData1767.coefficient154_319,
    output := OriginalRow227TriangleData1774.coefficient155_319, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_321, Icur := OriginalRow227TriangleData1767.coefficient154_320,
    output := OriginalRow227TriangleData1774.coefficient155_320, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_322, Icur := OriginalRow227TriangleData1767.coefficient154_321,
    output := OriginalRow227TriangleData1774.coefficient155_321, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_323, Icur := OriginalRow227TriangleData1767.coefficient154_322,
    output := OriginalRow227TriangleData1774.coefficient155_322, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_324, Icur := OriginalRow227TriangleData1767.coefficient154_323,
    output := OriginalRow227TriangleData1774.coefficient155_323, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_325, Icur := OriginalRow227TriangleData1767.coefficient154_324,
    output := OriginalRow227TriangleData1774.coefficient155_324, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_326, Icur := OriginalRow227TriangleData1767.coefficient154_325,
    output := OriginalRow227TriangleData1774.coefficient155_325, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_327, Icur := OriginalRow227TriangleData1767.coefficient154_326,
    output := OriginalRow227TriangleData1774.coefficient155_326, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_328, Icur := OriginalRow227TriangleData1767.coefficient154_327,
    output := OriginalRow227TriangleData1774.coefficient155_327, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_329, Icur := OriginalRow227TriangleData1767.coefficient154_328,
    output := OriginalRow227TriangleData1774.coefficient155_328, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_330, Icur := OriginalRow227TriangleData1767.coefficient154_329,
    output := OriginalRow227TriangleData1774.coefficient155_329, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_331, Icur := OriginalRow227TriangleData1767.coefficient154_330,
    output := OriginalRow227TriangleData1774.coefficient155_330, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_332, Icur := OriginalRow227TriangleData1767.coefficient154_331,
    output := OriginalRow227TriangleData1774.coefficient155_331, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_333, Icur := OriginalRow227TriangleData1767.coefficient154_332,
    output := OriginalRow227TriangleData1774.coefficient155_332, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_334, Icur := OriginalRow227TriangleData1767.coefficient154_333,
    output := OriginalRow227TriangleData1774.coefficient155_333, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_335, Icur := OriginalRow227TriangleData1767.coefficient154_334,
    output := OriginalRow227TriangleData1774.coefficient155_334, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_336, Icur := OriginalRow227TriangleData1767.coefficient154_335,
    output := OriginalRow227TriangleData1774.coefficient155_335, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_337, Icur := OriginalRow227TriangleData1767.coefficient154_336,
    output := OriginalRow227TriangleData1774.coefficient155_336, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_338, Icur := OriginalRow227TriangleData1767.coefficient154_337,
    output := OriginalRow227TriangleData1774.coefficient155_337, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_339, Icur := OriginalRow227TriangleData1767.coefficient154_338,
    output := OriginalRow227TriangleData1774.coefficient155_338, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_340, Icur := OriginalRow227TriangleData1767.coefficient154_339,
    output := OriginalRow227TriangleData1774.coefficient155_339, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_341, Icur := OriginalRow227TriangleData1767.coefficient154_340,
    output := OriginalRow227TriangleData1774.coefficient155_340, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_342, Icur := OriginalRow227TriangleData1767.coefficient154_341,
    output := OriginalRow227TriangleData1774.coefficient155_341, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots10.root343, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_343, Icur := OriginalRow227TriangleData1767.coefficient154_342,
    output := OriginalRow227TriangleData1774.coefficient155_342, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots10.root344, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1767.coefficient154_344, Icur := OriginalRow227TriangleData1767.coefficient154_343,
    output := OriginalRow227TriangleData1774.coefficient155_343, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots10.root345, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1768.coefficient154_345, Icur := OriginalRow227TriangleData1767.coefficient154_344,
    output := OriginalRow227TriangleData1774.coefficient155_344, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots10.root346, IC := OriginalRow227TriangleRoots04.root155,
    Inext := OriginalRow227TriangleData1768.coefficient154_346, Icur := OriginalRow227TriangleData1768.coefficient154_345,
    output := OriginalRow227TriangleData1774.coefficient155_345, hC := OriginalRow227TriangleRoots04.root155_pos, hAC := OriginalRow227TriangleRoots04.product155_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1758

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1758.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

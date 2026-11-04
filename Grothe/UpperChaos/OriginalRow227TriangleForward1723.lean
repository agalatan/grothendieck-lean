import Grothe.UpperChaos.OriginalRow227TriangleData1732
import Grothe.UpperChaos.OriginalRow227TriangleData1733
import Grothe.UpperChaos.OriginalRow227TriangleData1739
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1723
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_310, Icur := OriginalRow227TriangleData1732.coefficient149_309,
    output := OriginalRow227TriangleData1739.coefficient150_309, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_311, Icur := OriginalRow227TriangleData1732.coefficient149_310,
    output := OriginalRow227TriangleData1739.coefficient150_310, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_312, Icur := OriginalRow227TriangleData1732.coefficient149_311,
    output := OriginalRow227TriangleData1739.coefficient150_311, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_313, Icur := OriginalRow227TriangleData1732.coefficient149_312,
    output := OriginalRow227TriangleData1739.coefficient150_312, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_314, Icur := OriginalRow227TriangleData1732.coefficient149_313,
    output := OriginalRow227TriangleData1739.coefficient150_313, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_315, Icur := OriginalRow227TriangleData1732.coefficient149_314,
    output := OriginalRow227TriangleData1739.coefficient150_314, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_316, Icur := OriginalRow227TriangleData1732.coefficient149_315,
    output := OriginalRow227TriangleData1739.coefficient150_315, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_317, Icur := OriginalRow227TriangleData1732.coefficient149_316,
    output := OriginalRow227TriangleData1739.coefficient150_316, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_318, Icur := OriginalRow227TriangleData1732.coefficient149_317,
    output := OriginalRow227TriangleData1739.coefficient150_317, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_319, Icur := OriginalRow227TriangleData1732.coefficient149_318,
    output := OriginalRow227TriangleData1739.coefficient150_318, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_320, Icur := OriginalRow227TriangleData1732.coefficient149_319,
    output := OriginalRow227TriangleData1739.coefficient150_319, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_321, Icur := OriginalRow227TriangleData1732.coefficient149_320,
    output := OriginalRow227TriangleData1739.coefficient150_320, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_322, Icur := OriginalRow227TriangleData1732.coefficient149_321,
    output := OriginalRow227TriangleData1739.coefficient150_321, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_323, Icur := OriginalRow227TriangleData1732.coefficient149_322,
    output := OriginalRow227TriangleData1739.coefficient150_322, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_324, Icur := OriginalRow227TriangleData1732.coefficient149_323,
    output := OriginalRow227TriangleData1739.coefficient150_323, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_325, Icur := OriginalRow227TriangleData1732.coefficient149_324,
    output := OriginalRow227TriangleData1739.coefficient150_324, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_326, Icur := OriginalRow227TriangleData1732.coefficient149_325,
    output := OriginalRow227TriangleData1739.coefficient150_325, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_327, Icur := OriginalRow227TriangleData1732.coefficient149_326,
    output := OriginalRow227TriangleData1739.coefficient150_326, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_328, Icur := OriginalRow227TriangleData1732.coefficient149_327,
    output := OriginalRow227TriangleData1739.coefficient150_327, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_329, Icur := OriginalRow227TriangleData1732.coefficient149_328,
    output := OriginalRow227TriangleData1739.coefficient150_328, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_330, Icur := OriginalRow227TriangleData1732.coefficient149_329,
    output := OriginalRow227TriangleData1739.coefficient150_329, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_331, Icur := OriginalRow227TriangleData1732.coefficient149_330,
    output := OriginalRow227TriangleData1739.coefficient150_330, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_332, Icur := OriginalRow227TriangleData1732.coefficient149_331,
    output := OriginalRow227TriangleData1739.coefficient150_331, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_333, Icur := OriginalRow227TriangleData1732.coefficient149_332,
    output := OriginalRow227TriangleData1739.coefficient150_332, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_334, Icur := OriginalRow227TriangleData1732.coefficient149_333,
    output := OriginalRow227TriangleData1739.coefficient150_333, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_335, Icur := OriginalRow227TriangleData1732.coefficient149_334,
    output := OriginalRow227TriangleData1739.coefficient150_334, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_336, Icur := OriginalRow227TriangleData1732.coefficient149_335,
    output := OriginalRow227TriangleData1739.coefficient150_335, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_337, Icur := OriginalRow227TriangleData1732.coefficient149_336,
    output := OriginalRow227TriangleData1739.coefficient150_336, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_338, Icur := OriginalRow227TriangleData1732.coefficient149_337,
    output := OriginalRow227TriangleData1739.coefficient150_337, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1732.coefficient149_339, Icur := OriginalRow227TriangleData1732.coefficient149_338,
    output := OriginalRow227TriangleData1739.coefficient150_338, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1733.coefficient149_340, Icur := OriginalRow227TriangleData1732.coefficient149_339,
    output := OriginalRow227TriangleData1739.coefficient150_339, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots04.root150,
    Inext := OriginalRow227TriangleData1733.coefficient149_341, Icur := OriginalRow227TriangleData1733.coefficient149_340,
    output := OriginalRow227TriangleData1739.coefficient150_340, hC := OriginalRow227TriangleRoots04.root150_pos, hAC := OriginalRow227TriangleRoots04.product150_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1723

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1723.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

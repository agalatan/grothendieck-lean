import Grothe.UpperChaos.OriginalRow227TriangleData1725
import Grothe.UpperChaos.OriginalRow227TriangleData1726
import Grothe.UpperChaos.OriginalRow227TriangleData1732
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1716
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_309, Icur := OriginalRow227TriangleData1725.coefficient148_308,
    output := OriginalRow227TriangleData1732.coefficient149_308, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_310, Icur := OriginalRow227TriangleData1725.coefficient148_309,
    output := OriginalRow227TriangleData1732.coefficient149_309, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_311, Icur := OriginalRow227TriangleData1725.coefficient148_310,
    output := OriginalRow227TriangleData1732.coefficient149_310, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_312, Icur := OriginalRow227TriangleData1725.coefficient148_311,
    output := OriginalRow227TriangleData1732.coefficient149_311, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_313, Icur := OriginalRow227TriangleData1725.coefficient148_312,
    output := OriginalRow227TriangleData1732.coefficient149_312, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_314, Icur := OriginalRow227TriangleData1725.coefficient148_313,
    output := OriginalRow227TriangleData1732.coefficient149_313, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_315, Icur := OriginalRow227TriangleData1725.coefficient148_314,
    output := OriginalRow227TriangleData1732.coefficient149_314, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_316, Icur := OriginalRow227TriangleData1725.coefficient148_315,
    output := OriginalRow227TriangleData1732.coefficient149_315, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_317, Icur := OriginalRow227TriangleData1725.coefficient148_316,
    output := OriginalRow227TriangleData1732.coefficient149_316, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_318, Icur := OriginalRow227TriangleData1725.coefficient148_317,
    output := OriginalRow227TriangleData1732.coefficient149_317, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_319, Icur := OriginalRow227TriangleData1725.coefficient148_318,
    output := OriginalRow227TriangleData1732.coefficient149_318, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_320, Icur := OriginalRow227TriangleData1725.coefficient148_319,
    output := OriginalRow227TriangleData1732.coefficient149_319, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_321, Icur := OriginalRow227TriangleData1725.coefficient148_320,
    output := OriginalRow227TriangleData1732.coefficient149_320, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_322, Icur := OriginalRow227TriangleData1725.coefficient148_321,
    output := OriginalRow227TriangleData1732.coefficient149_321, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_323, Icur := OriginalRow227TriangleData1725.coefficient148_322,
    output := OriginalRow227TriangleData1732.coefficient149_322, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_324, Icur := OriginalRow227TriangleData1725.coefficient148_323,
    output := OriginalRow227TriangleData1732.coefficient149_323, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_325, Icur := OriginalRow227TriangleData1725.coefficient148_324,
    output := OriginalRow227TriangleData1732.coefficient149_324, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_326, Icur := OriginalRow227TriangleData1725.coefficient148_325,
    output := OriginalRow227TriangleData1732.coefficient149_325, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_327, Icur := OriginalRow227TriangleData1725.coefficient148_326,
    output := OriginalRow227TriangleData1732.coefficient149_326, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_328, Icur := OriginalRow227TriangleData1725.coefficient148_327,
    output := OriginalRow227TriangleData1732.coefficient149_327, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_329, Icur := OriginalRow227TriangleData1725.coefficient148_328,
    output := OriginalRow227TriangleData1732.coefficient149_328, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_330, Icur := OriginalRow227TriangleData1725.coefficient148_329,
    output := OriginalRow227TriangleData1732.coefficient149_329, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_331, Icur := OriginalRow227TriangleData1725.coefficient148_330,
    output := OriginalRow227TriangleData1732.coefficient149_330, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_332, Icur := OriginalRow227TriangleData1725.coefficient148_331,
    output := OriginalRow227TriangleData1732.coefficient149_331, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_333, Icur := OriginalRow227TriangleData1725.coefficient148_332,
    output := OriginalRow227TriangleData1732.coefficient149_332, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_334, Icur := OriginalRow227TriangleData1725.coefficient148_333,
    output := OriginalRow227TriangleData1732.coefficient149_333, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_335, Icur := OriginalRow227TriangleData1725.coefficient148_334,
    output := OriginalRow227TriangleData1732.coefficient149_334, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_336, Icur := OriginalRow227TriangleData1725.coefficient148_335,
    output := OriginalRow227TriangleData1732.coefficient149_335, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_337, Icur := OriginalRow227TriangleData1725.coefficient148_336,
    output := OriginalRow227TriangleData1732.coefficient149_336, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1725.coefficient148_338, Icur := OriginalRow227TriangleData1725.coefficient148_337,
    output := OriginalRow227TriangleData1732.coefficient149_337, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1726.coefficient148_339, Icur := OriginalRow227TriangleData1725.coefficient148_338,
    output := OriginalRow227TriangleData1732.coefficient149_338, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots04.root149,
    Inext := OriginalRow227TriangleData1726.coefficient148_340, Icur := OriginalRow227TriangleData1726.coefficient148_339,
    output := OriginalRow227TriangleData1732.coefficient149_339, hC := OriginalRow227TriangleRoots04.root149_pos, hAC := OriginalRow227TriangleRoots04.product149_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1716

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1716.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData1452
import Grothe.UpperChaos.OriginalRow227TriangleData1453
import Grothe.UpperChaos.OriginalRow227TriangleData1461
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1445
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_307, Icur := OriginalRow227TriangleData1452.coefficient114_306,
    output := OriginalRow227TriangleData1461.coefficient115_306, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_308, Icur := OriginalRow227TriangleData1452.coefficient114_307,
    output := OriginalRow227TriangleData1461.coefficient115_307, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_309, Icur := OriginalRow227TriangleData1452.coefficient114_308,
    output := OriginalRow227TriangleData1461.coefficient115_308, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_310, Icur := OriginalRow227TriangleData1452.coefficient114_309,
    output := OriginalRow227TriangleData1461.coefficient115_309, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_311, Icur := OriginalRow227TriangleData1452.coefficient114_310,
    output := OriginalRow227TriangleData1461.coefficient115_310, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_312, Icur := OriginalRow227TriangleData1452.coefficient114_311,
    output := OriginalRow227TriangleData1461.coefficient115_311, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_313, Icur := OriginalRow227TriangleData1452.coefficient114_312,
    output := OriginalRow227TriangleData1461.coefficient115_312, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_314, Icur := OriginalRow227TriangleData1452.coefficient114_313,
    output := OriginalRow227TriangleData1461.coefficient115_313, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_315, Icur := OriginalRow227TriangleData1452.coefficient114_314,
    output := OriginalRow227TriangleData1461.coefficient115_314, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_316, Icur := OriginalRow227TriangleData1452.coefficient114_315,
    output := OriginalRow227TriangleData1461.coefficient115_315, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_317, Icur := OriginalRow227TriangleData1452.coefficient114_316,
    output := OriginalRow227TriangleData1461.coefficient115_316, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_318, Icur := OriginalRow227TriangleData1452.coefficient114_317,
    output := OriginalRow227TriangleData1461.coefficient115_317, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_319, Icur := OriginalRow227TriangleData1452.coefficient114_318,
    output := OriginalRow227TriangleData1461.coefficient115_318, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_320, Icur := OriginalRow227TriangleData1452.coefficient114_319,
    output := OriginalRow227TriangleData1461.coefficient115_319, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_321, Icur := OriginalRow227TriangleData1452.coefficient114_320,
    output := OriginalRow227TriangleData1461.coefficient115_320, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_322, Icur := OriginalRow227TriangleData1452.coefficient114_321,
    output := OriginalRow227TriangleData1461.coefficient115_321, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_323, Icur := OriginalRow227TriangleData1452.coefficient114_322,
    output := OriginalRow227TriangleData1461.coefficient115_322, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_324, Icur := OriginalRow227TriangleData1452.coefficient114_323,
    output := OriginalRow227TriangleData1461.coefficient115_323, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_325, Icur := OriginalRow227TriangleData1452.coefficient114_324,
    output := OriginalRow227TriangleData1461.coefficient115_324, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_326, Icur := OriginalRow227TriangleData1452.coefficient114_325,
    output := OriginalRow227TriangleData1461.coefficient115_325, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_327, Icur := OriginalRow227TriangleData1452.coefficient114_326,
    output := OriginalRow227TriangleData1461.coefficient115_326, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_328, Icur := OriginalRow227TriangleData1452.coefficient114_327,
    output := OriginalRow227TriangleData1461.coefficient115_327, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_329, Icur := OriginalRow227TriangleData1452.coefficient114_328,
    output := OriginalRow227TriangleData1461.coefficient115_328, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_330, Icur := OriginalRow227TriangleData1452.coefficient114_329,
    output := OriginalRow227TriangleData1461.coefficient115_329, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_331, Icur := OriginalRow227TriangleData1452.coefficient114_330,
    output := OriginalRow227TriangleData1461.coefficient115_330, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_332, Icur := OriginalRow227TriangleData1452.coefficient114_331,
    output := OriginalRow227TriangleData1461.coefficient115_331, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_333, Icur := OriginalRow227TriangleData1452.coefficient114_332,
    output := OriginalRow227TriangleData1461.coefficient115_332, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_334, Icur := OriginalRow227TriangleData1452.coefficient114_333,
    output := OriginalRow227TriangleData1461.coefficient115_333, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_335, Icur := OriginalRow227TriangleData1452.coefficient114_334,
    output := OriginalRow227TriangleData1461.coefficient115_334, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1452.coefficient114_336, Icur := OriginalRow227TriangleData1452.coefficient114_335,
    output := OriginalRow227TriangleData1461.coefficient115_335, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_337, Icur := OriginalRow227TriangleData1452.coefficient114_336,
    output := OriginalRow227TriangleData1461.coefficient115_336, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots03.root115,
    Inext := OriginalRow227TriangleData1453.coefficient114_338, Icur := OriginalRow227TriangleData1453.coefficient114_337,
    output := OriginalRow227TriangleData1461.coefficient115_337, hC := OriginalRow227TriangleRoots03.root115_pos, hAC := OriginalRow227TriangleRoots03.product115_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1445

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1445.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

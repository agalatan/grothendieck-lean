import Grothe.UpperChaos.OriginalRow227TriangleData1629
import Grothe.UpperChaos.OriginalRow227TriangleData1630
import Grothe.UpperChaos.OriginalRow227TriangleData1637
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1621
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_296, Icur := OriginalRow227TriangleData1629.coefficient135_295,
    output := OriginalRow227TriangleData1637.coefficient136_295, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_297, Icur := OriginalRow227TriangleData1629.coefficient135_296,
    output := OriginalRow227TriangleData1637.coefficient136_296, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_298, Icur := OriginalRow227TriangleData1629.coefficient135_297,
    output := OriginalRow227TriangleData1637.coefficient136_297, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_299, Icur := OriginalRow227TriangleData1629.coefficient135_298,
    output := OriginalRow227TriangleData1637.coefficient136_298, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_300, Icur := OriginalRow227TriangleData1629.coefficient135_299,
    output := OriginalRow227TriangleData1637.coefficient136_299, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_301, Icur := OriginalRow227TriangleData1629.coefficient135_300,
    output := OriginalRow227TriangleData1637.coefficient136_300, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_302, Icur := OriginalRow227TriangleData1629.coefficient135_301,
    output := OriginalRow227TriangleData1637.coefficient136_301, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_303, Icur := OriginalRow227TriangleData1629.coefficient135_302,
    output := OriginalRow227TriangleData1637.coefficient136_302, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_304, Icur := OriginalRow227TriangleData1629.coefficient135_303,
    output := OriginalRow227TriangleData1637.coefficient136_303, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_305, Icur := OriginalRow227TriangleData1629.coefficient135_304,
    output := OriginalRow227TriangleData1637.coefficient136_304, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_306, Icur := OriginalRow227TriangleData1629.coefficient135_305,
    output := OriginalRow227TriangleData1637.coefficient136_305, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_307, Icur := OriginalRow227TriangleData1629.coefficient135_306,
    output := OriginalRow227TriangleData1637.coefficient136_306, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_308, Icur := OriginalRow227TriangleData1629.coefficient135_307,
    output := OriginalRow227TriangleData1637.coefficient136_307, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_309, Icur := OriginalRow227TriangleData1629.coefficient135_308,
    output := OriginalRow227TriangleData1637.coefficient136_308, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_310, Icur := OriginalRow227TriangleData1629.coefficient135_309,
    output := OriginalRow227TriangleData1637.coefficient136_309, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_311, Icur := OriginalRow227TriangleData1629.coefficient135_310,
    output := OriginalRow227TriangleData1637.coefficient136_310, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_312, Icur := OriginalRow227TriangleData1629.coefficient135_311,
    output := OriginalRow227TriangleData1637.coefficient136_311, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_313, Icur := OriginalRow227TriangleData1629.coefficient135_312,
    output := OriginalRow227TriangleData1637.coefficient136_312, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_314, Icur := OriginalRow227TriangleData1629.coefficient135_313,
    output := OriginalRow227TriangleData1637.coefficient136_313, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_315, Icur := OriginalRow227TriangleData1629.coefficient135_314,
    output := OriginalRow227TriangleData1637.coefficient136_314, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_316, Icur := OriginalRow227TriangleData1629.coefficient135_315,
    output := OriginalRow227TriangleData1637.coefficient136_315, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_317, Icur := OriginalRow227TriangleData1629.coefficient135_316,
    output := OriginalRow227TriangleData1637.coefficient136_316, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_318, Icur := OriginalRow227TriangleData1629.coefficient135_317,
    output := OriginalRow227TriangleData1637.coefficient136_317, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_319, Icur := OriginalRow227TriangleData1629.coefficient135_318,
    output := OriginalRow227TriangleData1637.coefficient136_318, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_320, Icur := OriginalRow227TriangleData1629.coefficient135_319,
    output := OriginalRow227TriangleData1637.coefficient136_319, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_321, Icur := OriginalRow227TriangleData1629.coefficient135_320,
    output := OriginalRow227TriangleData1637.coefficient136_320, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_322, Icur := OriginalRow227TriangleData1629.coefficient135_321,
    output := OriginalRow227TriangleData1637.coefficient136_321, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_323, Icur := OriginalRow227TriangleData1629.coefficient135_322,
    output := OriginalRow227TriangleData1637.coefficient136_322, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_324, Icur := OriginalRow227TriangleData1629.coefficient135_323,
    output := OriginalRow227TriangleData1637.coefficient136_323, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1629.coefficient135_325, Icur := OriginalRow227TriangleData1629.coefficient135_324,
    output := OriginalRow227TriangleData1637.coefficient136_324, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1630.coefficient135_326, Icur := OriginalRow227TriangleData1629.coefficient135_325,
    output := OriginalRow227TriangleData1637.coefficient136_325, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots04.root136,
    Inext := OriginalRow227TriangleData1630.coefficient135_327, Icur := OriginalRow227TriangleData1630.coefficient135_326,
    output := OriginalRow227TriangleData1637.coefficient136_326, hC := OriginalRow227TriangleRoots04.root136_pos, hAC := OriginalRow227TriangleRoots04.product136_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1621

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1621.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

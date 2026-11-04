import Grothe.UpperChaos.OriginalRow227TriangleData1589
import Grothe.UpperChaos.OriginalRow227TriangleData1590
import Grothe.UpperChaos.OriginalRow227TriangleData1597
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1581
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_291, Icur := OriginalRow227TriangleData1589.coefficient130_290,
    output := OriginalRow227TriangleData1597.coefficient131_290, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_292, Icur := OriginalRow227TriangleData1589.coefficient130_291,
    output := OriginalRow227TriangleData1597.coefficient131_291, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_293, Icur := OriginalRow227TriangleData1589.coefficient130_292,
    output := OriginalRow227TriangleData1597.coefficient131_292, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_294, Icur := OriginalRow227TriangleData1589.coefficient130_293,
    output := OriginalRow227TriangleData1597.coefficient131_293, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_295, Icur := OriginalRow227TriangleData1589.coefficient130_294,
    output := OriginalRow227TriangleData1597.coefficient131_294, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_296, Icur := OriginalRow227TriangleData1589.coefficient130_295,
    output := OriginalRow227TriangleData1597.coefficient131_295, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_297, Icur := OriginalRow227TriangleData1589.coefficient130_296,
    output := OriginalRow227TriangleData1597.coefficient131_296, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_298, Icur := OriginalRow227TriangleData1589.coefficient130_297,
    output := OriginalRow227TriangleData1597.coefficient131_297, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_299, Icur := OriginalRow227TriangleData1589.coefficient130_298,
    output := OriginalRow227TriangleData1597.coefficient131_298, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_300, Icur := OriginalRow227TriangleData1589.coefficient130_299,
    output := OriginalRow227TriangleData1597.coefficient131_299, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_301, Icur := OriginalRow227TriangleData1589.coefficient130_300,
    output := OriginalRow227TriangleData1597.coefficient131_300, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_302, Icur := OriginalRow227TriangleData1589.coefficient130_301,
    output := OriginalRow227TriangleData1597.coefficient131_301, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_303, Icur := OriginalRow227TriangleData1589.coefficient130_302,
    output := OriginalRow227TriangleData1597.coefficient131_302, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_304, Icur := OriginalRow227TriangleData1589.coefficient130_303,
    output := OriginalRow227TriangleData1597.coefficient131_303, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_305, Icur := OriginalRow227TriangleData1589.coefficient130_304,
    output := OriginalRow227TriangleData1597.coefficient131_304, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_306, Icur := OriginalRow227TriangleData1589.coefficient130_305,
    output := OriginalRow227TriangleData1597.coefficient131_305, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_307, Icur := OriginalRow227TriangleData1589.coefficient130_306,
    output := OriginalRow227TriangleData1597.coefficient131_306, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_308, Icur := OriginalRow227TriangleData1589.coefficient130_307,
    output := OriginalRow227TriangleData1597.coefficient131_307, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_309, Icur := OriginalRow227TriangleData1589.coefficient130_308,
    output := OriginalRow227TriangleData1597.coefficient131_308, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_310, Icur := OriginalRow227TriangleData1589.coefficient130_309,
    output := OriginalRow227TriangleData1597.coefficient131_309, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_311, Icur := OriginalRow227TriangleData1589.coefficient130_310,
    output := OriginalRow227TriangleData1597.coefficient131_310, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_312, Icur := OriginalRow227TriangleData1589.coefficient130_311,
    output := OriginalRow227TriangleData1597.coefficient131_311, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_313, Icur := OriginalRow227TriangleData1589.coefficient130_312,
    output := OriginalRow227TriangleData1597.coefficient131_312, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_314, Icur := OriginalRow227TriangleData1589.coefficient130_313,
    output := OriginalRow227TriangleData1597.coefficient131_313, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_315, Icur := OriginalRow227TriangleData1589.coefficient130_314,
    output := OriginalRow227TriangleData1597.coefficient131_314, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_316, Icur := OriginalRow227TriangleData1589.coefficient130_315,
    output := OriginalRow227TriangleData1597.coefficient131_315, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_317, Icur := OriginalRow227TriangleData1589.coefficient130_316,
    output := OriginalRow227TriangleData1597.coefficient131_316, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_318, Icur := OriginalRow227TriangleData1589.coefficient130_317,
    output := OriginalRow227TriangleData1597.coefficient131_317, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_319, Icur := OriginalRow227TriangleData1589.coefficient130_318,
    output := OriginalRow227TriangleData1597.coefficient131_318, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1589.coefficient130_320, Icur := OriginalRow227TriangleData1589.coefficient130_319,
    output := OriginalRow227TriangleData1597.coefficient131_319, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1590.coefficient130_321, Icur := OriginalRow227TriangleData1589.coefficient130_320,
    output := OriginalRow227TriangleData1597.coefficient131_320, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots04.root131,
    Inext := OriginalRow227TriangleData1590.coefficient130_322, Icur := OriginalRow227TriangleData1590.coefficient130_321,
    output := OriginalRow227TriangleData1597.coefficient131_321, hC := OriginalRow227TriangleRoots04.root131_pos, hAC := OriginalRow227TriangleRoots04.product131_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1581

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1581.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

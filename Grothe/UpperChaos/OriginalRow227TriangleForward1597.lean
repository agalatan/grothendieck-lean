import Grothe.UpperChaos.OriginalRow227TriangleData1605
import Grothe.UpperChaos.OriginalRow227TriangleData1606
import Grothe.UpperChaos.OriginalRow227TriangleData1613
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1597
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_293, Icur := OriginalRow227TriangleData1605.coefficient132_292,
    output := OriginalRow227TriangleData1613.coefficient133_292, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_294, Icur := OriginalRow227TriangleData1605.coefficient132_293,
    output := OriginalRow227TriangleData1613.coefficient133_293, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_295, Icur := OriginalRow227TriangleData1605.coefficient132_294,
    output := OriginalRow227TriangleData1613.coefficient133_294, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_296, Icur := OriginalRow227TriangleData1605.coefficient132_295,
    output := OriginalRow227TriangleData1613.coefficient133_295, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_297, Icur := OriginalRow227TriangleData1605.coefficient132_296,
    output := OriginalRow227TriangleData1613.coefficient133_296, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_298, Icur := OriginalRow227TriangleData1605.coefficient132_297,
    output := OriginalRow227TriangleData1613.coefficient133_297, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_299, Icur := OriginalRow227TriangleData1605.coefficient132_298,
    output := OriginalRow227TriangleData1613.coefficient133_298, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_300, Icur := OriginalRow227TriangleData1605.coefficient132_299,
    output := OriginalRow227TriangleData1613.coefficient133_299, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_301, Icur := OriginalRow227TriangleData1605.coefficient132_300,
    output := OriginalRow227TriangleData1613.coefficient133_300, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_302, Icur := OriginalRow227TriangleData1605.coefficient132_301,
    output := OriginalRow227TriangleData1613.coefficient133_301, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_303, Icur := OriginalRow227TriangleData1605.coefficient132_302,
    output := OriginalRow227TriangleData1613.coefficient133_302, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_304, Icur := OriginalRow227TriangleData1605.coefficient132_303,
    output := OriginalRow227TriangleData1613.coefficient133_303, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_305, Icur := OriginalRow227TriangleData1605.coefficient132_304,
    output := OriginalRow227TriangleData1613.coefficient133_304, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_306, Icur := OriginalRow227TriangleData1605.coefficient132_305,
    output := OriginalRow227TriangleData1613.coefficient133_305, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_307, Icur := OriginalRow227TriangleData1605.coefficient132_306,
    output := OriginalRow227TriangleData1613.coefficient133_306, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_308, Icur := OriginalRow227TriangleData1605.coefficient132_307,
    output := OriginalRow227TriangleData1613.coefficient133_307, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_309, Icur := OriginalRow227TriangleData1605.coefficient132_308,
    output := OriginalRow227TriangleData1613.coefficient133_308, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_310, Icur := OriginalRow227TriangleData1605.coefficient132_309,
    output := OriginalRow227TriangleData1613.coefficient133_309, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_311, Icur := OriginalRow227TriangleData1605.coefficient132_310,
    output := OriginalRow227TriangleData1613.coefficient133_310, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_312, Icur := OriginalRow227TriangleData1605.coefficient132_311,
    output := OriginalRow227TriangleData1613.coefficient133_311, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_313, Icur := OriginalRow227TriangleData1605.coefficient132_312,
    output := OriginalRow227TriangleData1613.coefficient133_312, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_314, Icur := OriginalRow227TriangleData1605.coefficient132_313,
    output := OriginalRow227TriangleData1613.coefficient133_313, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_315, Icur := OriginalRow227TriangleData1605.coefficient132_314,
    output := OriginalRow227TriangleData1613.coefficient133_314, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_316, Icur := OriginalRow227TriangleData1605.coefficient132_315,
    output := OriginalRow227TriangleData1613.coefficient133_315, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_317, Icur := OriginalRow227TriangleData1605.coefficient132_316,
    output := OriginalRow227TriangleData1613.coefficient133_316, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_318, Icur := OriginalRow227TriangleData1605.coefficient132_317,
    output := OriginalRow227TriangleData1613.coefficient133_317, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_319, Icur := OriginalRow227TriangleData1605.coefficient132_318,
    output := OriginalRow227TriangleData1613.coefficient133_318, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_320, Icur := OriginalRow227TriangleData1605.coefficient132_319,
    output := OriginalRow227TriangleData1613.coefficient133_319, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_321, Icur := OriginalRow227TriangleData1605.coefficient132_320,
    output := OriginalRow227TriangleData1613.coefficient133_320, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_322, Icur := OriginalRow227TriangleData1605.coefficient132_321,
    output := OriginalRow227TriangleData1613.coefficient133_321, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1606.coefficient132_323, Icur := OriginalRow227TriangleData1605.coefficient132_322,
    output := OriginalRow227TriangleData1613.coefficient133_322, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1606.coefficient132_324, Icur := OriginalRow227TriangleData1606.coefficient132_323,
    output := OriginalRow227TriangleData1613.coefficient133_323, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1597

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1597.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

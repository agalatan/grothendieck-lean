import Grothe.UpperChaos.OriginalRow227TriangleData0073
import Grothe.UpperChaos.OriginalRow227TriangleData0074
import Grothe.UpperChaos.OriginalRow227TriangleData0089
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0073
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_293, Icur := OriginalRow227TriangleData0073.coefficient4_292,
    output := OriginalRow227TriangleData0089.coefficient5_292, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_294, Icur := OriginalRow227TriangleData0073.coefficient4_293,
    output := OriginalRow227TriangleData0089.coefficient5_293, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_295, Icur := OriginalRow227TriangleData0073.coefficient4_294,
    output := OriginalRow227TriangleData0089.coefficient5_294, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_296, Icur := OriginalRow227TriangleData0073.coefficient4_295,
    output := OriginalRow227TriangleData0089.coefficient5_295, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_297, Icur := OriginalRow227TriangleData0073.coefficient4_296,
    output := OriginalRow227TriangleData0089.coefficient5_296, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_298, Icur := OriginalRow227TriangleData0073.coefficient4_297,
    output := OriginalRow227TriangleData0089.coefficient5_297, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_299, Icur := OriginalRow227TriangleData0073.coefficient4_298,
    output := OriginalRow227TriangleData0089.coefficient5_298, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_300, Icur := OriginalRow227TriangleData0073.coefficient4_299,
    output := OriginalRow227TriangleData0089.coefficient5_299, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_301, Icur := OriginalRow227TriangleData0073.coefficient4_300,
    output := OriginalRow227TriangleData0089.coefficient5_300, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_302, Icur := OriginalRow227TriangleData0073.coefficient4_301,
    output := OriginalRow227TriangleData0089.coefficient5_301, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_303, Icur := OriginalRow227TriangleData0073.coefficient4_302,
    output := OriginalRow227TriangleData0089.coefficient5_302, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_304, Icur := OriginalRow227TriangleData0073.coefficient4_303,
    output := OriginalRow227TriangleData0089.coefficient5_303, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_305, Icur := OriginalRow227TriangleData0073.coefficient4_304,
    output := OriginalRow227TriangleData0089.coefficient5_304, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_306, Icur := OriginalRow227TriangleData0073.coefficient4_305,
    output := OriginalRow227TriangleData0089.coefficient5_305, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_307, Icur := OriginalRow227TriangleData0073.coefficient4_306,
    output := OriginalRow227TriangleData0089.coefficient5_306, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_308, Icur := OriginalRow227TriangleData0073.coefficient4_307,
    output := OriginalRow227TriangleData0089.coefficient5_307, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_309, Icur := OriginalRow227TriangleData0073.coefficient4_308,
    output := OriginalRow227TriangleData0089.coefficient5_308, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_310, Icur := OriginalRow227TriangleData0073.coefficient4_309,
    output := OriginalRow227TriangleData0089.coefficient5_309, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_311, Icur := OriginalRow227TriangleData0073.coefficient4_310,
    output := OriginalRow227TriangleData0089.coefficient5_310, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_312, Icur := OriginalRow227TriangleData0073.coefficient4_311,
    output := OriginalRow227TriangleData0089.coefficient5_311, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_313, Icur := OriginalRow227TriangleData0073.coefficient4_312,
    output := OriginalRow227TriangleData0089.coefficient5_312, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_314, Icur := OriginalRow227TriangleData0073.coefficient4_313,
    output := OriginalRow227TriangleData0089.coefficient5_313, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_315, Icur := OriginalRow227TriangleData0073.coefficient4_314,
    output := OriginalRow227TriangleData0089.coefficient5_314, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_316, Icur := OriginalRow227TriangleData0073.coefficient4_315,
    output := OriginalRow227TriangleData0089.coefficient5_315, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_317, Icur := OriginalRow227TriangleData0073.coefficient4_316,
    output := OriginalRow227TriangleData0089.coefficient5_316, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_318, Icur := OriginalRow227TriangleData0073.coefficient4_317,
    output := OriginalRow227TriangleData0089.coefficient5_317, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_319, Icur := OriginalRow227TriangleData0073.coefficient4_318,
    output := OriginalRow227TriangleData0089.coefficient5_318, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_320, Icur := OriginalRow227TriangleData0073.coefficient4_319,
    output := OriginalRow227TriangleData0089.coefficient5_319, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_321, Icur := OriginalRow227TriangleData0073.coefficient4_320,
    output := OriginalRow227TriangleData0089.coefficient5_320, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0073.coefficient4_322, Icur := OriginalRow227TriangleData0073.coefficient4_321,
    output := OriginalRow227TriangleData0089.coefficient5_321, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0074.coefficient4_323, Icur := OriginalRow227TriangleData0073.coefficient4_322,
    output := OriginalRow227TriangleData0089.coefficient5_322, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0074.coefficient4_324, Icur := OriginalRow227TriangleData0074.coefficient4_323,
    output := OriginalRow227TriangleData0089.coefficient5_323, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0073

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0073.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

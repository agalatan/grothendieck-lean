import Grothe.UpperChaos.OriginalRow227TriangleData0057
import Grothe.UpperChaos.OriginalRow227TriangleData0058
import Grothe.UpperChaos.OriginalRow227TriangleData0073
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0057
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_292, Icur := OriginalRow227TriangleData0057.coefficient3_291,
    output := OriginalRow227TriangleData0073.coefficient4_291, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_293, Icur := OriginalRow227TriangleData0057.coefficient3_292,
    output := OriginalRow227TriangleData0073.coefficient4_292, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_294, Icur := OriginalRow227TriangleData0057.coefficient3_293,
    output := OriginalRow227TriangleData0073.coefficient4_293, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_295, Icur := OriginalRow227TriangleData0057.coefficient3_294,
    output := OriginalRow227TriangleData0073.coefficient4_294, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_296, Icur := OriginalRow227TriangleData0057.coefficient3_295,
    output := OriginalRow227TriangleData0073.coefficient4_295, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_297, Icur := OriginalRow227TriangleData0057.coefficient3_296,
    output := OriginalRow227TriangleData0073.coefficient4_296, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_298, Icur := OriginalRow227TriangleData0057.coefficient3_297,
    output := OriginalRow227TriangleData0073.coefficient4_297, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_299, Icur := OriginalRow227TriangleData0057.coefficient3_298,
    output := OriginalRow227TriangleData0073.coefficient4_298, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_300, Icur := OriginalRow227TriangleData0057.coefficient3_299,
    output := OriginalRow227TriangleData0073.coefficient4_299, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_301, Icur := OriginalRow227TriangleData0057.coefficient3_300,
    output := OriginalRow227TriangleData0073.coefficient4_300, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_302, Icur := OriginalRow227TriangleData0057.coefficient3_301,
    output := OriginalRow227TriangleData0073.coefficient4_301, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_303, Icur := OriginalRow227TriangleData0057.coefficient3_302,
    output := OriginalRow227TriangleData0073.coefficient4_302, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_304, Icur := OriginalRow227TriangleData0057.coefficient3_303,
    output := OriginalRow227TriangleData0073.coefficient4_303, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_305, Icur := OriginalRow227TriangleData0057.coefficient3_304,
    output := OriginalRow227TriangleData0073.coefficient4_304, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_306, Icur := OriginalRow227TriangleData0057.coefficient3_305,
    output := OriginalRow227TriangleData0073.coefficient4_305, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_307, Icur := OriginalRow227TriangleData0057.coefficient3_306,
    output := OriginalRow227TriangleData0073.coefficient4_306, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_308, Icur := OriginalRow227TriangleData0057.coefficient3_307,
    output := OriginalRow227TriangleData0073.coefficient4_307, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_309, Icur := OriginalRow227TriangleData0057.coefficient3_308,
    output := OriginalRow227TriangleData0073.coefficient4_308, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_310, Icur := OriginalRow227TriangleData0057.coefficient3_309,
    output := OriginalRow227TriangleData0073.coefficient4_309, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_311, Icur := OriginalRow227TriangleData0057.coefficient3_310,
    output := OriginalRow227TriangleData0073.coefficient4_310, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_312, Icur := OriginalRow227TriangleData0057.coefficient3_311,
    output := OriginalRow227TriangleData0073.coefficient4_311, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_313, Icur := OriginalRow227TriangleData0057.coefficient3_312,
    output := OriginalRow227TriangleData0073.coefficient4_312, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_314, Icur := OriginalRow227TriangleData0057.coefficient3_313,
    output := OriginalRow227TriangleData0073.coefficient4_313, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_315, Icur := OriginalRow227TriangleData0057.coefficient3_314,
    output := OriginalRow227TriangleData0073.coefficient4_314, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_316, Icur := OriginalRow227TriangleData0057.coefficient3_315,
    output := OriginalRow227TriangleData0073.coefficient4_315, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_317, Icur := OriginalRow227TriangleData0057.coefficient3_316,
    output := OriginalRow227TriangleData0073.coefficient4_316, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_318, Icur := OriginalRow227TriangleData0057.coefficient3_317,
    output := OriginalRow227TriangleData0073.coefficient4_317, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_319, Icur := OriginalRow227TriangleData0057.coefficient3_318,
    output := OriginalRow227TriangleData0073.coefficient4_318, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_320, Icur := OriginalRow227TriangleData0057.coefficient3_319,
    output := OriginalRow227TriangleData0073.coefficient4_319, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0057.coefficient3_321, Icur := OriginalRow227TriangleData0057.coefficient3_320,
    output := OriginalRow227TriangleData0073.coefficient4_320, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0058.coefficient3_322, Icur := OriginalRow227TriangleData0057.coefficient3_321,
    output := OriginalRow227TriangleData0073.coefficient4_321, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0058.coefficient3_323, Icur := OriginalRow227TriangleData0058.coefficient3_322,
    output := OriginalRow227TriangleData0073.coefficient4_322, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0057

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0057.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

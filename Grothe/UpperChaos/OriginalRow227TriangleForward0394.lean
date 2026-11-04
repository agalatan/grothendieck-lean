import Grothe.UpperChaos.OriginalRow227TriangleData0395
import Grothe.UpperChaos.OriginalRow227TriangleData0396
import Grothe.UpperChaos.OriginalRow227TriangleData0410
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0394
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_282, Icur := OriginalRow227TriangleData0395.coefficient25_281,
    output := OriginalRow227TriangleData0410.coefficient26_281, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_283, Icur := OriginalRow227TriangleData0395.coefficient25_282,
    output := OriginalRow227TriangleData0410.coefficient26_282, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_284, Icur := OriginalRow227TriangleData0395.coefficient25_283,
    output := OriginalRow227TriangleData0410.coefficient26_283, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_285, Icur := OriginalRow227TriangleData0395.coefficient25_284,
    output := OriginalRow227TriangleData0410.coefficient26_284, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_286, Icur := OriginalRow227TriangleData0395.coefficient25_285,
    output := OriginalRow227TriangleData0410.coefficient26_285, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_287, Icur := OriginalRow227TriangleData0395.coefficient25_286,
    output := OriginalRow227TriangleData0410.coefficient26_286, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_288, Icur := OriginalRow227TriangleData0395.coefficient25_287,
    output := OriginalRow227TriangleData0410.coefficient26_287, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_289, Icur := OriginalRow227TriangleData0395.coefficient25_288,
    output := OriginalRow227TriangleData0410.coefficient26_288, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_290, Icur := OriginalRow227TriangleData0395.coefficient25_289,
    output := OriginalRow227TriangleData0410.coefficient26_289, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_291, Icur := OriginalRow227TriangleData0395.coefficient25_290,
    output := OriginalRow227TriangleData0410.coefficient26_290, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_292, Icur := OriginalRow227TriangleData0395.coefficient25_291,
    output := OriginalRow227TriangleData0410.coefficient26_291, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_293, Icur := OriginalRow227TriangleData0395.coefficient25_292,
    output := OriginalRow227TriangleData0410.coefficient26_292, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_294, Icur := OriginalRow227TriangleData0395.coefficient25_293,
    output := OriginalRow227TriangleData0410.coefficient26_293, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_295, Icur := OriginalRow227TriangleData0395.coefficient25_294,
    output := OriginalRow227TriangleData0410.coefficient26_294, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_296, Icur := OriginalRow227TriangleData0395.coefficient25_295,
    output := OriginalRow227TriangleData0410.coefficient26_295, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_297, Icur := OriginalRow227TriangleData0395.coefficient25_296,
    output := OriginalRow227TriangleData0410.coefficient26_296, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_298, Icur := OriginalRow227TriangleData0395.coefficient25_297,
    output := OriginalRow227TriangleData0410.coefficient26_297, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_299, Icur := OriginalRow227TriangleData0395.coefficient25_298,
    output := OriginalRow227TriangleData0410.coefficient26_298, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_300, Icur := OriginalRow227TriangleData0395.coefficient25_299,
    output := OriginalRow227TriangleData0410.coefficient26_299, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_301, Icur := OriginalRow227TriangleData0395.coefficient25_300,
    output := OriginalRow227TriangleData0410.coefficient26_300, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_302, Icur := OriginalRow227TriangleData0395.coefficient25_301,
    output := OriginalRow227TriangleData0410.coefficient26_301, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_303, Icur := OriginalRow227TriangleData0395.coefficient25_302,
    output := OriginalRow227TriangleData0410.coefficient26_302, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_304, Icur := OriginalRow227TriangleData0395.coefficient25_303,
    output := OriginalRow227TriangleData0410.coefficient26_303, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_305, Icur := OriginalRow227TriangleData0395.coefficient25_304,
    output := OriginalRow227TriangleData0410.coefficient26_304, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_306, Icur := OriginalRow227TriangleData0395.coefficient25_305,
    output := OriginalRow227TriangleData0410.coefficient26_305, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_307, Icur := OriginalRow227TriangleData0395.coefficient25_306,
    output := OriginalRow227TriangleData0410.coefficient26_306, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_308, Icur := OriginalRow227TriangleData0395.coefficient25_307,
    output := OriginalRow227TriangleData0410.coefficient26_307, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_309, Icur := OriginalRow227TriangleData0395.coefficient25_308,
    output := OriginalRow227TriangleData0410.coefficient26_308, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_310, Icur := OriginalRow227TriangleData0395.coefficient25_309,
    output := OriginalRow227TriangleData0410.coefficient26_309, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0395.coefficient25_311, Icur := OriginalRow227TriangleData0395.coefficient25_310,
    output := OriginalRow227TriangleData0410.coefficient26_310, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0396.coefficient25_312, Icur := OriginalRow227TriangleData0395.coefficient25_311,
    output := OriginalRow227TriangleData0410.coefficient26_311, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots00.root26,
    Inext := OriginalRow227TriangleData0396.coefficient25_313, Icur := OriginalRow227TriangleData0396.coefficient25_312,
    output := OriginalRow227TriangleData0410.coefficient26_312, hC := OriginalRow227TriangleRoots00.root26_pos, hAC := OriginalRow227TriangleRoots00.product26_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0394

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0394.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData0425
import Grothe.UpperChaos.OriginalRow227TriangleData0426
import Grothe.UpperChaos.OriginalRow227TriangleData0440
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0424
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_284, Icur := OriginalRow227TriangleData0425.coefficient27_283,
    output := OriginalRow227TriangleData0440.coefficient28_283, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_285, Icur := OriginalRow227TriangleData0425.coefficient27_284,
    output := OriginalRow227TriangleData0440.coefficient28_284, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_286, Icur := OriginalRow227TriangleData0425.coefficient27_285,
    output := OriginalRow227TriangleData0440.coefficient28_285, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_287, Icur := OriginalRow227TriangleData0425.coefficient27_286,
    output := OriginalRow227TriangleData0440.coefficient28_286, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_288, Icur := OriginalRow227TriangleData0425.coefficient27_287,
    output := OriginalRow227TriangleData0440.coefficient28_287, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_289, Icur := OriginalRow227TriangleData0425.coefficient27_288,
    output := OriginalRow227TriangleData0440.coefficient28_288, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_290, Icur := OriginalRow227TriangleData0425.coefficient27_289,
    output := OriginalRow227TriangleData0440.coefficient28_289, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_291, Icur := OriginalRow227TriangleData0425.coefficient27_290,
    output := OriginalRow227TriangleData0440.coefficient28_290, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_292, Icur := OriginalRow227TriangleData0425.coefficient27_291,
    output := OriginalRow227TriangleData0440.coefficient28_291, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_293, Icur := OriginalRow227TriangleData0425.coefficient27_292,
    output := OriginalRow227TriangleData0440.coefficient28_292, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_294, Icur := OriginalRow227TriangleData0425.coefficient27_293,
    output := OriginalRow227TriangleData0440.coefficient28_293, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_295, Icur := OriginalRow227TriangleData0425.coefficient27_294,
    output := OriginalRow227TriangleData0440.coefficient28_294, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_296, Icur := OriginalRow227TriangleData0425.coefficient27_295,
    output := OriginalRow227TriangleData0440.coefficient28_295, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_297, Icur := OriginalRow227TriangleData0425.coefficient27_296,
    output := OriginalRow227TriangleData0440.coefficient28_296, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_298, Icur := OriginalRow227TriangleData0425.coefficient27_297,
    output := OriginalRow227TriangleData0440.coefficient28_297, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_299, Icur := OriginalRow227TriangleData0425.coefficient27_298,
    output := OriginalRow227TriangleData0440.coefficient28_298, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_300, Icur := OriginalRow227TriangleData0425.coefficient27_299,
    output := OriginalRow227TriangleData0440.coefficient28_299, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_301, Icur := OriginalRow227TriangleData0425.coefficient27_300,
    output := OriginalRow227TriangleData0440.coefficient28_300, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_302, Icur := OriginalRow227TriangleData0425.coefficient27_301,
    output := OriginalRow227TriangleData0440.coefficient28_301, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_303, Icur := OriginalRow227TriangleData0425.coefficient27_302,
    output := OriginalRow227TriangleData0440.coefficient28_302, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_304, Icur := OriginalRow227TriangleData0425.coefficient27_303,
    output := OriginalRow227TriangleData0440.coefficient28_303, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_305, Icur := OriginalRow227TriangleData0425.coefficient27_304,
    output := OriginalRow227TriangleData0440.coefficient28_304, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_306, Icur := OriginalRow227TriangleData0425.coefficient27_305,
    output := OriginalRow227TriangleData0440.coefficient28_305, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_307, Icur := OriginalRow227TriangleData0425.coefficient27_306,
    output := OriginalRow227TriangleData0440.coefficient28_306, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_308, Icur := OriginalRow227TriangleData0425.coefficient27_307,
    output := OriginalRow227TriangleData0440.coefficient28_307, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_309, Icur := OriginalRow227TriangleData0425.coefficient27_308,
    output := OriginalRow227TriangleData0440.coefficient28_308, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_310, Icur := OriginalRow227TriangleData0425.coefficient27_309,
    output := OriginalRow227TriangleData0440.coefficient28_309, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_311, Icur := OriginalRow227TriangleData0425.coefficient27_310,
    output := OriginalRow227TriangleData0440.coefficient28_310, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_312, Icur := OriginalRow227TriangleData0425.coefficient27_311,
    output := OriginalRow227TriangleData0440.coefficient28_311, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0425.coefficient27_313, Icur := OriginalRow227TriangleData0425.coefficient27_312,
    output := OriginalRow227TriangleData0440.coefficient28_312, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_314, Icur := OriginalRow227TriangleData0425.coefficient27_313,
    output := OriginalRow227TriangleData0440.coefficient28_313, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0426.coefficient27_315, Icur := OriginalRow227TriangleData0426.coefficient27_314,
    output := OriginalRow227TriangleData0440.coefficient28_314, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0424

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0424.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

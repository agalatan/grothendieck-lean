import Grothe.UpperChaos.OriginalRow227TriangleData0496
import Grothe.UpperChaos.OriginalRow227TriangleData0497
import Grothe.UpperChaos.OriginalRow227TriangleData0510
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0494
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_289, Icur := OriginalRow227TriangleData0496.coefficient32_288,
    output := OriginalRow227TriangleData0510.coefficient33_288, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_290, Icur := OriginalRow227TriangleData0496.coefficient32_289,
    output := OriginalRow227TriangleData0510.coefficient33_289, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_291, Icur := OriginalRow227TriangleData0496.coefficient32_290,
    output := OriginalRow227TriangleData0510.coefficient33_290, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_292, Icur := OriginalRow227TriangleData0496.coefficient32_291,
    output := OriginalRow227TriangleData0510.coefficient33_291, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_293, Icur := OriginalRow227TriangleData0496.coefficient32_292,
    output := OriginalRow227TriangleData0510.coefficient33_292, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_294, Icur := OriginalRow227TriangleData0496.coefficient32_293,
    output := OriginalRow227TriangleData0510.coefficient33_293, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_295, Icur := OriginalRow227TriangleData0496.coefficient32_294,
    output := OriginalRow227TriangleData0510.coefficient33_294, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_296, Icur := OriginalRow227TriangleData0496.coefficient32_295,
    output := OriginalRow227TriangleData0510.coefficient33_295, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_297, Icur := OriginalRow227TriangleData0496.coefficient32_296,
    output := OriginalRow227TriangleData0510.coefficient33_296, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_298, Icur := OriginalRow227TriangleData0496.coefficient32_297,
    output := OriginalRow227TriangleData0510.coefficient33_297, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_299, Icur := OriginalRow227TriangleData0496.coefficient32_298,
    output := OriginalRow227TriangleData0510.coefficient33_298, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_300, Icur := OriginalRow227TriangleData0496.coefficient32_299,
    output := OriginalRow227TriangleData0510.coefficient33_299, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_301, Icur := OriginalRow227TriangleData0496.coefficient32_300,
    output := OriginalRow227TriangleData0510.coefficient33_300, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_302, Icur := OriginalRow227TriangleData0496.coefficient32_301,
    output := OriginalRow227TriangleData0510.coefficient33_301, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_303, Icur := OriginalRow227TriangleData0496.coefficient32_302,
    output := OriginalRow227TriangleData0510.coefficient33_302, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_304, Icur := OriginalRow227TriangleData0496.coefficient32_303,
    output := OriginalRow227TriangleData0510.coefficient33_303, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_305, Icur := OriginalRow227TriangleData0496.coefficient32_304,
    output := OriginalRow227TriangleData0510.coefficient33_304, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_306, Icur := OriginalRow227TriangleData0496.coefficient32_305,
    output := OriginalRow227TriangleData0510.coefficient33_305, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_307, Icur := OriginalRow227TriangleData0496.coefficient32_306,
    output := OriginalRow227TriangleData0510.coefficient33_306, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_308, Icur := OriginalRow227TriangleData0496.coefficient32_307,
    output := OriginalRow227TriangleData0510.coefficient33_307, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_309, Icur := OriginalRow227TriangleData0496.coefficient32_308,
    output := OriginalRow227TriangleData0510.coefficient33_308, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_310, Icur := OriginalRow227TriangleData0496.coefficient32_309,
    output := OriginalRow227TriangleData0510.coefficient33_309, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_311, Icur := OriginalRow227TriangleData0496.coefficient32_310,
    output := OriginalRow227TriangleData0510.coefficient33_310, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_312, Icur := OriginalRow227TriangleData0496.coefficient32_311,
    output := OriginalRow227TriangleData0510.coefficient33_311, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_313, Icur := OriginalRow227TriangleData0496.coefficient32_312,
    output := OriginalRow227TriangleData0510.coefficient33_312, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_314, Icur := OriginalRow227TriangleData0496.coefficient32_313,
    output := OriginalRow227TriangleData0510.coefficient33_313, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_315, Icur := OriginalRow227TriangleData0496.coefficient32_314,
    output := OriginalRow227TriangleData0510.coefficient33_314, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_316, Icur := OriginalRow227TriangleData0496.coefficient32_315,
    output := OriginalRow227TriangleData0510.coefficient33_315, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_317, Icur := OriginalRow227TriangleData0496.coefficient32_316,
    output := OriginalRow227TriangleData0510.coefficient33_316, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0496.coefficient32_318, Icur := OriginalRow227TriangleData0496.coefficient32_317,
    output := OriginalRow227TriangleData0510.coefficient33_317, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0497.coefficient32_319, Icur := OriginalRow227TriangleData0496.coefficient32_318,
    output := OriginalRow227TriangleData0510.coefficient33_318, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0497.coefficient32_320, Icur := OriginalRow227TriangleData0497.coefficient32_319,
    output := OriginalRow227TriangleData0510.coefficient33_319, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0494

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0494.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

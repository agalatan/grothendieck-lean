import Grothe.UpperChaos.OriginalRow227TriangleData0025
import Grothe.UpperChaos.OriginalRow227TriangleData0026
import Grothe.UpperChaos.OriginalRow227TriangleData0041
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0025
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_290, Icur := OriginalRow227TriangleData0025.coefficient1_289,
    output := OriginalRow227TriangleData0041.coefficient2_289, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_291, Icur := OriginalRow227TriangleData0025.coefficient1_290,
    output := OriginalRow227TriangleData0041.coefficient2_290, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_292, Icur := OriginalRow227TriangleData0025.coefficient1_291,
    output := OriginalRow227TriangleData0041.coefficient2_291, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_293, Icur := OriginalRow227TriangleData0025.coefficient1_292,
    output := OriginalRow227TriangleData0041.coefficient2_292, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_294, Icur := OriginalRow227TriangleData0025.coefficient1_293,
    output := OriginalRow227TriangleData0041.coefficient2_293, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_295, Icur := OriginalRow227TriangleData0025.coefficient1_294,
    output := OriginalRow227TriangleData0041.coefficient2_294, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_296, Icur := OriginalRow227TriangleData0025.coefficient1_295,
    output := OriginalRow227TriangleData0041.coefficient2_295, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_297, Icur := OriginalRow227TriangleData0025.coefficient1_296,
    output := OriginalRow227TriangleData0041.coefficient2_296, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_298, Icur := OriginalRow227TriangleData0025.coefficient1_297,
    output := OriginalRow227TriangleData0041.coefficient2_297, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_299, Icur := OriginalRow227TriangleData0025.coefficient1_298,
    output := OriginalRow227TriangleData0041.coefficient2_298, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_300, Icur := OriginalRow227TriangleData0025.coefficient1_299,
    output := OriginalRow227TriangleData0041.coefficient2_299, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_301, Icur := OriginalRow227TriangleData0025.coefficient1_300,
    output := OriginalRow227TriangleData0041.coefficient2_300, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_302, Icur := OriginalRow227TriangleData0025.coefficient1_301,
    output := OriginalRow227TriangleData0041.coefficient2_301, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_303, Icur := OriginalRow227TriangleData0025.coefficient1_302,
    output := OriginalRow227TriangleData0041.coefficient2_302, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_304, Icur := OriginalRow227TriangleData0025.coefficient1_303,
    output := OriginalRow227TriangleData0041.coefficient2_303, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_305, Icur := OriginalRow227TriangleData0025.coefficient1_304,
    output := OriginalRow227TriangleData0041.coefficient2_304, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_306, Icur := OriginalRow227TriangleData0025.coefficient1_305,
    output := OriginalRow227TriangleData0041.coefficient2_305, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_307, Icur := OriginalRow227TriangleData0025.coefficient1_306,
    output := OriginalRow227TriangleData0041.coefficient2_306, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_308, Icur := OriginalRow227TriangleData0025.coefficient1_307,
    output := OriginalRow227TriangleData0041.coefficient2_307, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_309, Icur := OriginalRow227TriangleData0025.coefficient1_308,
    output := OriginalRow227TriangleData0041.coefficient2_308, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_310, Icur := OriginalRow227TriangleData0025.coefficient1_309,
    output := OriginalRow227TriangleData0041.coefficient2_309, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_311, Icur := OriginalRow227TriangleData0025.coefficient1_310,
    output := OriginalRow227TriangleData0041.coefficient2_310, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_312, Icur := OriginalRow227TriangleData0025.coefficient1_311,
    output := OriginalRow227TriangleData0041.coefficient2_311, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_313, Icur := OriginalRow227TriangleData0025.coefficient1_312,
    output := OriginalRow227TriangleData0041.coefficient2_312, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_314, Icur := OriginalRow227TriangleData0025.coefficient1_313,
    output := OriginalRow227TriangleData0041.coefficient2_313, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_315, Icur := OriginalRow227TriangleData0025.coefficient1_314,
    output := OriginalRow227TriangleData0041.coefficient2_314, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_316, Icur := OriginalRow227TriangleData0025.coefficient1_315,
    output := OriginalRow227TriangleData0041.coefficient2_315, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_317, Icur := OriginalRow227TriangleData0025.coefficient1_316,
    output := OriginalRow227TriangleData0041.coefficient2_316, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_318, Icur := OriginalRow227TriangleData0025.coefficient1_317,
    output := OriginalRow227TriangleData0041.coefficient2_317, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0025.coefficient1_319, Icur := OriginalRow227TriangleData0025.coefficient1_318,
    output := OriginalRow227TriangleData0041.coefficient2_318, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0026.coefficient1_320, Icur := OriginalRow227TriangleData0025.coefficient1_319,
    output := OriginalRow227TriangleData0041.coefficient2_319, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0026.coefficient1_321, Icur := OriginalRow227TriangleData0026.coefficient1_320,
    output := OriginalRow227TriangleData0041.coefficient2_320, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0025

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0025.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

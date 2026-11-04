import Grothe.UpperChaos.OriginalRow227TriangleData0137
import Grothe.UpperChaos.OriginalRow227TriangleData0138
import Grothe.UpperChaos.OriginalRow227TriangleData0153
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0137
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_297, Icur := OriginalRow227TriangleData0137.coefficient8_296,
    output := OriginalRow227TriangleData0153.coefficient9_296, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_298, Icur := OriginalRow227TriangleData0137.coefficient8_297,
    output := OriginalRow227TriangleData0153.coefficient9_297, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_299, Icur := OriginalRow227TriangleData0137.coefficient8_298,
    output := OriginalRow227TriangleData0153.coefficient9_298, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_300, Icur := OriginalRow227TriangleData0137.coefficient8_299,
    output := OriginalRow227TriangleData0153.coefficient9_299, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_301, Icur := OriginalRow227TriangleData0137.coefficient8_300,
    output := OriginalRow227TriangleData0153.coefficient9_300, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_302, Icur := OriginalRow227TriangleData0137.coefficient8_301,
    output := OriginalRow227TriangleData0153.coefficient9_301, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_303, Icur := OriginalRow227TriangleData0137.coefficient8_302,
    output := OriginalRow227TriangleData0153.coefficient9_302, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_304, Icur := OriginalRow227TriangleData0137.coefficient8_303,
    output := OriginalRow227TriangleData0153.coefficient9_303, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_305, Icur := OriginalRow227TriangleData0137.coefficient8_304,
    output := OriginalRow227TriangleData0153.coefficient9_304, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_306, Icur := OriginalRow227TriangleData0137.coefficient8_305,
    output := OriginalRow227TriangleData0153.coefficient9_305, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_307, Icur := OriginalRow227TriangleData0137.coefficient8_306,
    output := OriginalRow227TriangleData0153.coefficient9_306, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_308, Icur := OriginalRow227TriangleData0137.coefficient8_307,
    output := OriginalRow227TriangleData0153.coefficient9_307, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_309, Icur := OriginalRow227TriangleData0137.coefficient8_308,
    output := OriginalRow227TriangleData0153.coefficient9_308, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_310, Icur := OriginalRow227TriangleData0137.coefficient8_309,
    output := OriginalRow227TriangleData0153.coefficient9_309, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_311, Icur := OriginalRow227TriangleData0137.coefficient8_310,
    output := OriginalRow227TriangleData0153.coefficient9_310, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_312, Icur := OriginalRow227TriangleData0137.coefficient8_311,
    output := OriginalRow227TriangleData0153.coefficient9_311, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_313, Icur := OriginalRow227TriangleData0137.coefficient8_312,
    output := OriginalRow227TriangleData0153.coefficient9_312, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_314, Icur := OriginalRow227TriangleData0137.coefficient8_313,
    output := OriginalRow227TriangleData0153.coefficient9_313, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_315, Icur := OriginalRow227TriangleData0137.coefficient8_314,
    output := OriginalRow227TriangleData0153.coefficient9_314, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_316, Icur := OriginalRow227TriangleData0137.coefficient8_315,
    output := OriginalRow227TriangleData0153.coefficient9_315, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_317, Icur := OriginalRow227TriangleData0137.coefficient8_316,
    output := OriginalRow227TriangleData0153.coefficient9_316, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_318, Icur := OriginalRow227TriangleData0137.coefficient8_317,
    output := OriginalRow227TriangleData0153.coefficient9_317, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_319, Icur := OriginalRow227TriangleData0137.coefficient8_318,
    output := OriginalRow227TriangleData0153.coefficient9_318, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_320, Icur := OriginalRow227TriangleData0137.coefficient8_319,
    output := OriginalRow227TriangleData0153.coefficient9_319, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_321, Icur := OriginalRow227TriangleData0137.coefficient8_320,
    output := OriginalRow227TriangleData0153.coefficient9_320, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_322, Icur := OriginalRow227TriangleData0137.coefficient8_321,
    output := OriginalRow227TriangleData0153.coefficient9_321, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_323, Icur := OriginalRow227TriangleData0137.coefficient8_322,
    output := OriginalRow227TriangleData0153.coefficient9_322, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_324, Icur := OriginalRow227TriangleData0137.coefficient8_323,
    output := OriginalRow227TriangleData0153.coefficient9_323, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_325, Icur := OriginalRow227TriangleData0137.coefficient8_324,
    output := OriginalRow227TriangleData0153.coefficient9_324, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0137.coefficient8_326, Icur := OriginalRow227TriangleData0137.coefficient8_325,
    output := OriginalRow227TriangleData0153.coefficient9_325, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0138.coefficient8_327, Icur := OriginalRow227TriangleData0137.coefficient8_326,
    output := OriginalRow227TriangleData0153.coefficient9_326, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots00.root9,
    Inext := OriginalRow227TriangleData0138.coefficient8_328, Icur := OriginalRow227TriangleData0138.coefficient8_327,
    output := OriginalRow227TriangleData0153.coefficient9_327, hC := OriginalRow227TriangleRoots00.root9_pos, hAC := OriginalRow227TriangleRoots00.product9_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0137

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0137.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

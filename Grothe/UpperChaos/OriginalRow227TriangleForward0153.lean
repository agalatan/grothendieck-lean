import Grothe.UpperChaos.OriginalRow227TriangleData0153
import Grothe.UpperChaos.OriginalRow227TriangleData0154
import Grothe.UpperChaos.OriginalRow227TriangleData0169
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0153
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_298, Icur := OriginalRow227TriangleData0153.coefficient9_297,
    output := OriginalRow227TriangleData0169.coefficient10_297, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_299, Icur := OriginalRow227TriangleData0153.coefficient9_298,
    output := OriginalRow227TriangleData0169.coefficient10_298, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_300, Icur := OriginalRow227TriangleData0153.coefficient9_299,
    output := OriginalRow227TriangleData0169.coefficient10_299, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_301, Icur := OriginalRow227TriangleData0153.coefficient9_300,
    output := OriginalRow227TriangleData0169.coefficient10_300, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_302, Icur := OriginalRow227TriangleData0153.coefficient9_301,
    output := OriginalRow227TriangleData0169.coefficient10_301, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_303, Icur := OriginalRow227TriangleData0153.coefficient9_302,
    output := OriginalRow227TriangleData0169.coefficient10_302, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_304, Icur := OriginalRow227TriangleData0153.coefficient9_303,
    output := OriginalRow227TriangleData0169.coefficient10_303, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_305, Icur := OriginalRow227TriangleData0153.coefficient9_304,
    output := OriginalRow227TriangleData0169.coefficient10_304, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_306, Icur := OriginalRow227TriangleData0153.coefficient9_305,
    output := OriginalRow227TriangleData0169.coefficient10_305, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_307, Icur := OriginalRow227TriangleData0153.coefficient9_306,
    output := OriginalRow227TriangleData0169.coefficient10_306, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_308, Icur := OriginalRow227TriangleData0153.coefficient9_307,
    output := OriginalRow227TriangleData0169.coefficient10_307, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_309, Icur := OriginalRow227TriangleData0153.coefficient9_308,
    output := OriginalRow227TriangleData0169.coefficient10_308, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_310, Icur := OriginalRow227TriangleData0153.coefficient9_309,
    output := OriginalRow227TriangleData0169.coefficient10_309, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_311, Icur := OriginalRow227TriangleData0153.coefficient9_310,
    output := OriginalRow227TriangleData0169.coefficient10_310, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_312, Icur := OriginalRow227TriangleData0153.coefficient9_311,
    output := OriginalRow227TriangleData0169.coefficient10_311, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_313, Icur := OriginalRow227TriangleData0153.coefficient9_312,
    output := OriginalRow227TriangleData0169.coefficient10_312, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_314, Icur := OriginalRow227TriangleData0153.coefficient9_313,
    output := OriginalRow227TriangleData0169.coefficient10_313, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_315, Icur := OriginalRow227TriangleData0153.coefficient9_314,
    output := OriginalRow227TriangleData0169.coefficient10_314, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_316, Icur := OriginalRow227TriangleData0153.coefficient9_315,
    output := OriginalRow227TriangleData0169.coefficient10_315, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_317, Icur := OriginalRow227TriangleData0153.coefficient9_316,
    output := OriginalRow227TriangleData0169.coefficient10_316, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_318, Icur := OriginalRow227TriangleData0153.coefficient9_317,
    output := OriginalRow227TriangleData0169.coefficient10_317, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_319, Icur := OriginalRow227TriangleData0153.coefficient9_318,
    output := OriginalRow227TriangleData0169.coefficient10_318, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_320, Icur := OriginalRow227TriangleData0153.coefficient9_319,
    output := OriginalRow227TriangleData0169.coefficient10_319, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_321, Icur := OriginalRow227TriangleData0153.coefficient9_320,
    output := OriginalRow227TriangleData0169.coefficient10_320, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_322, Icur := OriginalRow227TriangleData0153.coefficient9_321,
    output := OriginalRow227TriangleData0169.coefficient10_321, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_323, Icur := OriginalRow227TriangleData0153.coefficient9_322,
    output := OriginalRow227TriangleData0169.coefficient10_322, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_324, Icur := OriginalRow227TriangleData0153.coefficient9_323,
    output := OriginalRow227TriangleData0169.coefficient10_323, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_325, Icur := OriginalRow227TriangleData0153.coefficient9_324,
    output := OriginalRow227TriangleData0169.coefficient10_324, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_326, Icur := OriginalRow227TriangleData0153.coefficient9_325,
    output := OriginalRow227TriangleData0169.coefficient10_325, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0153.coefficient9_327, Icur := OriginalRow227TriangleData0153.coefficient9_326,
    output := OriginalRow227TriangleData0169.coefficient10_326, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0154.coefficient9_328, Icur := OriginalRow227TriangleData0153.coefficient9_327,
    output := OriginalRow227TriangleData0169.coefficient10_327, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0154.coefficient9_329, Icur := OriginalRow227TriangleData0154.coefficient9_328,
    output := OriginalRow227TriangleData0169.coefficient10_328, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0153

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0153.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

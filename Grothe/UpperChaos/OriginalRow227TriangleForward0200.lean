import Grothe.UpperChaos.OriginalRow227TriangleData0201
import Grothe.UpperChaos.OriginalRow227TriangleData0202
import Grothe.UpperChaos.OriginalRow227TriangleData0216
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0200
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 289, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_301, Icur := OriginalRow227TriangleData0201.coefficient12_300,
    output := OriginalRow227TriangleData0216.coefficient13_300, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 290, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_302, Icur := OriginalRow227TriangleData0201.coefficient12_301,
    output := OriginalRow227TriangleData0216.coefficient13_301, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 291, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_303, Icur := OriginalRow227TriangleData0201.coefficient12_302,
    output := OriginalRow227TriangleData0216.coefficient13_302, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 292, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_304, Icur := OriginalRow227TriangleData0201.coefficient12_303,
    output := OriginalRow227TriangleData0216.coefficient13_303, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 293, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_305, Icur := OriginalRow227TriangleData0201.coefficient12_304,
    output := OriginalRow227TriangleData0216.coefficient13_304, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 294, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_306, Icur := OriginalRow227TriangleData0201.coefficient12_305,
    output := OriginalRow227TriangleData0216.coefficient13_305, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 295, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_307, Icur := OriginalRow227TriangleData0201.coefficient12_306,
    output := OriginalRow227TriangleData0216.coefficient13_306, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 296, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_308, Icur := OriginalRow227TriangleData0201.coefficient12_307,
    output := OriginalRow227TriangleData0216.coefficient13_307, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 297, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_309, Icur := OriginalRow227TriangleData0201.coefficient12_308,
    output := OriginalRow227TriangleData0216.coefficient13_308, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 298, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_310, Icur := OriginalRow227TriangleData0201.coefficient12_309,
    output := OriginalRow227TriangleData0216.coefficient13_309, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 299, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_311, Icur := OriginalRow227TriangleData0201.coefficient12_310,
    output := OriginalRow227TriangleData0216.coefficient13_310, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 300, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_312, Icur := OriginalRow227TriangleData0201.coefficient12_311,
    output := OriginalRow227TriangleData0216.coefficient13_311, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 301, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_313, Icur := OriginalRow227TriangleData0201.coefficient12_312,
    output := OriginalRow227TriangleData0216.coefficient13_312, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 302, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_314, Icur := OriginalRow227TriangleData0201.coefficient12_313,
    output := OriginalRow227TriangleData0216.coefficient13_313, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 303, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_315, Icur := OriginalRow227TriangleData0201.coefficient12_314,
    output := OriginalRow227TriangleData0216.coefficient13_314, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 304, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_316, Icur := OriginalRow227TriangleData0201.coefficient12_315,
    output := OriginalRow227TriangleData0216.coefficient13_315, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 305, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_317, Icur := OriginalRow227TriangleData0201.coefficient12_316,
    output := OriginalRow227TriangleData0216.coefficient13_316, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 306, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_318, Icur := OriginalRow227TriangleData0201.coefficient12_317,
    output := OriginalRow227TriangleData0216.coefficient13_317, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 307, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_319, Icur := OriginalRow227TriangleData0201.coefficient12_318,
    output := OriginalRow227TriangleData0216.coefficient13_318, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 308, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_320, Icur := OriginalRow227TriangleData0201.coefficient12_319,
    output := OriginalRow227TriangleData0216.coefficient13_319, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 309, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_321, Icur := OriginalRow227TriangleData0201.coefficient12_320,
    output := OriginalRow227TriangleData0216.coefficient13_320, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 310, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_322, Icur := OriginalRow227TriangleData0201.coefficient12_321,
    output := OriginalRow227TriangleData0216.coefficient13_321, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 311, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_323, Icur := OriginalRow227TriangleData0201.coefficient12_322,
    output := OriginalRow227TriangleData0216.coefficient13_322, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 312, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_324, Icur := OriginalRow227TriangleData0201.coefficient12_323,
    output := OriginalRow227TriangleData0216.coefficient13_323, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 313, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_325, Icur := OriginalRow227TriangleData0201.coefficient12_324,
    output := OriginalRow227TriangleData0216.coefficient13_324, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 314, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_326, Icur := OriginalRow227TriangleData0201.coefficient12_325,
    output := OriginalRow227TriangleData0216.coefficient13_325, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 315, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_327, Icur := OriginalRow227TriangleData0201.coefficient12_326,
    output := OriginalRow227TriangleData0216.coefficient13_326, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 316, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_328, Icur := OriginalRow227TriangleData0201.coefficient12_327,
    output := OriginalRow227TriangleData0216.coefficient13_327, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 317, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_329, Icur := OriginalRow227TriangleData0201.coefficient12_328,
    output := OriginalRow227TriangleData0216.coefficient13_328, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 318, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0201.coefficient12_330, Icur := OriginalRow227TriangleData0201.coefficient12_329,
    output := OriginalRow227TriangleData0216.coefficient13_329, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 319, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0202.coefficient12_331, Icur := OriginalRow227TriangleData0201.coefficient12_330,
    output := OriginalRow227TriangleData0216.coefficient13_330, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 320, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0202.coefficient12_332, Icur := OriginalRow227TriangleData0202.coefficient12_331,
    output := OriginalRow227TriangleData0216.coefficient13_331, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0200

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0200.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

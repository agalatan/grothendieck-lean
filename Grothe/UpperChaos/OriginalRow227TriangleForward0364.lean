import Grothe.UpperChaos.OriginalRow227TriangleData0365
import Grothe.UpperChaos.OriginalRow227TriangleData0366
import Grothe.UpperChaos.OriginalRow227TriangleData0380
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0364
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_280, Icur := OriginalRow227TriangleData0365.coefficient23_279,
    output := OriginalRow227TriangleData0380.coefficient24_279, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_281, Icur := OriginalRow227TriangleData0365.coefficient23_280,
    output := OriginalRow227TriangleData0380.coefficient24_280, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_282, Icur := OriginalRow227TriangleData0365.coefficient23_281,
    output := OriginalRow227TriangleData0380.coefficient24_281, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_283, Icur := OriginalRow227TriangleData0365.coefficient23_282,
    output := OriginalRow227TriangleData0380.coefficient24_282, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_284, Icur := OriginalRow227TriangleData0365.coefficient23_283,
    output := OriginalRow227TriangleData0380.coefficient24_283, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_285, Icur := OriginalRow227TriangleData0365.coefficient23_284,
    output := OriginalRow227TriangleData0380.coefficient24_284, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_286, Icur := OriginalRow227TriangleData0365.coefficient23_285,
    output := OriginalRow227TriangleData0380.coefficient24_285, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_287, Icur := OriginalRow227TriangleData0365.coefficient23_286,
    output := OriginalRow227TriangleData0380.coefficient24_286, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_288, Icur := OriginalRow227TriangleData0365.coefficient23_287,
    output := OriginalRow227TriangleData0380.coefficient24_287, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_289, Icur := OriginalRow227TriangleData0365.coefficient23_288,
    output := OriginalRow227TriangleData0380.coefficient24_288, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_290, Icur := OriginalRow227TriangleData0365.coefficient23_289,
    output := OriginalRow227TriangleData0380.coefficient24_289, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_291, Icur := OriginalRow227TriangleData0365.coefficient23_290,
    output := OriginalRow227TriangleData0380.coefficient24_290, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_292, Icur := OriginalRow227TriangleData0365.coefficient23_291,
    output := OriginalRow227TriangleData0380.coefficient24_291, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_293, Icur := OriginalRow227TriangleData0365.coefficient23_292,
    output := OriginalRow227TriangleData0380.coefficient24_292, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_294, Icur := OriginalRow227TriangleData0365.coefficient23_293,
    output := OriginalRow227TriangleData0380.coefficient24_293, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_295, Icur := OriginalRow227TriangleData0365.coefficient23_294,
    output := OriginalRow227TriangleData0380.coefficient24_294, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_296, Icur := OriginalRow227TriangleData0365.coefficient23_295,
    output := OriginalRow227TriangleData0380.coefficient24_295, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_297, Icur := OriginalRow227TriangleData0365.coefficient23_296,
    output := OriginalRow227TriangleData0380.coefficient24_296, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_298, Icur := OriginalRow227TriangleData0365.coefficient23_297,
    output := OriginalRow227TriangleData0380.coefficient24_297, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_299, Icur := OriginalRow227TriangleData0365.coefficient23_298,
    output := OriginalRow227TriangleData0380.coefficient24_298, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_300, Icur := OriginalRow227TriangleData0365.coefficient23_299,
    output := OriginalRow227TriangleData0380.coefficient24_299, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_301, Icur := OriginalRow227TriangleData0365.coefficient23_300,
    output := OriginalRow227TriangleData0380.coefficient24_300, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_302, Icur := OriginalRow227TriangleData0365.coefficient23_301,
    output := OriginalRow227TriangleData0380.coefficient24_301, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_303, Icur := OriginalRow227TriangleData0365.coefficient23_302,
    output := OriginalRow227TriangleData0380.coefficient24_302, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_304, Icur := OriginalRow227TriangleData0365.coefficient23_303,
    output := OriginalRow227TriangleData0380.coefficient24_303, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_305, Icur := OriginalRow227TriangleData0365.coefficient23_304,
    output := OriginalRow227TriangleData0380.coefficient24_304, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_306, Icur := OriginalRow227TriangleData0365.coefficient23_305,
    output := OriginalRow227TriangleData0380.coefficient24_305, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_307, Icur := OriginalRow227TriangleData0365.coefficient23_306,
    output := OriginalRow227TriangleData0380.coefficient24_306, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_308, Icur := OriginalRow227TriangleData0365.coefficient23_307,
    output := OriginalRow227TriangleData0380.coefficient24_307, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0365.coefficient23_309, Icur := OriginalRow227TriangleData0365.coefficient23_308,
    output := OriginalRow227TriangleData0380.coefficient24_308, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0366.coefficient23_310, Icur := OriginalRow227TriangleData0365.coefficient23_309,
    output := OriginalRow227TriangleData0380.coefficient24_309, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots00.root24,
    Inext := OriginalRow227TriangleData0366.coefficient23_311, Icur := OriginalRow227TriangleData0366.coefficient23_310,
    output := OriginalRow227TriangleData0380.coefficient24_310, hC := OriginalRow227TriangleRoots00.root24_pos, hAC := OriginalRow227TriangleRoots00.product24_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0364

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0364.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

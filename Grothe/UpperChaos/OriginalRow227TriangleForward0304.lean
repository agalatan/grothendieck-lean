import Grothe.UpperChaos.OriginalRow227TriangleData0305
import Grothe.UpperChaos.OriginalRow227TriangleData0306
import Grothe.UpperChaos.OriginalRow227TriangleData0320
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0304
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 257, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_276, Icur := OriginalRow227TriangleData0305.coefficient19_275,
    output := OriginalRow227TriangleData0320.coefficient20_275, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 258, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_277, Icur := OriginalRow227TriangleData0305.coefficient19_276,
    output := OriginalRow227TriangleData0320.coefficient20_276, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 259, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_278, Icur := OriginalRow227TriangleData0305.coefficient19_277,
    output := OriginalRow227TriangleData0320.coefficient20_277, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 260, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_279, Icur := OriginalRow227TriangleData0305.coefficient19_278,
    output := OriginalRow227TriangleData0320.coefficient20_278, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 261, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_280, Icur := OriginalRow227TriangleData0305.coefficient19_279,
    output := OriginalRow227TriangleData0320.coefficient20_279, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 262, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_281, Icur := OriginalRow227TriangleData0305.coefficient19_280,
    output := OriginalRow227TriangleData0320.coefficient20_280, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 263, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_282, Icur := OriginalRow227TriangleData0305.coefficient19_281,
    output := OriginalRow227TriangleData0320.coefficient20_281, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 264, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_283, Icur := OriginalRow227TriangleData0305.coefficient19_282,
    output := OriginalRow227TriangleData0320.coefficient20_282, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 265, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_284, Icur := OriginalRow227TriangleData0305.coefficient19_283,
    output := OriginalRow227TriangleData0320.coefficient20_283, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 266, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_285, Icur := OriginalRow227TriangleData0305.coefficient19_284,
    output := OriginalRow227TriangleData0320.coefficient20_284, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 267, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_286, Icur := OriginalRow227TriangleData0305.coefficient19_285,
    output := OriginalRow227TriangleData0320.coefficient20_285, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 268, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_287, Icur := OriginalRow227TriangleData0305.coefficient19_286,
    output := OriginalRow227TriangleData0320.coefficient20_286, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 269, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_288, Icur := OriginalRow227TriangleData0305.coefficient19_287,
    output := OriginalRow227TriangleData0320.coefficient20_287, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 270, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_289, Icur := OriginalRow227TriangleData0305.coefficient19_288,
    output := OriginalRow227TriangleData0320.coefficient20_288, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 271, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_290, Icur := OriginalRow227TriangleData0305.coefficient19_289,
    output := OriginalRow227TriangleData0320.coefficient20_289, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 272, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_291, Icur := OriginalRow227TriangleData0305.coefficient19_290,
    output := OriginalRow227TriangleData0320.coefficient20_290, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 273, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_292, Icur := OriginalRow227TriangleData0305.coefficient19_291,
    output := OriginalRow227TriangleData0320.coefficient20_291, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 274, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_293, Icur := OriginalRow227TriangleData0305.coefficient19_292,
    output := OriginalRow227TriangleData0320.coefficient20_292, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 275, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_294, Icur := OriginalRow227TriangleData0305.coefficient19_293,
    output := OriginalRow227TriangleData0320.coefficient20_293, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 276, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_295, Icur := OriginalRow227TriangleData0305.coefficient19_294,
    output := OriginalRow227TriangleData0320.coefficient20_294, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 277, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_296, Icur := OriginalRow227TriangleData0305.coefficient19_295,
    output := OriginalRow227TriangleData0320.coefficient20_295, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 278, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_297, Icur := OriginalRow227TriangleData0305.coefficient19_296,
    output := OriginalRow227TriangleData0320.coefficient20_296, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 279, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_298, Icur := OriginalRow227TriangleData0305.coefficient19_297,
    output := OriginalRow227TriangleData0320.coefficient20_297, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 280, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_299, Icur := OriginalRow227TriangleData0305.coefficient19_298,
    output := OriginalRow227TriangleData0320.coefficient20_298, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 281, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_300, Icur := OriginalRow227TriangleData0305.coefficient19_299,
    output := OriginalRow227TriangleData0320.coefficient20_299, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 282, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_301, Icur := OriginalRow227TriangleData0305.coefficient19_300,
    output := OriginalRow227TriangleData0320.coefficient20_300, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 283, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_302, Icur := OriginalRow227TriangleData0305.coefficient19_301,
    output := OriginalRow227TriangleData0320.coefficient20_301, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 284, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_303, Icur := OriginalRow227TriangleData0305.coefficient19_302,
    output := OriginalRow227TriangleData0320.coefficient20_302, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 285, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_304, Icur := OriginalRow227TriangleData0305.coefficient19_303,
    output := OriginalRow227TriangleData0320.coefficient20_303, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 286, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0305.coefficient19_305, Icur := OriginalRow227TriangleData0305.coefficient19_304,
    output := OriginalRow227TriangleData0320.coefficient20_304, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 287, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_306, Icur := OriginalRow227TriangleData0305.coefficient19_305,
    output := OriginalRow227TriangleData0320.coefficient20_305, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 288, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0306.coefficient19_307, Icur := OriginalRow227TriangleData0306.coefficient19_306,
    output := OriginalRow227TriangleData0320.coefficient20_306, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0304

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0304.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData0780
import Grothe.UpperChaos.OriginalRow227TriangleData0781
import Grothe.UpperChaos.OriginalRow227TriangleData0793
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0777
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_278, Icur := OriginalRow227TriangleData0780.coefficient53_277,
    output := OriginalRow227TriangleData0793.coefficient54_277, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_279, Icur := OriginalRow227TriangleData0780.coefficient53_278,
    output := OriginalRow227TriangleData0793.coefficient54_278, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_280, Icur := OriginalRow227TriangleData0780.coefficient53_279,
    output := OriginalRow227TriangleData0793.coefficient54_279, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_281, Icur := OriginalRow227TriangleData0780.coefficient53_280,
    output := OriginalRow227TriangleData0793.coefficient54_280, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_282, Icur := OriginalRow227TriangleData0780.coefficient53_281,
    output := OriginalRow227TriangleData0793.coefficient54_281, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_283, Icur := OriginalRow227TriangleData0780.coefficient53_282,
    output := OriginalRow227TriangleData0793.coefficient54_282, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_284, Icur := OriginalRow227TriangleData0780.coefficient53_283,
    output := OriginalRow227TriangleData0793.coefficient54_283, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_285, Icur := OriginalRow227TriangleData0780.coefficient53_284,
    output := OriginalRow227TriangleData0793.coefficient54_284, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_286, Icur := OriginalRow227TriangleData0780.coefficient53_285,
    output := OriginalRow227TriangleData0793.coefficient54_285, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_287, Icur := OriginalRow227TriangleData0780.coefficient53_286,
    output := OriginalRow227TriangleData0793.coefficient54_286, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_288, Icur := OriginalRow227TriangleData0780.coefficient53_287,
    output := OriginalRow227TriangleData0793.coefficient54_287, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_289, Icur := OriginalRow227TriangleData0780.coefficient53_288,
    output := OriginalRow227TriangleData0793.coefficient54_288, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_290, Icur := OriginalRow227TriangleData0780.coefficient53_289,
    output := OriginalRow227TriangleData0793.coefficient54_289, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_291, Icur := OriginalRow227TriangleData0780.coefficient53_290,
    output := OriginalRow227TriangleData0793.coefficient54_290, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_292, Icur := OriginalRow227TriangleData0780.coefficient53_291,
    output := OriginalRow227TriangleData0793.coefficient54_291, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_293, Icur := OriginalRow227TriangleData0780.coefficient53_292,
    output := OriginalRow227TriangleData0793.coefficient54_292, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_294, Icur := OriginalRow227TriangleData0780.coefficient53_293,
    output := OriginalRow227TriangleData0793.coefficient54_293, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_295, Icur := OriginalRow227TriangleData0780.coefficient53_294,
    output := OriginalRow227TriangleData0793.coefficient54_294, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_296, Icur := OriginalRow227TriangleData0780.coefficient53_295,
    output := OriginalRow227TriangleData0793.coefficient54_295, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_297, Icur := OriginalRow227TriangleData0780.coefficient53_296,
    output := OriginalRow227TriangleData0793.coefficient54_296, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_298, Icur := OriginalRow227TriangleData0780.coefficient53_297,
    output := OriginalRow227TriangleData0793.coefficient54_297, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_299, Icur := OriginalRow227TriangleData0780.coefficient53_298,
    output := OriginalRow227TriangleData0793.coefficient54_298, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_300, Icur := OriginalRow227TriangleData0780.coefficient53_299,
    output := OriginalRow227TriangleData0793.coefficient54_299, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_301, Icur := OriginalRow227TriangleData0780.coefficient53_300,
    output := OriginalRow227TriangleData0793.coefficient54_300, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_302, Icur := OriginalRow227TriangleData0780.coefficient53_301,
    output := OriginalRow227TriangleData0793.coefficient54_301, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_303, Icur := OriginalRow227TriangleData0780.coefficient53_302,
    output := OriginalRow227TriangleData0793.coefficient54_302, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_304, Icur := OriginalRow227TriangleData0780.coefficient53_303,
    output := OriginalRow227TriangleData0793.coefficient54_303, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_305, Icur := OriginalRow227TriangleData0780.coefficient53_304,
    output := OriginalRow227TriangleData0793.coefficient54_304, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_306, Icur := OriginalRow227TriangleData0780.coefficient53_305,
    output := OriginalRow227TriangleData0793.coefficient54_305, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0780.coefficient53_307, Icur := OriginalRow227TriangleData0780.coefficient53_306,
    output := OriginalRow227TriangleData0793.coefficient54_306, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0781.coefficient53_308, Icur := OriginalRow227TriangleData0780.coefficient53_307,
    output := OriginalRow227TriangleData0793.coefficient54_307, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0781.coefficient53_309, Icur := OriginalRow227TriangleData0781.coefficient53_308,
    output := OriginalRow227TriangleData0793.coefficient54_308, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0777

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0777.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

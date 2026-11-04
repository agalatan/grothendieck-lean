import Grothe.UpperChaos.OriginalRow227TriangleData1150
import Grothe.UpperChaos.OriginalRow227TriangleData1151
import Grothe.UpperChaos.OriginalRow227TriangleData1161
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1145
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_277, Icur := OriginalRow227TriangleData1150.coefficient84_276,
    output := OriginalRow227TriangleData1161.coefficient85_276, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_278, Icur := OriginalRow227TriangleData1150.coefficient84_277,
    output := OriginalRow227TriangleData1161.coefficient85_277, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_279, Icur := OriginalRow227TriangleData1150.coefficient84_278,
    output := OriginalRow227TriangleData1161.coefficient85_278, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_280, Icur := OriginalRow227TriangleData1150.coefficient84_279,
    output := OriginalRow227TriangleData1161.coefficient85_279, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_281, Icur := OriginalRow227TriangleData1150.coefficient84_280,
    output := OriginalRow227TriangleData1161.coefficient85_280, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_282, Icur := OriginalRow227TriangleData1150.coefficient84_281,
    output := OriginalRow227TriangleData1161.coefficient85_281, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_283, Icur := OriginalRow227TriangleData1150.coefficient84_282,
    output := OriginalRow227TriangleData1161.coefficient85_282, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_284, Icur := OriginalRow227TriangleData1150.coefficient84_283,
    output := OriginalRow227TriangleData1161.coefficient85_283, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_285, Icur := OriginalRow227TriangleData1150.coefficient84_284,
    output := OriginalRow227TriangleData1161.coefficient85_284, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_286, Icur := OriginalRow227TriangleData1150.coefficient84_285,
    output := OriginalRow227TriangleData1161.coefficient85_285, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_287, Icur := OriginalRow227TriangleData1150.coefficient84_286,
    output := OriginalRow227TriangleData1161.coefficient85_286, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_288, Icur := OriginalRow227TriangleData1150.coefficient84_287,
    output := OriginalRow227TriangleData1161.coefficient85_287, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_289, Icur := OriginalRow227TriangleData1150.coefficient84_288,
    output := OriginalRow227TriangleData1161.coefficient85_288, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_290, Icur := OriginalRow227TriangleData1150.coefficient84_289,
    output := OriginalRow227TriangleData1161.coefficient85_289, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_291, Icur := OriginalRow227TriangleData1150.coefficient84_290,
    output := OriginalRow227TriangleData1161.coefficient85_290, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_292, Icur := OriginalRow227TriangleData1150.coefficient84_291,
    output := OriginalRow227TriangleData1161.coefficient85_291, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_293, Icur := OriginalRow227TriangleData1150.coefficient84_292,
    output := OriginalRow227TriangleData1161.coefficient85_292, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_294, Icur := OriginalRow227TriangleData1150.coefficient84_293,
    output := OriginalRow227TriangleData1161.coefficient85_293, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_295, Icur := OriginalRow227TriangleData1150.coefficient84_294,
    output := OriginalRow227TriangleData1161.coefficient85_294, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_296, Icur := OriginalRow227TriangleData1150.coefficient84_295,
    output := OriginalRow227TriangleData1161.coefficient85_295, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_297, Icur := OriginalRow227TriangleData1150.coefficient84_296,
    output := OriginalRow227TriangleData1161.coefficient85_296, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_298, Icur := OriginalRow227TriangleData1150.coefficient84_297,
    output := OriginalRow227TriangleData1161.coefficient85_297, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_299, Icur := OriginalRow227TriangleData1150.coefficient84_298,
    output := OriginalRow227TriangleData1161.coefficient85_298, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_300, Icur := OriginalRow227TriangleData1150.coefficient84_299,
    output := OriginalRow227TriangleData1161.coefficient85_299, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_301, Icur := OriginalRow227TriangleData1150.coefficient84_300,
    output := OriginalRow227TriangleData1161.coefficient85_300, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_302, Icur := OriginalRow227TriangleData1150.coefficient84_301,
    output := OriginalRow227TriangleData1161.coefficient85_301, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_303, Icur := OriginalRow227TriangleData1150.coefficient84_302,
    output := OriginalRow227TriangleData1161.coefficient85_302, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_304, Icur := OriginalRow227TriangleData1150.coefficient84_303,
    output := OriginalRow227TriangleData1161.coefficient85_303, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_305, Icur := OriginalRow227TriangleData1150.coefficient84_304,
    output := OriginalRow227TriangleData1161.coefficient85_304, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1150.coefficient84_306, Icur := OriginalRow227TriangleData1150.coefficient84_305,
    output := OriginalRow227TriangleData1161.coefficient85_305, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1151.coefficient84_307, Icur := OriginalRow227TriangleData1150.coefficient84_306,
    output := OriginalRow227TriangleData1161.coefficient85_306, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1151.coefficient84_308, Icur := OriginalRow227TriangleData1151.coefficient84_307,
    output := OriginalRow227TriangleData1161.coefficient85_307, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1145

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1145.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

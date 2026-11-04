import Grothe.UpperChaos.OriginalRow227TriangleData0978
import Grothe.UpperChaos.OriginalRow227TriangleData0979
import Grothe.UpperChaos.OriginalRow227TriangleData0990
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0974
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_262, Icur := OriginalRow227TriangleData0978.coefficient69_261,
    output := OriginalRow227TriangleData0990.coefficient70_261, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_263, Icur := OriginalRow227TriangleData0978.coefficient69_262,
    output := OriginalRow227TriangleData0990.coefficient70_262, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_264, Icur := OriginalRow227TriangleData0978.coefficient69_263,
    output := OriginalRow227TriangleData0990.coefficient70_263, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_265, Icur := OriginalRow227TriangleData0978.coefficient69_264,
    output := OriginalRow227TriangleData0990.coefficient70_264, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_266, Icur := OriginalRow227TriangleData0978.coefficient69_265,
    output := OriginalRow227TriangleData0990.coefficient70_265, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_267, Icur := OriginalRow227TriangleData0978.coefficient69_266,
    output := OriginalRow227TriangleData0990.coefficient70_266, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_268, Icur := OriginalRow227TriangleData0978.coefficient69_267,
    output := OriginalRow227TriangleData0990.coefficient70_267, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_269, Icur := OriginalRow227TriangleData0978.coefficient69_268,
    output := OriginalRow227TriangleData0990.coefficient70_268, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_270, Icur := OriginalRow227TriangleData0978.coefficient69_269,
    output := OriginalRow227TriangleData0990.coefficient70_269, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_271, Icur := OriginalRow227TriangleData0978.coefficient69_270,
    output := OriginalRow227TriangleData0990.coefficient70_270, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_272, Icur := OriginalRow227TriangleData0978.coefficient69_271,
    output := OriginalRow227TriangleData0990.coefficient70_271, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_273, Icur := OriginalRow227TriangleData0978.coefficient69_272,
    output := OriginalRow227TriangleData0990.coefficient70_272, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_274, Icur := OriginalRow227TriangleData0978.coefficient69_273,
    output := OriginalRow227TriangleData0990.coefficient70_273, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_275, Icur := OriginalRow227TriangleData0978.coefficient69_274,
    output := OriginalRow227TriangleData0990.coefficient70_274, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_276, Icur := OriginalRow227TriangleData0978.coefficient69_275,
    output := OriginalRow227TriangleData0990.coefficient70_275, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_277, Icur := OriginalRow227TriangleData0978.coefficient69_276,
    output := OriginalRow227TriangleData0990.coefficient70_276, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_278, Icur := OriginalRow227TriangleData0978.coefficient69_277,
    output := OriginalRow227TriangleData0990.coefficient70_277, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_279, Icur := OriginalRow227TriangleData0978.coefficient69_278,
    output := OriginalRow227TriangleData0990.coefficient70_278, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_280, Icur := OriginalRow227TriangleData0978.coefficient69_279,
    output := OriginalRow227TriangleData0990.coefficient70_279, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_281, Icur := OriginalRow227TriangleData0978.coefficient69_280,
    output := OriginalRow227TriangleData0990.coefficient70_280, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_282, Icur := OriginalRow227TriangleData0978.coefficient69_281,
    output := OriginalRow227TriangleData0990.coefficient70_281, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_283, Icur := OriginalRow227TriangleData0978.coefficient69_282,
    output := OriginalRow227TriangleData0990.coefficient70_282, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_284, Icur := OriginalRow227TriangleData0978.coefficient69_283,
    output := OriginalRow227TriangleData0990.coefficient70_283, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_285, Icur := OriginalRow227TriangleData0978.coefficient69_284,
    output := OriginalRow227TriangleData0990.coefficient70_284, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_286, Icur := OriginalRow227TriangleData0978.coefficient69_285,
    output := OriginalRow227TriangleData0990.coefficient70_285, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_287, Icur := OriginalRow227TriangleData0978.coefficient69_286,
    output := OriginalRow227TriangleData0990.coefficient70_286, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_288, Icur := OriginalRow227TriangleData0978.coefficient69_287,
    output := OriginalRow227TriangleData0990.coefficient70_287, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_289, Icur := OriginalRow227TriangleData0978.coefficient69_288,
    output := OriginalRow227TriangleData0990.coefficient70_288, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_290, Icur := OriginalRow227TriangleData0978.coefficient69_289,
    output := OriginalRow227TriangleData0990.coefficient70_289, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0978.coefficient69_291, Icur := OriginalRow227TriangleData0978.coefficient69_290,
    output := OriginalRow227TriangleData0990.coefficient70_290, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0979.coefficient69_292, Icur := OriginalRow227TriangleData0978.coefficient69_291,
    output := OriginalRow227TriangleData0990.coefficient70_291, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0979.coefficient69_293, Icur := OriginalRow227TriangleData0979.coefficient69_292,
    output := OriginalRow227TriangleData0990.coefficient70_292, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0974

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0974.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

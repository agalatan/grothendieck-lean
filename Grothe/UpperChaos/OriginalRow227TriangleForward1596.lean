import Grothe.UpperChaos.OriginalRow227TriangleData1604
import Grothe.UpperChaos.OriginalRow227TriangleData1605
import Grothe.UpperChaos.OriginalRow227TriangleData1612
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1596
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_261, Icur := OriginalRow227TriangleData1604.coefficient132_260,
    output := OriginalRow227TriangleData1612.coefficient133_260, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_262, Icur := OriginalRow227TriangleData1604.coefficient132_261,
    output := OriginalRow227TriangleData1612.coefficient133_261, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_263, Icur := OriginalRow227TriangleData1604.coefficient132_262,
    output := OriginalRow227TriangleData1612.coefficient133_262, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_264, Icur := OriginalRow227TriangleData1604.coefficient132_263,
    output := OriginalRow227TriangleData1612.coefficient133_263, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_265, Icur := OriginalRow227TriangleData1604.coefficient132_264,
    output := OriginalRow227TriangleData1612.coefficient133_264, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_266, Icur := OriginalRow227TriangleData1604.coefficient132_265,
    output := OriginalRow227TriangleData1612.coefficient133_265, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_267, Icur := OriginalRow227TriangleData1604.coefficient132_266,
    output := OriginalRow227TriangleData1612.coefficient133_266, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_268, Icur := OriginalRow227TriangleData1604.coefficient132_267,
    output := OriginalRow227TriangleData1612.coefficient133_267, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_269, Icur := OriginalRow227TriangleData1604.coefficient132_268,
    output := OriginalRow227TriangleData1612.coefficient133_268, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_270, Icur := OriginalRow227TriangleData1604.coefficient132_269,
    output := OriginalRow227TriangleData1612.coefficient133_269, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_271, Icur := OriginalRow227TriangleData1604.coefficient132_270,
    output := OriginalRow227TriangleData1612.coefficient133_270, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_272, Icur := OriginalRow227TriangleData1604.coefficient132_271,
    output := OriginalRow227TriangleData1612.coefficient133_271, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_273, Icur := OriginalRow227TriangleData1604.coefficient132_272,
    output := OriginalRow227TriangleData1612.coefficient133_272, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_274, Icur := OriginalRow227TriangleData1604.coefficient132_273,
    output := OriginalRow227TriangleData1612.coefficient133_273, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_275, Icur := OriginalRow227TriangleData1604.coefficient132_274,
    output := OriginalRow227TriangleData1612.coefficient133_274, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_276, Icur := OriginalRow227TriangleData1604.coefficient132_275,
    output := OriginalRow227TriangleData1612.coefficient133_275, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_277, Icur := OriginalRow227TriangleData1604.coefficient132_276,
    output := OriginalRow227TriangleData1612.coefficient133_276, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_278, Icur := OriginalRow227TriangleData1604.coefficient132_277,
    output := OriginalRow227TriangleData1612.coefficient133_277, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_279, Icur := OriginalRow227TriangleData1604.coefficient132_278,
    output := OriginalRow227TriangleData1612.coefficient133_278, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_280, Icur := OriginalRow227TriangleData1604.coefficient132_279,
    output := OriginalRow227TriangleData1612.coefficient133_279, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_281, Icur := OriginalRow227TriangleData1604.coefficient132_280,
    output := OriginalRow227TriangleData1612.coefficient133_280, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_282, Icur := OriginalRow227TriangleData1604.coefficient132_281,
    output := OriginalRow227TriangleData1612.coefficient133_281, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_283, Icur := OriginalRow227TriangleData1604.coefficient132_282,
    output := OriginalRow227TriangleData1612.coefficient133_282, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_284, Icur := OriginalRow227TriangleData1604.coefficient132_283,
    output := OriginalRow227TriangleData1612.coefficient133_283, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_285, Icur := OriginalRow227TriangleData1604.coefficient132_284,
    output := OriginalRow227TriangleData1612.coefficient133_284, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_286, Icur := OriginalRow227TriangleData1604.coefficient132_285,
    output := OriginalRow227TriangleData1612.coefficient133_285, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_287, Icur := OriginalRow227TriangleData1604.coefficient132_286,
    output := OriginalRow227TriangleData1612.coefficient133_286, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_288, Icur := OriginalRow227TriangleData1604.coefficient132_287,
    output := OriginalRow227TriangleData1612.coefficient133_287, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_289, Icur := OriginalRow227TriangleData1604.coefficient132_288,
    output := OriginalRow227TriangleData1612.coefficient133_288, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1604.coefficient132_290, Icur := OriginalRow227TriangleData1604.coefficient132_289,
    output := OriginalRow227TriangleData1612.coefficient133_289, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_291, Icur := OriginalRow227TriangleData1604.coefficient132_290,
    output := OriginalRow227TriangleData1612.coefficient133_290, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots04.root133,
    Inext := OriginalRow227TriangleData1605.coefficient132_292, Icur := OriginalRow227TriangleData1605.coefficient132_291,
    output := OriginalRow227TriangleData1612.coefficient133_291, hC := OriginalRow227TriangleRoots04.root133_pos, hAC := OriginalRow227TriangleRoots04.product133_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1596

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1596.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

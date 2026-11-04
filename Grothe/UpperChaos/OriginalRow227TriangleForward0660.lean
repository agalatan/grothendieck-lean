import Grothe.UpperChaos.OriginalRow227TriangleData0663
import Grothe.UpperChaos.OriginalRow227TriangleData0664
import Grothe.UpperChaos.OriginalRow227TriangleData0676
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0660
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_269, Icur := OriginalRow227TriangleData0663.coefficient44_268,
    output := OriginalRow227TriangleData0676.coefficient45_268, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_270, Icur := OriginalRow227TriangleData0663.coefficient44_269,
    output := OriginalRow227TriangleData0676.coefficient45_269, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_271, Icur := OriginalRow227TriangleData0663.coefficient44_270,
    output := OriginalRow227TriangleData0676.coefficient45_270, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_272, Icur := OriginalRow227TriangleData0663.coefficient44_271,
    output := OriginalRow227TriangleData0676.coefficient45_271, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_273, Icur := OriginalRow227TriangleData0663.coefficient44_272,
    output := OriginalRow227TriangleData0676.coefficient45_272, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_274, Icur := OriginalRow227TriangleData0663.coefficient44_273,
    output := OriginalRow227TriangleData0676.coefficient45_273, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_275, Icur := OriginalRow227TriangleData0663.coefficient44_274,
    output := OriginalRow227TriangleData0676.coefficient45_274, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_276, Icur := OriginalRow227TriangleData0663.coefficient44_275,
    output := OriginalRow227TriangleData0676.coefficient45_275, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_277, Icur := OriginalRow227TriangleData0663.coefficient44_276,
    output := OriginalRow227TriangleData0676.coefficient45_276, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_278, Icur := OriginalRow227TriangleData0663.coefficient44_277,
    output := OriginalRow227TriangleData0676.coefficient45_277, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_279, Icur := OriginalRow227TriangleData0663.coefficient44_278,
    output := OriginalRow227TriangleData0676.coefficient45_278, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_280, Icur := OriginalRow227TriangleData0663.coefficient44_279,
    output := OriginalRow227TriangleData0676.coefficient45_279, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_281, Icur := OriginalRow227TriangleData0663.coefficient44_280,
    output := OriginalRow227TriangleData0676.coefficient45_280, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_282, Icur := OriginalRow227TriangleData0663.coefficient44_281,
    output := OriginalRow227TriangleData0676.coefficient45_281, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_283, Icur := OriginalRow227TriangleData0663.coefficient44_282,
    output := OriginalRow227TriangleData0676.coefficient45_282, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_284, Icur := OriginalRow227TriangleData0663.coefficient44_283,
    output := OriginalRow227TriangleData0676.coefficient45_283, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_285, Icur := OriginalRow227TriangleData0663.coefficient44_284,
    output := OriginalRow227TriangleData0676.coefficient45_284, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_286, Icur := OriginalRow227TriangleData0663.coefficient44_285,
    output := OriginalRow227TriangleData0676.coefficient45_285, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_287, Icur := OriginalRow227TriangleData0663.coefficient44_286,
    output := OriginalRow227TriangleData0676.coefficient45_286, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_288, Icur := OriginalRow227TriangleData0663.coefficient44_287,
    output := OriginalRow227TriangleData0676.coefficient45_287, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_289, Icur := OriginalRow227TriangleData0663.coefficient44_288,
    output := OriginalRow227TriangleData0676.coefficient45_288, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_290, Icur := OriginalRow227TriangleData0663.coefficient44_289,
    output := OriginalRow227TriangleData0676.coefficient45_289, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_291, Icur := OriginalRow227TriangleData0663.coefficient44_290,
    output := OriginalRow227TriangleData0676.coefficient45_290, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_292, Icur := OriginalRow227TriangleData0663.coefficient44_291,
    output := OriginalRow227TriangleData0676.coefficient45_291, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_293, Icur := OriginalRow227TriangleData0663.coefficient44_292,
    output := OriginalRow227TriangleData0676.coefficient45_292, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_294, Icur := OriginalRow227TriangleData0663.coefficient44_293,
    output := OriginalRow227TriangleData0676.coefficient45_293, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_295, Icur := OriginalRow227TriangleData0663.coefficient44_294,
    output := OriginalRow227TriangleData0676.coefficient45_294, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_296, Icur := OriginalRow227TriangleData0663.coefficient44_295,
    output := OriginalRow227TriangleData0676.coefficient45_295, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_297, Icur := OriginalRow227TriangleData0663.coefficient44_296,
    output := OriginalRow227TriangleData0676.coefficient45_296, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0663.coefficient44_298, Icur := OriginalRow227TriangleData0663.coefficient44_297,
    output := OriginalRow227TriangleData0676.coefficient45_297, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0664.coefficient44_299, Icur := OriginalRow227TriangleData0663.coefficient44_298,
    output := OriginalRow227TriangleData0676.coefficient45_298, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots01.root45,
    Inext := OriginalRow227TriangleData0664.coefficient44_300, Icur := OriginalRow227TriangleData0664.coefficient44_299,
    output := OriginalRow227TriangleData0676.coefficient45_299, hC := OriginalRow227TriangleRoots01.root45_pos, hAC := OriginalRow227TriangleRoots01.product45_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0660

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0660.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

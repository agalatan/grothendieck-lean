import Grothe.UpperChaos.OriginalRow227TriangleData0649
import Grothe.UpperChaos.OriginalRow227TriangleData0650
import Grothe.UpperChaos.OriginalRow227TriangleData0663
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0647
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_268, Icur := OriginalRow227TriangleData0649.coefficient43_267,
    output := OriginalRow227TriangleData0663.coefficient44_267, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_269, Icur := OriginalRow227TriangleData0649.coefficient43_268,
    output := OriginalRow227TriangleData0663.coefficient44_268, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_270, Icur := OriginalRow227TriangleData0649.coefficient43_269,
    output := OriginalRow227TriangleData0663.coefficient44_269, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_271, Icur := OriginalRow227TriangleData0649.coefficient43_270,
    output := OriginalRow227TriangleData0663.coefficient44_270, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_272, Icur := OriginalRow227TriangleData0649.coefficient43_271,
    output := OriginalRow227TriangleData0663.coefficient44_271, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_273, Icur := OriginalRow227TriangleData0649.coefficient43_272,
    output := OriginalRow227TriangleData0663.coefficient44_272, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_274, Icur := OriginalRow227TriangleData0649.coefficient43_273,
    output := OriginalRow227TriangleData0663.coefficient44_273, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_275, Icur := OriginalRow227TriangleData0649.coefficient43_274,
    output := OriginalRow227TriangleData0663.coefficient44_274, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_276, Icur := OriginalRow227TriangleData0649.coefficient43_275,
    output := OriginalRow227TriangleData0663.coefficient44_275, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_277, Icur := OriginalRow227TriangleData0649.coefficient43_276,
    output := OriginalRow227TriangleData0663.coefficient44_276, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_278, Icur := OriginalRow227TriangleData0649.coefficient43_277,
    output := OriginalRow227TriangleData0663.coefficient44_277, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_279, Icur := OriginalRow227TriangleData0649.coefficient43_278,
    output := OriginalRow227TriangleData0663.coefficient44_278, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_280, Icur := OriginalRow227TriangleData0649.coefficient43_279,
    output := OriginalRow227TriangleData0663.coefficient44_279, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_281, Icur := OriginalRow227TriangleData0649.coefficient43_280,
    output := OriginalRow227TriangleData0663.coefficient44_280, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_282, Icur := OriginalRow227TriangleData0649.coefficient43_281,
    output := OriginalRow227TriangleData0663.coefficient44_281, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_283, Icur := OriginalRow227TriangleData0649.coefficient43_282,
    output := OriginalRow227TriangleData0663.coefficient44_282, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_284, Icur := OriginalRow227TriangleData0649.coefficient43_283,
    output := OriginalRow227TriangleData0663.coefficient44_283, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_285, Icur := OriginalRow227TriangleData0649.coefficient43_284,
    output := OriginalRow227TriangleData0663.coefficient44_284, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_286, Icur := OriginalRow227TriangleData0649.coefficient43_285,
    output := OriginalRow227TriangleData0663.coefficient44_285, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_287, Icur := OriginalRow227TriangleData0649.coefficient43_286,
    output := OriginalRow227TriangleData0663.coefficient44_286, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_288, Icur := OriginalRow227TriangleData0649.coefficient43_287,
    output := OriginalRow227TriangleData0663.coefficient44_287, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_289, Icur := OriginalRow227TriangleData0649.coefficient43_288,
    output := OriginalRow227TriangleData0663.coefficient44_288, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_290, Icur := OriginalRow227TriangleData0649.coefficient43_289,
    output := OriginalRow227TriangleData0663.coefficient44_289, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_291, Icur := OriginalRow227TriangleData0649.coefficient43_290,
    output := OriginalRow227TriangleData0663.coefficient44_290, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_292, Icur := OriginalRow227TriangleData0649.coefficient43_291,
    output := OriginalRow227TriangleData0663.coefficient44_291, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_293, Icur := OriginalRow227TriangleData0649.coefficient43_292,
    output := OriginalRow227TriangleData0663.coefficient44_292, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_294, Icur := OriginalRow227TriangleData0649.coefficient43_293,
    output := OriginalRow227TriangleData0663.coefficient44_293, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_295, Icur := OriginalRow227TriangleData0649.coefficient43_294,
    output := OriginalRow227TriangleData0663.coefficient44_294, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_296, Icur := OriginalRow227TriangleData0649.coefficient43_295,
    output := OriginalRow227TriangleData0663.coefficient44_295, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0649.coefficient43_297, Icur := OriginalRow227TriangleData0649.coefficient43_296,
    output := OriginalRow227TriangleData0663.coefficient44_296, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0650.coefficient43_298, Icur := OriginalRow227TriangleData0649.coefficient43_297,
    output := OriginalRow227TriangleData0663.coefficient44_297, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots01.root44,
    Inext := OriginalRow227TriangleData0650.coefficient43_299, Icur := OriginalRow227TriangleData0650.coefficient43_298,
    output := OriginalRow227TriangleData0663.coefficient44_298, hC := OriginalRow227TriangleRoots01.root44_pos, hAC := OriginalRow227TriangleRoots01.product44_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0647

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0647.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

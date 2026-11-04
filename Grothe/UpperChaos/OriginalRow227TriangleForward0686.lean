import Grothe.UpperChaos.OriginalRow227TriangleData0689
import Grothe.UpperChaos.OriginalRow227TriangleData0690
import Grothe.UpperChaos.OriginalRow227TriangleData0702
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0686
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_271, Icur := OriginalRow227TriangleData0689.coefficient46_270,
    output := OriginalRow227TriangleData0702.coefficient47_270, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_272, Icur := OriginalRow227TriangleData0689.coefficient46_271,
    output := OriginalRow227TriangleData0702.coefficient47_271, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_273, Icur := OriginalRow227TriangleData0689.coefficient46_272,
    output := OriginalRow227TriangleData0702.coefficient47_272, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_274, Icur := OriginalRow227TriangleData0689.coefficient46_273,
    output := OriginalRow227TriangleData0702.coefficient47_273, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_275, Icur := OriginalRow227TriangleData0689.coefficient46_274,
    output := OriginalRow227TriangleData0702.coefficient47_274, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_276, Icur := OriginalRow227TriangleData0689.coefficient46_275,
    output := OriginalRow227TriangleData0702.coefficient47_275, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_277, Icur := OriginalRow227TriangleData0689.coefficient46_276,
    output := OriginalRow227TriangleData0702.coefficient47_276, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_278, Icur := OriginalRow227TriangleData0689.coefficient46_277,
    output := OriginalRow227TriangleData0702.coefficient47_277, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_279, Icur := OriginalRow227TriangleData0689.coefficient46_278,
    output := OriginalRow227TriangleData0702.coefficient47_278, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_280, Icur := OriginalRow227TriangleData0689.coefficient46_279,
    output := OriginalRow227TriangleData0702.coefficient47_279, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_281, Icur := OriginalRow227TriangleData0689.coefficient46_280,
    output := OriginalRow227TriangleData0702.coefficient47_280, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_282, Icur := OriginalRow227TriangleData0689.coefficient46_281,
    output := OriginalRow227TriangleData0702.coefficient47_281, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_283, Icur := OriginalRow227TriangleData0689.coefficient46_282,
    output := OriginalRow227TriangleData0702.coefficient47_282, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_284, Icur := OriginalRow227TriangleData0689.coefficient46_283,
    output := OriginalRow227TriangleData0702.coefficient47_283, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_285, Icur := OriginalRow227TriangleData0689.coefficient46_284,
    output := OriginalRow227TriangleData0702.coefficient47_284, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_286, Icur := OriginalRow227TriangleData0689.coefficient46_285,
    output := OriginalRow227TriangleData0702.coefficient47_285, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_287, Icur := OriginalRow227TriangleData0689.coefficient46_286,
    output := OriginalRow227TriangleData0702.coefficient47_286, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_288, Icur := OriginalRow227TriangleData0689.coefficient46_287,
    output := OriginalRow227TriangleData0702.coefficient47_287, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_289, Icur := OriginalRow227TriangleData0689.coefficient46_288,
    output := OriginalRow227TriangleData0702.coefficient47_288, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_290, Icur := OriginalRow227TriangleData0689.coefficient46_289,
    output := OriginalRow227TriangleData0702.coefficient47_289, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_291, Icur := OriginalRow227TriangleData0689.coefficient46_290,
    output := OriginalRow227TriangleData0702.coefficient47_290, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_292, Icur := OriginalRow227TriangleData0689.coefficient46_291,
    output := OriginalRow227TriangleData0702.coefficient47_291, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_293, Icur := OriginalRow227TriangleData0689.coefficient46_292,
    output := OriginalRow227TriangleData0702.coefficient47_292, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_294, Icur := OriginalRow227TriangleData0689.coefficient46_293,
    output := OriginalRow227TriangleData0702.coefficient47_293, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_295, Icur := OriginalRow227TriangleData0689.coefficient46_294,
    output := OriginalRow227TriangleData0702.coefficient47_294, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_296, Icur := OriginalRow227TriangleData0689.coefficient46_295,
    output := OriginalRow227TriangleData0702.coefficient47_295, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_297, Icur := OriginalRow227TriangleData0689.coefficient46_296,
    output := OriginalRow227TriangleData0702.coefficient47_296, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_298, Icur := OriginalRow227TriangleData0689.coefficient46_297,
    output := OriginalRow227TriangleData0702.coefficient47_297, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_299, Icur := OriginalRow227TriangleData0689.coefficient46_298,
    output := OriginalRow227TriangleData0702.coefficient47_298, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0689.coefficient46_300, Icur := OriginalRow227TriangleData0689.coefficient46_299,
    output := OriginalRow227TriangleData0702.coefficient47_299, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0690.coefficient46_301, Icur := OriginalRow227TriangleData0689.coefficient46_300,
    output := OriginalRow227TriangleData0702.coefficient47_300, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots01.root47,
    Inext := OriginalRow227TriangleData0690.coefficient46_302, Icur := OriginalRow227TriangleData0690.coefficient46_301,
    output := OriginalRow227TriangleData0702.coefficient47_301, hC := OriginalRow227TriangleRoots01.root47_pos, hAC := OriginalRow227TriangleRoots01.product47_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0686

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0686.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

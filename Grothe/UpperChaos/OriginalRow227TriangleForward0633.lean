import Grothe.UpperChaos.OriginalRow227TriangleData0635
import Grothe.UpperChaos.OriginalRow227TriangleData0636
import Grothe.UpperChaos.OriginalRow227TriangleData0649
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0633
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_267, Icur := OriginalRow227TriangleData0635.coefficient42_266,
    output := OriginalRow227TriangleData0649.coefficient43_266, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_268, Icur := OriginalRow227TriangleData0635.coefficient42_267,
    output := OriginalRow227TriangleData0649.coefficient43_267, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_269, Icur := OriginalRow227TriangleData0635.coefficient42_268,
    output := OriginalRow227TriangleData0649.coefficient43_268, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_270, Icur := OriginalRow227TriangleData0635.coefficient42_269,
    output := OriginalRow227TriangleData0649.coefficient43_269, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_271, Icur := OriginalRow227TriangleData0635.coefficient42_270,
    output := OriginalRow227TriangleData0649.coefficient43_270, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_272, Icur := OriginalRow227TriangleData0635.coefficient42_271,
    output := OriginalRow227TriangleData0649.coefficient43_271, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_273, Icur := OriginalRow227TriangleData0635.coefficient42_272,
    output := OriginalRow227TriangleData0649.coefficient43_272, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_274, Icur := OriginalRow227TriangleData0635.coefficient42_273,
    output := OriginalRow227TriangleData0649.coefficient43_273, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_275, Icur := OriginalRow227TriangleData0635.coefficient42_274,
    output := OriginalRow227TriangleData0649.coefficient43_274, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_276, Icur := OriginalRow227TriangleData0635.coefficient42_275,
    output := OriginalRow227TriangleData0649.coefficient43_275, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_277, Icur := OriginalRow227TriangleData0635.coefficient42_276,
    output := OriginalRow227TriangleData0649.coefficient43_276, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_278, Icur := OriginalRow227TriangleData0635.coefficient42_277,
    output := OriginalRow227TriangleData0649.coefficient43_277, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_279, Icur := OriginalRow227TriangleData0635.coefficient42_278,
    output := OriginalRow227TriangleData0649.coefficient43_278, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_280, Icur := OriginalRow227TriangleData0635.coefficient42_279,
    output := OriginalRow227TriangleData0649.coefficient43_279, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_281, Icur := OriginalRow227TriangleData0635.coefficient42_280,
    output := OriginalRow227TriangleData0649.coefficient43_280, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_282, Icur := OriginalRow227TriangleData0635.coefficient42_281,
    output := OriginalRow227TriangleData0649.coefficient43_281, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_283, Icur := OriginalRow227TriangleData0635.coefficient42_282,
    output := OriginalRow227TriangleData0649.coefficient43_282, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_284, Icur := OriginalRow227TriangleData0635.coefficient42_283,
    output := OriginalRow227TriangleData0649.coefficient43_283, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_285, Icur := OriginalRow227TriangleData0635.coefficient42_284,
    output := OriginalRow227TriangleData0649.coefficient43_284, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_286, Icur := OriginalRow227TriangleData0635.coefficient42_285,
    output := OriginalRow227TriangleData0649.coefficient43_285, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_287, Icur := OriginalRow227TriangleData0635.coefficient42_286,
    output := OriginalRow227TriangleData0649.coefficient43_286, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_288, Icur := OriginalRow227TriangleData0635.coefficient42_287,
    output := OriginalRow227TriangleData0649.coefficient43_287, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_289, Icur := OriginalRow227TriangleData0635.coefficient42_288,
    output := OriginalRow227TriangleData0649.coefficient43_288, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_290, Icur := OriginalRow227TriangleData0635.coefficient42_289,
    output := OriginalRow227TriangleData0649.coefficient43_289, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_291, Icur := OriginalRow227TriangleData0635.coefficient42_290,
    output := OriginalRow227TriangleData0649.coefficient43_290, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_292, Icur := OriginalRow227TriangleData0635.coefficient42_291,
    output := OriginalRow227TriangleData0649.coefficient43_291, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_293, Icur := OriginalRow227TriangleData0635.coefficient42_292,
    output := OriginalRow227TriangleData0649.coefficient43_292, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_294, Icur := OriginalRow227TriangleData0635.coefficient42_293,
    output := OriginalRow227TriangleData0649.coefficient43_293, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_295, Icur := OriginalRow227TriangleData0635.coefficient42_294,
    output := OriginalRow227TriangleData0649.coefficient43_294, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0635.coefficient42_296, Icur := OriginalRow227TriangleData0635.coefficient42_295,
    output := OriginalRow227TriangleData0649.coefficient43_295, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0636.coefficient42_297, Icur := OriginalRow227TriangleData0635.coefficient42_296,
    output := OriginalRow227TriangleData0649.coefficient43_296, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0636.coefficient42_298, Icur := OriginalRow227TriangleData0636.coefficient42_297,
    output := OriginalRow227TriangleData0649.coefficient43_297, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0633

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0633.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData0895
import Grothe.UpperChaos.OriginalRow227TriangleData0896
import Grothe.UpperChaos.OriginalRow227TriangleData0907
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0891
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_287, Icur := OriginalRow227TriangleData0895.coefficient62_286,
    output := OriginalRow227TriangleData0907.coefficient63_286, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_288, Icur := OriginalRow227TriangleData0895.coefficient62_287,
    output := OriginalRow227TriangleData0907.coefficient63_287, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_289, Icur := OriginalRow227TriangleData0895.coefficient62_288,
    output := OriginalRow227TriangleData0907.coefficient63_288, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_290, Icur := OriginalRow227TriangleData0895.coefficient62_289,
    output := OriginalRow227TriangleData0907.coefficient63_289, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_291, Icur := OriginalRow227TriangleData0895.coefficient62_290,
    output := OriginalRow227TriangleData0907.coefficient63_290, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_292, Icur := OriginalRow227TriangleData0895.coefficient62_291,
    output := OriginalRow227TriangleData0907.coefficient63_291, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_293, Icur := OriginalRow227TriangleData0895.coefficient62_292,
    output := OriginalRow227TriangleData0907.coefficient63_292, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_294, Icur := OriginalRow227TriangleData0895.coefficient62_293,
    output := OriginalRow227TriangleData0907.coefficient63_293, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_295, Icur := OriginalRow227TriangleData0895.coefficient62_294,
    output := OriginalRow227TriangleData0907.coefficient63_294, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_296, Icur := OriginalRow227TriangleData0895.coefficient62_295,
    output := OriginalRow227TriangleData0907.coefficient63_295, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_297, Icur := OriginalRow227TriangleData0895.coefficient62_296,
    output := OriginalRow227TriangleData0907.coefficient63_296, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_298, Icur := OriginalRow227TriangleData0895.coefficient62_297,
    output := OriginalRow227TriangleData0907.coefficient63_297, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_299, Icur := OriginalRow227TriangleData0895.coefficient62_298,
    output := OriginalRow227TriangleData0907.coefficient63_298, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_300, Icur := OriginalRow227TriangleData0895.coefficient62_299,
    output := OriginalRow227TriangleData0907.coefficient63_299, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_301, Icur := OriginalRow227TriangleData0895.coefficient62_300,
    output := OriginalRow227TriangleData0907.coefficient63_300, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_302, Icur := OriginalRow227TriangleData0895.coefficient62_301,
    output := OriginalRow227TriangleData0907.coefficient63_301, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_303, Icur := OriginalRow227TriangleData0895.coefficient62_302,
    output := OriginalRow227TriangleData0907.coefficient63_302, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_304, Icur := OriginalRow227TriangleData0895.coefficient62_303,
    output := OriginalRow227TriangleData0907.coefficient63_303, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_305, Icur := OriginalRow227TriangleData0895.coefficient62_304,
    output := OriginalRow227TriangleData0907.coefficient63_304, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_306, Icur := OriginalRow227TriangleData0895.coefficient62_305,
    output := OriginalRow227TriangleData0907.coefficient63_305, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_307, Icur := OriginalRow227TriangleData0895.coefficient62_306,
    output := OriginalRow227TriangleData0907.coefficient63_306, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_308, Icur := OriginalRow227TriangleData0895.coefficient62_307,
    output := OriginalRow227TriangleData0907.coefficient63_307, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_309, Icur := OriginalRow227TriangleData0895.coefficient62_308,
    output := OriginalRow227TriangleData0907.coefficient63_308, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_310, Icur := OriginalRow227TriangleData0895.coefficient62_309,
    output := OriginalRow227TriangleData0907.coefficient63_309, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_311, Icur := OriginalRow227TriangleData0895.coefficient62_310,
    output := OriginalRow227TriangleData0907.coefficient63_310, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_312, Icur := OriginalRow227TriangleData0895.coefficient62_311,
    output := OriginalRow227TriangleData0907.coefficient63_311, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_313, Icur := OriginalRow227TriangleData0895.coefficient62_312,
    output := OriginalRow227TriangleData0907.coefficient63_312, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_314, Icur := OriginalRow227TriangleData0895.coefficient62_313,
    output := OriginalRow227TriangleData0907.coefficient63_313, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_315, Icur := OriginalRow227TriangleData0895.coefficient62_314,
    output := OriginalRow227TriangleData0907.coefficient63_314, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0895.coefficient62_316, Icur := OriginalRow227TriangleData0895.coefficient62_315,
    output := OriginalRow227TriangleData0907.coefficient63_315, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0896.coefficient62_317, Icur := OriginalRow227TriangleData0895.coefficient62_316,
    output := OriginalRow227TriangleData0907.coefficient63_316, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0896.coefficient62_318, Icur := OriginalRow227TriangleData0896.coefficient62_317,
    output := OriginalRow227TriangleData0907.coefficient63_317, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0891

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0891.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

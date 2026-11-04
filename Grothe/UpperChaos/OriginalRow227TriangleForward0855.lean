import Grothe.UpperChaos.OriginalRow227TriangleData0858
import Grothe.UpperChaos.OriginalRow227TriangleData0859
import Grothe.UpperChaos.OriginalRow227TriangleData0871
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0855
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_284, Icur := OriginalRow227TriangleData0858.coefficient59_283,
    output := OriginalRow227TriangleData0871.coefficient60_283, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_285, Icur := OriginalRow227TriangleData0858.coefficient59_284,
    output := OriginalRow227TriangleData0871.coefficient60_284, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_286, Icur := OriginalRow227TriangleData0858.coefficient59_285,
    output := OriginalRow227TriangleData0871.coefficient60_285, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_287, Icur := OriginalRow227TriangleData0858.coefficient59_286,
    output := OriginalRow227TriangleData0871.coefficient60_286, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_288, Icur := OriginalRow227TriangleData0858.coefficient59_287,
    output := OriginalRow227TriangleData0871.coefficient60_287, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_289, Icur := OriginalRow227TriangleData0858.coefficient59_288,
    output := OriginalRow227TriangleData0871.coefficient60_288, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_290, Icur := OriginalRow227TriangleData0858.coefficient59_289,
    output := OriginalRow227TriangleData0871.coefficient60_289, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_291, Icur := OriginalRow227TriangleData0858.coefficient59_290,
    output := OriginalRow227TriangleData0871.coefficient60_290, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_292, Icur := OriginalRow227TriangleData0858.coefficient59_291,
    output := OriginalRow227TriangleData0871.coefficient60_291, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_293, Icur := OriginalRow227TriangleData0858.coefficient59_292,
    output := OriginalRow227TriangleData0871.coefficient60_292, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_294, Icur := OriginalRow227TriangleData0858.coefficient59_293,
    output := OriginalRow227TriangleData0871.coefficient60_293, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_295, Icur := OriginalRow227TriangleData0858.coefficient59_294,
    output := OriginalRow227TriangleData0871.coefficient60_294, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_296, Icur := OriginalRow227TriangleData0858.coefficient59_295,
    output := OriginalRow227TriangleData0871.coefficient60_295, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_297, Icur := OriginalRow227TriangleData0858.coefficient59_296,
    output := OriginalRow227TriangleData0871.coefficient60_296, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_298, Icur := OriginalRow227TriangleData0858.coefficient59_297,
    output := OriginalRow227TriangleData0871.coefficient60_297, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_299, Icur := OriginalRow227TriangleData0858.coefficient59_298,
    output := OriginalRow227TriangleData0871.coefficient60_298, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_300, Icur := OriginalRow227TriangleData0858.coefficient59_299,
    output := OriginalRow227TriangleData0871.coefficient60_299, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_301, Icur := OriginalRow227TriangleData0858.coefficient59_300,
    output := OriginalRow227TriangleData0871.coefficient60_300, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_302, Icur := OriginalRow227TriangleData0858.coefficient59_301,
    output := OriginalRow227TriangleData0871.coefficient60_301, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_303, Icur := OriginalRow227TriangleData0858.coefficient59_302,
    output := OriginalRow227TriangleData0871.coefficient60_302, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_304, Icur := OriginalRow227TriangleData0858.coefficient59_303,
    output := OriginalRow227TriangleData0871.coefficient60_303, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_305, Icur := OriginalRow227TriangleData0858.coefficient59_304,
    output := OriginalRow227TriangleData0871.coefficient60_304, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_306, Icur := OriginalRow227TriangleData0858.coefficient59_305,
    output := OriginalRow227TriangleData0871.coefficient60_305, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_307, Icur := OriginalRow227TriangleData0858.coefficient59_306,
    output := OriginalRow227TriangleData0871.coefficient60_306, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_308, Icur := OriginalRow227TriangleData0858.coefficient59_307,
    output := OriginalRow227TriangleData0871.coefficient60_307, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_309, Icur := OriginalRow227TriangleData0858.coefficient59_308,
    output := OriginalRow227TriangleData0871.coefficient60_308, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_310, Icur := OriginalRow227TriangleData0858.coefficient59_309,
    output := OriginalRow227TriangleData0871.coefficient60_309, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_311, Icur := OriginalRow227TriangleData0858.coefficient59_310,
    output := OriginalRow227TriangleData0871.coefficient60_310, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_312, Icur := OriginalRow227TriangleData0858.coefficient59_311,
    output := OriginalRow227TriangleData0871.coefficient60_311, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0858.coefficient59_313, Icur := OriginalRow227TriangleData0858.coefficient59_312,
    output := OriginalRow227TriangleData0871.coefficient60_312, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0859.coefficient59_314, Icur := OriginalRow227TriangleData0858.coefficient59_313,
    output := OriginalRow227TriangleData0871.coefficient60_313, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0859.coefficient59_315, Icur := OriginalRow227TriangleData0859.coefficient59_314,
    output := OriginalRow227TriangleData0871.coefficient60_314, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0855

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0855.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData0832
import Grothe.UpperChaos.OriginalRow227TriangleData0833
import Grothe.UpperChaos.OriginalRow227TriangleData0845
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0829
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_282, Icur := OriginalRow227TriangleData0832.coefficient57_281,
    output := OriginalRow227TriangleData0845.coefficient58_281, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_283, Icur := OriginalRow227TriangleData0832.coefficient57_282,
    output := OriginalRow227TriangleData0845.coefficient58_282, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_284, Icur := OriginalRow227TriangleData0832.coefficient57_283,
    output := OriginalRow227TriangleData0845.coefficient58_283, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_285, Icur := OriginalRow227TriangleData0832.coefficient57_284,
    output := OriginalRow227TriangleData0845.coefficient58_284, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_286, Icur := OriginalRow227TriangleData0832.coefficient57_285,
    output := OriginalRow227TriangleData0845.coefficient58_285, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_287, Icur := OriginalRow227TriangleData0832.coefficient57_286,
    output := OriginalRow227TriangleData0845.coefficient58_286, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_288, Icur := OriginalRow227TriangleData0832.coefficient57_287,
    output := OriginalRow227TriangleData0845.coefficient58_287, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_289, Icur := OriginalRow227TriangleData0832.coefficient57_288,
    output := OriginalRow227TriangleData0845.coefficient58_288, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_290, Icur := OriginalRow227TriangleData0832.coefficient57_289,
    output := OriginalRow227TriangleData0845.coefficient58_289, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_291, Icur := OriginalRow227TriangleData0832.coefficient57_290,
    output := OriginalRow227TriangleData0845.coefficient58_290, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_292, Icur := OriginalRow227TriangleData0832.coefficient57_291,
    output := OriginalRow227TriangleData0845.coefficient58_291, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_293, Icur := OriginalRow227TriangleData0832.coefficient57_292,
    output := OriginalRow227TriangleData0845.coefficient58_292, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_294, Icur := OriginalRow227TriangleData0832.coefficient57_293,
    output := OriginalRow227TriangleData0845.coefficient58_293, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_295, Icur := OriginalRow227TriangleData0832.coefficient57_294,
    output := OriginalRow227TriangleData0845.coefficient58_294, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_296, Icur := OriginalRow227TriangleData0832.coefficient57_295,
    output := OriginalRow227TriangleData0845.coefficient58_295, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_297, Icur := OriginalRow227TriangleData0832.coefficient57_296,
    output := OriginalRow227TriangleData0845.coefficient58_296, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_298, Icur := OriginalRow227TriangleData0832.coefficient57_297,
    output := OriginalRow227TriangleData0845.coefficient58_297, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_299, Icur := OriginalRow227TriangleData0832.coefficient57_298,
    output := OriginalRow227TriangleData0845.coefficient58_298, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_300, Icur := OriginalRow227TriangleData0832.coefficient57_299,
    output := OriginalRow227TriangleData0845.coefficient58_299, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_301, Icur := OriginalRow227TriangleData0832.coefficient57_300,
    output := OriginalRow227TriangleData0845.coefficient58_300, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_302, Icur := OriginalRow227TriangleData0832.coefficient57_301,
    output := OriginalRow227TriangleData0845.coefficient58_301, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_303, Icur := OriginalRow227TriangleData0832.coefficient57_302,
    output := OriginalRow227TriangleData0845.coefficient58_302, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_304, Icur := OriginalRow227TriangleData0832.coefficient57_303,
    output := OriginalRow227TriangleData0845.coefficient58_303, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_305, Icur := OriginalRow227TriangleData0832.coefficient57_304,
    output := OriginalRow227TriangleData0845.coefficient58_304, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_306, Icur := OriginalRow227TriangleData0832.coefficient57_305,
    output := OriginalRow227TriangleData0845.coefficient58_305, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_307, Icur := OriginalRow227TriangleData0832.coefficient57_306,
    output := OriginalRow227TriangleData0845.coefficient58_306, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_308, Icur := OriginalRow227TriangleData0832.coefficient57_307,
    output := OriginalRow227TriangleData0845.coefficient58_307, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_309, Icur := OriginalRow227TriangleData0832.coefficient57_308,
    output := OriginalRow227TriangleData0845.coefficient58_308, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_310, Icur := OriginalRow227TriangleData0832.coefficient57_309,
    output := OriginalRow227TriangleData0845.coefficient58_309, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0832.coefficient57_311, Icur := OriginalRow227TriangleData0832.coefficient57_310,
    output := OriginalRow227TriangleData0845.coefficient58_310, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0833.coefficient57_312, Icur := OriginalRow227TriangleData0832.coefficient57_311,
    output := OriginalRow227TriangleData0845.coefficient58_311, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0833.coefficient57_313, Icur := OriginalRow227TriangleData0833.coefficient57_312,
    output := OriginalRow227TriangleData0845.coefficient58_312, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0829

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0829.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

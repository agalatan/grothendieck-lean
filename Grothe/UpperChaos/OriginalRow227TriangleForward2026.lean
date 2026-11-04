import Grothe.UpperChaos.OriginalRow227TriangleData2039
import Grothe.UpperChaos.OriginalRow227TriangleData2042
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2026
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots06.root212,
    Inext := OriginalRow227TriangleData2039.coefficient211_276, Icur := OriginalRow227TriangleData2039.coefficient211_275,
    output := OriginalRow227TriangleData2042.coefficient212_275, hC := OriginalRow227TriangleRoots06.root212_pos, hAC := OriginalRow227TriangleRoots06.product212_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots08.root277, IC := OriginalRow227TriangleRoots06.root212,
    Inext := OriginalRow227TriangleData2039.coefficient211_277, Icur := OriginalRow227TriangleData2039.coefficient211_276,
    output := OriginalRow227TriangleData2042.coefficient212_276, hC := OriginalRow227TriangleRoots06.root212_pos, hAC := OriginalRow227TriangleRoots06.product212_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots08.root278, IC := OriginalRow227TriangleRoots06.root212,
    Inext := OriginalRow227TriangleData2039.coefficient211_278, Icur := OriginalRow227TriangleData2039.coefficient211_277,
    output := OriginalRow227TriangleData2042.coefficient212_277, hC := OriginalRow227TriangleRoots06.root212_pos, hAC := OriginalRow227TriangleRoots06.product212_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots08.root279, IC := OriginalRow227TriangleRoots06.root212,
    Inext := OriginalRow227TriangleData2039.coefficient211_279, Icur := OriginalRow227TriangleData2039.coefficient211_278,
    output := OriginalRow227TriangleData2042.coefficient212_278, hC := OriginalRow227TriangleRoots06.root212_pos, hAC := OriginalRow227TriangleRoots06.product212_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots08.root280, IC := OriginalRow227TriangleRoots06.root212,
    Inext := OriginalRow227TriangleData2039.coefficient211_280, Icur := OriginalRow227TriangleData2039.coefficient211_279,
    output := OriginalRow227TriangleData2042.coefficient212_279, hC := OriginalRow227TriangleRoots06.root212_pos, hAC := OriginalRow227TriangleRoots06.product212_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots08.root281, IC := OriginalRow227TriangleRoots06.root212,
    Inext := OriginalRow227TriangleData2039.coefficient211_281, Icur := OriginalRow227TriangleData2039.coefficient211_280,
    output := OriginalRow227TriangleData2042.coefficient212_280, hC := OriginalRow227TriangleRoots06.root212_pos, hAC := OriginalRow227TriangleRoots06.product212_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots08.root282, IC := OriginalRow227TriangleRoots06.root212,
    Inext := OriginalRow227TriangleData2039.coefficient211_282, Icur := OriginalRow227TriangleData2039.coefficient211_281,
    output := OriginalRow227TriangleData2042.coefficient212_281, hC := OriginalRow227TriangleRoots06.root212_pos, hAC := OriginalRow227TriangleRoots06.product212_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots08.root283, IC := OriginalRow227TriangleRoots06.root212,
    Inext := OriginalRow227TriangleData2039.coefficient211_283, Icur := OriginalRow227TriangleData2039.coefficient211_282,
    output := OriginalRow227TriangleData2042.coefficient212_282, hC := OriginalRow227TriangleRoots06.root212_pos, hAC := OriginalRow227TriangleRoots06.product212_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots08.root284, IC := OriginalRow227TriangleRoots06.root212,
    Inext := OriginalRow227TriangleData2039.coefficient211_284, Icur := OriginalRow227TriangleData2039.coefficient211_283,
    output := OriginalRow227TriangleData2042.coefficient212_283, hC := OriginalRow227TriangleRoots06.root212_pos, hAC := OriginalRow227TriangleRoots06.product212_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots08.root285, IC := OriginalRow227TriangleRoots06.root212,
    Inext := OriginalRow227TriangleData2039.coefficient211_285, Icur := OriginalRow227TriangleData2039.coefficient211_284,
    output := OriginalRow227TriangleData2042.coefficient212_284, hC := OriginalRow227TriangleRoots06.root212_pos, hAC := OriginalRow227TriangleRoots06.product212_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots08.root286, IC := OriginalRow227TriangleRoots06.root212,
    Inext := OriginalRow227TriangleData2039.coefficient211_286, Icur := OriginalRow227TriangleData2039.coefficient211_285,
    output := OriginalRow227TriangleData2042.coefficient212_285, hC := OriginalRow227TriangleRoots06.root212_pos, hAC := OriginalRow227TriangleRoots06.product212_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots06.root212,
    Inext := OriginalRow227TriangleData2039.coefficient211_287, Icur := OriginalRow227TriangleData2039.coefficient211_286,
    output := OriginalRow227TriangleData2042.coefficient212_286, hC := OriginalRow227TriangleRoots06.root212_pos, hAC := OriginalRow227TriangleRoots06.product212_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots06.root212,
    Inext := OriginalRow227TriangleData2039.coefficient211_288, Icur := OriginalRow227TriangleData2039.coefficient211_287,
    output := OriginalRow227TriangleData2042.coefficient212_287, hC := OriginalRow227TriangleRoots06.root212_pos, hAC := OriginalRow227TriangleRoots06.product212_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots06.root212,
    Inext := OriginalRow227TriangleData2039.coefficient211_289, Icur := OriginalRow227TriangleData2039.coefficient211_288,
    output := OriginalRow227TriangleData2042.coefficient212_288, hC := OriginalRow227TriangleRoots06.root212_pos, hAC := OriginalRow227TriangleRoots06.product212_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots06.root212,
    Inext := OriginalRow227TriangleData2039.coefficient211_290, Icur := OriginalRow227TriangleData2039.coefficient211_289,
    output := OriginalRow227TriangleData2042.coefficient212_289, hC := OriginalRow227TriangleRoots06.root212_pos, hAC := OriginalRow227TriangleRoots06.product212_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2026

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2026.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData2081
import Grothe.UpperChaos.OriginalRow227TriangleData2083
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2067
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots07.root229,
    Inext := OriginalRow227TriangleData2081.coefficient228_261, Icur := OriginalRow227TriangleData2081.coefficient228_260,
    output := OriginalRow227TriangleData2083.coefficient229_260, hC := OriginalRow227TriangleRoots07.root229_pos, hAC := OriginalRow227TriangleRoots07.product229_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots07.root229,
    Inext := OriginalRow227TriangleData2081.coefficient228_262, Icur := OriginalRow227TriangleData2081.coefficient228_261,
    output := OriginalRow227TriangleData2083.coefficient229_261, hC := OriginalRow227TriangleRoots07.root229_pos, hAC := OriginalRow227TriangleRoots07.product229_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots07.root229,
    Inext := OriginalRow227TriangleData2081.coefficient228_263, Icur := OriginalRow227TriangleData2081.coefficient228_262,
    output := OriginalRow227TriangleData2083.coefficient229_262, hC := OriginalRow227TriangleRoots07.root229_pos, hAC := OriginalRow227TriangleRoots07.product229_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots07.root229,
    Inext := OriginalRow227TriangleData2081.coefficient228_264, Icur := OriginalRow227TriangleData2081.coefficient228_263,
    output := OriginalRow227TriangleData2083.coefficient229_263, hC := OriginalRow227TriangleRoots07.root229_pos, hAC := OriginalRow227TriangleRoots07.product229_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots07.root229,
    Inext := OriginalRow227TriangleData2081.coefficient228_265, Icur := OriginalRow227TriangleData2081.coefficient228_264,
    output := OriginalRow227TriangleData2083.coefficient229_264, hC := OriginalRow227TriangleRoots07.root229_pos, hAC := OriginalRow227TriangleRoots07.product229_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots07.root229,
    Inext := OriginalRow227TriangleData2081.coefficient228_266, Icur := OriginalRow227TriangleData2081.coefficient228_265,
    output := OriginalRow227TriangleData2083.coefficient229_265, hC := OriginalRow227TriangleRoots07.root229_pos, hAC := OriginalRow227TriangleRoots07.product229_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots07.root229,
    Inext := OriginalRow227TriangleData2081.coefficient228_267, Icur := OriginalRow227TriangleData2081.coefficient228_266,
    output := OriginalRow227TriangleData2083.coefficient229_266, hC := OriginalRow227TriangleRoots07.root229_pos, hAC := OriginalRow227TriangleRoots07.product229_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots07.root229,
    Inext := OriginalRow227TriangleData2081.coefficient228_268, Icur := OriginalRow227TriangleData2081.coefficient228_267,
    output := OriginalRow227TriangleData2083.coefficient229_267, hC := OriginalRow227TriangleRoots07.root229_pos, hAC := OriginalRow227TriangleRoots07.product229_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots07.root229,
    Inext := OriginalRow227TriangleData2081.coefficient228_269, Icur := OriginalRow227TriangleData2081.coefficient228_268,
    output := OriginalRow227TriangleData2083.coefficient229_268, hC := OriginalRow227TriangleRoots07.root229_pos, hAC := OriginalRow227TriangleRoots07.product229_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots07.root229,
    Inext := OriginalRow227TriangleData2081.coefficient228_270, Icur := OriginalRow227TriangleData2081.coefficient228_269,
    output := OriginalRow227TriangleData2083.coefficient229_269, hC := OriginalRow227TriangleRoots07.root229_pos, hAC := OriginalRow227TriangleRoots07.product229_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots07.root229,
    Inext := OriginalRow227TriangleData2081.coefficient228_271, Icur := OriginalRow227TriangleData2081.coefficient228_270,
    output := OriginalRow227TriangleData2083.coefficient229_270, hC := OriginalRow227TriangleRoots07.root229_pos, hAC := OriginalRow227TriangleRoots07.product229_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots07.root229,
    Inext := OriginalRow227TriangleData2081.coefficient228_272, Icur := OriginalRow227TriangleData2081.coefficient228_271,
    output := OriginalRow227TriangleData2083.coefficient229_271, hC := OriginalRow227TriangleRoots07.root229_pos, hAC := OriginalRow227TriangleRoots07.product229_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots07.root229,
    Inext := OriginalRow227TriangleData2081.coefficient228_273, Icur := OriginalRow227TriangleData2081.coefficient228_272,
    output := OriginalRow227TriangleData2083.coefficient229_272, hC := OriginalRow227TriangleRoots07.root229_pos, hAC := OriginalRow227TriangleRoots07.product229_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2067

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2067.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

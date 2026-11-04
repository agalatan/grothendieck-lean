import Grothe.UpperChaos.OriginalRow227TriangleData2079
import Grothe.UpperChaos.OriginalRow227TriangleData2081
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2065
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots07.root228,
    Inext := OriginalRow227TriangleData2079.coefficient227_260, Icur := OriginalRow227TriangleData2079.coefficient227_259,
    output := OriginalRow227TriangleData2081.coefficient228_259, hC := OriginalRow227TriangleRoots07.root228_pos, hAC := OriginalRow227TriangleRoots07.product228_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots07.root228,
    Inext := OriginalRow227TriangleData2079.coefficient227_261, Icur := OriginalRow227TriangleData2079.coefficient227_260,
    output := OriginalRow227TriangleData2081.coefficient228_260, hC := OriginalRow227TriangleRoots07.root228_pos, hAC := OriginalRow227TriangleRoots07.product228_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots07.root228,
    Inext := OriginalRow227TriangleData2079.coefficient227_262, Icur := OriginalRow227TriangleData2079.coefficient227_261,
    output := OriginalRow227TriangleData2081.coefficient228_261, hC := OriginalRow227TriangleRoots07.root228_pos, hAC := OriginalRow227TriangleRoots07.product228_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots07.root228,
    Inext := OriginalRow227TriangleData2079.coefficient227_263, Icur := OriginalRow227TriangleData2079.coefficient227_262,
    output := OriginalRow227TriangleData2081.coefficient228_262, hC := OriginalRow227TriangleRoots07.root228_pos, hAC := OriginalRow227TriangleRoots07.product228_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots07.root228,
    Inext := OriginalRow227TriangleData2079.coefficient227_264, Icur := OriginalRow227TriangleData2079.coefficient227_263,
    output := OriginalRow227TriangleData2081.coefficient228_263, hC := OriginalRow227TriangleRoots07.root228_pos, hAC := OriginalRow227TriangleRoots07.product228_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots07.root228,
    Inext := OriginalRow227TriangleData2079.coefficient227_265, Icur := OriginalRow227TriangleData2079.coefficient227_264,
    output := OriginalRow227TriangleData2081.coefficient228_264, hC := OriginalRow227TriangleRoots07.root228_pos, hAC := OriginalRow227TriangleRoots07.product228_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots07.root228,
    Inext := OriginalRow227TriangleData2079.coefficient227_266, Icur := OriginalRow227TriangleData2079.coefficient227_265,
    output := OriginalRow227TriangleData2081.coefficient228_265, hC := OriginalRow227TriangleRoots07.root228_pos, hAC := OriginalRow227TriangleRoots07.product228_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots07.root228,
    Inext := OriginalRow227TriangleData2079.coefficient227_267, Icur := OriginalRow227TriangleData2079.coefficient227_266,
    output := OriginalRow227TriangleData2081.coefficient228_266, hC := OriginalRow227TriangleRoots07.root228_pos, hAC := OriginalRow227TriangleRoots07.product228_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots07.root228,
    Inext := OriginalRow227TriangleData2079.coefficient227_268, Icur := OriginalRow227TriangleData2079.coefficient227_267,
    output := OriginalRow227TriangleData2081.coefficient228_267, hC := OriginalRow227TriangleRoots07.root228_pos, hAC := OriginalRow227TriangleRoots07.product228_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots07.root228,
    Inext := OriginalRow227TriangleData2079.coefficient227_269, Icur := OriginalRow227TriangleData2079.coefficient227_268,
    output := OriginalRow227TriangleData2081.coefficient228_268, hC := OriginalRow227TriangleRoots07.root228_pos, hAC := OriginalRow227TriangleRoots07.product228_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots07.root228,
    Inext := OriginalRow227TriangleData2079.coefficient227_270, Icur := OriginalRow227TriangleData2079.coefficient227_269,
    output := OriginalRow227TriangleData2081.coefficient228_269, hC := OriginalRow227TriangleRoots07.root228_pos, hAC := OriginalRow227TriangleRoots07.product228_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots07.root228,
    Inext := OriginalRow227TriangleData2079.coefficient227_271, Icur := OriginalRow227TriangleData2079.coefficient227_270,
    output := OriginalRow227TriangleData2081.coefficient228_270, hC := OriginalRow227TriangleRoots07.root228_pos, hAC := OriginalRow227TriangleRoots07.product228_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots07.root228,
    Inext := OriginalRow227TriangleData2079.coefficient227_272, Icur := OriginalRow227TriangleData2079.coefficient227_271,
    output := OriginalRow227TriangleData2081.coefficient228_271, hC := OriginalRow227TriangleRoots07.root228_pos, hAC := OriginalRow227TriangleRoots07.product228_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots07.root228,
    Inext := OriginalRow227TriangleData2079.coefficient227_273, Icur := OriginalRow227TriangleData2079.coefficient227_272,
    output := OriginalRow227TriangleData2081.coefficient228_272, hC := OriginalRow227TriangleRoots07.root228_pos, hAC := OriginalRow227TriangleRoots07.product228_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots07.root228,
    Inext := OriginalRow227TriangleData2079.coefficient227_274, Icur := OriginalRow227TriangleData2079.coefficient227_273,
    output := OriginalRow227TriangleData2081.coefficient228_273, hC := OriginalRow227TriangleRoots07.root228_pos, hAC := OriginalRow227TriangleRoots07.product228_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2065

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2065.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

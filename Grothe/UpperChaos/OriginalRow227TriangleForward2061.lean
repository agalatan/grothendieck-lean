import Grothe.UpperChaos.OriginalRow227TriangleData2075
import Grothe.UpperChaos.OriginalRow227TriangleData2077
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2061
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_258, Icur := OriginalRow227TriangleData2075.coefficient225_257,
    output := OriginalRow227TriangleData2077.coefficient226_257, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_259, Icur := OriginalRow227TriangleData2075.coefficient225_258,
    output := OriginalRow227TriangleData2077.coefficient226_258, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_260, Icur := OriginalRow227TriangleData2075.coefficient225_259,
    output := OriginalRow227TriangleData2077.coefficient226_259, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_261, Icur := OriginalRow227TriangleData2075.coefficient225_260,
    output := OriginalRow227TriangleData2077.coefficient226_260, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_262, Icur := OriginalRow227TriangleData2075.coefficient225_261,
    output := OriginalRow227TriangleData2077.coefficient226_261, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_263, Icur := OriginalRow227TriangleData2075.coefficient225_262,
    output := OriginalRow227TriangleData2077.coefficient226_262, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_264, Icur := OriginalRow227TriangleData2075.coefficient225_263,
    output := OriginalRow227TriangleData2077.coefficient226_263, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_265, Icur := OriginalRow227TriangleData2075.coefficient225_264,
    output := OriginalRow227TriangleData2077.coefficient226_264, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_266, Icur := OriginalRow227TriangleData2075.coefficient225_265,
    output := OriginalRow227TriangleData2077.coefficient226_265, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_267, Icur := OriginalRow227TriangleData2075.coefficient225_266,
    output := OriginalRow227TriangleData2077.coefficient226_266, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_268, Icur := OriginalRow227TriangleData2075.coefficient225_267,
    output := OriginalRow227TriangleData2077.coefficient226_267, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_269, Icur := OriginalRow227TriangleData2075.coefficient225_268,
    output := OriginalRow227TriangleData2077.coefficient226_268, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_270, Icur := OriginalRow227TriangleData2075.coefficient225_269,
    output := OriginalRow227TriangleData2077.coefficient226_269, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_271, Icur := OriginalRow227TriangleData2075.coefficient225_270,
    output := OriginalRow227TriangleData2077.coefficient226_270, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_272, Icur := OriginalRow227TriangleData2075.coefficient225_271,
    output := OriginalRow227TriangleData2077.coefficient226_271, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_273, Icur := OriginalRow227TriangleData2075.coefficient225_272,
    output := OriginalRow227TriangleData2077.coefficient226_272, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_274, Icur := OriginalRow227TriangleData2075.coefficient225_273,
    output := OriginalRow227TriangleData2077.coefficient226_273, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_275, Icur := OriginalRow227TriangleData2075.coefficient225_274,
    output := OriginalRow227TriangleData2077.coefficient226_274, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots08.root276, IC := OriginalRow227TriangleRoots07.root226,
    Inext := OriginalRow227TriangleData2075.coefficient225_276, Icur := OriginalRow227TriangleData2075.coefficient225_275,
    output := OriginalRow227TriangleData2077.coefficient226_275, hC := OriginalRow227TriangleRoots07.root226_pos, hAC := OriginalRow227TriangleRoots07.product226_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2061

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2061.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

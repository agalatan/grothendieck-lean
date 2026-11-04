import Grothe.UpperChaos.OriginalRow227TriangleData1459
import Grothe.UpperChaos.OriginalRow227TriangleData1460
import Grothe.UpperChaos.OriginalRow227TriangleData1468
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1452
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_244, Icur := OriginalRow227TriangleData1459.coefficient115_243,
    output := OriginalRow227TriangleData1468.coefficient116_243, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_245, Icur := OriginalRow227TriangleData1459.coefficient115_244,
    output := OriginalRow227TriangleData1468.coefficient116_244, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_246, Icur := OriginalRow227TriangleData1459.coefficient115_245,
    output := OriginalRow227TriangleData1468.coefficient116_245, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_247, Icur := OriginalRow227TriangleData1459.coefficient115_246,
    output := OriginalRow227TriangleData1468.coefficient116_246, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_248, Icur := OriginalRow227TriangleData1459.coefficient115_247,
    output := OriginalRow227TriangleData1468.coefficient116_247, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_249, Icur := OriginalRow227TriangleData1459.coefficient115_248,
    output := OriginalRow227TriangleData1468.coefficient116_248, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_250, Icur := OriginalRow227TriangleData1459.coefficient115_249,
    output := OriginalRow227TriangleData1468.coefficient116_249, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_251, Icur := OriginalRow227TriangleData1459.coefficient115_250,
    output := OriginalRow227TriangleData1468.coefficient116_250, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_252, Icur := OriginalRow227TriangleData1459.coefficient115_251,
    output := OriginalRow227TriangleData1468.coefficient116_251, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_253, Icur := OriginalRow227TriangleData1459.coefficient115_252,
    output := OriginalRow227TriangleData1468.coefficient116_252, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_254, Icur := OriginalRow227TriangleData1459.coefficient115_253,
    output := OriginalRow227TriangleData1468.coefficient116_253, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_255, Icur := OriginalRow227TriangleData1459.coefficient115_254,
    output := OriginalRow227TriangleData1468.coefficient116_254, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_256, Icur := OriginalRow227TriangleData1459.coefficient115_255,
    output := OriginalRow227TriangleData1468.coefficient116_255, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_257, Icur := OriginalRow227TriangleData1459.coefficient115_256,
    output := OriginalRow227TriangleData1468.coefficient116_256, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_258, Icur := OriginalRow227TriangleData1459.coefficient115_257,
    output := OriginalRow227TriangleData1468.coefficient116_257, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_259, Icur := OriginalRow227TriangleData1459.coefficient115_258,
    output := OriginalRow227TriangleData1468.coefficient116_258, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_260, Icur := OriginalRow227TriangleData1459.coefficient115_259,
    output := OriginalRow227TriangleData1468.coefficient116_259, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_261, Icur := OriginalRow227TriangleData1459.coefficient115_260,
    output := OriginalRow227TriangleData1468.coefficient116_260, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_262, Icur := OriginalRow227TriangleData1459.coefficient115_261,
    output := OriginalRow227TriangleData1468.coefficient116_261, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_263, Icur := OriginalRow227TriangleData1459.coefficient115_262,
    output := OriginalRow227TriangleData1468.coefficient116_262, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_264, Icur := OriginalRow227TriangleData1459.coefficient115_263,
    output := OriginalRow227TriangleData1468.coefficient116_263, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_265, Icur := OriginalRow227TriangleData1459.coefficient115_264,
    output := OriginalRow227TriangleData1468.coefficient116_264, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_266, Icur := OriginalRow227TriangleData1459.coefficient115_265,
    output := OriginalRow227TriangleData1468.coefficient116_265, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_267, Icur := OriginalRow227TriangleData1459.coefficient115_266,
    output := OriginalRow227TriangleData1468.coefficient116_266, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_268, Icur := OriginalRow227TriangleData1459.coefficient115_267,
    output := OriginalRow227TriangleData1468.coefficient116_267, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_269, Icur := OriginalRow227TriangleData1459.coefficient115_268,
    output := OriginalRow227TriangleData1468.coefficient116_268, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_270, Icur := OriginalRow227TriangleData1459.coefficient115_269,
    output := OriginalRow227TriangleData1468.coefficient116_269, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots08.root271, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_271, Icur := OriginalRow227TriangleData1459.coefficient115_270,
    output := OriginalRow227TriangleData1468.coefficient116_270, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots08.root272, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_272, Icur := OriginalRow227TriangleData1459.coefficient115_271,
    output := OriginalRow227TriangleData1468.coefficient116_271, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots08.root273, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1459.coefficient115_273, Icur := OriginalRow227TriangleData1459.coefficient115_272,
    output := OriginalRow227TriangleData1468.coefficient116_272, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots08.root274, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1460.coefficient115_274, Icur := OriginalRow227TriangleData1459.coefficient115_273,
    output := OriginalRow227TriangleData1468.coefficient116_273, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots08.root275, IC := OriginalRow227TriangleRoots03.root116,
    Inext := OriginalRow227TriangleData1460.coefficient115_275, Icur := OriginalRow227TriangleData1460.coefficient115_274,
    output := OriginalRow227TriangleData1468.coefficient116_274, hC := OriginalRow227TriangleRoots03.root116_pos, hAC := OriginalRow227TriangleRoots03.product116_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1452

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1452.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

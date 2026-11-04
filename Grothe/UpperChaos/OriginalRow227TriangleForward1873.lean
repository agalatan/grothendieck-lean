import Grothe.UpperChaos.OriginalRow227TriangleData1884
import Grothe.UpperChaos.OriginalRow227TriangleData1885
import Grothe.UpperChaos.OriginalRow227TriangleData1889
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1873
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_239, Icur := OriginalRow227TriangleData1884.coefficient174_238,
    output := OriginalRow227TriangleData1889.coefficient175_238, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_240, Icur := OriginalRow227TriangleData1884.coefficient174_239,
    output := OriginalRow227TriangleData1889.coefficient175_239, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_241, Icur := OriginalRow227TriangleData1884.coefficient174_240,
    output := OriginalRow227TriangleData1889.coefficient175_240, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_242, Icur := OriginalRow227TriangleData1884.coefficient174_241,
    output := OriginalRow227TriangleData1889.coefficient175_241, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_243, Icur := OriginalRow227TriangleData1884.coefficient174_242,
    output := OriginalRow227TriangleData1889.coefficient175_242, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_244, Icur := OriginalRow227TriangleData1884.coefficient174_243,
    output := OriginalRow227TriangleData1889.coefficient175_243, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_245, Icur := OriginalRow227TriangleData1884.coefficient174_244,
    output := OriginalRow227TriangleData1889.coefficient175_244, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_246, Icur := OriginalRow227TriangleData1884.coefficient174_245,
    output := OriginalRow227TriangleData1889.coefficient175_245, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_247, Icur := OriginalRow227TriangleData1884.coefficient174_246,
    output := OriginalRow227TriangleData1889.coefficient175_246, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_248, Icur := OriginalRow227TriangleData1884.coefficient174_247,
    output := OriginalRow227TriangleData1889.coefficient175_247, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_249, Icur := OriginalRow227TriangleData1884.coefficient174_248,
    output := OriginalRow227TriangleData1889.coefficient175_248, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_250, Icur := OriginalRow227TriangleData1884.coefficient174_249,
    output := OriginalRow227TriangleData1889.coefficient175_249, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_251, Icur := OriginalRow227TriangleData1884.coefficient174_250,
    output := OriginalRow227TriangleData1889.coefficient175_250, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_252, Icur := OriginalRow227TriangleData1884.coefficient174_251,
    output := OriginalRow227TriangleData1889.coefficient175_251, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_253, Icur := OriginalRow227TriangleData1884.coefficient174_252,
    output := OriginalRow227TriangleData1889.coefficient175_252, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_254, Icur := OriginalRow227TriangleData1884.coefficient174_253,
    output := OriginalRow227TriangleData1889.coefficient175_253, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_255, Icur := OriginalRow227TriangleData1884.coefficient174_254,
    output := OriginalRow227TriangleData1889.coefficient175_254, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_256, Icur := OriginalRow227TriangleData1884.coefficient174_255,
    output := OriginalRow227TriangleData1889.coefficient175_255, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_257, Icur := OriginalRow227TriangleData1884.coefficient174_256,
    output := OriginalRow227TriangleData1889.coefficient175_256, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_258, Icur := OriginalRow227TriangleData1884.coefficient174_257,
    output := OriginalRow227TriangleData1889.coefficient175_257, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_259, Icur := OriginalRow227TriangleData1884.coefficient174_258,
    output := OriginalRow227TriangleData1889.coefficient175_258, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_260, Icur := OriginalRow227TriangleData1884.coefficient174_259,
    output := OriginalRow227TriangleData1889.coefficient175_259, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots08.root261, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_261, Icur := OriginalRow227TriangleData1884.coefficient174_260,
    output := OriginalRow227TriangleData1889.coefficient175_260, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots08.root262, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_262, Icur := OriginalRow227TriangleData1884.coefficient174_261,
    output := OriginalRow227TriangleData1889.coefficient175_261, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots08.root263, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_263, Icur := OriginalRow227TriangleData1884.coefficient174_262,
    output := OriginalRow227TriangleData1889.coefficient175_262, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots08.root264, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_264, Icur := OriginalRow227TriangleData1884.coefficient174_263,
    output := OriginalRow227TriangleData1889.coefficient175_263, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots08.root265, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_265, Icur := OriginalRow227TriangleData1884.coefficient174_264,
    output := OriginalRow227TriangleData1889.coefficient175_264, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots08.root266, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_266, Icur := OriginalRow227TriangleData1884.coefficient174_265,
    output := OriginalRow227TriangleData1889.coefficient175_265, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots08.root267, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_267, Icur := OriginalRow227TriangleData1884.coefficient174_266,
    output := OriginalRow227TriangleData1889.coefficient175_266, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots08.root268, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1884.coefficient174_268, Icur := OriginalRow227TriangleData1884.coefficient174_267,
    output := OriginalRow227TriangleData1889.coefficient175_267, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots08.root269, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1885.coefficient174_269, Icur := OriginalRow227TriangleData1884.coefficient174_268,
    output := OriginalRow227TriangleData1889.coefficient175_268, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots08.root270, IC := OriginalRow227TriangleRoots05.root175,
    Inext := OriginalRow227TriangleData1885.coefficient174_270, Icur := OriginalRow227TriangleData1885.coefficient174_269,
    output := OriginalRow227TriangleData1889.coefficient175_269, hC := OriginalRow227TriangleRoots05.root175_pos, hAC := OriginalRow227TriangleRoots05.product175_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1873

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1873.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

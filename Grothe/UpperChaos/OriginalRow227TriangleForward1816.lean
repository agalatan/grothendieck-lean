import Grothe.UpperChaos.OriginalRow227TriangleData1826
import Grothe.UpperChaos.OriginalRow227TriangleData1827
import Grothe.UpperChaos.OriginalRow227TriangleData1832
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1816
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_229, Icur := OriginalRow227TriangleData1826.coefficient164_228,
    output := OriginalRow227TriangleData1832.coefficient165_228, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_230, Icur := OriginalRow227TriangleData1826.coefficient164_229,
    output := OriginalRow227TriangleData1832.coefficient165_229, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_231, Icur := OriginalRow227TriangleData1826.coefficient164_230,
    output := OriginalRow227TriangleData1832.coefficient165_230, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_232, Icur := OriginalRow227TriangleData1826.coefficient164_231,
    output := OriginalRow227TriangleData1832.coefficient165_231, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_233, Icur := OriginalRow227TriangleData1826.coefficient164_232,
    output := OriginalRow227TriangleData1832.coefficient165_232, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_234, Icur := OriginalRow227TriangleData1826.coefficient164_233,
    output := OriginalRow227TriangleData1832.coefficient165_233, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_235, Icur := OriginalRow227TriangleData1826.coefficient164_234,
    output := OriginalRow227TriangleData1832.coefficient165_234, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_236, Icur := OriginalRow227TriangleData1826.coefficient164_235,
    output := OriginalRow227TriangleData1832.coefficient165_235, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_237, Icur := OriginalRow227TriangleData1826.coefficient164_236,
    output := OriginalRow227TriangleData1832.coefficient165_236, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_238, Icur := OriginalRow227TriangleData1826.coefficient164_237,
    output := OriginalRow227TriangleData1832.coefficient165_237, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_239, Icur := OriginalRow227TriangleData1826.coefficient164_238,
    output := OriginalRow227TriangleData1832.coefficient165_238, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_240, Icur := OriginalRow227TriangleData1826.coefficient164_239,
    output := OriginalRow227TriangleData1832.coefficient165_239, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_241, Icur := OriginalRow227TriangleData1826.coefficient164_240,
    output := OriginalRow227TriangleData1832.coefficient165_240, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_242, Icur := OriginalRow227TriangleData1826.coefficient164_241,
    output := OriginalRow227TriangleData1832.coefficient165_241, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_243, Icur := OriginalRow227TriangleData1826.coefficient164_242,
    output := OriginalRow227TriangleData1832.coefficient165_242, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_244, Icur := OriginalRow227TriangleData1826.coefficient164_243,
    output := OriginalRow227TriangleData1832.coefficient165_243, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_245, Icur := OriginalRow227TriangleData1826.coefficient164_244,
    output := OriginalRow227TriangleData1832.coefficient165_244, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_246, Icur := OriginalRow227TriangleData1826.coefficient164_245,
    output := OriginalRow227TriangleData1832.coefficient165_245, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_247, Icur := OriginalRow227TriangleData1826.coefficient164_246,
    output := OriginalRow227TriangleData1832.coefficient165_246, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_248, Icur := OriginalRow227TriangleData1826.coefficient164_247,
    output := OriginalRow227TriangleData1832.coefficient165_247, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_249, Icur := OriginalRow227TriangleData1826.coefficient164_248,
    output := OriginalRow227TriangleData1832.coefficient165_248, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_250, Icur := OriginalRow227TriangleData1826.coefficient164_249,
    output := OriginalRow227TriangleData1832.coefficient165_249, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_251, Icur := OriginalRow227TriangleData1826.coefficient164_250,
    output := OriginalRow227TriangleData1832.coefficient165_250, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_252, Icur := OriginalRow227TriangleData1826.coefficient164_251,
    output := OriginalRow227TriangleData1832.coefficient165_251, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_253, Icur := OriginalRow227TriangleData1826.coefficient164_252,
    output := OriginalRow227TriangleData1832.coefficient165_252, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_254, Icur := OriginalRow227TriangleData1826.coefficient164_253,
    output := OriginalRow227TriangleData1832.coefficient165_253, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_255, Icur := OriginalRow227TriangleData1826.coefficient164_254,
    output := OriginalRow227TriangleData1832.coefficient165_254, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_256, Icur := OriginalRow227TriangleData1826.coefficient164_255,
    output := OriginalRow227TriangleData1832.coefficient165_255, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_257, Icur := OriginalRow227TriangleData1826.coefficient164_256,
    output := OriginalRow227TriangleData1832.coefficient165_256, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1826.coefficient164_258, Icur := OriginalRow227TriangleData1826.coefficient164_257,
    output := OriginalRow227TriangleData1832.coefficient165_257, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1827.coefficient164_259, Icur := OriginalRow227TriangleData1826.coefficient164_258,
    output := OriginalRow227TriangleData1832.coefficient165_258, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots08.root260, IC := OriginalRow227TriangleRoots05.root165,
    Inext := OriginalRow227TriangleData1827.coefficient164_260, Icur := OriginalRow227TriangleData1827.coefficient164_259,
    output := OriginalRow227TriangleData1832.coefficient165_259, hC := OriginalRow227TriangleRoots05.root165_pos, hAC := OriginalRow227TriangleRoots05.product165_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1816

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1816.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData0055
import Grothe.UpperChaos.OriginalRow227TriangleData0056
import Grothe.UpperChaos.OriginalRow227TriangleData0071
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0055
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_228, Icur := OriginalRow227TriangleData0055.coefficient3_227,
    output := OriginalRow227TriangleData0071.coefficient4_227, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_229, Icur := OriginalRow227TriangleData0055.coefficient3_228,
    output := OriginalRow227TriangleData0071.coefficient4_228, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_230, Icur := OriginalRow227TriangleData0055.coefficient3_229,
    output := OriginalRow227TriangleData0071.coefficient4_229, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_231, Icur := OriginalRow227TriangleData0055.coefficient3_230,
    output := OriginalRow227TriangleData0071.coefficient4_230, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_232, Icur := OriginalRow227TriangleData0055.coefficient3_231,
    output := OriginalRow227TriangleData0071.coefficient4_231, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_233, Icur := OriginalRow227TriangleData0055.coefficient3_232,
    output := OriginalRow227TriangleData0071.coefficient4_232, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_234, Icur := OriginalRow227TriangleData0055.coefficient3_233,
    output := OriginalRow227TriangleData0071.coefficient4_233, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_235, Icur := OriginalRow227TriangleData0055.coefficient3_234,
    output := OriginalRow227TriangleData0071.coefficient4_234, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_236, Icur := OriginalRow227TriangleData0055.coefficient3_235,
    output := OriginalRow227TriangleData0071.coefficient4_235, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_237, Icur := OriginalRow227TriangleData0055.coefficient3_236,
    output := OriginalRow227TriangleData0071.coefficient4_236, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_238, Icur := OriginalRow227TriangleData0055.coefficient3_237,
    output := OriginalRow227TriangleData0071.coefficient4_237, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_239, Icur := OriginalRow227TriangleData0055.coefficient3_238,
    output := OriginalRow227TriangleData0071.coefficient4_238, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_240, Icur := OriginalRow227TriangleData0055.coefficient3_239,
    output := OriginalRow227TriangleData0071.coefficient4_239, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_241, Icur := OriginalRow227TriangleData0055.coefficient3_240,
    output := OriginalRow227TriangleData0071.coefficient4_240, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_242, Icur := OriginalRow227TriangleData0055.coefficient3_241,
    output := OriginalRow227TriangleData0071.coefficient4_241, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_243, Icur := OriginalRow227TriangleData0055.coefficient3_242,
    output := OriginalRow227TriangleData0071.coefficient4_242, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_244, Icur := OriginalRow227TriangleData0055.coefficient3_243,
    output := OriginalRow227TriangleData0071.coefficient4_243, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_245, Icur := OriginalRow227TriangleData0055.coefficient3_244,
    output := OriginalRow227TriangleData0071.coefficient4_244, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_246, Icur := OriginalRow227TriangleData0055.coefficient3_245,
    output := OriginalRow227TriangleData0071.coefficient4_245, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_247, Icur := OriginalRow227TriangleData0055.coefficient3_246,
    output := OriginalRow227TriangleData0071.coefficient4_246, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_248, Icur := OriginalRow227TriangleData0055.coefficient3_247,
    output := OriginalRow227TriangleData0071.coefficient4_247, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_249, Icur := OriginalRow227TriangleData0055.coefficient3_248,
    output := OriginalRow227TriangleData0071.coefficient4_248, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_250, Icur := OriginalRow227TriangleData0055.coefficient3_249,
    output := OriginalRow227TriangleData0071.coefficient4_249, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_251, Icur := OriginalRow227TriangleData0055.coefficient3_250,
    output := OriginalRow227TriangleData0071.coefficient4_250, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_252, Icur := OriginalRow227TriangleData0055.coefficient3_251,
    output := OriginalRow227TriangleData0071.coefficient4_251, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_253, Icur := OriginalRow227TriangleData0055.coefficient3_252,
    output := OriginalRow227TriangleData0071.coefficient4_252, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_254, Icur := OriginalRow227TriangleData0055.coefficient3_253,
    output := OriginalRow227TriangleData0071.coefficient4_253, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_255, Icur := OriginalRow227TriangleData0055.coefficient3_254,
    output := OriginalRow227TriangleData0071.coefficient4_254, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_256, Icur := OriginalRow227TriangleData0055.coefficient3_255,
    output := OriginalRow227TriangleData0071.coefficient4_255, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0055.coefficient3_257, Icur := OriginalRow227TriangleData0055.coefficient3_256,
    output := OriginalRow227TriangleData0071.coefficient4_256, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0056.coefficient3_258, Icur := OriginalRow227TriangleData0055.coefficient3_257,
    output := OriginalRow227TriangleData0071.coefficient4_257, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0056.coefficient3_259, Icur := OriginalRow227TriangleData0056.coefficient3_258,
    output := OriginalRow227TriangleData0071.coefficient4_258, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0055

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0055.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

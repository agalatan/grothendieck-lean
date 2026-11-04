import Grothe.UpperChaos.OriginalRow227TriangleData0953
import Grothe.UpperChaos.OriginalRow227TriangleData0954
import Grothe.UpperChaos.OriginalRow227TriangleData0965
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0949
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_228, Icur := OriginalRow227TriangleData0953.coefficient67_227,
    output := OriginalRow227TriangleData0965.coefficient68_227, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_229, Icur := OriginalRow227TriangleData0953.coefficient67_228,
    output := OriginalRow227TriangleData0965.coefficient68_228, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_230, Icur := OriginalRow227TriangleData0953.coefficient67_229,
    output := OriginalRow227TriangleData0965.coefficient68_229, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_231, Icur := OriginalRow227TriangleData0953.coefficient67_230,
    output := OriginalRow227TriangleData0965.coefficient68_230, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_232, Icur := OriginalRow227TriangleData0953.coefficient67_231,
    output := OriginalRow227TriangleData0965.coefficient68_231, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_233, Icur := OriginalRow227TriangleData0953.coefficient67_232,
    output := OriginalRow227TriangleData0965.coefficient68_232, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_234, Icur := OriginalRow227TriangleData0953.coefficient67_233,
    output := OriginalRow227TriangleData0965.coefficient68_233, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_235, Icur := OriginalRow227TriangleData0953.coefficient67_234,
    output := OriginalRow227TriangleData0965.coefficient68_234, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_236, Icur := OriginalRow227TriangleData0953.coefficient67_235,
    output := OriginalRow227TriangleData0965.coefficient68_235, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_237, Icur := OriginalRow227TriangleData0953.coefficient67_236,
    output := OriginalRow227TriangleData0965.coefficient68_236, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_238, Icur := OriginalRow227TriangleData0953.coefficient67_237,
    output := OriginalRow227TriangleData0965.coefficient68_237, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_239, Icur := OriginalRow227TriangleData0953.coefficient67_238,
    output := OriginalRow227TriangleData0965.coefficient68_238, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_240, Icur := OriginalRow227TriangleData0953.coefficient67_239,
    output := OriginalRow227TriangleData0965.coefficient68_239, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_241, Icur := OriginalRow227TriangleData0953.coefficient67_240,
    output := OriginalRow227TriangleData0965.coefficient68_240, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_242, Icur := OriginalRow227TriangleData0953.coefficient67_241,
    output := OriginalRow227TriangleData0965.coefficient68_241, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_243, Icur := OriginalRow227TriangleData0953.coefficient67_242,
    output := OriginalRow227TriangleData0965.coefficient68_242, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_244, Icur := OriginalRow227TriangleData0953.coefficient67_243,
    output := OriginalRow227TriangleData0965.coefficient68_243, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_245, Icur := OriginalRow227TriangleData0953.coefficient67_244,
    output := OriginalRow227TriangleData0965.coefficient68_244, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_246, Icur := OriginalRow227TriangleData0953.coefficient67_245,
    output := OriginalRow227TriangleData0965.coefficient68_245, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_247, Icur := OriginalRow227TriangleData0953.coefficient67_246,
    output := OriginalRow227TriangleData0965.coefficient68_246, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_248, Icur := OriginalRow227TriangleData0953.coefficient67_247,
    output := OriginalRow227TriangleData0965.coefficient68_247, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_249, Icur := OriginalRow227TriangleData0953.coefficient67_248,
    output := OriginalRow227TriangleData0965.coefficient68_248, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_250, Icur := OriginalRow227TriangleData0953.coefficient67_249,
    output := OriginalRow227TriangleData0965.coefficient68_249, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_251, Icur := OriginalRow227TriangleData0953.coefficient67_250,
    output := OriginalRow227TriangleData0965.coefficient68_250, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_252, Icur := OriginalRow227TriangleData0953.coefficient67_251,
    output := OriginalRow227TriangleData0965.coefficient68_251, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_253, Icur := OriginalRow227TriangleData0953.coefficient67_252,
    output := OriginalRow227TriangleData0965.coefficient68_252, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_254, Icur := OriginalRow227TriangleData0953.coefficient67_253,
    output := OriginalRow227TriangleData0965.coefficient68_253, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots07.root255, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_255, Icur := OriginalRow227TriangleData0953.coefficient67_254,
    output := OriginalRow227TriangleData0965.coefficient68_254, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots07.root256, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_256, Icur := OriginalRow227TriangleData0953.coefficient67_255,
    output := OriginalRow227TriangleData0965.coefficient68_255, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots08.root257, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0953.coefficient67_257, Icur := OriginalRow227TriangleData0953.coefficient67_256,
    output := OriginalRow227TriangleData0965.coefficient68_256, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots08.root258, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0954.coefficient67_258, Icur := OriginalRow227TriangleData0953.coefficient67_257,
    output := OriginalRow227TriangleData0965.coefficient68_257, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots08.root259, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0954.coefficient67_259, Icur := OriginalRow227TriangleData0954.coefficient67_258,
    output := OriginalRow227TriangleData0965.coefficient68_258, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0949

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0949.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

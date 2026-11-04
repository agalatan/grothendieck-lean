import Grothe.UpperChaos.OriginalRow227TriangleData0881
import Grothe.UpperChaos.OriginalRow227TriangleData0882
import Grothe.UpperChaos.OriginalRow227TriangleData0893
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0877
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_222, Icur := OriginalRow227TriangleData0881.coefficient61_221,
    output := OriginalRow227TriangleData0893.coefficient62_221, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_223, Icur := OriginalRow227TriangleData0881.coefficient61_222,
    output := OriginalRow227TriangleData0893.coefficient62_222, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_224, Icur := OriginalRow227TriangleData0881.coefficient61_223,
    output := OriginalRow227TriangleData0893.coefficient62_223, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_225, Icur := OriginalRow227TriangleData0881.coefficient61_224,
    output := OriginalRow227TriangleData0893.coefficient62_224, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_226, Icur := OriginalRow227TriangleData0881.coefficient61_225,
    output := OriginalRow227TriangleData0893.coefficient62_225, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_227, Icur := OriginalRow227TriangleData0881.coefficient61_226,
    output := OriginalRow227TriangleData0893.coefficient62_226, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_228, Icur := OriginalRow227TriangleData0881.coefficient61_227,
    output := OriginalRow227TriangleData0893.coefficient62_227, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_229, Icur := OriginalRow227TriangleData0881.coefficient61_228,
    output := OriginalRow227TriangleData0893.coefficient62_228, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_230, Icur := OriginalRow227TriangleData0881.coefficient61_229,
    output := OriginalRow227TriangleData0893.coefficient62_229, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_231, Icur := OriginalRow227TriangleData0881.coefficient61_230,
    output := OriginalRow227TriangleData0893.coefficient62_230, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_232, Icur := OriginalRow227TriangleData0881.coefficient61_231,
    output := OriginalRow227TriangleData0893.coefficient62_231, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_233, Icur := OriginalRow227TriangleData0881.coefficient61_232,
    output := OriginalRow227TriangleData0893.coefficient62_232, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_234, Icur := OriginalRow227TriangleData0881.coefficient61_233,
    output := OriginalRow227TriangleData0893.coefficient62_233, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_235, Icur := OriginalRow227TriangleData0881.coefficient61_234,
    output := OriginalRow227TriangleData0893.coefficient62_234, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_236, Icur := OriginalRow227TriangleData0881.coefficient61_235,
    output := OriginalRow227TriangleData0893.coefficient62_235, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_237, Icur := OriginalRow227TriangleData0881.coefficient61_236,
    output := OriginalRow227TriangleData0893.coefficient62_236, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_238, Icur := OriginalRow227TriangleData0881.coefficient61_237,
    output := OriginalRow227TriangleData0893.coefficient62_237, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_239, Icur := OriginalRow227TriangleData0881.coefficient61_238,
    output := OriginalRow227TriangleData0893.coefficient62_238, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_240, Icur := OriginalRow227TriangleData0881.coefficient61_239,
    output := OriginalRow227TriangleData0893.coefficient62_239, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_241, Icur := OriginalRow227TriangleData0881.coefficient61_240,
    output := OriginalRow227TriangleData0893.coefficient62_240, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_242, Icur := OriginalRow227TriangleData0881.coefficient61_241,
    output := OriginalRow227TriangleData0893.coefficient62_241, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_243, Icur := OriginalRow227TriangleData0881.coefficient61_242,
    output := OriginalRow227TriangleData0893.coefficient62_242, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_244, Icur := OriginalRow227TriangleData0881.coefficient61_243,
    output := OriginalRow227TriangleData0893.coefficient62_243, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_245, Icur := OriginalRow227TriangleData0881.coefficient61_244,
    output := OriginalRow227TriangleData0893.coefficient62_244, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_246, Icur := OriginalRow227TriangleData0881.coefficient61_245,
    output := OriginalRow227TriangleData0893.coefficient62_245, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_247, Icur := OriginalRow227TriangleData0881.coefficient61_246,
    output := OriginalRow227TriangleData0893.coefficient62_246, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_248, Icur := OriginalRow227TriangleData0881.coefficient61_247,
    output := OriginalRow227TriangleData0893.coefficient62_247, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_249, Icur := OriginalRow227TriangleData0881.coefficient61_248,
    output := OriginalRow227TriangleData0893.coefficient62_248, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_250, Icur := OriginalRow227TriangleData0881.coefficient61_249,
    output := OriginalRow227TriangleData0893.coefficient62_249, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0881.coefficient61_251, Icur := OriginalRow227TriangleData0881.coefficient61_250,
    output := OriginalRow227TriangleData0893.coefficient62_250, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_252, Icur := OriginalRow227TriangleData0881.coefficient61_251,
    output := OriginalRow227TriangleData0893.coefficient62_251, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots01.root62,
    Inext := OriginalRow227TriangleData0882.coefficient61_253, Icur := OriginalRow227TriangleData0882.coefficient61_252,
    output := OriginalRow227TriangleData0893.coefficient62_252, hC := OriginalRow227TriangleRoots01.root62_pos, hAC := OriginalRow227TriangleRoots01.product62_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0877

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0877.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

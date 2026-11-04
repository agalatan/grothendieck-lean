import Grothe.UpperChaos.OriginalRow227TriangleData0893
import Grothe.UpperChaos.OriginalRow227TriangleData0894
import Grothe.UpperChaos.OriginalRow227TriangleData0905
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0889
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_223, Icur := OriginalRow227TriangleData0893.coefficient62_222,
    output := OriginalRow227TriangleData0905.coefficient63_222, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_224, Icur := OriginalRow227TriangleData0893.coefficient62_223,
    output := OriginalRow227TriangleData0905.coefficient63_223, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_225, Icur := OriginalRow227TriangleData0893.coefficient62_224,
    output := OriginalRow227TriangleData0905.coefficient63_224, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_226, Icur := OriginalRow227TriangleData0893.coefficient62_225,
    output := OriginalRow227TriangleData0905.coefficient63_225, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_227, Icur := OriginalRow227TriangleData0893.coefficient62_226,
    output := OriginalRow227TriangleData0905.coefficient63_226, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_228, Icur := OriginalRow227TriangleData0893.coefficient62_227,
    output := OriginalRow227TriangleData0905.coefficient63_227, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_229, Icur := OriginalRow227TriangleData0893.coefficient62_228,
    output := OriginalRow227TriangleData0905.coefficient63_228, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_230, Icur := OriginalRow227TriangleData0893.coefficient62_229,
    output := OriginalRow227TriangleData0905.coefficient63_229, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_231, Icur := OriginalRow227TriangleData0893.coefficient62_230,
    output := OriginalRow227TriangleData0905.coefficient63_230, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_232, Icur := OriginalRow227TriangleData0893.coefficient62_231,
    output := OriginalRow227TriangleData0905.coefficient63_231, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_233, Icur := OriginalRow227TriangleData0893.coefficient62_232,
    output := OriginalRow227TriangleData0905.coefficient63_232, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_234, Icur := OriginalRow227TriangleData0893.coefficient62_233,
    output := OriginalRow227TriangleData0905.coefficient63_233, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_235, Icur := OriginalRow227TriangleData0893.coefficient62_234,
    output := OriginalRow227TriangleData0905.coefficient63_234, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_236, Icur := OriginalRow227TriangleData0893.coefficient62_235,
    output := OriginalRow227TriangleData0905.coefficient63_235, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_237, Icur := OriginalRow227TriangleData0893.coefficient62_236,
    output := OriginalRow227TriangleData0905.coefficient63_236, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_238, Icur := OriginalRow227TriangleData0893.coefficient62_237,
    output := OriginalRow227TriangleData0905.coefficient63_237, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_239, Icur := OriginalRow227TriangleData0893.coefficient62_238,
    output := OriginalRow227TriangleData0905.coefficient63_238, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_240, Icur := OriginalRow227TriangleData0893.coefficient62_239,
    output := OriginalRow227TriangleData0905.coefficient63_239, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_241, Icur := OriginalRow227TriangleData0893.coefficient62_240,
    output := OriginalRow227TriangleData0905.coefficient63_240, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_242, Icur := OriginalRow227TriangleData0893.coefficient62_241,
    output := OriginalRow227TriangleData0905.coefficient63_241, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_243, Icur := OriginalRow227TriangleData0893.coefficient62_242,
    output := OriginalRow227TriangleData0905.coefficient63_242, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_244, Icur := OriginalRow227TriangleData0893.coefficient62_243,
    output := OriginalRow227TriangleData0905.coefficient63_243, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_245, Icur := OriginalRow227TriangleData0893.coefficient62_244,
    output := OriginalRow227TriangleData0905.coefficient63_244, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_246, Icur := OriginalRow227TriangleData0893.coefficient62_245,
    output := OriginalRow227TriangleData0905.coefficient63_245, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_247, Icur := OriginalRow227TriangleData0893.coefficient62_246,
    output := OriginalRow227TriangleData0905.coefficient63_246, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_248, Icur := OriginalRow227TriangleData0893.coefficient62_247,
    output := OriginalRow227TriangleData0905.coefficient63_247, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots07.root249, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_249, Icur := OriginalRow227TriangleData0893.coefficient62_248,
    output := OriginalRow227TriangleData0905.coefficient63_248, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots07.root250, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_250, Icur := OriginalRow227TriangleData0893.coefficient62_249,
    output := OriginalRow227TriangleData0905.coefficient63_249, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots07.root251, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_251, Icur := OriginalRow227TriangleData0893.coefficient62_250,
    output := OriginalRow227TriangleData0905.coefficient63_250, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots07.root252, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0893.coefficient62_252, Icur := OriginalRow227TriangleData0893.coefficient62_251,
    output := OriginalRow227TriangleData0905.coefficient63_251, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots07.root253, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0894.coefficient62_253, Icur := OriginalRow227TriangleData0893.coefficient62_252,
    output := OriginalRow227TriangleData0905.coefficient63_252, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots07.root254, IC := OriginalRow227TriangleRoots01.root63,
    Inext := OriginalRow227TriangleData0894.coefficient62_254, Icur := OriginalRow227TriangleData0894.coefficient62_253,
    output := OriginalRow227TriangleData0905.coefficient63_253, hC := OriginalRow227TriangleRoots01.root63_pos, hAC := OriginalRow227TriangleRoots01.product63_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0889

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0889.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

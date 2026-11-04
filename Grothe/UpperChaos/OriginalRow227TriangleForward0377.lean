import Grothe.UpperChaos.OriginalRow227TriangleData0378
import Grothe.UpperChaos.OriginalRow227TriangleData0379
import Grothe.UpperChaos.OriginalRow227TriangleData0393
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0377
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_217, Icur := OriginalRow227TriangleData0378.coefficient24_216,
    output := OriginalRow227TriangleData0393.coefficient25_216, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_218, Icur := OriginalRow227TriangleData0378.coefficient24_217,
    output := OriginalRow227TriangleData0393.coefficient25_217, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_219, Icur := OriginalRow227TriangleData0378.coefficient24_218,
    output := OriginalRow227TriangleData0393.coefficient25_218, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_220, Icur := OriginalRow227TriangleData0378.coefficient24_219,
    output := OriginalRow227TriangleData0393.coefficient25_219, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_221, Icur := OriginalRow227TriangleData0378.coefficient24_220,
    output := OriginalRow227TriangleData0393.coefficient25_220, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_222, Icur := OriginalRow227TriangleData0378.coefficient24_221,
    output := OriginalRow227TriangleData0393.coefficient25_221, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_223, Icur := OriginalRow227TriangleData0378.coefficient24_222,
    output := OriginalRow227TriangleData0393.coefficient25_222, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_224, Icur := OriginalRow227TriangleData0378.coefficient24_223,
    output := OriginalRow227TriangleData0393.coefficient25_223, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_225, Icur := OriginalRow227TriangleData0378.coefficient24_224,
    output := OriginalRow227TriangleData0393.coefficient25_224, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_226, Icur := OriginalRow227TriangleData0378.coefficient24_225,
    output := OriginalRow227TriangleData0393.coefficient25_225, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_227, Icur := OriginalRow227TriangleData0378.coefficient24_226,
    output := OriginalRow227TriangleData0393.coefficient25_226, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_228, Icur := OriginalRow227TriangleData0378.coefficient24_227,
    output := OriginalRow227TriangleData0393.coefficient25_227, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_229, Icur := OriginalRow227TriangleData0378.coefficient24_228,
    output := OriginalRow227TriangleData0393.coefficient25_228, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_230, Icur := OriginalRow227TriangleData0378.coefficient24_229,
    output := OriginalRow227TriangleData0393.coefficient25_229, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_231, Icur := OriginalRow227TriangleData0378.coefficient24_230,
    output := OriginalRow227TriangleData0393.coefficient25_230, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_232, Icur := OriginalRow227TriangleData0378.coefficient24_231,
    output := OriginalRow227TriangleData0393.coefficient25_231, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_233, Icur := OriginalRow227TriangleData0378.coefficient24_232,
    output := OriginalRow227TriangleData0393.coefficient25_232, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_234, Icur := OriginalRow227TriangleData0378.coefficient24_233,
    output := OriginalRow227TriangleData0393.coefficient25_233, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_235, Icur := OriginalRow227TriangleData0378.coefficient24_234,
    output := OriginalRow227TriangleData0393.coefficient25_234, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_236, Icur := OriginalRow227TriangleData0378.coefficient24_235,
    output := OriginalRow227TriangleData0393.coefficient25_235, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_237, Icur := OriginalRow227TriangleData0378.coefficient24_236,
    output := OriginalRow227TriangleData0393.coefficient25_236, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_238, Icur := OriginalRow227TriangleData0378.coefficient24_237,
    output := OriginalRow227TriangleData0393.coefficient25_237, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_239, Icur := OriginalRow227TriangleData0378.coefficient24_238,
    output := OriginalRow227TriangleData0393.coefficient25_238, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_240, Icur := OriginalRow227TriangleData0378.coefficient24_239,
    output := OriginalRow227TriangleData0393.coefficient25_239, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_241, Icur := OriginalRow227TriangleData0378.coefficient24_240,
    output := OriginalRow227TriangleData0393.coefficient25_240, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_242, Icur := OriginalRow227TriangleData0378.coefficient24_241,
    output := OriginalRow227TriangleData0393.coefficient25_241, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_243, Icur := OriginalRow227TriangleData0378.coefficient24_242,
    output := OriginalRow227TriangleData0393.coefficient25_242, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_244, Icur := OriginalRow227TriangleData0378.coefficient24_243,
    output := OriginalRow227TriangleData0393.coefficient25_243, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots07.root245, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_245, Icur := OriginalRow227TriangleData0378.coefficient24_244,
    output := OriginalRow227TriangleData0393.coefficient25_244, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots07.root246, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0378.coefficient24_246, Icur := OriginalRow227TriangleData0378.coefficient24_245,
    output := OriginalRow227TriangleData0393.coefficient25_245, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots07.root247, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0379.coefficient24_247, Icur := OriginalRow227TriangleData0378.coefficient24_246,
    output := OriginalRow227TriangleData0393.coefficient25_246, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots07.root248, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0379.coefficient24_248, Icur := OriginalRow227TriangleData0379.coefficient24_247,
    output := OriginalRow227TriangleData0393.coefficient25_247, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0377

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0377.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

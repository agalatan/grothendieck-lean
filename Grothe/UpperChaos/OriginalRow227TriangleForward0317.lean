import Grothe.UpperChaos.OriginalRow227TriangleData0318
import Grothe.UpperChaos.OriginalRow227TriangleData0319
import Grothe.UpperChaos.OriginalRow227TriangleData0333
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0317
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 193, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_213, Icur := OriginalRow227TriangleData0318.coefficient20_212,
    output := OriginalRow227TriangleData0333.coefficient21_212, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 194, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_214, Icur := OriginalRow227TriangleData0318.coefficient20_213,
    output := OriginalRow227TriangleData0333.coefficient21_213, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 195, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_215, Icur := OriginalRow227TriangleData0318.coefficient20_214,
    output := OriginalRow227TriangleData0333.coefficient21_214, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 196, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_216, Icur := OriginalRow227TriangleData0318.coefficient20_215,
    output := OriginalRow227TriangleData0333.coefficient21_215, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 197, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_217, Icur := OriginalRow227TriangleData0318.coefficient20_216,
    output := OriginalRow227TriangleData0333.coefficient21_216, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 198, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_218, Icur := OriginalRow227TriangleData0318.coefficient20_217,
    output := OriginalRow227TriangleData0333.coefficient21_217, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 199, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_219, Icur := OriginalRow227TriangleData0318.coefficient20_218,
    output := OriginalRow227TriangleData0333.coefficient21_218, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 200, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_220, Icur := OriginalRow227TriangleData0318.coefficient20_219,
    output := OriginalRow227TriangleData0333.coefficient21_219, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 201, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_221, Icur := OriginalRow227TriangleData0318.coefficient20_220,
    output := OriginalRow227TriangleData0333.coefficient21_220, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 202, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_222, Icur := OriginalRow227TriangleData0318.coefficient20_221,
    output := OriginalRow227TriangleData0333.coefficient21_221, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 203, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_223, Icur := OriginalRow227TriangleData0318.coefficient20_222,
    output := OriginalRow227TriangleData0333.coefficient21_222, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 204, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_224, Icur := OriginalRow227TriangleData0318.coefficient20_223,
    output := OriginalRow227TriangleData0333.coefficient21_223, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 205, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_225, Icur := OriginalRow227TriangleData0318.coefficient20_224,
    output := OriginalRow227TriangleData0333.coefficient21_224, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 206, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_226, Icur := OriginalRow227TriangleData0318.coefficient20_225,
    output := OriginalRow227TriangleData0333.coefficient21_225, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 207, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_227, Icur := OriginalRow227TriangleData0318.coefficient20_226,
    output := OriginalRow227TriangleData0333.coefficient21_226, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 208, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_228, Icur := OriginalRow227TriangleData0318.coefficient20_227,
    output := OriginalRow227TriangleData0333.coefficient21_227, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 209, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_229, Icur := OriginalRow227TriangleData0318.coefficient20_228,
    output := OriginalRow227TriangleData0333.coefficient21_228, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 210, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_230, Icur := OriginalRow227TriangleData0318.coefficient20_229,
    output := OriginalRow227TriangleData0333.coefficient21_229, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 211, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_231, Icur := OriginalRow227TriangleData0318.coefficient20_230,
    output := OriginalRow227TriangleData0333.coefficient21_230, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 212, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_232, Icur := OriginalRow227TriangleData0318.coefficient20_231,
    output := OriginalRow227TriangleData0333.coefficient21_231, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 213, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_233, Icur := OriginalRow227TriangleData0318.coefficient20_232,
    output := OriginalRow227TriangleData0333.coefficient21_232, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 214, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_234, Icur := OriginalRow227TriangleData0318.coefficient20_233,
    output := OriginalRow227TriangleData0333.coefficient21_233, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 215, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_235, Icur := OriginalRow227TriangleData0318.coefficient20_234,
    output := OriginalRow227TriangleData0333.coefficient21_234, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 216, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_236, Icur := OriginalRow227TriangleData0318.coefficient20_235,
    output := OriginalRow227TriangleData0333.coefficient21_235, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 217, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_237, Icur := OriginalRow227TriangleData0318.coefficient20_236,
    output := OriginalRow227TriangleData0333.coefficient21_236, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 218, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_238, Icur := OriginalRow227TriangleData0318.coefficient20_237,
    output := OriginalRow227TriangleData0333.coefficient21_237, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 219, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_239, Icur := OriginalRow227TriangleData0318.coefficient20_238,
    output := OriginalRow227TriangleData0333.coefficient21_238, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 220, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_240, Icur := OriginalRow227TriangleData0318.coefficient20_239,
    output := OriginalRow227TriangleData0333.coefficient21_239, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 221, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_241, Icur := OriginalRow227TriangleData0318.coefficient20_240,
    output := OriginalRow227TriangleData0333.coefficient21_240, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 222, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0318.coefficient20_242, Icur := OriginalRow227TriangleData0318.coefficient20_241,
    output := OriginalRow227TriangleData0333.coefficient21_241, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 223, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_243, Icur := OriginalRow227TriangleData0318.coefficient20_242,
    output := OriginalRow227TriangleData0333.coefficient21_242, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 224, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0319.coefficient20_244, Icur := OriginalRow227TriangleData0319.coefficient20_243,
    output := OriginalRow227TriangleData0333.coefficient21_243, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0317

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0317.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

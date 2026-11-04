import Grothe.UpperChaos.OriginalRow227TriangleData0700
import Grothe.UpperChaos.OriginalRow227TriangleData0701
import Grothe.UpperChaos.OriginalRow227TriangleData0713
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0697
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_208, Icur := OriginalRow227TriangleData0700.coefficient47_207,
    output := OriginalRow227TriangleData0713.coefficient48_207, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_209, Icur := OriginalRow227TriangleData0700.coefficient47_208,
    output := OriginalRow227TriangleData0713.coefficient48_208, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_210, Icur := OriginalRow227TriangleData0700.coefficient47_209,
    output := OriginalRow227TriangleData0713.coefficient48_209, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_211, Icur := OriginalRow227TriangleData0700.coefficient47_210,
    output := OriginalRow227TriangleData0713.coefficient48_210, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_212, Icur := OriginalRow227TriangleData0700.coefficient47_211,
    output := OriginalRow227TriangleData0713.coefficient48_211, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_213, Icur := OriginalRow227TriangleData0700.coefficient47_212,
    output := OriginalRow227TriangleData0713.coefficient48_212, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_214, Icur := OriginalRow227TriangleData0700.coefficient47_213,
    output := OriginalRow227TriangleData0713.coefficient48_213, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_215, Icur := OriginalRow227TriangleData0700.coefficient47_214,
    output := OriginalRow227TriangleData0713.coefficient48_214, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_216, Icur := OriginalRow227TriangleData0700.coefficient47_215,
    output := OriginalRow227TriangleData0713.coefficient48_215, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_217, Icur := OriginalRow227TriangleData0700.coefficient47_216,
    output := OriginalRow227TriangleData0713.coefficient48_216, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_218, Icur := OriginalRow227TriangleData0700.coefficient47_217,
    output := OriginalRow227TriangleData0713.coefficient48_217, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_219, Icur := OriginalRow227TriangleData0700.coefficient47_218,
    output := OriginalRow227TriangleData0713.coefficient48_218, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_220, Icur := OriginalRow227TriangleData0700.coefficient47_219,
    output := OriginalRow227TriangleData0713.coefficient48_219, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_221, Icur := OriginalRow227TriangleData0700.coefficient47_220,
    output := OriginalRow227TriangleData0713.coefficient48_220, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_222, Icur := OriginalRow227TriangleData0700.coefficient47_221,
    output := OriginalRow227TriangleData0713.coefficient48_221, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_223, Icur := OriginalRow227TriangleData0700.coefficient47_222,
    output := OriginalRow227TriangleData0713.coefficient48_222, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_224, Icur := OriginalRow227TriangleData0700.coefficient47_223,
    output := OriginalRow227TriangleData0713.coefficient48_223, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_225, Icur := OriginalRow227TriangleData0700.coefficient47_224,
    output := OriginalRow227TriangleData0713.coefficient48_224, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_226, Icur := OriginalRow227TriangleData0700.coefficient47_225,
    output := OriginalRow227TriangleData0713.coefficient48_225, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_227, Icur := OriginalRow227TriangleData0700.coefficient47_226,
    output := OriginalRow227TriangleData0713.coefficient48_226, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_228, Icur := OriginalRow227TriangleData0700.coefficient47_227,
    output := OriginalRow227TriangleData0713.coefficient48_227, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_229, Icur := OriginalRow227TriangleData0700.coefficient47_228,
    output := OriginalRow227TriangleData0713.coefficient48_228, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_230, Icur := OriginalRow227TriangleData0700.coefficient47_229,
    output := OriginalRow227TriangleData0713.coefficient48_229, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_231, Icur := OriginalRow227TriangleData0700.coefficient47_230,
    output := OriginalRow227TriangleData0713.coefficient48_230, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_232, Icur := OriginalRow227TriangleData0700.coefficient47_231,
    output := OriginalRow227TriangleData0713.coefficient48_231, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_233, Icur := OriginalRow227TriangleData0700.coefficient47_232,
    output := OriginalRow227TriangleData0713.coefficient48_232, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_234, Icur := OriginalRow227TriangleData0700.coefficient47_233,
    output := OriginalRow227TriangleData0713.coefficient48_233, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_235, Icur := OriginalRow227TriangleData0700.coefficient47_234,
    output := OriginalRow227TriangleData0713.coefficient48_234, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_236, Icur := OriginalRow227TriangleData0700.coefficient47_235,
    output := OriginalRow227TriangleData0713.coefficient48_235, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0700.coefficient47_237, Icur := OriginalRow227TriangleData0700.coefficient47_236,
    output := OriginalRow227TriangleData0713.coefficient48_236, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_238, Icur := OriginalRow227TriangleData0700.coefficient47_237,
    output := OriginalRow227TriangleData0713.coefficient48_237, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0701.coefficient47_239, Icur := OriginalRow227TriangleData0701.coefficient47_238,
    output := OriginalRow227TriangleData0713.coefficient48_238, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0697

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0697.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

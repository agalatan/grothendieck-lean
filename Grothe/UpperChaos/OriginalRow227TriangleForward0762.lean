import Grothe.UpperChaos.OriginalRow227TriangleData0765
import Grothe.UpperChaos.OriginalRow227TriangleData0766
import Grothe.UpperChaos.OriginalRow227TriangleData0778
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0762
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_213, Icur := OriginalRow227TriangleData0765.coefficient52_212,
    output := OriginalRow227TriangleData0778.coefficient53_212, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_214, Icur := OriginalRow227TriangleData0765.coefficient52_213,
    output := OriginalRow227TriangleData0778.coefficient53_213, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_215, Icur := OriginalRow227TriangleData0765.coefficient52_214,
    output := OriginalRow227TriangleData0778.coefficient53_214, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_216, Icur := OriginalRow227TriangleData0765.coefficient52_215,
    output := OriginalRow227TriangleData0778.coefficient53_215, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_217, Icur := OriginalRow227TriangleData0765.coefficient52_216,
    output := OriginalRow227TriangleData0778.coefficient53_216, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_218, Icur := OriginalRow227TriangleData0765.coefficient52_217,
    output := OriginalRow227TriangleData0778.coefficient53_217, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_219, Icur := OriginalRow227TriangleData0765.coefficient52_218,
    output := OriginalRow227TriangleData0778.coefficient53_218, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_220, Icur := OriginalRow227TriangleData0765.coefficient52_219,
    output := OriginalRow227TriangleData0778.coefficient53_219, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_221, Icur := OriginalRow227TriangleData0765.coefficient52_220,
    output := OriginalRow227TriangleData0778.coefficient53_220, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_222, Icur := OriginalRow227TriangleData0765.coefficient52_221,
    output := OriginalRow227TriangleData0778.coefficient53_221, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_223, Icur := OriginalRow227TriangleData0765.coefficient52_222,
    output := OriginalRow227TriangleData0778.coefficient53_222, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_224, Icur := OriginalRow227TriangleData0765.coefficient52_223,
    output := OriginalRow227TriangleData0778.coefficient53_223, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_225, Icur := OriginalRow227TriangleData0765.coefficient52_224,
    output := OriginalRow227TriangleData0778.coefficient53_224, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_226, Icur := OriginalRow227TriangleData0765.coefficient52_225,
    output := OriginalRow227TriangleData0778.coefficient53_225, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_227, Icur := OriginalRow227TriangleData0765.coefficient52_226,
    output := OriginalRow227TriangleData0778.coefficient53_226, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_228, Icur := OriginalRow227TriangleData0765.coefficient52_227,
    output := OriginalRow227TriangleData0778.coefficient53_227, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_229, Icur := OriginalRow227TriangleData0765.coefficient52_228,
    output := OriginalRow227TriangleData0778.coefficient53_228, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_230, Icur := OriginalRow227TriangleData0765.coefficient52_229,
    output := OriginalRow227TriangleData0778.coefficient53_229, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_231, Icur := OriginalRow227TriangleData0765.coefficient52_230,
    output := OriginalRow227TriangleData0778.coefficient53_230, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_232, Icur := OriginalRow227TriangleData0765.coefficient52_231,
    output := OriginalRow227TriangleData0778.coefficient53_231, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_233, Icur := OriginalRow227TriangleData0765.coefficient52_232,
    output := OriginalRow227TriangleData0778.coefficient53_232, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_234, Icur := OriginalRow227TriangleData0765.coefficient52_233,
    output := OriginalRow227TriangleData0778.coefficient53_233, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_235, Icur := OriginalRow227TriangleData0765.coefficient52_234,
    output := OriginalRow227TriangleData0778.coefficient53_234, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_236, Icur := OriginalRow227TriangleData0765.coefficient52_235,
    output := OriginalRow227TriangleData0778.coefficient53_235, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_237, Icur := OriginalRow227TriangleData0765.coefficient52_236,
    output := OriginalRow227TriangleData0778.coefficient53_236, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_238, Icur := OriginalRow227TriangleData0765.coefficient52_237,
    output := OriginalRow227TriangleData0778.coefficient53_237, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_239, Icur := OriginalRow227TriangleData0765.coefficient52_238,
    output := OriginalRow227TriangleData0778.coefficient53_238, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_240, Icur := OriginalRow227TriangleData0765.coefficient52_239,
    output := OriginalRow227TriangleData0778.coefficient53_239, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_241, Icur := OriginalRow227TriangleData0765.coefficient52_240,
    output := OriginalRow227TriangleData0778.coefficient53_240, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0765.coefficient52_242, Icur := OriginalRow227TriangleData0765.coefficient52_241,
    output := OriginalRow227TriangleData0778.coefficient53_241, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0766.coefficient52_243, Icur := OriginalRow227TriangleData0765.coefficient52_242,
    output := OriginalRow227TriangleData0778.coefficient53_242, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots07.root244, IC := OriginalRow227TriangleRoots01.root53,
    Inext := OriginalRow227TriangleData0766.coefficient52_244, Icur := OriginalRow227TriangleData0766.coefficient52_243,
    output := OriginalRow227TriangleData0778.coefficient53_243, hC := OriginalRow227TriangleRoots01.root53_pos, hAC := OriginalRow227TriangleRoots01.product53_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0762

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0762.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

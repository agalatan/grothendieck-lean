import Grothe.UpperChaos.OriginalRow227TriangleData0752
import Grothe.UpperChaos.OriginalRow227TriangleData0753
import Grothe.UpperChaos.OriginalRow227TriangleData0765
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0749
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_212, Icur := OriginalRow227TriangleData0752.coefficient51_211,
    output := OriginalRow227TriangleData0765.coefficient52_211, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_213, Icur := OriginalRow227TriangleData0752.coefficient51_212,
    output := OriginalRow227TriangleData0765.coefficient52_212, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_214, Icur := OriginalRow227TriangleData0752.coefficient51_213,
    output := OriginalRow227TriangleData0765.coefficient52_213, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_215, Icur := OriginalRow227TriangleData0752.coefficient51_214,
    output := OriginalRow227TriangleData0765.coefficient52_214, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_216, Icur := OriginalRow227TriangleData0752.coefficient51_215,
    output := OriginalRow227TriangleData0765.coefficient52_215, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_217, Icur := OriginalRow227TriangleData0752.coefficient51_216,
    output := OriginalRow227TriangleData0765.coefficient52_216, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_218, Icur := OriginalRow227TriangleData0752.coefficient51_217,
    output := OriginalRow227TriangleData0765.coefficient52_217, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_219, Icur := OriginalRow227TriangleData0752.coefficient51_218,
    output := OriginalRow227TriangleData0765.coefficient52_218, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_220, Icur := OriginalRow227TriangleData0752.coefficient51_219,
    output := OriginalRow227TriangleData0765.coefficient52_219, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_221, Icur := OriginalRow227TriangleData0752.coefficient51_220,
    output := OriginalRow227TriangleData0765.coefficient52_220, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_222, Icur := OriginalRow227TriangleData0752.coefficient51_221,
    output := OriginalRow227TriangleData0765.coefficient52_221, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_223, Icur := OriginalRow227TriangleData0752.coefficient51_222,
    output := OriginalRow227TriangleData0765.coefficient52_222, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_224, Icur := OriginalRow227TriangleData0752.coefficient51_223,
    output := OriginalRow227TriangleData0765.coefficient52_223, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_225, Icur := OriginalRow227TriangleData0752.coefficient51_224,
    output := OriginalRow227TriangleData0765.coefficient52_224, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_226, Icur := OriginalRow227TriangleData0752.coefficient51_225,
    output := OriginalRow227TriangleData0765.coefficient52_225, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_227, Icur := OriginalRow227TriangleData0752.coefficient51_226,
    output := OriginalRow227TriangleData0765.coefficient52_226, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_228, Icur := OriginalRow227TriangleData0752.coefficient51_227,
    output := OriginalRow227TriangleData0765.coefficient52_227, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_229, Icur := OriginalRow227TriangleData0752.coefficient51_228,
    output := OriginalRow227TriangleData0765.coefficient52_228, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_230, Icur := OriginalRow227TriangleData0752.coefficient51_229,
    output := OriginalRow227TriangleData0765.coefficient52_229, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_231, Icur := OriginalRow227TriangleData0752.coefficient51_230,
    output := OriginalRow227TriangleData0765.coefficient52_230, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_232, Icur := OriginalRow227TriangleData0752.coefficient51_231,
    output := OriginalRow227TriangleData0765.coefficient52_231, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_233, Icur := OriginalRow227TriangleData0752.coefficient51_232,
    output := OriginalRow227TriangleData0765.coefficient52_232, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_234, Icur := OriginalRow227TriangleData0752.coefficient51_233,
    output := OriginalRow227TriangleData0765.coefficient52_233, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_235, Icur := OriginalRow227TriangleData0752.coefficient51_234,
    output := OriginalRow227TriangleData0765.coefficient52_234, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_236, Icur := OriginalRow227TriangleData0752.coefficient51_235,
    output := OriginalRow227TriangleData0765.coefficient52_235, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_237, Icur := OriginalRow227TriangleData0752.coefficient51_236,
    output := OriginalRow227TriangleData0765.coefficient52_236, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_238, Icur := OriginalRow227TriangleData0752.coefficient51_237,
    output := OriginalRow227TriangleData0765.coefficient52_237, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_239, Icur := OriginalRow227TriangleData0752.coefficient51_238,
    output := OriginalRow227TriangleData0765.coefficient52_238, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_240, Icur := OriginalRow227TriangleData0752.coefficient51_239,
    output := OriginalRow227TriangleData0765.coefficient52_239, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0752.coefficient51_241, Icur := OriginalRow227TriangleData0752.coefficient51_240,
    output := OriginalRow227TriangleData0765.coefficient52_240, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0753.coefficient51_242, Icur := OriginalRow227TriangleData0752.coefficient51_241,
    output := OriginalRow227TriangleData0765.coefficient52_241, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots01.root52,
    Inext := OriginalRow227TriangleData0753.coefficient51_243, Icur := OriginalRow227TriangleData0753.coefficient51_242,
    output := OriginalRow227TriangleData0765.coefficient52_242, hC := OriginalRow227TriangleRoots01.root52_pos, hAC := OriginalRow227TriangleRoots01.product52_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0749

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0749.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData0726
import Grothe.UpperChaos.OriginalRow227TriangleData0727
import Grothe.UpperChaos.OriginalRow227TriangleData0739
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0723
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_210, Icur := OriginalRow227TriangleData0726.coefficient49_209,
    output := OriginalRow227TriangleData0739.coefficient50_209, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_211, Icur := OriginalRow227TriangleData0726.coefficient49_210,
    output := OriginalRow227TriangleData0739.coefficient50_210, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_212, Icur := OriginalRow227TriangleData0726.coefficient49_211,
    output := OriginalRow227TriangleData0739.coefficient50_211, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_213, Icur := OriginalRow227TriangleData0726.coefficient49_212,
    output := OriginalRow227TriangleData0739.coefficient50_212, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_214, Icur := OriginalRow227TriangleData0726.coefficient49_213,
    output := OriginalRow227TriangleData0739.coefficient50_213, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_215, Icur := OriginalRow227TriangleData0726.coefficient49_214,
    output := OriginalRow227TriangleData0739.coefficient50_214, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_216, Icur := OriginalRow227TriangleData0726.coefficient49_215,
    output := OriginalRow227TriangleData0739.coefficient50_215, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_217, Icur := OriginalRow227TriangleData0726.coefficient49_216,
    output := OriginalRow227TriangleData0739.coefficient50_216, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_218, Icur := OriginalRow227TriangleData0726.coefficient49_217,
    output := OriginalRow227TriangleData0739.coefficient50_217, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_219, Icur := OriginalRow227TriangleData0726.coefficient49_218,
    output := OriginalRow227TriangleData0739.coefficient50_218, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_220, Icur := OriginalRow227TriangleData0726.coefficient49_219,
    output := OriginalRow227TriangleData0739.coefficient50_219, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_221, Icur := OriginalRow227TriangleData0726.coefficient49_220,
    output := OriginalRow227TriangleData0739.coefficient50_220, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_222, Icur := OriginalRow227TriangleData0726.coefficient49_221,
    output := OriginalRow227TriangleData0739.coefficient50_221, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_223, Icur := OriginalRow227TriangleData0726.coefficient49_222,
    output := OriginalRow227TriangleData0739.coefficient50_222, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_224, Icur := OriginalRow227TriangleData0726.coefficient49_223,
    output := OriginalRow227TriangleData0739.coefficient50_223, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_225, Icur := OriginalRow227TriangleData0726.coefficient49_224,
    output := OriginalRow227TriangleData0739.coefficient50_224, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_226, Icur := OriginalRow227TriangleData0726.coefficient49_225,
    output := OriginalRow227TriangleData0739.coefficient50_225, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_227, Icur := OriginalRow227TriangleData0726.coefficient49_226,
    output := OriginalRow227TriangleData0739.coefficient50_226, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_228, Icur := OriginalRow227TriangleData0726.coefficient49_227,
    output := OriginalRow227TriangleData0739.coefficient50_227, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_229, Icur := OriginalRow227TriangleData0726.coefficient49_228,
    output := OriginalRow227TriangleData0739.coefficient50_228, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_230, Icur := OriginalRow227TriangleData0726.coefficient49_229,
    output := OriginalRow227TriangleData0739.coefficient50_229, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_231, Icur := OriginalRow227TriangleData0726.coefficient49_230,
    output := OriginalRow227TriangleData0739.coefficient50_230, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_232, Icur := OriginalRow227TriangleData0726.coefficient49_231,
    output := OriginalRow227TriangleData0739.coefficient50_231, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_233, Icur := OriginalRow227TriangleData0726.coefficient49_232,
    output := OriginalRow227TriangleData0739.coefficient50_232, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_234, Icur := OriginalRow227TriangleData0726.coefficient49_233,
    output := OriginalRow227TriangleData0739.coefficient50_233, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_235, Icur := OriginalRow227TriangleData0726.coefficient49_234,
    output := OriginalRow227TriangleData0739.coefficient50_234, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_236, Icur := OriginalRow227TriangleData0726.coefficient49_235,
    output := OriginalRow227TriangleData0739.coefficient50_235, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_237, Icur := OriginalRow227TriangleData0726.coefficient49_236,
    output := OriginalRow227TriangleData0739.coefficient50_236, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_238, Icur := OriginalRow227TriangleData0726.coefficient49_237,
    output := OriginalRow227TriangleData0739.coefficient50_237, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0726.coefficient49_239, Icur := OriginalRow227TriangleData0726.coefficient49_238,
    output := OriginalRow227TriangleData0739.coefficient50_238, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_240, Icur := OriginalRow227TriangleData0726.coefficient49_239,
    output := OriginalRow227TriangleData0739.coefficient50_239, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0727.coefficient49_241, Icur := OriginalRow227TriangleData0727.coefficient49_240,
    output := OriginalRow227TriangleData0739.coefficient50_240, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0723

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0723.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

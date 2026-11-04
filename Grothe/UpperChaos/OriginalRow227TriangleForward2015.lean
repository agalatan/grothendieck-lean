import Grothe.UpperChaos.OriginalRow227TriangleData2028
import Grothe.UpperChaos.OriginalRow227TriangleData2029
import Grothe.UpperChaos.OriginalRow227TriangleData2031
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward2015
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_209, Icur := OriginalRow227TriangleData2028.coefficient208_208,
    output := OriginalRow227TriangleData2031.coefficient209_208, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_210, Icur := OriginalRow227TriangleData2028.coefficient208_209,
    output := OriginalRow227TriangleData2031.coefficient209_209, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_211, Icur := OriginalRow227TriangleData2028.coefficient208_210,
    output := OriginalRow227TriangleData2031.coefficient209_210, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_212, Icur := OriginalRow227TriangleData2028.coefficient208_211,
    output := OriginalRow227TriangleData2031.coefficient209_211, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_213, Icur := OriginalRow227TriangleData2028.coefficient208_212,
    output := OriginalRow227TriangleData2031.coefficient209_212, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_214, Icur := OriginalRow227TriangleData2028.coefficient208_213,
    output := OriginalRow227TriangleData2031.coefficient209_213, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_215, Icur := OriginalRow227TriangleData2028.coefficient208_214,
    output := OriginalRow227TriangleData2031.coefficient209_214, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_216, Icur := OriginalRow227TriangleData2028.coefficient208_215,
    output := OriginalRow227TriangleData2031.coefficient209_215, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_217, Icur := OriginalRow227TriangleData2028.coefficient208_216,
    output := OriginalRow227TriangleData2031.coefficient209_216, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_218, Icur := OriginalRow227TriangleData2028.coefficient208_217,
    output := OriginalRow227TriangleData2031.coefficient209_217, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_219, Icur := OriginalRow227TriangleData2028.coefficient208_218,
    output := OriginalRow227TriangleData2031.coefficient209_218, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_220, Icur := OriginalRow227TriangleData2028.coefficient208_219,
    output := OriginalRow227TriangleData2031.coefficient209_219, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_221, Icur := OriginalRow227TriangleData2028.coefficient208_220,
    output := OriginalRow227TriangleData2031.coefficient209_220, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_222, Icur := OriginalRow227TriangleData2028.coefficient208_221,
    output := OriginalRow227TriangleData2031.coefficient209_221, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_223, Icur := OriginalRow227TriangleData2028.coefficient208_222,
    output := OriginalRow227TriangleData2031.coefficient209_222, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_224, Icur := OriginalRow227TriangleData2028.coefficient208_223,
    output := OriginalRow227TriangleData2031.coefficient209_223, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_225, Icur := OriginalRow227TriangleData2028.coefficient208_224,
    output := OriginalRow227TriangleData2031.coefficient209_224, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_226, Icur := OriginalRow227TriangleData2028.coefficient208_225,
    output := OriginalRow227TriangleData2031.coefficient209_225, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_227, Icur := OriginalRow227TriangleData2028.coefficient208_226,
    output := OriginalRow227TriangleData2031.coefficient209_226, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_228, Icur := OriginalRow227TriangleData2028.coefficient208_227,
    output := OriginalRow227TriangleData2031.coefficient209_227, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_229, Icur := OriginalRow227TriangleData2028.coefficient208_228,
    output := OriginalRow227TriangleData2031.coefficient209_228, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_230, Icur := OriginalRow227TriangleData2028.coefficient208_229,
    output := OriginalRow227TriangleData2031.coefficient209_229, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_231, Icur := OriginalRow227TriangleData2028.coefficient208_230,
    output := OriginalRow227TriangleData2031.coefficient209_230, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_232, Icur := OriginalRow227TriangleData2028.coefficient208_231,
    output := OriginalRow227TriangleData2031.coefficient209_231, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_233, Icur := OriginalRow227TriangleData2028.coefficient208_232,
    output := OriginalRow227TriangleData2031.coefficient209_232, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_234, Icur := OriginalRow227TriangleData2028.coefficient208_233,
    output := OriginalRow227TriangleData2031.coefficient209_233, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_235, Icur := OriginalRow227TriangleData2028.coefficient208_234,
    output := OriginalRow227TriangleData2031.coefficient209_234, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_236, Icur := OriginalRow227TriangleData2028.coefficient208_235,
    output := OriginalRow227TriangleData2031.coefficient209_235, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_237, Icur := OriginalRow227TriangleData2028.coefficient208_236,
    output := OriginalRow227TriangleData2031.coefficient209_236, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2028.coefficient208_238, Icur := OriginalRow227TriangleData2028.coefficient208_237,
    output := OriginalRow227TriangleData2031.coefficient209_237, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2029.coefficient208_239, Icur := OriginalRow227TriangleData2028.coefficient208_238,
    output := OriginalRow227TriangleData2031.coefficient209_238, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots06.root209,
    Inext := OriginalRow227TriangleData2029.coefficient208_240, Icur := OriginalRow227TriangleData2029.coefficient208_239,
    output := OriginalRow227TriangleData2031.coefficient209_239, hC := OriginalRow227TriangleRoots06.root209_pos, hAC := OriginalRow227TriangleRoots06.product209_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward2015

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward2015.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

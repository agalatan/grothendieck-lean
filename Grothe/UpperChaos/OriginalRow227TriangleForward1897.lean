import Grothe.UpperChaos.OriginalRow227TriangleData1908
import Grothe.UpperChaos.OriginalRow227TriangleData1909
import Grothe.UpperChaos.OriginalRow227TriangleData1913
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1897
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_212, Icur := OriginalRow227TriangleData1908.coefficient179_211,
    output := OriginalRow227TriangleData1913.coefficient180_211, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_213, Icur := OriginalRow227TriangleData1908.coefficient179_212,
    output := OriginalRow227TriangleData1913.coefficient180_212, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_214, Icur := OriginalRow227TriangleData1908.coefficient179_213,
    output := OriginalRow227TriangleData1913.coefficient180_213, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_215, Icur := OriginalRow227TriangleData1908.coefficient179_214,
    output := OriginalRow227TriangleData1913.coefficient180_214, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_216, Icur := OriginalRow227TriangleData1908.coefficient179_215,
    output := OriginalRow227TriangleData1913.coefficient180_215, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_217, Icur := OriginalRow227TriangleData1908.coefficient179_216,
    output := OriginalRow227TriangleData1913.coefficient180_216, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_218, Icur := OriginalRow227TriangleData1908.coefficient179_217,
    output := OriginalRow227TriangleData1913.coefficient180_217, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_219, Icur := OriginalRow227TriangleData1908.coefficient179_218,
    output := OriginalRow227TriangleData1913.coefficient180_218, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_220, Icur := OriginalRow227TriangleData1908.coefficient179_219,
    output := OriginalRow227TriangleData1913.coefficient180_219, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_221, Icur := OriginalRow227TriangleData1908.coefficient179_220,
    output := OriginalRow227TriangleData1913.coefficient180_220, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_222, Icur := OriginalRow227TriangleData1908.coefficient179_221,
    output := OriginalRow227TriangleData1913.coefficient180_221, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_223, Icur := OriginalRow227TriangleData1908.coefficient179_222,
    output := OriginalRow227TriangleData1913.coefficient180_222, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_224, Icur := OriginalRow227TriangleData1908.coefficient179_223,
    output := OriginalRow227TriangleData1913.coefficient180_223, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_225, Icur := OriginalRow227TriangleData1908.coefficient179_224,
    output := OriginalRow227TriangleData1913.coefficient180_224, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_226, Icur := OriginalRow227TriangleData1908.coefficient179_225,
    output := OriginalRow227TriangleData1913.coefficient180_225, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_227, Icur := OriginalRow227TriangleData1908.coefficient179_226,
    output := OriginalRow227TriangleData1913.coefficient180_226, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_228, Icur := OriginalRow227TriangleData1908.coefficient179_227,
    output := OriginalRow227TriangleData1913.coefficient180_227, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_229, Icur := OriginalRow227TriangleData1908.coefficient179_228,
    output := OriginalRow227TriangleData1913.coefficient180_228, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_230, Icur := OriginalRow227TriangleData1908.coefficient179_229,
    output := OriginalRow227TriangleData1913.coefficient180_229, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_231, Icur := OriginalRow227TriangleData1908.coefficient179_230,
    output := OriginalRow227TriangleData1913.coefficient180_230, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_232, Icur := OriginalRow227TriangleData1908.coefficient179_231,
    output := OriginalRow227TriangleData1913.coefficient180_231, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_233, Icur := OriginalRow227TriangleData1908.coefficient179_232,
    output := OriginalRow227TriangleData1913.coefficient180_232, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_234, Icur := OriginalRow227TriangleData1908.coefficient179_233,
    output := OriginalRow227TriangleData1913.coefficient180_233, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_235, Icur := OriginalRow227TriangleData1908.coefficient179_234,
    output := OriginalRow227TriangleData1913.coefficient180_234, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_236, Icur := OriginalRow227TriangleData1908.coefficient179_235,
    output := OriginalRow227TriangleData1913.coefficient180_235, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_237, Icur := OriginalRow227TriangleData1908.coefficient179_236,
    output := OriginalRow227TriangleData1913.coefficient180_236, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_238, Icur := OriginalRow227TriangleData1908.coefficient179_237,
    output := OriginalRow227TriangleData1913.coefficient180_237, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_239, Icur := OriginalRow227TriangleData1908.coefficient179_238,
    output := OriginalRow227TriangleData1913.coefficient180_238, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_240, Icur := OriginalRow227TriangleData1908.coefficient179_239,
    output := OriginalRow227TriangleData1913.coefficient180_239, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots07.root241, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1908.coefficient179_241, Icur := OriginalRow227TriangleData1908.coefficient179_240,
    output := OriginalRow227TriangleData1913.coefficient180_240, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots07.root242, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_242, Icur := OriginalRow227TriangleData1908.coefficient179_241,
    output := OriginalRow227TriangleData1913.coefficient180_241, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots07.root243, IC := OriginalRow227TriangleRoots05.root180,
    Inext := OriginalRow227TriangleData1909.coefficient179_243, Icur := OriginalRow227TriangleData1909.coefficient179_242,
    output := OriginalRow227TriangleData1913.coefficient180_242, hC := OriginalRow227TriangleRoots05.root180_pos, hAC := OriginalRow227TriangleRoots05.product180_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1897

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1897.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

import Grothe.UpperChaos.OriginalRow227TriangleData1878
import Grothe.UpperChaos.OriginalRow227TriangleData1879
import Grothe.UpperChaos.OriginalRow227TriangleData1883
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1867
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_206, Icur := OriginalRow227TriangleData1878.coefficient173_205,
    output := OriginalRow227TriangleData1883.coefficient174_205, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_207, Icur := OriginalRow227TriangleData1878.coefficient173_206,
    output := OriginalRow227TriangleData1883.coefficient174_206, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_208, Icur := OriginalRow227TriangleData1878.coefficient173_207,
    output := OriginalRow227TriangleData1883.coefficient174_207, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_209, Icur := OriginalRow227TriangleData1878.coefficient173_208,
    output := OriginalRow227TriangleData1883.coefficient174_208, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_210, Icur := OriginalRow227TriangleData1878.coefficient173_209,
    output := OriginalRow227TriangleData1883.coefficient174_209, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_211, Icur := OriginalRow227TriangleData1878.coefficient173_210,
    output := OriginalRow227TriangleData1883.coefficient174_210, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_212, Icur := OriginalRow227TriangleData1878.coefficient173_211,
    output := OriginalRow227TriangleData1883.coefficient174_211, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_213, Icur := OriginalRow227TriangleData1878.coefficient173_212,
    output := OriginalRow227TriangleData1883.coefficient174_212, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_214, Icur := OriginalRow227TriangleData1878.coefficient173_213,
    output := OriginalRow227TriangleData1883.coefficient174_213, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_215, Icur := OriginalRow227TriangleData1878.coefficient173_214,
    output := OriginalRow227TriangleData1883.coefficient174_214, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_216, Icur := OriginalRow227TriangleData1878.coefficient173_215,
    output := OriginalRow227TriangleData1883.coefficient174_215, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_217, Icur := OriginalRow227TriangleData1878.coefficient173_216,
    output := OriginalRow227TriangleData1883.coefficient174_216, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_218, Icur := OriginalRow227TriangleData1878.coefficient173_217,
    output := OriginalRow227TriangleData1883.coefficient174_217, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_219, Icur := OriginalRow227TriangleData1878.coefficient173_218,
    output := OriginalRow227TriangleData1883.coefficient174_218, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_220, Icur := OriginalRow227TriangleData1878.coefficient173_219,
    output := OriginalRow227TriangleData1883.coefficient174_219, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_221, Icur := OriginalRow227TriangleData1878.coefficient173_220,
    output := OriginalRow227TriangleData1883.coefficient174_220, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_222, Icur := OriginalRow227TriangleData1878.coefficient173_221,
    output := OriginalRow227TriangleData1883.coefficient174_221, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_223, Icur := OriginalRow227TriangleData1878.coefficient173_222,
    output := OriginalRow227TriangleData1883.coefficient174_222, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_224, Icur := OriginalRow227TriangleData1878.coefficient173_223,
    output := OriginalRow227TriangleData1883.coefficient174_223, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_225, Icur := OriginalRow227TriangleData1878.coefficient173_224,
    output := OriginalRow227TriangleData1883.coefficient174_224, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_226, Icur := OriginalRow227TriangleData1878.coefficient173_225,
    output := OriginalRow227TriangleData1883.coefficient174_225, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_227, Icur := OriginalRow227TriangleData1878.coefficient173_226,
    output := OriginalRow227TriangleData1883.coefficient174_226, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_228, Icur := OriginalRow227TriangleData1878.coefficient173_227,
    output := OriginalRow227TriangleData1883.coefficient174_227, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_229, Icur := OriginalRow227TriangleData1878.coefficient173_228,
    output := OriginalRow227TriangleData1883.coefficient174_228, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_230, Icur := OriginalRow227TriangleData1878.coefficient173_229,
    output := OriginalRow227TriangleData1883.coefficient174_229, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_231, Icur := OriginalRow227TriangleData1878.coefficient173_230,
    output := OriginalRow227TriangleData1883.coefficient174_230, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_232, Icur := OriginalRow227TriangleData1878.coefficient173_231,
    output := OriginalRow227TriangleData1883.coefficient174_231, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_233, Icur := OriginalRow227TriangleData1878.coefficient173_232,
    output := OriginalRow227TriangleData1883.coefficient174_232, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_234, Icur := OriginalRow227TriangleData1878.coefficient173_233,
    output := OriginalRow227TriangleData1883.coefficient174_233, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1878.coefficient173_235, Icur := OriginalRow227TriangleData1878.coefficient173_234,
    output := OriginalRow227TriangleData1883.coefficient174_234, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1879.coefficient173_236, Icur := OriginalRow227TriangleData1878.coefficient173_235,
    output := OriginalRow227TriangleData1883.coefficient174_235, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots05.root174,
    Inext := OriginalRow227TriangleData1879.coefficient173_237, Icur := OriginalRow227TriangleData1879.coefficient173_236,
    output := OriginalRow227TriangleData1883.coefficient174_236, hC := OriginalRow227TriangleRoots05.root174_pos, hAC := OriginalRow227TriangleRoots05.product174_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1867

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1867.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

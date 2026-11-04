import Grothe.UpperChaos.OriginalRow227TriangleData1861
import Grothe.UpperChaos.OriginalRow227TriangleData1862
import Grothe.UpperChaos.OriginalRow227TriangleData1867
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1851
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_203, Icur := OriginalRow227TriangleData1861.coefficient170_202,
    output := OriginalRow227TriangleData1867.coefficient171_202, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_204, Icur := OriginalRow227TriangleData1861.coefficient170_203,
    output := OriginalRow227TriangleData1867.coefficient171_203, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_205, Icur := OriginalRow227TriangleData1861.coefficient170_204,
    output := OriginalRow227TriangleData1867.coefficient171_204, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_206, Icur := OriginalRow227TriangleData1861.coefficient170_205,
    output := OriginalRow227TriangleData1867.coefficient171_205, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_207, Icur := OriginalRow227TriangleData1861.coefficient170_206,
    output := OriginalRow227TriangleData1867.coefficient171_206, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_208, Icur := OriginalRow227TriangleData1861.coefficient170_207,
    output := OriginalRow227TriangleData1867.coefficient171_207, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_209, Icur := OriginalRow227TriangleData1861.coefficient170_208,
    output := OriginalRow227TriangleData1867.coefficient171_208, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_210, Icur := OriginalRow227TriangleData1861.coefficient170_209,
    output := OriginalRow227TriangleData1867.coefficient171_209, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_211, Icur := OriginalRow227TriangleData1861.coefficient170_210,
    output := OriginalRow227TriangleData1867.coefficient171_210, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_212, Icur := OriginalRow227TriangleData1861.coefficient170_211,
    output := OriginalRow227TriangleData1867.coefficient171_211, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_213, Icur := OriginalRow227TriangleData1861.coefficient170_212,
    output := OriginalRow227TriangleData1867.coefficient171_212, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_214, Icur := OriginalRow227TriangleData1861.coefficient170_213,
    output := OriginalRow227TriangleData1867.coefficient171_213, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_215, Icur := OriginalRow227TriangleData1861.coefficient170_214,
    output := OriginalRow227TriangleData1867.coefficient171_214, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_216, Icur := OriginalRow227TriangleData1861.coefficient170_215,
    output := OriginalRow227TriangleData1867.coefficient171_215, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_217, Icur := OriginalRow227TriangleData1861.coefficient170_216,
    output := OriginalRow227TriangleData1867.coefficient171_216, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_218, Icur := OriginalRow227TriangleData1861.coefficient170_217,
    output := OriginalRow227TriangleData1867.coefficient171_217, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_219, Icur := OriginalRow227TriangleData1861.coefficient170_218,
    output := OriginalRow227TriangleData1867.coefficient171_218, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_220, Icur := OriginalRow227TriangleData1861.coefficient170_219,
    output := OriginalRow227TriangleData1867.coefficient171_219, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_221, Icur := OriginalRow227TriangleData1861.coefficient170_220,
    output := OriginalRow227TriangleData1867.coefficient171_220, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_222, Icur := OriginalRow227TriangleData1861.coefficient170_221,
    output := OriginalRow227TriangleData1867.coefficient171_221, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_223, Icur := OriginalRow227TriangleData1861.coefficient170_222,
    output := OriginalRow227TriangleData1867.coefficient171_222, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_224, Icur := OriginalRow227TriangleData1861.coefficient170_223,
    output := OriginalRow227TriangleData1867.coefficient171_223, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_225, Icur := OriginalRow227TriangleData1861.coefficient170_224,
    output := OriginalRow227TriangleData1867.coefficient171_224, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_226, Icur := OriginalRow227TriangleData1861.coefficient170_225,
    output := OriginalRow227TriangleData1867.coefficient171_225, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_227, Icur := OriginalRow227TriangleData1861.coefficient170_226,
    output := OriginalRow227TriangleData1867.coefficient171_226, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_228, Icur := OriginalRow227TriangleData1861.coefficient170_227,
    output := OriginalRow227TriangleData1867.coefficient171_227, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_229, Icur := OriginalRow227TriangleData1861.coefficient170_228,
    output := OriginalRow227TriangleData1867.coefficient171_228, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_230, Icur := OriginalRow227TriangleData1861.coefficient170_229,
    output := OriginalRow227TriangleData1867.coefficient171_229, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_231, Icur := OriginalRow227TriangleData1861.coefficient170_230,
    output := OriginalRow227TriangleData1867.coefficient171_230, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1861.coefficient170_232, Icur := OriginalRow227TriangleData1861.coefficient170_231,
    output := OriginalRow227TriangleData1867.coefficient171_231, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1862.coefficient170_233, Icur := OriginalRow227TriangleData1861.coefficient170_232,
    output := OriginalRow227TriangleData1867.coefficient171_232, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots05.root171,
    Inext := OriginalRow227TriangleData1862.coefficient170_234, Icur := OriginalRow227TriangleData1862.coefficient170_233,
    output := OriginalRow227TriangleData1867.coefficient171_233, hC := OriginalRow227TriangleRoots05.root171_pos, hAC := OriginalRow227TriangleRoots05.product171_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1851

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1851.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

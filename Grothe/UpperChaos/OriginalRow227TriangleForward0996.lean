import Grothe.UpperChaos.OriginalRow227TriangleData1000
import Grothe.UpperChaos.OriginalRow227TriangleData1001
import Grothe.UpperChaos.OriginalRow227TriangleData1012
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0996
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_200, Icur := OriginalRow227TriangleData1000.coefficient71_199,
    output := OriginalRow227TriangleData1012.coefficient72_199, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_201, Icur := OriginalRow227TriangleData1000.coefficient71_200,
    output := OriginalRow227TriangleData1012.coefficient72_200, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_202, Icur := OriginalRow227TriangleData1000.coefficient71_201,
    output := OriginalRow227TriangleData1012.coefficient72_201, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_203, Icur := OriginalRow227TriangleData1000.coefficient71_202,
    output := OriginalRow227TriangleData1012.coefficient72_202, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_204, Icur := OriginalRow227TriangleData1000.coefficient71_203,
    output := OriginalRow227TriangleData1012.coefficient72_203, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_205, Icur := OriginalRow227TriangleData1000.coefficient71_204,
    output := OriginalRow227TriangleData1012.coefficient72_204, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_206, Icur := OriginalRow227TriangleData1000.coefficient71_205,
    output := OriginalRow227TriangleData1012.coefficient72_205, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_207, Icur := OriginalRow227TriangleData1000.coefficient71_206,
    output := OriginalRow227TriangleData1012.coefficient72_206, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_208, Icur := OriginalRow227TriangleData1000.coefficient71_207,
    output := OriginalRow227TriangleData1012.coefficient72_207, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_209, Icur := OriginalRow227TriangleData1000.coefficient71_208,
    output := OriginalRow227TriangleData1012.coefficient72_208, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_210, Icur := OriginalRow227TriangleData1000.coefficient71_209,
    output := OriginalRow227TriangleData1012.coefficient72_209, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_211, Icur := OriginalRow227TriangleData1000.coefficient71_210,
    output := OriginalRow227TriangleData1012.coefficient72_210, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_212, Icur := OriginalRow227TriangleData1000.coefficient71_211,
    output := OriginalRow227TriangleData1012.coefficient72_211, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_213, Icur := OriginalRow227TriangleData1000.coefficient71_212,
    output := OriginalRow227TriangleData1012.coefficient72_212, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_214, Icur := OriginalRow227TriangleData1000.coefficient71_213,
    output := OriginalRow227TriangleData1012.coefficient72_213, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_215, Icur := OriginalRow227TriangleData1000.coefficient71_214,
    output := OriginalRow227TriangleData1012.coefficient72_214, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_216, Icur := OriginalRow227TriangleData1000.coefficient71_215,
    output := OriginalRow227TriangleData1012.coefficient72_215, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_217, Icur := OriginalRow227TriangleData1000.coefficient71_216,
    output := OriginalRow227TriangleData1012.coefficient72_216, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_218, Icur := OriginalRow227TriangleData1000.coefficient71_217,
    output := OriginalRow227TriangleData1012.coefficient72_217, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_219, Icur := OriginalRow227TriangleData1000.coefficient71_218,
    output := OriginalRow227TriangleData1012.coefficient72_218, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_220, Icur := OriginalRow227TriangleData1000.coefficient71_219,
    output := OriginalRow227TriangleData1012.coefficient72_219, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_221, Icur := OriginalRow227TriangleData1000.coefficient71_220,
    output := OriginalRow227TriangleData1012.coefficient72_220, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_222, Icur := OriginalRow227TriangleData1000.coefficient71_221,
    output := OriginalRow227TriangleData1012.coefficient72_221, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_223, Icur := OriginalRow227TriangleData1000.coefficient71_222,
    output := OriginalRow227TriangleData1012.coefficient72_222, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_224, Icur := OriginalRow227TriangleData1000.coefficient71_223,
    output := OriginalRow227TriangleData1012.coefficient72_223, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_225, Icur := OriginalRow227TriangleData1000.coefficient71_224,
    output := OriginalRow227TriangleData1012.coefficient72_224, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_226, Icur := OriginalRow227TriangleData1000.coefficient71_225,
    output := OriginalRow227TriangleData1012.coefficient72_225, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_227, Icur := OriginalRow227TriangleData1000.coefficient71_226,
    output := OriginalRow227TriangleData1012.coefficient72_226, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_228, Icur := OriginalRow227TriangleData1000.coefficient71_227,
    output := OriginalRow227TriangleData1012.coefficient72_227, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1000.coefficient71_229, Icur := OriginalRow227TriangleData1000.coefficient71_228,
    output := OriginalRow227TriangleData1012.coefficient72_228, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1001.coefficient71_230, Icur := OriginalRow227TriangleData1000.coefficient71_229,
    output := OriginalRow227TriangleData1012.coefficient72_229, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots02.root72,
    Inext := OriginalRow227TriangleData1001.coefficient71_231, Icur := OriginalRow227TriangleData1001.coefficient71_230,
    output := OriginalRow227TriangleData1012.coefficient72_230, hC := OriginalRow227TriangleRoots02.root72_pos, hAC := OriginalRow227TriangleRoots02.product72_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0996

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0996.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

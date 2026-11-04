import Grothe.UpperChaos.OriginalRow227TriangleData1024
import Grothe.UpperChaos.OriginalRow227TriangleData1025
import Grothe.UpperChaos.OriginalRow227TriangleData1036
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1020
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_202, Icur := OriginalRow227TriangleData1024.coefficient73_201,
    output := OriginalRow227TriangleData1036.coefficient74_201, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_203, Icur := OriginalRow227TriangleData1024.coefficient73_202,
    output := OriginalRow227TriangleData1036.coefficient74_202, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_204, Icur := OriginalRow227TriangleData1024.coefficient73_203,
    output := OriginalRow227TriangleData1036.coefficient74_203, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_205, Icur := OriginalRow227TriangleData1024.coefficient73_204,
    output := OriginalRow227TriangleData1036.coefficient74_204, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_206, Icur := OriginalRow227TriangleData1024.coefficient73_205,
    output := OriginalRow227TriangleData1036.coefficient74_205, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_207, Icur := OriginalRow227TriangleData1024.coefficient73_206,
    output := OriginalRow227TriangleData1036.coefficient74_206, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_208, Icur := OriginalRow227TriangleData1024.coefficient73_207,
    output := OriginalRow227TriangleData1036.coefficient74_207, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_209, Icur := OriginalRow227TriangleData1024.coefficient73_208,
    output := OriginalRow227TriangleData1036.coefficient74_208, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_210, Icur := OriginalRow227TriangleData1024.coefficient73_209,
    output := OriginalRow227TriangleData1036.coefficient74_209, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_211, Icur := OriginalRow227TriangleData1024.coefficient73_210,
    output := OriginalRow227TriangleData1036.coefficient74_210, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_212, Icur := OriginalRow227TriangleData1024.coefficient73_211,
    output := OriginalRow227TriangleData1036.coefficient74_211, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_213, Icur := OriginalRow227TriangleData1024.coefficient73_212,
    output := OriginalRow227TriangleData1036.coefficient74_212, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_214, Icur := OriginalRow227TriangleData1024.coefficient73_213,
    output := OriginalRow227TriangleData1036.coefficient74_213, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_215, Icur := OriginalRow227TriangleData1024.coefficient73_214,
    output := OriginalRow227TriangleData1036.coefficient74_214, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_216, Icur := OriginalRow227TriangleData1024.coefficient73_215,
    output := OriginalRow227TriangleData1036.coefficient74_215, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_217, Icur := OriginalRow227TriangleData1024.coefficient73_216,
    output := OriginalRow227TriangleData1036.coefficient74_216, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_218, Icur := OriginalRow227TriangleData1024.coefficient73_217,
    output := OriginalRow227TriangleData1036.coefficient74_217, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_219, Icur := OriginalRow227TriangleData1024.coefficient73_218,
    output := OriginalRow227TriangleData1036.coefficient74_218, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_220, Icur := OriginalRow227TriangleData1024.coefficient73_219,
    output := OriginalRow227TriangleData1036.coefficient74_219, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_221, Icur := OriginalRow227TriangleData1024.coefficient73_220,
    output := OriginalRow227TriangleData1036.coefficient74_220, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_222, Icur := OriginalRow227TriangleData1024.coefficient73_221,
    output := OriginalRow227TriangleData1036.coefficient74_221, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_223, Icur := OriginalRow227TriangleData1024.coefficient73_222,
    output := OriginalRow227TriangleData1036.coefficient74_222, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_224, Icur := OriginalRow227TriangleData1024.coefficient73_223,
    output := OriginalRow227TriangleData1036.coefficient74_223, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_225, Icur := OriginalRow227TriangleData1024.coefficient73_224,
    output := OriginalRow227TriangleData1036.coefficient74_224, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_226, Icur := OriginalRow227TriangleData1024.coefficient73_225,
    output := OriginalRow227TriangleData1036.coefficient74_225, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_227, Icur := OriginalRow227TriangleData1024.coefficient73_226,
    output := OriginalRow227TriangleData1036.coefficient74_226, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_228, Icur := OriginalRow227TriangleData1024.coefficient73_227,
    output := OriginalRow227TriangleData1036.coefficient74_227, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_229, Icur := OriginalRow227TriangleData1024.coefficient73_228,
    output := OriginalRow227TriangleData1036.coefficient74_228, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_230, Icur := OriginalRow227TriangleData1024.coefficient73_229,
    output := OriginalRow227TriangleData1036.coefficient74_229, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1024.coefficient73_231, Icur := OriginalRow227TriangleData1024.coefficient73_230,
    output := OriginalRow227TriangleData1036.coefficient74_230, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_232, Icur := OriginalRow227TriangleData1024.coefficient73_231,
    output := OriginalRow227TriangleData1036.coefficient74_231, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots02.root74,
    Inext := OriginalRow227TriangleData1025.coefficient73_233, Icur := OriginalRow227TriangleData1025.coefficient73_232,
    output := OriginalRow227TriangleData1036.coefficient74_232, hC := OriginalRow227TriangleRoots02.root74_pos, hAC := OriginalRow227TriangleRoots02.product74_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1020

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1020.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

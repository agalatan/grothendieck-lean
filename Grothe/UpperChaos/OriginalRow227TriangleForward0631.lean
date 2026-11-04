import Grothe.UpperChaos.OriginalRow227TriangleData0633
import Grothe.UpperChaos.OriginalRow227TriangleData0634
import Grothe.UpperChaos.OriginalRow227TriangleData0647
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0631
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_203, Icur := OriginalRow227TriangleData0633.coefficient42_202,
    output := OriginalRow227TriangleData0647.coefficient43_202, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_204, Icur := OriginalRow227TriangleData0633.coefficient42_203,
    output := OriginalRow227TriangleData0647.coefficient43_203, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_205, Icur := OriginalRow227TriangleData0633.coefficient42_204,
    output := OriginalRow227TriangleData0647.coefficient43_204, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_206, Icur := OriginalRow227TriangleData0633.coefficient42_205,
    output := OriginalRow227TriangleData0647.coefficient43_205, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_207, Icur := OriginalRow227TriangleData0633.coefficient42_206,
    output := OriginalRow227TriangleData0647.coefficient43_206, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_208, Icur := OriginalRow227TriangleData0633.coefficient42_207,
    output := OriginalRow227TriangleData0647.coefficient43_207, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_209, Icur := OriginalRow227TriangleData0633.coefficient42_208,
    output := OriginalRow227TriangleData0647.coefficient43_208, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_210, Icur := OriginalRow227TriangleData0633.coefficient42_209,
    output := OriginalRow227TriangleData0647.coefficient43_209, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_211, Icur := OriginalRow227TriangleData0633.coefficient42_210,
    output := OriginalRow227TriangleData0647.coefficient43_210, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_212, Icur := OriginalRow227TriangleData0633.coefficient42_211,
    output := OriginalRow227TriangleData0647.coefficient43_211, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_213, Icur := OriginalRow227TriangleData0633.coefficient42_212,
    output := OriginalRow227TriangleData0647.coefficient43_212, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_214, Icur := OriginalRow227TriangleData0633.coefficient42_213,
    output := OriginalRow227TriangleData0647.coefficient43_213, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_215, Icur := OriginalRow227TriangleData0633.coefficient42_214,
    output := OriginalRow227TriangleData0647.coefficient43_214, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_216, Icur := OriginalRow227TriangleData0633.coefficient42_215,
    output := OriginalRow227TriangleData0647.coefficient43_215, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_217, Icur := OriginalRow227TriangleData0633.coefficient42_216,
    output := OriginalRow227TriangleData0647.coefficient43_216, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_218, Icur := OriginalRow227TriangleData0633.coefficient42_217,
    output := OriginalRow227TriangleData0647.coefficient43_217, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_219, Icur := OriginalRow227TriangleData0633.coefficient42_218,
    output := OriginalRow227TriangleData0647.coefficient43_218, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_220, Icur := OriginalRow227TriangleData0633.coefficient42_219,
    output := OriginalRow227TriangleData0647.coefficient43_219, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_221, Icur := OriginalRow227TriangleData0633.coefficient42_220,
    output := OriginalRow227TriangleData0647.coefficient43_220, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_222, Icur := OriginalRow227TriangleData0633.coefficient42_221,
    output := OriginalRow227TriangleData0647.coefficient43_221, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_223, Icur := OriginalRow227TriangleData0633.coefficient42_222,
    output := OriginalRow227TriangleData0647.coefficient43_222, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_224, Icur := OriginalRow227TriangleData0633.coefficient42_223,
    output := OriginalRow227TriangleData0647.coefficient43_223, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_225, Icur := OriginalRow227TriangleData0633.coefficient42_224,
    output := OriginalRow227TriangleData0647.coefficient43_224, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_226, Icur := OriginalRow227TriangleData0633.coefficient42_225,
    output := OriginalRow227TriangleData0647.coefficient43_225, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_227, Icur := OriginalRow227TriangleData0633.coefficient42_226,
    output := OriginalRow227TriangleData0647.coefficient43_226, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_228, Icur := OriginalRow227TriangleData0633.coefficient42_227,
    output := OriginalRow227TriangleData0647.coefficient43_227, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_229, Icur := OriginalRow227TriangleData0633.coefficient42_228,
    output := OriginalRow227TriangleData0647.coefficient43_228, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_230, Icur := OriginalRow227TriangleData0633.coefficient42_229,
    output := OriginalRow227TriangleData0647.coefficient43_229, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_231, Icur := OriginalRow227TriangleData0633.coefficient42_230,
    output := OriginalRow227TriangleData0647.coefficient43_230, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0633.coefficient42_232, Icur := OriginalRow227TriangleData0633.coefficient42_231,
    output := OriginalRow227TriangleData0647.coefficient43_231, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0634.coefficient42_233, Icur := OriginalRow227TriangleData0633.coefficient42_232,
    output := OriginalRow227TriangleData0647.coefficient43_232, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots01.root43,
    Inext := OriginalRow227TriangleData0634.coefficient42_234, Icur := OriginalRow227TriangleData0634.coefficient42_233,
    output := OriginalRow227TriangleData0647.coefficient43_233, hC := OriginalRow227TriangleRoots01.root43_pos, hAC := OriginalRow227TriangleRoots01.product43_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0631

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0631.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

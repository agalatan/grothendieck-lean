import Grothe.UpperChaos.OriginalRow227TriangleData1666
import Grothe.UpperChaos.OriginalRow227TriangleData1667
import Grothe.UpperChaos.OriginalRow227TriangleData1673
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleRoots07
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1657
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_205, Icur := OriginalRow227TriangleData1666.coefficient140_204,
    output := OriginalRow227TriangleData1673.coefficient141_204, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_206, Icur := OriginalRow227TriangleData1666.coefficient140_205,
    output := OriginalRow227TriangleData1673.coefficient141_205, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_207, Icur := OriginalRow227TriangleData1666.coefficient140_206,
    output := OriginalRow227TriangleData1673.coefficient141_206, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_208, Icur := OriginalRow227TriangleData1666.coefficient140_207,
    output := OriginalRow227TriangleData1673.coefficient141_207, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_209, Icur := OriginalRow227TriangleData1666.coefficient140_208,
    output := OriginalRow227TriangleData1673.coefficient141_208, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_210, Icur := OriginalRow227TriangleData1666.coefficient140_209,
    output := OriginalRow227TriangleData1673.coefficient141_209, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_211, Icur := OriginalRow227TriangleData1666.coefficient140_210,
    output := OriginalRow227TriangleData1673.coefficient141_210, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_212, Icur := OriginalRow227TriangleData1666.coefficient140_211,
    output := OriginalRow227TriangleData1673.coefficient141_211, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_213, Icur := OriginalRow227TriangleData1666.coefficient140_212,
    output := OriginalRow227TriangleData1673.coefficient141_212, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_214, Icur := OriginalRow227TriangleData1666.coefficient140_213,
    output := OriginalRow227TriangleData1673.coefficient141_213, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_215, Icur := OriginalRow227TriangleData1666.coefficient140_214,
    output := OriginalRow227TriangleData1673.coefficient141_214, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_216, Icur := OriginalRow227TriangleData1666.coefficient140_215,
    output := OriginalRow227TriangleData1673.coefficient141_215, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_217, Icur := OriginalRow227TriangleData1666.coefficient140_216,
    output := OriginalRow227TriangleData1673.coefficient141_216, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_218, Icur := OriginalRow227TriangleData1666.coefficient140_217,
    output := OriginalRow227TriangleData1673.coefficient141_217, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_219, Icur := OriginalRow227TriangleData1666.coefficient140_218,
    output := OriginalRow227TriangleData1673.coefficient141_218, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_220, Icur := OriginalRow227TriangleData1666.coefficient140_219,
    output := OriginalRow227TriangleData1673.coefficient141_219, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_221, Icur := OriginalRow227TriangleData1666.coefficient140_220,
    output := OriginalRow227TriangleData1673.coefficient141_220, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_222, Icur := OriginalRow227TriangleData1666.coefficient140_221,
    output := OriginalRow227TriangleData1673.coefficient141_221, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_223, Icur := OriginalRow227TriangleData1666.coefficient140_222,
    output := OriginalRow227TriangleData1673.coefficient141_222, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_224, Icur := OriginalRow227TriangleData1666.coefficient140_223,
    output := OriginalRow227TriangleData1673.coefficient141_223, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_225, Icur := OriginalRow227TriangleData1666.coefficient140_224,
    output := OriginalRow227TriangleData1673.coefficient141_224, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_226, Icur := OriginalRow227TriangleData1666.coefficient140_225,
    output := OriginalRow227TriangleData1673.coefficient141_225, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_227, Icur := OriginalRow227TriangleData1666.coefficient140_226,
    output := OriginalRow227TriangleData1673.coefficient141_226, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_228, Icur := OriginalRow227TriangleData1666.coefficient140_227,
    output := OriginalRow227TriangleData1673.coefficient141_227, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_229, Icur := OriginalRow227TriangleData1666.coefficient140_228,
    output := OriginalRow227TriangleData1673.coefficient141_228, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_230, Icur := OriginalRow227TriangleData1666.coefficient140_229,
    output := OriginalRow227TriangleData1673.coefficient141_229, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_231, Icur := OriginalRow227TriangleData1666.coefficient140_230,
    output := OriginalRow227TriangleData1673.coefficient141_230, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_232, Icur := OriginalRow227TriangleData1666.coefficient140_231,
    output := OriginalRow227TriangleData1673.coefficient141_231, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_233, Icur := OriginalRow227TriangleData1666.coefficient140_232,
    output := OriginalRow227TriangleData1673.coefficient141_232, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_234, Icur := OriginalRow227TriangleData1666.coefficient140_233,
    output := OriginalRow227TriangleData1673.coefficient141_233, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1667.coefficient140_235, Icur := OriginalRow227TriangleData1666.coefficient140_234,
    output := OriginalRow227TriangleData1673.coefficient141_234, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1667.coefficient140_236, Icur := OriginalRow227TriangleData1667.coefficient140_235,
    output := OriginalRow227TriangleData1673.coefficient141_235, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1657

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1657.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

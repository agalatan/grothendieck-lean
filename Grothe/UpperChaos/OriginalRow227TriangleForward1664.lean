import Grothe.UpperChaos.OriginalRow227TriangleData1673
import Grothe.UpperChaos.OriginalRow227TriangleData1674
import Grothe.UpperChaos.OriginalRow227TriangleData1680
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1664
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_206, Icur := OriginalRow227TriangleData1673.coefficient141_205,
    output := OriginalRow227TriangleData1680.coefficient142_205, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_207, Icur := OriginalRow227TriangleData1673.coefficient141_206,
    output := OriginalRow227TriangleData1680.coefficient142_206, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_208, Icur := OriginalRow227TriangleData1673.coefficient141_207,
    output := OriginalRow227TriangleData1680.coefficient142_207, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_209, Icur := OriginalRow227TriangleData1673.coefficient141_208,
    output := OriginalRow227TriangleData1680.coefficient142_208, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_210, Icur := OriginalRow227TriangleData1673.coefficient141_209,
    output := OriginalRow227TriangleData1680.coefficient142_209, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_211, Icur := OriginalRow227TriangleData1673.coefficient141_210,
    output := OriginalRow227TriangleData1680.coefficient142_210, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_212, Icur := OriginalRow227TriangleData1673.coefficient141_211,
    output := OriginalRow227TriangleData1680.coefficient142_211, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_213, Icur := OriginalRow227TriangleData1673.coefficient141_212,
    output := OriginalRow227TriangleData1680.coefficient142_212, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_214, Icur := OriginalRow227TriangleData1673.coefficient141_213,
    output := OriginalRow227TriangleData1680.coefficient142_213, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_215, Icur := OriginalRow227TriangleData1673.coefficient141_214,
    output := OriginalRow227TriangleData1680.coefficient142_214, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_216, Icur := OriginalRow227TriangleData1673.coefficient141_215,
    output := OriginalRow227TriangleData1680.coefficient142_215, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_217, Icur := OriginalRow227TriangleData1673.coefficient141_216,
    output := OriginalRow227TriangleData1680.coefficient142_216, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_218, Icur := OriginalRow227TriangleData1673.coefficient141_217,
    output := OriginalRow227TriangleData1680.coefficient142_217, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_219, Icur := OriginalRow227TriangleData1673.coefficient141_218,
    output := OriginalRow227TriangleData1680.coefficient142_218, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_220, Icur := OriginalRow227TriangleData1673.coefficient141_219,
    output := OriginalRow227TriangleData1680.coefficient142_219, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_221, Icur := OriginalRow227TriangleData1673.coefficient141_220,
    output := OriginalRow227TriangleData1680.coefficient142_220, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_222, Icur := OriginalRow227TriangleData1673.coefficient141_221,
    output := OriginalRow227TriangleData1680.coefficient142_221, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_223, Icur := OriginalRow227TriangleData1673.coefficient141_222,
    output := OriginalRow227TriangleData1680.coefficient142_222, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_224, Icur := OriginalRow227TriangleData1673.coefficient141_223,
    output := OriginalRow227TriangleData1680.coefficient142_223, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_225, Icur := OriginalRow227TriangleData1673.coefficient141_224,
    output := OriginalRow227TriangleData1680.coefficient142_224, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_226, Icur := OriginalRow227TriangleData1673.coefficient141_225,
    output := OriginalRow227TriangleData1680.coefficient142_225, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_227, Icur := OriginalRow227TriangleData1673.coefficient141_226,
    output := OriginalRow227TriangleData1680.coefficient142_226, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_228, Icur := OriginalRow227TriangleData1673.coefficient141_227,
    output := OriginalRow227TriangleData1680.coefficient142_227, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_229, Icur := OriginalRow227TriangleData1673.coefficient141_228,
    output := OriginalRow227TriangleData1680.coefficient142_228, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_230, Icur := OriginalRow227TriangleData1673.coefficient141_229,
    output := OriginalRow227TriangleData1680.coefficient142_229, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_231, Icur := OriginalRow227TriangleData1673.coefficient141_230,
    output := OriginalRow227TriangleData1680.coefficient142_230, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_232, Icur := OriginalRow227TriangleData1673.coefficient141_231,
    output := OriginalRow227TriangleData1680.coefficient142_231, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_233, Icur := OriginalRow227TriangleData1673.coefficient141_232,
    output := OriginalRow227TriangleData1680.coefficient142_232, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_234, Icur := OriginalRow227TriangleData1673.coefficient141_233,
    output := OriginalRow227TriangleData1680.coefficient142_233, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1673.coefficient141_235, Icur := OriginalRow227TriangleData1673.coefficient141_234,
    output := OriginalRow227TriangleData1680.coefficient142_234, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1674.coefficient141_236, Icur := OriginalRow227TriangleData1673.coefficient141_235,
    output := OriginalRow227TriangleData1680.coefficient142_235, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots04.root142,
    Inext := OriginalRow227TriangleData1674.coefficient141_237, Icur := OriginalRow227TriangleData1674.coefficient141_236,
    output := OriginalRow227TriangleData1680.coefficient142_236, hC := OriginalRow227TriangleRoots04.root142_pos, hAC := OriginalRow227TriangleRoots04.product142_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1664

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1664.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

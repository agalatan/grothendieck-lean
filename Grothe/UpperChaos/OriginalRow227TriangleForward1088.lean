import Grothe.UpperChaos.OriginalRow227TriangleData1093
import Grothe.UpperChaos.OriginalRow227TriangleData1094
import Grothe.UpperChaos.OriginalRow227TriangleData1104
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1088
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_208, Icur := OriginalRow227TriangleData1093.coefficient79_207,
    output := OriginalRow227TriangleData1104.coefficient80_207, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_209, Icur := OriginalRow227TriangleData1093.coefficient79_208,
    output := OriginalRow227TriangleData1104.coefficient80_208, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_210, Icur := OriginalRow227TriangleData1093.coefficient79_209,
    output := OriginalRow227TriangleData1104.coefficient80_209, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_211, Icur := OriginalRow227TriangleData1093.coefficient79_210,
    output := OriginalRow227TriangleData1104.coefficient80_210, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_212, Icur := OriginalRow227TriangleData1093.coefficient79_211,
    output := OriginalRow227TriangleData1104.coefficient80_211, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_213, Icur := OriginalRow227TriangleData1093.coefficient79_212,
    output := OriginalRow227TriangleData1104.coefficient80_212, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_214, Icur := OriginalRow227TriangleData1093.coefficient79_213,
    output := OriginalRow227TriangleData1104.coefficient80_213, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_215, Icur := OriginalRow227TriangleData1093.coefficient79_214,
    output := OriginalRow227TriangleData1104.coefficient80_214, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_216, Icur := OriginalRow227TriangleData1093.coefficient79_215,
    output := OriginalRow227TriangleData1104.coefficient80_215, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_217, Icur := OriginalRow227TriangleData1093.coefficient79_216,
    output := OriginalRow227TriangleData1104.coefficient80_216, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_218, Icur := OriginalRow227TriangleData1093.coefficient79_217,
    output := OriginalRow227TriangleData1104.coefficient80_217, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_219, Icur := OriginalRow227TriangleData1093.coefficient79_218,
    output := OriginalRow227TriangleData1104.coefficient80_218, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_220, Icur := OriginalRow227TriangleData1093.coefficient79_219,
    output := OriginalRow227TriangleData1104.coefficient80_219, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_221, Icur := OriginalRow227TriangleData1093.coefficient79_220,
    output := OriginalRow227TriangleData1104.coefficient80_220, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_222, Icur := OriginalRow227TriangleData1093.coefficient79_221,
    output := OriginalRow227TriangleData1104.coefficient80_221, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_223, Icur := OriginalRow227TriangleData1093.coefficient79_222,
    output := OriginalRow227TriangleData1104.coefficient80_222, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_224, Icur := OriginalRow227TriangleData1093.coefficient79_223,
    output := OriginalRow227TriangleData1104.coefficient80_223, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_225, Icur := OriginalRow227TriangleData1093.coefficient79_224,
    output := OriginalRow227TriangleData1104.coefficient80_224, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_226, Icur := OriginalRow227TriangleData1093.coefficient79_225,
    output := OriginalRow227TriangleData1104.coefficient80_225, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_227, Icur := OriginalRow227TriangleData1093.coefficient79_226,
    output := OriginalRow227TriangleData1104.coefficient80_226, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_228, Icur := OriginalRow227TriangleData1093.coefficient79_227,
    output := OriginalRow227TriangleData1104.coefficient80_227, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_229, Icur := OriginalRow227TriangleData1093.coefficient79_228,
    output := OriginalRow227TriangleData1104.coefficient80_228, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_230, Icur := OriginalRow227TriangleData1093.coefficient79_229,
    output := OriginalRow227TriangleData1104.coefficient80_229, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_231, Icur := OriginalRow227TriangleData1093.coefficient79_230,
    output := OriginalRow227TriangleData1104.coefficient80_230, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_232, Icur := OriginalRow227TriangleData1093.coefficient79_231,
    output := OriginalRow227TriangleData1104.coefficient80_231, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_233, Icur := OriginalRow227TriangleData1093.coefficient79_232,
    output := OriginalRow227TriangleData1104.coefficient80_232, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_234, Icur := OriginalRow227TriangleData1093.coefficient79_233,
    output := OriginalRow227TriangleData1104.coefficient80_233, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_235, Icur := OriginalRow227TriangleData1093.coefficient79_234,
    output := OriginalRow227TriangleData1104.coefficient80_234, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_236, Icur := OriginalRow227TriangleData1093.coefficient79_235,
    output := OriginalRow227TriangleData1104.coefficient80_235, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1093.coefficient79_237, Icur := OriginalRow227TriangleData1093.coefficient79_236,
    output := OriginalRow227TriangleData1104.coefficient80_236, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1094.coefficient79_238, Icur := OriginalRow227TriangleData1093.coefficient79_237,
    output := OriginalRow227TriangleData1104.coefficient80_237, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots02.root80,
    Inext := OriginalRow227TriangleData1094.coefficient79_239, Icur := OriginalRow227TriangleData1094.coefficient79_238,
    output := OriginalRow227TriangleData1104.coefficient80_238, hC := OriginalRow227TriangleRoots02.root80_pos, hAC := OriginalRow227TriangleRoots02.product80_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1088

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1088.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

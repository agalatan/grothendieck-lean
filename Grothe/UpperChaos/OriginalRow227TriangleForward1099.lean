import Grothe.UpperChaos.OriginalRow227TriangleData1104
import Grothe.UpperChaos.OriginalRow227TriangleData1105
import Grothe.UpperChaos.OriginalRow227TriangleData1115
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1099
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_209, Icur := OriginalRow227TriangleData1104.coefficient80_208,
    output := OriginalRow227TriangleData1115.coefficient81_208, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_210, Icur := OriginalRow227TriangleData1104.coefficient80_209,
    output := OriginalRow227TriangleData1115.coefficient81_209, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_211, Icur := OriginalRow227TriangleData1104.coefficient80_210,
    output := OriginalRow227TriangleData1115.coefficient81_210, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_212, Icur := OriginalRow227TriangleData1104.coefficient80_211,
    output := OriginalRow227TriangleData1115.coefficient81_211, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_213, Icur := OriginalRow227TriangleData1104.coefficient80_212,
    output := OriginalRow227TriangleData1115.coefficient81_212, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_214, Icur := OriginalRow227TriangleData1104.coefficient80_213,
    output := OriginalRow227TriangleData1115.coefficient81_213, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_215, Icur := OriginalRow227TriangleData1104.coefficient80_214,
    output := OriginalRow227TriangleData1115.coefficient81_214, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_216, Icur := OriginalRow227TriangleData1104.coefficient80_215,
    output := OriginalRow227TriangleData1115.coefficient81_215, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_217, Icur := OriginalRow227TriangleData1104.coefficient80_216,
    output := OriginalRow227TriangleData1115.coefficient81_216, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_218, Icur := OriginalRow227TriangleData1104.coefficient80_217,
    output := OriginalRow227TriangleData1115.coefficient81_217, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_219, Icur := OriginalRow227TriangleData1104.coefficient80_218,
    output := OriginalRow227TriangleData1115.coefficient81_218, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_220, Icur := OriginalRow227TriangleData1104.coefficient80_219,
    output := OriginalRow227TriangleData1115.coefficient81_219, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_221, Icur := OriginalRow227TriangleData1104.coefficient80_220,
    output := OriginalRow227TriangleData1115.coefficient81_220, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_222, Icur := OriginalRow227TriangleData1104.coefficient80_221,
    output := OriginalRow227TriangleData1115.coefficient81_221, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_223, Icur := OriginalRow227TriangleData1104.coefficient80_222,
    output := OriginalRow227TriangleData1115.coefficient81_222, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_224, Icur := OriginalRow227TriangleData1104.coefficient80_223,
    output := OriginalRow227TriangleData1115.coefficient81_223, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_225, Icur := OriginalRow227TriangleData1104.coefficient80_224,
    output := OriginalRow227TriangleData1115.coefficient81_224, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_226, Icur := OriginalRow227TriangleData1104.coefficient80_225,
    output := OriginalRow227TriangleData1115.coefficient81_225, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_227, Icur := OriginalRow227TriangleData1104.coefficient80_226,
    output := OriginalRow227TriangleData1115.coefficient81_226, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_228, Icur := OriginalRow227TriangleData1104.coefficient80_227,
    output := OriginalRow227TriangleData1115.coefficient81_227, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_229, Icur := OriginalRow227TriangleData1104.coefficient80_228,
    output := OriginalRow227TriangleData1115.coefficient81_228, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_230, Icur := OriginalRow227TriangleData1104.coefficient80_229,
    output := OriginalRow227TriangleData1115.coefficient81_229, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_231, Icur := OriginalRow227TriangleData1104.coefficient80_230,
    output := OriginalRow227TriangleData1115.coefficient81_230, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_232, Icur := OriginalRow227TriangleData1104.coefficient80_231,
    output := OriginalRow227TriangleData1115.coefficient81_231, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_233, Icur := OriginalRow227TriangleData1104.coefficient80_232,
    output := OriginalRow227TriangleData1115.coefficient81_232, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_234, Icur := OriginalRow227TriangleData1104.coefficient80_233,
    output := OriginalRow227TriangleData1115.coefficient81_233, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_235, Icur := OriginalRow227TriangleData1104.coefficient80_234,
    output := OriginalRow227TriangleData1115.coefficient81_234, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots07.root236, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_236, Icur := OriginalRow227TriangleData1104.coefficient80_235,
    output := OriginalRow227TriangleData1115.coefficient81_235, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root237, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_237, Icur := OriginalRow227TriangleData1104.coefficient80_236,
    output := OriginalRow227TriangleData1115.coefficient81_236, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root238, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1104.coefficient80_238, Icur := OriginalRow227TriangleData1104.coefficient80_237,
    output := OriginalRow227TriangleData1115.coefficient81_237, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots07.root239, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1105.coefficient80_239, Icur := OriginalRow227TriangleData1104.coefficient80_238,
    output := OriginalRow227TriangleData1115.coefficient81_238, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots07.root240, IC := OriginalRow227TriangleRoots02.root81,
    Inext := OriginalRow227TriangleData1105.coefficient80_240, Icur := OriginalRow227TriangleData1105.coefficient80_239,
    output := OriginalRow227TriangleData1115.coefficient81_239, hC := OriginalRow227TriangleRoots02.root81_pos, hAC := OriginalRow227TriangleRoots02.product81_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1099

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1099.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"

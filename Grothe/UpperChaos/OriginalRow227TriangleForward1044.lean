import Grothe.UpperChaos.OriginalRow227TriangleData1048
import Grothe.UpperChaos.OriginalRow227TriangleData1049
import Grothe.UpperChaos.OriginalRow227TriangleData1060
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1044
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_204, Icur := OriginalRow227TriangleData1048.coefficient75_203,
    output := OriginalRow227TriangleData1060.coefficient76_203, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_205, Icur := OriginalRow227TriangleData1048.coefficient75_204,
    output := OriginalRow227TriangleData1060.coefficient76_204, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_206, Icur := OriginalRow227TriangleData1048.coefficient75_205,
    output := OriginalRow227TriangleData1060.coefficient76_205, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_207, Icur := OriginalRow227TriangleData1048.coefficient75_206,
    output := OriginalRow227TriangleData1060.coefficient76_206, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_208, Icur := OriginalRow227TriangleData1048.coefficient75_207,
    output := OriginalRow227TriangleData1060.coefficient76_207, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_209, Icur := OriginalRow227TriangleData1048.coefficient75_208,
    output := OriginalRow227TriangleData1060.coefficient76_208, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_210, Icur := OriginalRow227TriangleData1048.coefficient75_209,
    output := OriginalRow227TriangleData1060.coefficient76_209, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_211, Icur := OriginalRow227TriangleData1048.coefficient75_210,
    output := OriginalRow227TriangleData1060.coefficient76_210, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_212, Icur := OriginalRow227TriangleData1048.coefficient75_211,
    output := OriginalRow227TriangleData1060.coefficient76_211, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_213, Icur := OriginalRow227TriangleData1048.coefficient75_212,
    output := OriginalRow227TriangleData1060.coefficient76_212, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_214, Icur := OriginalRow227TriangleData1048.coefficient75_213,
    output := OriginalRow227TriangleData1060.coefficient76_213, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_215, Icur := OriginalRow227TriangleData1048.coefficient75_214,
    output := OriginalRow227TriangleData1060.coefficient76_214, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_216, Icur := OriginalRow227TriangleData1048.coefficient75_215,
    output := OriginalRow227TriangleData1060.coefficient76_215, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_217, Icur := OriginalRow227TriangleData1048.coefficient75_216,
    output := OriginalRow227TriangleData1060.coefficient76_216, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_218, Icur := OriginalRow227TriangleData1048.coefficient75_217,
    output := OriginalRow227TriangleData1060.coefficient76_217, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_219, Icur := OriginalRow227TriangleData1048.coefficient75_218,
    output := OriginalRow227TriangleData1060.coefficient76_218, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots06.root220, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_220, Icur := OriginalRow227TriangleData1048.coefficient75_219,
    output := OriginalRow227TriangleData1060.coefficient76_219, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots06.root221, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_221, Icur := OriginalRow227TriangleData1048.coefficient75_220,
    output := OriginalRow227TriangleData1060.coefficient76_220, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots06.root222, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_222, Icur := OriginalRow227TriangleData1048.coefficient75_221,
    output := OriginalRow227TriangleData1060.coefficient76_221, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots06.root223, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_223, Icur := OriginalRow227TriangleData1048.coefficient75_222,
    output := OriginalRow227TriangleData1060.coefficient76_222, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots06.root224, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_224, Icur := OriginalRow227TriangleData1048.coefficient75_223,
    output := OriginalRow227TriangleData1060.coefficient76_223, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots07.root225, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_225, Icur := OriginalRow227TriangleData1048.coefficient75_224,
    output := OriginalRow227TriangleData1060.coefficient76_224, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots07.root226, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_226, Icur := OriginalRow227TriangleData1048.coefficient75_225,
    output := OriginalRow227TriangleData1060.coefficient76_225, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots07.root227, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_227, Icur := OriginalRow227TriangleData1048.coefficient75_226,
    output := OriginalRow227TriangleData1060.coefficient76_226, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots07.root228, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_228, Icur := OriginalRow227TriangleData1048.coefficient75_227,
    output := OriginalRow227TriangleData1060.coefficient76_227, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots07.root229, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_229, Icur := OriginalRow227TriangleData1048.coefficient75_228,
    output := OriginalRow227TriangleData1060.coefficient76_228, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots07.root230, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_230, Icur := OriginalRow227TriangleData1048.coefficient75_229,
    output := OriginalRow227TriangleData1060.coefficient76_229, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots07.root231, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_231, Icur := OriginalRow227TriangleData1048.coefficient75_230,
    output := OriginalRow227TriangleData1060.coefficient76_230, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots07.root232, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_232, Icur := OriginalRow227TriangleData1048.coefficient75_231,
    output := OriginalRow227TriangleData1060.coefficient76_231, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots07.root233, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1048.coefficient75_233, Icur := OriginalRow227TriangleData1048.coefficient75_232,
    output := OriginalRow227TriangleData1060.coefficient76_232, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots07.root234, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1049.coefficient75_234, Icur := OriginalRow227TriangleData1048.coefficient75_233,
    output := OriginalRow227TriangleData1060.coefficient76_233, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots07.root235, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1049.coefficient75_235, Icur := OriginalRow227TriangleData1049.coefficient75_234,
    output := OriginalRow227TriangleData1060.coefficient76_234, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1044

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1044.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
